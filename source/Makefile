CC = gcc
CFLAGS = -std=c99
DEPS = main.c testbed.c
OBJ = main.o testbed.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm *.o main