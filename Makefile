NAME	= inception

all		: $(NAME)

$(NAME)	:
		  docker build -f srcs/requirements/nginx/Dockerfile -t nginx:inception .
		  docker run -d --name nginx_inception -p 80:80 nginx:inception

<<<<<<< HEAD
clean	:
		  docker rm $(docker ps -aq)
=======
re		: fclean all
>>>>>>> ea9f18e9399f774c601455675e460eb69d30edff

fclean	:
		  @make clean
		  docker rmi -f $(docker images -q);

<<<<<<< HEAD
re		: fclean all

.PHONY	: all clean fclean re
=======
fclean	: docker rmi -f $(docker images -q)

.PHONY	: all re clean
>>>>>>> ea9f18e9399f774c601455675e460eb69d30edff
