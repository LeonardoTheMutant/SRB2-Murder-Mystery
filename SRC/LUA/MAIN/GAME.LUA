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

addHook("MapLoad", function(map)
	if (gametype!=GT_MURDERMYSTERY) return end
	--prepare players & server for the new round
	for p in players.iterate
		p.spectator = false
		p.kills = 0
		p.killedby = nil
		p.flashscrn = 0
		p.powers[0] = 245 -- invulnerability for 7 sec
		p.minigame = false
	end
	MM.winner = 0
	MM.winreason = 0
	MM.shreml_dropped=0
	MM.timelimit = (tonumber(mapheaderinfo[map].mm_timelimit) or 4) + MM_GetRoleMultiplier()
    print("Time limit for this map is "..MM.timelimit.." minutes")
	MM.twopgame = (PlayerCount()==2)
	MM.minigame = false
	TTT_ResetBoard()
	MM.ttt.cursor = 5
	MM.ttt.turn = 1
	MM.ttt.turntime = 350
	MM.ttt.wintimeout = -1
	MM_AssignRoles()
end)

--
-- Player spawn
--
addHook("PlayerSpawn", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end

	--Apply language
	if (not p.mmlang)
		local f = io.openlocal("client/MM.DAT", 'r') -- language load
		if f
			local l=f:read()
			if (mmtxt[l]) p.mmlang=l
			else p.mmlang="EN" end
			f:close()
		else p.mmlang='EN' end
	end

	if (not p.roleflicker) p.roleflicker=0 end
	if (not p.chatdelay) p.chatdelay=0 end
	if (not p.kills) p.kills=0 end --Init kill counter
	if (not p.afk) p.afk=0 end --Anti-AFK init
	if (p.mmweapondelay==nil) p.mmweapondelay=TICRATE end
	p.oldname=p.name --Anti-cheat init

	--Player num and state check on join
	if (PlayerCount()==2) and (p.role==nil) --Player2 joined a 'singleplayer' round
		MM_AssignRoles() --Assign roles for that duel
		for plr in players.iterate S_StartSound(nil,93,plr) end --notify player 1 (who might be AFK) about a new rival
		MM.twopgame=true
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
-- Custom TIMELIMIT code
-- A replacement of SRB2's built-in TIMELIMIT (original sucks)
--
addHook("ThinkFrame", function()
    if (gametype==GT_MURDERMYSTERY) and (leveltime >= (MM.timelimit*60*TICRATE)-1) G_ExitLevel() end
end)

--
-- Main hit/kill detector
--
addHook("MobjDamage", function(victim, inf, attacker)
	if (gametype!=GT_MURDERMYSTERY) or (not attacker) or (not attacker.player) return end
	local vp=victim.player
	local ap=attacker.player
	if (ap.role==ROLE_INNOCENT)
		CONS_Printf(p, "\x87THE ULTIMATE LIFE FORM?!?!? \x85...or a fricking cheater who have bypassed the limits?")
		print("\x87"..ap.name.."\x85 hit \x87"..vp.name.."\x85 while being an \x83Innocent")
		return true
	end
	if vp.role==ROLE_MURDERER
		if ap.role==ROLE_MURDERER
			chatprintf(ap, "\x85"..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, "\x85"..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		-- Murderer died, end the game if every Murd is dead
		if PlayerCount(ROLE_MURDERER)==0
			MM_EndRound(ROLE_SHERIFF, "WIN", WIN_CIVILS)
			return
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Murd) died") end
		end
	elseif (vp.role==ROLE_SHERIFF)
		if (ap.role==ROLE_SHERIFF) or (ap.role==ROLE_HERO)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		-- Sheriff died, drop their emerald (weapon in original MM) if there are still Innos around
		if PlayerCount(ROLE_INNOCENT)!=0
			P_SpawnMobjFromMobj(victim,0,0,0,MT_SHREML)
			MM.shreml_dropped=$+1
			MM_ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)!=0)
			MM_ChatprintGlobal("SHERI_KILLED_NODROP", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		end
	elseif vp.role==ROLE_INNOCENT
		MM_KillPlayer(victim, attacker)
		if ap.role==ROLE_SHERIFF
			-- Sheriff killed an innocent, remove role "Sheriff" from the player if there are more of Innos,
			-- otherwise Murderers win
			if PlayerCount(ROLE_INNOCENT)>0
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][1])
				MM_ChatprintGlobal("INNO_HURT", 1)
				MM_SetRandomInnoAs(ROLE_SHERIFF)
				ap.role=ROLE_INNOCENT
			else
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
				return
			end
		elseif ap.role==ROLE_HERO
			MM_KillPlayer(attacker, nil)
			if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
				return
			elseif (PlayerCount(ROLE_INNOCENT)!=0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_HERO)==0) and (MM.shreml_dropped==0)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				return
			else
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][2])
				MM_ChatprintGlobal("INNO_HURT", 2)
			end
		end
	elseif vp.role==ROLE_HERO
		if (ap.role==ROLE_HERO) or (ap.role==ROLE_SHERIFF)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		if (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
			return
		else
			MM_ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	end
	MM_CheckPlayers()
end, MT_PLAYER)

--
-- Sheriff's Emerald pickup logic
--
local function mobjInRange(mo, mo2)
	if ((abs(mo.x-mo2.x) < 2097152) and (abs(mo.y-mo2.y) < 2097152) and (abs(mo.z-mo2.z) < 1048576)) return true --32*FU, 16*FU
	else return false end
