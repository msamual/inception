FROM alpine:3.12

RUN     apk update
RUN     apk add wget
RUN     apk add supervisor
RUN           apk add php7 php7-fpm php7-common php7-iconv php7-json \
              php7-gd php7-curl php7-xml php7-mysqli php7-imap \
              php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
              php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
              php7-ldap php7-ctype php7-dom php7-session php7-mbstring \
              php7-phar

RUN     mkdir -p var/www/html

RUN     chmod 777 var/www/html

EXPOSE  9000

COPY    launch.sh ./
COPY    php.ini etc/php7/
COPY    www.conf etc/php7/php-fpm.d/

CMD    	["/bin/sh", "launch.sh"]
