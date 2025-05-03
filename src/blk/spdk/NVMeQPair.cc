#include "NVMeQPair.h"
#include "NVMeLog.h"

#include <vector>

SpinLock::SpinLock() : flag_(false) {}

void SpinLock::Lock()
{
    bool expected = false;
    while (!flag_.compare_exchange_strong(expected, true, std::memory_order_acquire))
    {
        expected = false; // 重置预期值
    }
}

void SpinLock::Unlock()
{
    flag_.store(false, std::memory_order_release);
}

SPDK_NVME_SQ::SPDK_NVME_SQ(uint16_t length, std::condition_variable *cv) : length(length), head(0), tail(0), curr_depth(0), cv(cv)
{
    length++;
    sq = new SPDK_NVME_QPAIR_SQL[length];
    memset(sq, 0, sizeof(SPDK_NVME_QPAIR_SQL) * length);
}

int SPDK_NVME_SQ::submit_cmd_readv(struct spdk_nvme_ns *ns,
                                   uint64_t lba, uint32_t lba_count,
                                   spdk_nvme_cmd_cb cb_fn, void *cb_arg, uint32_t io_flags,
                                   spdk_nvme_req_reset_sgl_cb reset_sgl_fn,
                                   spdk_nvme_req_next_sge_cb next_sge_fn)
{
    SPDK_NVME_QPAIR_SQL *sql = sq + tail;
    if (sql->is_valid)
    {
        return -1; // 队列已满
    }
    sql->cmd = IOCommand::READ_COMMAND;
    sql->ns = ns;
    sql->lba = lba;
    sql->lba_count = lba_count;
    sql->cb_fn = cb_fn;
    sql->cb_arg = cb_arg;
    sql->io_flags = io_flags;
    sql->is_valid = 1;
    cv->notify_one(); // 通知等待的线程
    tail = (tail + 1) % length;
    return 0;
}

int SPDK_NVME_SQ::submit_cmd_writev(struct spdk_nvme_ns *ns,
                                    uint64_t lba, uint32_t lba_count,
                                    spdk_nvme_cmd_cb cb_fn, void *cb_arg, uint32_t io_flags,
                                    spdk_nvme_req_reset_sgl_cb reset_sgl_fn,
                                    spdk_nvme_req_next_sge_cb next_sge_fn)
{
    SPDK_NVME_QPAIR_SQL *sql = sq + tail;
    if (sql->is_valid)
    {
        return -1; // 队列已满
    }
    sql->cmd = IOCommand::WRITE_COMMAND;
    sql->ns = ns;
    sql->lba = lba;
    sql->lba_count = lba_count;
    sql->cb_fn = cb_fn;
    sql->cb_arg = cb_arg;
    sql->io_flags = io_flags;
    sql->is_valid = 1;
    cv->notify_one(); // 通知等待的线程
    tail = (tail + 1) % length;
    return 0;
}

int SPDK_NVME_SQ::submit_cmd_flush(struct spdk_nvme_ns *ns,
                                   spdk_nvme_cmd_cb cb_fn, void *cb_arg)
{
    SPDK_NVME_QPAIR_SQL *sql = sq + tail;
    if (sql->is_valid)
    {
        return -1; // 队列已满
    }
    sql->cmd = IOCommand::FLUSH_COMMAND;
    sql->ns = ns;
    sql->cb_fn = cb_fn;
    sql->cb_arg = cb_arg;
    sql->is_valid = 1;
    cv->notify_one(); // 通知等待的线程
    tail = (tail + 1) % length;
    return 0;
}

SPDK_NVME_QPAIR::SPDK_NVME_QPAIR(uint16_t max_depth, spdk_nvme_req_reset_sgl_cb data_buf_reset_sgl, spdk_nvme_req_next_sge_cb data_buf_next_sge, spdk_nvme_cmd_cb io_complete) : max_queue_depth(max_depth), exit_flag(false), current_queue_depth(0),
                                                                                                                                                                                 data_buf_reset_sgl(data_buf_reset_sgl), data_buf_next_sge(data_buf_next_sge), io_complete(io_complete), ctrlr(NULL), ns(NULL) {}

SPDK_NVME_QPAIR::~SPDK_NVME_QPAIR()
{
    debugLog("~SPDK_NVME_QPAIR destructor\n");
    exit_flag = true;
    if (qpair_thread.joinable())
    {
        qpair_thread.join();
    }
    else
    {
        errorLog("qpair_thread not joinable\n");
    }
    debugLog("~SPDK_NVME_QPAIR destructor end\n");
}

