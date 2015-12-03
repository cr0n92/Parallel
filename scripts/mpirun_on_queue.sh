#!/bin/bash

## Give the Job a descriptive name
#PBS -N testjob

## Output and error files
#PBS -o testjob.out
#PBS -e testjob.err

## Limit memory, runtime etc.
#PBS -l walltime=01:00:00

## How many nodes:processors_per_node should we get?
#PBS -l nodes=2:ppn=4

## Start 
##echo "PBS_NODEFILE = $PBS_NODEFILE"
##cat $PBS_NODEFILE

## Run the job (use full paths to make sure we execute the correct thing) 
## NOTE: Fix the path to show to your executable! 
mpirun -x MX_RCACHE=8 --mca btl tcp,self -np 4 --bynode \
/home/users/goumas/benchmarks/MPI_code/fw/fw_MPI 32


