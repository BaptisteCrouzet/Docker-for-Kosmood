# Set up the arguments
ARG PHP_TIMEZONE
ARG PHP_INI_PATH

# From the php specified version
FROM php:7.4-fpm

# Author
LABEL Baptiste Crouzet <mailpro@baptistecrouzet.fr>

# Copy the php.ini config file somewhere in order to enbled it for our app
COPY  ${PHP_INI_PATH} /usr/local/etc/php/conf.d/docker-php-config.ini

# Install libraries
RUN apt-get update && apt-get install -y \
    inkscape \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxslt1-dev \
    libmagickwand-dev \
    acl \
    curl \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

# Install PHP extensions and enable it
RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install \
    pdo pdo_mysql zip xsl gd intl opcache exif mbstring

RUN apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN pecl install \
    xdebug \
    imagick

RUN docker-php-ext-enable \
    xdebug \
    imagick


RUN pecl install \
        apcu-5.1.19 \
    ; \
    pecl clear-cache; \
    docker-php-ext-enable \
        apcu \
    ;

# Set timezone for PHP
RUN ln -snf /usr/share/zoneinfo/${PHP_TIMEZONE} /etc/localtime && echo ${PHP_TIMEZONE} > /etc/timezone \
    && printf '[PHP]\ndate.timezone = "%s"\n', ${PHP_TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
    && "date"

# Install composer + prestissimo in order to download composer dependencies in parallel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer --version
    # && composer global require hirak/prestissimo

# CMD composer install ; wait-for-it database:3306 -- bin/console doctrine:migrations:migrate ;  php-fpm

# Set the current user
USER www-data

# Sets the current directory
WORKDIR /var/www/symfony

# Expose port 9000
EXPOSE 9000
