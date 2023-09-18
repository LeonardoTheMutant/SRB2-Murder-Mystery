-- CHAT.LUA
-- Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them to the right persons

if (isdedicatedserver)
	COM_AddCommand("SAYDEAD", function(p, m) --SAY but to the DEAD CHAT as SERVER, for some stupid reasons I can't limit it to DEDICATED CONSOLE only
		if p!=server
			CONS_Printf(p, "You're not server to use this command")
			return
		end
		if (m) for t in players.iterate if t.spectator chatprintf(t, "\x86{~SERVER} "..m) end end
		else CONS_Printf(p, "Usage: SAYDEAD [message]\nSend message to the dead chat as SERVER\nNOTE: message must be enclosed into \" brackets otherwise only the first word will be sent!") end
	end, COM_ADMIN)
end

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	local delaytimer=CV_FindVar("mmspam").value*TICRATE
	if (gametype!=GT_MURDERMYSTERY) or (not s.mmlang) return end
	if (s.chatdelay!=0) and (not (isdedicatedserver and s==server))
		CONS_Printf(s, MM.text[s.mmlang]["CHAT"][2])
		return true
	end
	if (s.spectator)
		if (type==0) --If dead player sends message, make that messsage appear only to dead players
			for p in players.iterate if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif (type==2) --PM messages in different design for DEAD
			if (t.spectator)
				chatprintf(t, "\x86[PM]{"..s.name.."} "..m)
				chatprintf(s, "\x86[TO]{"..t.name.."} "..m)
			else CONS_Printf(s, t.name.." "..MM.text[s.mmlang]["CHAT"][1]) end
		end
		return true
	else
		if (type==1) --SAYTEAM
			for p in players.iterate
				if (s.role == p.role)
					if (s.role==ROLE_MURDERER) chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
					elseif (s.role==ROLE_SHERIFF) or (s.role==ROLE_HERO) chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m) end
					if (s.role!=ROLE_INNOCENT) S_StartSound(nil,170,p) end
				end
			end
			return true
		elseif (type==0) and (CV_FindVar("MMSEMJ").value) --play sound emojis
			m=m:upper()
			if m:find("HEHE")
				if m:find("HA") chatplaySFX(sfx_emj11)
				elseif m:find("BOI") chatplaySFX(sfx_emj12)
				else chatplaySFX(sfx_emj01) end
			end
			if m:find(":SKULL:") chatplaySFX(sfx_emj00)
			elseif m:find(":FART:") chatplaySFX(sfx_emj02)
			elseif m:find("OMG") chatplaySFX(sfx_emj03)
			elseif m=="BRUH" chatplaySFX(sfx_emj04)
			elseif m:find(":|") chatplaySFX(sfx_emj05)
			elseif m:find("WOW") chatplaySFX(sfx_emj06)
			elseif m:find("AMONG US") or m:find("AMONGUS") chatplaySFX(sfx_emj07)
			elseif m=="OH NO" chatplaySFX(sfx_emj08)
			elseif m:find("SUS") chatplaySFX(sfx_emj09)
			elseif m:find("AGHH") or m:find("AHH") chatplaySFX(sfx_emj0a)
			elseif m=="AHA" chatplaySFX(sfx_emj0b)
			elseif m:find("NO WAY") chatplaySFX(sfx_emj0c)
			elseif m=="NOPE" chatplaySFX(sfx_emj0d)
			elseif m:find("GET OVER HERE") chatplaySFX(sfx_emj0e)
			elseif m=="NOOO" chatplaySFX(sfx_emj0f)
			elseif m=="HELP" or m=="HELP!" chatplaySFX(sfx_emj10)
			elseif m:find("PINGAS") chatplaySFX(sfx_emj13)
			elseif m:find(":PAIN:") chatplaySFX(sfx_emj14)
			elseif m:find("HUH") chatplaySFX(sfx_emj15) end
		else return false end
	end
	s.chatdelay=delaytimer
end)
addHook("PlayerThink", function(p)
	if (not p.chatdelay) p.chatdelay=0 end
	if (p.chatdelay!=0) p.chatdelay=$-1 end
	if (p.chatdelay<=0) p.chatdelay=0 end
end)
addHook("IntermissionThinker", do
	for p in players.iterate
		if (not p.chatdelay) p.chatdelay=0 end
		if (p.chatdelay!=0) p.chatdelay=$-1 end
		if (p.chatdelay<=0) p.chatdelay=0 end
	end
end)