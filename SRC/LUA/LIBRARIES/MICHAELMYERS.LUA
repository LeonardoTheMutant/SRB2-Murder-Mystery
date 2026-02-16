-- MICHAELMYERS.LUA (Formely FUNCTIONS.LUA)
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Function definitions for the core MM functionality, PONG minigame and some global functions
-- Named after Michael Myers - one of the fictional serial murderers from the horror films (nah it's just because his initials are "MM")

-- DEPENDENCIES: Caroline, Maya

local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}

--Add language/translation to the game
MM.AddLang = function(langID, langTbl)
	assert(langID, "Invalid Language Index")
	assert(langTbl, "Invalid Language Table.")
	if (type(langID) ~= "string") error("Language ID should be string and contain 2-3 characters long") end
	if (type(langTbl) ~= "table") error("Language Talbe shoulb be table.") end
	if (MM.text[langID])
		MM.text[langID] = nil --Empty the table so that the language can be updated
		printf("\x82WARNING\x80: Updating the \x81%s\x80 language...", langID)
	end
	MM.text[langID:upper()] = langTbl
	printf("\x87Murder Mystery\x80: Added the \x81%s\x80 language by %s", langID, MM.text[langID]["AUTHOR"])
	if (MM.text[langID]["VERSION"] ~= MM.version) printf("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84%s\x80 to update it for the \x87Murder Mystery %s", tostring(MM.text[langID:upper()]["AUTHOR"]), MM.version) end
end

--(Re)Load a list of available Suspense music
MM.LoadSuspenseTracks = do
	MM.susnse_music = {}
	local lumpname
	for i = 0, 15 do
		lumpname = string.format("MMSUS%X", i)
		if (S_MusicExists(lumpname))
			table.insert(MM.susnse_music, lumpname)
			if (MM.debug) printf("\x87Murder Mystery\x80: Loaded Suspense Track \x81%s", lumpname) end
		end
	end
end

--(Re)Load a list of available Showdown Duel music
MM.LoadShowdownTracks = do
	MM.shwdwn_music = {}
	local lumpname
	for i = 0, 15 do
		lumpname = string.format("MMSHD%X", i)
		if (S_MusicExists(lumpname))
			table.insert(MM.shwdwn_music, lumpname)
			if (MM.debug) printf("\x87Murder Mystery\x80: Loaded Showdown Track \x81%s", lumpname) end
		end
	end
end

MM.DebugPrint = function(str, ...)
	if (MM.debug) printf("\x87Murder Mystery (Debug)\x80: %s", str, {...}) end
end

--Count the real amount of players online
MM.PlayerCountReal = do
	local plrc = 0
	for p in players.iterate do if (not p.quittime) then plrc = $ + 1 end end
	return plrc
end

--Count the amount of spectators
MM.PlayerCountSpectators = do
	local plrc = 0
	for p in players.iterate do if ((not p.quittime) and (p.mm) and (p.mm.flags & FLAG_SPECTATOR)) then plrc = $ + 1 end end
	return plrc
end

--Count the playing players
MM.PlayerCount = function(role)
	local plrc = 0
	if (role)
		for p in players.iterate do if ((p.mm.role == role) and not ((p.quittime) or (p.mm.flags & FLAG_SPECTATOR))) then plrc = $ + 1 end end
	else
		for p in players.iterate do if not ((p.quittime) or (p.mm.flags & FLAG_SPECTATOR)) then plrc = $ + 1 end end
	end
	return plrc
end

--Count the Alive Players
MM.PlayersAlive = do
	local plrs = 0
	for p in players.iterate do
		if not ((p.mm.flags & FLAG_SPECTATOR) and (p.mm.role == ROLE_DEAD) and (p.quittime)) then plrs = $ + 1 end
	end
	return plrs
end

