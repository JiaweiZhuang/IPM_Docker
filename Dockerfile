FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget \
    make \
    gcc g++ gfortran \
    libopenmpi-dev \
    openssh-server \
    autoconf libtool \
    ploticus \
    && rm -rf /var/lib/apt/lists/*

# ipm_parse looks for `pl`
RUN ln -s /usr/bin/ploticus /usr/bin/pl

WORKDIR /app

RUN wget https://github.com/nerscadmin/IPM/archive/2.0.6.tar.gz \
    && tar zxf 2.0.6.tar.gz && rm 2.0.6.tar.gz  \
    && cd IPM-2.0.6 \
    && ./bootstrap.sh \
    && ./configure --prefix=/app/IPM \
    && make \
    && make install \
    && cd .. && rm -rf IPM-2.0.6

ENV LD_PRELOAD="/app/IPM/lib/libipm.so /app/IPM/lib/libipmf.so"
ENV IPM_LOG=full IPM_REPORT=full

ENV PATH=/app/IPM/bin:$PATH
