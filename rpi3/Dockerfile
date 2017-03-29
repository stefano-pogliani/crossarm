FROM spogliani/crosstoolng:1.22.0
LABEL maintainer "stefano@spogliani.net"

COPY crosstoolng.config /home/builder/.config
WORKDIR /home/builder

RUN ct-ng oldconfig
RUN ct-ng build || (cat build.log && exit 1)

ENV PATH="/opt/crosstools/armv7-rpi3-linux-gnueabihf/bin:$PATH"
COPY cross-tools.cmake /opt/crosstools/armv7-rpi3-linux-gnueabihf.cmake

LABEL feature.hardfloat "true" \
      feature.c++ "true" \
      feature.debug.gdb "true" \
      feature.staticlink = "true"

LABEL \
  version.binutils "2.25.1" \
  version.expat "2.1.0" \
  version.gcc "5.2.0" \
  version.gdb "7.10" \
  version.gettext "0.19.6" \
  version.glibc "2.19" \
  version.gmp "6.0.0a" \
  version.isl "0.14" \
  version.libiconv "1.14" \
  version.linux "4.3" \
  version.mpfr "3.1.3" \
  version.mpc "1.0.3" \
  version.ncurses "6.0"
