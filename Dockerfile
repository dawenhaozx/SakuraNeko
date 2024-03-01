FROM alpine:3.18
LABEL org.opencontainers.image.source="https://github.com/dawenhaozx/SakuraNeko"
RUN apk update && apk add --no-cache bash php8 curl supervisor redis php8-zlib php8-xml php8-phar php8-intl php8-dom php8-xmlreader php8-ctype php8-session php8-mbstring php8-tokenizer php8-gd php8-redis php8-bcmath php8-iconv php8-pdo php8-posix php8-gettext php8-simplexml php8-sodium php8-sysvsem php8-fpm php8-mysqli php8-json php8-openssl php8-curl php8-sockets php8-zip php8-pdo_mysql php8-xmlwriter php8-opcache php8-gmp php8-pdo_sqlite php8-sqlite3 php8-pcntl php8-fileinfo git mailcap caddy
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php8/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
