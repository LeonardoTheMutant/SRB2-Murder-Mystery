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
		p.mmweapondelay = 0
	end
	MM.winner = 0
	MM.winreason = 0
	MM.shremls = {}
	MM.timelimit = (tonumber(mapheaderinfo[map].mm_timelimit) or 4) + MM_GetRoleMultiplier()
    print("Time limit for this round is "..MM.timelimit.." minutes")
	MM.onepgame = (PlayerCount() == 1)
	MM.twopgame = (PlayerCount() == 2)
	MM.minigame = false
	PONG_Reset()
	MM.pong.pads[1] = 32
	MM.pong.pads[2] = 32
	MM.pong.wintimeout = -1
	MM_AssignRoles()
end)

--
-- Player spawn
--
addHook("PlayerSpawn", function(p)
	if (gametype != GT_MURDERMYSTERY) return end

	--Apply language
	if (not p.mmlang)
		local f = io.openlocal("client/MM.DAT", 'r') -- language load
		if f
			local l = f:read()
			if (mmtxt[l]) p.mmlang = l
			else p.mmlang="EN" end
			f:close()
		else p.mmlang = 'EN' end
	end

	if (not p.roleflicker) p.roleflicker = 0 end
	if (not p.chatdelay) p.chatdelay = 0 end
	if (not p.kills) p.kills = 0 end --Init kill counter
	if (not p.afk) p.afk = 0 end --Anti-AFK init
	if (p.mmweapondelay == nil) p.mmweapondelay = TICRATE end
	p.oldname = p.name --Anti-cheat init

	--Player num and state check on join
	if (PlayerCount() == 2) and (p.role == nil) --Player2 joined a 'singleplayer' round
		MM_AssignRoles() --Assign roles for that duel
		for plr in players.iterate S_StartSound(nil, sfx_bkpoof, plr) end --notify player 1 (who might be AFK) about a new rival
		MM.twopgame = true
	elseif (PlayerCount() > 2) and (p.role == nil) p.spectator=true end --Players >=3 who joined are DEAD (spectators)
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
    if (gametype == GT_MURDERMYSTERY) and (leveltime >= (MM.timelimit*60*TICRATE) - 1) G_ExitLevel() end
end)

