-- GAME.LUA
-- Original base code by Tedvin11
-- Code modifications by LeonardoTheMutant with the additional help of Jesus.B
--
-- The main logic script of the LTM's Murder Mystery, takes control of each player Join/Quit,
-- hit detection, player parameters, and round endings

local cv_rejointimeout = CV_FindVar("rejointimeout")
local cv_cryptic = CV_FindVar("mm_cryptic")
local cv_shields = CV_FindVar("mm_allowshields")
local cv_invinc = CV_FindVar("mm_allowinvinc")
local cv_shoes = CV_FindVar("mm_allowshoes")
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
	for p in players.iterate do
		MM.InitPlayer(p)
		p.mm.flags = $ & ~(FLAG_SNEAK|FLAG_MINIGAME)
		p.mm.weapondelay = 175 --5 seconds
		p.mm.role = ROLE_DEAD
	end

	--Prepare the game
	MM.winner = 0
	MM.winreason = 0
	MM.shremds = {}
	MM.shremdDist = 0
	MM.susnse = false
	MM.shwdwn = false
	MM.minigame = false
	MM.roleflicker = 175 --5 seconds
	MM.hud.game.flash.translucency = 0

	--Time limit
	if (timelimit) then
		--Changing the vanilla TIMELIMIT CVAR value mid-game will cause a desync between internal and HUD timers. Remember that when hosting a game. Map reload fixes synchronization
		MM.timelimit = timelimit --Get timelimit from the TIMELIMIT cvar
	elseif (mapheaderinfo[map].timelimit) and (tonumber(mapheaderinfo[map].timelimit))
		MM.timelimit = tonumber(mapheaderinfo[map].timelimit) --Get timelimit from Map's SOC data ("Lua.timelimit" SOC property)
	else
		MM.timelimit = 5 --Default to 5 minutes
	end
	MM.timelimit = $ + MM.GetRoleMultiplier() - 1
	printf("Time limit for this round is %d minutes", MM.timelimit)

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
-- Player spawn
--
addHook("PlayerSpawn", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	MM.InitPlayer(p)

	--Apply language
	if (not MM.lang)
		local f = io.openlocal("client/MM.DAT", 'r') -- preferences file load
		if f
			local l = f:read() --read data
			if (MM.text[l]) --is such language imported into the game?
				MM.lang = l
			else --no
				MM.lang = "EN"
			end
			f:close() --file close
		else --failed to open the file
			MM.lang = "EN"
		end
	end

	if (not p.mm.flags) then p.mm.flags = 0 end

	p.powers[pw_flashing] = 104 -- flashing invulnerability for 3 sec

	--Check player num and state on join
	if (p.mm.role == nil)
		switch(MM.PlayerCount(), {
			[1] = do
				p.spectator = false
			end,
			[2] = do --Player2 joined a 'singleplayer' round
				p.spectator = false
				for player in players.iterate do player.mm.flags = $ & ~FLAG_MINIGAME end --Shutdown Player1's minigame session
				MM.minigame = false --Tell server to disable the PONG minigame
				MM.AssignRoles() --Assign roles for that duel
				MM.twopgame = true
			end,
			['default'] = do --Other players are dead on join
				p.pflags = $|PF_GODMODE
				p.mm.role = ROLE_DEAD
			end
		})
	end
end)

--
-- Player Thinker
--
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	if (not cv_shields.value) then p.powers[pw_shield] = 0 end --Disable player shields
	if (not cv_invinc.value) then p.powers[pw_invulnerability] = 0 end --Disable the invulnerability powerup
	if (not cv_shoes.value) then p.powers[pw_sneakers] = 0 end --Disable the Speed Shoes

	--for some reason when switching back from spectator state MF_NOGRAVITY flag isn't removed by SRB2
	if (not p.spectator) then p.mo.flags = $ & ~MF_NOGRAVITY end

	--role flickering timer
	if (MM.hud.game.roleflicker) then MM.hud.game.roleflicker = $ - 1 end

	--HUD backend for fullscreen flash/spark effects
	if (MM.hud.game.flash.translucency) and (MM.hud.game.flash.duration) and (not (leveltime % MM.hud.game.flash.duration))
		MM.hud.game.flash.translucency = $ - 1
	end

	--Sheriff Emerald Radar distance logic
	--Murderers also need that number for the Anti-Camp system
	if ((#MM.shremds) and ((p.mm.role == ROLE_MURDERER) or (p.mm.role == ROLE_CIVILIAN) or (p.mm.role == ROLE_JESTER)) and (p == consoleplayer))
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

		MM.shremdDist = shremd_closest

		--play sound
		if (MM.shremdDist)
			switch(p.mm.role, {
				[ROLE_MURDERER] = do
					if ((MM.shremdDist < 25165824) and (CV_FindVar("mm_nocamping").value) and (not MM.shwdwn)) --384*FU
						p.mm.camping = $ + 1
						if (p.mm.camping == 700) then MM.PunishPlayer(p, "Emerald camping") end --kick player after 20 seconds of camping
					else p.mm.camping = 0 end
				end,
				[ROLE_CIVILIAN] = do
					shremd_interval = MM_GetSHREMDinterval(fixint(MM.shremdDist))
					if (shremd_interval and not (leveltime % shremd_interval) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))) then S_StartSound(nil, sfx_emfind, p) end
				end,
				[ROLE_JESTER] = do
					shremd_interval = MM_GetSHREMDinterval(fixint(MM.shremdDist))
					if (shremd_interval and not (leveltime % shremd_interval) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))) then S_StartSound(nil, sfx_emfind, p) end
				end
			})
		end
	end

	if ((cv_rejointimeout.value) and (p.quittime)) then MM.PlayerQuit(p) end --Force player quit so that there are no rejoining player ghosts
