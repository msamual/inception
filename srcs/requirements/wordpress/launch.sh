#/bin/sh/


mv  -f wordpress /var/www/html/;
mv  -f index.php /var/www/html/;
mv  -f index.html /var/www/html/;
mv  -f wp-config.php /var/www/html/wordpress/;

php-fpm7 -F -R --nodaemonize;
