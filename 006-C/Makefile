CC=gcc
CFLAGS=-O -Wall

run: compile
	./main
compile: main.c
	$(CC) $(CFLAGS) -o main main.c
clean:
	rm main
