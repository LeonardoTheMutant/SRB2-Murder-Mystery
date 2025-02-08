-- GAME.LUA
-- Original base code by Tedvin11
-- Code modifications by LeonardoTheMutant with the additional help of Jesus.B
--
-- The main logic script of the LTM's Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, and round endings

local rejointimeoutCVAR = CV_FindVar("rejointimeout")
local crypticCVAR = CV_FindVar("mm_cryptic")
local shieldsCVAR = CV_FindVar("mm_allowshields")
local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}

local shremd_distances, shremd_interval, shremd_closest

local function MM_GetSHREMDinterval(dist)
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
		MM_InitPlayer(p)
		p.mm.minigame = nil
		p.spectator = false
	end

	--Prepare the game
	MM.winner = 0
	MM.winreason = 0
	MM.shremds = {}
	MM.susnce = false
	MM.shwdwn = false
	MM.minigame = false

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
	MM.pong.timeout = -1

	--Assign roles to the players
	MM_AssignRoles()
end)

--
-- Dead player body spawner (Map thing type 2023)
--
addHook("MapThingSpawn", function(mo, mapthing)
    mo.state = S_MMSKELT + mapthing.args[0]
    mo.color = mapthing.args[1]
    return true
end, MT_DEADPLR)

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

	MM_InitPlayer(p)
	
	--Apply language
	if (not p.mm.lang)
		local f = io.openlocal("client/MM.DAT", 'r') -- preferences file load
		if f
			local l = f:read() --read data
			if (MM.text[l]) p.mm.lang = l --is such language imported into the game?
			else p.mm.lang = "EN" end --no
			f:close() --file close
		else p.mm.lang = "EN" end --failed to open the file
	end

	if (not p.mm.help) then p.mm.help = {page = 1, pos = 1, active = false} end --MMHELP UI init

	--the game automatically removes the spectator flag(s) if the player dies by map hazard (which lets him respawn normally), we don't want that to happen
	if (p.mm.killername == "your stupidity") then p.spectator = true end

	p.powers[pw_flashing] = 104 -- flashing invulnerability for 3 sec

	--Check player num and state on join
	if ((PlayerCount() == 2) and (p.mm.role == nil)) --Player2 joined a 'singleplayer' round
		for player in players.iterate do player.mm.minigame = nil end --Shutdown Player1's minigame session
		MM.minigame = false --Tell server to disable the PONG minigame
		MM_AssignRoles() --Assign roles for that duel
		MM.twopgame = true
	elseif ((PlayerCount() > 2) and (p.mm.role == nil)) --Other players are dead on join
		p.spectator = true
	end
	p.oldname = p.name
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

	if (vp.mm.role == ROLE_MURDERER)
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
	elseif (vp.mm.role == ROLE_SHERIFF)
		if (ap)
			if (MM_AreTeammates(vp, ap)) then return false
			else MM_KillPlayerByPlayer(v, a) end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (PlayerCount(ROLE_CIVILIAN))
			if (spawnBodyOrEmerald)
				MM_SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
				MM_ChatprintGlobal("SHERI_DIED_DROP", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident, dropped his emerald") end
			else
				if (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO)) and (wepcfgCVARs[ROLE_CIVILIAN].value)
					MM_ChatprintGlobal("SHERI_DIED", vp.name)
					if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accicent") end
				else
					MM_EndRound(1, "WIN", WIN_NODEFENDERS)
				end
			end
		elseif (not PlayerCount(ROLE_CIVILIAN)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_CIVILIAN))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.mm.role == ROLE_HERO)
		if (ap)
			if (MM_AreTeammates(vp, ap)) then return false
			else MM_KillPlayerByPlayer(v, a) end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)) and (not wepcfgCVARs[ROLE_CIVILIAN].value))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) has died in an accident") end
		end
	elseif (vp.mm.role == ROLE_CIVILIAN)
		if (ap)
			MM_KillPlayerByPlayer(v, a)
			if (ap.mm.role == ROLE_SHERIFF)
				-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
				-- otherwise Murderers win
				if (PlayerCount(ROLE_CIVILIAN))
					chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 1))
					MM_ChatprintGlobal("INNO_HURT", 1)
					MM_SetRandomInnoAs(ROLE_SHERIFF, 2)
					ap.mm.role = ROLE_CIVILIAN
				else
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
				end
			elseif (ap.mm.role == ROLE_HERO)
				MM_KillPlayerByHazard(a, true)
				if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
				elseif (PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
					MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				else
					chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 2))
					MM_ChatprintGlobal("INNO_HURT", 2)
				end
			end
		else
			MM_KillPlayerByHazard(v, spawnBodyOrEmerald)
			if (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO) and (not PlayerCount(ROLE_CIVILIAN)))
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

	if (vp.mm.role == ROLE_MURDERER)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (not PlayerCount(ROLE_MURDERER))
			if (ap.mm.role == ROLE_CIVILIAN) then ap.mm.role = ROLE_HERO end --Reward the Innocent
			MM_EndRound(WIN_CIVILS, "WIN", WIN_CIVILS)
		else
			MM_ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) killed") end
			if (ap.mm.role == ROLE_CIVILIAN)
				ap.mm.role = ROLE_HERO
				chatprintf(ap, MM_GetText(ap.mm.lang, "NEWROLE_GET", 4))
				if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." became a Hero") end
			end
		end
	elseif (vp.mm.role == ROLE_SHERIFF)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (ap.mm.role == ROLE_CIVILIAN)
			MM_KillPlayerByHazard(a, true)
			chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 3))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Sheriff)") end
		end

		if (PlayerCount(ROLE_CIVILIAN))
			MM_SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
			MM_ChatprintGlobal("SHERI_KILLED_DROP", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (not PlayerCount(ROLE_CIVILIAN)) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO))
			MM_ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		elseif (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_CIVILIAN))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.mm.role == ROLE_HERO)
		if (MM_AreTeammates(vp, ap))
			MM_HitTeammate(vp, ap)
			return false
		else
			MM_KillPlayerByPlayer(v, a)
		end

		if (ap.mm.role == ROLE_CIVILIAN)
			MM_KillPlayerByHazard(a, true)
			chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 5))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Hero)") end
		end

		if ((not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)) and (not wepcfgCVARs[ROLE_CIVILIAN].value))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM_ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	elseif (vp.mm.role == ROLE_CIVILIAN)
		MM_KillPlayerByPlayer(v, a)

		if (ap.mm.role == ROLE_MURDERER) and (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
			MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		elseif (ap.mm.role == ROLE_SHERIFF)
			-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
			-- otherwise, Murderers win
			if (PlayerCount(ROLE_CIVILIAN))
				chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 1))
				MM_ChatprintGlobal("INNO_HURT", 1)
				MM_SetRandomInnoAs(ROLE_SHERIFF, 2)
				ap.mm.role = ROLE_CIVILIAN
			else
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
			end
		elseif (ap.mm.role == ROLE_HERO)
			MM_KillPlayerByHazard(a, true)
			if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
			elseif (PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
			else
				chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 2))
				MM_ChatprintGlobal("INNO_HURT", 2)
			end
		elseif (ap.mm.role == ROLE_CIVILIAN)
			MM_KillPlayerByHazard(a, true)
			if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
				MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
			else
				chatprintf(ap, MM_GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 4))
			end
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Innocent)") end
		end
	end

	MM_StartSuspenseMusic()
	MM_StartShowdownMusic()
	return true
