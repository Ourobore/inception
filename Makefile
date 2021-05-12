NAME	= inception

all		: $(NAME)

$(NAME)	:
		  docker build -f srcs/requirements/nginx/Dockerfile -t nginx:inception .
		  docker run -it --name nginx -p 80:80 -p 443:443 nginx:inception

#rajouter un make build

up		:
		  docker-compose -f srcs/docker-compose.yaml up -d

down	:
		  docker-compose -f srcs/docker-compose.yaml down

stop	:
		  -docker stop nginx

clean	: stop
		  -docker rm nginx

fclean	: clean
		  -docker rmi -f nginx:inception alpine

re		: fclean all

.PHONY	: all clean fclean re