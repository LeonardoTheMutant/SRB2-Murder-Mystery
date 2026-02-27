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
	c = c or 0
	local b1, b2, b3, b4 = c:byte(1, 4)
	if (not b1) then return nil end

	if (b1 < 0x80) then return b1 --b1 is less than 128, it's a single-byte character
	elseif (b1 < 0xE0) then return (b1 - 0xC0) * 0x40 + (b2 - 0x80) --2-byte char
	elseif (b1 < 0xF0) then return (b1 - 0xE0) * 0x1000 + (b2 - 0x80) * 0x40 + (b3 - 0x80) --3-byte char
	elseif (b1 < 0xF8) then return (b1 - 0xF0) * 0x40000 + (b2 - 0x80) * 0x1000 + (b3 - 0x80) * 0x40 + (b4 - 0x80) --4-byte char
	else return nil end
end

local uni2ascii = {
	["À"]="A",
	["Á"]="A",
	["Â"]="A",
	["Ã"]="A",
	["Ä"]="A",
	["Å"]="A",
	["Æ"]="AE",
	["Ç"]="C",
	["È"]="E",
	["É"]="E",
	["Ê"]="E",
	["Ë"]="E",
	["Ì"]="I",
	["Í"]="I",
	["Î"]="I",
	["Ï"]="I",
	["Ð"]="D",
	["Ñ"]="N",
	["Ò"]="O",
	["Ó"]="O",
	["Ô"]="O",
	["Õ"]="O",
	["Ö"]="O",
	["×"]="x",
	["Ø"]="O",
	["Ù"]="U",
	["Ú"]="U",
	["Û"]="U",
	["Ü"]="U",
	["Ý"]="Y",
	["Þ"]="TH",
	["ß"]="SS",
	["à"]="a",
	["á"]="a",
	["â"]="a",
	["ã"]="a",
	["ä"]="a",
	["å"]="a",
	["æ"]="ae",
	["ç"]="c",
	["è"]="e",
	["é"]="e",
	["ê"]="e",
	["ë"]="e",
	["ì"]="i",
	["í"]="i",
	["î"]="i",
	["ï"]="i",
	["ð"]="d",
	["ñ"]="n",
	["ò"]="o",
	["ó"]="o",
	["ô"]="o",
	["õ"]="o",
	["ö"]="o",
	["÷"]="/",
	["ø"]="o",
	["ù"]="u",
	["ú"]="u",
	["û"]="u",
	["ü"]="u",
	["ý"]="y",
	["þ"]="th",
	["ÿ"]="y",
	["Ā"]="A",
	["ā"]="a",
	["Ă"]="A",
	["ă"]="a",
	["Ą"]="A",
	["ą"]="a",
	["Ć"]="C",
	["ć"]="c",
	["Ĉ"]="C",
	["ĉ"]="c",
	["Ċ"]="C",
	["ċ"]="c",
	["Č"]="C",
	["č"]="c",
	["Ď"]="D",
	["ď"]="d",
	["Đ"]="D",
	["đ"]="d",
	["Ē"]="E",
	["ē"]="e",
	["Ĕ"]="E",
	["ĕ"]="e",
	["Ė"]="E",
	["ė"]="e",
	["Ę"]="E",
	["ę"]="e",
	["Ě"]="E",
	["ě"]="e",
	["Ĝ"]="G",
	["ĝ"]="g",
	["Ğ"]="G",
	["ğ"]="g",
	["Ġ"]="G",
	["ġ"]="g",
	["Ģ"]="G",
	["ģ"]="g",
	["Ĥ"]="H",
	["ĥ"]="h",
	["Ħ"]="H",
	["ħ"]="h",
	["Ĩ"]="I",
	["ĩ"]="i",
	["Ī"]="I",
	["ī"]="i",
	["Ĭ"]="I",
	["ĭ"]="i",
	["Į"]="I",
	["į"]="i",
	["İ"]="I",
	["ı"]="i",
	["Ĳ"]="J",
	["ĳ"]="j",
	["Ĵ"]="J",
	["ĵ"]="j",
	["Ķ"]="K",
	["ķ"]="k",
	["ĸ"]="k",
	["Ĺ"]="L",
	["ĺ"]="l",
	["Ļ"]="L",
	["ļ"]="l",
	["Ľ"]="L",
	["ľ"]="l",
	["Ŀ"]="L",
	["ŀ"]="l",
	["Ł"]="L",
	["ł"]="l",
	["Ń"]="N",
	["ń"]="n",
	["Ņ"]="N",
	["ņ"]="n",
	["Ň"]="N",
	["ň"]="n",
	["ŉ"]="n",
	["Ŋ"]="N",
	["ŋ"]="n",
	["Ō"]="O",
	["ō"]="o",
	["Ŏ"]="O",
	["ŏ"]="o",
	["Ő"]="O",
	["ő"]="o",
	["Œ"]="OE",
	["œ"]="oe",
	["Ŕ"]="R",
	["ŕ"]="r",
	["Ŗ"]="R",
	["ŗ"]="r",
	["Ř"]="R",
	["ř"]="r",
	["Ś"]="S",
	["ś"]="s",
	["Ŝ"]="S",
	["ŝ"]="s",
	["Ş"]="S",
	["ş"]="s",
	["Š"]="S",
	["š"]="s",
	["Ţ"]="T",
	["ţ"]="t",
	["Ť"]="T",
	["ť"]="t",
	["Ŧ"]="T",
	["ŧ"]="t",
	["Ũ"]="U",
	["ũ"]="u",
	["Ū"]="U",
	["ū"]="u",
	["Ŭ"]="U",
	["ŭ"]="u",
	["Ů"]="U",
	["ů"]="u",
	["Ű"]="U",
	["ű"]="u",
	["Ų"]="U",
	["ų"]="u",
	["Ŵ"]="W",
	["ŵ"]="w",
	["Ŷ"]="Y",
	["ŷ"]="y",
	["Ÿ"]="Y",
	["Ź"]="Z",
	["ź"]="z",
	["Ż"]="Z",
	["ż"]="z",
	["Ž"]="Z",
	["ž"]="z",

	["Ѐ"]="E",
	["Ё"]="JO",
	["Ђ"]="DJE",
	["Ѓ"]="GJE",
	["Є"]="JE",
	["Ѕ"]="DZE",
	["І"]="I",
	["Ї"]="YI",
	["Ј"]="JE",
	["Љ"]="LJE",
	["Њ"]="NJE",
	["Ћ"]="TSHE",
	["Ќ"]="KJE",
	["Ѝ"]="I",
	["Ў"]="U",
	["Џ"]="DZHE",
	["А"]="A",
	["Б"]="B",
	["В"]="V",
	["Г"]="G",
	["Д"]="D",
	["Е"]="E",
	["Ж"]="ZH",
	["З"]="Z",
	["И"]="I",
	["Й"]="J",
	["К"]="K",
	["Л"]="L",
	["М"]="M",
	["Н"]="N",
	["О"]="O",
	["П"]="P",
	["Р"]="R",
	["С"]="S",
	["Т"]="T",
	["У"]="U",
	["Ф"]="F",
	["Х"]="H",
	["Ц"]="C",
	["Ч"]="CH",
	["Ш"]="SH",
	["Щ"]="SHCH",
	["Ъ"]="^",
	["Ы"]="Y",
	["Ь"]="'",
	["Э"]="E",
	["Ю"]="YU",
	["Я"]="YA",
	["а"]="a",
	["б"]="b",
	["в"]="w",
	["г"]="g",
	["д"]="d",
	["е"]="e",
	["ж"]="zh",
	["з"]="z",
	["и"]="i",
	["й"]="j",
	["к"]="k",
	["л"]="l",
	["м"]="m",
	["н"]="n",
	["о"]="o",
	["п"]="p",
	["р"]="r",
	["с"]="s",
	["т"]="t",
	["у"]="u",
	["ф"]="f",
	["х"]="h",
	["ц"]="c",
	["ч"]="ch",
	["ш"]="sh",
	["щ"]="shch",
	["ъ"]="^",
	["ы"]="y",
	["ь"]="'",
	["э"]="e",
	["ю"]="yu",
	["я"]="ya",
	["ѐ"]="e",
	["ё"]="e",
	["ђ"]="dje",
	["ѓ"]="gje",
	["є"]="je",
	["ѕ"]="dze",
	["і"]="i",
	["ї"]="yi",
	["ј"]="je",
	["љ"]="lje",
	["њ"]="nje",
	["ћ"]="tshe",
	["ќ"]="kje",
	["ѝ"]="i",
	["ў"]="u",
	["џ"]="dzhe"
}

--Convert UTF-8 encoded string to ASCII compatible
unicode.ascii = function(s)
	local str = ""

	if (not s) then return str end

	for i, c, b in unicode.chars(s) do
		if (uni2ascii[c]) then str = str..uni2ascii[c]
		else
			if (unicode.code(c) < 128) then str = str..c
			else str = str.."_" end --unknown symbol
		end
	end

	return str
end
