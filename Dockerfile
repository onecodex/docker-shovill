FROM quay.io/aptible/ubuntu:16.04

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
  && apt-get clean

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
  && useradd -m -s /bin/bash shovill \
  && echo 'shovill ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER shovill

WORKDIR /home/shovill

RUN git clone https://github.com/Linuxbrew/brew.git .linuxbrew

ENV PATH=/home/shovill/.linuxbrew/bin:/home/shovill/.linuxbrew/sbin:$PATH \
  SHELL=/bin/bash

# RUN brew install cpanm

# RUN cpanm Bio::Perl File::Slurp

# ENV PERL5LIB /home/snippy/perl5/lib/perl5

RUN brew install brewsci/bio/shovill

CMD ["shovill", "--check"]