--Player initializator
MM.InitPlayer = function(p)
	assert(p, "MM.InitPlayer(): player_t not given!")

	if (not p.mm) then p.mm = {} end
	p.mm.camping = 0
	p.mm.kills = 0
	p.mm.killtrailsteps = 0
	p.mm.weapondelay = 0
	p.mm.timetravel = {
		timezone = TIMEZONE_PRESENT,
		timesign = TWS_NONE,
		warptimer = 0
	}

	if (p.mm.flags and (p.mm.flags & FLAG_WAITSPECTATOR))
		switch(p.spectator, {
			[true] = do
				p.mm.flags = $ & ~FLAG_SPECTATOR
				p.spectator = false
			end,
			[false] = do
				p.mm.flags = $ | FLAG_SPECTATOR
				p.spectator = true
				p.pflags = $ | PF_GODMODE
				p.mm.role = ROLE_DEAD
			end,
		})
		p.mm.flags = $ & ~FLAG_WAITSPECTATOR
	end
end

--Calculate the role multiplier (how many players with same role should exist)
MM.GetRoleMultiplier = do
	local plrcount = MM.PlayerCount()
	if (plrcount < 8) return 1
	elseif (plrcount >= 8) and (plrcount <= 14) return 2
	elseif (plrcount >= 15) and (plrcount <= 21) return 3
	elseif (plrcount >= 22) and (plrcount <= 28) return 4
	elseif (plrcount >= 29) return 5 end
end

--Retrieve the text line from TEXT.LUA, if exists
MM.GetText = function(line, param)
	if (line)
		if (MM.text[MM.lang][line])
			if (param)
				if (MM.text[MM.lang][line][param])
					return MM.text[MM.lang][line][param]
				else
					if (MM.debug) error(string.format("\x82Tried to access value at \x87MM.text[\x80\"%s\"\x87][\x80\"%s\"\x87][\x80\"%s\"\x87]\x82 that does not exist!\x80", MM.lang, line, param)) end
					return "MM.text["..MM.lang.."]["..line.."]["..param.."]"
				end
			end
			if (type(MM.text[MM.lang][line]) == "string")
				return MM.text[MM.lang][line]
			else
				if (MM.debug) error(string.format("\x82Tried to access the table at \x87MM.text[\x80\"%s\"\x87][\x80\"%s\"\x87]\x82 without parameter!\x80", MM.lang, line)) end
				return "MM.text["..MM.lang.."]["..line.."][nil]"
			end
		else
			if (MM.debug) error(string.format("\x82Tried to access value at \x87MM.text[\x80\"%s\"\x87][\x80\"%s\"\x87]\x82 that does not exist!\x80", MM.lang, line)) end
			return "MM.text["..MM.lang.."]["..line.."]"
		end
	else
		return ""
	end
