# Default values
nprocs=50

module load compiler-rt/2024.0.0 ifort/2024.0.0 mpi/2021.13

mkdir -p ./output

fname="test-1upx_100m"
mpirun -np $nprocs ../../build/./waveqlab3d ./input/${fname}.in | tee ./output/${fname}.out
