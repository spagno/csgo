FROM alpine
RUN apk --update add iptables && \
    rm -fr /var/lib/apt/lists/* && \
    rm -fr /var/cache/apk/*
COPY containerfs/start.sh /usr/bin/start.sh
CMD start.sh
