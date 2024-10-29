# Image used
FROM ubuntu:22.04

# init package
RUN apt update && apt install --yes dumb-init 

RUN mkdir /build /app

RUN apt update && apt install --yes git 

# dhcp server download
RUN git clone --branch Kea-2.6.1 --depth 1 https://github.com/isc-projects/kea.git /build/kea 

# install dependencies
RUN apt-get update && apt-get install --yes autoconf libtool build-essential libssl-dev liblog4cplus-dev libboost-system-dev

RUN cd /build/kea && autoreconf --install && ./configure --prefix=/app && make -j $(nproc) 
RUN cd /build/kea && make install && ldconfig

RUN apt update && apt install --yes iproute2

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/app/sbin/kea-dhcp6", "-c", "/app/kea-conf.json"]

RUN mkdir -p /app

COPY kea-conf.json /app/kea-conf.json

COPY test.sh /app/test.sh
