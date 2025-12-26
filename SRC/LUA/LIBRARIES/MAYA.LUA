-- MAYA.LUA
-- Code by LeonardoTheMutant & the people who commited to the SRB2 source code
--
-- "Messages And Ymportant Annoucements"
-- A modified port of SRB2's chat system that supports UTF-8 encoding

-- DEPENDENCIES: Caroline, Hideo, MichaelMyers

rawset(_G, "MAYA", {debug = true})

local cv_con_backcolor = CV_FindVar("con_backcolor")
local cv_chatnotifications = CV_FindVar("chatnotifications")
local cv_chatmode = CV_FindVar("chatmode")
local cv_chatwidth = CV_FindVar("chatwidth")
local cv_chatheight = CV_FindVar("chatheight")
local cv_chattime = CV_FindVar("chattime")
local cv_chatbacktint = CV_FindVar("chatbacktint")

local CHAT_BUFSIZE = 64
local FONTSTART = 22
local FONTEND = 126
local FONTSIZE = FONTEND - FONTSTART + 1

local function chatcolor2hudcolor(c)
	if ((not c) or (c % 0x1000) or (c > V_INVERTMAP)) then return "\x80" end
	switch(c, {
		[V_MAGENTAMAP] = do c = "^1" end,
		[V_YELLOWMAP] = do c = "^2" end,
		[V_GREENMAP] = do c = "^3" end,
		[V_BLUEMAP] = do c = "^4" end,
		[V_REDMAP] = do c = "^5" end,
		[V_GRAYMAP] = do c = "^6" end,
		[V_ORANGEMAP] = do c = "^7" end,
		[V_SKYMAP] = do c = "^8" end,
		[V_PURPLEMAP] = do c = "^9" end,
		[V_AQUAMAP] = do c = "^a" end,
		[V_PERIDOTMAP] = do c = "^b" end,
		[V_AZUREMAP] = do c = "^c" end,
		[V_BROWNMAP] = do c = "^d" end,
		[V_ROSYMAP] = do c = "^e" end,
		[V_INVERTMAP] = do c = "^f" end,
		['default'] = do c = "^0" end
	})
	return c
end

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

MAYA.SendBuffer = {}
for i = -1, 33 do MAYA.SendBuffer[i] = {} end

MAYA.spam_tokens = {}
for i = 0, 31 do MAYA.spam_tokens[i] = 1 end --fill the buffer with 1 so the motd can be sent.
MAYA.spam_tics = {}
for i = 0, 31 do MAYA.spam_tics[i] = 0 end

MAYA.teamtalk = false

local chatx = 13
local chaty = 169

