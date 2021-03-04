SOURCES					=	ft_strlen.s \
							ft_strcpy.s \
							ft_strcmp.s \
							ft_write.s

OBJECTS					=	$(SOURCES:.s=.o)

NAME					=	libasm.a
MAIN					=	main.c
FILE					=	a.out

COMPILE_ASM				=	nasm
COMPILE_C				=	gcc
REMOVE					=	rm -f

COMPILATION_FLAGS_ASM	=	-f elf64
COMPILATION_FLAGS_C		=	-Wall -Wextra -Werror -L . -l asm

.s.o:
	$(COMPILE_ASM) $(COMPILATION_FLAGS_ASM) $< -o $(<:.s=.o)

$(NAME): $(OBJECTS)
	ar rcs $(NAME) $(OBJECTS)

all: $(NAME)

clean:
	$(REMOVE) $(OBJECTS)

fclean: clean
	$(REMOVE) $(NAME) $(FILE)

re: fclean all

$(FILE): $(NAME) $(MAIN)
	$(COMPILE_C) $(MAIN) $(COMPILATION_FLAGS_C) -o $(FILE)

main: $(FILE)

run: main
	./$(FILE)

.PHONY: all clean fclean re main run
