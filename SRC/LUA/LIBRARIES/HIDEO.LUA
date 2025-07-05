-- HIDEO.LUA
-- Code by LeonardoTheMutant, some helpful folks from StackOverflow & GitHub, with the help of ChatGPT
--
-- A HUD/Video library
-- Yeah, "H" in "Hideo" stands for HUD and the rest 4 letters are from "Video" (nah, that's just a big Hideo Kojima refference)



-- UTF-8 SUBLIBRARY
--
-- https://github.com/blitmap/lua-utf8-simple

rawset(_G, "utf8", {})
local pattern = '[%z\1-\127\194-\244][\128-\191]*'

-- helper function
local posrelat = function (pos, len)
	if (pos < 0) then pos = len + pos + 1 end
	return pos
end

-- MAIN

-- maps f over s's utf8 characters f can accept args: (visual_index, utf8_character, byte_index)
utf8.map = function(s, f, no_subs)
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

-- THE REST

-- generator for the above -- to iterate over all utf8 chars
utf8.chars = function(s, no_subs)
	return coroutine.wrap(function () return utf8.map(s, coroutine.yield, no_subs) end)
end

-- returns the number of characters in a UTF-8 string
utf8.len = function(s)
	-- count the number of non-continuing bytes
	return select(2, s:gsub('[^\128-\193]', ''))
end

-- replace all utf8 chars with mapping
utf8.replace = function(s, map)
	return s:gsub(pattern, map)
end

-- reverse a utf8 string
utf8.reverse = function(s)
	-- reverse the individual greater-than-single-byte characters
	s = s:gsub(pattern, function (c) return #c > 1 and c:reverse() end)

	return s:reverse()
end

-- strip non-ascii characters from a utf8 string
utf8.strip = function(s)
	return s:gsub(pattern, function (c) return #c > 1 and '' end)
end

-- like string.sub() but i, j are utf8 strings
-- a utf8-safe string.sub()
utf8.sub = function(s, i, j)
	local l = utf8.len(s)

	i =       posrelat(i, l)
	j = j and posrelat(j, l) or l

	if (i < 1) then i = 1 end
	if (j > l) then j = l end

	if (i > j) then return '' end

	local diff = j - i
	local iter = utf8.chars(s, true)

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
--Return an integer value of a single Unicode symbol
utf8.byte = function(char)
    local b1, b2 = char:byte(1, 2)
    local b3, b4 = char:byte(3, 4)
    if (b1 < 128) then return b1 --b1 is less than 128, it's a single-byte character
    elseif (b1 < 194) then return nil
    elseif (b1 < 224) then return (b1 - 192) * 64 + (b2 - 128)
    elseif (b1 < 240) then return (b1 - 192) * 64 + (b2 - 128)
    elseif (b1 < 245) then return (b1 - 240) * 262144 + (b2 - 128) * 4096 + (b3 - 128) * 64 + (b4 - 128)
	else return nil end
end

--Iterator function that returns integer values of all symbols in the string
--ChatGPT helped with this one
utf8.bytes = function(str)
	local pos = 1
	local isTextCode = false

    return do
        if (pos > #str) then return nil end

        local b1 = string.byte(str, pos)
		local bytes = 0
		local codepoint

        --"Next byte is an SRB2 text code" (Start of Header)
        if (b1 == 0x01) then
			pos = $ + 1
			if (pos <= #str) then
				isTextCode = true
                return b1 --return 1
            else
                error("Encountered SOH (\"Start of Header\", 0x01) character at the very end of the string")
            end
		elseif (isTextCode) then --Text color code
			pos = $ + 1
			isTextCode = false
			return b1
		elseif (b1 == 0x04) then --Text Formatting reset (End of Transmission)
            pos = pos + 1
            return b1 --return 4
		elseif (b1 < 0x80) then
            -- 1-byte ASCII (U+0000 - U+007F)
            codepoint = b1
            bytes = 1

        -- 2-byte UTF-8
		elseif (b1 >= 0xC2) and (b1 <= 0xDF) then
			local b2 = str:byte(pos + 1)
			if (b2 and (b2 >= 0x80) and (b2 <= 0xBF)) then
				codepoint = ((b1 & 0x1F) << 6) | (b2 & 0x3F)
				bytes = 2
			else
				codepoint = 0xFFFD
				bytes = 1
			end

		-- 3-byte UTF-8
		elseif (b1 >= 0xE0) and (b1 <= 0xEF) then
			local b2 = str:byte(pos + 1)
			local b3 = str:byte(pos + 2)
			if (b2 and b3 and ((b2 >= 0x80) and (b2 <= 0xBF)) and ((b3 >= 0x80) and (b3 <= 0xBF))) then
				codepoint = ((b1 & 0x0F) << 12) | ((b2 & 0x3F) << 6) | (b3 & 0x3F)
				bytes = 3

				-- Reject UTF-16 surrogate pairs (U+D800–DFFF)
				if ((codepoint >= 0xD800) and (codepoint <= 0xDFFF)) then
					codepoint = 0xFFFD
					bytes = 3
				end
			else
				codepoint = 0xFFFD
				bytes = 1
			end
        else --Malformed sequence
            codepoint = 0xFFFD
            bytes = 1
        end

        pos = $ + bytes
        return codepoint
    end
end



--
-- MM HUD LIBRARY (Codename "Hideo")
--

rawset(_G, "V_HideoInit", do
	MM.graphics = {unicode = {}}
end)

--Load (precache) patch into (V)RAM
rawset(_G, "V_LoadPatch", function(v, patchname)
	assert(v, "V_LoadPatch() argument #1: Video drawer object expected")
	assert(patchname, "V_LoadPatch() argument #2: Patch graphic name expected")
	if (type(patchname) != "string") then error("V_LoadCharset() argument #2: Patch graphic name expected in string type") end

	if (MM.debug and MM.graphics[patchname]) print("\x87Patch \x81"..patchname.."\x87 is already loaded into memory") end
	MM.graphics[patchname] = v.cachePatch(patchname)
	MM.DebugPrint("Loaded patch \x81"..patchname)
end)

--Unload patch from (V)RAM
rawset(_G, "V_UnloadPatch", function(patchname)
	assert(patchname, "V_UnloadPatch() argument #1: Patch graphic name expected")
	if (type(patchname) != "string") then error("V_UnloadPatch() argument #1: Patch graphic name expected in string type") end

	if (MM.graphics[patchname])
		MM.graphics[patchname] = nil
		MM.DebugPrint("Unloaded patch \x81"..patchname)
	else
		MM.DebugPrint("\x87Trying to unload patch \x81"..patchname.."\x87 that is not in the memory!")
	end
end)

--
--UNICODE STRING RENDERER
--

--Load (precache) font patch into (V)RAM
rawset(_G, "V_LoadUnicode", function(v, a)
	assert(v, "V_LoadUnicode() argument #1: Video drawer object expected")
	--assert(a, "V_LoadUnicode() argument #2: Start index integer expected")
	--assert(b, "V_LoadUnicode() argument #2: End index integer expected")
	if (a and (type(a) != "number")) then error("V_LoadUnicode() argument #2 & #3: Start & End indexes should be integer") end
	assert(MM.graphics, "MM.graphics table is not initialized!")

	if (not MM.graphics.unicode) then MM.graphics.unicode = {} end

	a = a or 0xFFFD
	local patchname = "UNIC"..string.format("%04X", a)
	if (v.patchExists(patchname))
		MM.graphics.unicode[a] = v.cachePatch(patchname)
		MM.DebugPrint("Loaded patch \x81UNIC\x82"..string.format("%04X", a).."\x80 into the Unicode Character Table")
	end
end)

--Retrieve a precached font patch from (V)RAM
rawset(_G, "V_GetUnicodePatch", function(v, chr)
	assert(v, "V_GetUnicodePatch() argument #1: Video drawer object expected")
	if (chr and type(chr) != "number") then error("V_LoadUnicode() argument #2: Unicode Character number should be integer") end
	assert(MM.graphics, "MM.graphics table is not initialized!")

	chr = chr or 0xFFFD

	if (MM.graphics.unicode[chr]) return MM.graphics.unicode[chr]
	else
		V_LoadUnicode(v, chr, chr) --try to load the character if the slot is empty
		if (MM.graphics.unicode[chr]) then return MM.graphics.unicode[chr]
		else return MM.graphics.unicode[0xFFFD] end --if character is still not found in the graphics table, replace the character with the "Replacement Character" (U+FFFD)
	end
end)

--Draw strings encoded in UTF-8 formatting
--The function mostly assumes you have font with 8x8 pixel characters
--Special escape codes:
--	\1 - Interpret the following byte as the SRB2 color & translucency code instead of the Unicode character
--	\4 - Clear the Color & Translucency effects (shortcut to the "\1\x80" text code sequence)
rawset(_G, "V_DrawStrUnicode", function(v, x, y, str, flags, small)
	assert(v, "V_DrawStrUnicode() argument #1: Video drawer object expected")
	if (not str) or (type(str) != "string") error("V_DrawStrUnicode() argument #5: string expected") end

	if (small) small = 1
	else small = 0 end

	local x = x or 0
	local y = y or 0
	local flg = flags or 0

	--set the characer encoding
	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.unicode, "MM.graphics.unicode table is not initialized!")

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & V_MONOSPACE) spaceSize = 8
	elseif (flg & V_6WIDTHSPACE) spaceSize = 6 end

	--scale down if we want x0.5 font
	spaceSize = $ >> small

	--character position
	local cx = x
	local cy = y --leftover from the older code, used as an alias

	--init variables
	local chr
	local isTextCode = false
	local color = v.getStringColormap(0) --default to white color
	local translucency = 0
	
	--draw the string
	for chr in utf8.bytes(str) do

		--SOH (Start of Header)
		--Tell the interpreter "Hey, the next character is not a unicode symbol but a text code to change the color & translucency!"
		if (chr == 0x01)
			isTextCode = true
			continue
		end

		--EOH (End of Transmission), clear the text formating
		if (chr == 0x04)
			color = v.getStringColormap(0)
			translucency = 0
			continue
		end

		--newline
		if (chr == 0x0A)
			cx = x --carriage return
			cy = $ + (8 >> small)
		end

		--characters from 0x80 to 0xFF (128 - 255 in decimal) set the color AND translucency
		if ((chr >= 0x80) and (chr <= 0xFF) and isTextCode) then
			color = v.getStringColormap((chr & 0x7F & 0x0F) << 12)
			translucency = ((chr - 0x80) >> 4) << 16
			isTextCode = false
			continue
		end

		--draw the character
		if ((chr > 0x0F) and (chr != 0x20))
			v.drawScaled((cx << FRACBITS), (cy << FRACBITS), (FU >> small), V_GetUnicodePatch(v, chr), flg|translucency, color)
		end

		--shift position for the next character
		if (chr == 0x20) then cx = $ + spaceSize --space has a different character width
		else
			if (chr > 0x0F) then cx = $ + (V_GetUnicodePatch(v, chr).width >> small) end --it's a regular character
		end
	end
end)

--Get string width for the V_DrawStrUnicode() function
rawset(_G, "V_StrWidthUnicode", function(str, flags, small)
	if (not str) or (str == "") return 0 end

	if (small) small = 1
	else small = 0 end

	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.unicode, "MM.graphics.unicode table is not initialized!")

	--symbol width
	local flg = flags or 0
	local pixelLen = 0

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & V_MONOSPACE) then spaceSize = 8
	elseif (flg & V_6WIDTHSPACE) then spaceSize = 6 end

	--scale down for x0.5 (if needed)
	spaceSize = $ >> small

	local char

	for char in utf8.bytes(str)
		if (char == 0x20) then pixelLen = $ + spaceSize --space
		elseif ((char > 0x20) and MM.graphics.unicode[char]) then --we count only visible charactrers
			pixelLen = $ + (MM.graphics.unicode[char].width >> small)
		end
	end
	return pixelLen
end)

rawset(_G, "V_DrawStrUnicode_Center", function(v, x, y, str, flags, small)
	V_DrawStrUnicode(v, (x - (V_StrWidthUnicode(str, flags, small) >> 1)), y, str, flags, small)
end)
rawset(_G, "V_DrawStrUnicode_Right", function(v, x, y, str, flags, small)
	V_DrawStrUnicode(v, (x - V_StrWidthUnicode(str, flags, small)), y, str, flags, small)
end)



--
--TEXT PATCH RENDERING & MANIPULATION
--

--Draw an image from the Text Patch, similar to v.draw()
--The Text Patch itself is a table of strings where each byte in the string is the SRB2 color index
rawset(_G, "V_DrawTextPatch", function(v, x, y, xoff, yoff, patch, flags)
	assert(MM.graphics, "MM.graphics table is not initialized!")

	assert(v, "V_DrawTextPatch() argument #1: Video drawer object expected")
	local x = x or 0
	local y = y or 0
	local xoff = xoff or 0 --X offset
	local yoff = yoff or 0 --Y offset
	assert(patch, "V_DrawTextPatch() argument #4: patch text data expected")

	local pixelColor

	for row = 1, #patch do
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor != 0xFF) --pixel is not transparent
				v.drawFill((x - xoff + (column - 1)), (y - yoff + (row - 1)), 1, 1, pixelColor|flags) --draw it
			end
		end
	end
end)

