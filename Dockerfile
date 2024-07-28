ARG VERSION=stable

FROM nextcloud:${VERSION}-fpm-alpine

RUN apk add --no-cache ffmpeg imagemagick

STOPSIGNAL SIGQUIT

LABEL org.opencontainers.image.description="A safe home for all your data"
LABEL org.opencontainers.image.licenses="AGPL-3.0-only"
LABEL org.opencontainers.image.source="https://github.com/nextcloud/server"
LABEL org.opencontainers.image.title="nextcloud"
LABEL org.opencontainers.image.version=${VERSION}