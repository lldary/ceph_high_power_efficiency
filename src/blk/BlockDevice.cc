// -*- mode:C++; tab-width:8; c-basic-offset:2; indent-tabs-mode:t -*-
// vim: ts=8 sw=2 smarttab
/*
 * Ceph - scalable distributed file system
 *
 * Copyright (C) 2015 XSky <haomai@xsky.com>
 *
 * Author: Haomai Wang <haomaiwang@gmail.com>
 *
 * This is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1, as published by the Free Software
 * Foundation.  See file COPYING.
 *
 */

#include <libgen.h>
#include <unistd.h>

#include "BlockDevice.h"

#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
#include "kernel/KernelDevice.h"
#endif

#if defined(HAVE_SPDK)
#include "spdk/NVMEDevice.h"
#endif

#if defined(HAVE_BLUESTORE_PMEM)
#include "pmem/PMEMDevice.h"
#endif

#if defined(HAVE_LIBZBD)
#include "zoned/HMSMRDevice.h"
#endif

#include "common/debug.h"
#include "common/EventTrace.h"
#include "common/errno.h"
#include "include/compat.h"

#define dout_context cct
#define dout_subsys ceph_subsys_bdev
#undef dout_prefix
#define dout_prefix *_dout << "bdev "

using ceph::mono_clock;
using std::string;

blk_access_mode_t buffermode(bool buffered)
{
  return buffered ? blk_access_mode_t::BUFFERED : blk_access_mode_t::DIRECT;
}

std::ostream &operator<<(std::ostream &os, const blk_access_mode_t buffered)
{
  os << (buffered == blk_access_mode_t::BUFFERED ? "(buffered)" : "(direct)");
  return os;
}
// #include <fstream>
// #include <chrono>
// #include <iomanip>
void IOContext::aio_wait()
{
  std::unique_lock l(lock);
  // see _aio_thread for waker logic
  while (num_running.load() > 0)
  {
    dout(10) << __func__ << " " << this
             << " waiting for " << num_running.load() << " aios to complete"
             << dendl;
    cond.wait(l);
    // if (cond.wait_for(l, std::chrono::seconds(100)) == std::cv_status::timeout)
    // {
    //   // 文件名
    //   std::string filename = "/home/led/workspace/ceph-error.log";

    //   // 创建一个 ofstream 对象
    //   std::ofstream outFile;

    //   // 打开文件
    //   outFile.open(filename, std::ios::out | std::ios::trunc);

    //   // 检查文件是否成功打开
    //   if (!outFile.is_open())
    //   {
    //     std::cerr << "无法打开文件: " << filename << std::endl;
    //     continue;
    //   }
    //   // 获取当前时间
    //   auto now = std::chrono::system_clock::now();
    //   // 转换为时间点
    //   std::time_t now_c = std::chrono::system_clock::to_time_t(now);
    //   // 转换为本地时间
    //   std::tm *now_tm = std::localtime(&now_c);

    //   outFile << std::put_time(now_tm, "%Y-%m-%d %H:%M:%S") << ':' << __func__ << " TID: " << syscall(SYS_gettid)
    //           << " waiting for " << num_running.load() << " aios to complete"
    //           << std::endl;
    //   outFile.close();
    // }
  }
  dout(20) << __func__ << " " << this << " done" << dendl;
}

uint64_t IOContext::get_num_ios() const
{
  // this is about the simplest model for transaction cost you can
  // imagine.  there is some fixed overhead cost by saying there is a
  // minimum of one "io".  and then we have some cost per "io" that is
  // a configurable (with different hdd and ssd defaults), and add
  // that to the bytes value.
  uint64_t ios = 0;
#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
  ios += pending_aios.size();
#endif
#ifdef HAVE_SPDK
  ios += total_nseg;
#endif
  return ios;
}

void IOContext::release_running_aios()
{
  ceph_assert(!num_running);
#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
  // release aio contexts (including pinned buffers).
  running_aios.clear();
#endif
}

BlockDevice::block_device_t
BlockDevice::detect_device_type(const std::string &path)
{
#if defined(HAVE_SPDK)
  if (NVMEDevice::support(path))
  {
    return block_device_t::spdk;
  }
#endif
#if defined(HAVE_BLUESTORE_PMEM)
  if (PMEMDevice::support(path))
  {
    return block_device_t::pmem;
  }
#endif
#if (defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)) && defined(HAVE_LIBZBD)
  if (HMSMRDevice::support(path))
  {
    return block_device_t::hm_smr;
  }
#endif
#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
  return block_device_t::aio;
#else
  return block_device_t::unknown;
#endif
}

