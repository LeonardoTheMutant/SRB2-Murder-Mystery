-- GAME.LUA
-- Original base code by Tedvin11
-- Code modifications by LeonardoTheMutant with the additional help of Jesus.B
--
-- The main logic script of the LTM's Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, AFK logic, and round endings

local afkCVAR = CV_FindVar("mm_afk")
local rejointimeoutCVAR = CV_FindVar("rejointimeout")

local function MM_GetSHREMLinterval(dist)
	if (dist < 256) return 5
	elseif (dist < 512) return 10
	elseif (dist < 1024) return 20
	elseif (dist < 2048) return 30
	elseif (dist < 4096) return 35
	else return 0 end
end

addHook("MapLoad", function(map)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	--Prepare players & server for the new round
	for p in players.iterate
		p.spectator = false
		p.kills = 0
		p.killedby = nil
		p.flashscrn = 0
		p.minigame = false
		p.mmweapondelay = 0
	end

	--Prepare the game
	MM.winner = 0
	MM.winreason = 0
	MM.shremls = {}
	MM.shwdwn = false

	--Time limit
	if (timelimit) --Swapping the vanilla TIMELIMIT CVAR value mid-game will cause a desync between internal and HUD timers. Remember that when hosting a game. Map reload fixes synchronization
		MM.timelimit = timelimit
	elseif (mapheaderinfo[map].timelimit) and (tonumber(mapheaderinfo[map].timelimit))
		MM.timelimit = tonumber(mapheaderinfo[map].timelimit)
	else
		MM.timelimit = 5
	end
	MM.timelimit = $ + MM_GetRoleMultiplier() - 1
    print("Time limit for this round is "..MM.timelimit.." minutes")

	--Prepare the minigames
	MM.twopgame = (PlayerCount() == 2)
	MM.minigame = false
	PONG_Reset()
	MM.pong.pads[1] = 32
	MM.pong.pads[2] = 32
	MM.pong.wintimeout = -1

	--Assign roles to the players
	MM_AssignRoles()
end)

-- Custom TIMELIMIT code
-- An alternative to SRB2's built-in TIMELIMIT
addHook("ThinkFrame", function()
    if ((gametype == GT_LTMMURDERMYSTERY) and (leveltime >= (MM.timelimit * 2100) - 1) and (not timelimit)) G_ExitLevel() end
end)

--
-- Player spawn
--
addHook("PlayerSpawn", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end

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

	if (not p.roleflicker) then p.roleflicker = 0 end --Role flickering on HUD
	if (not p.chatdelay) then p.chatdelay = 0 end --Chat spam protection
	if (not p.kills) then p.kills = 0 end --Kill counter
	if (not p.afk) then p.afk = 0 end --Anti-AFK
	if (not p.camping) then p.camping = 0 end --Murderer anti-camp
	if (not p.mmhelp) then p.mmhelp = {page = 1, pos = 1, active = false} end --MMHELP UI init
	if (p.mmweapondelay == nil) then p.mmweapondelay = TICRATE end --Weapon reload
	p.oldname = p.name --Anti-RenameCheat init

	p.powers[pw_flashing] = 104 -- flashing invulnerability for 3 sec

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
	if (gametype == GT_LTMMURDERMYSTERY) return true end
end)

--
-- Death/Kill detector
--

addHook("MobjDeath", function(v, i, a, d) --Victim, inflictor (unused here), attacker, damage type
	if (gametype != GT_LTMMURDERMYSTERY) return end
	if (MM.debug) print("\x82Triggered MobjDeath") end
	local vp = v.player --Victim player

	local ap --Attacker player
	if (a) and (a.player)
		ap = a.player
		if (MM.debug) print("\x82MobjDeath attacker is player") end
	end

	--If the death is caused by the death pit or crusher we do not need to spawn the Dead Body or the Sheriff's Emerald
	local spawnBodyOrEmerald = not ((d == DMG_DEATHPIT) or (d == DMG_CRUSHED))

	if (vp.role == ROLE_MURDERER)
		if (ap)
			if (MM_AreTeammates(vp, ap)) then return false
			else MM_KillPlayerByPlayer(v, a) end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (not PlayerCount(ROLE_MURDERER))
			MM_EndRound(WIN_CIVILS, "WIN", WIN_CIVILS)
		else
			MM_ChatprintGlobal("MURD_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) has died in an accident") end
		end
	elseif (vp.role == ROLE_SHERIFF)
		if (ap)
			if (MM_AreTeammates(vp, ap)) then return false
			else MM_KillPlayerByPlayer(v, a) end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (PlayerCount(ROLE_INNOCENT))
			if (spawnBodyOrEmerald)
				MM_SpawnSHREML(v.x, v.y, v.z, vp)
				MM_ChatprintGlobal("SHERI_DIED_DROP", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident, dropped his emerald") end
			else
				if (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
					MM_ChatprintGlobal("SHERI_DIED", vp.name)
					if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accicent") end
				else
					MM_EndRound(1, "WIN", WIN_NODEFENDERS)
				end
			end
		elseif (not PlayerCount(ROLE_INNOCENT)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.role == ROLE_HERO)
		if (ap)
			if (MM_AreTeammates(vp, ap)) then return false
			else MM_KillPlayerByPlayer(v, a) end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) has died in an accident") end
		end
	elseif (vp.role == ROLE_INNOCENT)
		if (ap)
			MM_KillPlayerByPlayer(v, a)
			if (ap.role == ROLE_SHERIFF)
				-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
				-- otherwise Murderers win
				if (PlayerCount(ROLE_INNOCENT))
					chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 1))
					MM_ChatprintGlobal("INNO_HURT", 1)
					MM_SetRandomInnoAs(ROLE_SHERIFF, 2)
					ap.role = ROLE_INNOCENT
				else
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
				end
			elseif (ap.role == ROLE_HERO)
				MM_KillPlayerByHazard(a, true)
				if (not PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
				elseif (PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not #MM.shremls)
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				else
					chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 2))
					MM_ChatprintGlobal("INNO_HURT", 2)
				end
			end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
			if (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO) and (not PlayerCount(ROLE_INNOCENT)))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
			end
		end
	end

	if (PlayersAlive() > 1)
		MM_StartShowdownMusic()
		return true
	end
