# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: saugustu <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/03 01:27:11 by saugustu          #+#    #+#              #
#    Updated: 2020/11/03 01:27:59 by saugustu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

LIST =		ft_atoi.c		ft_bzero.c		ft_calloc.c\
			ft_isalnum.c	ft_isalpha.c	ft_isascii.c\
			ft_isdigit.c	ft_isprint.c	ft_isspace_bonus.c\
			ft_itoa.c		ft_memccpy.c	ft_memchr.c\
			ft_memcmp.c		ft_memcpy.c		ft_memmove.c\
			ft_memrchr_bonus.c	ft_memrcpy_bonus.c	ft_memset.c\
			ft_putchar_fd.c	ft_putendl_fd.c	ft_putnbr_fd.c\
			ft_putstr_fd.c	ft_split.c		ft_strchr.c\
			ft_strdup.c		ft_strjoin.c	ft_strlcat.c\
			ft_strlcpy.c	ft_strlen.c		ft_strmapi.c\
			ft_strncmp.c		ft_strnlen_bonus.c\
			ft_strnstr.c	ft_strrchr.c	ft_strtrim.c\
			ft_substr.c		ft_tolower.c	ft_toupper.c

LIST_B =	ft_lstadd_back.c	ft_lstlast.c	ft_lstsize.c\
			ft_lstadd_front.c	ft_lstnew.c		ft_lstdelone.c\
			ft_lstclear.c		ft_lstiter.c	ft_lstmap.c

OBJ = $(patsubst %.c,%.o,$(LIST))
OBJ_B = $(patsubst %.c,%.o,$(LIST_B))

D_FILES = $(patsubst %.c,%.d,$(LIST) $(LIST_B))

OPTFLAGS = -O2
FLAGS = -Wall -Wextra -Werror

all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(NAME) $?

%.o : %.c
	gcc $(FLAGS) $(OPTFLAGS) -c $< -o $@ -MD

include $(wildcard $(D_FILES))

bonus :
	@make OBJ="$(OBJ_B)" all

clean :
	@rm -f $(OBJ) $(OBJ_B) $(D_FILES)

fclean : clean
	@rm -f $(NAME)

re : fclean all

.PHONY : all clean fclean re bonus