end, MT_PLAYER)

--
-- Sheriff's Emerald pickup logic
--
addHook("TouchSpecial", function(special, toucher)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	if (toucher) and valid(toucher.player) and (toucher.player.mm.role == ROLE_CIVILIAN)
		for emeraldID = 1, #MM.shremds do
			if ((MM.shremds[emeraldID].x == special.x) and (MM.shremds[emeraldID].y == special.y) and (MM.shremds[emeraldID].z == special.z))
				table.remove(MM.shremds, emeraldID)
				P_RemoveMobj(special)
				break
			end
		end
		S_StartSound(toucher.player.mo, sfx_cgot, toucher.player)
		toucher.player.mm.role = ROLE_HERO
		toucher.player.mm.hud.roleflicker = 70 --2 secs
		MM_ChatprintGlobal("SHREMD_PICK")
		MM_StartShowdownMusic()
	end

	return true
end, MT_SHREMD)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	
	--Disable player shields
	if (not shieldsCVAR.value) then p.powers[pw_shield] = 0 end

	--for some reason when switching back from spectator state MF_NOGRAVITY flag isn't removed by SRB2
	if (not p.spectator) then p.mo.flags = $ & ~MF_NOGRAVITY end

	--role flickering timer
	if (p.mm.hud.roleflicker) p.mm.hud.roleflicker = $ - 1 end

	--HUD backend for fullscreen flash/spark effects
	if (p.mm.hud.fx_translucency) and (p.mm.hud.fx_duration) and (not (leveltime % p.mm.hud.fx_duration))
		p.mm.hud.fx_translucency = $ - 1
	end

	--Sheriff Emerald Radar distance logic
	if ((#MM.shremds) and ((p.mm.role == ROLE_CIVILIAN) or (p.mm.role == ROLE_MURDERER)) and (not p.spectator)) --Murderers also need that number for the Anti-Camp system
		--find the distance to the closest emerald
		shremd_distances = {}
		for emeraldID = 1, #MM.shremds do
			if (valid(MM.shremds[emeraldID])) and (MM.shremds[emeraldID].timezone and (MM.shremds[emeraldID].timezone == p.mm.timetravel.timezone))
				table.insert(shremd_distances, #shremd_distances, P_AproxDistance(P_AproxDistance(p.mo.x - MM.shremds[emeraldID].x, p.mo.y - MM.shremds[emeraldID].y), p.mo.z - MM.shremds[emeraldID].z))
			end
		end
		shremd_closest = shremd_distances[0]
		for emeraldID = 1, #shremd_distances do
			if (shremd_distances[emeraldID] < shremd_closest) then shremd_closest = shremd_distances[emeraldID] end
		end

		p.mm.shremd_dist = shremd_closest

		--play sound
		if (p.mm.shremd_dist)
			if (p.mm.role == ROLE_CIVILIAN) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))
				shremd_interval = MM_GetSHREMDinterval(fixint(p.mm.shremd_dist))
				if (shremd_interval and (leveltime % shremd_interval) == 0) S_StartSound(nil, sfx_emfind, p) end
			elseif (p.mm.role == ROLE_MURDERER) and (CV_FindVar("mm_nocamping").value)
				if (p.mm.shremd_dist < 25165824) --384*FU)
					p.mm.camping = $ + 1
					if (p.mm.camping == 1050) then MM_PunishPlayer(p, "Emerald camping") end --kick player after 30 seconds of camping
				else p.mm.camping = 0 end
			end
		end
	end

	if ((rejointimeoutCVAR.value) and (p.quittime)) then MM_PlayerQuit(p) end

	--Anti-RenameCheat
	if ((p.name != p.oldname) and (p.spectator)) then MM_PunishPlayer(p, "Do not rename when dead!") end
	p.oldname = p.name