--Swap colors in the Text Patch
--Each pixel of the color1 will be replaced by color2
rawset(_G, "V_TextPatch_SwapColor", function(patch, color1, color2)
	assert(patch, "V_TextPatch_SwapColor() argument #1: patch text data expected")
	local color1 = color1
	if (type(color1) == "string") color1 = color1:byte() end
	local color2 = color2
	if (type(color2) == "string") color2 = color2:byte() end

	local ptch = {} --the returned copy
	local pixelColor

	for row = 1, #patch do
		ptch[row] = patch[row] --copy line from original to copy
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor == color1) --is this the pixel we want to replace?
				ptch[row] = $:sub(1, column - 1) .. string.char(color2) .. $:sub(column + 1) --swap the color
			end
		end
	end

	return ptch
end)

--Retrieve the X Offset of the Text Patch
--This function relies on the MM.text table!
rawset(_G, "V_GetTextPatchOffsetX", function(lang, patchname)
	if (MM.text[lang][patchname.."_INFO"]) and (MM.text[lang][patchname.."_INFO"].xoff)
		return MM.text[lang][patchname.."_INFO"].xoff
	else
		return 0
	end
end)

--Retrieve the Y Offset of the Text Patch
--This function relies on the MM.text table!
rawset(_G, "V_GetTextPatchOffsetY", function(lang, patchname)
	if (MM.text[lang][patchname.."_INFO"]) and (MM.text[lang][patchname.."_INFO"].yoff)
		return MM.text[lang][patchname.."_INFO"].yoff
	else
		return 0
	end
end)

