# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ntairatt <ntairatt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/29 12:21:09 by ntairatt          #+#    #+#              #
#    Updated: 2023/06/02 15:57:19 by ntairatt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a

CC	=	cc

CFLAGS	=	-Wall -Wextra -Werror -I$(DIR_INC)

SRCS	=	ft_is/ft_isalpha.c \
				ft_is/ft_isdigit.c \
				ft_is/ft_isalnum.c \
				ft_is/ft_isascii.c \
				ft_is/ft_isprint.c \
				ft_is/ft_toupper.c \
				ft_is/ft_tolower.c \
				ft_mem/ft_memset.c \
				ft_mem/ft_memcpy.c \
				ft_mem/ft_memmove.c \
				ft_mem/ft_memchr.c \
				ft_mem/ft_memcmp.c \
				ft_str/ft_strlcpy.c \
				ft_str/ft_strlcat.c \
				ft_str/ft_strlen.c \
				ft_str/ft_strchr.c \
				ft_str/ft_strrchr.c \
				ft_str/ft_strncmp.c \
				ft_str/ft_strnstr.c \
				ft_str/ft_strtrim.c \
				ft_str/ft_strmapi.c \
				ft_str/ft_striteri.c \
				ft_str/ft_strdup.c \
				ft_put/ft_putchar_fd.c \
				ft_put/ft_putstr_fd.c \
				ft_put/ft_putendl_fd.c \
				ft_put/ft_putnbr_fd.c \
				ft_lst/ft_lstnew.c \
				ft_lst/ft_lstadd_front.c \
				ft_lst/ft_lstsize.c \
				ft_lst/ft_lstlast.c \
				ft_lst/ft_lstadd_back.c \
				ft_lst/ft_lstdelone.c \
				ft_lst/ft_lstclear.c \
				ft_lst/ft_lstiter.c \
				ft_lst/ft_lstmap.c \
				gnl/get_next_line.c \
				gnl/get_next_line_utils.c \
				printf/ft_printf.c \
				printf/format_c.c \
				printf/format_d.c \
				printf/format_p.c \
				printf/format_s.c \
				printf/format_u.c \
				printf/format_x.c \
				ft_bzero.c ft_atoi.c ft_calloc.c \
				ft_substr.c ft_split.c ft_itoa.c

DIR_INC	=	include
DIR_SRC	=	src

COLOR_GREEN	=	\033[0;32m

BOLD_GREEN	=	\033[1;32m

BOLD_RED	=	\033[1;31m

AR	=	ar -rcs

RM	=	rm -f

OBJS	=	$(addprefix $(DIR_SRC)/, $(SRCS:.c=.o))

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
		@echo "$(BOLD_RED)object files of libft has removed"


fclean:
		@clear
		@$(RM) $(OBJS) $(NAME)
		@echo "$(BOLD_RED)object files of libft has removed"
		@echo "$(BOLD_RED)libft has removed"

re: fclean all

norm:
	@clear
	@printf "$(BOLD_GREEN)Norminette is Checking......\n"
	@echo "-----------------------------------------------"
	@norminette include
	@norminette src
	@echo "-----------------------------------------------"
