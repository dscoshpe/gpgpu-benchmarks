
Ubuntu --> image
Libraries (all, CUDA+cuDNN/etc)  --> big image
Frameworks (all) --> big image
Benchmarks --> image


Notes:

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
