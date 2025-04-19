# Install script for directory: /home/led/workspace/ceph_high_power_efficiency/src/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/led/workspace/ceph_high_power_efficiency/src/include/libcephsqlite.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/rados" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/librados.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/rados_types.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/rados_types.hpp"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/librados_fwd.hpp"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/librados.hpp"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/buffer.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/buffer_fwd.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/inline_memory.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/page.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/crc32c.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/objclass.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/radosstriper" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/include/radosstriper/libradosstriper.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/radosstriper/libradosstriper.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/rbd" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rbd/features.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rbd/librbd.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rbd/librbd.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/rados" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/librgw.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/rados/rgw_file.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cephfs" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/include/cephfs/libcephfs.h"
    "/home/led/workspace/ceph_high_power_efficiency/src/include/cephfs/ceph_ll_client.h"
    )
endif()

