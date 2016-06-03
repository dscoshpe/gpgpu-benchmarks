
Ubuntu --> image
Libraries (all, CUDA+cuDNN/etc)  --> big image
Frameworks (all) --> big image
Benchmarks --> image


* [cudnn.torch](https://github.com/soumith/cudnn.torch) does not support cuDNN R5 (current), only R1->R4
* native Torch fails on GoogleNet
* cuDNN installs by copying to system directory
    * export path to `LD_LIBRARY_PATH` for Torch if not in default PATH
    * eg: `export LD_LIBRARY_PATH=/usr/local/cuda/lib64/`
* fbcunn is a [whole thing](https://github.com/facebook/fbcunn/blob/master/INSTALL.md)
    * many components and the build takes a while
    * min CUDA is 6.5
    * build fails:
		```text
		[ 15%] Building CXX object CMakeFiles/thpp.dir/Storage.cpp.o
		/tmp/fblualib-build.AzeCBN/thpp/thpp/Storage.cpp: In function ‘void thpp::detail::applySharingMode(folly::IOBuf&, thpp::SharingMode)’:
		/tmp/fblualib-build.AzeCBN/thpp/thpp/Storage.cpp:66:9: error: ‘class folly::IOBuf’ has no member named ‘makeManagedOne’
		     iob.makeManagedOne();
		         ^
		```
        * [known issue](https://github.com/facebook/thpp/issues/11)
        * be sure to use the **new** install script. i had to do it manually as a workaround.
    * convnet needs to be updated to **not use** fbcunn.SpatialConvolution, [use nn.SpatialConvolutionMM](https://groups.google.com/forum/?_escaped_fragment_=topic/torch7/jqNDfJIDBZU#!topic/torch7/jqNDfJIDBZU) instead.
* dont assume FP16 support yet
    * requires CUDA 7.5
* Don't follow convnet instructions for cltorch (clnn)
    * cltorch follows an older version of torch
    * install via: https://github.com/hughperkins/distro-cl
* noticed some packages building with specific CUDA versioning
    * 6.5 seems to usually be the minimum
    * not sure if there is forward or backwards compatibility
* torch7/imagenet_winners/googlenet.lua could use some better require/library handling (issue for fbnn, clnn at least)
* cudaconv2 **must** use the cudaconv2 branch, not master
    * cudaconv2 fails on googlenet:
    ```
    .../torch/install/share/lua/5.1/ccn2/SpatialConvolution.lua:16: Assertion failed: [math.fmod(nOutputPlane, 16) == 0]. Number of output planes has to be a multiple of 16.
	stack traceback:
		[C]: in function 'error'
		.../torch/install/share/lua/5.1/ccn2/SpatialConvolution.lua:16: in function '__init'
		/home/walter/torch/install/share/lua/5.1/torch/init.lua:91: in function </home/walter/torch/install/share/lua/5.1/torch/init.lua:87>
		[C]: in function 'SpatialConvolution'
		./googlenet.lua:18: in function 'inception'
		./googlenet.lua:46: in function <./googlenet.lua:30>
		benchmark.lua:41: in main chunk
		[C]: in function 'dofile'
		...lter/torch/install/lib/luarocks/rocks/trepl/scm-1/bin/th:145: in main chunk
		[C]: at 0x00406670
	```
* nnBHWD tests fail, various errors
* caffe install misses some of its deps:
    * `sudo apt-get install libprotobuf-dev libopencv-dev libleveldb-dev`
    * definitely recommend passing `make -j >1` for build
* caffe output is appended to a log file by default: `output_<benchmark>.log`
* as described by convnet-benchmarks/caffe/install.sh, caffe is built without cuDNN support
    * to enable cuDNN uncomment `USE_CUDNN` in `Makefile.config` and rebuild
* when building nervanagpus dont forget to alter $PATH so nvcc can be found
    * `export PATH=$PATH:/usr/local/cuda/bin/`
    * try `make kernels -j >1` next time
* actually, dont bother installing neon from convnet, get it from [nervana/neon](https://github.com/NervanaSystems/neon) directly
    * convent benchmarks are in `neon/examples/convnet-benchmarks`
    * [docs page](http://neon.nervanasys.com/docs/latest/installation.html) is useful too
    * `<benchmark>.py -d f16` enables FP16 support but the kernel compiles fail, so not working yet
    * the [docker container](https://hub.docker.com/r/kaixhin/cuda-neon/) could be optimized for size more, but it works well
    * install to system or issue `. .venv/bin/activate` to actually use it
* TensorFlow(current) only supports CUDA 7.5 and cuDNN r4
    * convnet asks for older version in the tensorflow/README but it works with current
        * i installed via [these instructions](https://www.tensorflow.org/versions/r0.8/get_started/os_setup.html#pip-installation) rather than the readme
    * the python scripts work out of the box for a specific cuDNN version (R4?), otherwise rebuild with bazel
* jic, dont forget: `export CUDA_HOME=/usr/local/cuda`
* `nvidia-smi dmon` is fun
    * setting [power limits](https://www.ibm.com/support/knowledgecenter/SSFHY8_5.4.0/com.ibm.cluster.essl.v5r4.essl100.doc/am5gr_nvidcap.htm)
* cuDNN FP16 support in Torch requires up-to-date [cutorch](https://github.com/torch/cutorch) and [cudnn.torch](https://github.com/soumith/cudnn.torch) and cuDNN >=7.5
    * use the "half" branch of cudnn.torch
    * use appropriate branch for cuDNN version too
* Torch+cuDNN based benchmarks must user multiple GPUs explicitly. Current convnet-benchmarks do not do it, must be created.
* [imagenet benchmarks](https://github.com/soumith/imagenet-multiGPU.torch) specifically for multi-gpu