end

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
MM.AssignRoles = do
	if (gametype != GT_LTMMURDERMYSTERY) return end

	if (MM.PlayerCount() < 2) then return end --Assign roles only when there are 2+ playing players

	local plrs = {} --table of player nodes that exist and are valid
	for p in players.iterate --prepare players and get their player nodes
		if not (p.mm.flags & FLAG_SPECTATOR)
			p.mm.role = ROLE_DEAD
			table.insert(plrs, #p)
		end
	end
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign Murderers and Sheriffs
        for i = 1, MM.GetRoleMultiplier()
            local randPlr = P_RandomKey(#plrs) + 1 --select random player
            players[plrs[randPlr]].mm.role = r --assign the role to that player
            table.remove(plrs, randPlr) --and finally forget about it
        end
    end
	--tell each player its role personally
	for p in players.iterate do
		if not (p.mm.flags & FLAG_SPECTATOR)
			if (p.mm.role == ROLE_DEAD) --Assign the rest of the roles
				if (not MM.PlayerCount(ROLE_JESTER) and MM.PlayerCount() > 3 and not P_RandomKey(4))
					--Assign Jester role
					p.mm.role = ROLE_JESTER
					MM.DebugPrint("Jester role assigned")
					else p.mm.role = ROLE_CIVILIAN end --Assign Civilian Role
			end

			--Annouce about their roles to players
			switch(p.mm.role, {
				[ROLE_MURDERER] = do
					MAYA.ChatprintPM(p, MM.GetText("CHAT_ROLE_MURDERER", "ROLEGET_PM"))
				end,
				[ROLE_SHERIFF] = do
					MAYA.ChatprintPM(p, MM.GetText("CHAT_ROLE_SHERIFF", "ROLEGET_PM"))
				end,
				[ROLE_CIVILIAN] = do
					MAYA.ChatprintPM(p, MM.GetText("CHAT_ROLE_CIVILIAN", "ROLEGET_PM"))
				end,
				[ROLE_HERO] = do
					MAYA.ChatprintPM(p, MM.GetText("CHAT_ROLE_HERO", "ROLEGET_PM"))
				end,
				[ROLE_JESTER] = do
					MAYA.ChatprintPM(p, MM.GetText("CHAT_ROLE_JESTER", "ROLEGET_PM"))
				end,
			})

			if (p == consoleplayer) then MM.hud.game.roleflicker = 140 end --timer for role name flickering on HUD, 4 seconds
		end
	end
end

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
MM.ChatprintGlobal = function(msg, var)
	for p in players.iterate do
		switch(msg, {
			["MSG_MURDKILLED"] = do
				MAYA.ChatprintPM(p, string.format("^5%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_MURDERER"]["KILLED"][1] or "Murderer"), var, (MM.text[MM.lang]["CHAT_ROLE_MURDERER"]["KILLED"][2] or "got eliminated!")))
			end,
			['MSG_SHERIKILLED'] = do
				MAYA.ChatprintPM(p, string.format("^4%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][1] or "Sheriff"), var, (MM.text[MM.lang]["CHAT_ROLE_MURDERER"]["KILLED"][2] or "got murdered!")))
			end,
			["MSG_HEROKILLED"] = do
				MAYA.ChatprintPM(p, string.format("^2%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_HERO"]["KILLED"][1] or "Sheriff"), var, (MM.text[MM.lang]["CHAT_ROLE_HERO"]["KILLED"][2] or "Sheriff")))
			end,
			['MSG_SHERIKILLED_DROP'] = do
				MAYA.ChatprintPM(p, string.format("^4%s ^7%s^0 %s %s", (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][1] or "Sheriff"), var, (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][2] or "Sheriff"), (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][3] or "Get their emerald!")))
			end,
			['MSG_MURDDIED'] = do
				MAYA.ChatprintPM(p, string.format("^5%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_MURDERER"]["KILLED"][1] or "Murderer"), var, MM.GetText("CHAT_DIEDHAZARD")))
			end,
			['MSG_SHERIDIED'] = do
				MAYA.ChatprintPM(p, string.format("^4%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][1] or "Sheriff"), var, MM.GetText("CHAT_DIEDHAZARD")))
			end,
			['MSG_HERODIED'] = do
				MAYA.ChatprintPM(p, string.format("^2%s ^7%s^0 %s", (MM.text[MM.lang]["CHAT_ROLE_HERO"]["KILLED"][1] or "Hero"), var, MM.GetText("CHAT_DIEDHAZARD")))
			end,
			['MSG_SHERIDIED_DROP'] = do
				MAYA.ChatprintPM(p, string.format("^4%s ^7%s^0 %s %s", (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][1] or "Sheriff"), var, MM.GetText("CHAT_DIEDHAZARD"), (MM.text[MM.lang]["CHAT_ROLE_SHERIFF"]["KILLED"][3] or "Ger their emerald!")))
			end,
			['MSG_ONEQUIT'] = do
				switch(var, {
					[ROLE_MURDERER] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_MURDERER', "ONEQUIT"))
					end,
					[ROLE_SHERIFF] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_SHERIFF', "ONEQUIT"))
					end,
					[ROLE_HERO] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_HERO', "ONEQUIT"))
					end
				})
			end,
			['MSG_LASTQUIT'] = do
				switch(var, {
					[ROLE_MURDERER] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_MURDERER', "LASTQUIT"))
					end,
					[ROLE_SHERIFF] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_SHERIFF', "LASTQUIT"))
					end,
					[ROLE_HERO] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_HERO', "LASTQUIT"))
					end
				})
			end,
			['MSG_REPLACEQUIT'] = do
				switch(var, {
					[ROLE_MURDERER] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_MURDERER', "REPLACEQUIT"))
					end,
					[ROLE_SHERIFF] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_SHERIFF', "REPLACEQUIT"))
					end,
					[ROLE_HERO] = do
						MAYA.ChatprintPM(p, MM.GetText('CHAT_ROLE_HERO', "REPLACEQUIT"))
					end
				})
			end,
			['default'] = do
				MAYA.ChatprintPM(p, MM.GetText(msg, var))
			end
		})
	end
