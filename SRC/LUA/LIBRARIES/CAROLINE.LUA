-- CAROLINE.LUA
-- Code by LeonardoTheMutant
--
-- Port of some C functionality and expansions to BLUA
-- Why "Caroline"? Try "string.sub('Caroline', 1, 1)"
-- Can you C it now?



--Switch-Case statement
--https://gist.github.com/FreeBirdLjj/6303864?permalink_comment_id=3400522#gistcomment-3400522
--Note: This switch-case implementation does not support "break" fallthrough
--Note 2: Do not place "return" directly in the cases as it returns from the case subroutine, not the function the switch is being executed in
--Usage:
--  switch(a, { 
--      [1] = do -- for case 1
--          print("Case 1")
--      end,
--      [2] = do -- for case 2
--          print("Case 2")
--      end,
--
--      ...
--
--      ['default'] = do --default
--          print("Default")
--      end
--  })
rawset(_G, "switch", function(param, case_table)
	local case = case_table[param]
	if case then return case() end
	local def = case_table['default']
	return def and def() or nil
end)

--Enumeration (enum)
--Note: You can not set individual values to the things you want to enumerate, the function can only automatically set values 0, 1, 2, 3, etc.
--Usage:
--  enum({
--      VALUE_0,
--      VALUE_1,
--      VALUE_2,
--      VALUE_2,
--      ...
--  })
rawset(_G, "enum", function(...)
	local a = {...}
	for i = 1, #a do rawset(_G, a[i], i - 1) end
end)



--
-- stdio.h
--
rawset(_G, "printf", function(str, ...)
	print(string.format(str, ...))
end)



--
-- string.h
--

--Terminate string with the NULL byte at the end (make it C-String)
--This is not a part of string.h
rawset(_G, "strterm", function(s)
	assert(type(s) == "string", "strterm() argument #1: String expected")
	return s..'\0'
end)

