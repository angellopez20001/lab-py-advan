#!/bin/bash
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno13/lab5
#SBATCH -J Apartado3.3
#SBATCH --output=%u-python-operation-advan.out
#SBATCH --cpus-per-task=6
#Cargamos el modulo y lo descargamos y entre ellos ponemos las ordenes necesarias con ese modulo
module load anaconda/2025.06

echo Ejecutando el notebook con $1 elementos
for CORES in 1 2 4 6; do
export OMP_NUM_THREADS=$CORES

time(
ipython reduc-operation-array-par-alumno13.ipynb $1 $CORES
)
done

echo Ejecutando el notebook con $2 elementos
for CORES in 1 2 4 6; do
export OMP_NUM_THREADS=$CORES

time(
ipython reduc-operation-array-par-alumno13.ipynb $2 $CORES
)
done
module unload anaconda/2025.06

