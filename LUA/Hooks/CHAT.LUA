--CHAT.LUA
--Code by LeonardoTheMutant
--Controls PlayerMsgs

	--["FR"] = {["MsgNotSent"]="est vivant, message non distribue"}, --abandoned French translation

local function chatplay(sfx)
	for p in players.iterate S_StartSound(p.mo, sfx, p) end
end
local delaytimer=CV_RegisterVar{name="mmchatdelay", defaultvalue=35, flags=4, PossibleValue=CV_Unsigned}
COM_AddCommand("SAYDEAD", function(p, m) --SAY but to DEAD CHAT as SERVER, for some stupid reasons I can't limit it to DEDICATED CONSOLE only
	if m!=nil for t in players.iterate if t.spectator chatprintf(t, "\x86{~SERVER} "..m) end end
	else CONS_Printf(p, "Usage: SAYDEAD [message]\nSend message to the dead chat as SERVER\nNOTE: message must be enclosed into \" brackets otherwise only the first word will be sent!") end
end, COM_ADMIN)
addHook("PlayerMsg", function(s, type, t, m)
	if gametype != GT_MURDERMYSTERY or not s.mmlang return end
	if s.chatdelay!=0 and not (isdedicatedserver and s==server)
		CONS_Printf(s, MurderMystery.text[s.mmlang]["MsgDelay"])
		return true
	end
	if s.spectator
		if type==0 --If dead player sends message, make that messsage appear only to dead players
			for p in players.iterate if p.spectator chatprintf(p, "\x86{"..s.name.."} "..m) end end
			if isdedicatedserver CONS_Printf(server, "{"..s.name.."} "..m) end
		elseif type==2 --PM messages in different design for DEAD
			if t.spectator chatprintf(t, "\x86[PM]{"..s.name.."} "..m)
			else CONS_Printf(s, t.name.." "..MurderMystery.text[s.mmlang]["MsgNotSent"]) end
		end
		s.chatdelay=delaytimer.value
		return true
	elseif not s.spectator and type==1 --SAYTEAM
		for p in players.iterate
			if s.role == p.role
				if s.role == 1 chatprintf(p, "\x85[TEAM]<"..s.name.."> "..m) -- Murderer
				elseif s.role == 2 chatprintf(p, "\x84[TEAM]<"..s.name.."> "..m) end -- Sheriff
			end
		end
		s.chatdelay=delaytimer.value
		return true
	elseif not s.spectator and type==0
		if string.find(string.upper(m),":SKULL:") chatplay(sfx_emj00)
		elseif string.find(string.upper(m),"HEHE")
			if string.find(string.upper(m),"HEHEHE") and string.find(string.upper(m),"HA") chatplay(sfx_emj11)
			else chatplay(sfx_emj01) end
		elseif string.find(string.upper(m),":FART:") chatplay(sfx_emj02)
		elseif string.find(string.upper(m),":OMG:") chatplay(sfx_emj03)
		elseif string.upper(m)=="BRUH" chatplay(sfx_emj04)
		elseif m:find("\:|") or m:find("/:|") chatplay(sfx_emj05)
		elseif string.find(string.upper(m),":WOW:") chatplay(sfx_emj06)
		elseif string.find(string.upper(m),"AMONG US") or string.find(string.upper(m),"AMONGUS") chatplay(sfx_emj07)
		elseif string.upper(m)=="OH NO" chatplay(sfx_emj08)
		elseif string.find(string.upper(m),"SUS") chatplay(sfx_emj09)
		elseif string.find(string.upper(m),"AGHH") or string.find(string.upper(m),"AHH") chatplay(sfx_emj0a)
		elseif string.upper(m)=="AHA" chatplay(sfx_emj0b)
		elseif string.find(string.upper(m),"NO WAY") chatplay(sfx_emj0c)
		elseif string.upper(m)=="NOPE" chatplay(sfx_emj0d)
		elseif string.find(string.upper(m),"GET OVER HERE") chatplay(sfx_emj0e)
		elseif string.find(string.upper(m),"NOO") chatplay(sfx_emj0f)
		elseif string.find(m,"HELP") chatplay(sfx_emj10) end
		s.chatdelay=delaytimer.value
	else return false end
end)
addHook("PlayerThink", function(p)
	if p.chatdelay==nil	p.chatdelay=0 end
	if p.chatdelay!=0 p.chatdelay=$1-1 end
	if p.chatdelay<=0 p.chatdelay=0 end
end)
addHook("IntermissionThinker", do
	for p in players.iterate
		if p.chatdelay==nil	p.chatdelay=0 end
		if p.chatdelay!=0 p.chatdelay=$1-1 end
		if p.chatdelay<=0 p.chatdelay=0 end
	end
end)
	