end
addHook("MobjThinker", function(mo)
	if (gametype!=GT_MURDERMYSTERY) return end
	searchBlockmap("objects", function(ref, found)
		if (found) and (found.player) and (found.player.role==ROLE_INNOCENT) and (mobjInRange(ref, found))
			P_RemoveMobj(ref)
			MM.shreml_dropped=$-1
			S_StartSound(found.player.mo, 97, found.player)
			found.player.role=ROLE_HERO
			found.player.roleflicker=70
			MM_ChatprintGlobal("SHREML_PICK")
			MM_CheckPlayers()
			return true
		end
	end, mo)
end, MT_SHREML)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype!=GT_MURDERMYSTERY) return end
	if (p.role==ROLE_MURDERER) p.ringweapons=0 end --remove weapons from Murderer
	p.weapondelay=1 --vanilla weapons don't shoot anymore :)

	--for some reason when switching back from spectator MF_NOGRAVITY flag isn't removed by SRB2
	if (not p.spectator) p.mo.flags=$&~MF_NOGRAVITY end

	--role flickering timer
	if (p.roleflicker) p.roleflicker=$-1 end

	--HUD flash screen fadeout
	if (p.flashscrn) and (leveltime%2==0)
		p.flashscrn=$+1
		if (p.flashscrn>=10) p.flashscrn=0 end
	end

	--AFK logic
	if (p.cmd.forwardmove==0) and (p.cmd.sidemove==0) and (p.cmd.buttons==0) and (p.oldangleturn==p.cmd.angleturn) and (p.oldaiming==p.cmd.aiming) and (not p.spectator) and (PlayerCount()!=1) and (afkCVAR.value!=0) p.afk=$+1
	else p.afk=0 end
	if p.afk>afkCVAR.value*60*TICRATE
		if p==server
			print("\x82HOST PLAYER IS AFK, CLOSING THE SERVER...")
			COM_BufInsertText(server, "QUIT")
		else COM_BufInsertText(server, "kick "..#p.." AFK") end
	end
	p.oldangleturn=p.cmd.angleturn
	p.oldaiming=p.cmd.aiming

	--kick forcer (when rejointimeout is not 0)
	if (p.quittime) p.quittime=FixedMul(CV_FindVar('rejointimeout').value, 60*TICRATE)-1 end
end)

--
-- Kick forcer (for Intermission)
--
addHook("IntermissionThinker", do
	for p in players.iterate if (p.quittime) COM_BufInsertText(server, "KICK "..#p.." Player leave") end end
end)

--
-- Intermission ending theme switcher
--
addHook("MusicChange", function(old, new)
    if (gametype!=GT_MURDERMYSTERY) or (new!="_inter") return end
    if (MM.winner==0) return "NOWAY"
    else
        if (MM.winreason==1) return "INTER"
        elseif (MM.winreason==2) return "UN39"
        elseif (MM.winreason==3) return "GASTER"
        elseif (MM.winreason==4) return "OPENIN"
        elseif (MM.winreason==5) return "VANDOM"
        else
			if (MM.winner==1) return "INTER"
			elseif (MM.winner==2) return "UN39"
			else return newname end
		end
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
		if ((PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_MURDERER)==0)) or ((PlayerCount(ROLE_INNOCENT)!=0) and (PlayerCount(ROLE_SHERIFF)==0) and (PlayerCount(ROLE_MURDERER)==0))
			MM_EndRound(0, "LAST_LEFT", ROLE_MURDERER)
		elseif PlayerCount(ROLE_MURDERER)==0
			if gamestate==GS_LEVEL
				MM_ChatprintGlobal("REPLACE_LEFT", ROLE_MURDERER)
				MM_SetRandomInnoAs(ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server, "- Murderer replaced") end
			else
				MM_ChatprintGlobal("ONE_LEFT", ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server,"- Murderer left") end
			end
		else
			MM_ChatprintGlobal("ONE_LEFT", ROLE_MURDERER)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer left") end
		end
	elseif p.role==ROLE_SHERIFF
		p.role=ROLE_NONE
		if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			if (PlayerCount(ROLE_HERO)==0) MM_EndRound(0, "LAST_LEFT", ROLE_SHERIFF)
			else MM_ChatprintGlobal("LAST_LEFT", ROLE_SHERIFF) end
		elseif PlayerCount(ROLE_SHERIFF)==0
			if gamestate==GS_LEVEL
				MM_ChatprintGlobal("REPLACE_LEFT", ROLE_SHERIFF)
				MM_SetRandomInnoAs(ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff replaced") end
			else
				MM_ChatprintGlobal("ONE_LEFT", ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
			end
		else
			MM_ChatprintGlobal("ONE_LEFT", ROLE_SHERIFF)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
		end
	elseif p.role==ROLE_INNOCENT
		p.role=ROLE_NONE
		MM_CheckPlayers()
	elseif p.role==ROLE_HERO
		p.role=ROLE_NONE
		if (PlayerCount(ROLE_INNOCENT)==0) and (PlayerCount(ROLE_HERO)==0)
			if (PlayerCount(ROLE_SHERIFF)==0) MM_EndRound(0, "LAST_LEFT", ROLE_HERO)
			else MM_ChatprintGlobal("LAST_LEFT", ROLE_HERO) end
		elseif (PlayerCount(ROLE_HERO)==0) and (PlayerCount(ROLE_SHERIFF)==0)
			if gamestate==GS_LEVEL
				MM_ChatprintGlobal("REPLACE_LEFT", ROLE_HERO)
				MM_SetRandomInnoAs(ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "- Hero replaced") end
			else
				MM_ChatprintGlobal("ONE_LEFT", ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "-Hero left") end
			end
		else
			MM_ChatprintGlobal("ONE_LEFT", ROLE_HERO)
			if (isdedicatedserver) CONS_Printf(server, "- Hero left") end
		end
	end
end)