--Default keyboard layout
MAYA.KeyboardLayout = {
	[false] = { --No modifier buttons
		[39] = "'",
		[42] = "*",
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
		[122] = "z",
		[199] = "7",
		[200] = "8",
		[201] = "9",
		[202] = "-",
		[203] = "4",
		[204] = "5",
		[205] = "6",
		[206] = "+",
		[207] = "1",
		[208] = "2",
		[209] = "3",
		[228] = "/"
	},
	[true] = { --SHIFT
		[39] = "\"",
		[42] = "*",
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
		[59] = ":",
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
		[122] = "Z",
		[199] = "7",
		[200] = "8",
		[201] = "9",
		[202] = "-",
		[203] = "4",
		[204] = "5",
		[205] = "6",
		[206] = "+",
		[207] = "1",
		[208] = "2",
		[209] = "3",
		[228] = "/"
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
	for i = 1, #MAYA.w_chat do
		if (MAYA.w_chat:byte(i) == 32) target = $ + 1 end
	end
	if (target == #MAYA.w_chat) then return end
	target = 0

	MAYA.c_input = 1

	if (MAYA.CHAT_MUTE)
		if (cv_mute.value)
			MAYA.Chatprint("^5>ERROR: The chat is muted. You can't say anything.", false)
		else
			MAYA.Chatprint("^5>ERROR: You have been muted. You can't say anything.", false)
		end
		return
	end

	if (#MAYA.w_chat > 4 and string.sub(MAYA.w_chat, 1, 3) == "/pm") --used /pm
		local spc = 1

		if (MAYA.teamtalk)
			MAYA.Chatprint("^5Cannot send PM in Say-Team", false)
			return
		end

		local playernum = MAYA.w_chat:sub(4, 5)
		if not (tonumber(playernum:sub(1, 1)) and tonumber(playernum:sub(2, 2)))
			--Check if playernum[1] is a space
			if (playernum:byte(2, 2) == 32) then spc = 0 --let it slide
			else
				MAYA.Chatprint("^2NOTICE: ^0Invalid command format. Correct format is \'/pm<player num> \'.", false)
				return
			end
		end

		if (spc != 0 and MAYA.w_chat:byte(MAYA.w_chat, 6, 6) != 32)
			MAYA.Chatprint("^2NOTICE: ^0Invalid command format. Correct format is \'/pm<player num> \'.", false)
			return
		end

		target = tonumber(playernum) or 0

		if (target < 32 and valid(players[target])) --player exists
			target = $ + 1; --even though playernums are from 0 to 31, target is 1 to 32
		else
			MAYA.Chatprint(string.format("^2NOTICE: ^0Player %d does not exist", target), false)
			return
		end

		--we need to get rid of the /pm<player_num>
		MAYA.w_chat = $:sub(6 + spc)
	end

	if (MAYA.teamtalk) then target = -1 end

	switch(target, {
		[-1] = do
			COM_BufInsertText(consoleplayer, "SAYTEAM \""..MAYA.w_chat.."\"")
		end,
		[0] = do
			COM_BufInsertText(consoleplayer, "SAY \""..MAYA.w_chat.."\"")
		end,
		['default'] = do
			COM_BufInsertText(consoleplayer, "SAYTO "..(target - 1).." \""..MAYA.w_chat.."\"")
		end
	})
end

MAYA.RecieveChatMessage = function(sender, target, msg)
	local action
	--Handle "/me" actions, but only in messages to everyone
	if (target == 0) and (#msg > 4) and (string.sub(msg, 1, 4) == "/me ")
		msg = $:sub(5)
		action = true
	end

	local dispname = sender.name

	local pn --player number
	if (isdedicatedserver) then pn = 0 --#consoleplayer fails for dedicated hosts, we have to make the server's player number ourself
	else pn = #consoleplayer end

	if (sender == consoleplayer) or (target == -1 and MM.AreTeammates(consoleplayer, sender)) or (target == 0) or (pn == target - 1)
		local prefix = ""
		local cstart = ""
		local cend = ""
		local adminchar = "^2~^3"
		local remotechar = "^2@^3"
		local fmt2
		local textcolor = "^0"
		local tempchar

		--Is player dead?
		if (sender.spectator)
			cstart = "^6"
			textcolor = "^6"
		elseif (target == -1) --say team
			cstart = MM.RoleColorHUD[sender.mm.role] or ""
			textcolor = cstart
		else
			cstart = chatcolor2hudcolor(skincolors[sender.skincolor or 1].chatcolor)
		end
		prefix = cstart

		--Give admins and remote admins their symbols
		if (sender == server) or (IsPlayerAdmin(sender)) then tempchar = "" end
		if (tempchar)
			if (sender == server)
				tempchar = $..adminchar
			elseif (IsPlayerAdmin(sender))
				tempchar = $..remotechar
			end
			tempchar = $..cstart
			cstart = tempchar
		end

		if (action)
			fmt2 = "* %s%s%s%s ^2%s%s"
		elseif (target - 1 == pn) --To you
			prefix = "^2[PM]"
			cstart = "^2"
			textcolor = "^2"
			fmt2 = "%s<%s%s>%s^0 %s%s"
		elseif (target > 0) --By you, to another player
			dispname = players[target - 1].name or "MissingNo."
			prefix = "^2[TO]"
			cstart = "^2"
			fmt2 = "%s<%s%s>%s^0 %s%s"
		elseif (target == 0) --To everyone
			if (sender.spectator) fmt2 = "%s{%s%s%s}^6 %s%s"
			else fmt2 = "%s<%s%s%s>^0 %s%s" end
		else --To your team
			prefix = (MM.RoleColorHUD[sender.mm.role] or "^3").."[TEAM]"
			fmt2 = "%s<%s%s>^0%s %s%s"
		end
		if (isdedicatedserver)
			--Dedicated server console cannot interpret UTF-8 correctly, we have to either hide the entire message or show raw HEX data
			--Obviously I chose the second option. If hosters REALLY want to read the message, they can use "HEX to UTF-8" converter
			local message = {}
			local len = #msg
			for i = 1, len do message[i] = HEX[msg:byte(i)] end --Turn each character into "HEX bytes"
			MAYA.Chatprint(sender.name.." sent a global message, raw HEX data: "..table.concat(message))
		else
			if (not sender.spectator or (sender.spectator and consoleplayer.spectator))
				MAYA.Chatprint(string.format(fmt2, prefix, cstart, dispname, cend, textcolor, msg), cv_chatnotifications.value)
			end
		end
	end
end

--Main chat rendering routine
--Draws the inputbox and calls MAYA.DrawChatLog() to draw the chat log
MAYA.DrawChat = function(v)
	local boxw = cv_chatwidth.value
	local c = 0
	local y = chaty - (MAYA.typelines * MM.hud.canvas.font.small.charheight)
	local i = 0
	local saylen = #MAYA.w_chat
	local cflag = 0;
	local talk = "Say: "

	if (MAYA.teamtalk) then talk = "Team: " end

	if (MAYA.CHAT_MUTE)
		if (cv_mute.value) talk = "Chat has been muted."
		else talk = "You have been muted." end
		MAYA.typelines = 1;
		cflag = V_GRAYMAP; -- set text in gray if chat is muted.
	end

	v.drawFill(chatx, y-1, boxw, (MAYA.typelines * MM.hud.canvas.font.small.charheight) + 2, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS);
	HIDEO.DrawStrUnicode(v, (chatx + 2), y, talk, V_SNAPTOBOTTOM|V_SNAPTOLEFT|cflag, MM.hud.canvas.font.small.scale)
	c = #talk * MM.hud.canvas.font.small.charwidth
	-- if chat is muted, just draw the log and get it over with, no need to draw anything else.
	if (MAYA.CHAT_MUTE)
		MAYA.DrawChatLog(v, 0);
		return;
	end

	MAYA.typelines = 1;

	if (((#MAYA.w_chat == 0) or (MAYA.c_input == 1)) and MAYA.tick < 4)
		HIDEO.DrawCharUnicode(v, (chatx + c + 2), (y + 1), 95, V_SNAPTOBOTTOM|V_SNAPTOLEFT, nil, MM.hud.canvas.font.small.scale)
	end

	for i = 1, #MAYA.w_chat do
		local skippedline = false;
		if (MAYA.c_input == i + 1)
			local cursorx
			if (c + MM.hud.canvas.font.small.charwidth < boxw - MM.hud.canvas.font.small.charwidth) then cursorx = chatx + 2 + c + MM.hud.canvas.font.small.charwidth
			else cursorx = chatx + 1 end

			local cursory
			if (cursorx != chatx + 1) then cursory = y
			else cursory = y + MM.hud.canvas.font.small.charheight end

			if (MAYA.tick < 4) then HIDEO.DrawCharUnicode(v, cursorx, (cursory+1), 95, V_SNAPTOBOTTOM|V_SNAPTOLEFT, nil, MM.hud.canvas.font.small.scale) end

			if (cursorx == chatx + 1 and saylen == i)
				MAYA.typelines = $ + 1;
				skippedline = true;
			end
		end

		local chr = MAYA.w_chat:byte(i)
		if (chr > FONTSTART and chr ~= 32) then HIDEO.DrawCharUnicode(v, (chatx + c + 2), y, chr, V_SNAPTOBOTTOM|V_SNAPTOLEFT, nil, MM.hud.canvas.font.small.scale) end

		c = $ + MM.hud.canvas.font.small.charwidth;
		if (c > boxw-MM.hud.canvas.font.small.charwidth*2 and not skippedline)
			c = 0;
			y = $ + MM.hud.canvas.font.small.charheight;
			MAYA.typelines = $ + 1;
		end
	end

	-- handle /pm list
	if (string.sub(MAYA.w_chat, 1, 3) == "/pm" and not MAYA.teamtalk) -- 320x200 unsupported
		local count = 0;
		local p_dispy = chaty - MM.hud.canvas.font.small.charheight - 1;

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
				v.drawFill(chatx + boxw + 2, (p_dispy - (6 * count)), 48, 6, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_40TRANS)
				HIDEO.DrawStrUnicode(v, (chatx + boxw + 4), (p_dispy - (6 * count) + 1), string.format("^2%d^0 - %s", #player, name), V_SNAPTOBOTTOM|V_SNAPTOLEFT, MM.hud.canvas.font.small.scale)
				count = count + 1
			end
		end
		if (count == 0) -- no results.
			v.drawFill((chatx + boxw + 2), (p_dispy - (6 * count)), 48, 6, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS); -- fill it like the chat so the text doesn't become hard to read because of the hud.
			HIDEO.DrawStrUnicode(v, (chatx + boxw + 4), (p_dispy - (6 * count) + 1), "NO RESULT.", V_SNAPTOBOTTOM|V_SNAPTOLEFT, MM.hud.canvas.font.small.scale);
		end
	end

	MAYA.DrawChatLog(v, MAYA.typelines - 1); -- MAYA.typelines is the # of lines we're typing. If there's more than 1 then the log should scroll up to give us more space.
end

--Draw the chat log
MAYA.DrawChatLog = function(v, offset)
	local boxh = min(cv_chatheight.value, chaty/(MM.hud.canvas.font.small.charheight + 2))
	local boxw = cv_chatwidth.value
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

	y = chaty - offset*(MM.hud.canvas.font.small.charheight + 2) - MAYA.chat_scroll*(MM.hud.canvas.font.small.charheight + 2) - boxh*(MM.hud.canvas.font.small.charheight + 2) - 12

	chat_topy = y + MAYA.chat_scroll*(MM.hud.canvas.font.small.charheight + 2)
	chat_bottomy = chat_topy + boxh*(MM.hud.canvas.font.small.charheight + 2)

	v.drawFill(chatx, chat_topy, boxw, boxh*(MM.hud.canvas.font.small.charheight + 2) + 2, GetChatBacktint(cv_con_backcolor.value) | V_SNAPTOBOTTOM | V_SNAPTOLEFT | V_40TRANS)

	for i = 0, MAYA.chat_nummsg_log - 1 do
		local msg = HIDEO.WordWrap(0, boxw-MM.hud.canvas.font.small.charwidth-2, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, MM.hud.canvas.font.small.scale, MAYA.chat_log[i])
		local colormap

		local str = {}
		for i, c, b in unicode.chars(msg) do str[i] = c end

		local j = 1
		while (j <= #str) do repeat
			if (str[j] == '\n') --newline
				if not prev_linereturn then
					dy = $ + MM.hud.canvas.font.small.charheight + 2
					dx = 0
				end
				prev_linereturn = true
				j = j + 1
				break --continue
			end

			if (str[j] == '^') and (isxdigit(str[j + 1])) --Caret Code
				colormap = v.getStringColormap(HIDEO.GetColorFlagFromHexDigit(str[j + 1]))
				j = $ + 2
				break --continue
			end

			local code = unicode.code(str[j])
			prev_linereturn = false
			if (y+dy+2 >= chat_topy) and (y+dy < chat_bottomy) and (code ~= 32) then
				HIDEO.DrawCharUnicode(v, (x + dx + 2), (y + dy + 2), code, V_SNAPTOBOTTOM|V_SNAPTOLEFT, colormap, MM.hud.canvas.font.small.scale)
			end
			dx = $ + MM.hud.canvas.font.small.charwidth

			if (dx >= boxw - MM.hud.canvas.font.small.charwidth - 2 and i < MAYA.chat_nummsg_log) then
				dx = 0
				dy = $ + MM.hud.canvas.font.small.charheight + 2
				prev_linereturn = true
			end
			j = $ + 1
		until true end
		dy = $ + MM.hud.canvas.font.small.charheight + 2
		dx = 0
	end

	if (((MAYA.chat_scroll >= MAYA.chat_maxscroll) or MAYA.chat_scrollmedown) and not (MAYA.justscrolleddown or MAYA.justscrolledup or MAYA.chat_scrolltime)) --was already at the bottom of the page before new maxscroll calculation and was NOT scrolling.
		atbottom = true --we should scroll
	end
	MAYA.chat_scrollmedown = false

	MAYA.chat_maxscroll = max(dy / (MM.hud.canvas.font.small.charheight + 2) - boxh, 0)

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
	if (MAYA.chat_nummsg_min == 0) then return end --Do not draw if nothing to show

	local x = chatx+2
	local y
	local chatheight = 0
	local boxw = cv_chatwidth.value
	local dx = 0
	local dy = 0
	local prev_linereturn = false

	for i = MAYA.chat_nummsg_min, 1, -1 do
		if (MAYA.chat_mini[i - 1])
			local msg = HIDEO.WordWrap(0, (boxw - MM.hud.canvas.font.small.charwidth - 2), V_MONOSPACE, MM.hud.canvas.font.small.scale, MAYA.chat_mini[i - 1])
			for j, c, b in unicode.chars(msg) do
				if (c == '\n') --newline, get back down
					if (not prev_linereturn)
						chatheight = $ + MM.hud.canvas.font.small.charheight
						dx = 0
					end
					prev_linereturn = true
				elseif (c:byte() >= FONTSTART)
					prev_linereturn = false
					dx = $ + MM.hud.canvas.font.small.charwidth

					if (dx >= boxw-MM.hud.canvas.font.small.charwidth-2)
						dx = 0
						chatheight = $ + MM.hud.canvas.font.small.charheight
						prev_linereturn = true
					end
				end
			end
			dx = 0
			chatheight = $ + MM.hud.canvas.font.small.charheight + 2
		end
	end
	y = chaty - (chatheight + MM.hud.canvas.font.small.charheight + 2)
	prev_linereturn = false

	for i = 0, MAYA.chat_nummsg_min - 1 do
		if (MAYA.chat_mini[i])
			local timer = ((cv_chattime.value*TICRATE) - MAYA.chat_timers[i]) - cv_chattime.value*TICRATE + 9
			local transflag
			if (timer >= 0 and timer <= 9) then transflag = timer*V_10TRANS
			else transflag = 0 end
			local msg = HIDEO.WordWrap(0, boxw-MM.hud.canvas.font.small.charwidth-2, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, MM.hud.canvas.font.small.scale, MAYA.chat_mini[i])
			local colormap

			local str = {}
			for i, c, b in unicode.chars(msg) do str[i] = c end

			local j = 1
			while (j <= #str) do repeat
				if (str[j] == '\n') --newline
					if (not prev_linereturn)
						dy = $ + MM.hud.canvas.font.small.charheight
						dx = 0
					end
					prev_linereturn = true
					j = j + 1
					break --continue
				end

				if (str[j] == '^') and (isxdigit(str[j + 1])) --Caret Code
					colormap = v.getStringColormap(HIDEO.GetColorFlagFromHexDigit(str[j + 1]))
					j = $ + 2
					break --continue
				end

				prev_linereturn = false
				if (cv_chatbacktint.value)
					v.drawFill((x + dx + 2), (y + dy), MM.hud.canvas.font.small.charwidth, MM.hud.canvas.font.small.charheight, GetChatBacktint(cv_con_backcolor.value)|V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_40TRANS)
				end

				local code = unicode.code(str[j])
				if (code ~= 32)
					HIDEO.DrawCharUnicode(v, (x + dx + 2), (y + dy + 1), code, V_SNAPTOBOTTOM|V_SNAPTOLEFT|transflag, colormap, MM.hud.canvas.font.small.scale)
				end
				dx = $ + MM.hud.canvas.font.small.charwidth

				if (dx >= boxw - MM.hud.canvas.font.small.charwidth - 2) then
					dx = 0
					dy = $ + MM.hud.canvas.font.small.charheight
					prev_linereturn = true
				end
				j = j + (charlen or 1)
			until true end
			dy = $ + MM.hud.canvas.font.small.charheight + 2
			dx = 0
		end
	end
end