end

--Check if the events are canonical acording to the  "PAST -> PRESENT -> GOOD/BAD FUTURE" timeline
MM.IsTimelineCorrect = function(timezone1, timezone2)
	return ((timezone1 == TIMEZONE_PAST) and (timezone2 >= TIMEZONE_PAST))
		or ((timezone1 == TIMEZONE_PRESENT) and (timezone2 >= TIMEZONE_PRESENT))
		or (timezone1 == TIMEZONE_FUTURE_BAD) and (timezone2 == TIMEZONE_FUTURE_BAD)
		or (timezone1 == TIMEZONE_FUTURE_GOOD) and (timezone2 == TIMEZONE_FUTURE_GOOD)
end

--Skeleton Body spawn
MM.SpawnSkeletonBody = function(p, t) --player (MOBJ_T), timezone (TIMEZONE_* constant)
	local ShiftX = 0
	local ShiftY = 0
	local temp

	temp = tonumber(mapheaderinfo[gamemap].mm_timetravel_shiftx)
	if (temp) then ShiftX = temp end

	temp = tonumber(mapheaderinfo[gamemap].mm_timetravel_shifty)
	if (temp) then ShiftY = temp end

	if (ShiftX) or (ShiftY)
		for timezone = TIMEZONE_PAST, TIMEZONE_FUTURE_BAD do
			if MM.IsTimelineCorrect(t, timezone)
				local body = P_SpawnMobjFromMobj(p, ShiftX, ShiftY, 0, MT_DEADPLR)
				body.state = S_MMSKELT
			end
		end
	end
end