rawset(_G, "strcmp", function(str1, str2)
	assert(type(str1) == "string", "strcmp() argument #1: String expected")
	assert(type(str2) == "string", "strcmp() argument #2: String expected")
	--Append '\0' to the end of both strings, if missing
	if (str1:byte(#str1)) then str1 = strterm($) end
	if (str2:byte(#str2)) then str2 = strterm($) end

	local i = 1
	while (true)
		if (str1:byte(i) != str2:byte(i))
			if (str1:byte(i) < str2:byte(i)) then return -1
			else return 1 end
		end

		if (str1:byte(i) == 0) then return 0 end

		i = i + 1
	end
end)

rawset(_G, "strrchr", function(str, chr)
	assert(type(str) == "string", "strchr() argument #1: String expected")
	assert(type(chr) == "string", "strchr() argument #2: Character expected")
	assert(#chr == 1, "strchr() argument #2: String given but single character expected")
	for i = #str, 1, -1 do
		if (string.sub(str, i, i) == chr) then return i end
	end
	return 0
end)



--
-- ctype.h
--
-- WORKS ONLY ON ASCII

--Is uppercase character
rawset(_G, "isupper", function(c)
	c = c:byte()
	return (c >= 65) and (c <= 90)
end)

--Is lowercase character
rawset(_G, "islower", function(c)
	c = c:byte()
	return (c >= 97) and (c <= 122)
end)

--Is alphabetic character
rawset(_G, "isaplha", function(c)
	return isupper(c) or islower(c)
end)

--Is decimal digit
rawset(_G, "isdigit", function(c)
	c = c:byte()
	return (c >= 48) and (c <= 57)
end)

--Is hexadecimal digit
rawset(_G, "isxdigit", function(c)
	c = c:byte()
	return ((c >= 48) and (c <= 57)) or ((c >= 65) and (c <= 70)) or (c >= 97) and (c <= 102)
end)

--Is alphanumeric character
rawset(_G, "isalnum", function(c)
	return isaplha(c) or isdigit(c)
end)

--Is blank character (Space or Tab)
rawset(_G, "isspace", function(c)
	c = c:byte()
	return ((c >= 9) and (c <= 13)) or (c == 32)
end)

--Is control character
rawset(_G, "iscntrl", function(c)
	c = c:byte()
	return ((c >= 0) and (c < 32)) or (c == 127)
end)

--Is printable character
rawset(_G, "isprint", function(c)
	c = c:byte()
	return (c >= 32) and (c < 127)
end)

--Does character have a graphical representation
rawset(_G, "isgraph", function(c)
	return isprint(c) and not isspace(c)
end)

--Is punctuation character
rawset(_G, "ispunct", function(c)
	return isgraph(c) and not isalnum(c)
end)


--
-- Table library expansions
--

--Fill table with an X value (optionally from index A to B)
table.fill = function(tbl, x, a, b)
	a = a or 1
	b = b or #tbl
    for i = a, b do
        if type(x) == "function" then
            tbl[i] = x(i)
        else
            tbl[i] = x
        end
    end
end

--Make a table copy
table.copy = function(tbl1, tbl2)
	tbl2 = tbl2 or {}

	-- clear old keys
    for k in pairs(tbl2) do
        tbl2[k] = nil
    end

	--copy new keys
    for k, v in pairs(tbl1) do
        tbl2[k] = v
    end

    return tbl2
end

--Make a table copy with ALL contents
table.deepcopy = function(tbl1, tbl2)
	tbl2 = tbl2 or {} -- track already-copied tables

	if (type(tbl1) ~= "table") then return tbl1 -- numbers, strings, booleans are copied directly
	elseif tbl2[tbl1] then return tbl2[tbl1] end -- avoid infinite loop

	local copy = {}
	tbl2[tbl1] = copy

	for k, v in pairs(tbl1) do
		copy[table.deepcopy(k, tbl2)] = table.deepcopy(v, tbl2)
	end

	return setmetatable(copy, getmetatable(tbl1))
end



--
-- Lookup tables
--

--Lookup table of HEX numbers in string form for faster Int->Hex(string) conversion
rawset(_G, "HEX", {})
for i = 0, 255 do
    HEX[i] = string.format("%02X", i)
end

--Lookup table of characters for the Int->Char conversion (faster string.char())
rawset(_G, "CHAR", {})
for i = 0, 255 do
	CHAR[i] = string.char(i)
end

--Lookup table of characters for the Hex(string)->Char conversion
--Same as CHAR table, but we can use strings from HEX as indexes
rawset(_G, "HEX2CHAR", {})
for i = 0, 255 do
	HEX2CHAR[HEX[i]] = CHAR[i]
end

--Lookup table of HEX numbers in string form for faster Char->Hex(string) conversion
--Same as HEX table, but we can use characters as indexes
rawset(_G, "CHAR2HEX", {})
for i = 0, 255 do
	CHAR2HEX[CHAR[i]] = HEX[i]
end



--
-- Miscelaneous
--

--Convert boolean to integer
rawset(_G, "bool2int", function(a)
	if (a) return 1 else return 0 end
end)

rawset(_G, "HEX2INT", {
	--.byte() -> int
	[48] = 0,  [49] = 1,  [50] = 2,  [51] = 3, [52] = 4,  [53] = 5,  [54] = 6,  [55] = 7, [56] = 8,  [57] = 9, --'0'‑'9'
	[65] = 10, [66] = 11, [67] = 12, [68] = 13, [69] = 14, [70] = 15, --'A'‑'F'
	[97] = 10, [98] = 11, [99] = 12, [100] = 13, [101] = 14, [102] = 15, --'a'-'f'

	--char -> int
	['0'] = 0,  ['1'] = 1,  ['2'] = 2,  ['3'] = 3, ['4'] = 4,  ['5'] = 5,  ['6'] = 6,  ['7'] = 7, ['8'] = 8,  ['9'] = 9, --'0'‑'9'
	['A'] = 10, ['B'] = 11, ['C'] = 12, ['D'] = 13, ['E'] = 14, ['F'] = 15, --'A'‑'F'
	['a'] = 10, ['b'] = 11, ['c'] = 12, ['d'] = 13, ['e'] = 14, ['f'] = 15, --'a'-'f'
})
