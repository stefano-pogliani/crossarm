RasberryPi CrossCompile Tools
=============================
Set of docker files and scripts to build images for RaspberryPi
cross-compiling.

Using docker images for this make setup fast and easy while
keeping the environment clean and flexible: only use the tools
you need and keep project dependencies away from one another.


Structure
---------
The base image is `debian:jessie`.

This is used to create a generic `crosstoolng:VERSION` image that
includes a fresh install of the specified crosstool-NG version.

The crosstool-NG image is, in turn, used as the base
for images that target specific versions of RaspberryPi
and cross-compiled tools.


Building
--------
Building images is optional if they are available on docker hub.
If they are not you can build them from this repo.

Keep in mind that toolchain images are very large and slow to make.
In paritcular docker will take some time to create images from
the container running the `ct-ng build` and later.
Be patient and check with tools like `top` because docker will
look stuck!

```bash
make ctng-image  # Build base crosstool-NG image.
make rpi3-image  # Build toolchain targeting RPi3.
```


Usage
-----
Once the images are available locally, you can build projects
using docker volumes.

```bash
cd /path/to/project
docker run --tty --interactive \
    --volume "$PWD:/mnt" \
    --rm \
    spogliani/crossarm:rpi3 bash

# Compilation step changes based on the project being compiled.
# See http://crosstool-ng.github.io/docs/toolchain-usage/
cd /mnt
make CROSS_COMPILE=armv7-rpi3-linux-gnueabihf- clean build
```

### C++ Runtime Library
Note that C++ code built with these tools will be linked against
the `libstdc++` version in the toolchain lib directory
(`/opt/crosstool/<toolchain>/<toolchain>/lib/libstdc++.so`).

As these images provided a recent version of `g++` they will
link agains a recent version of `libstdc++`.

If your target system does not have this version, it can be
installed by copying the built version into the target system's
lib directory (i,e. `/usr/lib/arm-linux-gnueabihf`) and run
`ldconfig` to configure your system to use the newer version.
