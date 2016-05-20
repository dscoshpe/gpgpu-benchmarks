--[[
	Information about the various configurations.
--]]
return {
headers = {
	"config", "framework", "library", "precision", "note", "reproduced", "priority"
},
records = {
------------------------------------------------------------------------- Torch
	{
		config = "Torch (native)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]"},
		suites = "convnet",
		framework = "Torch",
		library = "(native)",
		class = "SpatialConvolutionMM",
		reproduced = nil,
	},
	{
		config = "Torch + fbfft",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]"},
		suites = "convnet",
		framework = "Torch",
		library = "fbfft",
		class = "fbnn.SpatialConvolution",
		reproduced = nil,
	},
	{
		config = "Torch + cuDNN(R2)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]"},
		suites = "convnet",
		framework = "Torch",
		library = {"cuDNN", "R2"},
		class = "cudnn.SpatialConvolution",
		reproduced = nil,
	},
	{
		config = "Torch + cuDNN(R4, 16)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Torch",
		library = {"cuDNN", "R4"},
		class = "cudnn.SpatialConvolution",
		precision = 16,
		note = "CUDA 7.5 for FP16 precision",
		reproduced = nil,
	},
	{
		config = "Torch + cuDNN(R4, 32)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Torch",
		library = {"cuDNN", "R4"},
		class = "cudnn.SpatialConvolution",
		precision = 32,
		reproduced = nil,
	},
	{
		config = "Torch + cudaconvnet2",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]"},
		suites = "convnet",
		framework = "Torch",
		library = "cudaconvnet2",
		class = "ConvLayer",
		reproduced = nil,
	},
	{
		config = "Torch + clnn",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Torch",
		library = "clnn",
		class = "ConvLayer",
		note = "OpenCL only (I think)",
		reproduced = nil,
	},
------------------------------------------------------------------------- Caffe
	{
		config = "Caffe (native)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Caffe",
		library = "(native)",
		class = "ConvolutionLayer",
		blas = {"ATLAS", "Intel MKL", "OpenBLAS"},
		note = "cuDNN is optional",
		reproduced = nil,
	},
	{
		config = "Caffe + GreenTea",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Caffe",
		library = "GreenTea",
		class = "ConvolutionLayer",
		note = "Caffe + OpenCL backend",
		reproduced = nil,
	},
------------------------------------------------------------------------ others
	{
		config = "TensorFlow + cuDNN",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "TensorFlow",
		library = "cuDNN",
		class = "conv2d",
		reproduced = nil,
	},
	{
		config = "Chainer + cuDNN",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Chainer",
		library = "cuDNN",
		class = "Convolution2D",
		reproduced = nil,
	},
-------------------------------------------------------------------------- neon
	{
		config = "neon(16)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Nervana neon",
		library = "(native)",
		class = "ConvLayer",
		precision = 16,
		note = "CUDA 7.5 for FP16 precision",
		reproduced = nil,
	},
	{
		config = "neon(32)",
		benchmarks = {"AlexNet", "Overfeat [fast]", "OxfordNet [Model-A]", "GoogleNet V1"},
		suites = "convnet",
		framework = "Nervana neon",
		library = "(native)",
		class = "ConvLayer",
		precision = 32,
		reproduced = nil,
	},
-------------------------------------------------------------------------- misc

}}
