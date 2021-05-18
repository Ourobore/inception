COMPOSE_VERSION 	= $$(grep COMPOSE_VERSION srcs/.env | cut -d'=' -f2)
ALPINE_VERSION		= $$(grep ALPINE_VERSION srcs/.env | cut -d'=' -f2)
NGINX_VERSION		= $$(grep NGINX_VERSION srcs/.env | cut -d'=' -f2)
WORDPRESS_VERSION	= $$(grep WORDPRESS_VERSION srcs/.env | cut -d'=' -f2)

DOCKER_COMPOSE	= docker-compose --project-directory srcs \
		  		  -f srcs/docker-compose.yaml

NAME	= inception

all		: help

$(NAME)	: build

help	: ## Print command manual
		  @echo "Makefile commands:"
		  @echo ""
		  @echo "version:	Show services versions"
		  @echo "setup:		Update docker-compose installation"
		  @echo ""
		  @echo "build:		Build the project with docker-compose build"
		  @echo "up:		Start services in detached mode with docker-compose up"
		  @echo "down:		Remove services with docker-compose down"
		  @echo "ps:		Show running services with docker-compose ps"
		  @echo "stop:		Stop running services with docker-compose stop"
		  @echo ""
		  @echo "clean:		Remove project build images"
		  @echo "re:		Run clean and build command to re make the project from scratch"


version	: ## Print services versions
		  @echo "Services versions"
		  @echo ""
		  @echo "compose version - ${COMPOSE_VERSION}"
		  @echo "alpine version - ${ALPINE_VERSION}"
		  @echo "nginx version - ${NGINX_VERSION}"
		  @echo "wordpress version - ${WORDPRESS_VERSION}"

setup	: ## Update docker-compose installation
		  sudo service nginx stop
		  sudo usermod -aG docker $$USER
		  sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
		  sudo chmod +x /usr/local/bin/docker-compose
		  #sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

build	: ## Build the project with docker-compose
		  $(DOCKER_COMPOSE) build 

up		: ## Starts services containers
		  $(DOCKER_COMPOSE) up -d

down	: ## Remove services
		  $(DOCKER_COMPOSE) down

ps		: ## Show services
		  $(DOCKER_COMPOSE) ps

stop	: ## Stop services
		  $(DOCKER_COMPOSE) stop 

clean	: ## Remove docker images
		  -docker rmi -f alpine:${ALPINE_VERSION}
		  -docker rmi -f nginx:inception
		  -docker rmi -f wordpress:inception
		  -docker rmi -f mariadb:inception
		  -docker volume rm wordpress_files

re		: clean build

.PHONY	: all build help version setup up down stop ps clean re