end)

--
-- Death/Kill detectors
--
addHook("MobjDeath", function(v, i, a, d) --Victim, inflictor, attacker, damage type
	if (gametype != GT_LTMMURDERMYSTERY) return end
	MM.DebugPrint("\x82Triggered MobjDeath")
	local vp = v.player --Victim player
	local vprole = vp.mm.role --Victim's role

	local ap --Attacker player
	if (a) and (a.player)
		ap = a.player
		MM.DebugPrint("\x82MobjDeath attacker is player")
	end

	--If the death is caused by the death pit or crusher we do not need to spawn the Dead Body or the Sheriff's Emerald
	local spawnBodyOrEmerald = not ((d == DMG_DEATHPIT) or (d == DMG_CRUSHED))

	if (ap)
		if (MM.AreTeammates(vp, ap)) then return false
		else
			if (ap.mm.role == ROLE_JESTER or (ap.mm.role == ROLE_JESTERHERO and vprole != ROLE_MURDERER)) then return true
			else MM.KillPlayerByPlayer(v, a) end
		end
	else
		MM.KillPlayer(v, spawnBodyOrEmerald)
	end

	switch(vprole, {
		[ROLE_MURDERER] = do
			if (MM.PlayerCount(ROLE_MURDERER))
				MM.ChatprintGlobal("MSG_MURDDIED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) has died in an accident") end
			else
				MM.EndRound(WIN_CIVILS, "CHAT_ENDROUND", WIN_CIVILS)
			end
				
		end,
		[ROLE_SHERIFF] = do
			if (MM.PlayerCount(ROLE_CIVILIAN))
				if (spawnBodyOrEmerald)
					MM.SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
					MM.ChatprintGlobal("MSG_SHERIDIED_DROP", vp.name)
					if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident, dropped his emerald") end
				else
					if (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO)) and (wepcfgCVARs[ROLE_CIVILIAN].value)
						MM.ChatprintGlobal("MSG_SHERIDIED", vp.name)
						if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accicent") end
					else
						MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
					end
				end
			elseif (not MM.PlayerCount(ROLE_CIVILIAN)) and (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO))
				MM.ChatprintGlobal("MSG_SHERIDIED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) has died in an accident") end
			elseif (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_CIVILIAN))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
			end
		end,
		[ROLE_HERO] = do
			if (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
			else
				MM.ChatprintGlobal("MSG_HERODIED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) has died in an accident") end
			end
		end,
		[ROLE_CIVILIAN] = do
			if (ap)
				switch(ap.mm.role, {
					[ROLE_SHERIFF] = do
						-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
						-- otherwise Murderers win
						if (MM.PlayerCount(ROLE_CIVILIAN))
							MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 1))
							MM.ChatprintGlobal("CHAT_CIVILIANHURT", 1)
							MM.SetRandomCivilianAs(ROLE_SHERIFF)
							ap.mm.role = ROLE_CIVILIAN
						else
							MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_SHERIKILLINNO)
						end
					end,
					[ROLE_HERO] = do
						MM.KillPlayer(a, true, true)
						if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
							MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_HEROKILLINNO)
						elseif (MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
							MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
						else
							MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 2))
							MM.ChatprintGlobal("CHAT_CIVILIANHURT", 2)
						end
					end
				})
			else
				if (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO) and (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_JESTER)) and (not MM.PlayerCount(ROLE_JESTERHERO)))
					MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
				end
			end
		end,
		[ROLE_JESTER] = do
			if (ap)
				switch(ap.mm.role, {
					[ROLE_SHERIFF] = do
						-- Sheriff killed the Jester, instantly end round and make Jester win
						MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED)
					end,
					[ROLE_HERO] = do
						-- Hero killed the Jester, instantly end round and make Jester win
						MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED)
					end
				})
			else
				if (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO) and (not MM.PlayerCount(ROLE_CIVILIAN)))
					MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
				end
			end
		end,
		[ROLE_JESTERHERO] = do
			if (not MM.PlayerCount(ROLE_JESTERHERO)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
			else
				MM.ChatprintGlobal("MSG_HERODIED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Jester Hero) has died in an accident") end
			end
		end
	})

	if (MM.PlayersAlive() > 1) --Ignore those deaths if the player is being alone on the server
		MM.StartSuspenseMusic()
		MM.StartShowdownMusic()
		return true
	end
