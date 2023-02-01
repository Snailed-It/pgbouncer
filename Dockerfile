FROM registry.opensource.zalan.do/acid/pgbouncer:master-22

USER root

RUN apk add --upgrade apk-tools &&  \
    apk update && apk -U upgrade && \
    rm -rf /var/cache/apk/*

USER pgbouncer
# Tweak for fast switchover
RUN echo 'server_fast_close = 1' >> /etc/pgbouncer/pgbouncer.ini.tmpl
RUN echo 'dns_max_ttl = 5' >> /etc/pgbouncer/pgbouncer.ini.tmpl
RUN echo 'dns_nxdomain_ttl = 5' >> /etc/pgbouncer/pgbouncer.ini.tmpl
