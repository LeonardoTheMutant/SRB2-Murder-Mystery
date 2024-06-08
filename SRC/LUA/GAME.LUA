-- GAME.LUA
-- Original base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
-- With the additional help of Jesus.B
--
-- The main logic script of Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, AFK logic, and round endings

local afkCVAR = CV_FindVar("mm_afk")
local deadlymodeCVAR = CV_FindVar("mm_deadlymode")

addHook("MapLoad", function(map)
	if (gametype != GT_MURDERMYSTERY) return end
	--prepare players & server for the new round
	for p in players.iterate
		p.spectator = false
		p.kills = 0
		p.killedby = nil
		p.flashscrn = 0
		p.minigame = false
		p.mmweapondelay = 0
	end

	MM.winner = 0
	MM.winreason = 0
	MM.shremls = {}

	MM.timelimit = 0
	if (mapheaderinfo[map].mm_timelimit and tonumber(mapheaderinfo[map].mm_timelimit))
		MM.timelimit = tonumber(mapheaderinfo[map].mm_timelimit)
	elseif (timelimit) --Swapping timelimit value mid-game will cause a desync between internal and HUD timers. Remember that when hosting a game. Map reload fixes synchronization
		MM.timelimit = timelimit
	end
	if (MM.timelimit)
		MM.timelimit = $ + MM_GetRoleMultiplier() - 1
    	print("Time limit for this round is "..MM.timelimit.." minutes")
	end

	MM.shwdwn = false

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
		local f = io.openlocal("client/MM.DAT", 'r') -- preferences file load
		if f
			local l = f:read() --read data
			if (MM.text[l]) p.mmlang = l --is such language imported into the game?
			else p.mmlang = "EN" end --no
			f:close() --file close
		else p.mmlang = 'EN' end --failed to open the file
	end

	if (not p.roleflicker) p.roleflicker = 0 end --Role flickering on HUD
	if (not p.chatdelay) p.chatdelay = 0 end --Chat spam protection
	if (not p.kills) p.kills = 0 end --Kill counter
	if (not p.afk) p.afk = 0 end --Anti-AFK
	if (not p.mmhelp) p.mmhelp = {page = 1, pos = 1, active = false} end --MMHELP UI init
	if (p.mmweapondelay == nil) p.mmweapondelay = TICRATE end --Weapon reload
	p.oldname = p.name --Anti-RenameCheat init

	p.powers[2] = 104 -- flashing invulnerability for 3 sec

	--Check player num and state on join
	if ((PlayerCount() == 2) and (p.role == nil)) --Player2 joined a 'singleplayer' round
		for player in players.iterate do player.minigame = false end --Shutdown Player1's minigame session
		MM.minigame = false --Tell server to disable the PONG minigame
		MM_AssignRoles() --Assign roles for that duel
		MM.twopgame = true
	elseif ((PlayerCount() > 2) and (p.role == nil)) --Other players are dead on join
		p.spectator = true
	end
end)

addHook("HurtMsg", do --disable Ringslier hurt messages
	if (gametype == GT_MURDERMYSTERY) return true end
end)

--
-- Hit/Kill detector
--

