include srcs/.env
SRC = cd srcs && docker-compose -f ./docker-compose.yml 
all :
	cd srcs && docker-compose up --build
	mkdir -p srcs/$(DB_VOL)
	mkdir -p srcs/$(WP_VOL)
up :
	${SRC} up -d
start:
	${SRC} start
down:
	${SRC} down
ps:
	${SRC} ps

clean:
	rm -rf srcs/www
	rm -rf srcs/db

re: clean all