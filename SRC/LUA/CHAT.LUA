-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

local function chatcolor2textcolor(c)
	if ((not c) or (c % 0x1000) or (c > V_INVERTMAP)) then return CHAR[128] end
	switch(c, {
		[V_MAGENTAMAP] = function() c = CHAR[129] end,
		[V_YELLOWMAP] = function() c = CHAR[130] end,
		[V_GREENMAP] = function() c = CHAR[131] end,
		[V_BLUEMAP] = function() c = CHAR[132] end,
		[V_REDMAP] = function() c = CHAR[133] end,
		[V_GRAYMAP] = function() c = CHAR[134] end,
		[V_ORANGEMAP] = function() c = CHAR[135] end,
		[V_SKYMAP] = function() c = CHAR[136] end,
		[V_PURPLEMAP] = function() c = CHAR[137] end,
		[V_AQUAMAP] = function() c = CHAR[138] end,
		[V_PERIDOTMAP] = function() c = CHAR[139] end,
		[V_AZUREMAP] = function() c = CHAR[140] end,
		[V_BROWNMAP] = function() c = CHAR[141] end,
		[V_ROSYMAP] = function() c = CHAR[142] end,
		[V_INVERTMAP] = function() c = CHAR[143] end,
		['default'] = function() c = CHAR[128] end
	})
	return c
end

local function CHAT_Say(s, m, me)
	local chatcolor = chatcolor2textcolor(skincolors[s.skincolor].chatcolor)

	--Admin/Verified badges
	local badge = ""
	if (s == server) then badge = "\x82~"..chatcolor
	elseif (IsPlayerAdmin(s)) then badge = "\x82@"..chatcolor end

	for p in players.iterate do
		if (gamestate ~= GS_LEVEL) or (p.spectator) or (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone)) then
			if (me) then
				chatprintf(p, string.format("* %s%s\x80 %s", badge, s.name, m:sub(5))) --"/me" message
			else
				chatprintf(p, string.format("%s<%s%s>\x80 %s", chatcolor, badge, s.name, m)) --Normal message
			end
			S_StartSound(nil, sfx_radio, p)
		end
	end

	if (isdedicatedserver) then MM.Chatprint(server, string.format("<%s%s> %s", badge, s.name, m)) end
end

local function CHAT_TeamSay(s, m) --sender, message
	for p in players.iterate do
		if (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone)) then
			if ((p.mm.role == s.mm.role) and (s.mm.role == ROLE_MURDERER)) then
				chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
				S_StartSound(nil, sfx_radio, p)
			elseif (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO) then
				switch(s.mm.role, {
					[ROLE_SHERIFF] = function()
						chatprintf(p, string.format("\x84[TEAM]<%s> %s", s.name, m))
						S_StartSound(nil, sfx_radio, p)
					end,
					[ROLE_HERO] = function()
						chatprintf(p, string.format("\x84[TEAM]\x82<%s>\x84 %s", s.name, m))
						S_StartSound(nil, sfx_radio, p)
					end,
					[ROLE_JESTERHERO] = function()
						chatprintf(p, string.format("\x84[TEAM]\x82<%s>\x84 %s", s.name, m))
						S_StartSound(nil, sfx_radio, p)
					end,
				})
			end
		end
	end
end

--SAYDEAD command - Say to the Dead Chat (as Server or Administrator)
COM_AddCommand("SAYDEAD", function(p, ...) --sender, message
	if (gametype ~= GT_LTMMURDERMYSTERY) then CONS_Printf(p, "The game must be LTM's Murder Mystery to access this command"); return end

	--get the message string
	local arg = {...}
	local m = ""
	for i = 1, #arg do
		m = m + arg[i]
		if (i < #arg) then m = m + " " end --add space between words (arguments)
	end

	local sender
	if (p == server) then sender = "\x80~SERVER\x86"
	else sender = p.name end

	if (#m) then
		--send the message
		for p in players.iterate do
			if (p.spectator) then chatprintf(p, string.format("\x86{%s} %s", sender, m)) end
		end
		if (isdedicatedserver) then CONS_Printf(server, string.format("{%s} %s", sender, m)) end
	else
		CONS_Printf(s, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat.")
	end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype ~= GT_LTMMURDERMYSTERY) or (not s.mm) then return end

	if (s.spectator) then
		if (type == 0) then --If dead player sends a message, make that messsage appear only to the dead players
			for p in players.iterate do if (p.spectator) then chatprintf(p, string.format("\x86{%s} %s", s.name, m)) end end
			if (isdedicatedserver) then CONS_Printf(server, string.format("{%s} %s", s.name, m)) end
		elseif (type == 2) then --PM messages in different design for DEAD
			if (t.spectator) then
				MM.Chatprint(s, string.format("\x82[TO]\x86{%s}\x82 %s", t.name, m))
				MM.Chatprint(t, string.format("\x82[PM]\x86{%s}\x82 %s", s.name, m))
			else CONS_Printf(s, t.name.." ".."is alive, message not sent") end
		end
	else
		if (type == 0) then
			if (m:sub(1,1) == "%") and (gamestate == GS_LEVEL) then
				CHAT_TeamSay(s, m:sub(1)) --SAYTEAM shortcut
			else
				CHAT_Say(s, m, m:find("/me ", 1,4, true)) --send message normally (handle "/me" messages too)
			end
		elseif (type == 1) then --SAYTEAM
			if (gamestate == GS_LEVEL) then CHAT_TeamSay(s, m)
			else CHAT_Say(s, m) end
		elseif (type == 2) then --SAYTO or "/pm"
			return false
		end
	end
	return true
end)
