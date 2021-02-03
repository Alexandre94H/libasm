SOURCES				=	ft_strlen.s

OBJECTS				=	${SOURCES:.s=.o}

NAME				=	libasm.a

COMPILE				=	nasm
REMOVE				=	rm -f

ifeq (${OS},Windows_NT)
    uname_S := Windows
else
    uname_S := ${shell uname -s}
endif

ifeq (${uname_S}, Windows)
    format = win64
else ifeq ($(uname_S), Linux)
    format = elf64
else ifeq ($(uname_S), Darwin)
    format = macho64
endif

COMPILATION_FLAGS	=	-f ${format}

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