FROM alpine:3.22

RUN apk update && apk add --no-cache vsftpd

# Create ftp user and home dir
RUN adduser -D ftpuser && echo "ftpuser:ftppassword" | chpasswd
RUN mkdir -p /home/ftpuser && chown ftpuser:ftpuser /home/ftpuser

RUN chmod 755 /home/ftpuser

RUN chown ftpuser:ftpuser /home/ftpuser

COPY ftp.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