--Spawn Sheriff Emerald
MM.SpawnSHREMD = function(x, y, z, timezone)
	if (x == nil) or (y == nil) or (z == nil) then error("Not enough arguments for MM.SpawnSHREMD(int x, int y, int z, [int timezone])") end
	local mo = P_SpawnMobj(x ,y, z, MT_SHREMD)
	if (timezone) then mo.timezone = timezone end
	table.insert(MM.shremds, (#MM.shremds + 1), mo)
end

--Kill Player by Player
MM.KillPlayerByPlayer = function(p, k) --player, killer (both MOBJ_T)
	if ((not p) or (not p.player)) then error("MM.KillPlayerByPlayer() argument #1: player's mobj_t expected") end
	if ((not k) or (not k.player)) then error("MM.KillPlayerByPlayer() argument #2: killer player's mobj_t expected") end
	local plr = p.player
	plr.pflags = $|PF_GODMODE --force player to remain dead if they die as spectator (SRB2 bug fix)
	plr.spectator = true
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_DEAD
	MM.StartFlashFX(plr, 4, 0x23) --Red flash effect
	P_PlayerRingBurst(plr, -1)
	P_PlayerWeaponPanelOrAmmoBurst(plr)
	plr.mm.killreason = KILLBY_PLR
	plr.mm.killername = k.player.name
	k.player.mm.kills = $ + 1
	if (not (k.player.mm.flags & FLAG_SNEAK)) then P_PlayDeathSound(p) end
	plr.rmomx = 0
	plr.rmomy = 0

	--Dead body spawn
	local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
	if (P_IsValidSprite2(p, SPR2_SHIT)) --Does skin have SPR2_SHIT sprite ("SHITA0" sprite lump)?
		body.skin = p.skin
		body.state = S_MMPLRDEAD
		body.color = p.color
	else
		body.state = S_MMSKELT --Show skeleton instead
	end

	if (plr.mm.timetravel.timezone) then MM.SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end

	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end

--Kill Player by not player (map hazards such as pit, crusher, water drowning or simply as a punishment)
MM.KillPlayer = function(p, spawnbody, killedForPunishment) --player (mobt_t), "Spawn dead body?" (boolean), "Was this player killed for punishment?" (boolean)
	if ((not p) or (not p.player)) error("MM.KillPlayer() argument #1: player's mobj_t expected") end
	local plr = p.player
	if (MM.PlayerCount() != 1) --force player to remain dead if they die as spectator (SRB2 bug fix)
		plr.pflags = $|PF_GODMODE
		plr.spectator = true
	end
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_DEAD
	MM.StartFlashFX(plr, 4, 0x23) --Red flash effect
	if (killedForPunishment) then plr.mm.killreason = KILLBY_GAME
	else plr.mm.killreason = KILLBY_MAP end

	if (spawnbody)
		local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
		if (P_IsValidSprite2(p, SPR2_SHIT)) --Does skin have SPR2_SHIT sprite ("SHITA0" sprite lump)?
			body.skin = p.skin
			body.state = S_MMPLRDEAD
			body.color = p.color
		else
			body.state = S_MMSKELT --Show skeleton instead
		end

		if (plr.mm.timetravel.timezone) then MM.SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end
	else
		S_StartSound(p, sfx_altdi1) --play global death sound
	end

	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end

--Count Player's taemmates
MM.TeammatesCount = function(p)
	local teammates = 0

	switch(p.mm.role, {
		[ROLE_MURDERER] = do
			teammates = MM.PlayerCount(ROLE_MURDERER) - 1
		end,
		[ROLE_SHERIFF] = do
			teammates = (MM.PlayerCount(ROLE_SHERIFF) - 1) + MM.PlayerCount(ROLE_HERO) + MM.PlayerCount(ROLE_JESTERHERO)
		end,
		[ROLE_HERO] = do
			teammates = MM.PlayerCount(ROLE_SHERIFF) + (MM.PlayerCount(ROLE_HERO) - 1) + MM.PlayerCount(ROLE_JESTERHERO)
		end,
		[ROLE_JESTERHERO] = do
			teammates = MM.PlayerCount(ROLE_SHERIFF) + MM.PlayerCount(ROLE_HERO)
		end
	})

	return teammates
end

--Check if Player1 and Player2 are teammates
MM.AreTeammates = function(p1, p2)
	if ((not p1.mm.role) or (not p2.mm.role)) then return false end

	return ((p1.mm.role == ROLE_MURDERER) and (p2.mm.role == ROLE_MURDERER))
		or (((p1.mm.role == ROLE_SHERIFF) or (p1.mm.role == ROLE_HERO)) and ((p2.mm.role == ROLE_SHERIFF) or (p2.mm.role == ROLE_HERO)))
		or (((p1.mm.role == ROLE_SHERIFF) or (p1.mm.role == ROLE_JESTERHERO)) and ((p2.mm.role == ROLE_SHERIFF) or (p2.mm.role == ROLE_JESTERHERO)))
		or (((p1.mm.role == ROLE_HERO) or (p1.mm.role == ROLE_JESTERHERO)) and ((p2.mm.role == ROLE_HERO) or (p2.mm.role == ROLE_JESTERHERO)))
end

--Damage two teammate players and notify them
MM.HitTeammate = function(v, a)
	MAYA.ChatprintPM(a, MM.RoleColorHUD[v.mm.role]..MM.GetText("CHAT_TEAMMATEHIT_PM", 1))
	MAYA.ChatprintPM(v, MM.RoleColorHUD[a.mm.role]..MM.GetText("CHAT_TEAMMATEHIT_PM", 2))
	P_DoPlayerPain(v)
	P_PlayerWeaponAmmoBurst(v)
	v.powers[pw_flashing] = 105 --3 seconds
end

--Player deinitializator, executes on PlayerQuit hook
MM.PlayerQuit = function(p)
	local role = p.mm.role
	p.mm.role = ROLE_DEAD
	switch(role, {
		[ROLE_MURDERER] = do
			if ((not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_MURDERER))) or ((MM.PlayerCount(ROLE_CIVILIAN) == 1) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_MURDERER)))
				MM.EndRound(WIN_TIE, "MSG_LASTQUIT", ROLE_MURDERER)
			elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_MURDERER)))
				MM.ChatprintGlobal("MSG_REPLACEQUIT", ROLE_MURDERER)
				MM.SetRandomCivilianAs(ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server, "- Murderer replaced") end
			else
				MM.ChatprintGlobal("MSG_ONEQUIT", ROLE_MURDERER)
				if (isdedicatedserver) CONS_Printf(server, "- Murderer left") end
			end
		end,
		[ROLE_SHERIFF] = do
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF))
				if (MM.PlayerCount(ROLE_HERO)) then MM.ChatprintGlobal("MSG_LASTQUIT", ROLE_SHERIFF)
				else MM.EndRound(WIN_TIE, "MSG_LASTQUIT", ROLE_SHERIFF) end
			elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_SHERIFF)))
				MM.ChatprintGlobal("MSG_REPLACEQUIT", ROLE_SHERIFF)
				MM.SetRandomCivilianAs(ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff replaced") end
			else
				MM.ChatprintGlobal("MSG_ONEQUIT", ROLE_SHERIFF)
				if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
			end
		end,
		[ROLE_HERO] = do
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_HERO))
				if (MM.PlayerCount(ROLE_SHERIFF)) then MM.ChatprintGlobal("CHAT_LASTQUIT", ROLE_HERO)
				else MM.EndRound(WIN_TIE, "MSG_LASTQUIT", ROLE_HERO) end
			elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)))
				MM.ChatprintGlobal("MSG_REPLACEQUIT", ROLE_HERO)
				MM.SetRandomCivilianAs(ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "- Hero replaced") end
			else
				MM.ChatprintGlobal("MSG_ONEQUIT", ROLE_HERO)
				if (isdedicatedserver) CONS_Printf(server, "- Hero left") end
			end
		end,
		[ROLE_CIVILIAN] = do
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_JESTER)) and (not MM.PlayerCount(ROLE_JESTERHERO))
				MM.EndRound(WIN_NONE, "MSG_LASTQUIT", 3) --The Civilian has left the game where he was the last hope, we will still consider him as the Hero
			end
		end,
		[ROLE_JESTER] = do
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
				MM.EndRound(WIN_NONE, "MSG_LASTQUIT", 3) --The Jester has left the game where he was the last hope, we will still consider him as the Hero
			end
		end,
		[ROLE_JESTERHERO] = do
			if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
				MM.EndRound(WIN_NONE, "MSG_LASTQUIT", 3) --The Jester has left the game where he was the last hope, we will still consider him as the Hero
			end
		end
	})

	--If player was one of the PONG rivals, forget about him
	local myslot = PONG_GetMySlot(p)
	if (myslot) then MM.duelplrs[myslot] = nil end

	MM.StartSuspenseMusic()
	MM.StartShowdownMusic()
