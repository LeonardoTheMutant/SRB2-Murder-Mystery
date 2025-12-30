-- HIDEO.LUA
-- Code by LeonardoTheMutant, some helpful folks from StackOverflow & GitHub, with the help of ChatGPT
--
-- A HUD/Video library
-- Yeah, "H" in "Hideo" stands for HUD and the rest 4 letters are from "Video" (nah, that's just a big Hideo Kojima refference)
--
-- DEPENDENCIES: Unicode



assert(unicode, "\x88HIDEO\x80: Unicode library is not loaded! Cannot work without it!")
rawset(_G, "HIDEO", {
	font = {}, --"VRAM" were cached font patches are stored
	charwidth = 8, --character width in pixels
	charheight = 8, --character height in pixels
	palette = {0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240} --fallback palette for Text Patch drawing
})

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

HIDEO.DrawCharUnicode = function(v, x, y, code, flags, colormap, scale)
	assert(v, "HIDEO.DrawCharUnicode() argument #1: Video drawer object expected")
	if (code and type(code) != "number") then error("HIDEO.DrawCharUnicode() argument #4: Unicode Character number should be an integer") end

	code = $ or 0xFFFD
	x = $ or 0
	y = $ or 0
	flags = $ or 0
	colormap = $ or v.getStringColormap(0)
	scale = $ or FU

	v.drawScaled(x*FU, y*FU, scale, HIDEO.GetUnicodeFont(v, code), flags, colormap)
end

--Draw strings encoded in UTF-8 formatting
--The function mostly assumes you have font with 8x8 pixel characters
HIDEO.DrawStrUnicode = function(v, x, y, str, flags, scale)
	assert(v, "HIDEO.DrawStrUnicode() argument #1: Video drawer object expected")
	if (not str) or (type(str) != "string") then error("HIDEO.DrawStrUnicode() argument #5: string expected") end

	x = $ or 0
	y = $ or 0
	flags = $ or 0
	scale = $ or FU

	--set the space width
	local spaceWidth = 4 --default to V_OLDSPACING
	if (flags & V_MONOSPACE) then spaceWidth = 8
	elseif (flags & V_6WIDTHSPACE) then spaceWidth = 6 end

	local DrawCharUnicode = HIDEO.DrawCharUnicode
	local getStringColormap = v.getStringColormap

	--scale down if we want x0.5 font
	spaceWidth = FixedMul($, scale)
	local charWidth = FixedMul(HIDEO.charwidth, scale)

	--character position
	local cx = x
	local cy = y
	local tx, ty

	--tile position on the sheet

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
			cy = $ + FixedMul(HIDEO.charheight, scale)
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
			color = getStringColormap((HEX2INT[c:byte()] or 0) * 4096)
			isTextCode = false
			continue
		end

		--draw the character
		DrawCharUnicode(v, cx, cy, unicode.code(c), flags, color, scale)
		cx = $ + charWidth
	end
end

--Get string width for the HIDEO.DrawStrUnicode() function
HIDEO.StrWidthUnicode = function(str, flags, scale)
	if (not str) or (str == "") then return 0 end
	flags = $ or 0
	scale = $ or FU

	local lineheight = FixedMul(8, scale)

	--symbol width
	local pixelLen = 0

	--set the space width
	local spaceWidth = 4 --default to V_OLDSPACING
	if (flags & V_MONOSPACE) then spaceWidth = 8
	elseif (flags & V_6WIDTHSPACE) then spaceWidth = 6 end

	--scale down for x0.5 (if needed)
	spaceWidth = FixedMul($, scale)
	local charWidth = FixedMul(HIDEO.charwidth, scale)

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
		pixelLen = $ + charWidth
	end

	return pixelLen
end

local function splitLine(str) --Split line by newline characters
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

HIDEO.DrawStrUnicode_Center = function(v, x, y, str, flags, scale)
	x = $ or 0
	y = $ or 0
	scale = $ or FU

	local DrawStrUnicode = HIDEO.DrawStrUnicode

	local lineheight = FixedMul(HIDEO.charheight, scale)

	local strs = splitLine(str)
	for i = 1, #strs do
		DrawStrUnicode(v, (x - (HIDEO.StrWidthUnicode(strs[i], flags, scale) / 2)), y + (i * lineheight) - lineheight, strs[i], flags, scale)
	end
end

HIDEO.DrawStrUnicode_Right = function(v, x, y, str, flags, scale)
	x = $ or 0
	y = $ or 0
	scale = $ or FU

	local DrawStrUnicode = HIDEO.DrawStrUnicode

	local lineheight = FixedMul(HIDEO.charheight, scale)

	local strs = splitLine(str)
	for i = 1, #strs do
		DrawStrUnicode(v, (x - HIDEO.StrWidthUnicode(str, flags, scale)), y + (i * lineheight) - lineheight, str, flags, scale)
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

	unsigned char *palette[16]; //Collections of Palettes for the patch, values in each palette are indexes to the SRB2 palette

	//2D table of rows & columns where each hexadecimal digit is an index to the Text Patch Palette color, space symbol is transparent pixel
	char **image;
} textpatch_t

]]

