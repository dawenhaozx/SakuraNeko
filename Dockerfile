FROM phpswoole/swoole:php8.1-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pcntl

RUN apk --no-cache add bash curl shadow supervisor redis git mailcap caddy sqlite nginx-mod-http-brotli mysql-client
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php8.1/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