BlockDevice::block_device_t
BlockDevice::device_type_from_name(const std::string &blk_dev_name)
{
#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
  if (blk_dev_name == "aio")
  {
    return block_device_t::aio;
  }
#endif
#if defined(HAVE_SPDK)
  if (blk_dev_name == "spdk")
  {
    return block_device_t::spdk;
  }
#endif
#if defined(HAVE_BLUESTORE_PMEM)
  if (blk_dev_name == "pmem")
  {
    return block_device_t::pmem;
  }
#endif
#if (defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)) && defined(HAVE_LIBZBD)
  if (blk_dev_name == "hm_smr")
  {
    return block_device_t::hm_smr;
  }
#endif
  return block_device_t::unknown;
}

BlockDevice *BlockDevice::create_with_type(block_device_t device_type,
                                           CephContext *cct, const std::string &path, aio_callback_t cb,
                                           void *cbpriv, aio_callback_t d_cb, void *d_cbpriv)
{

  switch (device_type)
  {
#if defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)
  case block_device_t::aio:
    return new KernelDevice(cct, cb, cbpriv, d_cb, d_cbpriv);
#endif
#if defined(HAVE_SPDK)
  case block_device_t::spdk:
    return new NVMEDevice(cct, cb, cbpriv);
#endif
#if defined(HAVE_BLUESTORE_PMEM)
  case block_device_t::pmem:
    return new PMEMDevice(cct, cb, cbpriv);
#endif
#if (defined(HAVE_LIBAIO) || defined(HAVE_POSIXAIO)) && defined(HAVE_LIBZBD)
  case block_device_t::hm_smr:
    return new HMSMRDevice(cct, cb, cbpriv, d_cb, d_cbpriv);
#endif
  default:
    ceph_abort_msg("unsupported device");
    return nullptr;
  }
}

BlockDevice *BlockDevice::create(
    CephContext *cct, const string &path, aio_callback_t cb,
    void *cbpriv, aio_callback_t d_cb, void *d_cbpriv)
{
  const string blk_dev_name = cct->_conf.get_val<string>("bdev_type");
  block_device_t device_type = block_device_t::unknown;
  if (blk_dev_name.empty())
  {
    device_type = detect_device_type(path);
  }
  else
  {
    device_type = device_type_from_name(blk_dev_name);
  }
  return create_with_type(device_type, cct, path, cb, cbpriv, d_cb, d_cbpriv);
}

bool BlockDevice::is_valid_io(uint64_t off, uint64_t len) const
{
  bool ret = (off % block_size == 0 &&
              len % block_size == 0 &&
              len > 0 &&
              off < size &&
              off + len <= size);

  if (!ret)
  {
    derr << __func__ << " " << std::hex
         << off << "~" << len
         << " block_size " << block_size
         << " size " << size
         << std::dec << dendl;
  }
  return ret;
}

size_t BlockDevice::trim_stalled_read_event_queue(mono_clock::time_point cur_time)
{
  std::lock_guard lock(stalled_read_event_queue_lock);
  auto warn_duration = std::chrono::seconds(cct->_conf->bdev_stalled_read_warn_lifetime);
  while (!stalled_read_event_queue.empty() &&
         ((stalled_read_event_queue.front() < cur_time - warn_duration) ||
          (stalled_read_event_queue.size() > cct->_conf->bdev_stalled_read_warn_threshold)))
  {
    stalled_read_event_queue.pop();
  }
  return stalled_read_event_queue.size();
}

void BlockDevice::add_stalled_read_event()
{
  if (!cct->_conf->bdev_stalled_read_warn_threshold)
  {
    return;
  }
  auto cur_time = mono_clock::now();
  {
    std::lock_guard lock(stalled_read_event_queue_lock);
    stalled_read_event_queue.push(cur_time);
  }
  trim_stalled_read_event_queue(cur_time);
}

void BlockDevice::collect_alerts(osd_alert_list_t &alerts, const std::string &device_name)
{
  if (cct->_conf->bdev_stalled_read_warn_threshold)
  {
    size_t qsize = trim_stalled_read_event_queue(mono_clock::now());
    if (qsize >= cct->_conf->bdev_stalled_read_warn_threshold)
    {
      std::ostringstream ss;
      ss << "observed stalled read indications in "
         << device_name << " device";
      alerts.emplace(device_name + "_DEVICE_STALLED_READ_ALERT", ss.str());
    }
  }
}
