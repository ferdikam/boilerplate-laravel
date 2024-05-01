FROM dunglas/frankenphp:1.1.4-php8.3

ENV SERVER_NAME="http://"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    git \
    unzip \
    librabbitmq-dev \
    libpq-dev

RUN install-php-extensions \
    gd \
    pcntl \
    opcache \
    pgsql \
    pdo_pgsql \
    sockets \
    redis \
    amqp

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
WORKDIR /app

RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini; \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' $PHP_INI_DIR/php.ini;

CMD /bin/bash -c "chown -R www-data:www-data /app/storage/logs /app/storage/app /app/storage/framework /app/bootstrap/cache \
    && php artisan migrate \
    && php artisan cache:clear \
    && frankenphp run --config /etc/caddy/Caddyfile --adapter caddyfile"
