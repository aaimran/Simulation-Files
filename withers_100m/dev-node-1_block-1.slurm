#!/bin/bash
#SBATCH -J WQL3D                            # Job name
#SBATCH -o waveqlab3d.%j.out                # Output file (%j is job ID)
#SBATCH -e waveqlab3d.%j.err                # Error file
#SBATCH -t 02:00:00                         # Time limit
#SBATCH -N 1                                # Number of nodes
#SBATCH -n 128                              # Number of tasks (MPI processes)
#SBATCH -p development                      # Queue (partition)
#SBATCH --mail-type=ALL                     # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aimran@miners.utep.edu  # Email notifications



# Load necessary modules
module purge
module load intel/19.1.1
module load impi/19.0.9

mkdir -p ./output

#-------------------- 
CASE_NAME="test-1_node-1_block-1_tn_100m"
ibrun ../../build/./waveqlab3d ./input/block-1/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="test-1_node-1_block-1_tp_100m"
ibrun ../../build/./waveqlab3d ./input/block-1/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="test-1_node-1_block-1_tr_100m"
ibrun ../../build/./waveqlab3d ./input/block-1/${CASE_NAME}.in > ./output/${CASE_NAME}.out
