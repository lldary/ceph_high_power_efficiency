# Install script for directory: /home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/dashboard/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/rook/cmake_install.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/ceph/mgr/alerts;/usr/local/share/ceph/mgr/balancer;/usr/local/share/ceph/mgr/cephadm;/usr/local/share/ceph/mgr/crash;/usr/local/share/ceph/mgr/devicehealth;/usr/local/share/ceph/mgr/diskprediction_local;/usr/local/share/ceph/mgr/influx;/usr/local/share/ceph/mgr/insights;/usr/local/share/ceph/mgr/iostat;/usr/local/share/ceph/mgr/k8sevents;/usr/local/share/ceph/mgr/localpool;/usr/local/share/ceph/mgr/mds_autoscaler;/usr/local/share/ceph/mgr/mirroring;/usr/local/share/ceph/mgr/nfs;/usr/local/share/ceph/mgr/orchestrator;/usr/local/share/ceph/mgr/osd_perf_query;/usr/local/share/ceph/mgr/osd_support;/usr/local/share/ceph/mgr/pg_autoscaler;/usr/local/share/ceph/mgr/progress;/usr/local/share/ceph/mgr/prometheus;/usr/local/share/ceph/mgr/rbd_support;/usr/local/share/ceph/mgr/restful;/usr/local/share/ceph/mgr/rgw;/usr/local/share/ceph/mgr/selftest;/usr/local/share/ceph/mgr/snap_schedule;/usr/local/share/ceph/mgr/stats;/usr/local/share/ceph/mgr/status;/usr/local/share/ceph/mgr/telegraf;/usr/local/share/ceph/mgr/telemetry;/usr/local/share/ceph/mgr/test_orchestrator;/usr/local/share/ceph/mgr/volumes;/usr/local/share/ceph/mgr/zabbix")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/ceph/mgr" TYPE DIRECTORY FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/alerts"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/balancer"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/cephadm"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/crash"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/devicehealth"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/diskprediction_local"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/influx"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/insights"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/iostat"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/k8sevents"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/localpool"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/mds_autoscaler"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/mirroring"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/nfs"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/orchestrator"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/osd_perf_query"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/osd_support"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/pg_autoscaler"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/progress"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/prometheus"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/rbd_support"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/restful"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/rgw"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/selftest"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/snap_schedule"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/stats"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/status"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/telegraf"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/telemetry"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/test_orchestrator"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/volumes"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/zabbix"
    REGEX "/CMakeLists\\.txt$" EXCLUDE REGEX "/\\.gitignore$" EXCLUDE REGEX "/tox\\.ini$" EXCLUDE REGEX "/requirements[^/]*\\.txt$" EXCLUDE REGEX "/constraints[^/]*\\.txt$" EXCLUDE REGEX "/tests\\/[^/]*$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/ceph/mgr/mgr_module.py;/usr/local/share/ceph/mgr/mgr_util.py;/usr/local/share/ceph/mgr/object_format.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/share/ceph/mgr" TYPE FILE FILES
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/mgr_module.py"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/mgr_util.py"
    "/home/led/workspace/ceph_high_power_efficiency/src/pybind/mgr/object_format.py"
    )
endif()