end)

addHook("ViewpointSwitch", function(p) --player
	if (gametype != GT_LTMMURDERMYSTERY) or (p.spectator) return --use game's default behaviour
	else return false end --do not switch
end)

addHook("SeenPlayer", function(p, sp) --player, seenplayer
	if (gametype != GT_LTMMURDERMYSTERY) then return --use game's default behavior
	else
		if (crypticCVAR.value) then return false end --do not show
	end
end)

--
-- Intermission logic
--
addHook("IntermissionThinker", do
	if (gametype != GT_LTMMURDERMYSTERY) return end
	--special round win check for the minigame
	if ((MM.minigame) and valid(MM.duelplrs[1]) and valid(MM.duelplrs[2]))
		if (MM.duelplrs[1].mm.kills > MM.duelplrs[2].mm.kills) then MM.winner = MM.duelplrs[1].mm.role
		elseif (MM.duelplrs[1].mm.kills < MM.duelplrs[2].mm.kills) then MM.winner = MM.duelplrs[2].mm.role end
	end
	-- Kick forcer (for Intermission)
	for p in players.iterate do
		if (p.quittime) then COM_BufInsertText(server, "KICK "..#p.." Player leave") end
		if (p.spectator) p.spectator = false end
	end
	
	MM.shwdwn = false
end)

--
-- Music handler
--
addHook("MusicChange", function(old, new)
    if (gametype != GT_LTMMURDERMYSTERY) return end

	if ((gamestate == GS_LEVEL) and (leveltime) and not (consoleplayer.powers[pw_underwater] or consoleplayer.powers[pw_spacetime]))
		--Showdown Duel music
		if (MM.shwdwn) then return MM.shwdwn
		--Suspense music
		elseif (MM.susnce) then return MM.susnce end
	end

	--Intermission theme
	if (new == "_inter")
		if (not MM.winner) return "NOWAY" --Sonic 3 & Knuckles "No way!"
		else
			if (MM.winreason == 1) return "ULTINT" --Ultimate DOOM's Ultimate MIDI pack "Doomguy and His Angry Band"
			elseif (MM.winreason == 2) return "FD2INT" --Freedoom: Phase 2 "Intermission"
			elseif (MM.winreason == 3) return "007WTC" --Goldeneye 007 "Watch theme"
			elseif (MM.winreason == 4) return "11H_IN" --The 11th Hour: The sequel to The 7th Guest "Dolls of Doom"
			elseif (MM.winreason == 5) return "VANDOM" --Super Mario World "Vanilla Dome"
			else return "PBW_DC" end --Pokemon Black & White "Driftevil City"
		end
	end
end)

--
-- Player Quit/Leave handler
--
addHook("PlayerQuit", function(p)
	if ((gametype != GT_LTMMURDERMYSTERY) or (gamestate != GS_LEVEL)) return end
	if (p.mm.role) MM_PlayerQuit(p) end
end)

if tsourdt3rd
	addHook("KeyDown", function(keyevent)
		if (keyevent.num == 9) and ((CV_FindVar("automapoutsidedevmode") and CV_FindVar("automapoutsidedevmode").value) or (CV_FindVar("tsourdt3rd_debug_automapanywhere") and CV_FindVar("tsourdt3rd_debug_automapanywhere").value)) and (gametype == GT_LTMMURDERMYSTERY)
			COM_BufInsertText(consoleplayer, "QUIT")
		end
	end)
end
