macro(build_spdk)
  set(DPDK_DIR ${CMAKE_BINARY_DIR}/src/dpdk)
  if(NOT TARGET dpdk-ext)
    include(BuildDPDK)
    build_dpdk(${DPDK_DIR})
  endif()
  find_package(CUnit REQUIRED)
  if(LINUX)
    find_package(aio REQUIRED)
    find_package(uuid REQUIRED)
  endif()
  include(FindMake)
  find_make("MAKE_EXECUTABLE" "make_cmd")

  set(spdk_CFLAGS "-fPIC")
  include(CheckCCompilerFlag)
  check_c_compiler_flag("-Wno-address-of-packed-member" HAVE_WARNING_ADDRESS_OF_PACKED_MEMBER)
  if(HAVE_WARNING_ADDRESS_OF_PACKED_MEMBER)
    string(APPEND spdk_CFLAGS " -Wno-address-of-packed-member")
  endif()
  check_c_compiler_flag("-Wno-unused-but-set-variable"
    HAVE_UNUSED_BUT_SET_VARIABLE)
  if(HAVE_UNUSED_BUT_SET_VARIABLE)
    string(APPEND spdk_CFLAGS " -Wno-unused-but-set-variable")
  endif()

  include(ExternalProject)
  if(CMAKE_SYSTEM_PROCESSOR MATCHES "amd64|x86_64|AMD64")
    # a safer option than relying on the build host's arch
    # set(target_arch core2)
    set(target_arch native)
  else()
    # default arch used by SPDK
    set(target_arch native)
  endif()

  set(source_dir "${CMAKE_SOURCE_DIR}/src/spdk")
  foreach(c lvol smart_nvme sock nvmf bdev nvme env_dpdk conf thread trace notify accel event_accel blob vmd event_vmd event_bdev sock_posix event_sock event_scheduler event dma event_keyring keyring_linux keyring rpc jsonrpc json util log)
    add_library(spdk::${c} STATIC IMPORTED)
    set(lib_path "${source_dir}/build/lib/${CMAKE_STATIC_LIBRARY_PREFIX}spdk_${c}${CMAKE_STATIC_LIBRARY_SUFFIX}")
    set_target_properties(spdk::${c} PROPERTIES
      IMPORTED_LOCATION "${lib_path}"
      INTERFACE_INCLUDE_DIRECTORIES "${source_dir}/include")
    list(APPEND spdk_libs "${lib_path}")
    list(APPEND SPDK_LIBRARIES spdk::${c})
  endforeach()

  ExternalProject_Add(spdk-ext
    DEPENDS dpdk-ext
    SOURCE_DIR ${source_dir}
    CONFIGURE_COMMAND ./configure
      --with-dpdk=${DPDK_DIR}
      --set-uintrmode
      --enable-debug
      --without-crypto
      --without-vhost
      --disable-tests
      --disable-unit-tests
      --target-arch=${target_arch}
    # unset $CFLAGS, otherwise it will interfere with how SPDK sets
    # its include directory.
    # unset $LDFLAGS, otherwise SPDK will fail to mock some functions.
    BUILD_COMMAND env -i PATH=$ENV{PATH} CC=${CMAKE_C_COMPILER} ${make_cmd} EXTRA_CFLAGS=${spdk_CFLAGS} -j ${SPDK_J}
    BUILD_IN_SOURCE 1
    BUILD_BYPRODUCTS ${spdk_libs}
    INSTALL_COMMAND ""
    LOG_CONFIGURE ON
    LOG_BUILD ON
    LOG_MERGED_STDOUTERR ON
    LOG_OUTPUT_ON_FAILURE ON)
  unset(make_cmd)
  foreach(spdk_lib ${SPDK_LIBRARIES})
    add_dependencies(${spdk_lib} spdk-ext)
  endforeach()

  set_target_properties(spdk::env_dpdk PROPERTIES
    INTERFACE_LINK_LIBRARIES "dpdk::dpdk;rt")
  set_target_properties(spdk::lvol PROPERTIES
    INTERFACE_LINK_LIBRARIES spdk::util)
  set_target_properties(spdk::util PROPERTIES
    INTERFACE_LINK_LIBRARIES ${UUID_LIBRARIES})
  set(SPDK_INCLUDE_DIR "${source_dir}/include")
  unset(source_dir)
endmacro()
