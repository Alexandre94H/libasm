SOURCES					=	ft_strlen.s

OBJECTS					=	${SOURCES:.s=.o}

NAME					=	libasm.a
MAIN					=	main.c

COMPILE_ASM				=	nasm
COMPILE_C				=	gcc
REMOVE					=	rm -f

COMPILATION_FLAGS_ASM	=	-f elf64
COMPILATION_FLAGS_C		=	-Wall -Wextra -Werror -L . -l asm -no-pie 

.s.o:
	${COMPILE_ASM} ${COMPILATION_FLAGS_ASM} $< -o ${<:.s=.o}

${NAME}: ${OBJECTS}
	ar rcs ${NAME} ${OBJECTS}

all: ${NAME}

clean:
	${REMOVE} ${OBJECTS}

fclean: clean
	${REMOVE} ${NAME}

re: fclean all

${MAIN}:
	${COMPILE_C} ${MAIN} ${COMPILATION_FLAGS_C}

main: all ${MAIN}

run: main
	./a.out

.PHONY: all clean fclean re main run