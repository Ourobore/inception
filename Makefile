NAME	= inception

all		: $(NAME)

$(NAME)	: docker-compose

re		: fclean all

clean	: 

fclean	: docker rmi -f $(docker images -q)

.PHONY	: all re clean