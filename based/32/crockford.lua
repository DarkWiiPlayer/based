--- Implements Crockford's Base32 encoding

local generic = require 'based.32.generic'

local crockford = {}

local encode_lookup = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
local decode_lookup = {
	nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
	nil, nil, nil, nil, nil, nil, nil,   0,   1,   2,
	  3,   4,   5,   6,   7,   8,   9, nil, nil, nil,
	nil, nil, nil, nil,  10,  11,  12,  13,  14,  15,
	 16,  17,   1,  18,  19,   1,  20,  21,   0,  22,
	 23,  24,  25,  26, nil,  27,  28,  29,  30,  31,
	nil, nil, nil, nil, nil, nil,  10,  11,  12,  13,
	 14,  15,  16,  17,   1,  18,  19,   1,  20,  21,
	  0,  22,  23,  24,  25,  26, nil,  27,  28,  29,
	30, 31
}

--- Encodes a binary string into Base32
-- @tparam string data A string treated as binary data
-- @treturn string The Base32 encoded input data
function crockford.encode(data)
	return generic.encode(data, encode_lookup)
end

--- Decodes a Base32-encoded binary string
-- @tparam string data Base32 encoded data
-- @treturn string The decoded input data
function crockford.decode(data)
	return generic.decode(data, decode_lookup)
end

return crockford
