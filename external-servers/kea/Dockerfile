# Image used
FROM ubuntu:22.04

# init package
RUN true \
    && apt-get update \
    && apt-get install --yes \
        autoconf \
        build-essential \
        cmake \
        dumb-init \
        git \
        iproute2 \
        jq \
        libboost-system-dev \
        liblog4cplus-dev \
        libssl-dev \
        libtool \
        python3 \
        python3-pip \
    && pip install yq \
    && mkdir /build /app \
    && true


# dhcp server download
RUN git clone --branch Kea-2.6.1 --depth 1 https://github.com/isc-projects/kea.git /build/kea 

# install dependencies
RUN true \
    && cd /build/kea  \
    && autoreconf --install  \
    && ./configure --prefix=/app  \
    && make -j $(nproc)  \
    && make install  \
    && ldconfig \
    && true

RUN echo a && git clone https://github.com/AChannui/Kea-dhcp-hooks-UTD.git /build/kea-hook

RUN true \
    && cd /build/kea-hook/thirdparty  \
    && rm -rf kea  \
    && ln -sfT /build/kea kea \
    && cd /build/kea-hook  \
    && bin/compile.sh  \
    && cd build  \
    && make install \
    && true

WORKDIR /app

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/app/kea-docker-start.sh"]
#CMD ["/app/sbin/kea-dhcp6", "-c", "/app/kea-conf.json"]

COPY kea-docker-start.sh /app/

COPY kea-conf.yml /app/kea-conf.yml
