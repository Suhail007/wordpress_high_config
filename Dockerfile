FROM wordpress:latest

# Install required packages and PHP OPcache
RUN apt-get update && apt-get install -y \
    vim \
    unzip \
    curl \
    && docker-php-ext-install opcache

# Switch Apache to mpm_worker for better performance
RUN a2dismod mpm_prefork && a2enmod mpm_worker

# Overwrite mpm_worker.conf
RUN echo "<IfModule mpm_worker_module>\n\
    ServerLimit             64\n\
    StartServers            4\n\
    MinSpareThreads         50\n\
    MaxSpareThreads         150\n\
    ThreadLimit             64\n\
    ThreadsPerChild         64\n\
    MaxRequestWorkers       512\n\
    MaxConnectionsPerChild  1000\n\
</IfModule>" > /etc/apache2/mods-available/mpm_worker.conf

# PHP performance tuning
RUN echo "upload_max_filesize = 512M" >> /usr/local/etc/php/php.ini && \
    echo "post_max_size = 512M" >> /usr/local/etc/php/php.ini && \
    echo "memory_limit = 1024M" >> /usr/local/etc/php/php.ini && \
    echo "max_execution_time = 300" >> /usr/local/etc/php/php.ini && \
    echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini && \
    echo "opcache.memory_consumption=256" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini && \
    echo "opcache.max_accelerated_files=10000" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

# Copy custom configuration files
COPY wp-config-custom.php /usr/src/wordpress/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

CMD ["apache2-foreground"] 