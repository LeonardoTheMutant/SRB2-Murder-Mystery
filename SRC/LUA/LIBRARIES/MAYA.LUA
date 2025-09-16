-- MAYA.LUA
-- Code by LeonardoTheMutant & the people who commited to the SRB2 source code
--
-- A modified port of SRB2's chat system that supports UTF-8 encoding
-- You can tell is it a messaging lib by the name

-- DEPENDENCIES: Caroline, Hideo

rawset(_G, "MAYA", {debug = true})

local cv_con_backcolor = CV_FindVar("con_backcolor")
local cv_chatmode = CV_FindVar("chatmode")
local cv_chatwidth = CV_FindVar("chatwidth")
local cv_chatheight = CV_FindVar("chatheight")
local cv_chattime = CV_FindVar("chattime")
local cv_chatbacktint = CV_FindVar("chatbacktint")

local CHAT_BUFSIZE = 64
local FONTSTART = 22
local FONTEND = 126
local FONTSIZE = FONTEND - FONTSTART + 1

MAYA.CHAT_MUTE = false
MAYA.OLD_MUTE = false

MAYA.c_input = 1
MAYA.w_chat = ""
MAYA.tick = 0
MAYA.typelines = 1

MAYA.chat_nummsg_log = 0;
MAYA.chat_nummsg_min = 0;

MAYA.chat_scroll = 0;
MAYA.chat_scrolltime = 0;
MAYA.chat_maxscroll = 0
MAYA.chat_scrollmedown = false
MAYA.justscrolleddown = false
MAYA.justscrolledup = false

MAYA.chat_log = {}
MAYA.chat_mini = {}
MAYA.chat_timers = {}
table.fill(MAYA.chat_timers, 0, 0, 7)

MAYA.spam_tokens = {}
for i = 0, 31 do MAYA.spam_tokens[i] = 1 end --fill the buffer with 1 so the motd can be sent.
MAYA.spam_tics = {}
for i = 0, 31 do MAYA.spam_tics[i] = 0 end

MAYA.teamtalk = false

local chatx = 13
local chaty = 169

