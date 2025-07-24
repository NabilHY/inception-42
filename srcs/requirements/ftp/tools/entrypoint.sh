#!/bin/sh
set -e

RUN adduser -D ftpuser && echo "ftpuser:ftppassword" | chpasswd
RUN mkdir -p /home/ftpuser && chown ftpuser:ftpuser /home/ftpuser

RUN chmod 755 /home/ftpuser

RUN chown ftpuser:ftpuser /home/ftpuser

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf