-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Chat system

local cv_chatmode = CV_FindVar("chatmode")
local cv_chatspamspeed = CV_FindVar("chatspamspeed")
local cv_chatspamburst = CV_FindVar("chatspamburst")
local cv_chatspamprotection = CV_FindVar("chatspamprotection")
local cv_mute = CV_FindVar("mute")

/*
local function CHAT_Say(s, m, me)
	local textcolor = chatcolor2textcolor(skincolors[s.skincolor].chatcolor)

	--Admin/Verified badges
	local badge = ""
	if (s == server) badge = "\x82~"..textcolor
	elseif (IsPlayerAdmin(s)) badge = "\x82@"..textcolor end

	for p in players.iterate do
		if (gamestate != GS_LEVEL) or (p.spectator) or (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if (me)
				MAYA.ChatprintPM(p, "* "..badge..s.name.."\x80 "..m:sub(5)) --"/me" message
			else
				MAYA.ChatprintPM(p, textcolor.."<"..badge..s.name..">\x80 "..m) --Normal message
			end
			S_StartSound(nil, sfx_radio, p)
		end
	end

	if (isdedicatedserver) then MAYA.ChatprintPM(server, "<"..badge..s.name.."> "..m) end
end

local function CHAT_TeamSay(s, m) --sender, message
	for p in players.iterate do
		if (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if ((p.mm.role == s.mm.role) and (s.mm.role == ROLE_MURDERER))
				MAYA.ChatprintPM(p, "\x85[TEAM]<"..s.name.."> "..m)
				S_StartSound(nil, sfx_radio, p)
			elseif (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO)
				if (s.mm.role == ROLE_SHERIFF)
					MAYA.ChatprintPM(p, "\x84[TEAM]<"..s.name.."> "..m)
				elseif (s.mm.role == ROLE_HERO)
					MAYA.ChatprintPM(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m)
				end
				S_StartSound(nil, sfx_radio, p)
			end
		end
	end
end
*/

