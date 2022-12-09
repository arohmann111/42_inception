DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml
DOCKER_COMPOSE_CMD=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: up

up:
	mkdir -p /home/arohmann/data/db_volume
	mkdir -p /home/arohmann/data/wp_nginx_volume
	$(DOCKER_COMPOSE_CMD) up -d --build

down:
	$(DOCKER_COMPOSE_CMD) down

clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	sudo rm -rf /home/arohmann/data/db_volume
	sudo rm -rf /home/arohmann/data/wp_nginx_volume

system_clean: down
	sudo $(RM) -r /home/arohmann/data/
	docker builder prune -a
	docker system prune -a

nginx_log:
	docker container exec -it nginx cat /var/log/nginx/access.log
	docker container exec -it nginx cat /var/log/nginx/error.log

wordpress_log:
	docker container exec -it wordpress cat /
	docker container exec -it wordpress cat /
re: down up