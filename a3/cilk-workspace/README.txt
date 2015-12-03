Steps
-----

CilkPlus
	1. Load CilkPlus module (on target machine!)
	$ module load cilk-plus

	This sets the environmnet for compilation and execution with gcc-5.2 (CilkPlus in mainline)

	2. Save your programs as .c (for C)  or .cpp (for C++) files 

	3. Compile with -fcilkplus:
	$ gcc -fcilkplus -O3 fib.c -o fib
	$ g++ -fcilkplus -O3 sum.cpp -o sum

	(Check the Makefile)

	4. Execute - pass the number of threads as the final argument (check the code to find out how it's done)
	$ ./fib 100 64
	$ ./sum 1000000 64

	(You can specify the number of threads with the environment variable CILK_NWORKERS
	$ export CILK_NWORKERS=8
	$ ./fib 10000)



Cilk-MIT
	1. Load Cilk-MIT module (on target machine!)
	$ module load cilk-mit

	This sets the environment for compilation and execution with the Cilk-MIT compiler (cilkc)

	2. Save your programs as .cilk files
	
	3. Compile with cilkc:
	$ cilkc -O3 fib.cilk -o fib
	
	(Check the Makefile)

	4. Specify the number of threads at runtime using the --nproc argument
	$ ./fib --nproc 8 100


