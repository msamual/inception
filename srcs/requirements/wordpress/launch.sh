#/bin/sh/


mv  -f wordpress /var/www/html/;
mv  -f wp-config.php /var/www/html/wordpress/;

chmod 777 /var/www/html/wordpress

php-fpm7 -F -R --nodaemonize;