--Calculate the horizontal width of the Text Patch
rawset(_G, "V_TextPatchWidth", function(patch)
	assert(patch, "V_TextPatchWidth() argument #1: patch text data expected")
	local width = 0

	for row = 1, #patch do
		if (#patch[row] > width) then width = #patch[row] end
	end

	return width
end)

--Scroll the Text Patch by n pixels
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_ScrollTextPatch_Vertical", function(patch, offset, side)
	assert(patch, "V_ShiftTextPatch() argument #1: patch text data expected")
	if ((offset == nil) or (offset < 1)) then error("V_ShiftTextPatch() argument #2: positive offset value expected") end

	local buffer = {}

	for line = 1, #patch do
		buffer[line] = ""
		if (side)
			for i = offset, 1, -1 do
				buffer[line] = $..patch[line]:sub(i, i)
			end
			for i = #patch[line], (offset + 1), -1 do
				buffer[line] = $..patch[line]:sub(i, i)
			end
		else
			for i = offset, #patch[line] do
				buffer[line] = $..patch[line]:sub(i, i)
			end
			for i = 1, (offset - 1) do
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)

--Crop the Text Patch using relative coordinates
--Arguments:
--	startColumn	- X1 coordinate
--	endColumn	- X2
--	startLine	- Y1 coordinate
--	endLine		- Y2
--
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_CropTextPatch", function(patch, startColumn, endColumn, startLine, endLine)
	assert(patch, "V_CropTextPatch() argument #1: patch text data expected")
	if (startColumn < 0) then error("V_CropTextPatch() argument #2: positive starting column position value expected") end
	if (endColumn < 0) then error("V_CropTextPatch() argument #3: positive ending column position value expected") end
	if (startLine < 0) then error("V_CropTextPatch() argument #4: positive starting line position value expected") end
	if (endLine < 0) then error("V_CropTextPatch() argument #5: positive ending line position value expected") end

	if (not startColumn) then startColumn = 1 end
	if (not endColumn) then endColumn = 1 end
	if (not startLine) then startLine = 1 end
	if (not endLine) then endLine = 1 end

	local buffer = {}

	for line = startLine, #patch do
		if (line == endLine) then break end
		buffer[line] = ""
		for i = startColumn, #patch[line] do
			if (i <= width) then
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)

