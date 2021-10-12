
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wp_db;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wp_db TO 'msamual'@'%' IDENTIFIED BY '3347' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
rc-service mariadb stop
/usr/bin/mysqld_safe  --datadir="/var/lib/mysql"
