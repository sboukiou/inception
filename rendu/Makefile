COMPOSE=docker compose -f srcs/docker-compose.yml --env-file ./srcs/.env


build: all
	$(COMPOSE) build

all:
	$(COMPOSE) up --build
	
down:
	$(COMPOSE) down -v

clean: down
	$(COMPOSE) rm mariadb nginx wordpress

fclean: clean
	sudo rm -rf /home/sboukiou/data/mariadb/*
	sudo rm -rf /home/sboukiou/data/wordpress/*

re: fclean all