--Default keyboard layout
MAYA.defaultLayout = {
	[1] = { --No modifier buttons
		[39] = "'",
		[44] = ",",
		[45] = "-",
		[46] = ".",
		[47] = "/",
		[48] = "0",
		[49] = "1",
		[50] = "2",
		[51] = "3",
		[52] = "4",
		[53] = "5",
		[54] = "6",
		[55] = "7",
		[56] = "8",
		[57] = "9",
		[59] = ";",
		[61] = "=",
		[91] = "[",
		[92] = "\\",
		[93] = "]",
		[96] = "`",
		[97] = "a",
		[98] = "b",
		[99] = "c",
		[100] = "d",
		[101] = "e",
		[102] = "f",
		[103] = "g",
		[104] = "h",
		[105] = "i",
		[106] = "j",
		[107] = "k",
		[108] = "l",
		[109] = "m",
		[110] = "n",
		[111] = "o",
		[112] = "p",
		[113] = "q",
		[114] = "r",
		[115] = "s",
		[116] = "t",
		[117] = "u",
		[118] = "v",
		[119] = "w",
		[120] = "x",
		[121] = "y",
		[122] = "z"
	},
	[2] = { --SHIFT
		[39] = "\"",
		[44] = "<",
		[45] = "_",
		[46] = ">",
		[47] = "?",
		[48] = ")",
		[49] = "!",
		[50] = "@",
		[51] = "#",
		[52] = "$",
		[53] = "%",
		[54] = "^",
		[55] = "&",
		[56] = "*",
		[57] = "(",
		[59] = ";",
		[61] = "+",
		[91] = "{",
		[92] = "|",
		[93] = "}",
		[96] = "~",
		[97] = "A",
		[98] = "B",
		[99] = "C",
		[100] = "D",
		[101] = "E",
		[102] = "F",
		[103] = "G",
		[104] = "H",
		[105] = "I",
		[106] = "J",
		[107] = "K",
		[108] = "L",
		[109] = "M",
		[110] = "N",
		[111] = "O",
		[112] = "P",
		[113] = "Q",
		[114] = "R",
		[115] = "S",
		[116] = "T",
		[117] = "U",
		[118] = "V",
		[119] = "W",
		[120] = "X",
		[121] = "Y",
		[122] = "Z"
	},
	[3] = { --ALT
		[39] = "'",
		[44] = ",",
		[45] = "-",
		[46] = ".",
		[47] = "/",
		[48] = "0",
		[49] = "1",
		[50] = "2",
		[51] = "3",
		[52] = "4",
		[53] = "5",
		[54] = "6",
		[55] = "7",
		[56] = "8",
		[57] = "9",
		[59] = ";",
		[61] = "=",
		[91] = "[",
		[92] = "\\",
		[93] = "]",
		[96] = "`",
		[97] = "a",
		[98] = "b",
		[99] = "c",
		[100] = "d",
		[101] = "e",
		[102] = "f",
		[103] = "g",
		[104] = "h",
		[105] = "i",
		[106] = "j",
		[107] = "k",
		[108] = "l",
		[109] = "m",
		[110] = "n",
		[111] = "o",
		[112] = "p",
		[113] = "q",
		[114] = "r",
		[115] = "s",
		[116] = "t",
		[117] = "u",
		[118] = "v",
		[119] = "w",
		[120] = "x",
		[121] = "y",
		[122] = "z"
	},
	[4] = { --SHIFT + ALT
		[39] = "\"",
		[44] = "<",
		[45] = "_",
		[46] = ">",
		[47] = "?",
		[48] = ")",
		[49] = "!",
		[50] = "@",
		[51] = "#",
		[52] = "$",
		[53] = "%",
		[54] = "^",
		[55] = "&",
		[56] = "*",
		[57] = "(",
		[59] = ";",
		[61] = "+",
		[91] = "{",
		[92] = "|",
		[93] = "}",
		[96] = "~",
		[97] = "A",
		[98] = "B",
		[99] = "C",
		[100] = "D",
		[101] = "E",
		[102] = "F",
		[103] = "G",
		[104] = "H",
		[105] = "I",
		[106] = "J",
		[107] = "K",
		[108] = "L",
		[109] = "M",
		[110] = "N",
		[111] = "O",
		[112] = "P",
		[113] = "Q",
		[114] = "R",
		[115] = "S",
		[116] = "T",
		[117] = "U",
		[118] = "V",
		[119] = "W",
		[120] = "X",
		[121] = "Y",
		[122] = "Z"
	}
}

local function GetChatBacktint(c)
	switch(c, {
		[0] = do c = 15 end,	--White
		[1] = do c = 31 end,	--Black
		[2] = do c = 251 end,	--Sepia
		[3] = do c = 239 end,	--Brown
		[4] = do c = 215 end,	--Pink
		[5] = do c = 37 end,	--Raspberry
		[6] = do c = 47 end,	--Red
		[7] = do c = 53 end,	--Creamsicle
		[8] = do c = 63 end,	--Orange
		[9] = do c = 56 end,	--Gold
		[10] = do c = 79 end,	--Yellow
		[11] = do c = 119 end,	--Emerald
		[12] = do c = 111 end,	--Green
		[13] = do c = 136 end,	--Cyan
		[14] = do c = 175 end,	--Steel
		[15] = do c = 166 end,	--Periwinkle
		[16] = do c = 159 end,	--Blue
		[17] = do c = 187 end,	--Purple
		[18] = do c = 199 end,	--Lavender
		['default'] = do c = 111 end --Default Green
	})
	return c
end

MAYA.DebugPrint = function(str, ...)
	if (MAYA.debug) printf("\x85MAYA\x80: %s", str, {...}) end
end

