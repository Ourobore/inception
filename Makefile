NAME	= inception

all		: $(NAME)

$(NAME)	:
		  docker build -f srcs/requirements/nginx/Dockerfile -t nginx:inception .
		  docker run -it --name nginx -p 80:80 -p 443:443 nginx:inception

stop	:
		  -docker stop nginx

clean	: stop
		  -docker rm nginx

fclean	: clean
		  -docker rmi -f nginx:inception alpine

re		: fclean all

.PHONY	: all clean fclean re