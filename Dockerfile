ARG VERSION=stable

FROM nextcloud:31.0.2-fpm-alpine

RUN apk add --no-cache ffmpeg imagemagick

STOPSIGNAL SIGQUIT