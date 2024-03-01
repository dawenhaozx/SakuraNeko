FROM phpswoole/swoole:php8.1-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pcntl

RUN apk --no-cache add bash curl shadow supervisor redis git mailcap caddy nginx sqlite nginx-mod-http-brotli mysql-client php8.1-common php8.1-cli php8.1-fpm php8.1-gd php8.1-mysql php8.1-mbstring php8.1-curl php8.1-xml php8.1-xmlrpc php8.1-zip php8.1-intl php8.1-bz2 php8.1-bcmath php8.1-redis
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy /run/supervisor
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/php-fpm.conf /etc/php8.1/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
