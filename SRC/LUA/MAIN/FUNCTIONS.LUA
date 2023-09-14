-- FUNCTIONS.LUA
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Function declarations

local mmtxt=MM.text
local dthsfx={sfx__mmdth, sfx_mmdth2, sfx_emj08} --SFXs that are used as Death Sounds

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
rawset(_G, "AssignRoles", function()
	if (gametype!=GT_MURDERMYSTERY) or (PlayerCount()<2) return
	elseif (gametype==GT_MURDERMYSTERY) and (splitscreen)
		COM_BufInsertText(server, "MAP JADE VALLEY -GAMETYPE MATCH")
		print("\x85Hold on!\x80\nMurder Mystery (I'll short it MM from now on) is not designed for splitscreen mode! The game switched to the MATCH cuz it's as same as playing 1v1 in MM.\nDon't like it? Maybe you would like to type \x83MAP Abandoned Shelter -GAMETYPE MATCH -FORCE\x80 in this console to play MATCH inside MM maps?\nSorry but I won't make MM for splitscreen - it has no sence.\nSincerely, \x87LeonardoTheMutant")
		return
	end
	--prepare players
	for p in players.iterate p.role=ROLE_NONE end
	--how much players with same role should exist?
	local roleMultiplier=1
	if (PlayerCount()>=7) and (PlayerCount()<=10) roleMultiplier=2
	elseif (PlayerCount()>=11) and (PlayerCount()<=14) roleMultiplier=3
	elseif (PlayerCount()>14) roleMultiplier=4 end --EVEN THIS NUMBER WAS REACHED!!!
	--assign roles
    local plrs={}
    for p in players.iterate table.insert(plrs, #p) end --get numbers of player nodes that exist
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign the Role
        for i=1, roleMultiplier
            local randPlr=P_RandomKey(#plrs)+1
            players[plrs[randPlr]].role=r
            table.remove(plrs, randPlr)
        end
    end
	--print who they are personally
	for p in players.iterate
		if (p.role==ROLE_NONE) p.role=ROLE_INNOCENT end
		chatprintf(p, mmtxt[p.mmlang]["ROLE_GET"][p.role])
	end
	if (MM.devbuild)
		print("\x82".."AssignRoles() results:")
		for p in players.iterate print(p.name..": "..p.role) end
	end
end)

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
rawset(_G, "chatprintGlobal", function(msg, var)
	for p in players.iterate
		if (msg=="MURD_KILLED") chatprintf(p, mmtxt[p.mmlang]["MURD_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["MURD_KILLED"][2])
		elseif (msg=="SHERI_KILLED") chatprintf(p, mmtxt[p.mmlang]["SHERI_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["SHERI_KILLED"][2])
		elseif (msg=="SHERI_KILLED_NODROP") chatprintf(p, mmtxt[p.mmlang]["SHERI_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["SHERI_KILLED"][3])
		elseif (msg=="HERO_KILLED") chatprintf(p, mmtxt[p.mmlang]["HERO_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["HERO_KILLED"][2])
		elseif (msg=="LAST_LEFT") chatprintf(p, mmtxt[p.mmlang][msg][var])
		elseif (msg=="ONE_LEFT")
			if (var!=ROLE_HERO) chatprintf(p, mmtxt[p.mmlang]["ONE_LEFT"][var]) --for Murd and Sheri
			else chatprintf(p, mmtxt[p.mmlang]["ONE_LEFT"][3]) end --for Hero
		elseif (msg=="REPLACE_LEFT")
			if (var!=ROLE_HERO) chatprintf(p, mmtxt[p.mmlang]["REPLACE_LEFT"][var]) --for Murd and Sheri
			else chatprintf(p, mmtxt[p.mmlang]["REPLACE_LEFT"][3]) end --for Hero
		elseif (msg=="WIN") chatprintf(p, mmtxt[p.mmlang]["ENDROUND"][var])
		elseif (msg=="INNO_HURT") chatprintf(p, mmtxt[p.mmlang]["INNO_HURT"][var])
		elseif msg
			if (mmtxt[p.mmlang][msg]) chatprintf(p, mmtxt[p.mmlang][msg])
			else chatprintf(p, msg.."; "..var) end --no text was found in the database
		end
	end
end)

rawset(_G, "KillPlayer", function(p, k) --player, killer (both MOBJ_T)
	if (not p) or (not p.player) error("KillPlayer() argument #1 expects player's mobj_t") end
	local plr = p.player
	p.momx=0
	p.momy=0
	p.momz=0
	plr.spectator=true
	plr.role=ROLE_NONE
	if (k) and (k.player)
		plr.killedby=k.player.name
		k.player.kills=$+1
	else plr.killedby="Your stupidity" end
	P_FlashPal(plr, PAL_NUKE, 4)

	local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
	if (p.skin=="tails") body.state=S_TMMDEAD
	elseif (p.skin=="knuckles") body.state=S_KMMDEAD
	elseif (p.skin=="amy") body.state=S_AMMDEAD
	elseif (p.skin=="fang") body.state=S_FMMDEAD
	elseif (p.skin=="metalsonic") body.state=S_MMMDEAD
	else body.state=S_SMMDEAD end --Sonic, also fallback for custom chars (I really should ban them)
	body.color=p.color

	S_StartSound(p, dthsfx[P_RandomKey(3)+1], plr) --play random death sound personally
end)

--Function to end the round, arguments here:
--w is the role that won the game, the possible values are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat
--reason is not used in this function but rather in chatprintGlobal()
rawset(_G, "endRound", function(w, endtext, reason)
	MM.winner=w
	G_ExitLevel()
	chatprintGlobal(endtext, reason)
	for p in players.iterate p.spectator=false end
	if isdedicatedserver --console log for dedicated host
		if (endtext=="WIN") CONS_Printf(server, "- "..mmtxt["EN"]["ENDROUND"][reason])
		else CONS_Printf(server, "- "..mmtxt["EN"][endtext][reason]) end
	end
end)

rawset(_G, "CheckPlayers", function()
	if (PlayerCount(ROLE_MURDERER)!=0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_INNOCENT)==0) endRound(ROLE_MURDERER, "WIN", 1)
	elseif (PlayerCount(ROLE_MURDERER)!=0) and ((PlayerCount(ROLE_SHERIFF)!=0) or (PlayerCount(ROLE_HERO)!=0)) and (PlayerCount(ROLE_INNOCENT)==0) S_ChangeMusic("SHWDWN", true) end
end)

--Regular functions
rawset(_G, "SetRandomInnoAs", function(role)
	while true
		for p in players.iterate
			if (P_RandomKey(4)==0) and (p.role==ROLE_INNOCENT) and (not p.spectator)
				p.role=role
				if (role!=ROLE_HERO) chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][p.role]) --for Murd/Sheriff
				else chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][3]) end --for Hero
				return
			end
		end
	end
end)
rawset(_G, "PlayerCount", function(role)
	local plrc = 0
	if (role) for p in players.iterate if (p.role==role) plrc=$+1 end end
	else for p in players.iterate plrc=$+1 end end
	return plrc
end)
rawset(_G, "PlayersAlive", function()
	local plrs=0
	for p in players.iterate if (not p.spectator) plrs=$+1 end end
	return plrs
end)

rawset(_G, "drawStrCentered", function(v,y,str,flags,font)
	v.drawString(160-v.stringWidth(str,flags,font)>>1, y, str, flags, font)
end)