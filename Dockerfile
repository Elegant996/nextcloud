ARG VERSION=stable

FROM nextcloud:30.0.1-fpm-alpine

RUN apk add --no-cache ffmpeg imagemagick

STOPSIGNAL SIGQUIT