--Map hazard deaths for the "Deadly mode"
addHook("MobjDeath", function(victim, inf, attacker, dmgtype)
	if (gametype != GT_MURDERMYSTERY) or (not deadlymodeCVAR.value) return end
	local vp = victim.player
	local spawnbody = ((dmgtype <= DMG_NUKE) or (dmgtype == DMG_DROWNED) or (dmgtype == DMG_SPACEDROWN) or ((dmgtype == DMG_CRUSHED) and (attacker)))
	
	if (vp.role == ROLE_MURDERER)
		MM_KillPlayer2(victim, spawnbody)
		if (not PlayerCount(ROLE_MURDERER))
			MM_EndRound(ROLE_SHERIFF, "WIN", WIN_CIVILS)
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Murd) died") end
		end
	elseif (vp.role == ROLE_SHERIFF)
		MM_KillPlayer2(victim, spawnbody)
		if (PlayerCount(ROLE_INNOCENT))
			if (spawnbody)
				MM_SpawnSHREML(victim.x, victim.y, victim.z, MT_SHREML)
				MM_ChatprintGlobal("SHERI_KILLED", vp.name)
				if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
			else
				if (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
					MM_ChatprintGlobal("SHERI_KILLED_NODROP", vp.name)
					if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
				else
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				end
			end
		elseif (not PlayerCount(ROLE_INNOCENT)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_KILLED_NODROP", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		end
	elseif (vp.role == ROLE_INNOCENT)
		MM_KillPlayer2(victim, spawnbody)
	elseif (vp.role == ROLE_HERO)
		MM_KillPlayer2(victim, spawnbody)
		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	end
	MM_CheckShowdown()
end, MT_PLAYER)

--Regular Player->Player kills
addHook("MobjDamage", function(victim, inf, attacker)
	if (gametype != GT_MURDERMYSTERY) or (not attacker) or (not attacker.player) return end
	local vp = victim.player
	local ap = attacker.player
	if (ap.role == ROLE_INNOCENT) --Innocents can not hurt others
	--	CONS_Printf(p, "\x87THE ULTIMATE LIFE FORM?!?!? \x85...or a fricking cheater who has bypassed the limits?")
	--	print("\x87"..ap.name.."\x85 hit \x87"..vp.name.."\x85 while being an \x83Innocent")
		return true
	end
	if (vp.role == ROLE_MURDERER)
		if (ap.role == ROLE_MURDERER)
			MM_HitTeammate(vp, ap)
			return true
		end
		MM_KillPlayer(victim, attacker)
		-- Murderer died, end the game if every Murd is dead
		if (not PlayerCount(ROLE_MURDERER))
			MM_EndRound(ROLE_SHERIFF, "WIN", WIN_CIVILS)
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Murd) died") end
		end
	elseif (vp.role == ROLE_SHERIFF)
		if ((ap.role == ROLE_SHERIFF) or (ap.role == ROLE_HERO))
			MM_HitTeammate(vp, ap)
			return true
		end
		MM_KillPlayer(victim, attacker)
		--Sheriff died, drop their emerald (weapon in original MM) if there are still Innos around
		if (PlayerCount(ROLE_INNOCENT))
			MM_SpawnSHREML(victim.x, victim.y, victim.z, MT_SHREML)
			MM_ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (not PlayerCount(ROLE_INNOCENT)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_KILLED_NODROP", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.role == ROLE_INNOCENT)
		MM_KillPlayer(victim, attacker)
		if (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
		if (ap.role == ROLE_SHERIFF)
			--Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
			--otherwise, Murderers win
			if (PlayerCount(ROLE_INNOCENT))
				chatprintf(ap, MM.text[ap.mmlang]["INNO_HURT_PM"][1])
				MM_ChatprintGlobal("INNO_HURT", 1)
				MM_SetRandomInnoAs(ROLE_SHERIFF)
				ap.role = ROLE_INNOCENT
			else
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
			end
		elseif (ap.role == ROLE_HERO)
			MM_KillPlayer(attacker)
			if (not PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
			elseif (PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not #MM.shremls)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
			else
				chatprintf(ap, MM.text[ap.mmlang]["INNO_HURT_PM"][2])
				MM_ChatprintGlobal("INNO_HURT", 2)
			end
		end
	elseif (vp.role == ROLE_HERO)
		if (ap.role == ROLE_HERO) or (ap.role == ROLE_SHERIFF)
			MM_HitTeammate(vp, ap)
			return true
		end
		MM_KillPlayer(victim, attacker)
		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	end
	
	MM_CheckShowdown()
	return true
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
			found.player.roleflicker = 70 --2 secs
			MM_ChatprintGlobal("SHREML_PICK")
			MM_CheckShowdown()
			return true
		end
	end, mo)
end, MT_SHREML)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype != GT_MURDERMYSTERY) return end

	--remove weapons from Murderer in case it is not Duel or Murderers are not allowed to have other weapons during Duels
	if ((p.role == ROLE_MURDERER) and (PlayerCount(ROLE_INNOCENT) or (not CV_FindVar("mm_duelmode").value))) p.ringweapons = 0 end

	p.weapondelay = 1 --vanilla weapons don't shoot anymore, only the MM recreation
	p.powers[3] = 0 --disable shields completely

	if (not p.spectator)
		--for some reason when switching back from spectator MF_NOGRAVITY flag isn't removed by SRB2
		p.mo.flags = $ & ~MF_NOGRAVITY
	end

	--role flickering timer
	if (p.roleflicker) p.roleflicker = $ - 1 end

	--HUD flash screen fadeout
	if (p.flashscrn) and (not (leveltime % 4))
		p.flashscrn = $ + 1
		if (p.flashscrn >= 10) p.flashscrn = 0 end
	end

	--Sheriff Emerald Radar distance logic
	if ((#MM.shremls) and (p.role == ROLE_INNOCENT) and (not p.spectator))
		--find the distance to the closest emerald
		local shreml_dist = {}
		for emeraldID = 1, #MM.shremls do
			if (MM.shremls[emeraldID].valid)
				table.insert(shreml_dist, #shreml_dist, P_AproxDistance(P_AproxDistance(p.mo.x - MM.shremls[emeraldID].x, p.mo.y - MM.shremls[emeraldID].y), p.mo.z - MM.shremls[emeraldID].z))
			end
		end
		local closest = shreml_dist[0]
		for emeraldID = 1, #shreml_dist do
			if (shreml_dist[emeraldID] < closest) then closest = shreml_dist[emeraldID] end
		end
		p.shreml_dist = closest

		--play sound
		if (p.shreml_dist)
			local interval = MM_GetSHREMLinterval(fixint(p.shreml_dist))
			if (interval and (leveltime % interval) == 0) S_StartSound(nil, sfx_emfind, p) end
		end
	end

	--AFK logic
	if ((not p.cmd.forwardmove) and (not p.cmd.sidemove) and (not p.cmd.buttons) and (not p.spectator) and (PlayerCount() > 1) and (afkCVAR.value))
		p.afk = $ + 1
	else p.afk = 0 end
	if (p.afk > afkCVAR.value*2100)
		if (p == server) COM_BufInsertText(server, "QUIT")
		else COM_BufInsertText(server, "KICK "..#p.." AFK") end
	end
	p.oldangleturn = p.cmd.angleturn
	p.oldaiming = p.cmd.aiming

	--Eliminate players who left the game (in case REJOINTIMEOUT cvar is not disabled)
	if (p.quittime)
		MM_PlayerQuit(p)
		CONS_Printf(server, "KICK "..#p.." Player leave")
	end

	--Anti-RenameCheat
	if ((p.name != p.oldname) and (p.spectator))
		if (p == server)
			print("\x85HOST PLAYER TRIED TO CHEAT WITH RENAMING!!!") --I believe this line is never printed too
			COM_BufInsertText(server, "QUIT")
		end
		COM_BufInsertText(server, "KICK "..#p.." Do not rename when dead!")
		return
	end

	p.oldname = p.name
end)

--
-- Intermission Thinker
--
addHook("IntermissionThinker", do
	--special round win check for the minigame
	if ((MM.minigame) and (MM.duelplrs[1].valid) and (MM.duelplrs[2].valid))
		if (MM.duelplrs[1].kills > MM.duelplrs[2].kills) then MM.winner = MM.duelplrs[1].role
		elseif (MM.duelplrs[1].kills < MM.duelplrs[2].kills) then MM.winner = MM.duelplrs[2].role end
	end
	-- Kick forcer (for Intermission)
	for p in players.iterate do
		if (p.quittime) then COM_BufInsertText(server, "KICK "..#p.." Player leave") end
		if (p.spectator) p.spectator = false end
	end
	
	MM.shwdwn = false
end)

--
-- Intermission ending theme switcher
--
addHook("MusicChange", function(old, new)
    if (gametype != GT_MURDERMYSTERY) return end

	--Showdown Duel music
	if ((gamestate == GS_LEVEL) and (MM.shwdwn)) return MM.shwdwn end

	--Intermission theme
	if (new == "_inter")
		if (not MM.winner) return "NOWAY" --Sonic 3 & Knuckles "No way!"
		else
			if (MM.winreason == 1) return "INTER" --DOOM I "Intermission" / "Episode 2 Map 3"
			elseif (MM.winreason == 2) return "UN39" --"Unused DOOM track 39"
			elseif (MM.winreason == 3) return "GASTER" --Undertale "Gaster's theme"
			elseif (MM.winreason == 4) return "11H_IN" --Main theme of "The 11th Hour: The sequel to The 7th Guest"
			elseif (MM.winreason == 5) return "VANDOM" --Super Mario World "Vanilla Dome"
			else return "PBW_DC" end --Pokemon Black & White "Driftevil City"
		end
	end
end)

--
-- Quit Handler
-- end the game when Murd or Sheriff left and no Innocents are alive to reassign that role to them
--
addHook("PlayerQuit", function(p)
	if ((gametype != GT_MURDERMYSTERY) or (gamestate != GS_LEVEL)) return end
	if (p.role) MM_PlayerQuit(p) end
end)
