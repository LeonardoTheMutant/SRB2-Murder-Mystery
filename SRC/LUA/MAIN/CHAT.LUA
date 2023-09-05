--CHAT.LUA
--Code by LeonardoTheMutant
--
-- Manage PlayerMsgs and redirect them

	--["FR"] = {["MsgNotSent"]="est vivant, message non distribue"}, --abandoned French translation

local function chatplaySFX(sfx)
	for p in players.iterate S_StartSound(p.mo, sfx, p) end
end
local delaytimer=CV_FindVar("mmspam").value
COM_AddCommand("SAYDEAD", function(p, m) --SAY but to DEAD CHAT as SERVER, for some stupid reasons I can't limit it to DEDICATED CONSOLE only
	if p!=server
		CONS_Printf(p, "You're not dedicated server host to use this command")
		return
	end
	if m!=nil for t in players.iterate if t.spectator chatprintf(t, "\x86{~SERVER} "..m) end end
	else CONS_Printf(p, "Usage: SAYDEAD [message]\nSend message to the dead chat as SERVER\nNOTE: message must be enclosed into \" brackets otherwise only the first word will be sent!") end
end, COM_ADMIN)

addHook("PlayerMsg", function(s, type, t, m) --source, type, target, msg
	if (gametype!=GT_MURDERMYSTERY) or (not s.mmlang) return end
	if (s.chatdelay!=0) and (not (isdedicatedserver and s==server))
		CONS_Printf(s, MM.text[s.mmlang]["CHAT"][2])
		return true
	end
	if s.spectator
		if type==0 --If dead player sends message, make that messsage appear only to dead players
			for p in players.iterate if (p.spectator) chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if (isdedicatedserver) CONS_Printf(server, "{"..s.name.."} "..m) end
			s.chatdelay=delaytimer
		elseif type==2 --PM messages in different design for DEAD
			if t.spectator
				chatprintf(t, "\x86[PM]{"..s.name.."} "..m)
				chatprintf(s, "\x86[TO]{"..s.name.."} "..m)
				s.chatdelay=delaytimer
			else CONS_Printf(s, t.name.." "..MM.text[s.mmlang]["CHAT"][1]) end
		end
		return true
	else
		if type==1 --SAYTEAM
			for p in players.iterate
				if s.role == p.role
					if (s.role == ROLE_MURDERER) chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m)
					elseif (s.role == ROLE_SHERIFF) chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m) end
					S_StartSound(nil,170,p)
				end
			end
			s.chatdelay=delaytimer
			return true
		elseif type==0 --play sound emojis
			m=m:upper()
			if string.find(m,":SKULL:") chatplaySFX(sfx_emj00)
			elseif string.find(m,"HEHE")
			if string.find(m,"HEHEHE") and string.find(m,"HA") chatplaySFX(sfx_emj11)
			elseif string.find(m,"BOI") chatplaySFX(sfx_emj12)
			else chatplaySFX(sfx_emj01) end
			elseif string.find(m,":FART:") chatplaySFX(sfx_emj02)
			elseif string.find(m,"OMG") chatplaySFX(sfx_emj03)
			elseif m=="BRUH" chatplaySFX(sfx_emj04)
			elseif m:find(":|") or m:find("/:|") chatplaySFX(sfx_emj05)
			elseif string.find(m,"WOW") chatplaySFX(sfx_emj06)
			elseif string.find(m,"AMONG US") or string.find(m,"AMONGUS") chatplaySFX(sfx_emj07)
			elseif m=="OH NO" chatplaySFX(sfx_emj08)
			elseif string.find(m,"SUS") chatplaySFX(sfx_emj09)
			elseif string.find(m,"AGHH") or string.find(m,"AHH") chatplaySFX(sfx_emj0a)
			elseif m=="AHA" chatplaySFX(sfx_emj0b)
			elseif string.find(m,"NO WAY") chatplaySFX(sfx_emj0c)
			elseif m=="NOPE" chatplaySFX(sfx_emj0d)
			elseif string.find(m,"GET OVER HERE") chatplaySFX(sfx_emj0e)
			elseif string.find(m,"NOO") chatplaySFX(sfx_emj0f)
			elseif string.find(m,"HELP") chatplaySFX(sfx_emj10) end
			s.chatdelay=delaytimer
		else return false end
	end
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