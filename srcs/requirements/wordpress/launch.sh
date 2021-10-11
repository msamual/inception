#/bin/sh/


mv  -f wordpress /var/www/html/;
mv  -f index.php /var/www/html/;
mv  -f index.html /var/www/html/;
mv  -f wp-config.php /var/www/html/wordpress/;

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar
RUN     mv wp-cli.phar /usr/local/bin/wp


chmod 777 /var/www/html/wordpress
cd /var/www/html/wordpress

wp core download    --allow-root \
          --quiet
wp core config      --allow-root \
          --skip-check \
          --dbname=$DB_NAME \
          --dbuser=$DB_USER \
          --dbpass=$DB_PASSWORD \
          --dbhost=$DB_HOST \
          --dbprefix=$DB_PREFIX \
          --quiet
wp core install     --allow-root \
          --url=$DOMAIN_NAME \
          --title="ecole 42" \
          --admin_user="msamual" \
          --admin_password="msamual" \
          --admin_email="msamual@student.21-school.ru" \
          --quiet
wp user create      yarik yarik@example.com \
          --role=author \
          --user_pass="yarik" \
          --allow-root \
          --quiet
wp user create      dimon dimon@example.com \
          --role=author \
          --user_pass="dimon" \
          --allow-root \
          --quiet
wp user create      dmitri dmitri@example.com \
          --role=author \
          --user_pass="dmitri" \
          --allow-root \
          --quiet

php-fpm7 -F -R --nodaemonize;