void SPDK_NVME_QPAIR::start_thread(NVMEDevice *bdev, struct spdk_nvme_ctrlr *t_ctrlr, struct spdk_nvme_ns *t_ns, uint32_t t_block_size)
{
    if (qpair_thread.joinable())
    {
        std::cout << "Thread already running" << std::endl;
        ceph_abort();
    }
    ctrlr = t_ctrlr;
    ns = t_ns;
    block_size = t_block_size;
    memset(sq_list, 0, sizeof(sq_list));
    qpair_thread = std::thread([this]()
                               {

            struct spdk_nvme_io_qpair_opts opts = {};
            spdk_nvme_ctrlr_get_default_io_qpair_opts(this->ctrlr, &opts, sizeof(opts));
            opts.qprio = SPDK_NVME_QPRIO_URGENT;
            // usable queue depth should minus 1 to aovid overflow.
            this->max_queue_depth = opts.io_queue_size - 1;
            // qpair = spdk_nvme_ctrlr_alloc_io_qpair(ctrlr, &opts, sizeof(opts));
            int rc;
            this->qpair = spdk_plus_nvme_ctrlr_alloc_io_device(ctrlr, &opts, sizeof(opts), &rc);
            if (this->qpair == NULL)
            {
            // derr << __func__ << " failed to create io qpair rc = " << rc << dendl;
            }
            ceph_assert(this->qpair != NULL);

            uint32_t max_io_completion = (uint32_t)g_conf().get_val<uint64_t>("bluestore_spdk_max_io_completion");

            {
                std::unique_lock<std::mutex> lock(mutex);
                cv.notify_all();
            }

            // 轮询队列完成
            while(!exit_flag) {
                if(current_queue_depth > 0) {
                    int r = spdk_plus_nvme_process_completions(this->qpair, max_io_completion);
                    if (r < 0){
                        ceph_abort();
                    } else if (r > 0){
                        current_queue_depth -= r;
                    }
                    submit_io();
                } else {
                    if(submit_io() == false) {
                        std::unique_lock<std::mutex> lock(mutex);
                        cv.wait_for(lock, std::chrono::milliseconds(100));
                    }
                }
            }

            spdk_plus_nvme_ctrlr_free_io_qpair(this->qpair);
            this->qpair = NULL;
            
            infoLog("Thread exiting"); });

    {
        std::unique_lock<std::mutex> lock(mutex);
        cv.wait(lock);
    }
}

bool SPDK_NVME_QPAIR::submit_io_internel(SPDK_NVME_SQ *sq)
{
    if (sq == nullptr)
    {
        return false;
    }
    SPDK_NVME_QPAIR_SQL *sql = sq->sq + sq->head;
    if (sql->is_valid)
    {
        // 提交IO命令
        // 这里可以调用SPDK的提交函数
        int r = 0;
        switch (sql->cmd)
        {
        case IOCommand::WRITE_COMMAND:
        {

            r = spdk_plus_nvme_ns_cmd_writev(sql->ns, qpair, sql->lba, sql->lba_count, sql->cb_fn, sql->cb_arg, 0,
                                             data_buf_reset_sgl, data_buf_next_sge);
            if (r < 0)
            {
                // derr << __func__ << " failed to do write command: " << cpp_strerror(r) << dendl;
                // t->ctx->nvme_task_first = t->ctx->nvme_task_last = nullptr;
                // t->release_segs(this);
                // delete t;
                ceph_abort();
            }
            break;
        }
        case IOCommand::READ_COMMAND:
        {
            r = spdk_plus_nvme_ns_cmd_readv(sql->ns, qpair, sql->lba, sql->lba_count, sql->cb_fn, sql->cb_arg, 0,
                                            data_buf_reset_sgl, data_buf_next_sge);
            if (r < 0)
            {
                // derr << __func__ << " failed to read: " << cpp_strerror(r) << dendl;
                // t->release_segs(this);
                // delete t;
                ceph_abort();
            }
            break;
        }
        case IOCommand::FLUSH_COMMAND:
        {
            // dout(20) << __func__ << " flush command issueed " << dendl;
            // r = spdk_nvme_ns_cmd_flush(ns, qpair, io_complete, t);
            r = spdk_plus_nvme_ns_cmd_flush(sql->ns, qpair, sql->cb_fn, sql->cb_arg);
            if (r < 0)
            {
                // derr << __func__ << " failed to flush: " << cpp_strerror(r) << dendl;
                // t->release_segs(this);
                // delete t;
                ceph_abort();
            }
            break;
        }
        }
        // 更新队列头指针
        sq->head = (sq->head + 1) % sq->length;
        memset(sql, 0, sizeof(SPDK_NVME_QPAIR_SQL));
        current_queue_depth++;
        return true;
    }
    else
    {
        return false;
    }
}

