FROM debian:8.7
LABEL maintainer "stefano@spogliani.net"

ARG CTNG_VER=1.22.0
LABEL version.crosstoolng ${CTNG_VER}

# Install essentials for CrossToolNG and download the code.
RUN apt-get update && apt-get install -y \
  autoconf \
  build-essential \
  bison \
  cmake \
  flex \
  gawk \
  git \
  gperf \
  help2man \
  iptraf \
  libncurses5-dev \
  libtool \
  libtool-bin \
  make \
  texinfo \
  vim \
  wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && wget http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-${CTNG_VER}.tar.bz2 \
  && tar --extract --file crosstool-ng-${CTNG_VER}.tar.bz2 \
  && rm crosstool-ng-${CTNG_VER}.tar.bz2 \
  && cd crosstool-ng \
  && ./configure --prefix=/opt/crosstoolng \
  && make && make install \
  && cd .. \
  && rm -rf crosstool-ng \
  && adduser --system --shell /bin/bash --ingroup root builder \
  && mkdir /opt/crosstools \
  && chown builder:root /opt/crosstools

# Backport some patches from 1.23.0
# This can be removed once 1.23.0 is released and an image for it is available.
COPY patches-1.23/glibc/2.19/*.patch /opt/crosstoolng/lib/crosstool-ng-${CTNG_VER}/patches/glibc/2.19/
RUN chown -R builder:root /opt/crosstoolng/lib/crosstool-ng-${CTNG_VER}/

USER builder
ENV PATH /opt/crosstoolng/bin:$PATH
ENV MENUCONFIG_COLOR=blackbg
