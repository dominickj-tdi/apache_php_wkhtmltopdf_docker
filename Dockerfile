# The webdevops version we use normally uses debian 8, 
# which is too old for the pdf library to work correctly,
# so we are using a different (rather barebones) image.
FROM php:7.4-apache-buster
# Install pdf rendering library and dependencies, and some fonts
COPY wkhtmltox_0.12.6-1.buster_amd64.deb /setup/wkhtmltopdf.deb
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends zlib1g-dev libpng-dev libjpeg-dev fontconfig libfreetype6-dev fonts-liberation fonts-kristi fonts-croscore fonts-comic-neue libx11-6 libxext6 libxrender1 && \
    apt install -y /setup/wkhtmltopdf.deb && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /setup
# This image doesn't come with the pdo mysql driver by default, 
# nor does it come with the normal image processing features
# so we have to add those manually
RUN docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install pdo pdo_mysql exif gd
# Enable the use of .htaccess files
RUN sed -ri -e 's!AllowOverride None!AllowOverride All!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf