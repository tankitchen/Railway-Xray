FROM ubuntu
USER root
RUN apt update
RUN apt install wget -y
RUN yes "7\n" | wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/kkkyg/CFwarp/CFwarp.sh && chmod +x CFwarp.sh && ./CFwarp.sh && \
    apt-get install iputils-ping -y && \
    ping ipv6.google.com && \
    apk add --no-cache ca-certificates caddy tor zip unzip wget && \
    wget -O Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
