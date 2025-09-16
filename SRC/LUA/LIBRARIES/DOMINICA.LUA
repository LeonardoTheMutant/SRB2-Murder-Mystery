-- DOMINICA.LUA
-- Library by LeonardoTheMutant
--
-- Data Compression Algorithms
-- Compression algorithms are by their respective authors
-- Don't ask how I come up with my library names, I just came up with some name out of "DCA"

rawset(_G, "DCA", {rle={}, lzw={}, hybrid={}})

--
-- Run-Length Encoding (RLE)
--

--compression
DCA.rle.encode = function(data)
	local out = {}
	local i = 1
	while i <= #data do
		local ch = data:sub(i,i)
		local count = 1
		while (i+count <= #data) and data:sub(i+count,i+count) == ch do
			count = count + 1
		end
		table.insert(out, ch .. tostring(count))
		i = i + count
	end
	return table.concat(out, "")
end

--decompression
DCA.rle.decode = function(data)
	local out = {}
	for ch, count in data:gmatch("(.)(%d+)") do
		table.insert(out, string.rep(ch, tonumber(count)))
	end
	return table.concat(out)
end



--
-- Lempel-Ziv-Welch (LZW)
--

--compression
DCA.lzw.encode = function(data)
	if #data == 0 then return "" end

	-- init dictionary: single-byte strings -> 0..255
	local dict = {}
	for i = 0, 255 do
		dict[string.char(i)] = i
	end
	local next_code = 256

	local codes = {} -- numeric codes
	local w = data:sub(1,1)

	for i = 2, #data do
		local c = data:sub(i,i)
		local wc = w .. c
		if dict[wc] ~= nil then
			w = wc
		else
			-- output code for w
			codes[#codes + 1] = dict[w]
			-- add wc to dictionary
			dict[wc] = next_code
			next_code = next_code + 1
			w = c
		end
	end
	-- output the final code
	codes[#codes + 1] = dict[w]

	-- pack codes into a binary string (2 bytes per code, big-endian)
	local out_bytes = {}
	for i = 1, #codes do
		local code = codes[i]
		-- ensure code fits into 16 bits; otherwise you must implement wider packing
		if code >= 65536 then
			error("LZW: code exceeded 65535; implement variable-width packing")
		end
		local hi = (code - (code % 256)) / 256
		local lo = code % 256
		out_bytes[#out_bytes + 1] = string.char(hi)
		out_bytes[#out_bytes + 1] = string.char(lo)
	end

	return table.concat(out_bytes)
end

--decompression
DCA.lzw.decode = function(data)
	if #data == 0 then return "" end
	-- build codes array from two-byte big-endian packed input
	local codes = {}
	local len = #data
	if (len % 2) ~= 0 then
		error("DCA.lzw.decode(): corrupt data length (must be even)")
	end
	for i = 1, len, 2 do
		local hi = data:byte(i)
		local lo = data:byte(i + 1)
		local code = hi * 256 + lo
		codes[#codes + 1] = code
	end

	-- init dictionary: 0..255 -> single-byte strings
	local dict = {}
	for i = 0, 255 do
		dict[i] = string.char(i)
	end
	local next_code = 256

	local result_parts = {}
	local w = dict[codes[1]]
	if not w then error("DCA.lzw.decode(): invalid first code") end
	result_parts[#result_parts + 1] = w

	for i = 2, #codes do
		local k = codes[i]
		local entry = dict[k]
		if not entry then
			-- special case: k == next_code -> entry = w .. first char of w
			if k == next_code then
				entry = w .. w:sub(1,1)
			else
				error("DCA.lzw.decode(): bad compressed k=" .. tostring(k))
			end
		end
		result_parts[#result_parts + 1] = entry
		-- add w + first char of entry to dictionary
		dict[next_code] = w .. entry:sub(1,1)
		next_code = next_code + 1
		w = entry
	end

	return table.concat(result_parts)
end



--
-- Hybrid (LZW + RLE)
--

--compression
DCA.hybrid.encode = function(data)
	return DCA.lzw.encode(DCA.rle.encode(data))
end

--decompression
DCA.hybrid.decode = function(data)
	return DCA.rle.decode(DCA.lzw.decode(data))
end