end, MT_PLAYER)

addHook("MobjDamage", function(v, i, a, d) --Victim, inflictor (unused here), attacker, damage type
	if (gametype != GT_LTMMURDERMYSTERY) or (not a) or (not a.player) return end
	if (MM.debug) print("\x82Player->Player damage (MobjDamage)") end
	local vp = v.player --Victim player
	local ap = a.player --Attacker player

	if (vp.role == ROLE_MURDERER)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (not PlayerCount(ROLE_MURDERER))
			if (ap.role == ROLE_INNOCENT) then ap.role = ROLE_HERO end --Reward the Innocent
			MM_EndRound(WIN_CIVILS, "WIN", WIN_CIVILS)
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) killed") end
			if (ap.role == ROLE_INNOCENT)
				ap.role = ROLE_HERO
				chatprintf(ap, MM_GetText(ap.mmlang, "NEWROLE_GET", 4))
				if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." became a Hero") end
			end
		end
	elseif (vp.role == ROLE_SHERIFF)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (ap.role == ROLE_INNOCENT)
			MM_KillPlayerByHazard(a, true)
			chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 3))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Sheriff)") end
		end

		if (PlayerCount(ROLE_INNOCENT))
			MM_SpawnSHREML(v.x, v.y, v.z, vp)
			MM_ChatprintGlobal("SHERI_KILLED_DROP", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (not PlayerCount(ROLE_INNOCENT)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.role == ROLE_HERO)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (ap.role == ROLE_INNOCENT)
			MM_KillPlayerByHazard(a, true)
			chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 5))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Hero)") end
		end

		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	elseif (vp.role == ROLE_INNOCENT)
		MM_KillPlayerByPlayer(v, a)

		if (ap.role == ROLE_MURDERER) and (not PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		elseif (ap.role == ROLE_SHERIFF)
			-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
			-- otherwise, Murderers win
			if (PlayerCount(ROLE_INNOCENT))
				chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 1))
				MM_ChatprintGlobal("INNO_HURT", 1)
				MM_SetRandomInnoAs(ROLE_SHERIFF, 2)
				ap.role = ROLE_INNOCENT
			else
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
			end
		elseif (ap.role == ROLE_HERO)
			MM_KillPlayerByHazard(a, true)
			if (not PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
			elseif (PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not #MM.shremls)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
			else
				chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 2))
				MM_ChatprintGlobal("INNO_HURT", 2)
			end
		elseif (ap.role == ROLE_INNOCENT)
			MM_KillPlayerByHazard(a, true)
			if (not PlayerCount(ROLE_INNOCENT)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
			else
				chatprintf(ap, MM_GetText(ap.mmlang, "KILL_PUNISHMENT_PM", 4))
			end
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Innocent)") end
		end
	end

	MM_StartShowdownMusic()
	return true
end, MT_PLAYER)