end, MT_PLAYER)

addHook("MobjDamage", function(v, i, a, d) --Victim, inflictor, attacker, damage type
	if (gametype != GT_LTMMURDERMYSTERY) or (not a) or (not a.player) return end
	MM.DebugPrint("\x82Player->Player damage (MobjDamage)")
	local vp = v.player --Victim player
	local ap = a.player --Attacker player
	local vprole = vp.mm.role --Victim's role

	if (MM.AreTeammates(vp, ap))
		MM.HitTeammate(vp, ap)
		return false
	else
		if (ap.mm.role == ROLE_JESTER or (ap.mm.role == ROLE_JESTERHERO and vprole != ROLE_MURDERER)) then return true
		else MM.KillPlayerByPlayer(v, a) end
	end

	switch(vprole, {
		[ROLE_MURDERER] = do
			if (MM.PlayerCount(ROLE_MURDERER))
				MM.ChatprintGlobal("MSG_MURDKILLED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Murd) killed") end
				if (ap.mm.role == ROLE_CIVILIAN)
					ap.mm.role = ROLE_HERO
					MAYA.ChatprintPM(ap, MM.text[MM.lang]["CHAR_ROLE_HERO"]["RANKUP_PM"] or "You are the Hero now!")
					if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." became a Hero") end
				end
			else
				if (ap.mm.role == ROLE_CIVILIAN) then ap.mm.role = ROLE_HERO end --Reward the Innocent
				MM.EndRound(WIN_CIVILS, "CHAT_ENDROUND", WIN_CIVILS)
			end
		end,
		[ROLE_SHERIFF] = do
			if (ap.mm.role == ROLE_CIVILIAN)
				MM.KillPlayer(a, true, true)
				MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 3))
				if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Sheriff)") end
			end

			if (MM.PlayerCount(ROLE_CIVILIAN))
				MM.SpawnSHREMD(v.x, v.y, v.z, vp.mm.timetravel.timezone)
				MM.ChatprintGlobal("MSG_SHERIKILLED_DROP", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed, dropped his emerald") end
			elseif (not MM.PlayerCount(ROLE_CIVILIAN)) and (MM.PlayerCount(ROLE_SHERIFF) or MM.PlayerCount(ROLE_HERO))
				MM.ChatprintGlobal("MSG_SHERIKILLED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Sheriff) killed") end
			elseif (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_CIVILIAN))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
			end
		end,
		[ROLE_HERO] = do
			if (ap.mm.role == ROLE_CIVILIAN)
				MM.KillPlayer(a, true, true)
				MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 5))
				if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Hero)") end
			end

			if (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
			else
				MM.ChatprintGlobal("MSG_HEROKILLED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
			end
		end,
		[ROLE_CIVILIAN] = do
			if (ap.mm.role == ROLE_MURDERER) and (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_JESTER)) and (not MM.PlayerCount(ROLE_JESTERHERO))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
			end
			switch(ap.mm.role, {
				[ROLE_SHERIFF] = do
					-- Sheriff killed an innocent, remove the "Sheriff" role from the player if there are still Innos alive,
					-- otherwise, Murderers win
					if (MM.PlayerCount(ROLE_CIVILIAN))
						MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 1))
						MM.ChatprintGlobal("CHAT_CIVILIANHURT", 1)
						MM.SetRandomCivilianAs(ROLE_SHERIFF)
						ap.mm.role = ROLE_CIVILIAN
					else
						MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_SHERIKILLINNO)
					end
				end,
				[ROLE_HERO] = do
					MM.KillPlayer(a, true, true)
					if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
						MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_HEROKILLINNO)
					elseif (MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not #MM.shremds) and (not wepcfgCVARs[ROLE_CIVILIAN].value)
						MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
					else
						MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 2))
						MM.ChatprintGlobal("CHAT_CIVILIANHURT", 2)
					end
				end,
				[ROLE_CIVILIAN] = do
					MM.KillPlayer(a, true, true)
					if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
						MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
					else
						MAYA.ChatprintPM(ap, MM.GetText("CHAT_KILLPUNISHMENT_PM", 4))
					end
					if (isdedicatedserver) then CONS_Printf(server, "- "..ap.name.." (Innocent) killed "..vp.name.." (Innocent)") end
				end
			})
		end,
		[ROLE_JESTER] = do
			if (ap.mm.role == ROLE_MURDERER) and (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_MURD)
			end

			switch(ap.mm.role, {
				[ROLE_SHERIFF] = do
					-- Sheriff killed the Jester, instantly end round and make Jester win
					MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED)
				end,
				[ROLE_HERO] = do
					-- Hero killed the Jester, instantly end round and make Jester win
					MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED)
				end,
				[ROLE_CIVILIAN] = do
					-- Civilian killed the Jester, instantly end round and make Jester win
					MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED)
				end
			})
		end,
		[ROLE_JESTERHERO] = do
			-- If Civilian killed the Jester, instantly end round and make Jester win
			if (ap.mm.role == ROLE_CIVILIAN) then MM.EndRound(WIN_JESTERKILLED, "CHAT_ENDROUND", WIN_JESTERKILLED) end

			if (not MM.PlayerCount(ROLE_JESTERHERO)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)) and ((not MM.PlayerCount(ROLE_CIVILIAN)) or (MM.PlayerCount(ROLE_CIVILIAN) and (not wepcfgCVARs[ROLE_CIVILIAN].value)))
				MM.EndRound(WIN_MURD, "CHAT_ENDROUND", WIN_NODEFENDERS)
			else
				MM.ChatprintGlobal("MSG_HEROKILLED", vp.name)
				if (isdedicatedserver) then CONS_Printf(server, "- "..vp.name.." (Hero) killed") end
			end
		end
	})

	MM.StartSuspenseMusic()
	MM.StartShowdownMusic()
	return true
