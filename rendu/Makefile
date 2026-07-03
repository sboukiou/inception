COMPOSE=docker compose -f srcs/docker-compose.yml --env-file ./srcs/.env


build:
	$(COMPOSE) build
up: build
	$(COMPOSE) up
down:
	$(COMPOSE) down

all:  up

clean: down
	$(COMPOSE) rm -v

fclean: clean
	sudo rm -rf /home/sboukiou/data/mariadb/*
	sudo rm -rf /home/sboukiou/data/wordpress/*

re: fclean all