--Crop the Text Patch using relative coordinates
--Arguments:
--	startColumn	- X1 coordinate
--	width		- X2, but uses the relative position from X1
--	startLine	- Y1 coordinate
--	height		- Y2, but uses the relative position from Y1
--
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_CropTextPatch_Relative", function(patch, startColumn, width, startLine, height)
	assert(patch, "V_CropTextPatch_Relative() argument #1: patch text data expected")
	if (not startColumn) then startColumn = 1 end
	if (not width) then width = V_TextPatchWidth(patch) end
	if (not startLine) then startLine = 1 end
	if (not height) then height = #patch end

	if (startColumn < 0) then error("V_CropTextPatch_Relative() argument #2: positive starting column position value expected") end
	if (width < 0) then error("V_CropTextPatch_Relative() argument #3: positive width value expected") end
	if (startLine < 0) then error("V_CropTextPatch_Relative() argument #4: positive starting line position value expected") end
	if (height < 0) then error("V_CropTextPatch_Relative() argument #5: positive height value expected") end

	local buffer = {}
	local x = 0
	local y = 0

	for line = startLine, #patch do
		y = $ + 1
		if (y > height) then break end
		buffer[line] = ""
		x = 0
		for i = startColumn, #patch[line] do
			x = $ + 1
			if (x <= width) then
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)

