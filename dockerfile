FROM php:alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install opcache
COPY . /var/www
RUN composer install -d /var/www
WORKDIR /var/www
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www"]
