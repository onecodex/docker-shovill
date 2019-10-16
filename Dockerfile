FROM continuumio/miniconda

MAINTAINER Christopher Smith <christopher@onecodex.com>

RUN conda install \
  --yes \
  --channel conda-forge \
  --channel bioconda \
  --channel defaults \
  shovill

RUN shovill --check