--Draw an image from the Text Patch, similar to v.draw()
--Arguments:
--
--	v			- Video Drawer object
--	x			- X coordinate to draw at
--	y			- Y coordinate to draw at
--	patch		- Text Patch to draw
--	paletteNo	- Number of the Text Patch's palette to use
--	flags		- Any of the following flags: V_NOSCALESTART, V_SNAPTOTOP, V_SNAPTOBOTTOM, V_SNAPTOLEFT and V_SNAPTORIGHT
HIDEO.DrawTextPatch = function(v, x, y, patch, paletteNo, flags)
	assert(v, "HIDEO.DrawTextPatch() argument #1: Video drawer object expected")
	x = x or 0
	y = y or 0
	assert(patch, "HIDEO.DrawTextPatch() argument #4: textpatch_t expected")
	assert(patch.image, "HIDEO.DrawTextPatch() argument #4: given textpatch_t lacks the data/image table")
	flags = flags or 0

	local drawFill = v.drawFill
	local tmp = paletteNo or 0 --multipurpose variable, right now it is a palette number
	local palette, color, rowStr, rowLen, column, runStart, runEnd, nxt

	if (patch.palette and patch.palette[tmp]) then palette = patch.palette[tmp] end
	if (not palette) then palette = HIDEO.palette end --fallback palette

	local xo = x - (patch.xoff or 0) - 1
	local yo = y - (patch.yoff or 0) - 1

	for row = 1, #patch.image do
		rowStr = patch.image[row]
		rowLen = #rowStr
		column = 1

		while (column <= rowLen) do
			tmp = rowStr:byte(column) --pixel value

			if (tmp == 32) then column = column + 1 --Transparent pixel? Skip it
			else --Not transparent pixel
				color = palette[(HEX2INT[tmp] or 0) + 1] or 0

				runStart = column; runEnd = column

				--determine how much identical pixels we can draw horizontally with one drawFill() call
				while (runEnd < rowLen) do
					nxt = rowStr:byte(runEnd + 1)
					if (nxt == 32) then break end --next pixel is transparent pixel
					if ((palette[(HEX2INT[nxt] or 0) + 1] or 0) != color) then break end --next pixel has a different color than the current one
					runEnd = runEnd + 1
				end

				drawFill((xo + column), (yo + row), (runEnd - runStart + 1), 1, color|flags)
				column = runEnd + 1
			end
		end
	end
end

--Get the Width of the Text Patch
HIDEO.GetTextPatchWidth = function(patch)
	assert(patch, "HIDEO.GetTextPatchWidth() argument #1: textpatch_t expected")
	local width = 0

	if (patch.image)
		for row = 1, #patch.image do
			if (patch.image[row] and (#patch.image[row] > width)) then width = #patch.image[row] end
		end
	end

	return width
end

--Get the Height of the Text Patch
HIDEO.GetTextPatchHeight = function(patch)
	assert(patch, "HIDEO.GetTextPatchHeight() argument #1: textpatch_t expected")
	if (patch.image) then return #patch.image
	else return 0 end
end

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
HIDEO.WordWrap = function(x, w, option, scale, str)
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
		if (((c >= 9) and (c <= 13)) or (c == 32))
			--unprintable character
			chw = spacewidth
			lastusablespace = i
		else
			--regular, printable character
			if (charwidth == 0) then chw = HIDEO.charwidth
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