--SAYDEAD command - Say to the Dead Chat (as Server or Administrator)
COM_AddCommand("SAYDEAD", function(p, ...) --sender, message
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery to access this command")
		return
	end
	
	--get the message string
	local arg = {...}
	local m = ""
	for i = 1, #arg do
		m = $ + arg[i]
		if (i < #arg) then m = $ + " " end --add space between words (arguments)
	end
	
	local sender
	if (p == server) then sender = "\x80~SERVER\x86"
	else sender = p.name end
	
	if (#m)
		--send the message
		for p in players.iterate do
			if (p.spectator) MAYA.ChatprintPM(p, "\x86{"..sender.."} "..m) end
		end
		if (isdedicatedserver) then CONS_Printf(server, "{"..sender.."} "..m) end
	else
		CONS_Printf(p, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat.")
	end
end, COM_ADMIN)

/*
addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype != GT_LTMMURDERMYSTERY) or (not s.mm) or (not sMM.lang) then return end

	if (s.spectator)
		switch(type, {
			[0] = do --If dead player sends a message, make that messsage appear only to the dead players
				for p in players.iterate do if (p.spectator) MAYA.ChatprintPM(p, "\x86{"..s.name.."} "..m) end end
				if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
			end,
			[2] = do --PM messages in different design for DEAD
				if (t.spectator)
					MAYA.ChatprintPM(s, "\x82[TO]\x86{"..t.name.."} "..m)
					MAYA.ChatprintPM(t, "\x82[PM]\x86{"..s.name.."} "..m)
				else CONS_Printf(s, t.name.." ".."is alive, message not sent") end
			end
		})
	else
		switch(type, {
			[0] = do
				if (m:sub(1,1) == "%") and (gamestate == GS_LEVEL)
					CHAT_TeamSay(s, m:sub(2))  --SAYTEAM shortcut
				else
					CHAT_Say(s, m, m:find("/me ", 1,4, true)) --send message normally (handle "/me" messages too)
				end
			end,
			[1] = do  --SAYTEAM
				if (gamestate == GS_LEVEL) then CHAT_TeamSay(s, m)
				else CHAT_Say(s, m) end
			end,
			[2] = do --SAYTO or "/pm"
				return false
			end
		})
	end
	return true
end)
*/

--
-- UTF-8 CHAT
--

local HU_MAXMSGLEN = 222

local ctrldown = false
local leftctrldown = false
local rightctrldown = false

local shiftdown = false
local leftshiftdown = false
local rightshiftdown = false

--
-- Get the modifier key state
--
addHook("KeyDown", function(key)
	switch(key.num, {
		[KEY_LCTRL] = do
			leftctrldown = true
		end,
		[KEY_RCTRL] = do
			rightctrldown = true
		end,
		[KEY_LSHIFT] = do
			leftshiftdown = true
		end,
		[KEY_RSHIFT] = do
			rightshiftdown = true
		end
	})
end)
addHook("KeyUp", function(key)
	switch(key.num, {
		[KEY_LCTRL] = do
			leftctrldown = false
		end,
		[KEY_RCTRL] = do
			rightctrldown = false
		end,
		[KEY_LSHIFT] = do
			leftshiftdown = false
		end,
		[KEY_RSHIFT] = do
			rightshiftdown = false
		end
	})
end)

addHook("PlayerMsg", function(s, typ, t, msg)
	if (gametype ~= GT_LTMMURDERMYSTERY) or (typ == 3) then return end

	if (cv_mute.value or s.muted and s ~= server and not IsPlayerAdmin(s))
		printf("\x87Murder Mystery\x80: \x82WARNING:\x80 Illegal say command received from %s while muted!", s.name)
		MM.PunishPlayer(s, "Usage of chat hacks")
		return true
	end

	local target
	if (typ == 1) target = -1 --SayTeam
	else
		if (t) then target = #t + 1 --SayTo
		else target = 0 end --Say
	end

	local pn --player number
	if (isdedicatedserver) then pn = 0 --#consoleplayer fails for dedicated hosts, we have to make the server's player number ourself
	else pn = #consoleplayer end

	if (target == -1 and not MM.AreTeammates(consoleplayer, s)) then return true end --ignore team messages which are not meant for us

	if (target == -1 and gamestate ~= GS_LEVEL) then target = 0 end --redirect team messages to global chat if outside the round

	local spam_eatmsg = false

	if (MAYA.spam_tokens[#s] <= 0 and cv_chatspamprotection.value)
		MAYA.DebugPrint("Received SAY cmd too quickly from Player "..(#s + 1).." ("..s.name.."), assuming as spam and blocking message.");
		MAYA.spam_tics[#s] = 0
		spam_eatmsg = true
	else
		MAYA.spam_tokens[#s] = $ - 1
	end

	if (spam_eatmsg) then return true end

	MAYA.RecieveChatMessage(s, target, msg)

	return true
end)

local last_valid = {}
local last_name = {}

local function CHAT_Ticker()
	for i = 0, 31 do
		if (MAYA.spam_tokens[i] < cv_chatspamburst.value)
			MAYA.spam_tics[i] = $ + 1
			if (MAYA.spam_tics[i] > cv_chatspamspeed.value)
				MAYA.spam_tokens[i] = $ + 1
				MAYA.spam_tics[i] = 0
			end
		end

		--
		-- TIC CATCHER
		-- Catching important system events which are usually not triggerable via standart Hooks
		--
		if (not isdedicatedserver)
			local p = players[i]
			if valid(p)
				--Player joined
				if (not last_valid[i])
					MAYA.SystemChatprint(string.format("^2*%s has joined the game (player %d)", p.name, i))
					last_valid[i] = true
					last_name[i] = p.name
				end

				--Player renamed
				if (last_name[i] and last_name[i] ~= p.name)
					if ((gamestate == GS_LEVEL) and p.spectator and (p.jointime > 70)) then MM.PunishPlayer(p, "Do not rename when dead!")
					else
						MAYA.SystemChatprint(string.format("^2*%s renamed", last_name[i]))
						last_name[i] = p.name
					end
				end
			else
				--Player left
				if (last_valid[i])
					MAYA.SystemChatprint(string.format("^2*%s left the game", last_name[i] or "Player"))
					last_valid[i] = false
					last_name[i] = nil
				end
			end
		end
	end

	if (not isdedicatedserver)
		for i = 0, MAYA.chat_nummsg_min - 1 do
			if (MAYA.chat_timers[i] > 0) then MAYA.chat_timers[i] = $ - 1
			else MAYA.RemoveChatText_Mini() end
		end

		if (gametype ~= GT_LTMMURDERMYSTERY) then return end
		MAYA.tick = $ + 1
		MAYA.tick = $ & 7

		if (MM.hud.chat.active)
			--Count down the scroll timer
			if (MAYA.chat_scrolltime > 0) then MAYA.chat_scrolltime = $ - 1 end
		end
	end
end

addHook("ThinkFrame", CHAT_Ticker)
addHook("IntermissionThinker", CHAT_Ticker)

local PUNCTUATION = [[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]]

local function M_JumpWord(line)
	if (line == "") then return 0 end
	local f = line:sub(1,1)

	if (f:match("%s"))
		--Skip a run of spaces
		local _, e = line:find("^%s+")
		return e or 0
	elseif (f:match(PUNCTUATION))
		--Skip a run of punctuation characters defined by the macro
		local _, e = line:find("^" .. PUNCTUATION .. "+")
		return e or 0
	else
		--Find the first whitespace after position 2
		local ws_pos = line:find("%s", 2)

		--Find the first punctuation after position 2
		local punc_pos = line:find(PUNCTUATION, 2)

		-- Choose the smallest positive index (if any)
		local sep_pos
		if (ws_pos and punc_pos) then sep_pos = min(ws_pos, punc_pos)
		else sep_pos = (ws_pos or punc_pos) end

		if (sep_pos) then return sep_pos - 1 --We want to land just before the separator, i.e. after the word.
		else return #line end -- No separator at all - the whole line is a single word.
	end
end

local function M_JumpWordReverse(line, offset)
	if offset <= 0 then return 0 end --nothing to move back to
	offset = min(offset, #line) --clamp to string length

	offset = offset - 1
    if offset < 1 then return 0 end--nothing left of the first char

	-- Character just before the supplied offset (Lua is 1‑based)
	local c = line:sub(offset, offset)

	-- Choose the predicate according to the character class
	local pred
	if (c:match("%s"))
		pred = function(ch) return ch:match("%s") ~= nil end
	elseif (c:match(PUNCTUATION))
		pred = function(ch) return ch:match(PUNCTUATION) ~= nil end
	else
		pred = function(ch) return ch:match("%w") ~= nil end
	end

	-- Remember whether the reference character satisfied the predicate
	local ref_match = pred(c)

	-- Walk backwards while the preceding character satisfies the same predicate
	while (offset > 1)
		local prev = line:sub(offset-1, offset-1)
		if pred(prev) == ref_match then offset = offset - 1
		else break end
	end

	return offset
end

addHook("KeyDown", function(key)
	if (gametype != GT_LTMMURDERMYSTERY) then return false end

	local c = key.num

	if (MM.hud.chat.active)
		shiftdown = leftshiftdown or rightshiftdown
		ctrldown = leftctrldown or rightctrldown

		local w_chat_table = {}
		for i = 1, #MAYA.w_chat do w_chat_table[i] = MAYA.w_chat:sub(i,i) end

		if (((c > 31) and (c < 127)) or ((c > 198) and (c < 210)) or (c == 228)) and not (ctrldown and c == KEY_SPACE)
			if (MAYA.CHAT_MUTE or (#MAYA.w_chat >= HU_MAXMSGLEN)) then return true end

			local chr
			if (c == 32) then chr = " "
			else chr = MAYA.KeyboardLayout[shiftdown][c] end

			--insert the character
			table.insert(w_chat_table, MAYA.c_input, chr) --Insert the character
			MAYA.c_input = $ + 1

			--"Compile" the string from table
			MAYA.w_chat = table.concat(w_chat_table)
		end

		--Ignore modifier keys
		--Note that we do this here so users can still set
		--their chat keys to one of these, if they so desire.
		if (c == KEY_LSHIFT) or (c == KEY_RSHIFT) or
			(c == KEY_LCTRL) or (c == KEY_RCTRL) or
			(c == KEY_LALT) or (c == KEY_RALT)
			return true
		end

		if (c == KEY_ENTER)
			if (not MAYA.CHAT_MUTE) then MAYA.SendChatMessage(); end

			MM.hud.chat.active = false
			MAYA.c_input = 1
			MAYA.chat_scrollmedown = true -- you hit enter, so you might wanna autoscroll to see what you just sent. :)
			input.setMouseGrab(true)
		elseif (c == KEY_ESCAPE or ((c == input.gameControlToKeyNum(GC_TALKKEY) or c == input.gameControlToKeyNum(GC_TEAMKEY)) and c >= KEY_MOUSE1))
			input.setMouseGrab(true)
			MM.hud.chat.active = false
			MAYA.c_input = 1
		elseif ((c == KEY_UPARROW or c == KEY_MOUSEWHEELUP) and MAYA.chat_scroll > 0)
			MAYA.chat_scroll = $ - 1
			MAYA.justscrolledup = true
			MAYA.chat_scrolltime = 4
		elseif ((c == KEY_DOWNARROW or c == KEY_MOUSEWHEELDOWN) and MAYA.chat_scroll < MAYA.chat_maxscroll and MAYA.chat_maxscroll > 0)
			MAYA.chat_scroll = $ + 1
			MAYA.justscrolleddown = true
			MAYA.chat_scrolltime = 4
		elseif ((c == KEY_PGUP) and MAYA.chat_scroll > 0)
			MAYA.chat_scroll = $ - 8
			MAYA.justscrolledup = true
			MAYA.chat_scrolltime = 4
			if (MAYA.chat_scroll < 0) MAYA.chat_scroll = 0 end
		elseif ((c == KEY_PGDN) and MAYA.chat_scroll < MAYA.chat_maxscroll and MAYA.chat_maxscroll > 0)
			MAYA.chat_scroll = $ + 8
			MAYA.justscrolleddown = true
			MAYA.chat_scrolltime = 4
			if (MAYA.chat_scroll > MAYA.chat_maxscroll) MAYA.chat_scroll = MAYA.chat_maxscroll end
		elseif (c == KEY_LEFTARROW and MAYA.c_input != 1)
			if (ctrldown) MAYA.c_input = M_JumpWordReverse(MAYA.w_chat, MAYA.c_input)
			else MAYA.c_input = $ - 1 end
		elseif (c == KEY_RIGHTARROW and MAYA.c_input <= unicode.len(MAYA.w_chat))
			print(MAYA.w_chat:sub(MAYA.c_input))
			if (ctrldown) MAYA.c_input = $ + M_JumpWord(MAYA.w_chat:sub(MAYA.c_input))
			else MAYA.c_input = $ + 1 end
		elseif (c == KEY_BACKSPACE)
			if (MAYA.CHAT_MUTE or MAYA.c_input <= 1) return true end

			table.remove(w_chat_table, MAYA.c_input - 1)
			MAYA.c_input = $ - 1
			MAYA.w_chat = table.concat(w_chat_table)
		elseif (c == KEY_DEL)
			if (MAYA.CHAT_MUTE or MAYA.c_input > unicode.len(MAYA.w_chat)) return true end

			table.remove(w_chat_table, MAYA.c_input)
			MAYA.w_chat = table.concat(w_chat_table)
		elseif (c == KEY_HOME)
			MAYA.c_input = 1
		elseif (c == KEY_END)
			MAYA.c_input = unicode.len(MAYA.w_chat) + 1
		end

		return true
	else
		if not (MAYA.OLD_MUTE or MM.hud.help.active)
			if (c == input.gameControlToKeyNum(GC_TALKKEY))
				input.setMouseGrab(false)
				MM.hud.chat.active = true
				MAYA.w_chat = ""
				MAYA.teamtalk = false
				MAYA.chat_scrollmedown = true
				MAYA.typelines = 1
				return true
			end
			if (c == input.gameControlToKeyNum(GC_TEAMKEY))
				input.setMouseGrab(false)
				MM.hud.chat.active = true
				MAYA.w_chat = ""
				if (consoleplayer.mm and consoleplayer.mm.role and not (consoleplayer.mm.role == ROLE_NONE or consoleplayer.mm.role == ROLE_CIVILIAN)) then MAYA.teamtalk = true
				else MAYA.teamtalk = false end
				MAYA.chat_scrollmedown = true
				MAYA.typelines = 1
				return true
			end
		end
	end

	return false
end)

hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY) then return end

	MAYA.CHAT_MUTE = (cv_mute.value or players[#consoleplayer].muted) and not (consoleplayer == server or IsPlayerAdmin(consoleplayer))
	MAYA.OLD_MUTE = (MAYA.OLDCHAT and (cv_mute.value or players[#consoleplayer].muted) and not (consoleplayer == server or IsPlayerAdmin(consoleplayer)))

	if (MM.hud.chat.active)
		MAYA.DrawChat(v)

		if (MM.debug)
			if (leftshiftdown) v.drawString(0, 176, "S") end
			if (leftctrldown) v.drawString(0, 184, "C") end
			if (rightshiftdown) v.drawString(8, 176, "S") end
			if (rightctrldown) v.drawString(8, 184, "C") end
		end
	else
		MAYA.typelines = 1
		MAYA.chat_scrolltime = 0

		if (cv_chatmode.value < 2) then MAYA.DrawMiniChat(v) end
	end

end, "game")

hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY) then return end

	MAYA.CHAT_MUTE = (cv_mute.value or players[#consoleplayer].muted) and not (consoleplayer == server or IsPlayerAdmin(consoleplayer))
	MAYA.OLD_MUTE = (MAYA.OLDCHAT and (cv_mute.value or players[#consoleplayer].muted) and not (consoleplayer == server or IsPlayerAdmin(consoleplayer)))

	if (MM.hud.chat.active)
		MAYA.DrawChat(v)

		if (MM.debug)
			if (leftshiftdown) v.drawString(0, 176, "S") end
			if (leftctrldown) v.drawString(0, 184, "C") end
			if (rightshiftdown) v.drawString(8, 176, "S") end
			if (rightctrldown) v.drawString(8, 184, "C") end
		end
	else
		MAYA.typelines = 1
		MAYA.chat_scrolltime = 0

		if (cv_chatmode.value < 2) then MAYA.DrawMiniChat(v) end

	end
end, "intermission")
