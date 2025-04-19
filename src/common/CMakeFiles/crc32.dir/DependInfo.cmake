
# Consider dependencies only in project.
set(CMAKE_DEPENDS_IN_PROJECT_ONLY OFF)

# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/led/workspace/ceph_high_power_efficiency/src/isa-l/crc/crc32_iscsi_00.asm" "/home/led/workspace/ceph_high_power_efficiency/src/common/CMakeFiles/crc32.dir/__/isa-l/crc/crc32_iscsi_00.asm.o"
  "/home/led/workspace/ceph_high_power_efficiency/src/common/crc32c_intel_fast_zero_asm.s" "/home/led/workspace/ceph_high_power_efficiency/src/common/CMakeFiles/crc32.dir/crc32c_intel_fast_zero_asm.s.o"
  )
set(CMAKE_ASM_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "BOOST_ASIO_DISABLE_THREAD_KEYWORD_EXTENSION"
  "BOOST_ASIO_USE_TS_EXECUTOR_AS_DEFAULT"
  "HAVE_CONFIG_H"
  "_FILE_OFFSET_BITS=64"
  "_GNU_SOURCE"
  "_REENTRANT"
  "_THREAD_SAFE"
  "__CEPH__"
  "__STDC_FORMAT_MACROS"
  "__linux__"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "src/include"
  "src"
  "boost/include"
  "include"
  "src/xxHash"
  "src/rapidjson/include"
  "/usr/include"
  )

# The set of dependency files which are needed:
set(CMAKE_DEPENDS_DEPENDENCY_FILES
  "/home/led/workspace/ceph_high_power_efficiency/src/common/crc32c_intel_baseline.c" "src/common/CMakeFiles/crc32.dir/crc32c_intel_baseline.c.o" "gcc" "src/common/CMakeFiles/crc32.dir/crc32c_intel_baseline.c.o.d"
  "/home/led/workspace/ceph_high_power_efficiency/src/common/crc32c_intel_fast.c" "src/common/CMakeFiles/crc32.dir/crc32c_intel_fast.c.o" "gcc" "src/common/CMakeFiles/crc32.dir/crc32c_intel_fast.c.o.d"
  "/home/led/workspace/ceph_high_power_efficiency/src/common/sctp_crc32.c" "src/common/CMakeFiles/crc32.dir/sctp_crc32.c.o" "gcc" "src/common/CMakeFiles/crc32.dir/sctp_crc32.c.o.d"
  "/home/led/workspace/ceph_high_power_efficiency/src/common/crc32c.cc" "src/common/CMakeFiles/crc32.dir/crc32c.cc.o" "gcc" "src/common/CMakeFiles/crc32.dir/crc32c.cc.o.d"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/led/workspace/ceph_high_power_efficiency/src/arch/CMakeFiles/arch.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