end

--Start the Flash Effect on screen
--color is the SRB2 palette color index
MM.StartFlashFX = function(p, duration, color)
	assert(p, "MM.StartFlashFX argument #1: player_t not given!")
	assert(duration, "MM.StartFlashFX argument #2: Effect duration time is not specified")
	if (type(duration) != "number") then error("MM.StartFlashFX argument #2: The value of the effect duration must be a number") end
	if (color and (type(color) != "number")) then error("MM.StartFlashFX argument #3: The value of the effect's color must be a number") end

	color = color or 0

	if (p == consoleplayer)
		MM.hud.game.flash.translucency = 10
		MM.hud.game.flash.duration = duration
		MM.hud.game.flash.color = color
	end
end

--Function to end the round, arguments here:
--possible values for the winner of the game are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat (taken from the MM.text)
--reason is used differently for each endtext message but usualy it is a win reason (WIN_* constant)
MM.EndRound = function(winner, endtext, reason)
	MM.winner = winner
	if (endtext == "CHAT_ENDROUND") then MM.winreason = reason end
	MM.shwdwn = false
	MM.susnse = false
	G_ExitLevel()
	if (endtext) MM.ChatprintGlobal(endtext, reason) end
	--if (isdedicatedserver) --console log for dedicated host
	--	if (endtext == "CHAT_ENDROUND") then CONS_Printf(server, "- "..MM.GetText("CHAT_ENDROUND", reason))
	--	else CONS_Printf(server, "- "..MM.GetText(endtext, reason)) end
	--end
end

