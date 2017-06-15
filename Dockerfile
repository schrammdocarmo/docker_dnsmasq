FROM alpine:3.6
RUN apk --no-cache add dnsmasq

# Setting timezone
RUN apk --no-cache add tzdata
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo "Europe/Berlin" > /etc/timezone

# Custom Config
COPY ./etc/dnsmasq.conf /etc/dnsmasq.conf
RUN mkdir -p /etc/dnsmasq.d
VOLUME /etc/dnsmasq.d

# Add Healthcheck
COPY ./usr/local/bin/docker_healthcheck.sh /usr/local/bin/docker_healthcheck.sh
RUN chmod 755 /usr/local/bin/docker_healthcheck.sh
HEALTHCHECK --interval=1m --timeout=5s \
  CMD /bin/sh /usr/local/bin/docker_healthcheck.sh

EXPOSE 53 53/udp
ENTRYPOINT ["dnsmasq", "-k"]​

