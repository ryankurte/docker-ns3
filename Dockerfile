FROM ubuntu:latest
MAINTAINER Ryan Kurte <ryankurte@gmail.com>
LABEL Description="Docker image for NS-3 Network Simulator"

RUN apt-get update

# General dependencies
RUN apt-get install -y \
  git \
  mercurial \
  wget \
  vim \
  autoconf \
  bzr \
  cvs \
  unrar \
  build-essential \
  clang \
  valgrind \
  gsl-bin \
  libgsl2 \
  libgsl-dev \
  flex \
  bison \
  libfl-dev \
  tcpdump \
  sqlite \
  sqlite3 \
  libsqlite3-dev \
  libxml2 \
  libxml2-dev \
  vtun \
  lxc

# QT4 components
RUN apt-get install -y \
  qt4-qmake \
  qt4-dev-tools \
  libqt4-dev \
  libqt4-opengl-dev

# Python components
RUN apt-get install -y \
  python \
  python-dev \
  python-setuptools \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib

# NS-3

# Create working directory
RUN mkdir -p /usr/ns3
WORKDIR /usr/ns3

# Fetch NS-3 source
RUN wget http://www.nsnam.org/release/ns-allinone-3.26.tar.bz2
RUN tar -xf ns-allinone-3.26.tar.bz2

# Configure and compile NS-3
RUN cd ns-allinone-3.26 && ./build.py --enable-examples --enable-tests

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt && \
  rm /usr/ns3/ns-allinone-3.26.tar.bz2


