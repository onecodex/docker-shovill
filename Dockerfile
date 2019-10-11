FROM quay.io/aptible/ubuntu:18.04

MAINTAINER Christopher Smith <christopher@onecodex.com>

RUN apt-get update \
  && apt-get install -y \
  curl \
  file \
  g++ \
  git \
  libz-dev \
  locales \
  make \
  uuid-runtime \
  sudo \
  pigz \
  && apt-get clean

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
  && useradd -m -s /bin/bash shovill \
  && echo 'shovill ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER shovill
WORKDIR /home/shovill

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

ENV PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH
RUN brew tap brewsci/bio
RUN brew install shovill
