include srcs/.env
SRC = cd srcs && docker-compose -f ./docker-compose.yml 
all :
	mkdir -p $(DB_VOL)
	cp -r srcs/requirements/mariadb/db/* $(DB_VOL)
	mkdir -p $(WP_VOL)
	cd srcs && docker-compose up --build
up :
	${SRC} up -d
start:
	${SRC} start
down:
	${SRC} down
ps:
	${SRC} ps

clean:
	rm -rf $(WP_VOL)
	rm -rf $(DB_VOL)

re: clean all
