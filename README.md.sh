#!/bin/bash -e
cat << EOF
# GPGPU Benchmarks
Compiling information about various GPGPU benchmarks. This is a work in progress.

*Note: this readme is generated from the other files in this repo.*

## Configurations
Tracking known system configurations.

$(./lt2md.lua links.lua configs.lua)

## Benchmarks
Attributes of benchmarks.

$(./lt2md.lua links.lua benchmarks.lua)

## Data Sets
Information about the data sets used for benchmarks.

$(./lt2md.lua links.lua data.lua)

## Suites
Known collections of benchmarks.

* [convnet](https://github.com/soumith/convnet-benchmarks)
    * focused on imagenet models and convolutional neural networks
* [DeepMark](https://github.com/DeepMark/deepmark)
    * continuation of convnet
* [PTS/OpenCL](https://openbenchmarking.org/suite/pts/opencl)
    * OpenCL benchmarks via Phoronix Test Suite
* [gpucc](http://llvm.org/devmtg/2015-10/slides/Wu-OptimizingLLVMforGPGPU.pdf)
    * actually a CUDA compiler (meant to replace nvcc) but evaluated with a suite of benchmarks
        * [SHOC](https://github.com/vetter/shoc)
        * [Rodinia](https://www.cs.virginia.edu/~skadron/wiki/rodinia/index.php/Rodinia:Accelerating_Compute-Intensive_Applications_with_Accelerators)
        * [Eigen](https://bitbucket.org/eigen/eigen)'s [Tensor](https://bitbucket.org/eigen/eigen/src/c877e66df97d061177ea01f43d2f4540532a3f77/unsupported/Eigen/CXX11/src/Tensor/)
EOF
