FROM php:8.0.2-apache
WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite
# RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb
# RUN a2ensite default-ssl


# Linux Library
RUN apt-get update -y && apt-get install -y \
    git \
    libicu-dev \
    curl \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

# Composer
COPY --from=composer:2.2.6 /usr/bin/composer /usr/bin/composer
# PHP Extension
RUN docker-php-ext-install gettext intl pdo_mysql gd
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
#  RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/public

# RUN sed -i '/SSLCertificateFile.*snakeoil\.pem/c\SSLCertificateFile \/etc\/ssl\/softcenter_ictc\/softcenter_ictc_go_tz.crt' /etc/apache2/sites-available/default-ssl.conf
# RUN sed -i '/SSLCertificateKeyFile.*snakeoil\.key/c\SSLCertificateKeyFile \/etc\/ssl\/private\/softcenter_ictc_go_tz.key' /etc/apache2/sites-available/default-ssl.conf

EXPOSE 80
EXPOSE 443
CMD ["apache2-foreground"]