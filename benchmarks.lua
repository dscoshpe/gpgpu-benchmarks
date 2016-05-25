--[[
	Information about the various benchmarks.
--]]
return {
headers = {
	"name", "focus", "data", "input", "priority"
},
records = {
--[[
	{
		name = "",
		focus = "",
		data = "",
		input = "", -- specific kind of input used
		criteria = "", -- the way the benchmark is measured
		priority = nil,
	},
--]]
	{
		name = "AlexNet",
		focus = "nn",
		data = "ImageNet",
		input = "128x3x224x224",
		criteria = {"timed", "forward", "backwards", "average"},
		priority = nil,
	},
	{
		name = "Overfeat [fast]",
		focus = "nn",
		data = "ImageNet",
		input = "128x3x231x231",
		criteria = {"timed", "forward", "backwards", "average"},
		priority = nil,
	},
	{
		name = "OxfordNet [Model-A]",
		focus = "nn",
		data = "ImageNet",
		input = "64x3x224x224",
		criteria = {"timed", "forward", "backwards", "average"},
		note = 'aka "VGG"',
		priority = nil,
	},
	{
		name = "GoogleNet V1",
		focus = "nn",
		data = "ImageNet",
		input = "128x3x224x224",
		criteria = {"timed", "forward", "backwards", "average"},
		priority = nil,
	}
}}