FROM alpine:3.19.1
LABEL org.opencontainers.image.source="https://github.com/dawenhaozx/SakuraNeko"
RUN apk update && apk add --no-cache bash php8.3 curl supervisor redis php8.3-zlib php8.3-xml php8.3-phar php8.3-intl php8.3-dom php8.3-xmlreader php8.3-ctype php8.3-session php8.3-mbstring php8.3-tokenizer php8.3-gd php8.3-redis php8.3-bcmath php8.3-iconv php8.3-pdo php8.3-posix php8.3-gettext php8.3-simplexml php8.3-sodium php8.3-sysvsem php8.3-fpm php8.3-mysqli php8.3-json php8.3-openssl php8.3-curl php8.3-sockets php8.3-zip php8.3-pdo_mysql php8.3-xmlwriter php8.3-opcache php8.3-gmp php8.3-pdo_sqlite php8.3-sqlite3 php8.3-pcntl php8.3-fileinfo git mailcap caddy
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php8.3/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
