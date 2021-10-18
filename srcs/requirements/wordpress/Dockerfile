FROM alpine:3.12

RUN     apk update
RUN     apk add wget
RUN     apk add supervisor
RUN     apk add php7-fpm php7-mysqli php7-iconv php7-json

RUN     mkdir -p var/www/html
RUN     wget -q https://wordpress.org/latest.tar.gz
RUN     tar -xzf latest.tar.gz && rm -rf latest.tar.gz

RUN     chmod 777 var/www/html

EXPOSE  9000

COPY    launch.sh ./
COPY    wp-config.php ./
COPY    php.ini etc/php7/
COPY    www.conf etc/php7/php-fpm.d/

CMD    	["/bin/sh", "launch.sh"]