-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

local mmspam = CV_FindVar("mm_spam")
local mmsafechat = CV_FindVar("mm_safechat")
local IAMvocabluary ={
	{"I AM", "I'M", "IM", "I"}, --"I am..."
	{"MURDERER", "MURD", "KILLER"}, -- "...Murderer"
	{"SHERIFF", "SHERI"}, --"...Sheriff"
	{"INNOCENT", "INNO"}, --"...Innocent"
	{"HERO"} --"...Hero"
}

--SAYDEAD command - Say to the Dead Chat as Dedicated server
COM_AddCommand("SAYDEAD", function(p, ...) --sender, message
	--get the message string
	local arg = {...}
	local m = ""
	for i = 1, #arg do
		m = $ + arg[i]
		if (i < #arg) m = $ + " " end --add space between words (arguments)
	end
	
	local sender
	if (p == server) sender = "\x80~SERVER\x86"
	else sender = p.name end
	
	if (#m)
		--send the message
		for p in players.iterate do
			if (p.spectator) chatprintf(p, "\x86{"..sender.."} "..m) end
		end
		CONS_Printf(server, "{"..sender.."} "..m)
	else
		CONS_Printf(s, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat.")
	end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype != GT_MURDERMYSTERY) or (not s.mmlang) return end
	if (s.chatdelay) and (not (isdedicatedserver and s == server))
		CONS_Printf(s, "You are sending too many messages, please wait "..(G_TicsToSeconds(s.chatdelay) + 1).." second(s)")
		return true
	end

	--First, this is a bad word to use, Second, don't even think to critisize me of this
	--This is actually a trap for Moth-likes
	if (m:upper():match("NIGGA") or m:upper():match("NIGGER")) then MM_PunishPlayer(s, "N-word", true) end

	if (s.spectator)
		if (type == 0) --If dead player sends a message, make that messsage appear only to the dead players
			for p in players.iterate do if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif (type == 2) --PM messages in different design for DEAD
			if (t.spectator)
				chatprintf(s, "\x82[TO]\x86{"..t.name.."} "..m)
				chatprintf(t, "\x82[PM]\x86{"..s.name.."} "..m)
				return true
			else CONS_Printf(s, t.name.." ".."is alive, message not sent") end
		end
	else
		if (type == 0)
			--"I am [role]" chat protection
			if (PlayerCount() > 2) and (not MM.twopgame) and (mmsafechat.value) and (gamestate == GS_LEVEL)
				for i,k in pairs(IAMvocabluary[1]) do
					if (m:upper():find(k))
						for role = ROLE_MURDERER, ROLE_HERO do
							for i2, k2 in pairs(IAMvocabluary[role + 1]) do
								print(k2)
								if (m:upper():find(k2) and (role == s.role)) then MM_PunishPlayer(s, "Self-reveal")
								elseif (m:upper():find(k2) and (role != s.role)) then MM_PunishPlayer(s, "\"Fake self-reveal (trolling)\"") end
							end
						end
					end
				end
			end
		elseif (type == 1) or (m:sub(1,1) == "%") --SAYTEAM
			if (m:sub(1,1) == "%") then m = $:sub(2) end
			for p in players.iterate
				if ((p.role == s.role) and (s.role == ROLE_MURDERER))
					chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
					S_StartSound(nil, sfx_radio, p)
				elseif (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO)
					if (s.role == ROLE_SHERIFF)
						chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m)
					elseif (s.role == ROLE_HERO)
						chatprintf(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m)
					end
					S_StartSound(nil, sfx_radio, p)
				end
			end
			return true
		end
	end
	s.chatdelay = (mmspam.value*TICRATE)
end)

--chat delay timers
--gameplay timer
addHook("PlayerThink", function(p)
	if (p.chatdelay == nil) p.chatdelay = 0 end
	if (p.chatdelay) p.chatdelay = $ - 1 end
end)
--intermission timer
addHook("IntermissionThinker", do
	for p in players.iterate
		if (p.chatdelay == nil) p.chatdelay = 0 end
		if (p.chatdelay) p.chatdelay = $ - 1 end
	end
end)
