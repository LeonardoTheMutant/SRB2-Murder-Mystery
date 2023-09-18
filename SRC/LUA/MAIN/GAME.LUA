-- GAME.LUA
-- Original base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
-- With the additional help of Jesus.B
--
-- The core logic spcript of Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, AFK logic and round endings

-- Constants

local mmtxt=MM.text
local afkCVAR=CV_FindVar("mmafk")

addHook("MapLoad", do
	if (gametype!=GT_MURDERMYSTERY) return end
	--prepare players & server for the new round
	for p in players.iterate
		p.spectator=false
		p.kills=0
		p.killedby=nil
	end
	MM.winner=0
	AssignRoles()
end)

--
-- Player spawn
--
addHook("PlayerSpawn", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end

	--Apply language
	if (not p.mmlang) p.mmlang="EN" end
	--	local f=io.openlocal("client/MM.DAT", 'r') --network unsynced language save/load
	--	if f
	--		local l=f:read()
	--		if mmtxt[l]~=nil p.mmlang=l
	--		else p.mmlang="EN" end
	--	else p.mmlang='EN' end
	--	f:close()
	--end

	if (not p.chatdelay) p.chatdelay=0 end
	if (not p.kills) p.kills=0 end --Init kill counter
	p.afk=0 --Anti-AFK init

	--Player num and state check on join
	if (PlayerCount()==2) and (p.role==nil) --Player2 joined 'singleplayer' round
		AssignRoles() --Assign them roles
		S_StartSound(nil,93,p) --Notify Player1 (who's probably AFK) about new player
	elseif (PlayerCount()>2) and (p.role==nil) p.spectator=true end --Players >=3 who joined are DEAD (spectators)
end)

addHook("HurtMsg", do --disable Ringslier hurt messages
	if (gametype==GT_MURDERMYSTERY) return true end
end)
addHook("TeamSwitch", function(p) --prevent swtiching alive/dead states manually
	if (gametype==GT_MURDERMYSTERY)
		if (not p.spectator)
			local lang = p.mmlang or "EN"
			chatprintf(p, mmtxt[lang]["CHAT"][3])
		end
		return false
	else return true end
end)

--
-- Main hit/kill detector
--
addHook("MobjDamage", function(victim, inf, attacker)
	if (gametype!=GT_MURDERMYSTERY) or (not attacker) or (not attacker.player) return end
	local vp=victim.player
	local ap=attacker.player
	if vp.role==ROLE_MURDERER
		if ap.role==ROLE_MURDERER
			chatprintf(ap, "\x85"..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, "\x85"..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		KillPlayer(victim, attacker)
		-- Murderer died, end the game if every Murd is dead
		if PlayerCount(ROLE_MURDERER)==0
			endRound(ROLE_SHERIFF, "WIN", 2)
			return
		else
			chatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Murd) died") end
		end
	elseif (vp.role==ROLE_SHERIFF)
		if (ap.role==ROLE_SHERIFF) or (ap.role==ROLE_HERO)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		KillPlayer(victim, attacker)
		-- Sheriff died, drop his emerald (weapon), if he's not last
		if PlayerCount(ROLE_INNOCENT)!=0
			P_SpawnMobjFromMobj(victim,0,0,0,MT_SHREML)
			MM.shreml_dropped=$+1
			chatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)!=0)
			chatprintGlobal("SHERI_KILLED_NODROP", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		end
	elseif vp.role==ROLE_INNOCENT
		KillPlayer(victim, attacker)
		if ap.role==ROLE_SHERIFF
			-- Sheriff killed an innocent, remove role "Sheriff" from the player if there are more of Innos,
			-- otherwise Murderers win
			if PlayerCount(ROLE_INNOCENT)>0
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][1])
				chatprintGlobal("INNO_HURT", 1)
				SetRandomInnoAs(ROLE_SHERIFF)
				ap.role=ROLE_INNOCENT
			else
				endRound(ROLE_MURDERER, "WIN", 3)
				return
			end
		elseif ap.role==ROLE_HERO
			KillPlayer(attacker, nil)
			if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0)
				endRound(ROLE_MURDERER, "WIN", 4)
				return
			elseif (PlayerCount(ROLE_INNOCENT)!=0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0) and (MM.shreml_dropped==0)
				endRound(ROLE_MURDERER, "WIN", 5)
				return
			else
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][2])
				chatprintGlobal("INNO_HURT", 2)
			end
		end
	elseif vp.role==ROLE_HERO
		if (ap.role==ROLE_HERO) or (ap.role==ROLE_SHERIFF)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		KillPlayer(victim, attacker)
		if (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			endRound(ROLE_MURDERER, "WIN", 5)
			return
		else
			chatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	end
	CheckPlayers()
end, MT_PLAYER)

--
-- Sheriff's Emerald pickup logic
--
local function mobjInRange(mo, mo2)
	if ((abs(mo.x-mo2.x)>>16 < 32) and (abs(mo.y-mo2.y)>>16 < 32) and (abs(mo.z-mo2.z)>>16 < 6)) return true
	else return false end
