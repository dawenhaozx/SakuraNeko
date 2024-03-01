FROM phpswoole/swoole:php8.1-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pcntl

RUN apk add --no-cache bash php8.1 curl supervisor redis git mailcap caddy
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php8.1/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
