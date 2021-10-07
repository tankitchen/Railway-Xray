FROM alpine:edge
USER root
RUN apk update && \
    apk add --no-cache --upgrade bash && \
    apk add wget && \
    yes "7" | wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/kkkyg/CFwarp/CFwarp.sh && chmod +x CFwarp.sh 
CMD ["CFwarp.sh"]
RUN ping6 ipv6.google.com && \
    apk add --no-cache ca-certificates caddy tor zip unzip wget && \
    wget -O Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
