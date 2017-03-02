export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$CUDA_ROOT/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_ROOT/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
