-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

local function chatcolor2textcolor(c)
	if ((not c) or (c % 0x1000) or (c > V_INVERTMAP)) then return "\x80" end
	switch(c, {
		[V_MAGENTAMAP] = do c = CHAR[129] end,
		[V_YELLOWMAP] = do c = CHAR[130] end,
		[V_GREENMAP] = do c = CHAR[131] end,
		[V_BLUEMAP] = do c = CHAR[132] end,
		[V_REDMAP] = do c = CHAR[133] end,
		[V_GRAYMAP] = do c = CHAR[134] end,
		[V_ORANGEMAP] = do c = CHAR[135] end,
		[V_SKYMAP] = do c = CHAR[136] end,
		[V_PURPLEMAP] = do c = CHAR[137] end,
		[V_AQUAMAP] = do c = CHAR[138] end,
		[V_PERIDOTMAP] = do c = CHAR[139] end,
		[V_AZUREMAP] = do c = CHAR[140] end,
		[V_BROWNMAP] = do c = CHAR[141] end,
		[V_ROSYMAP] = do c = CHAR[142] end,
		[V_INVERTMAP] = do c = CHAR[143] end,
		['default'] = do c = CHAR[128] end
	})
	return c
end

local function CHAT_Say(s, m, me)
	local chatcolor = chatcolor2textcolor(skincolors[s.skincolor].chatcolor)

	--Admin/Verified badges
	local badge = ""
	if (s == server) badge = "\x82~"..chatcolor
	elseif (IsPlayerAdmin(s)) badge = "\x82@"..chatcolor end

	for p in players.iterate do
		if (gamestate ~= GS_LEVEL) or (p.spectator) or (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if (me)
				MM.Chatprint(p, "* "..badge..s.name.."\x80 "..m:sub(5)) --"/me" message
			else
				MM.Chatprint(p, chatcolor.."<"..badge..s.name..">\x80 "..m) --Normal message
			end
			S_StartSound(nil, sfx_radio, p)
		end
	end

	if (isdedicatedserver) then MM.Chatprint(server, "<"..badge..s.name.."> "..m) end
end

local function CHAT_TeamSay(s, m) --sender, message
	for p in players.iterate do
		if (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if ((p.mm.role == s.mm.role) and (s.mm.role == ROLE_MURDERER))
				MM.Chatprint(p, "\x85[TEAM]<"..s.name.."> "..m)
				S_StartSound(nil, sfx_radio, p)
			elseif (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO)
				switch(s.mm.role, {
					[ROLE_SHERIFF] = do
						MM.Chatprint(p, "\x84[TEAM]<"..s.name.."> "..m)
						S_StartSound(nil, sfx_radio, p)
					end,
					[ROLE_HERO] = do
						MM.Chatprint(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m)
						S_StartSound(nil, sfx_radio, p)
					end,
					[ROLE_JESTERHERO] = do
						MM.Chatprint(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m)
						S_StartSound(nil, sfx_radio, p)
					end,
				})
			end
		end
	end
end

--SAYDEAD command - Say to the Dead Chat (as Server or Administrator)
COM_AddCommand("SAYDEAD", function(p, ...) --sender, message
	if (gametype ~= GT_LTMMURDERMYSTERY)
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
			if (p.spectator) MM.Chatprint(p, "\x86{"..sender.."} "..m) end
		end
		if (isdedicatedserver) then CONS_Printf(server, "{"..sender.."} "..m) end
	else
		CONS_Printf(s, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat.")
	end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype ~= GT_LTMMURDERMYSTERY) or (not s.mm) or (not s.mm.lang) then return end

	if (s.spectator)
		if (type == 0) --If dead player sends a message, make that messsage appear only to the dead players
			for p in players.iterate do if (p.spectator) MM.Chatprint(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif (type == 2) --PM messages in different design for DEAD
			if (t.spectator)
				MM.Chatprint(s, "\x82[TO]\x86{"..t.name.."} \x82"..m)
				MM.Chatprint(t, "\x82[PM]\x86{"..s.name.."} \x82"..m)
			else CONS_Printf(s, t.name.." ".."is alive, message not sent") end
		end
	else
		if (type == 0)
			if (m:sub(1,1) == "%") and (gamestate == GS_LEVEL)
				CHAT_TeamSay(s, m:sub(1))  --SAYTEAM shortcut
			else
				CHAT_Say(s, m, m:find("/me ", 1,4, true)) --send message normally (handle "/me" messages too)
			end
		elseif (type == 1)  --SAYTEAM
			if (gamestate == GS_LEVEL) then CHAT_TeamSay(s, m)
			else CHAT_Say(s, m) end
		elseif (type == 2) --SAYTO or "/pm"
			return false
		end
	end
	return true
end)
