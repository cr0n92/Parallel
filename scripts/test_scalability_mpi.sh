#!/bin/bash

## Give the Job a descriptive name
#PBS -N testjob

## Output and error files
#PBS -o test_scalability_mpi.out
#PBS -e test_scalability_mpi.err

## Limit memory, runtime etc.

## How many nodes:processors_per_node should we get?
## Run on parlab
#PBS -l nodes=4:ppn=8

## Start 
##echo "PBS_NODEFILE = $PBS_NODEFILE"
##cat $PBS_NODEFILE

## Run the job (use full paths to make sure we execute the correct thing) 
## NOTE: Fix the path to show to your executable! 

cd /path/to/mpi/programs/

## NOTE: Fix the names of your executables

for size in 1024 2000
do
	for execfile in jacobi_mpi seidelsor_mpi redblacksor_mpi
	do
		mpirun --mca btl tcp,self -np 1 --bynode ${execfile} ${size} ${size} 1 1 >>ScalabilityResultsMPI_${execfile}_${size}
		mpirun --mca btl tcp,self -np 2 --bynode ${execfile} ${size} ${size} 2 1 >>ScalabilityResultsMPI_${execfile}_${size}
		mpirun --mca btl tcp,self -np 4 --bynode ${execfile} ${size} ${size} 2 2 >>ScalabilityResultsMPI_${execfile}_${size}
		mpirun --mca btl tcp,self -np 8 --bynode ${execfile} ${size} ${size} 4 2 >>ScalabilityResultsMPI_${execfile}_${size}
		mpirun --mca btl tcp,self -np 16 --bynode ${execfile} ${size} ${size} 4 4 >>ScalabilityResultsMPI_${execfile}_${size}
		mpirun --mca btl tcp,self -np 32 --bynode ${execfile} ${size} ${size} 8 4 >>ScalabilityResultsMPI_${execfile}_${size}

	done
done

## Make sure you disable convergence testing and printing
