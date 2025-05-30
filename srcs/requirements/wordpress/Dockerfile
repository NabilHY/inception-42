FROM debian:bullseye

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    apache2 \
    curl \
    sudo \
    ghostscript \
    libapache2-mod-php \
    php \
    php-bcmath \
    php-curl \
    php-imagick \
    php-intl \
    php-json \
    php-mbstring \
    php-mysql \
    php-xml \
    php-zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# RUN mkdir /etc/apache2/sites-available

COPY ./tools/wordpress.conf /etc/apache2/sites-available/wordpress.conf

RUN mkdir -p /srv/www
RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www
RUN chown -R www-data:www-data /srv/www
RUN chown -R www-data:www-data /srv/www && \
    chmod -R 755 /srv/www

RUN curl https://wordpress.org/latest.tar.gz | tar zx --strip-components=1 -C /srv/www

RUN sudo a2ensite wordpress
RUN sudo a2enmod rewrite
RUN sudo a2dissite 000-default

CMD ["apache2ctl", "-D", "FOREGROUND"]




