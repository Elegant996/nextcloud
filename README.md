# Nextcloud
 📱☁️💻 A safe home for all your data – community-driven, free & open source 👏

Caddy
-----------------------------------------------
The `Caddyfile` in this repo can be used in place of the `nginx` configuration which can be found under the [Nextcloud in the webroot of NGINX](https://docs.nextcloud.com/server/latest/admin_manual/installation/nginx.html#nextcloud-in-the-webroot-of-nginx) documentation.

Docker
-----------------------------------------------
This repo will periodically check nextcloud for updates and build a container image from scratch using an Alpine base layout:

```
docker pull ghcr.io/elegant996/nextcloud:31.0.6-fpm-alpine
```
