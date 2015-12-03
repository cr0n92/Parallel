CC = cilkc
CFLAGS=-O3 -Wall 

all : sum fib

sum : sum.o
	$(CC) $(CFLAGS) sum.o -o sum
fib : fib.o
	$(CC) $(CFLAGS) fib.o -o fib
%.o : %.cilk
	$(CC) $(CFLAGS) -c $<

clean :
	rm -f sum sum.o fib fib.o
