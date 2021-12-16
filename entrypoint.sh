#!/bin/bash

if [[ ! -d /run/sshd ]]; then
    mkdir -p /run/sshd
    echo root:123456 | chpasswd
fi

if ! grep "^PermitRootLogin yes" /etc/ssh/sshd_config > /dev/null; then
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi
if ! grep "^PasswordAuthentication yes" /etc/ssh/sshd_config > /dev/null; then
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
fi

exec supervisord -n -c /etc/supervisor/supervisord.conf