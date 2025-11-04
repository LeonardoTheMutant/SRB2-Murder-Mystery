-- UNICODE.LUA
-- Code by some helpful folks from StackOverflow & GitHub Gist
-- Library by LeonardoTheMutant
--
-- UTF-8 support for SRB2


-- https://github.com/blitmap/lua-utf8-simple
rawset(_G, "unicode", {})
local pattern = '[%z\1-\127\194-\244][\128-\191]*'

-- helper function
local posrelat = function (pos, len)
	if (pos < 0) then pos = len + pos + 1 end
	return pos
end

-- maps f over s's utf8 characters f can accept args: (visual_index, utf8_character, byte_index)
unicode.map = function(s, f, no_subs)
	local i = 0

	if no_subs then
		for b, e in s:gmatch('()' .. pattern .. '()') do
			i = i + 1
			local c = e - b
			f(i, c, b)
		end
	else
		for b, c in s:gmatch('()(' .. pattern .. ')') do
			i = i + 1
			f(i, c, b)
		end
	end
end

-- generator for the above -- to iterate over all utf8 chars
unicode.chars = function(s, no_subs)
	return coroutine.wrap(function () return unicode.map(s, coroutine.yield, no_subs) end)
end

-- returns the number of characters in a UTF-8 string
unicode.len = function(s)
	-- count the number of non-continuing bytes
	return select(2, s:gsub('[^\128-\193]', ''))
end

-- replace all utf8 chars with mapping
unicode.replace = function(s, map)
	return s:gsub(pattern, map)
end

-- reverse a utf8 string
unicode.reverse = function(s)
	-- reverse the individual greater-than-single-byte characters
	s = s:gsub(pattern, function (c) return #c > 1 and c:reverse() end)

	return s:reverse()
end

-- strip non-ascii characters from a utf8 string
unicode.strip = function(s)
	return s:gsub(pattern, function (c) return #c > 1 and '' end)
end

-- like string.sub() but i, j are utf8 strings
-- a utf8-safe string.sub()
unicode.sub = function(s, i, j)
	local l = unicode.len(s)

	i =       posrelat(i, l)
	j = j and posrelat(j, l) or l

	if (i < 1) then i = 1 end
	if (j > l) then j = l end

	if (i > j) then return '' end

	local diff = j - i
	local iter = unicode.chars(s, true)

	-- advance up to i
	for _ = 1, i - 1 do iter() end

	local c, b = select(2, iter())

	-- i and j are the same, single-charaacter sub
	if (not diff) then
		return string.sub(s, b, b + c - 1)
	end

	i = b

	-- advance up to j
	for _ = 1, diff - 1 do iter() end

	c, b = select(2, iter())

	return string.sub(s, i, b + c - 1)
end

--https://stackoverflow.com/questions/24190608/lua-string-byte-for-non-ascii-characters
--Return an codepoint value of a single Unicode symbol
unicode.code = function(c)
	c = $ or 0
    local b1, b2, b3, b4 = c:byte(1, 4)
	if (not b1) then return nil end

    if (b1 < 0x80) then return b1 --b1 is less than 128, it's a single-byte character
    elseif (b1 < 0xE0) then return (b1 - 0xC0) * 0x40 + (b2 - 0x80) --2-byte char
    elseif (b1 < 0xF0) then return (b1 - 0xE0) * 0x1000 + (b2 - 0x80) * 0x40 + (b3 - 0x80) --3-byte char
    elseif (b1 < 0xF8) then return (b1 - 0xF0) * 0x40000 + (b2 - 0x80) * 0x1000 + (b3 - 0x80) * 0x40 + (b4 - 0x80) --4-byte char
	else return nil end
end
