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
			if string.find(m:upper(),"HEHE")
				if string.upper(m):find("HA") MM_ChatPlaySFX(sfx_emj11)
				elseif string.upper(m):find("BOI") MM_ChatPlaySFX(sfx_emj12)
				else MM_ChatPlaySFX(sfx_emj01) end
			end
			if string.find(m:upper(), ":SKULL:") MM_ChatPlaySFX(sfx_emj00)
			elseif string.find(m:upper(),":FART:") MM_ChatPlaySFX(sfx_emj02)
			elseif m:find("OMG") MM_ChatPlaySFX(sfx_emj03)
			elseif m:upper()=="BRUH" MM_ChatPlaySFX(sfx_emj04)
			elseif m:find(":|") MM_ChatPlaySFX(sfx_emj05)
			elseif string.find(m:upper(),"WOW") MM_ChatPlaySFX(sfx_emj06)
			elseif m:find("AMONG US") or m:find("AMONGUS") MM_ChatPlaySFX(sfx_emj07)
			elseif m:upper()=="OH NO" MM_ChatPlaySFX(sfx_emj08)
			elseif string.find(m:upper(),"SUS") MM_ChatPlaySFX(sfx_emj09)
			elseif m:find("AGHH") or m:find("AHH") MM_ChatPlaySFX(sfx_emj0a)
			elseif m:upper()=="AHA" MM_ChatPlaySFX(sfx_emj0b)
			elseif m:find("NO WAY") MM_ChatPlaySFX(sfx_emj0c)
			elseif string.upper(m)=="NOPE" MM_ChatPlaySFX(sfx_emj0d)
			elseif m:find("GET OVER HERE") MM_ChatPlaySFX(sfx_emj0e)
			elseif string.find(m,"NO")
				if (m=="NO!") or (m=="NO") MM_ChatPlaySFX(sfx_emj16)
				elseif string.find(m, "NOOO") MM_ChatPlaySFX(sfx_emj0f) end
			elseif m=="HELP" or m:upper()=="HELP!" MM_ChatPlaySFX(sfx_emj10)
			elseif string.find(m:upper(),"PINGAS") MM_ChatPlaySFX(sfx_emj13)
			elseif string.find(m:upper(),":PAIN:") MM_ChatPlaySFX(sfx_emj14)
			elseif string.match(m:upper(),"HUH") and string.find(m:upper(),"HUH") MM_ChatPlaySFX(sfx_emj15) end
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