--
-- Sheriff's Emerald pickup logic
--
addHook("TouchSpecial", function(special, toucher)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	if (toucher) and valid(toucher.player) and (toucher.player.role == ROLE_INNOCENT)
		for emeraldID = 1, #MM.shremls do
			if ((MM.shremls[emeraldID].x == special.x) and (MM.shremls[emeraldID].y == special.y) and (MM.shremls[emeraldID].z == special.z))
				table.remove(MM.shremls, emeraldID)
				P_RemoveMobj(special)
				break
			end
		end
		S_StartSound(toucher.player.mo, sfx_cgot, toucher.player)
		toucher.player.role = ROLE_HERO
		toucher.player.roleflicker = 70 --2 secs
		MM_ChatprintGlobal("SHREML_PICK")
		MM_StartShowdownMusic()
	end

	return true
end, MT_SHREML)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	
	p.powers[3] = 0 --disable shields completely

	if (not p.spectator)
		--for some reason when switching back from spectator MF_NOGRAVITY flag isn't removed by SRB2
		p.mo.flags = $ & ~MF_NOGRAVITY
	end

	--the game automatically removes the spectator flag if the player dies by map hazard (which lets him respawn), we don't want that to happen
	if (p.killedby == "your stupidity") p.spectator = true end

	--role flickering timer
	if (p.roleflicker) p.roleflicker = $ - 1 end

	--HUD flash screen fadeout
	if (p.flashscrn) and (not (leveltime % 4))
		p.flashscrn = $ + 1
		if (p.flashscrn >= 10) p.flashscrn = 0 end
	end

	--Sheriff Emerald Radar distance logic
	if ((#MM.shremls) and ((p.role == ROLE_INNOCENT) or (p.role == ROLE_MURDERER)) and (not p.spectator)) --Murderers also need that number for the Anti-Camp system
		--find the distance to the closest emerald
		local shreml_dist = {}
		for emeraldID = 1, #MM.shremls do
			if (MM.shremls[emeraldID].valid) and (MM.shremls[emeraldID].timezone and (MM.shremls[emeraldID].timezone == p.timetravel.timezone))
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
			if (p.role == ROLE_INNOCENT) and (not SOC_IsTrue(mapheaderinfo[gamemap].disableradar))
				local interval = MM_GetSHREMLinterval(fixint(p.shreml_dist))
				if (interval and (leveltime % interval) == 0) S_StartSound(nil, sfx_emfind, p) end
			elseif (p.role == ROLE_MURDERER) and (CV_FindVar("mm_nocamping").value)
				if (p.shreml_dist < 25165824) --384*FU)
					p.camping = $ + 1
					if (p.camping == 1050) then MM_PunishPlayer(p, "Emerald camping") end --kick player after 30 seconds of camping
				else p.camping = 0 end
			end
		end
	end

	--AFK logic
	if ((not p.cmd.forwardmove) and (not p.cmd.sidemove) and (not p.cmd.buttons) and (not p.spectator) and (PlayerCount() > 1) and (afkCVAR.value))
		p.afk = $ + 1
		if (p.afk == afkCVAR.value*2100) then MM_PunishPlayer(p, "AFK") end
	else p.afk = 0 end

	--Eliminate players who left the game (in case REJOINTIMEOUT cvar is enabled)
	if (rejointimeoutCVAR.value) and (p.quittime) then MM_PlayerQuit(p) end

	--Anti-RenameCheat
	if ((p.name != p.oldname) and (p.spectator)) then MM_PunishPlayer(p, "Do not rename when dead!") end
	p.oldname = p.name
end)

addHook("ViewpointSwitch", function(p, np) --player, nextplayer
	if (gametype != GT_LTMMURDERMYSTERY) or (p.spectator) return --use game's default behaviour
	else return false end --do not switch
end)

--
-- Intermission Thinker
--
addHook("IntermissionThinker", do
	if (gametype != GT_LTMMURDERMYSTERY) return end
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
    if (gametype != GT_LTMMURDERMYSTERY) return end

	--Showdown Duel music
	if ((gamestate == GS_LEVEL) and (MM.shwdwn) and not (consoleplayer.powers[pw_underwater] or consoleplayer.powers[pw_spacetime])) return MM.shwdwn end

	--Intermission theme
	if (new == "_inter")
		if (not MM.winner) return "NOWAY" --Sonic 3 & Knuckles "No way!"
		else
			if (MM.winreason == 1) return "007WTC" --Goldeneye 007 "Watch theme"
			elseif (MM.winreason == 2) return "FD2INT" --Freedoom: Phase 2 "Intermission"
			elseif (MM.winreason == 3) return "GASTER" --Undertale "Gaster's theme"
			elseif (MM.winreason == 4) return "11H_IN" --Main theme of "The 11th Hour: The sequel to The 7th Guest"
			elseif (MM.winreason == 5) return "VANDOM" --Super Mario World "Vanilla Dome"
			else return "PBW_DC" end --Pokemon Black & White "Driftevil City"
		end
	end
end)

--
-- Quit Handler
--
addHook("PlayerQuit", function(p)
	if ((gametype != GT_LTMMURDERMYSTERY) or (gamestate != GS_LEVEL)) return end
	if (p.role) MM_PlayerQuit(p) end
end)

if tsourdt3rd
	addHook("KeyDown", function(keyevent)
		if (keyevent.num == 9) and (CV_FindVar("automapoutsidedevmode").value) and (gametype == GT_LTMMURDERMYSTERY)
			COM_BufInsertText(consoleplayer, "QUIT")
		end
	end)
end
