FROM wordpress:latest

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl \
    && docker-php-ext-install zip opcache mysqli

# Copy custom wp-config.php if present
COPY wp-config.php /var/www/html/wp-config.php

# Copy custom content if present
COPY wp-content /var/www/html/wp-content

# Set permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"] 