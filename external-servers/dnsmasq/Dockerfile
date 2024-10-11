# This could be a lighter image, but for development use ubuntu 22.04 
FROM ubuntu:22.04
# Install some utilities 
RUN apt update && apt install -y nano iproute2 curl systemctl dumb-init
# Install dnsmasq
RUN apt update && apt install -y dnsmasq=2.86-1.1


# Start dnsmasq and don't use dns, only DHCP
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# ENTRYPOINT ["dnsmasq", "-d", "-C", "/dev/null", "-p", "0"]
# By default assume interface is wfan0 and assign any address from subnet::1 to subnet::ffff
CMD ["/usr/sbin/dnsmasq"]
# CMD ["-i", "wfan0", "--dhcp-range", "2020:abcd::1,2020:abcd::ffff,64,336h"]

COPY dnsmasq.conf /etc/dnsmasq.conf
