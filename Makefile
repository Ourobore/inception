COMPOSE_VERSION = $$(grep COMPOSE_VERSION srcs/.env | cut -d'=' -f2)
ALPINE_VERSION	= $$(grep ALPINE_VERSION srcs/.env | cut -d'=' -f2)

DOCKER_COMPOSE	= docker-compose --project-directory srcs \
		  		  -f srcs/docker-compose.yaml

NAME	= inception

all		: $(NAME)

$(NAME)	: build

build	:
		  $(DOCKER_COMPOSE) build 

setup	:
		  sudo usermod -aG docker $$USER
		  sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$$(uname -s)-$$(uname -m)" -o /usr/local/bin/docker-compose
		  sudo chmod +x /usr/local/bin/docker-compose
		  #sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

up		:
		  $(DOCKER_COMPOSE) up -d

down	:
		  $(DOCKER_COMPOSE) down

ps		:
		  $(DOCKER_COMPOSE) ps

stop	:
		  $(DOCKER_COMPOSE) stop 

clean	:
		  -docker rmi -f alpine:${ALPINE_VERSION}
		  -docker rmi -f nginx:inception

re		: clean build

.PHONY	: all build setup up down stop ps clean re