end, MT_PLAYER)

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

	for p in players.iterate do
		if (p.quittime) then COM_BufInsertText(server, "KICK "..#p.." Player leave") end -- Kick forcer
	end

	MM.shwdwn = false
end)

--
-- Music handler
--
addHook("MusicChange", function(old, new)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	--Keep the event music playing
	if ((gamestate == GS_LEVEL) and (leveltime) and (consoleplayer) and not (consoleplayer.powers[pw_underwater] or consoleplayer.powers[pw_spacetime]))
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

--
-- Miscelaneous
--
addHook("HurtMsg", do --disable Ringslier hurt messages
	if (gametype == GT_LTMMURDERMYSTERY) return true end
end)

--Spectator mode toggle
addHook("TeamSwitch", function(p, t, s)
	if (gametype == GT_LTMMURDERMYSTERY)
		switch(bool2int(p.mm.flags & FLAG_WAITSPECTATOR), {
			[1] = do --True
				p.mm.flags = $ & ~FLAG_WAITSPECTATOR
			end,
			[0] = do --False
				p.mm.flags = $ | FLAG_WAITSPECTATOR
			end
		})
		return false --do not switch
	else
		return --use game's default behaviour
	end
end)

-- Custom TIMELIMIT code
-- An alternative to SRB2's built-in TIMELIMIT
addHook("ThinkFrame", do
	if ((gametype == GT_LTMMURDERMYSTERY) and (leveltime >= (MM.timelimit * 2100) - 1) and (not timelimit)) G_ExitLevel() end
end)

--Automap anti-cheat
if (tsourdt3rd)
	addHook("KeyDown", function(keyevent)
		if (keyevent.num == 9) and ((CV_FindVar("automapoutsidedevmode") and CV_FindVar("automapoutsidedevmode").value) or (CV_FindVar("tsourdt3rd_debug_automapanywhere") and CV_FindVar("tsourdt3rd_debug_automapanywhere").value)) and (gametype == GT_LTMMURDERMYSTERY)
			COM_BufInsertText(consoleplayer, "QUIT")
		end
	end)
end

--Lock viewpoint switch (Disable F12)
addHook("ViewpointSwitch", function(p) --player
	if (gametype != GT_LTMMURDERMYSTERY) or (p.spectator) return --use game's default behaviour
	else return false end --do not switch
end)

--Hide player names in Cryptic game
addHook("SeenPlayer", function(p, sp) --player, seenplayer
	if (gametype != GT_LTMMURDERMYSTERY) then return --use game's default behavior
	else
		if (cv_cryptic.value) then return false end --do not show
	end
end)
