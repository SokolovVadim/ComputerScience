# Compiling the Hash Table project

# Commonly used variables

OUTPATH = build
CFLAGS = -g -O0 -Wall -Wextra -pedantic -MD
CC     = gcc
SOURCES_C = $(wildcard src/*.c)
OBJS_O    = $(SOURCES_C:.c=.o)
#INCLUDES = $(wildcard include/*.h)
RM        = /bin/rm -rf

all: run gcov a.out

dirs: ${OUTPATH}

${OUTPATH}:
	mkdir -p ${OUTPATH}

-include src/*.d	

# Profiling with coverage
profile: $(OBJS_O)
	$(CC) -fprofile-arcs -ftest-coverage $(SOURCES_C) -o a.out

# Profiling with gcov

gcov: $(SOURCES_C)
	gcc -fprofile-arcs -ftest-coverage $(SOURCES_C)
#./a.out
#gcov $(SOURCES_C)

# run the project under valgrind

valgrind: run
	valgrind --leak-check=yes ./run

# Link the project

run: $(OBJS_O)
	$(CC) -o run $(OBJS_O)

# Compile Hash table

%.o: %.c
	$(CC) $(CFLAGS) -c -o $(@) $<

# Erase the trash and object files

clean:
	${RM} $(OBJS_O) ${OUTPATH} docs/*.gcda docs/*.gcno *.gcda src/*.d *.gcno *.gcov a.out run profile
