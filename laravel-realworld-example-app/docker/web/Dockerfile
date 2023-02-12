FROM php:8.1-cli

RUN ["/bin/bash", "-c", "apt update -y && apt install zlib1g-dev libzip-dev libpng-dev -y && curl https://getcomposer.org/installer| php \
&& mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer"]

RUN docker-php-ext-install pdo pdo_mysql mysqli bcmath zip gd calendar sockets


# COPY run.sh /tmp

WORKDIR /var/www/laravel_app/

EXPOSE 8000

ENTRYPOINT  ["/bin/bash", "-c", "composer create-project && php artisan migrate:refresh --seed && chown -R www-data:www-data /var/www/laravel_app && chmod -R ug+rwx /var/www/laravel_app"]

