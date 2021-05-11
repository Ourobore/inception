NAME	= inception

all		: $(NAME)

$(NAME)	:
		  docker build -f srcs/requirements/nginx/Dockerfile -t nginx:inception .
		  docker run -d --name nginx_inception -p 80:80 nginx:inception

clean	:
		  docker rm $(docker ps -aq)

fclean	:
		  @make clean
		  docker rmi -f $(docker images -q);

re		: fclean all

.PHONY	: all clean fclean re