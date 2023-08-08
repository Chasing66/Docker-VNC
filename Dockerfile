FROM ubuntu:22.04
WORKDIR /root
COPY .vnc /root/.vnc/
COPY entrypoint.sh /
COPY supervisord.conf /etc/supervisor/conf.d/

ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Shanghai
RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-goodies tigervnc-standalone-server tigervnc-tools \
    vim openssh-server supervisor \
    procps \
    dbus-x11 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 5901 22
ENTRYPOINT [ "/entrypoint.sh" ]
