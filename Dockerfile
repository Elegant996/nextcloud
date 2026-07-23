ARG VERSION=stable

FROM nextcloud:${VERSION}-fpm-alpine

RUN set -ex; \
    \
    apk add --no-cache \
        ffmpeg \
        netcat-openbsd \
        procps \
        samba-client \
        # libreoffice \
    ;

RUN set -ex; \
    \
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        samba-dev \
        bzip2-dev \
    ; \
    \
    docker-php-ext-install \
        bz2 \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    \
    runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --virtual .nextcloud-phpext-rundeps $runDeps; \
    apk del .build-deps; \
    # workaround redis issues
    sed -i 's|\s*configure_redis_session$|\
    if [ ! -f "/usr/local/etc/php/conf.d/redis-session.ini" ]; then\
        configure_redis_session\
    fi|g' /entrypoint.sh