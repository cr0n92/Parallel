#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include <cilk/cilk.h>
#include <cilk/cilk_api.h>

int fib_serial(int n) {
	if ( n < 2 )
		return n;
	else {
		int x = fib_serial(n-1);
		int y = fib_serial(n-2);
		return x+y;
	}
}


int fib(int n) {
	if ( n < 10 ) 
		return fib_serial(n);
	int x = cilk_spawn fib(n-1);
	int y = cilk_spawn fib(n-2);
	cilk_sync;
	return x+y;
}

int main (int argc, char * argv[]) {
	if ( argc != 3 ) {
		fprintf( stderr, "Usage: ./exec n workers\n");
		exit(-1);
	}
	int n = atoi(argv[1]);
	char * w = argv[2];
	int res = fib(n);
	struct timeval ts,tf;

	__cilkrts_end_cilk();						//Turning off Cilk RTS to be able to define the number of workers

	__cilkrts_set_param("nworkers", w);			//Seting number of workers

	__cilkrts_init();							//Re-initializing Cilk RTS with given number of workers
												//The alternative is to set the number of workers through the environment variable CILK_NWORKERS
	gettimeofday(&ts, NULL);
	res = fib(n);
	gettimeofday(&tf, NULL);
	printf("Result %d Workers %d Time %.6lf sec\n", res, atoi(w), tf.tv_sec-ts.tv_sec+(tf.tv_usec-ts.tv_usec)*0.000001);
	return 0;
}
