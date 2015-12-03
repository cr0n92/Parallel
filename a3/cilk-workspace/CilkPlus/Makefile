CC = gcc
CXX = g++
CFLAGS=-fcilkplus -O3 -Wall 
CXXFLAGS=-fcilkplus -O3 -Wall 
all : sum fib

sum : sum.cpp
	$(CXX) $(CXXFLAGS) sum.cpp -o sum
fib : fib.c
	$(CC) $(CFLAGS) fib.c -o fib

clean :
	rm -f sum fib