end
addHook("MobjThinker", function(mo)
	if (gametype!=GT_MURDERMYSTERY) return end
	for p in players.iterate --should be dumb but it works
		if (not p.mo) continue end
		if (p.role==ROLE_INNOCENT) and (mobjInRange(mo, p.mo))
			P_RemoveMobj(mo)
			MM.shreml_dropped=$-1
			S_StartSound(p.mo, 97, p)
			p.role=ROLE_HERO
			chatprintGlobal("SHREML_PICK")
			CheckPlayers()
			return
		end
	end		
end, MT_SHREML)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end
	if p.role==ROLE_MURDERER --remove weapons from Murderer
		p.ringweapons=0
		for i=15,20 p.powers[i]=0 end
	elseif (p.role==ROLE_INNOCENT) p.weapondelay=1 end --Make innocents not shoot

	--for some reason when switching back from spectator MF_NOGRAVITY flag isn't removed by SRB2
	if (not p.spectator) p.mo.flags=$&~MF_NOGRAVITY end

	--AFK logic
	if (p.cmd.forwardmove==0) and (p.cmd.sidemove==0) and (p.cmd.buttons==0) and (not p.spectator) and (PlayerCount()!=1) and (afkCVAR.value!=0) p.afk=$+1
	else p.afk=0 end
	if p.afk>afkCVAR.value*60*35
		if p==server
			print("\x82HOST PLAYER IS AFK, CLOSING THE SERVER...")
			COM_BufInsertText(server, "QUIT")
		else COM_BufInsertText(server, "kick "..#p.." AFK") end
	end
end)

--
-- Quit Handler
-- end the game when Murd or Sheriff left and no Innocents are alive to reassign that role to them
--
addHook("PlayerQuit", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end
	if p.role==ROLE_MURDERER
		p.role=ROLE_NONE
		if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_MURDERER)==0)
			endRound(0, "LAST_LEFT", ROLE_MURDERER)
		elseif PlayerCount(ROLE_MURDERER)==0
			if gamestate==GS_LEVEL
				chatprintGlobal("REPLACE_LEFT", ROLE_MURDERER)
				SetRandomInnoAs(ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server, "- Murderer replaced") end
			else
				chatprintGlobal("ONE_LEFT", ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server,"- Murderer left") end
			end
		else
			chatprintGlobal("ONE_LEFT", ROLE_MURDERER)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer left") end
		end
	elseif p.role==ROLE_SHERIFF
		p.role=ROLE_NONE
		if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			if (PlayerCount(ROLE_HERO)==0) endRound(0, "LAST_LEFT", ROLE_SHERIFF)
			else chatprintGlobal("LAST_LEFT", ROLE_SHERIFF) end
		elseif PlayerCount(ROLE_SHERIFF)==0
			if gamestate==GS_LEVEL
				chatprintGlobal("REPLACE_LEFT", ROLE_SHERIFF)
				SetRandomInnoAs(ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff replaced") end
			else
				chatprintGlobal("ONE_LEFT", ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
			end
		else
			chatprintGlobal("ONE_LEFT", ROLE_SHERIFF)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
		end
	elseif p.role==ROLE_INNOCENT
		p.role=ROLE_NONE
		CheckPlayers()
	elseif p.role==ROLE_HERO
		p.role=ROLE_NONE
		if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_HERO)==0)
			if (PlayerCount(ROLE_SHERIFF)==0) endRound(0, "LAST_LEFT", ROLE_HERO)
			else chatprintGlobal("LAST_LEFT", ROLE_HERO) end
		elseif (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			if gamestate==GS_LEVEL
				chatprintGlobal("REPLACE_LEFT", ROLE_HERO)
				SetRandomInnoAs(ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "- Hero replaced") end
			else
				chatprintGlobal("ONE_LEFT", ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "-Hero left") end
			end
		else
			chatprintGlobal("ONE_LEFT", ROLE_HERO)
			if (isdedicatedserver) CONS_Printf(server, "- Hero left") end
		end
	end
	if p.name!=p.oldname
		chatprint("\x82*"..p.oldname.." didn't read \x87MMHELP BAD\x82 carefuly, what a stupid")
		p.oldname=p.name
	end
end)

--
-- Debug only Console Commands
--
if MM.devbuild
	COM_AddCommand("mmplayer", function(p, pnum, prole, pdead, killby)
		if (not pnum) or (not prole) or (not pdead)
			CONS_Printf(p, "\x87MMPLAYER\x80 [playernum] [role] [dead (0/1)] [killedby (optional)]")
			return
		end
		if (prole=="nil") players[tonumber(pnum)].role=nil
		else players[tonumber(pnum)].role=tonumber(prole) end
		if (pdead=="1") KillPlayer(players[tonumber(pnum)].realmo, players[tonumber(pnum)].realmo)
		else players[tonumber(pnum)].spectator=false end
		if (killby) players[tonumber(pnum)].killedby=killby end
	end)
	COM_AddCommand("mmnodes", do
		for p in players.iterate print(p.name..": "..tostring(p.role)..", "..tostring(p.spectator)) end
	end)
end