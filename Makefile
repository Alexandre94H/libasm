SOURCES				=	ft_strlen.s

OBJECTS				=	${SOURCES:.s=.o}

NAME				=	libasm.a

COMPILE				=	nasm
REMOVE				=	rm -f

COMPILATION_FLAGS	=	-f macho64

.s.o:
	${COMPILE} ${COMPILATION_FLAGS} $< -o ${<:.s=.o}

${NAME}: ${OBJECTS}
	ar rcs ${NAME} ${OBJECTS}

all: ${NAME}

clean:
	${REMOVE} ${OBJECTS}

fclean: clean
	${REMOVE} ${NAME}

re: fclean all

.PHONY: all clean fclean re