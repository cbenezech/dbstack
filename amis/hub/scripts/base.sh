#!/bin/bash
set -e

# installing packages
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -o Dpkg::Options::=--force-confold -y \
    php \
    php-gd \
    php-curl \
    php-mbstring \
    php-intl \
    php-gmp \
    php-bcmath \
    php-imagick \
    php-xml \
    php-zip \
    php-soap \
    php-pgsql \
    php-pdo \
    php-gmp \
    php-bcmath \
    php-xml \
    redis-server \
    libzip-dev \
    libbz2-dev \
    zip \
    libxml2-dev \
    ffmpeg \
    libmagickcore-6.q16-6-extra \
    procps \
    libreoffice \
    imagemagick \
    certbot \
    python3-certbot-apache

mkdir -p /var/www/cache

systemctl stop apache2
systemctl enable apache2

systemctl stop redis-server
systemctl enable redis-server