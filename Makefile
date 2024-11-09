CC=gcc
AS=gcc
CFLAGS=-Wall -Wextra
ASFLAGS=-c

all: main

main: src/quicksort.o src/quicksort.c
	$(CC) $(CFLAGS) -o main src/quicksort.o src/quicksort.c

src/quicksort.o: src/quicksort.S
	$(AS) $(ASFLAGS) -o src/quicksort.o src/quicksort.S

run: main
	./main

clean:
	rm -f src/*.o main