# Compiling the Scaling programme


CFLAGS = -g -O0 -Wall -Wextra -pedantic -MD
CC = gcc
SOURCES_C = $(wildcard src/*.c)
OBJS_O = $(SOURCES_C:.c=.o)
RM = /bin/rm -rf
FILE = "cpus.txt"

all: run

file: ${FILE}

${FILE}:
	touch ${FILE}


run: $(OBJS_O) file
	$(CC) -o run $(OBJS_O) -pthread 

%.o: %.c
	$(CC) $(CFLAGS) -c -o $(@) $<



clean:
	${RM} $(OBJS_O) ${FILE} src/*.d run
