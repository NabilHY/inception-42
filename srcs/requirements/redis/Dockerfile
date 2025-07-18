FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install -y wget tar make build-essential

COPY /tools/entrypoint.sh /tools/entrypoint.sh

ENTRYPOINT [ "/tools/entrypoint.sh" ]
