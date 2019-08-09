#!/bin/bash
#
#SBATCH -A venkvis
#SBATCH -p cpu
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
##SBATCH --mem=120000 # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o output.%j # File to which STDOUT will be written
#SBATCH -e error.%j # File to which STDERR will be written
#SBATCH --mail-type=END # Type of email notification- BEGIN,END,FAIL,ALL

echo "Job started on `hostname` at `date`"

julia spmet_script.jl

echo " "
echo "Job Ended at `date`"
