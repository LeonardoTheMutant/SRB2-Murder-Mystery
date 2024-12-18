-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

local chatdelayCVAR = CV_FindVar("mm_chatdelay")

local function chatcolor2textcolor(c)
	if ((not c) or (c % 0x1000) or (c > V_INVERTMAP)) return "\x80"
	elseif (c == V_MAGENTAMAP) return "\x81"
	elseif (c == V_YELLOWMAP) return "\x82"
	elseif (c == V_GREENMAP) return "\x83"
	elseif (c == V_BLUEMAP) return "\x84"
	elseif (c == V_REDMAP) return "\x85"
	elseif (c == V_GRAYMAP) return "\x86"
	elseif (c == V_ORANGEMAP) return "\x87"
	elseif (c == V_SKYMAP) return "\x88"
	elseif (c == V_PURPLEMAP) return "\x89"
	elseif (c == V_AQUAMAP) return "\x8a"
	elseif (c == V_PERIDOTMAP) return "\x8b"
	elseif (c == V_AZUREMAP) return "\x8c"
	elseif (c == V_BROWNMAP) return "\x8d"
	elseif (c == V_ROSYMAP) return "\x8e"
	elseif (c == V_INVERTMAP) return "\x8f"
	end
end

local function CHAT_Say(s, m, me)
	local chatcolor = chatcolor2textcolor(skincolors[s.skincolor].chatcolor)

	--Admin/Verified badges
	local badge = ""
	if (s == server) badge = "\x82~"..chatcolor
	elseif (IsPlayerAdmin(s)) badge = "\x82@"..chatcolor end

	for p in players.iterate do
		if (gamestate != GS_LEVEL) or (p.spectator) or (MM_IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
			if (me)
				chatprintf(p, "* "..badge..s.name.."\x80 "..m:sub(5)) --"/me" message
			else
				chatprintf(p, chatcolor.."<"..badge..s.name..">\x80 "..m) --Normal message
			end
			S_StartSound(nil, sfx_radio, p)
		end
	end

	if (isdedicatedserver) then chatprintf(server, "<"..badge..s.name.."> "..m) end
end

local function CHAT_TeamSay(s, m) --sender, message
	for p in players.iterate do
		if (MM_IsTimelineCorrect(s.mm.timetravel.timezone, p.mm.timetravel.timezone))
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
	if (gametype != GT_LTMMURDERMYSTERY) or (not s.mm.lang) then return end
	if (s.mm.chatdelay) and (not (isdedicatedserver and s == server))
		CONS_Printf(s, "You are sending too many messages, please wait "..(G_TicsToSeconds(s.mm.chatdelay) + 1).." second(s)")
		return true
	end

	if (s.spectator)
		if (type == 0) --If dead player sends a message, make that messsage appear only to the dead players
			for p in players.iterate do if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif (type == 2) --PM messages in different design for DEAD
			if (t.spectator)
				chatprintf(s, "\x82[TO]\x86{"..t.name.."} "..m)
				chatprintf(t, "\x82[PM]\x86{"..s.name.."} "..m)
			else CONS_Printf(s, t.name.." ".."is alive, message not sent") end
		end
	else
		if (type == 0)
			if (m:sub(1,1) == "%") and (gamestate == GS_LEVEL)
				CHAT_TeamSay(s, m:sub(2))  --SAYTEAM shortcut
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
	s.mm.chatdelay = (chatdelayCVAR.value*TICRATE)
	return true
end)

--chat delay timers
--gameplay timer
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	if (p.mm.chatdelay == nil) p.mm.chatdelay = 0 end
	if (p.mm.chatdelay) p.mm.chatdelay = $ - 1 end
end)
--intermission timer
addHook("IntermissionThinker", do
	if (gametype != GT_LTMMURDERMYSTERY) return end
	for p in players.iterate
		if (p.mm.chatdelay == nil) p.mm.chatdelay = 0 end
		if (p.mm.chatdelay) p.mm.chatdelay = $ - 1 end
	end
end)
