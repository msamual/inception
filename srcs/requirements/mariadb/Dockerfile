FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add mariadb mariadb-client openrc bash;

RUN mkdir "/run/mysqld" && chown -R mysql /run/mysqld

COPY	wordpress.sql   ./
COPY    my.cnf          ./etc
COPY    start.sh        ./

EXPOSE 3306

CMD ["sh", "start.sh"]