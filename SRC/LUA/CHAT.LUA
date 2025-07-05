-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

local function chatcolor2textcolor(c)
	if ((not c) or (c % 0x1000) or (c > V_INVERTMAP)) then return "\x80" end
	switch(c, {
		[V_MAGENTAMAP] = do c = "\x81" end,
		[V_YELLOWMAP] = do c = "\x82" end,
		[V_GREENMAP] = do c = "\x83" end,
		[V_BLUEMAP] = do c = "\x84" end,
		[V_REDMAP] = do c = "\x85" end,
		[V_GRAYMAP] = do c = "\x86" end,
		[V_ORANGEMAP] = do c = "\x87" end,
		[V_SKYMAP] = do c = "\x88" end,
		[V_PURPLEMAP] = do c = "\x89" end,
		[V_AQUAMAP] = do c = "\x8a" end,
		[V_PERIDOTMAP] = do c = "\x8b" end,
		[V_AZUREMAP] = do c = "\x8c" end,
		[V_BROWNMAP] = do c = "\x8d" end,
		[V_ROSYMAP] = do c = "\x8e" end,
		[V_INVERTMAP] = do c = "\x8f" end,
		['default'] = do c = "\x80" end
	})
	return c
end

local function CHAT_Say(s, m, me)
	local textcolor = chatcolor2textcolor(skincolors[s.skincolor].chatcolor)

	--Admin/Verified badges
	local badge = ""
	if (s == server) badge = "\x82~"..textcolor
	elseif (IsPlayerAdmin(s)) badge = "\x82@"..textcolor end

	for p in players.iterate do
		if (gamestate != GS_LEVEL) or (p.spectator) or (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if (me)
				chatprintf(p, "* "..badge..s.name.."\x80 "..m:sub(5)) --"/me" message
			else
				chatprintf(p, textcolor.."<"..badge..s.name..">\x80 "..m) --Normal message
			end
			S_StartSound(nil, sfx_radio, p)
		end
	end

	if (isdedicatedserver) then chatprintf(server, "<"..badge..s.name.."> "..m) end
end

local function CHAT_TeamSay(s, m) --sender, message
	for p in players.iterate do
		if (MM.IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if ((p.mm.role == s.mm.role) and (s.mm.role == ROLE_MURDERER))
				chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
				S_StartSound(nil, sfx_radio, p)
			elseif (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO)
				if (s.mm.role == ROLE_SHERIFF)
					chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m)
				elseif (s.mm.role == ROLE_HERO)
					chatprintf(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m)
				end
				S_StartSound(nil, sfx_radio, p)
			end
		end
	end
end

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
			if (p.spectator) chatprintf(p, "\x86{"..sender.."} "..m) end
		end
		if (isdedicatedserver) then CONS_Printf(server, "{"..sender.."} "..m) end
	else
		CONS_Printf(s, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat.")
	end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype != GT_LTMMURDERMYSTERY) or (not s.mm) or (not s.mm.lang) then return end

	if (s.spectator)
		switch(type, {
			[0] = do --If dead player sends a message, make that messsage appear only to the dead players
				for p in players.iterate do if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
				if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
			end,
			[2] = do --PM messages in different design for DEAD
				if (t.spectator)
					chatprintf(s, "\x82[TO]\x86{"..t.name.."} "..m)
					chatprintf(t, "\x82[PM]\x86{"..s.name.."} "..m)
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
