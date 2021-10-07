FROM ubuntu
USER root
RUN apt update
RUN apt install wget -y
RUN yes "7\n" | wget -N --no-check-certificate https://cdn.jsdelivr.net/gh/kkkyg/CFwarp/CFwarp.sh && chmod +x CFwarp.sh && ./CFwarp.sh && \
    apt-get install iputils-ping -y && \
    ping ipv6.google.com
