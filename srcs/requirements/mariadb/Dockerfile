FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add mariadb mariadb-client openrc bash;


RUN mkdir "/run/mysqld" && chown -R mysql /run/mysqld

COPY    my.cnf            ./etc
RUN	chown mysql:mysql ./etc/my.cnf
RUN     chmod 600 /etc/my.cnf
COPY    start.sh          ./
RUN	chmod 777 start.sh

EXPOSE 3306

CMD ["sh", "start.sh"]
