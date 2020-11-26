FROM php:7.2-apache
COPY . /var/www/html/
RUN apt update -y && apt upgrade -y
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]