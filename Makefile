SHELL = /bin/bash
NAME = libft.a

AR = ar rc
CC = clang
FLAGS = -Wall -Werror -Wextra
FSANITIZE = -fsanitize=address -g3
RM = rm -rf

INCLUDE = libft.h

SRCS = ft_isalpha.c

OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) $(INCLUDE)
	@$(AR) $(NAME) $(OBJS)

sanitize:
	@$(CC) $(FLAGS) $(FSANITIZE) -c $(SRCS)
	@$(AR) $(NAME) $(OBJS)

%.o: %.c
	@$(CC) $(FLAGS) -c $<

clean:
	@$(RM) $(OBJS)

fclean: clean
	@$(RM) $(NAME)

re: fclean all

.PHONY: all %.o clean fclean re