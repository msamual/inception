FROM	alpine:3.12

RUN		apk update
RUN     apk upgrade
RUN		apk add nginx;
RUN     apk add openssl
RUN 	openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/key.pem -out etc/nginx/cert.pem -days 365 -subj '/C=RU/ST=RT/L=KAZAN/O=SCHOOL21/OU=21SCHOOL/CN=MSAMUAL' -nodes

RUN		mkdir -p /run/nginx
RUN		mkdir -p /data/www/html


COPY	nginx.conf	/etc/nginx/

EXPOSE  443 80 9000

CMD		["nginx", "-g", "daemon off;"]
