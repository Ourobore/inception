ALPINE_VERSION	= $$(grep ALPINE_VERSION srcs/.env | cut -d'=' -f2)

DOCKER_COMPOSE	= docker-compose --project-directory srcs \
		  		  -f srcs/docker-compose.yaml

NAME	= inception

all		: $(NAME)

$(NAME)	: build

build	:
		  $(DOCKER_COMPOSE) build 

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

re		: clean all

.PHONY	: all build up down stop ps clean re