--
-- Main hit/kill detector
--
addHook("MobjDamage", function(victim, inf, attacker)
	if (gametype!=GT_MURDERMYSTERY) or (not attacker) or (not attacker.player) return end
	local vp = victim.player
	local ap = attacker.player
	if (ap.role == ROLE_INNOCENT)
		CONS_Printf(p, "\x87THE ULTIMATE LIFE FORM?!?!? \x85...or a fricking cheater who have bypassed the limits?")
		print("\x87"..ap.name.."\x85 hit \x87"..vp.name.."\x85 while being an \x83Innocent")
		return true
	end
	if (vp.role == ROLE_MURDERER)
		if (ap.role == ROLE_MURDERER)
			chatprintf(ap, "\x85"..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, "\x85"..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		-- Murderer died, end the game if every Murd is dead
		if (PlayerCount(ROLE_MURDERER) == 0)
			MM_EndRound(ROLE_SHERIFF, "WIN", WIN_CIVILS)
			return
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Murd) died") end
		end
	elseif (vp.role == ROLE_SHERIFF)
		if (ap.role == ROLE_SHERIFF) or (ap.role == ROLE_HERO)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		-- Sheriff died, drop their emerald (weapon in original MM) if there are still Innos around
		if (PlayerCount(ROLE_INNOCENT) != 0)
			MM_SpawnSHREML(victim.x, victim.y, victim.z, MT_SHREML)
			MM_ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (PlayerCount(ROLE_INNOCENT) == 0) and (PlayerCount(ROLE_SHERIFF) != 0)
			MM_ChatprintGlobal("SHERI_KILLED_NODROP", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		end
	elseif (vp.role == ROLE_INNOCENT)
		MM_KillPlayer(victim, attacker)
		if (ap.role == ROLE_SHERIFF)
			-- Sheriff killed an innocent, remove role "Sheriff" from the player if there are more of Innos,
			-- otherwise Murderers win
			if (PlayerCount(ROLE_INNOCENT) > 0)
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][1])
				MM_ChatprintGlobal("INNO_HURT", 1)
				MM_SetRandomInnoAs(ROLE_SHERIFF)
				ap.role = ROLE_INNOCENT
			else
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
				return
			end
		elseif (ap.role == ROLE_HERO)
			MM_KillPlayer(attacker, nil)
			if (PlayerCount(ROLE_INNOCENT) == 0) and (PlayerCount(ROLE_SHERIFF) == 0) and (PlayerCount(ROLE_HERO) == 0)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
				return
			elseif (PlayerCount(ROLE_INNOCENT) != 0) and (PlayerCount(ROLE_SHERIFF) == 0) and (PlayerCount(ROLE_HERO) == 0) and (not #MM.shremls)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				return
			else
				chatprintf(ap, mmtxt[ap.mmlang]["INNO_HURT_PM"][2])
				MM_ChatprintGlobal("INNO_HURT", 2)
			end
		end
	elseif (vp.role == ROLE_HERO)
		if (ap.role == ROLE_HERO) or (ap.role == ROLE_SHERIFF)
			chatprintf(ap, MM.RoleColor[vp.role]..mmtxt[ap.mmlang]["TEAMMATE_HIT"][1])
			chatprintf(vp, MM.RoleColor[ap.role]..mmtxt[vp.mmlang]["TEAMMATE_HIT"][2])
			return
		end
		MM_KillPlayer(victim, attacker)
		if (PlayerCount(ROLE_HERO) == 0) and (PlayerCount(ROLE_SHERIFF) == 0)
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
addHook("MobjThinker", function(mo)
	if (gametype != GT_MURDERMYSTERY) return end
	searchBlockmap("objects", function(ref, found)
		if (found) and (found.player) and (found.player.role==ROLE_INNOCENT) and (P_AproxDistance(P_AproxDistance(found.x - ref.x, found.y - ref.y), found.z - ref.z) < 2097152) --32*FU
			for emeraldID = 1, #MM.shremls do
				if ((MM.shremls[emeraldID].x == ref.x) and (MM.shremls[emeraldID].y == ref.y) and (MM.shremls[emeraldID].z == ref.z))
					table.remove(MM.shremls, emeraldID)
					P_RemoveMobj(ref)
					break
				end
			end
			S_StartSound(found.player.mo, sfx_cgot, found.player)
			found.player.role = ROLE_HERO
			found.player.roleflicker = 70 --2 seconds
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
	if (gametype != GT_MURDERMYSTERY) return end
	if (p.role == ROLE_MURDERER) p.ringweapons = 0 end --remove weapons from Murderer
	p.weapondelay = 1 --vanilla weapons don't shoot anymore :)

	--for some reason when switching back from spectator MF_NOGRAVITY flag isn't removed by SRB2
	if (not p.spectator) p.mo.flags = $ & ~MF_NOGRAVITY end

	--role flickering timer
	if (p.roleflicker) p.roleflicker = $ - 1 end

	--HUD flash screen fadeout
	if (p.flashscrn) and (leveltime % 4 == 0)
		p.flashscrn = $ + 1
		if (p.flashscrn >= 10) p.flashscrn = 0 end
	end

	--Sheriff Emerald Radar distance logic
	if ((#MM.shremls) and (p.role == ROLE_INNOCENT) and (not p.spectator))
		--find the distance to the closest emerald
		local shreml_dist = {}
		for emeraldID = 1, #MM.shremls do if (MM.shremls[emeraldID].valid) then table.insert(shreml_dist, (#shreml_dist + 1), P_AproxDistance(P_AproxDistance(p.mo.x - MM.shremls[emeraldID].x, p.mo.y - MM.shremls[emeraldID].y), p.mo.z - MM.shremls[emeraldID].z)) end end
		table.sort(shreml_dist)
		p.shreml_dist = shreml_dist[1]

		--play sound
		local interval = MM_GetSHREMLinterval(fixint(p.shreml_dist))
		if (interval and (leveltime % interval) == 0) S_StartSound(nil, sfx_emfind, p) end
	end

	--AFK logic
	if (p.cmd.forwardmove == 0) and (p.cmd.sidemove == 0) and (p.cmd.buttons == 0) and (not p.spectator) and (PlayerCount() > 1) and (afkCVAR.value) p.afk = $ + 1
	else p.afk = 0 end
	if (p.afk > afkCVAR.value*60*TICRATE)
		if (p == server)
			print("\x82HOST PLAYER IS AFK, CLOSING THE SERVER...")
			COM_BufInsertText(server, "QUIT")
		else COM_BufInsertText(server, "kick "..#p.." AFK") end
	end
	p.oldangleturn = p.cmd.angleturn
	p.oldaiming = p.cmd.aiming

	--kick forcer (when rejointimeout is not 0)
	if (p.quittime) p.quittime = FixedMul(CV_FindVar('rejointimeout').value, 60*TICRATE)-1 end
end)

--
-- Intermission Thinker
--
addHook("IntermissionThinker", do
	--special round win check for the minigame
	if (MM.minigame and MM.duelplrs[1].valid and MM.duelplrs[2].valid)
		if (MM.duelplrs[1].kills > MM.duelplrs[2].kills) MM.winner = MM.duelplrs[1].role
		elseif (MM.duelplrs[1].kills < MM.duelplrs[2].kills) MM.winner = MM.duelplrs[2].role end
	end
	-- Kick forcer (for Intermission)
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
	if (p.role == ROLE_MURDERER)
		p.role = ROLE_NONE
		if ((PlayerCount(ROLE_INNOCENT)==0) or (PlayerCount(ROLE_INNOCENT) and (PlayerCount(ROLE_SHERIFF)==0)) and PlayerCount(ROLE_MURDERER)==0)
			MM_EndRound(0, "LAST_LEFT", ROLE_MURDERER)
		elseif PlayerCount(ROLE_MURDERER)==0
			if (gamestate == GS_LEVEL)
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
	elseif (p.role == ROLE_SHERIFF)
		p.role = ROLE_NONE
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
	elseif (p.role == ROLE_INNOCENT)
		p.role = ROLE_NONE
		MM_CheckPlayers()
	elseif (p.role == ROLE_HERO)
		p.role = ROLE_NONE
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