--Enable Suspense music when there are no Sheriffs & Heroes left but one Innocent and at least one dropped Sheriff's Emerald
MM.StartSuspenseMusic = do
	if (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
	and (((MM.PlayerCount(ROLE_CIVILIAN) == 1) and (not MM.PlayerCount(ROLE_JESTER))) or (not MM.PlayerCount(ROLE_CIVILIAN) and MM.PlayerCount(ROLE_JESTER)))
	and ((#MM.shremds and not wepcfgCVARs[ROLE_CIVILIAN].value) or (wepcfgCVARs[ROLE_CIVILIAN].value))
		if (mapheaderinfo[gamemap].mm_suspensetrack) then MM.susnse = mapheaderinfo[gamemap].mm_suspensetrack --check map's SOC for specified track
		else
			if (#MM.susnse_music) then MM.susnse = MM.susnse_music[P_RandomKey(#MM.susnse_music) + 1] --if there are tracks in the Suspense Tracklist, choose a random track
			else return false end
		end
		if (MM.susnse and S_MusicExists(MM.susnse)) then
			S_ChangeMusic(MM.susnse, true)
			return true
		end
	end
	return false
end

--Enable Showdown music when there are no Civilians left
MM.StartShowdownMusic = do
	if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.shwdwn) and (not MM.twopgame) and (MM.PlayerCount())
		if (mapheaderinfo[gamemap].mm_showdowntrack) then MM.shwdwn = mapheaderinfo[gamemap].mm_showdowntrack --check map's SOC for specified track
		else
			if (#MM.shwdwn_music) then MM.shwdwn = MM.shwdwn_music[P_RandomKey(#MM.shwdwn_music) + 1] --if there are tracks in the Showdown Tracklist, choose a random track
			else return false end
		end
		if (MM.shwdwn and S_MusicExists(MM.shwdwn)) then
			S_ChangeMusic(MM.shwdwn, true)
			return true
		end
	end
	return false
end

--Set random Civilian as the given role + notify them of the new role
MM.SetRandomCivilianAs = function(role)
	local plrs = {}
	for plr in players.iterate
		if (plr.mm.role == ROLE_CIVILIAN) then table.insert(plrs, #plr) end
	end
    local p = players[plrs[P_RandomKey(#plrs)+1]]
	p.mm.role = role
	MM.hud.game.roleflicker = 105 --3 secs
	local msg
	switch(role, {
		[ROLE_MURDERER] = do
			msg = "CHAT_ROLE_MURDERER"
		end,
		[ROLE_SHERIFF] = do
			msg = "CHAT_ROLE_SHERIFF"
		end,
		[ROLE_HERO] = do
			msg = "CHAT_ROLE_HERO"
		end
	})
	MAYA.ChatprintPM(p, MM.text[MM.lang][msg]["NEWROLEGET_PM"] or "You got new role!")
	return
end

--Kick/Ban player from the game
MM.PunishPlayer = function(p, msg, ban) --player (player_t), punishment message (string), ban instead of kick? (boolean)
	if (p == server) then COM_BufInsertText(server, "QUIT")
	else
		if (ban) then COM_BufInsertText(server, "BAN "..#p.." "..msg)
		else COM_BufInsertText(server, "KICK "..#p.." "..msg) end
	end
end

--Retrieve the Weapon Flags (set by the CVARs) for the given role
MM.GetWepCfgFlags = function(role)
	local returnValue = 0
	switch(role, {
		[ROLE_MURDERER] = do
			if (MM.PlayerCount(ROLE_CIVILIAN)) then returnValue = wepcfgCVARs[ROLE_MURDERER].value % 4 --Normal gameplay
			else returnValue = (wepcfgCVARs[ROLE_MURDERER].value / 4) % 4 end --Showdown Duel
		end,
		[ROLE_SHERIFF] = do
			if (MM.PlayerCount(ROLE_CIVILIAN)) then returnValue = wepcfgCVARs[ROLE_SHERIFF].value % 4 --Normal gameplay
			else returnValue = (wepcfgCVARs[ROLE_SHERIFF].value / 4) % 4 end --Showdown Duel
		end,
		[ROLE_HERO] = do
			if (MM.PlayerCount(ROLE_CIVILIAN)) then returnValue = wepcfgCVARs[ROLE_HERO].value % 4 --Normal gameplay
			else returnValue = (wepcfgCVARs[ROLE_HERO].value / 4) % 4 end --Showdown Duel
		end,
		[ROLE_JESTERHERO] = do
			if (MM.PlayerCount(ROLE_CIVILIAN)) then returnValue = wepcfgCVARs[ROLE_HERO].value % 4 --Normal gameplay
			else returnValue = (wepcfgCVARs[ROLE_HERO].value / 4) % 4 end --Showdown Duel
		end
	})
	return returnValue
end



--
-- MINIGAME.LUA
--

--Retrieve a PONG player node number
rawset(_G, "PONG_GetMySlot", function(p)
	assert(p, "PONG_GetMySlot(): player_t not given!")
	if (not MM.duelplrs) return end
	for i = 1, 2 do if (MM.duelplrs[i] == p) then return i end end
end)

--Set PONG ball's valocity
--Possible values for "side":
--	<0	- Make ball go left
--	0	- Select a random ball direction
--	>0	- Make ball go right
rawset(_G, "PONG_SetVelocity", function(side)
	side = $ or 0

	local x = 0
	if (side < 0) x = -1
	elseif (side > 0) x = 1
	else while (not x) do x = P_RandomRange(-1, 1) end end

	local y = 0
	while (not y) y = P_RandomRange(-2, 2) end

	MM.pong.velocity.x = x
	MM.pong.velocity.y = y
end)

rawset(_G, "PONG_Reset", do
	MM.pong.ball.x = 79
	MM.pong.ball.y = 39

	PONG_SetVelocity()

	MM.pong.hits = 0
	MM.pong.speed = 1
end)



--
-- HUD
--

--Load (precache) patch into (V)RAM
MM.LoadPatch = function(v, patchname)
	assert(v, "MM.LoadPatch() argument #1: Video drawer object expected")
	assert(patchname, "MM.LoadPatch() argument #2: Patch graphic name expected")
	if (type(patchname) != "string") then error("V_LoadCharset() argument #2: Patch graphic name expected in string type") end

	if (not MM.graphics) then MM.graphics = {} end

	if (MM.graphics[patchname]) MM.DebugPrint("Patch \x81"..patchname.."\x87 is already loaded into memory") end
	MM.graphics[patchname] = v.cachePatch(patchname)
	MM.DebugPrint("Loaded patch \x81"..patchname)
end

--Unload patch from (V)RAM
MM.UnloadPatch = function(patchname)
	assert(patchname, "MM.UnloadPatch() argument #1: Patch graphic name expected")
	if (type(patchname) != "string") then error("MM.UnloadPatch() argument #1: Patch graphic name expected in string type") end

	if (MM.graphics[patchname])
		MM.graphics[patchname] = nil
		MM.DebugPrint("Unloaded patch \x81"..patchname)
	else
		MM.DebugPrint("Trying to unload patch \x81"..patchname.."\x87 that is not in the memory!")
	end
end

--
-- MISCELANEOUS
--

-- Returns the height of the sector floor at (x, y)
rawset(_G, "P_GetSectorFloorZAt", function(sector, x, y)
	if (sector.f_slope) return P_GetZAt(sector.f_slope, x, y)
	else return sector.floorheight end
end)

-- Returns the height of the sector ceiling at (x, y)
rawset(_G, "P_GetSectorCeilingZAt", function(sector, x, y)
	if (sector.c_slope) return P_GetZAt(sector.c_slope, x, y)
	else return sector.ceilingheight end
end)
-- Returns the top height of the FOF at (x, y)
rawset(_G, "P_GetFOFTopZAt", function(fof, x, y)
	if (fof.t_slope) return P_GetZAt(fof.t_slope, x, y)
	else return fof.topheight end
end)

-- Returns the height of the sector ceiling at (x, y)
rawset(_G, "P_GetFOFBottomZAt", function(fof, x, y)
	if (fof.b_slope) return P_GetZAt(fof.b_slope, x, y)
	else return fof.bottomheight end
end)

--Shortcut for "if (arg and arg.valid)"
rawset(_G, "valid", function(arg)
	return (arg and arg.valid)
end)

--Check if the given argument from SOC resembles "true"
rawset(_G, "SOC_IsTrue", function(arg)
	if (not arg) then return false end
	if (arg:upper() == "TRUE") or (arg == "1") then return true
	else return false end
end)
