-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

--SAYDEAD command - Say to the Dead Chat as Dedicated server
COM_AddCommand("SAYDEAD", function(s, ...) --sender, message
	local arg = {...}
	--get the message string
	local m = ""
	for i = 1, #arg do
		m = $ + arg[i]
		if (i < #arg) m = $ + " " end --add space between words (arguments)
	end
	--send the message
	if ((s == server) and (#m))
		for p in players.iterate do
			if (p.spectator) chatprintf(p, "\x86{~SERVER} "..m) end
		end
		CONS_Printf(server, "{~SERVER} "..m)
	else
		CONS_Printf(s, "\x87SAYDEAD [message]\x80 - Send message to the Dead Chat. Only the Host can use this command")
	end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	local delaytimer = CV_FindVar("mmspam").value*TICRATE
	if (gametype != GT_MURDERMYSTERY) or (not s.mmlang) return end
	if (s.chatdelay) and (not (isdedicatedserver and s == server))
		CONS_Printf(s, MM.SysMsg[2])
		return true
	end

	if (s.spectator)
		if (type == 0) --If dead player sends message, make that messsage appear only to dead players
			for p in players.iterate do if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif (type == 2) --PM messages in different design for DEAD
			if (t.spectator)
				chatprintf(t, "\x86[PM]{"..s.name.."} "..m)
				chatprintf(s, "\x86[TO]{"..t.name.."} "..m)
			else CONS_Printf(s, t.name.." "..MM.SysMsg[1]) end
		end
		return true
	else
		if (type == 1) --SAYTEAM
			for p in players.iterate
				if ((p.role == s.role) and (s.role == ROLE_MURDERER))
					chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
					S_StartSound(nil, sfx_radio, p)
				elseif (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO)
					if(s.role == ROLE_SHERIFF) chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m)
					elseif (s.role == ROLE_HERO) chatprintf(p, "\x84[TEAM]\x82<"..s.name..">\x84 "..m) end
					S_StartSound(nil, sfx_radio, p)
				end
			end
			return true
		elseif (type == 0) and (CV_FindVar("MMSEMJ").value) --find and play sound emojis
			local mu = m:upper()

			if (mu:find("HEHE"))
				if (mu:find("HA")) MM_ChatPlaySFX(sfx_emj11)
				elseif (mu:find("BOI")) MM_ChatPlaySFX(sfx_emj12)
				else MM_ChatPlaySFX(sfx_emj01) end
			end
			if (mu:find(":SKULL:")) MM_ChatPlaySFX(sfx_emj00)
			elseif (mu:find(":FART:")) MM_ChatPlaySFX(sfx_emj02)
			elseif (mu:find("OMG")) MM_ChatPlaySFX(sfx_emj03)
			elseif (mu == "BRUH") MM_ChatPlaySFX(sfx_emj04)
			elseif (m:find(":|")) MM_ChatPlaySFX(sfx_emj05)
			elseif (mu:find("WOW")) MM_ChatPlaySFX(sfx_emj06)
			elseif (mu:find("AMONG US") or m:upper():find("AMONGUS")) MM_ChatPlaySFX(sfx_emj07)
			elseif (mu == "OH NO") MM_ChatPlaySFX(sfx_emj08)
			elseif (mu:find("SUS")) MM_ChatPlaySFX(sfx_emj09)
			elseif (mu:find("AGHH") or m:upper():find("AHH")) MM_ChatPlaySFX(sfx_emj0a)
			elseif (mu == "AHA") MM_ChatPlaySFX(sfx_emj0b)
			elseif (mu:find("NO WAY")) MM_ChatPlaySFX(sfx_emj0c)
			elseif (mu == "NOPE") MM_ChatPlaySFX(sfx_emj0d)
			elseif (mu:find("GET OVER HERE")) MM_ChatPlaySFX(sfx_emj0e)
			elseif (mu:find("NO"))
				if (mu == "NO!" or m == "NO") MM_ChatPlaySFX(sfx_emj16)
				elseif (m:upper():find("NOOO")) MM_ChatPlaySFX(sfx_emj0f) end
			elseif (m == "HELP" or mu == "HELP!") MM_ChatPlaySFX(sfx_emj10)
			elseif (mu:find("PINGAS")) MM_ChatPlaySFX(sfx_emj13)
			elseif (mu:find(":PAIN:")) MM_ChatPlaySFX(sfx_emj14)
			elseif (mu:find("HUH") or m:upper():find("HUH?")) MM_ChatPlaySFX(sfx_emj15)
			elseif (mu == "HAH" or m:upper() == "HAH!") MM_ChatPlaySFX(sfx_emj17)
			elseif (mu:find("HELLO THERE")) MM_ChatPlaySFX(sfx_emj19)

			--First, this is a bad word to use, Second, it's fun to look at the execution of this code
			--I believe this should be in NOCHEAT.LUA instead
			elseif (mu:match("NIGGA") or mu:match("NIGGER"))
				MM_ChatPlaySFX(sfx_emj18)
				chatprint("\x85\27\27\27 \x81RACIST PLAYER DETECTED\x85 \27\27\27")

				--kinda bad joke I might say, just like the N-word itself
				if (s == server) COM_BufInsertText(server, "QUIT")
				else COM_BufInsertText(server, "BAN "..#s.." N-word") end
			end
		else return false end
	end
	s.chatdelay = delaytimer
end)

--chat delay timers
--gameplay timer
addHook("PlayerThink", function(p)
	if (not p.chatdelay) p.chatdelay = 0 end
	if (p.chatdelay != 0) p.chatdelay = $ - 1 end
	if (p.chatdelay <= 0) p.chatdelay = 0 end
end)
--intermission timer
addHook("IntermissionThinker", do
	for p in players.iterate
		if (not p.chatdelay) p.chatdelay = 0 end
		if (p.chatdelay != 0) p.chatdelay = $ - 1 end
		if (p.chatdelay <= 0) p.chatdelay = 0 end
	end
end)
