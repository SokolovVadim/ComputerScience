# Red-black tree

SOURCE = $(wildcard src/*.cpp)
OUTPATH = bin
FLAGS:= -Wall -Werror -pedantic

all: run

dirs: ${OUTPATH}

${OUTPATH}:
	mkdir -p ${OUTPATH}

objects: $(SOURCE)
	g++ -c $(FLAGS) -o obj/red_black.o src/red_black.cpp
	g++ -c $(FLAGS) -o obj/test.o src/test.cpp
move: objects
	mv src/red_black.o obj
	mv src/test.o obj
run: dirs objects
	g++ obj/red_black.o obj/test.o -o run
clean:
	rm -rf obj/*.o src/*.d bin run 
