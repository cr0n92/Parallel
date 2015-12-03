#include <cstdio>
#include <sys/time.h>
#include <cilk/cilk.h>
#include <cilk/cilk_api.h>
#include <cilk/reducer_opadd.h>

int main(int argc, char * argv[]){
	if (argc!=3) {
		fprintf(stderr,"Usage: ./exec n workers\n");
		exit(-1);
	}
	struct timeval ts,tf;
	int n = atoi(argv[1]);
	char * w = argv[2];
	int sum = 0;

	__cilkrts_end_cilk();						//Turning off Cilk RTS to be able to define the number of workers

	__cilkrts_set_param("nworkers", w);			//Seting number of workers

	__cilkrts_init();							//Re-initializing Cilk RTS with given number of workers
												//The alternative is to set the number of workers through the environment variable CILK_NWORKERS

	gettimeofday(&ts,NULL);
    cilk::reducer_opadd<int> parallel_sum;
	cilk_for ( int i = 0; i <= n; i++ )
		parallel_sum += i;
	sum = parallel_sum.get_value();
	gettimeofday(&tf,NULL);

	printf("Result %d Workers %d Time %.6lf sec\n", sum, atoi(w), tf.tv_sec-ts.tv_sec+(tf.tv_usec-ts.tv_usec)*0.000001);
} 
