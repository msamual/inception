#/bin/sh/


mkdir -p  /var/www/html/wordpress
chmod 777 /var/www/html/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


cd /var/www/html/wordpress

wp core download    --allow-root \
          --quiet
wp core config      --allow-root \
          --skip-check \
	  --dbname=$WP_DB_NAME \
	  --dbuser=$MYSQL_USER \
          --dbpass=3347 \
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
