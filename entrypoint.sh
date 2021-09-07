#!/bin/bash
if [ -z "$SecurityTypes" ]; then
    SecurityTypes="VncAuth,TLSVnc"
fi
if [ -z "$geometry" ]; then
    geometry="1920x1080"
fi
if [ -z "$depth" ]; then
    depth=24
fi

/usr/bin/tigervncserver -rfbport 5901 \
    -localhost=0 -SecurityTypes $SecurityTypes \
    -PasswordFile /root/.vnc/passwd \
    -ClientWaitTimeMillis 30000 \
    -geometry "$geometry" \
    -depth "$depth" \
    -useold
sleep infinity