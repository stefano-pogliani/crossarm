SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

SET(CMAKE_C_COMPILER
  /opt/crosstools/armv7-rpi3-linux-gnueabihf/bin/armv7-rpi3-linux-gnueabihf-gcc)

SET(CMAKE_CXX_COMPILER
  /opt/crosstools/armv7-rpi3-linux-gnueabihf/bin/armv7-rpi3-linux-gnueabihf-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH
  /opt/crosstools/armv7-rpi3-linux-gnueabihf/armv7-rpi3-linux-gnueabihf/sysroot)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
