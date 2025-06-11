-- GAME.LUA
-- Original base code by Tedvin11
-- Code modifications by LeonardoTheMutant with the additional help of Jesus.B
--
-- The main logic script of the LTM's Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, and round endings

local rejointimeoutCVAR = CV_FindVar("rejointimeout")
local crypticCVAR = CV_FindVar("mm_cryptic")
local shieldsCVAR = CV_FindVar("mm_allowshields")
local invincCVAR = CV_FindVar("mm_allowinvinc")
local shoesCVAR = CV_FindVar("mm_allowshoes")
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
		MM.InitPlayer(p)
		p.mm.minigame = nil
		p.spectator = false
	end

	--Prepare the game
	MM.winner = 0
	MM.winreason = 0
	MM.shremds = {}
	MM.susnse = false
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
	MM.timelimit = $ + MM.GetRoleMultiplier() - 1
    print("Time limit for this round is "..MM.timelimit.." minutes")

	--Prepare the minigames
	MM.twopgame = (MM.PlayerCount() == 2)
	MM.minigame = false
	PONG_Reset()
	MM.pong.pads[1] = 32
	MM.pong.pads[2] = 32
	MM.pong.timeout = -1

	--Assign roles to the players
	MM.AssignRoles()
end)

--
-- Dead player body spawner (Map thing type 2023)
--
addHook("MapThingSpawn", function(mo, mapthing)
	if (mapthing.stringargs[0] and skins[mapthing.stringargs[0]])
		mo.skin = mapthing.stringargs[0]
		if (P_IsValidSprite2(mo, SPR2_SHIT)) then mo.state = S_MMPLRDEAD
		else mo.state = S_MMSKELT end
	else
		mo.state = S_MMSKELT
	end
    mo.color = mapthing.args[0]
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

	MM.InitPlayer(p)
	
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
	if (p.pflags & PF_FINISHED) then p.spectator = true end

	p.powers[pw_flashing] = 104 -- flashing invulnerability for 3 sec

	--Check player num and state on join
	if ((MM.PlayerCount() == 2) and (p.mm.role == nil)) --Player2 joined a 'singleplayer' round
		for player in players.iterate do player.mm.minigame = nil end --Shutdown Player1's minigame session
		MM.minigame = false --Tell server to disable the PONG minigame
		MM.AssignRoles() --Assign roles for that duel
		MM.twopgame = true
	elseif ((MM.PlayerCount() > 2) and (p.mm.role == nil)) --Other players are dead on join`
		p.pflags = $|PF_FINISHED
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
	MM.DebugPrint("\x82Triggered MobjDeath")
	local vp = v.player --Victim player

	local ap --Attacker player
	if (a) and (a.player)
		ap = a.player
		MM.DebugPrint("\x82MobjDeath attacker is player")
	end

	--If the death is caused by the death pit or crusher we do not need to spawn the Dead Body or the Sheriff's Emerald
	local spawnBodyOrEmerald = not ((d == DMG_DEATHPIT) or (d == DMG_CRUSHED))

	if (vp.mm.role == ROLE_MURDERER)
		if (ap)
			if (MM.AreTeammates(vp, ap)) then return false
			else MM.KillPlayerByPlayer(v, a) end
		else
			MM.KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (not MM.PlayerCount(ROLE_MURDERER))
			MM.EndRound(WIN_CIVILS, "WIN", WIN_CIVILS)
		else
			MM.ChatprintGlobal("MURD_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) has died in an accident") end
		end
	elseif (vp.mm.role == ROLE_SHERIFF)
		if (ap)
			if (MM.AreTeammates(vp, ap)) then return false
			else MM.KillPlayerByPlayer(v, a) end
		else
			MM.KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (MM.PlayerCount(ROLE_CIVILIAN))
			if (spawnBodyOrEmerald)
				MM.SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
				MM.ChatprintGlobal("SHERI_DIED_DROP", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident, dropped his emerald") end
			else
				if (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO)) and (wepcfgCVARs[ROLE_CIVILIAN].value)
					MM.ChatprintGlobal("SHERI_DIED", vp.name)
					if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accicent") end
				else
					MM.EndRound(1, "WIN", WIN_NODEFENDERS)
				end
			end
		elseif (not MM.PlayerCount(ROLE_CIVILIAN)) and (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO))
			MM.ChatprintGlobal("SHERI_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident") end
		elseif (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_CIVILIAN))
			MM.EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.mm.role == ROLE_HERO)
		if (ap)
			if (MM.AreTeammates(vp, ap)) then return false
			else MM.KillPlayerByPlayer(v, a) end
		else
			MM.KillPlayerByHazard(v, spawnBodyOrEmerald)
		end

		if (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
			MM.EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM.ChatprintGlobal("HERO_DIED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) has died in an accident") end
		end
	elseif (vp.mm.role == ROLE_CIVILIAN)
		if (ap)
			MM.KillPlayerByPlayer(v, a)
			if (ap.mm.role == ROLE_SHERIFF)
				-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
				-- otherwise Murderers win
				if (MM.PlayerCount(ROLE_CIVILIAN))
					chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 1))
					MM.ChatprintGlobal("INNO_HURT", 1)
					MM.SetRandomInnoAs(ROLE_SHERIFF, 2)
					ap.mm.role = ROLE_CIVILIAN
				else
					MM.EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
				end
			elseif (ap.mm.role == ROLE_HERO)
				MM.KillPlayerByHazard(a, true)
				if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
					MM.EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
				elseif (MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
					MM.EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
				else
					chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 2))
					MM.ChatprintGlobal("INNO_HURT", 2)
				end
			end
		else
			MM.KillPlayerByHazard(v, spawnBodyOrEmerald)
			if (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO) and (not MM.PlayerCount(ROLE_CIVILIAN)))
				MM.EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
			end
		end
	end

	if (MM.PlayersAlive() > 1) --Ignore those deaths if the player is being alone on the server
		MM.StartSuspenseMusic()
		MM.StartShowdownMusic()
		return true
	end
end, MT_PLAYER)

addHook("MobjDamage", function(v, i, a, d) --Victim, inflictor (unused here), attacker, damage type
	if (gametype != GT_LTMMURDERMYSTERY) or (not a) or (not a.player) return end
	MM.DebugPrint("\x82Player->Player damage (MobjDamage)")
	local vp = v.player --Victim player
	local ap = a.player --Attacker player

	if (vp.mm.role == ROLE_MURDERER)
		if (MM.AreTeammates(vp, ap))
			MM.HitTeammate(vp, ap)
			return false
		else
			MM.KillPlayerByPlayer(v, a)
		end

		if (not MM.PlayerCount(ROLE_MURDERER))
			if (ap.mm.role == ROLE_CIVILIAN) then ap.mm.role = ROLE_HERO end --Reward the Innocent
			MM.EndRound(WIN_CIVILS, "WIN", WIN_CIVILS)
		else
			MM.ChatprintGlobal("MURD_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) killed") end
			if (ap.mm.role == ROLE_CIVILIAN)
				ap.mm.role = ROLE_HERO
				chatprintf(ap, MM.GetText(ap.mm.lang, "NEWROLE_GET", 4))
				if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." became a Hero") end
			end
		end
	elseif (vp.mm.role == ROLE_SHERIFF)
		if (MM.AreTeammates(vp, ap))
			MM.HitTeammate(vp, ap)
			return false
		else
			MM.KillPlayerByPlayer(v, a)
		end

		if (ap.mm.role == ROLE_CIVILIAN)
			MM.KillPlayerByHazard(a, true)
			chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 3))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Sheriff)") end
		end

		if (MM.PlayerCount(ROLE_CIVILIAN))
			MM.SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
			MM.ChatprintGlobal("SHERI_KILLED_DROP", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
		elseif (not MM.PlayerCount(ROLE_CIVILIAN)) and (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO))
			MM.ChatprintGlobal("SHERI_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
		elseif (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_CIVILIAN))
			MM.EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		end
	elseif (vp.mm.role == ROLE_HERO)
		if (MM.AreTeammates(vp, ap))
			MM.HitTeammate(vp, ap)
			return false
		else
			MM.KillPlayerByPlayer(v, a)
		end

		if (ap.mm.role == ROLE_CIVILIAN)
			MM.KillPlayerByHazard(a, true)
			chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 5))
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Hero)") end
		end

		if (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
			MM.EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
		else
			MM.ChatprintGlobal("HERO_KILLED", vp.name)
			if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
		end
	elseif (vp.mm.role == ROLE_CIVILIAN)
		MM.KillPlayerByPlayer(v, a)

		if (ap.mm.role == ROLE_MURDERER) and (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
			MM.EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
		elseif (ap.mm.role == ROLE_SHERIFF)
			-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
			-- otherwise, Murderers win
			if (MM.PlayerCount(ROLE_CIVILIAN))
				chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 1))
				MM.ChatprintGlobal("INNO_HURT", 1)
				MM.SetRandomInnoAs(ROLE_SHERIFF, 2)
				ap.mm.role = ROLE_CIVILIAN
			else
				MM.EndRound(ROLE_MURDERER, "WIN", WIN_SHERIKILLINNO)
			end
		elseif (ap.mm.role == ROLE_HERO)
			MM.KillPlayerByHazard(a, true)
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
				MM.EndRound(ROLE_MURDERER, "WIN", WIN_HEROKILLINNO)
			elseif (MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
				MM.EndRound(ROLE_MURDERER, "WIN", WIN_NODEFENDERS)
			else
				chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 2))
				MM.ChatprintGlobal("INNO_HURT", 2)
			end
		elseif (ap.mm.role == ROLE_CIVILIAN)
			MM.KillPlayerByHazard(a, true)
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
				MM.EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
			else
				chatprintf(ap, MM.GetText(ap.mm.lang, "KILL_PUNISHMENT_PM", 4))
			end
			if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Innocent)") end
		end
	end

	MM.StartSuspenseMusic()
	MM.StartShowdownMusic()
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
		MM.ChatprintGlobal("SHREMD_PICK")
		MM.StartShowdownMusic()
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
	if (not invincCVAR.value) then p.powers[pw_invulnerability] = 0 end
	if (not shoesCVAR.value) then p.powers[pw_sneakers] = 0 end

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
					if (p.mm.camping == 1050) then MM.PunishPlayer(p, "Emerald camping") end --kick player after 30 seconds of camping
				else p.mm.camping = 0 end
			end
		end
	end

	if ((rejointimeoutCVAR.value) and (p.quittime)) then MM.PlayerQuit(p) end

	--Anti-RenameCheat
	if ((p.name != p.oldname) and (p.spectator)) then MM.PunishPlayer(p, "Do not rename when dead!") end
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

	--Keep the event music playing
	if ((gamestate == GS_LEVEL) and (leveltime) and not (consoleplayer.powers[pw_underwater] or consoleplayer.powers[pw_spacetime]))
		--Showdown Duel music
		if (MM.shwdwn) then return MM.shwdwn
		--Suspense music
		elseif (MM.susnse) then return MM.susnse end
	end

	--Intermission theme
	if (new == "_inter")
		local lumpname
		if (MM.winner) lumpname = "MMEND"..MM.winreason
		else lumpname = "MM_TIE" end

		if (S_MusicExists(lumpname)) then return lumpname end
	end
end)
--Update the game music lists once a new add-on was loaded (it might contain new music)
addHook("AddonLoaded", do
	MM.LoadSuspenseTracks()
	MM.LoadShowdownTracks()
end)

--
-- Player Quit/Leave handler
--
addHook("PlayerQuit", function(p)
	if ((gametype != GT_LTMMURDERMYSTERY) or (gamestate != GS_LEVEL)) return end
	if (p.mm.role) MM.PlayerQuit(p) end
end)

if tsourdt3rd
	addHook("KeyDown", function(keyevent)
		if (keyevent.num == 9) and ((CV_FindVar("automapoutsidedevmode") and CV_FindVar("automapoutsidedevmode").value) or (CV_FindVar("tsourdt3rd_debug_automapanywhere") and CV_FindVar("tsourdt3rd_debug_automapanywhere").value)) and (gametype == GT_LTMMURDERMYSTERY)
			COM_BufInsertText(consoleplayer, "QUIT")
		end
	end)
end
