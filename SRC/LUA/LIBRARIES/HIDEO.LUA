-- HIDEO.LUA
-- Code by LeonardoTheMutant, some helpful folks from StackOverflow & GitHub, with the help of ChatGPT
--
-- A HUD/Video library
-- Yeah, "H" in "Hideo" stands for HUD and the rest 4 letters are from "Video" (nah, that's just a big Hideo Kojima refference)
--
-- DEPENDENCIES: Unicode



assert(unicode, "\x88HIDEO\x80: Unicode library is not loaded! Cannot work without it!")
rawset(_G, "HIDEO", {font = {}})

HIDEO.debug = true

HIDEO.DebugPrint = function(str)
	if (HIDEO.debug) print("\x88HIDEO\x80: "..str) end
end

HIDEO.GetColorFlagFromHexDigit = function(c)
	if (type(c) == "string") then c = c:byte() end
	if (c >= 48 and c <= 57) then return (c - 48) * 4096 end --'0' - '9'
	if ((c >= 65 and c <= 70)) then return (c - 55) * 4096 end --'A' - 'F'
	if ((c >= 97 and c <= 102)) then return (c - 87) * 4096 end --'a' - 'f'
	return 0
end

--
--UNICODE STRING RENDERER
--

--Load (precache) font patch into (V)RAM
HIDEO.LoadUnicodeFont = function(v, a)
	assert(v, "HIDEO.LoadUnicodeFont() argument #1: Video drawer object expected")
	if (a and (type(a) != "number")) then error("HIDEO.LoadUnicodeFont() argument #2: Unicode charachter index should be integer") end

	a = a or 0xFFFD
	local patchname = "UNIC"..string.format("%04X", a)
	if (v.patchExists(patchname))
		HIDEO.font[a] = v.cachePatch(patchname)
		HIDEO.DebugPrint("Loaded patch \x81UNIC\x82"..string.format("%04X", a).."\x80 into the Unicode Font Table")
		return HIDEO.font[a]
	end
end

--Retrieve a precached font patch from (V)RAM
HIDEO.GetUnicodeFont = function(v, chr)
	assert(v, "HIDEO.GetUnicodeFont() argument #1: Video drawer object expected")
	if (chr and type(chr) != "number") then error("HIDEO.LoadUnicodeFont() argument #2: Unicode Character number should be integer") end

	chr = chr or 0xFFFD

	if (HIDEO.font[chr]) return HIDEO.font[chr]
	else
		HIDEO.LoadUnicodeFont(v, chr) --try to load the character if the slot is empty
		if (HIDEO.font[chr]) then return HIDEO.font[chr]
		else return HIDEO.font[0xFFFD] end --if character is still not found in the font table, replace the character with the "Replacement Character" (U+FFFD)
	end
end

--Draw strings encoded in UTF-8 formatting
--The function mostly assumes you have font with 8x8 pixel characters
HIDEO.DrawStrUnicode = function(v, x, y, str, flags, small)
	assert(v, "HIDEO.DrawStrUnicode() argument #1: Video drawer object expected")
	if (not str) or (type(str) != "string") error("HIDEO.DrawStrUnicode() argument #5: string expected") end

	if (small) small = 2
	else small = 1 end

	x = $ or 0
	y = $ or 0
	flags = $ or 0

	--set the space width
	local spaceWidth = 4 --default to V_OLDSPACING
	if (flags & V_MONOSPACE) spaceWidth = 8
	elseif (flags & V_6WIDTHSPACE) spaceWidth = 6 end

	--scale down if we want x0.5 font
	spaceWidth = $ / small
	local charWidth = 8 / small

	--character position
	local cx = x
	local cy = y

	--init variables
	local isTextCode
	local color = v.getStringColormap(0) --default to white color
	
	--draw the string
	for i, c, b in unicode.chars(str) do
		--space
		if (c == ' ')
			cx = $ + spaceWidth
			continue
		end

		--newline
		if (c == '\n')
			cx = x --carriage return
			cy = $ + (8 / small)
			continue
		end

		--Beginning of the color sequence
		--If we meet that symbol twice in a row it means that this is a symbol, not a color code
		if (c == '^')
			isTextCode = not $
			if (isTextCode) then continue end
		end

		--Read the color value once in a caret sequence
		if (isTextCode)
			color = v.getStringColormap(HIDEO.GetColorFlagFromHexDigit(c:byte()))
			isTextCode = false
			continue
		end

		--draw the character
		v.drawScaled((cx * FU), (cy * FU), (FU / small), HIDEO.GetUnicodeFont(v, unicode.code(c)), flags, color)
		cx = $ + charWidth
	end
end

--Get string width for the HIDEO.DrawStrUnicode() function
HIDEO.StrWidthUnicode = function(str, flags, small)
	if (not str) or (str == "") return 0 end
	flags = $ or 0

	if (small) small = 2
	else small = 1 end

	--symbol width
	local pixelLen = 0

	--set the space width
	local spaceWidth = 4 --default to V_OLDSPACING
	if (flags & V_MONOSPACE) then spaceWidth = 8
	elseif (flags & V_6WIDTHSPACE) then spaceWidth = 6 end

	--scale down for x0.5 (if needed)
	spaceWidth = $ / small
	local charWidth = 8 / small

	local isTextCode

	for i, c, b in unicode.chars(str) do
		--Caret code
		if (c == '^')
			isTextCode = not $
			if (isTextCode) then continue end --If it is not '^^' sequence ignore the symbol
		end

		--Ignore the caret code digit
		if (isTextCode) then isTextCode = false; continue end

		--Space
		if (c == ' ') then pixelLen = $ + spaceWidth; continue end --space

		--Count only visible charactrers
		if (HIDEO.font[unicode.code(c)]) then
			pixelLen = $ + charWidth
		end
	end
	return pixelLen
end

local function splitLine(str)
	local out = {}
	local i = 1
	while true do
		local pos = str:find("\n", i, true)
		if (not pos)
			table.insert(out, str:sub(i))
			break
		end
		table.insert(out, str:sub(i, pos - 1))
		i = pos + 1
	end
	return out
end

HIDEO.DrawStrUnicode_Center = function(v, x, y, str, flags, small)
	local scale
	if (small) scale = 2
	else scale = 1 end

	local lineheight = 8 / scale

	local strs = splitLine(str)
	for i = 1, #strs do
		HIDEO.DrawStrUnicode(v, (x - (HIDEO.StrWidthUnicode(strs[i], flags, small) / 2)), y + (i * lineheight) - lineheight, strs[i], flags, small)
	end
end

HIDEO.DrawStrUnicode_Right = function(v, x, y, str, flags, small)
	local scale
	if (small) scale = 2
	else scale = 1 end

	local lineheight = 8 / scale

	local strs = splitLine(str)
	for i = 1, #strs do
		HIDEO.DrawStrUnicode(v, (x - HIDEO.StrWidthUnicode(str, flags, small)), y + (i * lineheight) - lineheight, str, flags, small)
	end
end



--
--TEXT PATCH RENDERING & MANIPULATION
--

--Text Patch struct definition (in C):
--[[

typedef struct {
	int xoff; //Patch X offset
	int yoff; //Patch Y offset

	//2D table of rows & columns where each byte is a pointer to the SRB2 palette color,
	//in LUA this is simply a table of strings where each character gets converted into a byte value
	char** data;
} textpatch_t

]]

--Draw an image from the Text Patch, similar to v.draw()
HIDEO.DrawTextPatch = function(v, x, y, patch, flags)
	assert(v, "HIDEO.DrawTextPatch() argument #1: Video drawer object expected")
	local x = x or 0
	local y = y or 0
	assert(patch, "HIDEO.DrawTextPatch() argument #4: textpatch_t expected")
	assert(patch.data, "HIDEO.DrawTextPatch() argument #4: given textpatch_t lacks the data table")
	local xoff = patch.xoff or 0 --X offset
	local yoff = patch.yoff or 0 --Y offset
	local flags = flags or 0

	local color, startX, runColor
	local xo = x - xoff - 1
	local yo = y - yoff - 1

	for row = 1, #patch.data do
		if (patch.data[row])
			startX = 0
			runColor = nil
			for column = 1, #patch.data[row] do
				local pixel = patch.data[row]:byte(column)
				if (pixel == 0xFF) --Is transparent pixel?
					--Flush the loaded pixels onto screen
					if (runColor)
						v.drawFill((xo + startX), (yo + row), (column - startX), 1, runColor)
						runColor = nil
					end
				else
					color = pixel | flags
					if (runColor != color)
						--Flush the loaded pixels onto screen if met a different colored pixel in Text Patch
						if (runColor) then v.drawFill((xo + startX), (yo + row), (column - startX), 1, runColor) end
						--Start new run
						runColor = color
						startX = column
					end
				end
			end
			--Flush run if row ended
			if (runColor) then v.drawFill((xo + startX), (yo + row), (#patch.data[row] - startX + 1), 1, runColor)
			end
		end
	end
end

--Get the Width of the Text Patch
HIDEO.GetTextPatchWidth = function(patch)
	assert(patch, "HIDEO.GetTextPatchWidth() argument #1: textpatch_t expected")
	local width = 0

	if (patch.data)
		for row = 1, #patch.data do
			if (patch.data[row] and (#patch.data[row] > width)) then width = #patch.data[row] end
		end
	end

	return width
end

--Get the Height of the Text Patch
HIDEO.GetTextPatchHeight = function(patch)
	assert(patch, "HIDEO.GetTextPatchHeight() argument #1: textpatch_t expected")
	if (patch.data) then return #patch.data
	else return 0 end
end

--Swap colors in the Text Patch
--Each pixel of the color1 will be replaced by color2
HIDEO.TextPatch_SwapColor = function(patch, color1, color2)
	assert(patch, "HIDEO.TextPatch_SwapColor() argument #1: textpatch_t expected")
	assert(patch.data, "HIDEO.TextPatch_SwapColor() argument #1: given textpatch_t lacks the data table")
	local c1 = color1
	if (type(color1) == "string") c1 = color1:byte() end
	local c2 = color2
	if (type(color2) == "string") c2 = color2:byte() end

	local ptch = { --the returned copy
		xoff = patch.xoff or 0,
		yoff = patch.yoff or 0,
		data = {}
	}

	local pixel

	for row = 1, #patch.data do
		if (patch.data[row])
			local str = {}
			for column = 1, #patch.data[row] do
				pixel = patch.data[row]:byte(column, column)
				if (pixel == c1) --is this the pixel we want to replace?
					str[#str + 1] = string.char(c2) --Yes, place a replacement pixel
				else
					str[#str + 1] = string.char(pixel) --No, leave the pixel as is
				end
			end
			ptch.data[row] = table.concat(str)
		end
	end

	return ptch
end


--[[
--Scroll the Text Patch by n pixels
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
HIDEO.ScrollTextPatch_Vertical = function(patch, offset, side)
	assert(patch, "V_ShiftTextPatch() argument #1: textpatch_t expected")
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
end

--Crop the Text Patch using relative coordinates
--Arguments:
--	startColumn	- X1 coordinate
--	endColumn	- X2
--	startLine	- Y1 coordinate
--	endLine		- Y2
--
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
HIDEO.CropTextPatch = function(patch, startColumn, endColumn, startLine, endLine)
	assert(patch, "HIDEO.CropTextPatch() argument #1: textpatch_t expected")
	if (startColumn < 0) then error("HIDEO.CropTextPatch() argument #2: positive starting column position value expected") end
	if (endColumn < 0) then error("HIDEO.CropTextPatch() argument #3: positive ending column position value expected") end
	if (startLine < 0) then error("HIDEO.CropTextPatch() argument #4: positive starting line position value expected") end
	if (endLine < 0) then error("HIDEO.CropTextPatch() argument #5: positive ending line position value expected") end

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
end

--Crop the Text Patch using relative coordinates
--Arguments:
--	startColumn	- X1 coordinate
--	width		- X2, but uses the relative position from X1
--	startLine	- Y1 coordinate
--	height		- Y2, but uses the relative position from Y1
--
--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
HIDEO.CropTextPatch_Relative = function(patch, startColumn, width, startLine, height)
	assert(patch, "HIDEO.CropTextPatch_Relative() argument #1: textpatch_t expected")
	if (not startColumn) then startColumn = 1 end
	if (not width) then width = HIDEO.GetTextPatchWidth(patch) end
	if (not startLine) then startLine = 1 end
	if (not height) then height = #patch end

	if (startColumn < 0) then error("HIDEO.CropTextPatch_Relative() argument #2: positive starting column position value expected") end
	if (width < 0) then error("HIDEO.CropTextPatch_Relative() argument #3: positive width value expected") end
	if (startLine < 0) then error("HIDEO.CropTextPatch_Relative() argument #4: positive starting line position value expected") end
	if (height < 0) then error("HIDEO.CropTextPatch_Relative() argument #5: positive height value expected") end

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
end
]]

--Helper functions for below
local function isxdigit(c)
	c = c:byte()
	return ((c >= 48) and (c <= 57)) or ((c >= 65) and (c <= 70)) or (c >= 97) and (c <= 102)
end


--Word wrapper
--Ported from SRB2's Source Code (v_video.c)
--I HATE DEBUGGING THIS SHIT SO MUCH
--
--Arguments:
--	x		- canvas X position the string is drawn from;
--	w		- maximum string width in pixels, if string is too long it becomes wrapped;
--	option	- video flags to set the spacing between characters;
--	scale	- The scaling of the text (fixed_t value)
--	str		- string to word wrap
--	v		- (optional argument) drawer object, used to load missing font graphics for correct calculations
HIDEO.WordWrap = function(x, w, option, scale, str, v)
	local chars = {}
	local c
	local chw = 0
	local lastusablespace = 1
	local spacewidth = 4
	local charwidth = 0

	if (not w or w == 0) then w = 320 end
	w = $ - x
	x = 0

	scale = $ or FU

	switch(option & V_SPACINGMASK, {
		[V_MONOSPACE] = do
			spacewidth = 8
			charwidth = 8
		end,
		[V_OLDSPACING] = do
			charwidth = 8
		end,
		[V_6WIDTHSPACE] = do
			spacewidth = 6
		end
	})

	-- split string into UTF-8 characters so we can modify it
	for _, char, b in unicode.chars(str) do table.insert(chars, char) end

	local i = 1
	while (i <= #chars) do repeat
		if (chars[i] == '\n') --newline
			x = 0
			lastusablespace = 1
			i = i + 1
			break --continue
		end

		if (chars[i] == '^') and (isxdigit(chars[i + 1])) --Caret Code
			i = $ + 2
			break --continue
		end

		c = unicode.code(chars[i])
		if (not c)
			i = i + 1
			break --continue
		end

		local patch
		if (v) then patch = HIDEO.GetUnicodeFont(v, c)
		else patch = HIDEO.font[c] end
		if (((c >= 9) and (c <= 13)) or (c == 32) or not patch)
			--unprintable character
			chw = spacewidth
			lastusablespace = i
		else
			--regular, printable character
			if (charwidth == 0) then chw = patch.width
			else chw = charwidth end
		end

		x = $ + FixedMul(chw, scale)

		if (lastusablespace ~= 1 and x > w)
			--reached the width limit, add newline to wrap the string
			chars[lastusablespace] = '\n'
			i = lastusablespace
			lastusablespace = 1
			x = 0
		end

		i = $ + 1
	until true end
	return table.concat(chars)
end
