#!/bin/bash
#
#SBATCH -A gpu
#SBATCH -p gpu
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem-per-cpu=10000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o output.%j # File to which STDOUT will be written
#SBATCH -e error.%j # File to which STDERR will be written
#SBATCH --mail-type=END # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --time=2-00:00
#SBATCH -J leif_job
echo "Job started on `hostname` at `date`"

#/home/mguttenb/julia-1.1.0/bin/julia matTest.jl

#julia runRestart.jl
#julia matTest.jl
/home/mguttenb/julia-1.1.0/bin/julia clusterGo.jl

echo " "
echo "Job Ended at `date`"
