FROM ubuntu
USER root
RUN apt update
RUN apt install wget -y
RUN wget -N --no-check-certificate https://raw.githubusercontent.com/tankitchen/Railway-Xray/main/CFwarp.sh && chmod +x CFwarp.sh && ./CFwarp.sh && \
    apt-get install iputils-ping -y && \
    apt install curl -y && \
    curl cloudflare.com/cdn-cgi/trace
