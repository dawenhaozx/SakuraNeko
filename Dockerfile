FROM alpine:3.18
LABEL org.opencontainers.image.source="https://github.com/dawenhaozx/SakuraNeko"
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add --no-cache bash php8.1 curl supervisor redis php8.1-zlib php8.1-xml php8.1-phar php8.1-intl php8.1-dom php8.1-xmlreader php8.1-ctype php8.1-session php8.1-mbstring php8.1-tokenizer php8.1-gd php8.1-redis php8.1-bcmath php8.1-iconv php8.1-pdo php8.1-posix php8.1-gettext php8.1-simplexml php8.1-sodium php8.1-sysvsem php8.1-fpm php8.1-mysqli php8.1-json php8.1-openssl php8.1-curl php8.1-sockets php8.1-zip php8.1-pdo_mysql php8.1-xmlwriter php8.1-opcache php8.1-gmp php8.1-pdo_sqlite php8.1-sqlite3 php8.1-pcntl php8.1-fileinfo git mailcap caddy
RUN mkdir /www /wwwlogs /rdb
RUN mkdir -p /run/php /run/caddy/run/supervisor
COPY config/php-fpm.conf /etc/php8.1/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /www
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
