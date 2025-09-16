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
