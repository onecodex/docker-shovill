# docker-shovill [![Docker Repository on Quay](https://quay.io/repository/refgenomics/docker-shovill/status "Docker Repository on Quay")](https://quay.io/repository/refgenomics/docker-shovill)

Docker image for the Shovill genome assembler.

## Usage


```bash
docker run \
  --volume $(pwd)/data/:/data/
  quay.io/refgenomics/docker-shovill \
  /data/input.fastq.gz
```
