FROM alpine:3.22

# Install vsftpd
RUN apk update && apk add --no-cache vsftpd

# Expose the FTP ports
EXPOSE 21 21000-21010

# Copy the config file and entrypoint script
COPY ftp.conf /etc/vsftpd/vsftpd.conf

COPY tools/entrypoint.sh /tools/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /tools/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/tools/entrypoint.sh"]