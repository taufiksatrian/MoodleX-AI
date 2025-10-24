# ======================================
# Dockerfile - Moodle for Render
# ======================================
FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev zip unzip git \
    libxml2-dev libonig-dev libcurl4-openssl-dev libxslt-dev libicu-dev \
    mariadb-client vim && \
    docker-php-ext-install mysqli pdo pdo_mysql gd zip intl xml soap opcache

# Enable Apache rewrite
RUN a2enmod rewrite

# Set working dir
WORKDIR /var/www/html

# Copy Moodle source
COPY . /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