bool SPDK_NVME_QPAIR::submit_io()
{
    bool no_cmd = false;
    bool send_cmd = false;
    while (current_queue_depth < max_queue_depth / 2 && !no_cmd)
    {
        no_cmd = !submit_io_internel(sq_list[0]) && !submit_io_internel(sq_list[1]) && !submit_io_internel(sq_list[2]) && !submit_io_internel(sq_list[3]);
        if (!no_cmd)
        {
            send_cmd = true;
        }
    }
    return send_cmd;
}

struct SPDK_NVME_SQ *SPDK_NVME_QPAIR::alloc_io_pair()
{
    bool free_hole = false;
    for (int i = 0; i < 4; i++)
    {
        if (!sq_list[i])
        {
            free_hole = true;
            break;
        }
    }
    if (!free_hole)
    {
        errorLog("No free IO pair available");
        return nullptr;
    }
    SPDK_NVME_SQ *sq = new SPDK_NVME_SQ(max_queue_depth, &cv);
    if (!sq)
    {
        errorLog("Failed to allocate memory for SPDK_NVME_SQ");
        return nullptr;
    }
    for (int i = 0; i < 4; i++)
    {
        if (sq_list[i] == nullptr)
        {
            sq_list[i] = sq;
            break;
        }
    }
    return sq;
}

bool SPDK_NVME_QPAIR::has_free_io_pair()
{
    for (int i = 0; i < 4; i++)
    {
        if (!sq_list[i])
        {
            return true;
        }
    }
    return false;
}

bool SPDK_NVME_QPAIR::has_io_pair(SPDK_NVME_SQ *sq)
{
    for (int i = 0; i < 4; i++)
    {
        if (sq_list[i] == sq)
        {
            return true;
        }
    }
    return false;
}

void SPDK_NVME_QPAIR::free_io_pair(SPDK_NVME_SQ *sq)
{
    bool is_find = false;
    for (int i = 0; i < 4; i++)
    {
        if (sq_list[i] == sq)
        {
            sq_list[i] = nullptr;
            delete sq;
            is_find = true;
            break;
        }
    }
    if (!is_find)
    {
        errorLog("Invalid SPDK_NVME_SQ pointer");
        return;
    }
}

SPDK_NVME_QPAIR_MANAGER::SPDK_NVME_QPAIR_MANAGER(uint16_t max_depth) : max_depth(max_depth) {}
SPDK_NVME_QPAIR_MANAGER::~SPDK_NVME_QPAIR_MANAGER()
{
    debugLog("~SPDK_NVME_QPAIR_MANAGER destructor\n");
    for (auto qpair : qpair_list)
    {
        delete qpair;
        qpair = nullptr;
    }
    debugLog("~SPDK_NVME_QPAIR_MANAGER destructor end\n");
}

SPDK_NVME_SQ *SPDK_NVME_QPAIR_MANAGER::create_qpair(NVMEDevice *bdev, struct spdk_nvme_ctrlr *ctrlr, struct spdk_nvme_ns *ns, uint32_t block_size, spdk_nvme_req_reset_sgl_cb data_buf_reset_sgl, spdk_nvme_req_next_sge_cb data_buf_next_sge, spdk_nvme_cmd_cb io_complete)
{
    std::lock_guard<std::mutex> lock(qpair_mutex);
    SPDK_NVME_QPAIR *qpair = nullptr;
    for (auto pair : qpair_list)
    {
        if (pair->ctrlr == ctrlr && pair->ns == ns && pair->has_free_io_pair())
        {
            qpair = pair;
            break;
        }
    }
    if (qpair == nullptr)
    {
        qpair = new SPDK_NVME_QPAIR(max_depth, data_buf_reset_sgl, data_buf_next_sge, io_complete);
        qpair_list.push_back(qpair);
        qpair->start_thread(bdev, ctrlr, ns, block_size);
    }
    SPDK_NVME_SQ *sq = qpair->alloc_io_pair();
    return sq;
}

void SPDK_NVME_QPAIR_MANAGER::free_qpair(SPDK_NVME_SQ *sq)
{
    std::lock_guard<std::mutex> lock(qpair_mutex);
    for (auto qpair : qpair_list)
    {
        if (qpair->has_io_pair(sq))
        {
            qpair->free_io_pair(sq);
            return;
        }
    }
    errorLog("Invalid SPDK_NVME_SQ pointer");
    return;
}
