# GPGPU Benchmarks
Compiling information about various GPGPU benchmarks. This is a work in progress.

*Note: this readme is generated from the other files in this repo.*

## Configurations
Tracking system configurations.

| config | framework | library | precision | note | reproduced | multigpu |
| --- |--- |--- |--- |--- |--- |--- |
| Torch (native) | [Torch](http://torch.ch/) | (native) |  |  | true | no |
| Torch + cunn | [Torch](http://torch.ch/) | cunn |  |  | true | yes/create |
| Torch + fbcunn | [Torch](http://torch.ch/) | [fbfft](https://github.com/facebook/fbcunn/tree/master/src/fft) |  | dont use fbcunn.SpatialConvolution | true | yes/create |
| Torch + cuDNN(R2) | [Torch](http://torch.ch/) | [cuDNN](https://developer.nvidia.com/cudnn), R2 |  | Dont have cuDNN r2 | false | yes/create |
| Torch + cuDNN(R4, 16) | [Torch](http://torch.ch/) | [cuDNN](https://developer.nvidia.com/cudnn), R4 | 16 | using "fake" fp16 support | true | yes/create |
| Torch + cuDNN(R4, 32) | [Torch](http://torch.ch/) | [cuDNN](https://developer.nvidia.com/cudnn), R4 | 32 |  | true | yes/create |
| Torch + cudaconvnet2 | [Torch](http://torch.ch/) | [cudaconvnet2](https://code.google.com/p/cuda-convnet/) |  | In cudaconv2 branch, not master. | true | yes/create |
| Torch + clnn | [Torch](http://torch.ch/) | [clnn](https://github.com/hughperkins/clnn) |  | OpenCL only. Follows its own (older) Torch version. | true | yes/create |
| Torch + nnBHDW | [Torch](http://torch.ch/) | nnBHWD |  | Won't build, unused. | false |  |
| Caffe (native) | [Caffe](https://github.com/BVLC/caffe) | (native) |  | cuDNN is optional | true | no |
| Caffe + cuDNN | [Caffe](https://github.com/BVLC/caffe) | [cuDNN](https://developer.nvidia.com/cudnn) |  |  | true | kind of |
| Caffe + GreenTea | [Caffe](https://github.com/BVLC/caffe) | [GreenTea](https://github.com/naibaf7/caffe) |  | Caffe + OpenCL backend | true |  |
| TensorFlow + cuDNN | [TensorFlow](https://www.tensorflow.org/) | [cuDNN](https://developer.nvidia.com/cudnn) |  |  | true | yes |
| Chainer + cuDNN | [Chainer](https://github.com/pfnet/chainer) | [cuDNN](https://developer.nvidia.com/cudnn) |  |  | true | yes/create |
| neon(16) | [Nervana neon](https://github.com/nervanasystems/neon) | (native) | 16 | nvcc kernel compile fails. (because I have Kepler?) | false | yes/purchase |
| neon(32) | [Nervana neon](https://github.com/nervanasystems/neon) | (native) | 32 |  | true | yes/purchase |

## Benchmarks
Attributes of benchmarks.

| name | focus | data | input | priority |
| --- |--- |--- |--- |--- |
| [AlexNet](https://arxiv.org/pdf/1404.5997v2.pdf) | nn | [ImageNet](http://image-net.org/) | 128x3x224x224 |  |
| [Overfeat [fast]](https://arxiv.org/abs/1312.6229) | nn | [ImageNet](http://image-net.org/) | 128x3x231x231 |  |
| [OxfordNet [Model-A]](http://arxiv.org/abs/1409.1556) | nn | [ImageNet](http://image-net.org/) | 64x3x224x224 |  |
| [GoogleNet V1](http://research.google.com/pubs/pub43022.html) | nn | [ImageNet](http://image-net.org/) | 128x3x224x224 |  |

## Data Sets
Information about the data sets used for benchmarks.

| name | versions |
| --- |--- |
| [ImageNet](http://image-net.org/) | 2012, 2013, 2014 |

## Suites
Some collections of benchmarks.

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
* [CNTK/etc](https://github.com/Alexey-Kamenev/Benchmarks)
	* collection of framework benchmarks from Microsoft CNTK team
