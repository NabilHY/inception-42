FROM alpine:latest

RUN apk update && apk add --no-cache openssl curl ca-certificates bash

RUN printf "%s%s%s%s\n" \
"@nginx " \
"http://nginx.org/packages/alpine/v" \
`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
"/main" \
| tee -a /etc/apk/repositories

RUN curl -o /etc/apk/keys/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 \
  -subj "/C=MA/ST=Casablanca/L=Casa/O=Inception/CN=nhayoun.42.fr" \
  -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx.key \
  -out /etc/nginx/ssl/nginx.crt

RUN openssl rsa -pubin -in /etc/apk/keys/nginx_signing.rsa.pub -text -noout

RUN apk add nginx@nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY tools/entrypoint.sh /tools/entrypoint.sh

RUN chmod +x /tools/entrypoint.sh

ENTRYPOINT [ "/tools/entrypoint.sh" ]