--Word wrapper, assisted with ChatGPT
--Although he gave a direction, I had to spend a lot of time fixing the crap code he suggested
--I know there are still bugs in this code, with color code wrapping to be precise, but I really could not figure them out
--The function returns a table with the word-wrapped string
rawset(_G, "V_WordWrapString", function(s, max_width)
	local lines = {}
	local current_line = ""
	local current_word = ""
	local visible_len = 0
	local word_len = 0

	local textcodes = ""

	local i = 1 --iterator

	while (i <= #s)
		local b1 = s:byte(i)

		-- Set formatting (SOH, Start of Header)
		if ((b1 == 0x01) and (i < #s)) then
			i = $ + 1 --skip a byte
			textcodes = "\1" .. s:sub(i, i)
			current_line = $ .. current_word .. textcodes
			visible_len = $ + word_len
			current_word = ""
			word_len = 0

		-- Reset formatting (EOT, End of Text)
		elseif (b1 == 0x04) then
			current_word = $ .. string.char(0x04)
			textcodes = ""

		-- Newline ('\n')
		elseif (b1 == 0x0A) then
			current_line = $ .. current_word --finish the current line we were doing
			table.insert(lines, current_line) --send to the buffer

			--create a new line with the currently applied text formatting
			current_line = textcodes
			current_word = ""
			visible_len = 0
			word_len = 0
			
			--Newline at the very end of the string
			if (i == #s) then table.insert(lines, "") end

		-- Space: word delimiter
		elseif (b1 == 0x20) then
			if (visible_len + word_len) > max_width then
				--reached max string length
				table.insert(lines, current_line)
				if (word_len) then current_line = textcodes .. current_word .. " "
				else current_line = textcodes end
				visible_len = word_len + 1
			else
				--continue the current line
				current_line = $ .. current_word .. " "
				visible_len = $ + word_len + 1
			end
			current_word = ""
			word_len = 0

		--Interpreting bytes as Unicode symbols
		--1-byte ASCII
		elseif (b1 < 0x80) then
			current_word = current_word .. s:sub(i, i)
			word_len = word_len + 1

		-- 2-byte UTF-8
		elseif ((b1 >= 0xC2) and (b1 <= 0xDF) and ((i + 1) <= #s)) then
			local b2 = s:byte(i + 1)
			if b2 and b2 >= 0x80 and b2 <= 0xBF then
				local cp = ((b1 & 0x1F) << 6) | (b2 & 0x3F)
				if (cp <= 0xFFFF) then
					current_word = current_word .. s:sub(i, i + 1)
					word_len = $ + 1
				else
					current_word = $ .. "�"
					word_len = $ + 1
				end
				i = i + 1
			else
				current_word = $ .. "�"
				word_len = $ + 1
			end

		-- 3-byte UTF-8
		elseif ((b1 >= 0xE0) and (b1 <= 0xEF) and ((i + 2) <= #s)) then
			local b2 = s:byte(i + 1)
			local b3 = s:byte(i + 2)
			if (b2 and b3 and ((b2 >= 0x80) and (b2 <= 0xBF)) and ((b3 >= 0x80) and (b3 <= 0xBF))) then
				local cp = ((b1 & 0x0F) << 12) | ((b2 & 0x3F) << 6) | (b3 & 0x3F)
				if (cp <= 0xFFFF) then
					current_word = $ .. s:sub(i, i + 2)
					word_len = $ + 1
				else
					current_word = $ .. "�"
					word_len = $ + 1
				end
				i = i + 2
			else
				current_word = $ .. "�"
				word_len = $ + 1
			end

		else
			-- invalid byte or higher multibyte char: replace with "?"
			current_word = $ .. "�"
			word_len = $ + 1
		end

		i = $ + 1
	end

	-- Handle last word
	if (#current_word) then
		if (visible_len + word_len) > max_width then
			table.insert(lines, current_line)
			current_line = textcodes .. current_word
		else
			current_line = $ .. current_word
		end
	end

	-- Add final line
	if (#current_line) then table.insert(lines, current_line) end

	return lines
end)
