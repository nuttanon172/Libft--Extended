# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ntairatt <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/29 12:21:09 by ntairatt          #+#    #+#              #
#    Updated: 2023/05/29 12:32:28 by ntairatt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = cc

CFLAGS = -Wall -Wextra -Werror -I$(DIR_INC)

SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
		ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
		ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c \
		ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c \
		ft_atoi.c ft_calloc.c ft_strdup.c \
		ft_substr.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
		ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
		get_next_line.c get_next_line_utils.c \
		format_c.c format_d.c format_p.c format_s.c format_u.c format_x.c ft_printf.c \
		ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
		ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c \
		ft_lstiter.c ft_lstmap.c

DIR_INC = include
DIR_SRC = src

COLOR_GREEN	= \033[0;32m

BOLD_GREEN	= \033[1;32m

BOLD_RED = \033[1;31m

AR = ar -rcs

RM = rm -rf

OBJS = $(addprefix $(DIR_SRC)/, $(SRCS:.c=.o))

%.o: %.c
	@printf "$(COLOR_GREEN)Generating libft... %-30s\r" $@
	@${CC} ${CFLAGS} -c $< -o $@

$(NAME): $(OBJS)
		@$(AR) $(NAME) $(OBJS)
		@echo "$(BOLD_GREEN)-----------------------------------------------"
		@echo "libft is ready"
		@echo "-----------------------------------------------"

.PHONY: all clean fclean re norm
all: $(NAME)

clean:
		@$(RM) $(OBJS)
		@clear
		@echo "$(BOLD_RED)object files of libft has removed"


fclean: clean
		@$(RM) $(NAME)
		@echo "$(BOLD_RED)libft has removed"

re: fclean all

norm:
	@clear
	@printf "$(BOLD_GREEN)Norminette is Checking......\n"
	@echo "-----------------------------------------------"
	@norminette $(addprefix $(DIR_SRC)/, $(SRCS))
	@echo "-----------------------------------------------"
