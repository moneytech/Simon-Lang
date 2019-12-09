exec = hello.out
sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
flags = -g


$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	make
	copy "hello.out" "C:/Portable/SLang/hello"

clean:
	-rm *.out
	-rm *.o
	-rm src/*.o
