-- CAROLINE.LUA
-- Code by LeonardoTheMutant
--
-- Port of some C functionality to BLUA
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
    if (string.byte(str1, #str1)) then str1 = strterm($) end
    if (string.byte(str2, #str2)) then str2 = strterm($) end

    local i = 1
    while (true)
        if (string.byte(str1, i, i) != string.byte(str2, i, i))
            if (string.byte(str1, i, i) < string.byte(str2, i, i)) then return -1
            else return 1 end
        end

        if (string.byte(str1, i, i) == 0) then return 0 end

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
