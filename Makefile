DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml
DOCKER_COMPOSE_CMD=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: up

up:
	$(DOCKER_COMPOSE_CMD) up -d --build

down:
	$(DOCKER_COMPOSE_CMD) down

re: down up