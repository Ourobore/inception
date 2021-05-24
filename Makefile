COMPOSE_VERSION 	= $$(grep COMPOSE_VERSION srcs/.env | cut -d'=' -f2)
ALPINE_VERSION		= $$(grep ALPINE_VERSION srcs/.env | cut -d'=' -f2)
NGINX_VERSION		= $$(grep NGINX_VERSION srcs/.env | cut -d'=' -f2)
WORDPRESS_VERSION	= $$(grep WORDPRESS_VERSION srcs/.env | cut -d'=' -f2)

MYSQL_DATABASE		= $$(grep MYSQL_DATABASE srcs/.env | cut -d'=' -f2)
MYSQL_ROOT_PASSWORD	= $$(grep MYSQL_ROOT_PASSWORD srcs/.env | cut -d'=' -f2)
MYSQL_USER			= $$(grep MYSQL_USER srcs/.env | cut -d'=' -f2)
MYSQL_PASSWORD		= $$(grep MYSQL_PASSWORD srcs/.env | cut -d'=' -f2)

LOGIN				= $$(grep LOGIN srcs/.env | cut -d'=' -f2)

WORDPRESS_FILES		= /home/$(LOGIN)/data/wordpress_files
WORDPRESS_DATABASE	= /home/$(LOGIN)/data/wordpress_database

DOCKER_COMPOSE		= docker-compose --project-directory srcs \
		  		  		-f srcs/docker-compose.yaml

NAME	= inception

all		: help

$(NAME)	: build

help	: ## Print command manual
		  @echo "Project by lchapren@student.42.fr"
		  @echo ""
		  @echo "Makefile commands:"
		  @echo ""
		  @echo "version:	Show services versions"
		  @echo "variable:	Show project variables"
		  @echo "setup:		Update docker-compose installation"
		  @echo ""
		  @echo "build:		Build the project with docker-compose build"
		  @echo "up:		Start services in detached mode with docker-compose up"
		  @echo "down:		Remove services with docker-compose down"
		  @echo "ps:		Show running services with docker-compose ps"
		  @echo "stop:		Stop running services with docker-compose stop"
		  @echo ""
		  @echo "ilean:		Remove project build images"
		  @echo "vlean:		Remove project volumes"
		  @echo "clean:		Remove project images and volumes"
		  @echo "re:		Run clean and build command to re make the project from scratch"


version	: ## Print services versions
		  @echo "Services versions"
		  @echo ""
		  @echo "compose version - $(COMPOSE_VERSION)"
		  @echo "alpine version - $(ALPINE_VERSION)"
		  @echo "nginx version - $(NGINX_VERSION)"
		  @echo "wordpress version - $(WORDPRESS_VERSION)"

variable: ## Print project variables
		  @echo "Project variables"
		  @echo ""
		  @echo "MYSQL_DATABASE - $(MYSQL_DATABASE)"
		  @echo "MYSQL_ROOT_PASSWORD - $(MYSQL_ROOT_PASSWORD)"
		  @echo "MYSQL_USER - $(MYSQL_USER)"
		  @echo "MYSQL_PASSWORD - $(MYSQL_PASSWORD)"

setup	: ## Update docker-compose installation
		  -sudo adduser $(LOGIN)
		  sudo usermod -aG docker $(LOGIN)
		  sudo usermod -aG docker $$USER
		  sudo service nginx stop
		  sudo curl -L "https://github.com/docker/compose/releases/download/$(COMPOSE_VERSION)/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
		  sudo chmod +x /usr/local/bin/docker-compose

build	: ## Build the project with docker-compose
		  sudo mkdir -p $(WORDPRESS_FILES) $(WORDPRESS_DATABASE)
		  $(DOCKER_COMPOSE) build 

up		: ## Starts services containers
		  $(DOCKER_COMPOSE) up -d

down	: ## Remove services
		  $(DOCKER_COMPOSE) down

ps		: ## Show services
		  $(DOCKER_COMPOSE) ps

stop	: ## Stop services
		  $(DOCKER_COMPOSE) stop 

iclean	: ## Remove docker images
		  -docker rmi -f alpine:$(ALPINE_VERSION)
		  -docker rmi -f nginx:inception
		  -docker rmi -f wordpress:inception
		  -docker rmi -f mariadb:inception

vclean	: ## Remove docker volumes
		  -docker volume rm wordpress_files
		  -docker volume rm wordpress_database

clean	: iclean vclean
		  sudo rm -rf /home/$(LOGIN)/data
		  sudo userdel lchapren

re		: clean build

.PHONY	: all build help version setup up down stop ps iclean vclean clean re