--Decode the message sent by MAYA protocol
MAYA.Decode = function(data)
	local out = {}
	local len = #data
	for i = 1, len, 2 do
		out[#out + 1] = HEX2CHAR[data:sub(i, i+1)]
	end
	return table.concat(out)
end

--Remove the latest message from chat log
MAYA.RemoveChatText_Log = do
	MAYA.DebugPrint("RemoveChatText_Log()")
	for i = 0, MAYA.chat_nummsg_log - 1 do
		MAYA.chat_log[i] = MAYA.chat_log[i + 1]
	end
	MAYA.chat_nummsg_log = $ - 1
end

--Remove the latest message from the mini chat log
MAYA.RemoveChatText_Mini = do
	MAYA.DebugPrint("RemoveChatText_Mini()")
	for i = 0, MAYA.chat_nummsg_min - 2 do
		MAYA.chat_mini[i] = MAYA.chat_mini[i+1]
		MAYA.chat_timers[i] = MAYA.chat_timers[i+1]
	end
	MAYA.chat_nummsg_min = $ - 1
end

--Add some text into the chat log and mini chat log
MAYA.Chatprint = function(text, playsound)
	if (isdedicatedserver)
		print(text)
	else
		if (playsound and cv_chatmode.value != 2) then S_StartSound(nil, sfx_radio) end

		if (MAYA.chat_nummsg_log >= CHAT_BUFSIZE) then MAYA.RemoveChatText_Log() end
		MAYA.chat_log[MAYA.chat_nummsg_log] = text
		MAYA.chat_nummsg_log = $ + 1

		if (MAYA.chat_nummsg_min >= 8) then MAYA.RemoveChatText_Mini() end
		MAYA.chat_mini[MAYA.chat_nummsg_min] = text
		MAYA.chat_timers[MAYA.chat_nummsg_min] = TICRATE*cv_chattime.value
		MAYA.chat_nummsg_min = $ + 1
	end
end

--Add system text into the chat log only
MAYA.SystemChatprint = function(text)
	if (MAYA.chat_nummsg_log >= CHAT_BUFSIZE) then MAYA.RemoveChatText_Log() end
	MAYA.chat_log[MAYA.chat_nummsg_log] = text
	MAYA.chat_nummsg_log = $ + 1
end

MAYA.ChatprintPM = function(player, text)
	if (player ~= consoleplayer) then return end --This chat text is not for us to display

	MAYA.Chatprint(text)
end

--Send message typed by the user into the chat
MAYA.SendChatMessage = do
	local target = 0

	--If our message was nothing but spaces, don't send it
	for i = 1, utf8.len(MAYA.w_chat) do
		if (utf8.byte(utf8.sub(MAYA.w_chat, i, i)) == 32) target = $ + 1 end
	end
	if (target == utf8.len(MAYA.w_chat)) then return end
	target = 0

	MAYA.c_input = 1

	if (MAYA.CHAT_MUTE)
		if (cv_mute.value)
			MAYA.Chatprint("\1\x85>ERROR: The chat is muted. You can't say anything.", false)
		else
			MAYA.Chatprint("\1\x85>ERROR: You have been muted. You can't say anything.", false)
		end
		return
	end

	if (utf8.len(MAYA.w_chat) > 4 and string.sub(MAYA.w_chat, 1, 3) == "/pm") --used /pm
		local spc = 1

		if (MAYA.teamtalk)
			MAYA.Chatprint("\1\x85".."Cannot send sayto in Say-Team", false)
			return
		end

		local playernum = MAYA.w_chat:sub(4, 5)
		if not (tonumber(playernum:sub(1, 1)) and tonumber(playernum:sub(2, 2)))
			--Check if playernum[1] is a space
			if (playernum:byte(2, 2) == 32) then spc = 0 --let it slide
			else
				MAYA.Chatprint("\1\x82NOTICE: \1\x80Invalid command format. Correct format is \'/pm<player num> \'.", false)
				return
			end
		end

		if (spc != 0 and MAYA.w_chat:byte(MAYA.w_chat, 6, 6) != 32)
			MAYA.Chatprint("\1\x82NOTICE: \1\x80Invalid command format. Correct format is \'/pm<player num> \'.", false)
			return
		end

		target = tonumber(playernum) or 0

		if (target < 32 and valid(players[target])) --player exists
			target = $ + 1; --even though playernums are from 0 to 31, target is 1 to 32
		else
			MAYA.Chatprint(string.format("\1\x82NOTICE: \1\x80Player %d does not exist", target), false)
			return
		end

		--we need to get rid of the /pm<player_num>
		MAYA.w_chat = $:sub(6 + spc)
	end

	if (MAYA.teamtalk) then target = -1 end

	--Encode message into the hexadecimal form
	--Sending the message in raw binary form would be more fitting, but in our case the SRB2 console itself is a bottleneck
	local msg = {[1] = string.format("SAY $&%02d", target)}
	local len = #MAYA.w_chat
	for i = 1, len do
		msg[i + 1] = HEX[MAYA.w_chat:byte(i)]
	end
	
	--Send the message, note that we have to additionally put "$&" at the beginning of the message so that the reciever knows that we are using the "MAYA protocol"
	--Yes I know that the "console command insertion" method may be unreliable and still not safe for private messages, but it is SRB2's problem
	--STJr should provide a better way of sending or synchronizing custom data between clients
	COM_BufInsertText(consoleplayer, table.concat(msg))
end


--Word wrapper
--I HATE DEBUGGING THIS SHIT SO MUCH
MAYA.WordWrap = function(x, w, option, scale, str)
	local chars = {}
	local c
	local chw = 0
	local lastusablespace = 1
	local spacewidth = 4
	local charwidth = 0

	if (not w or w == 0) then w = 320 end
	w = $ - x
	x = 0

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

	-- split string into UTF-8 characters
	for _, c, b in utf8.chars(str) do table.insert(chars, c) end

	local i = 1
	while i <= #chars do
		local c = chars[i]
		--Skip the color code
		if (c:byte(1) == 1 and c:byte(2) & 0x80) or (c:byte(2) == 4) then
		elseif (c == "\n") --newline
			x = 0
			lastusablespace = 1
		else
			local byte = utf8.byte(c)
			if (byte < FONTSTART or byte >= FONTEND or not HIDEO.font[byte])
				chw = spacewidth
				lastusablespace = i
			else
				if (charwidth ~= 0) then chw = charwidth
				else chw = HIDEO.font[byte].width end
			end

			x = $ + FixedMul(chw, scale)

			if (lastusablespace ~= 1 and x > w)
				chars[lastusablespace] = "\n"
				i = lastusablespace
				lastusablespace = 1
				x = 0
			end
		end

		i = $ + 1
	end
	return table.concat(chars)
end

--Main chat rendering routine
--Draws the inputbox and calls MAYA.DrawChatLog() to draw the chat log
MAYA.DrawChat = function(v)
	local charwidth = 4
	local charheight = 6
	local boxw = cv_chatwidth.value
	local t = 0
	local c = 0
	local y = chaty - (MAYA.typelines*charheight)
	local i = 0
	local saylen = utf8.len(MAYA.w_chat) -- You learn new things everyday!
	local cflag = 0;
	local talk = "Say: "

	if (MAYA.teamtalk) then talk = "Team: " end

	if (MAYA.CHAT_MUTE)
		if (cv_mute.value) talk = "Chat has been muted."
		else talk = "You have been muted." end
		MAYA.typelines = 1;
		cflag = V_GRAYMAP; -- set text in gray if chat is muted.
	end

	local layoutwidth = #consoleplayer.keyboardLayout or 2
	layoutwidth = $ * charwidth + charwidth

	v.drawFill(chatx, y - 1, layoutwidth, (MAYA.typelines*charheight), GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_20TRANS)
	v.drawString(chatx + 2, y, consoleplayer.keyboardLayout or "EN", V_SNAPTOBOTTOM | V_SNAPTOLEFT, "small")
	v.drawString(chatx, chaty, "CTRL+SPACE", V_SNAPTOBOTTOM|V_SNAPTOLEFT, "small-thin")

	v.drawFill(chatx + layoutwidth, y-1, boxw - layoutwidth, (MAYA.typelines*charheight), GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS);

	HIDEO.DrawStrUnicode(v, (chatx + layoutwidth + 2), y, talk, V_SNAPTOBOTTOM|V_SNAPTOLEFT|cflag, true)
	c = #talk * charwidth
	-- if chat is muted, just draw the log and get it over with, no need to draw anything else.
	if (MAYA.CHAT_MUTE)
		MAYA.DrawChatLog(v, 0);
		return;
	end

	MAYA.typelines = 1;

	if (((utf8.len(MAYA.w_chat) == 0) or (MAYA.c_input == 1)) and MAYA.tick < 4)
		v.drawScaled((chatx + c + layoutwidth + 2)*FU, (y + 1)*FU, 32768, HIDEO.GetUnicodeFont(v, 95), V_SNAPTOBOTTOM|V_SNAPTOLEFT|t)
	end

	for i = 1, utf8.len(MAYA.w_chat) do
		local skippedline = false;
		if (MAYA.c_input == i + 1)
			local cursorx
			if (c + charwidth < boxw - charwidth - layoutwidth) then cursorx = chatx + 2 + c + charwidth
			else cursorx = chatx + 1 end

			local cursory
			if (cursorx != chatx + 1) then cursory = y
			else cursory = y + charheight end

			if (MAYA.tick < 4) then v.drawScaled((cursorx + layoutwidth)*FU, (cursory+1)*FU, 32768, HIDEO.GetUnicodeFont(v, 95), V_SNAPTOBOTTOM|V_SNAPTOLEFT|t) end

			if (cursorx == chatx + 1 and saylen == i)
				MAYA.typelines = $ + 1;
				skippedline = true;
			end
		end

		local chr = utf8.byte(utf8.sub(MAYA.w_chat, i, i))
		if (chr > FONTSTART and chr ~= 32) then
			v.drawScaled((chatx + c + layoutwidth + 2)*FU, y*FU, 32768, HIDEO.GetUnicodeFont(v, chr), V_SNAPTOBOTTOM|V_SNAPTOLEFT | t)
		end

		c = $ + charwidth;
		if (c > boxw-charwidth*2-layoutwidth and not skippedline)
			c = 0;
			y = $ + charheight;
			MAYA.typelines = $ + 1;
		end
	end

	-- handle /pm list
	if (string.sub(MAYA.w_chat, 1, 3) == "/pm" and not MAYA.teamtalk) -- 320x200 unsupported
		local count = 0;
		local p_dispy = chaty - charheight - 1;

		--"/pm" list
		for player in players.iterate do
			if (#MAYA.w_chat >= 4)
				local c4 = string.sub(MAYA.w_chat, 4, 4)
				local c5 = string.sub(MAYA.w_chat, 5, 5)
				if ((c4 ~= "" and (c4 < '0' or c4 > '9')) or (c5 ~= "" and (c5 < '0' or c5 > '9'))) and c5 ~= " " then
					break
				end

				local playernum = string.sub(MAYA.w_chat, 4, 5)
				local n = tonumber(playernum) -- turn that into a number
				-- special cases:
				-- special cases:
				if (n == 0 and c5 ~= "0" and not (#player < 10)) then
					continue
				elseif (n == 1 and c4 ~= "0" and not (#player == 1 or (#player >= 10 and #player <= 19))) then
					continue
				elseif (n == 2 and c4 ~= "0" and not (#player == 2 or (#player >= 20 and #player <= 29))) then
					continue
				elseif (n == 3 and c4 ~= "0" and not (#player == 3 or (#player >= 30 and #player <= 31))) then
					continue
				else
					if #player ~= n then continue end
				end
			end
		
			if (valid(player)) then
				local name = string.sub(player.name, 1, 7)
				v.drawFill(chatx + boxw + 2, p_dispy - (6 * count), 48, 6, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_40TRANS)
				v.drawString(chatx + boxw + 4, (p_dispy - (6 * count) + 1), string.format("\x82%d\x80 - %s", #player, name), V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_ALLOWLOWERCASE, "small")
				count = count + 1
			end
		end
		if (count == 0) -- no results.
			v.drawFill(chatx+boxw+2, p_dispy- (6*count), 48, 6, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS); -- fill it like the chat so the text doesn't become hard to read because of the hud.
			v.drawString(chatx+boxw+4, p_dispy- (6*count) + 1, "NO RESULT.", V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_ALLOWLOWERCASE, "small");
		end
	end

	MAYA.DrawChatLog(v, MAYA.typelines - 1); -- MAYA.typelines is the # of lines we're typing. If there's more than 1 then the log should scroll up to give us more space.
end

--Draw the chat log
MAYA.DrawChatLog = function(v, offset)
	local charwidth = 4
	local charheight = 6
	local boxw = cv_chatwidth.value
	local boxh = cv_chatheight.value
	local x = chatx + 2
	local y
	local dx = 0
	local dy = 0
	local i = 0
	local chat_topy, chat_bottomy
	local atbottom = false
	local prev_linereturn = false
	
	--make sure that out scroll position isn't "illegal"
	if (MAYA.chat_scroll > MAYA.chat_maxscroll) then MAYA.chat_scroll = MAYA.chat_maxscroll end

	y = chaty - offset*charheight - MAYA.chat_scroll*charheight - boxh*charheight - 12

	chat_topy = y + MAYA.chat_scroll*charheight
	chat_bottomy = chat_topy + boxh*charheight

	v.drawFill(chatx, chat_topy, boxw, boxh*charheight + 2, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS)

	local layoutwidth = #consoleplayer.keyboardLayout or 2
	layoutwidth = $ * charwidth + charwidth

	for i = 0, MAYA.chat_nummsg_log - 1 do
		local msg = MAYA.WordWrap(0, boxw-charwidth-2, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, 32768, MAYA.chat_log[i])
		local colormap
		local translucency = 0

		local j = 1
		while (j <= #msg) do
			local byte = msg:byte(j)
			switch(byte, {
				[1] = do --SOH: Set colormap & translucency
					local colorbyte = msg:byte(j + 1)
					if colorbyte then
						colormap = v.getStringColormap((colorbyte % 128 % 16) * 4096)
						translucency = ((colorbyte - 0x80) / 16) * 65536
					end
					j = j + 2 -- skip SOH and color byte
				end,
				[4] = do --EOT: Clear colormap & translucency
					colormap = v.getStringColormap(0)
					translucency = 0
					j = j + 1
				end,
				[10] = do --newline
					if not prev_linereturn then
						dy = $ + charheight
						dx = 0
					end
					prev_linereturn = true
					j = j + 1
				end,
				['default'] = do
					prev_linereturn = false
					local codepoint, charlen = utf8.decode(msg, j)
					if codepoint and codepoint >= FONTSTART then
						if (y+dy+2 >= chat_topy) and (y+dy < chat_bottomy) and codepoint ~= 32 then
							v.drawScaled((x + dx + 2)*FU, (y + dy + 2)*FU, 32768, HIDEO.GetUnicodeFont(v, codepoint), V_SNAPTOBOTTOM|V_SNAPTOLEFT|translucency, colormap)
						end
						dx = $ + charwidth
					end
					if (dx >= boxw - charwidth - 2 and i < MAYA.chat_nummsg_log) then
						dx = 0
						dy = $ + charheight
						prev_linereturn = true
					end
					j = j + (charlen or 1)
				end
			})
		end
		dy = $ + charheight
		dx = 0
	end

	if (((MAYA.chat_scroll >= MAYA.chat_maxscroll) or MAYA.chat_scrollmedown) and not (MAYA.justscrolleddown or MAYA.justscrolledup or MAYA.chat_scrolltime)) --was already at the bottom of the page before new maxscroll calculation and was NOT scrolling.
		atbottom = true --we should scroll
	end
	MAYA.chat_scrollmedown = false

	MAYA.chat_maxscroll = max(dy / charheight - cv_chatheight.value, 0)

	if (atbottom) then MAYA.chat_scroll = MAYA.chat_maxscroll end

	if (MAYA.chat_scroll > 0)
		local arg2
		if (MAYA.justscrolledup) then arg2 = chat_topy-1
		else arg2 = chat_topy end
		v.drawString(chatx-8, arg2 - 1, "\x1A", V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_YELLOWMAP, "thin")
	end

	if (MAYA.chat_scroll < MAYA.chat_maxscroll)
		local arg2
		if (MAYA.justscrolleddown) then arg2 = 5
		else arg2 = 6 end
		v.drawString(chatx-8, chat_bottomy - arg2 - 1, "\x1B", V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_YELLOWMAP, "thin")
	end

	MAYA.justscrolleddown = false
	MAYA.justscrolledup = false
end

--Draw the mini chat log
MAYA.DrawMiniChat = function(v)
	local x = chatx+2
	local y
	local chatheight = 0
	local charwidth = 4
	local charheight = 6
	local boxw = cv_chatwidth.value
	local dx = 0
	local dy = 0
	local prev_linereturn = false

	if (MAYA.chat_nummsg_min == 0) then return end --Do not draw if nothing to show

	for i = MAYA.chat_nummsg_min, 1, -1 do
		if (MAYA.chat_mini[i - 1])
			local msg = MAYA.WordWrap(0, boxw-charwidth-2, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, 32768, MAYA.chat_mini[i - 1])
			for j = 1, utf8.len(msg) do
				local byte = utf8.byte(utf8.sub(msg, j, j))
				if (byte == 10) --newline, get back down
					if (not prev_linereturn)
						chatheight = $ + charheight
						dx = 0
					end
					prev_linereturn = true
				elseif (byte >= FONTSTART)
					prev_linereturn = false
					dx = $ + charwidth

					if (dx >= boxw-charwidth-2)
						dx = 0
						chatheight = $ + charheight
						prev_linereturn = true
					end
				end
			end
			dx = 0
			chatheight = $ + charheight
		end
	end
	y = chaty - (chatheight + charheight)
	prev_linereturn = false

	for i = 0, MAYA.chat_nummsg_min - 1 do
		if (MAYA.chat_mini[i])
			local timer = ((cv_chattime.value*TICRATE) - MAYA.chat_timers[i]) - cv_chattime.value*TICRATE + 9
			local transflag
			if (timer >= 0 and timer <= 9) then transflag = timer*V_10TRANS
			else transflag = 0 end
			local msg = MAYA.WordWrap(0, boxw-charwidth-2, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, 32768, MAYA.chat_mini[i])
			local colormap
			local translucency = 0

			local j = 1
			while (j <= #msg) do
				local byte = msg:byte(j)
				switch(byte, {
					[1] = do --SOH: Set colormap & translucency
						local colorbyte = msg:byte(j + 1)
						if (colorbyte)
							colormap = v.getStringColormap((colorbyte % 128 % 16) * 4096)
							translucency = ((colorbyte - 0x80) / 16) * 65536
						end
						j = j + 2 -- skip SOH and color byte
					end,
					[4] = do --EOT: Clear colormap & translucency
						colormap = v.getStringColormap(0)
						translucency = 0
						j = j + 1
					end,
					[10] = do --newline
						if (not prev_linereturn)
							dy = $ + charheight
							dx = 0
						end
						prev_linereturn = true
						j = j + 1
					end,
					['default'] = do
						prev_linereturn = false
						if (cv_chatbacktint.value)
							v.drawFill((x + dx + 2), (y + dy), charwidth, charheight, GetChatBacktint(cv_con_backcolor.value)|V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_40TRANS)
						end

						local codepoint, charlen = utf8.decode(msg, j)
						if (codepoint and codepoint >= FONTSTART) then
							if (codepoint ~= 32) then
								v.drawScaled((x + dx + 2)*FU, (y + dy + 1)*FU, 32768, HIDEO.GetUnicodeFont(v, codepoint), V_SNAPTOBOTTOM|V_SNAPTOLEFT|translucency|transflag, colormap)
							end
							dx = $ + charwidth
						end
						if (dx >= boxw - charwidth - 2) then
							dx = 0
							dy = $ + charheight
							prev_linereturn = true
						end
						j = j + (charlen or 1)
					end
				})
			end
			dy = $ + charheight
			dx = 0
		end
	end
end
