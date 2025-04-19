# Install script for directory: /home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd

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
  
    set(ENV{CC} " /usr/bin/cc")
    set(ENV{LDSHARED} " /usr/bin/cc -shared")
    set(ENV{CPPFLAGS} "-iquote/home/led/workspace/ceph_high_power_efficiency/src/include
                        -D'void0=dead_function(void)'                         -D'__Pyx_check_single_interpreter(ARG)=ARG##0'                         ")
    set(ENV{LDFLAGS} "-L/home/led/workspace/ceph_high_power_efficiency/lib")
    set(ENV{CYTHON_BUILD_DIR} "/home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd")
    set(ENV{CEPH_LIBDIR} "/home/led/workspace/ceph_high_power_efficiency/lib")

    set(options --prefix=/usr/local)
    if(DEFINED ENV{DESTDIR})
      if(EXISTS /etc/debian_version)
        list(APPEND options --install-layout=deb)
      endif()
      list(APPEND options --root=$ENV{DESTDIR})
    else()
      list(APPEND options --root=/)
    endif()
    execute_process(
       COMMAND
           /usr/bin/python3.10 /home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd/setup.py
           build  --build-base /home/led/workspace/ceph_high_power_efficiency/lib/cython_modules
           --build-platlib /home/led/workspace/ceph_high_power_efficiency/lib/cython_modules/lib.3
           build_ext --cython-c-in-temp --build-temp /home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd --cython-include-dirs /home/led/workspace/ceph_high_power_efficiency/src/pybind/rados
           install ${options} --single-version-externally-managed --record /dev/null
           egg_info --egg-base /home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd
           
       WORKING_DIRECTORY "/home/led/workspace/ceph_high_power_efficiency/src/pybind/rbd"
       RESULT_VARIABLE install_res)
    if(NOT "${install_res}" STREQUAL 0)
      message(FATAL_ERROR "Failed to build and install cython_rbd python module")
    endif()
  
endif()

