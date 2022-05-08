--- Implements RFC 4648 Base64

local generic = require 'based.64.generic'

local rfc = {}

local encode_lookup = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local decode_lookup = {
	 nil,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	 nil,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	 nil,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	 nil,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	 nil,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	 nil,  nil, 0x3e,  nil,  nil,  nil, 0x3f, 0x34,
	0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
	0x3d,  nil,  nil,  nil,  nil,  nil,  nil,  nil,
	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
	0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
	0x18, 0x19,  nil,  nil,  nil,  nil,  nil,  nil,
	0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21,
	0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29,
	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
	0x32, 0x33
}
-- for i = 1, 255 do
-- 	local position = encode_lookup:find(string.char(i), 1, true)
-- 	io.write(position and string.format("0x%02x", position-1) or ' nil')
-- 	io.write(i%8==0 and ",\n" or ", ")
-- end

function rfc.encode(data)
	local output = generic.encode(data, encode_lookup, "=")
	return output .. string.rep("=", (4 - #output) % 4)
end

function rfc.decode(data)
	if #data % 4 > 0 then
		error("Base64 string incorrectly padded!", 1)
	else
		local first_pad = data:find("=", 1, true)
		if first_pad then
			data = data:sub(1, first_pad - 1)
		end
	end
	return generic.decode(data, decode_lookup, "=")
end

return rfc
