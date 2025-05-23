if(WITH_BLUESTORE OR  WITH_RBD_SSD_CACHE)
list(APPEND libblk_srcs
  BlockDevice.cc)
endif()

if(HAVE_LIBAIO OR HAVE_POSIXAIO)
  list(APPEND libblk_srcs
    kernel/KernelDevice.cc
    kernel/io_uring.cc
    aio/aio.cc)
endif()

if(WITH_BLUESTORE_PMEM)
  list(APPEND libblk_srcs
    pmem/PMEMDevice.cc)
endif()

if(WITH_SPDK)
  list(APPEND libblk_srcs
    spdk/NVMEDevice.cc
    spdk/NVMeQPair.cc
    spdk/NVMeLog.cc)
endif()

if(WITH_ZBD)
  list(APPEND libblk_srcs
    zoned/HMSMRDevice.cc)
endif()

if(libblk_srcs)
  add_library(blk STATIC ${libblk_srcs})
  target_include_directories(blk PRIVATE "./")
endif()

if(HAVE_LIBAIO)
  target_link_libraries(blk PUBLIC ${AIO_LIBRARIES})
endif(HAVE_LIBAIO)

if(WITH_SPDK)
  target_link_libraries(blk PRIVATE "-Wl,--whole-archive")
  target_link_libraries(blk PRIVATE ${SPDK_LIBRARIES})
  target_link_libraries(blk PRIVATE "-Wl,--no-whole-archive")
  target_link_libraries(blk PRIVATE ${_OPENSSL_LDFLAGS})
  target_link_libraries(blk PRIVATE "-L${CMAKE_SOURCE_DIR}/src/spdk/isa-l/.libs -lisal")
endif()

if(WITH_ZBD)
  target_link_libraries(blk PRIVATE ${ZBD_LIBRARIES})
endif()

if(WITH_BLUESTORE_PMEM)
  target_link_libraries(blk
    PRIVATE pmem::pmem)
endif()

if(WITH_EVENTTRACE)
  add_dependencies(blk eventtrace_tp)
endif()

if(WITH_LIBURING)
  target_link_libraries(blk PRIVATE uring::uring)
endif()
