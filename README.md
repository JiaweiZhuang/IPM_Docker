# Dockerfile for IPM

See https://github.com/nerscadmin/IPM

This image is mostly to provide `ipm_parse` on my laptop, to convert IPM-generated XML files to HTML.

Can also be used for profiling single-node MPI runs, but it is not that useful.

# Usage

## Install

    docker build -t zhuangjw/ipm .

or:

    docker pull zhuangjw/ipm

## Parsing XML

    cd [working-directory]
    docker run --rm -it -v $(pwd):/file zhuangjw/ipm
    cd /file
    ipm_parse -html [ipm-generated-file].xml

## Profiling single-node MPI

`LD_PRELOAD` is already set so just compile and execute MPI programs inside container.
