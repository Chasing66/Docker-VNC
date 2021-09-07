FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai
RUN apt-get update && apt-get install -y \
    tigervnc-standalone-server \
    xfce4 xfce4-goodies autocutsel \
    procps \
    dbus-x11 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /root
ADD passwd entrypoint.sh xstartup /root/.vnc/
RUN chmod +x /root/.vnc/entrypoint.sh /root/.vnc/entrypoint.sh
EXPOSE 5901
ENTRYPOINT [ "/root/.vnc/entrypoint.sh" ]