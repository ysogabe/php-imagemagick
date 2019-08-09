FROM ubuntu:16.04

LABEL maintainer="y.sogabe <y.sogabe@gmail.com>" \
      description="PHP7.3 include ImageMagick"

ENV LC_ALL C.UTF-8

# Install PHP7.3 ImageMgick
RUN apt update \
 && apt install -y \
    software-properties-common \
 && add-apt-repository -y ppa:ondrej/php \
 && apt update \
 && apt install -y \
    php7.3 \
    php7.3-fpm \
    php7.3-mysq \
    php7.3-mbstring \
    php7.3-zip \
    php7.3-xml \
    php7.3-dev \
    imagemagick \
    libmagickwand-dev \
    pkg-config 
RUN pecl install imagick

# ImageMgick INI
RUN echo "; configuration for php imageMagick modul" > /etc/php/7.3/mods-available/imagemagick.ini \
 && echo "; priority=20" >> /etc/php/7.3/mods-available/imagemagick.ini \
 && echo "extension=imagick.so" >> /etc/php/7.3/mods-available/imagemagick.ini \
 && ln -s /etc/php/7.3/mods-available/imagemagick.ini /etc/php/7.3/cli/conf.d/20-imagemagick.ini \
 && ln -s /etc/php/7.3/mods-available/imagemagick.ini /etc/php/7.3/fpm/conf.d/20-imagemagick.ini

# Install composer
RUN cd /tmp \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer
