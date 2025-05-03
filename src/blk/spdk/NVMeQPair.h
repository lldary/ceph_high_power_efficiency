#pragma once
#include <stdint.h>
#include <thread>
#include <atomic>
#include <spdk/nvme.h>
#include <spdk/smart_nvme.h>
#include "NVMEDevice.h"

class SpinLock
{
public:
    SpinLock();

    void Lock();

    void Unlock();

private:
    std::atomic<bool> flag_;
};

struct SPDK_NVME_QPAIR_SQL
{
    uint32_t is_valid;
    enum IOCommand cmd;
    struct spdk_nvme_ns *ns;
    void *buffer;
    uint64_t lba;
    uint32_t lba_count;
    uint32_t io_flags;
    spdk_nvme_cmd_cb cb_fn;
    void *cb_arg;
};

struct SPDK_NVME_SQ
{
    uint16_t length;
    uint16_t head;
    uint16_t tail;
    std::atomic_uint16_t curr_depth; // 当前深度
    std::condition_variable *cv;
    SPDK_NVME_QPAIR_SQL *sq; // 指向命令队列的指针
    std::mutex sq_mutex;
    std::condition_variable sq_cv;

    SPDK_NVME_SQ(uint16_t length, std::condition_variable *cv);

    int submit_cmd_readv(struct spdk_nvme_ns *ns,
                         uint64_t lba, uint32_t lba_count,
                         spdk_nvme_cmd_cb cb_fn, void *cb_arg, uint32_t io_flags,
                         spdk_nvme_req_reset_sgl_cb reset_sgl_fn,
                         spdk_nvme_req_next_sge_cb next_sge_fn);

    int submit_cmd_writev(struct spdk_nvme_ns *ns,
                          uint64_t lba, uint32_t lba_count,
                          spdk_nvme_cmd_cb cb_fn, void *cb_arg, uint32_t io_flags,
                          spdk_nvme_req_reset_sgl_cb reset_sgl_fn,
                          spdk_nvme_req_next_sge_cb next_sge_fn);

    int submit_cmd_flush(struct spdk_nvme_ns *ns,
                         spdk_nvme_cmd_cb cb_fn, void *cb_arg);
};

class SPDK_NVME_QPAIR
{
    uint16_t max_queue_depth;
    bool exit_flag;
    SPDK_NVME_SQ *sq_list[4];
    std::thread qpair_thread;
    std::atomic_uint64_t current_queue_depth;
    spdk_nvme_req_reset_sgl_cb data_buf_reset_sgl;
    spdk_nvme_req_next_sge_cb data_buf_next_sge;
    spdk_nvme_cmd_cb io_complete;
    struct spdk_plus_smart_nvme *qpair;
    uint32_t block_size;

public:
    struct spdk_nvme_ctrlr *ctrlr;
    struct spdk_nvme_ns *ns;
    std::mutex mutex;
    std::condition_variable cv;

    SPDK_NVME_QPAIR(uint16_t max_depth, spdk_nvme_req_reset_sgl_cb data_buf_reset_sgl, spdk_nvme_req_next_sge_cb data_buf_next_sge, spdk_nvme_cmd_cb io_complete);

    ~SPDK_NVME_QPAIR();

    void start_thread(NVMEDevice *bdev, struct spdk_nvme_ctrlr *t_ctrlr, struct spdk_nvme_ns *t_ns, uint32_t t_block_size);

    bool submit_io_internel(SPDK_NVME_SQ *sq);

    bool submit_io();

    struct SPDK_NVME_SQ *alloc_io_pair();

    bool has_free_io_pair();

    bool has_io_pair(SPDK_NVME_SQ *sq);

    void free_io_pair(SPDK_NVME_SQ *sq);
};

class SPDK_NVME_QPAIR_MANAGER
{
    uint16_t max_depth;
    std::vector<SPDK_NVME_QPAIR *> qpair_list;
    std::mutex qpair_mutex;

public:
    SPDK_NVME_QPAIR_MANAGER(uint16_t max_depth);
    ~SPDK_NVME_QPAIR_MANAGER();

    SPDK_NVME_SQ *create_qpair(NVMEDevice *bdev, struct spdk_nvme_ctrlr *ctrlr, struct spdk_nvme_ns *ns, uint32_t block_size, spdk_nvme_req_reset_sgl_cb data_buf_reset_sgl, spdk_nvme_req_next_sge_cb data_buf_next_sge, spdk_nvme_cmd_cb io_complete);

    void free_qpair(SPDK_NVME_SQ *sq);
};