#!/usr/bin/env lua
--[[
	Convert a structured Lua table to a markdown formatted table.

	Links table format:
	{ -- match keywords to URLs for easy linking
		foo = "http://foo.com",
		baz = "http://baz.com",
		...
	}

	Input data table format:
	{
		headers = [ -- specify the order and select which fields define the table columns
			"field1", "field2", ...
		],
		records = [
			{
				field1 = "foo",
				field2 = {"bar", "baz", ...}, -- fields may be sets
				field3 = "fuz",
				...
			},
			...
		]
	}
--]]

local links = dofile(arg[1] or error("Supply the file name of a Lua table containing links."))
local input = dofile(arg[2] or error("Supply the file name of a Lua table containing input data."))

local headers = input.headers
local records = input.records
local output = {}
local blank = ""
local setdelim = ", "

-- return a Markdown formatted table row from a Lua table array
local function formatRow(row)
	return string.format("| %s |", table.concat(row, " | "))
end

-- replace any keywords with their associated links, return result
local function formatField(field)
	-- just return a blank if the field is omitted
	if field == nil then return blank end
	
	-- if the field is a set (table) then get recursive
	if type(field) == "table" then
		local set = {}
		for i=1,#field,1 do
			table.insert(set, formatField(field[i]))
		end
		return table.concat(set, setdelim)
	elseif links[field] ~= nil then
		-- if the field is listed in the links section then add link formatting
		return string.format("[%s](%s)", field, links[field])
	end

	-- otherwise, just return the field as is
	return field
end

-- format headers
table.insert(output, formatRow(headers))
table.insert(output, "| " .. string.rep("--- |", #headers))

-- format records
for i=1,#records,1 do
	local row = {}
	for j=1,#headers,1 do
		-- if the record has the header key then add it to the row, otherwise add a blank
		table.insert(row, formatField(records[i][headers[j]]))
	end
	table.insert(output, formatRow(row))
end

-- print the table
print(table.concat(output, "\n"))
