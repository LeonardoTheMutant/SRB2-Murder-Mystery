-- FUNCTIONS.LUA
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Main logic functions & MM HUD Library

local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}

--
-- GLOBAL PLAYER COUNTING FUNCTIONS
--
rawset(_G, "PlayerCount", function(role)
	local plrc = 0
	if (role)
		for p in players.iterate do if ((p.mm.role == role) and (not p.quittime)) then plrc = $ + 1 end end
	else
		for p in players.iterate do if (not p.quittime) then plrc = $ + 1 end end
	end
	return plrc
end)
rawset(_G, "PlayersAlive", function()
	local plrs = 0
	for p in players.iterate do if ((not p.spectator) and (not p.quittime)) then plrs = $ + 1 end end
	return plrs
end)

--
--GAME.LUA
--

--Player initializator
rawset(_G, "MM_InitPlayer", function(p)
	assert(p, "MM_InitPlayer(): player_t not given!")

	if (not p.mm) then p.mm = {} end
	p.mm.kills = 0
	p.mm.weapondelay = 0
	p.mm.camping = 0
	p.mm.shremd_dist = 0
	p.mm.sneak = false
	p.mm.hud = {
		fx_translucency = 0,
		fx_duration = 0,
		fx_color = 0,
		roleflicker = 140,
	}
	p.mm.timetravel = {
		timezone = TIMEZONE_PRESENT,
		timesign = TWS_NONE,
		warptimer = 0
	}
end)

-- how many players with same role should exist?
rawset(_G, "MM_GetRoleMultiplier", function()
	if (PlayerCount()<8) return 1
	elseif (PlayerCount()>=8) and (PlayerCount()<=14) return 2
	elseif (PlayerCount()>=15) and (PlayerCount()<=21) return 3
	elseif (PlayerCount()>=22) and (PlayerCount()<=28) return 4
	elseif (PlayerCount()>=29) return 5 end
end)

--get the text line from the TEXT.LUA, if exists
rawset(_G, "MM_GetText", function(lang, line, param)
	if (lang)
		if (MM.text[lang])
			if (line)
				if (MM.text[lang][line])
					if (param)
						if (MM.text[lang][line][param])
							return MM.text[lang][line][param]
						else
							if (MM.debug) error("\x82Tried to access value at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87][\x80\""..param.."\"\x87]\x82 that does not exist!\x80") end
							return ""
						end
					end
					if (type(MM.text[lang][line]) == "string")
						return MM.text[lang][line]
					else
						if (MM.debug) error("\x82Tried to access the table at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87]\x82 without parameter!\x80") end
						return ""
					end
				else
					if (MM.debug) error("\x82Tried to access value at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87]\x82 that does not exist!\x80") end
					return ""
				end
			end
		else
			if (MM.debug) error("\x82Tried to access the \x87MM.text\x82 table with \x80"..lang.."\x82 language that does not exist!\x80") end
			return ""
		end
	end
	return ""
end)

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
rawset(_G, "MM_AssignRoles", function()
	if (gametype != GT_LTMMURDERMYSTERY) return end

	-- Take care of the lonely player
	if (PlayerCount() < 2)
		for p in players.iterate do p.mm.role = nil end
		return
	end

	local plrs = {} --table of player nodes that exist and are valid
	for p in players.iterate --prepare players and get their player nodes
		p.mm.role = ROLE_NONE
		table.insert(plrs, #p)
	end
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign Murderers and Sheriffs
        for i = 1, MM_GetRoleMultiplier()
            local randPlr = P_RandomKey(#plrs) + 1 --select random player
            players[plrs[randPlr]].mm.role = r --assign the role to that player
            table.remove(plrs, randPlr) --and finally forget about it
        end
    end
	--tell each player its role personally
	for p in players.iterate
		if (p.mm.role == ROLE_NONE) p.mm.role = ROLE_CIVILIAN end --we previously didn't make Innos so make them now
		chatprintf(p, MM_GetText(p.mm.lang, "ROLE_GET", p.mm.role))
		p.mm.hud.roleflicker = 105 --timer for role name flickering on HUD
	end
end)

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
rawset(_G, "MM_ChatprintGlobal", function(msg, var)
	for p in players.iterate
		if ((msg == "MURD_KILLED") or (msg == "SHERI_KILLED") or (msg == "HERO_KILLED"))
			chatprintf(p, MM_GetText(p.mm.lang, msg, 1).." "..var.." "..MM_GetText(p.mm.lang, msg, 2))
		elseif (msg == "SHERI_KILLED_DROP")
			chatprintf(p, MM_GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." "..MM_GetText(p.mm.lang, "SHERI_KILLED", 2).." "..MM_GetText(p.mm.lang, "SHERI_KILLED", 3))
		elseif (msg == "MURD_DIED")
			chatprintf(p, MM_GetText(p.mm.lang, "MURD_KILLED", 1).." "..var.." \x80"..MM_GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "SHERI_DIED")
			chatprintf(p, MM_GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." \x80"..MM_GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "HERO_DIED")
			chatprintf(p, MM_GetText(p.mm.lang, "HERO_KILLED", 1).." "..var.." \x80"..MM_GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "SHERI_DIED_DROP")
			chatprintf(p, MM_GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." \x80"..MM_GetText(p.mm.lang, "DIED_HAZARD")..". "..MM_GetText(p.mm.lang, "SHERI_KILLED", 3))
		elseif ((msg == "LAST_QUIT") or (msg == "ONE_QUIT") or (msg == "REPLACE_QUIT"))
			if (var != ROLE_HERO) then chatprintf(p, MM_GetText(p.mm.lang, msg, var)) --for Murd and Sheri
			else chatprintf(p, MM_GetText(p.mm.lang, msg, 3)) end --for Hero
		elseif (msg == "WIN")
			chatprintf(p, MM_GetText(p.mm.lang, "ENDROUND", var))
		elseif msg
			chatprintf(p, MM_GetText(p.mm.lang, msg, var))
		end
	end
end)

rawset(_G, "MM_IsTimelineCorrect", function(timezone1, timezone2)
	if ((timezone1 == TIMEZONE_PAST) and (timezone2 >= TIMEZONE_PAST)) or ((timezone1 == TIMEZONE_PRESENT) and (timezone2 >= TIMEZONE_PRESENT)) return true
	elseif (timezone1 == TIMEZONE_FUTURE_BAD) and (timezone2 == TIMEZONE_FUTURE_BAD) return true
	elseif (timezone1 == TIMEZONE_FUTURE_GOOD) and (timezone2 == TIMEZONE_FUTURE_GOOD) return true
	end
end)

--Skeleton Body spawn (exclusive for MAPKD ("East City"))
rawset(_G, "MM_SpawnSkeletonBody", function(p, t) --player (MOBJ_T), timezone (TIMEZONE_* constant)
	local ShiftX
	local ShiftY
	if (mapheaderinfo[gamemap].timetravel_shiftx) and (tonumber(mapheaderinfo[gamemap].timetravel_shiftx)) ShiftX = tonumber(mapheaderinfo[gamemap].timetravel_shiftx)
	else ShiftX = 0 end
	if (mapheaderinfo[gamemap].timetravel_shifty) and (tonumber(mapheaderinfo[gamemap].timetravel_shifty)) ShiftY = tonumber(mapheaderinfo[gamemap].timetravel_shifty)
	else ShiftY = 0 end

	if (ShiftX) or (ShiftY)
		for timezone = TIMEZONE_PAST, TIMEZONE_FUTURE_BAD do
			if MM_IsTimelineCorrect(t, timezone)
				local body = P_SpawnMobjFromMobj(p, ShiftX, ShiftY, 0, MT_DEADPLR)
				body.state = S_MMSKELT
			end
		end
	end
end)

rawset(_G, "MM_KillPlayerByPlayer", function(p, k) --player, killer (both MOBJ_T)
	if ((not p) or (not p.player)) error("MM_KillPlayerByPlayer() argument #1: player's mobj_t expected") end
	if ((not k) or (not k.player)) error("MM_KillPlayerByPlayer() argument #2: killer player's mobj_t expected") end
	local plr = p.player
	plr.spectator = true
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_NONE
	MM_StartFlashFX(plr, 4, 0x23) --Red flash effect
	P_PlayerRingBurst(plr, -1)
	P_PlayerWeaponPanelOrAmmoBurst(plr)
	plr.mm.killername = k.player.name
	k.player.mm.kills = $ + 1
	if (not k.player.mm.sneak) P_PlayDeathSound(p) end
	plr.rmomx = 0
	plr.rmomy = 0

	--Dead body spawn
	local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
	if (p.skin == "sonic") body.state = S_SMMDEAD
	elseif (p.skin == "tails") body.state = S_TMMDEAD
	elseif (p.skin == "knuckles") body.state = S_KMMDEAD
	elseif (p.skin == "amy") body.state = S_AMMDEAD
	elseif (p.skin == "fang") body.state = S_FMMDEAD
	elseif (p.skin == "metalsonic") body.state = S_MMMDEAD
	elseif (p.skin == "superguide") body.state = S_GMMDEAD
	elseif (p.skin == "bob") body.state = S_BMMDEAD
	else body.state = S_MMSKELT end --fallback for custom chars in a form of a skeleton (I really should ban them)
	body.color = p.color

	if (plr.mm.timetravel.timezone) then MM_SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end

	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end)

rawset(_G, "MM_KillPlayerByHazard", function(p, spawnbody) --player (mobt_t), "Spawn dead body?" (boolean)
	if ((not p) or (not p.player)) error("MM_KillPlayerByHazard() argument #1: player's mobj_t expected") end
	local plr = p.player
	plr.spectator = true
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_NONE
	MM_StartFlashFX(plr, 4, 0x23) --Red flash effect
	plr.mm.killername = "your stupidity"

	if (spawnbody)
		local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
		if (p.skin == "sonic") body.state = S_SMMDEAD
		elseif (p.skin == "tails") body.state = S_TMMDEAD
		elseif (p.skin == "knuckles") body.state = S_KMMDEAD
		elseif (p.skin == "amy") body.state = S_AMMDEAD
		elseif (p.skin == "fang") body.state = S_FMMDEAD
		elseif (p.skin == "metalsonic") body.state = S_MMMDEAD
		else body.state = S_MMSKELT end --fallback for custom chars in a form of a skeleton (I really should ban them)
		body.color = p.color

		if (plr.mm.timetravel.timezone) then MM_SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end
	else
		S_StartSound(p, sfx_altdi1) --play global death sound
	end
	
	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end)

rawset(_G, "MM_TeammatesCount", function(p)
	local teammates = false

	if (p.mm.role == ROLE_MURDERER)
		teammates = PlayerCount(ROLE_MURDERER) - 1 
	elseif (p.mm.role == ROLE_SHERIFF)
		teammates = (PlayerCount(ROLE_SHERIFF) - 1) + PlayerCount(ROLE_HERO)
	elseif (p.mm.role == ROLE_HERO)
		teammates = PlayerCount(ROLE_SHERIFF) + (PlayerCount(ROLE_HERO) - 1)
	end

	return teammates
end)

rawset(_G, "MM_AreTeammates", function(p1, p2)
	if ((not p1.mm.role) or (not p2.mm.role)) then return false end

	return ((p1.mm.role == ROLE_MURDERER) and (p2.mm.role == ROLE_MURDERER))
		or (((p1.mm.role == ROLE_SHERIFF) or (p1.mm.role == ROLE_HERO)) and ((p2.mm.role == ROLE_SHERIFF) or (p2.mm.role == ROLE_HERO)))
end)

rawset(_G, "MM_HitTeammate", function(v, a)
	chatprintf(a, MM.RoleColor[v.mm.role]..MM_GetText(a.mm.lang, "TEAMMATE_HIT", 1))
	chatprintf(v, MM.RoleColor[a.mm.role]..MM_GetText(v.mm.lang, "TEAMMATE_HIT", 2))
	P_DoPlayerPain(v)
	P_PlayerWeaponAmmoBurst(v)
	v.powers[pw_flashing] = 105
end)

rawset(_G, "MM_PlayerQuit", function(p)
	if (p.mm.role == ROLE_MURDERER)
		p.mm.role = ROLE_NONE
		if ((not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_MURDERER))) or ((PlayerCount(ROLE_CIVILIAN) == 1) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_MURDERER)))
			MM_EndRound(0, "LAST_QUIT", ROLE_MURDERER)
		elseif (PlayerCount(ROLE_CIVILIAN) and (not PlayerCount(ROLE_MURDERER)))
			MM_ChatprintGlobal("REPLACE_QUIT", ROLE_MURDERER)
			MM_SetRandomInnoAs(ROLE_MURDERER, 1)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer replaced") end
		else
			MM_ChatprintGlobal("ONE_QUIT", ROLE_MURDERER)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer left") end
		end
	elseif (p.mm.role == ROLE_SHERIFF)
		p.mm.role = ROLE_NONE
		if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF))
			if (PlayerCount(ROLE_HERO)) then MM_ChatprintGlobal("LAST_QUIT", ROLE_SHERIFF)
			else MM_EndRound(0, "LAST_QUIT", ROLE_SHERIFF) end
		elseif (PlayerCount(ROLE_CIVILIAN) and (not PlayerCount(ROLE_SHERIFF)))
			MM_ChatprintGlobal("REPLACE_QUIT", ROLE_SHERIFF)
			MM_SetRandomInnoAs(ROLE_SHERIFF, 2)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff replaced") end
		else
			MM_ChatprintGlobal("ONE_QUIT", ROLE_SHERIFF)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
		end
	elseif (p.mm.role == ROLE_HERO)
		p.mm.role = ROLE_NONE
		if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_HERO))
			if (PlayerCount(ROLE_SHERIFF)) then MM_ChatprintGlobal("LAST_QUIT", ROLE_HERO)
			else MM_EndRound(0, "LAST_QUIT", ROLE_HERO) end
		elseif (PlayerCount(ROLE_CIVILIAN) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_SHERIFF)))
			MM_ChatprintGlobal("REPLACE_QUIT", ROLE_HERO)
			MM_SetRandomInnoAs(ROLE_HERO, 3)
			if (isdedicatedserver) CONS_Printf(server, "- Hero replaced") end
		else
			MM_ChatprintGlobal("ONE_QUIT", ROLE_HERO)
			if (isdedicatedserver) CONS_Printf(server, "- Hero left") end
		end
	elseif (p.mm.role == ROLE_CIVILIAN)
		p.mm.role = ROLE_NONE
		if (not PlayerCount(ROLE_CIVILIAN)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO))
			MM_EndRound(0, "LAST_QUIT", 3) --Innocent has left the game where he was the last hope, we will still consider him as the Hero
		end
	end

	MM_StartSuspenseMusic()
	MM_StartShowdownMusic()
end)

rawset(_G, "MM_StartFlashFX", function(p, duration, color)
	assert(p, "MM_StartFlashFX argument #1: player_t not given!")
	assert(p.mm, "MM_StartFlashFX argument #1: player_t.mm table is not initialized!")
	assert(p.mm.hud, "MM_StartFlashFX argument #1: player_t.mm.hud table is not initialized!")
	assert(duration, "MM_StartFlashFX argument #2: Effect duration time is not specified")
	if (type(duration) != "number") then error("MM_StartFlashFX argument #2: The value of the effect duration must be a number") end
	if (color and (type(color) != "number")) then error("MM_StartFlashFX argument #3: The value of the effect's color must be a number") end

	color = color or 0

	p.mm.hud.fx_translucency = 1
	p.mm.hud.fx_duration = duration
	p.mm.hud.fx_color = color
end)

--Function to end the round, arguments here:
--possible values for the winner of the game are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat (taken from the MM.text)
--reason is used differently for each endtext message but usualy it is a win reason (WIN_* constant)
rawset(_G, "MM_EndRound", function(winner, endtext, reason)
	MM.winner = winner
	if (endtext == "WIN") then MM.winreason = reason end
	MM.shwdwn = false
	MM.susnce = false
	G_ExitLevel()
	if (endtext) MM_ChatprintGlobal(endtext, reason) end
	if (isdedicatedserver) --console log for dedicated host
		if (endtext == "WIN") then CONS_Printf(server, "- "..MM_GetText("EN", "ENDROUND", reason))
		else CONS_Printf(server, "- "..MM_GetText("EN", endtext, reason)) end
	end
end)

--Enable Suspense music when there are no Sheriffs & Heroes left but one Innocent and at least one dropped Sheriff's Emerald
rawset(_G, "MM_StartSuspenseMusic", function()
	if (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (PlayerCount(ROLE_CIVILIAN) == 1) and ((#MM.shremds and not wepcfgCVARs[ROLE_CIVILIAN].value) or (wepcfgCVARs[ROLE_CIVILIAN].value))
		if (mapheaderinfo[gamemap].suspensetrack and S_MusicExists(mapheaderinfo[gamemap].suspensetrack))
			MM.susnce = mapheaderinfo[gamemap].suspensetrack
		else
			MM.susnce = "SUSNCE"
		end
		S_ChangeMusic(MM.susnce, true)
		return true
	end
	return false
end)

--Enable Showdown music when there are no innocents left
rawset(_G, "MM_StartShowdownMusic", function()
	if (not PlayerCount(ROLE_CIVILIAN)) and (not MM.shwdwn) and (not MM.twopgame) and (PlayerCount())
		if (mapheaderinfo[gamemap].showdowntrack and S_MusicExists(mapheaderinfo[gamemap].showdowntrack))
			MM.shwdwn = mapheaderinfo[gamemap].showdowntrack
		else
			MM.shwdwn = MM.shwdwn_music[P_RandomKey(#MM.shwdwn_music) + 1]
		end
		S_ChangeMusic(MM.shwdwn, true)
		return true
	end
	return false
end)

rawset(_G, "MM_SetRandomInnoAs", function(role, message)
	local plrs = {}
	for plr in players.iterate
		if ((not plr.spectator) and (plr.mm.role == ROLE_CIVILIAN)) then table.insert(plrs, #plr) end
	end
    local p = players[plrs[P_RandomKey(#plrs)+1]]
	p.mm.role = role
	p.mm.hud.roleflicker = 70
	chatprintf(p, MM_GetText(p.mm.lang, "NEWROLE_GET", message))
	return
end)

rawset(_G, "MM_PunishPlayer", function(p, msg, ban) --player (player_t), punishment message (string), ban instead of kick? (boolean)
	if (p == server) then COM_BufInsertText(server, "QUIT")
	else
		if (ban) then COM_BufInsertText(server, "BAN "..#p.." "..msg)
		else COM_BufInsertText(server, "KICK "..#p.." "..msg) end
	end
end)

rawset(_G, "MM_GetWepCfgFlags", function(role)
	if (not role) or (role < ROLE_MURDERER) or (role > ROLE_HERO) or (role == ROLE_CIVILIAN) then return 0 end
	if (PlayerCount(ROLE_CIVILIAN)) --Normal gameplay
		return wepcfgCVARs[role].value & 3
	else --Showdown Duel
		return (wepcfgCVARs[role].value >> 2) & 3
	end
end)

--
--HUD.LUA
--
rawset(_G, "V_LoadPatch", function(v, patch)
	assert(v, "V_LoadPatch() argument #1: Video drawer object expected")
	assert(patch, "V_LoadPatch() argument #2: Patch graphic expected")
	if (type(patch) != "string") then error("V_LoadCharset() argument #2: Patch graphic name expected in string type") end

	if (MM.debug and MM.graphics[patch]) print("\x87Patch \x81"..patch.."\x87 is already loaded into memory") end
	MM.graphics[patch] = v.cachePatch(patch)
	if (MM.debug) print("Loaded patch \x81"..patch) end
end)

rawset(_G, "V_UnloadPatch", function(patch)
	assert(patch, "V_UnloadPatch() argument #1: Patch graphic expected")
	if (type(patch) != "string") then error("V_UnloadCharset() argument #1: Patch graphic name expected in string type") end

	if (MM.graphics[patch])
		MM.graphics[patch] = nil
		if (MM.debug) print("Unloaded patch \x81"..patch) end
	else
		if (MM.debug) print("\x87Trying to unload patch \x81"..patch.."\x87 that is not in the memory!") end
	end
end)

rawset(_G, "V_LoadCharset", function(v, name)
	assert(v, "V_LoadCharset() argument #1: Video drawer object expected")
	assert(name, "V_LoadCharset() argument #2: Character Set prefix name expected")
	if (type(name) != "string") then error("V_LoadCharset() argument #2: Character Set prefix name expected in string type") end
	assert(MM.graphics, "MM.graphics table is not initialized!")

	if (not MM.graphics.charset) then MM.graphics.charset = {} end

	local patchname
	for i = 33, 255 do
		patchname = name..string.format("%03d", i)
		if (v.patchExists(patchname))
			MM.graphics.charset[i] = v.cachePatch(patchname)
			if (MM.debug) print("Loaded patch \x81"..name.."\x82"..string.format("%03d", i).."\x80 into Character Table") end
		end
	end
end)

rawset(_G, "V_DrawStrASCII", function(v, x, y, str, flags, small)
	--Draw strings in Murder Mystery format with swapable ASCII table

	assert(v, "V_DrawStrASCII() argument #1: Video drawer object expected")
	if (not str) or (type(str) != "string") error("V_DrawStrASCII() argument #5: string expected") end

	if (small) small = 1
	else small = 0 end

	local x = x or 0
	local y = y or 0
	local flg = flags or 0

	--if the string has no Extended ASCII symbols and is meant to be printed in normal size
	--use SRB2 built-in function instead (it should be faster)
	if (isStandartASCII(str))
		if (small) v.drawString(x, y, str, flg|V_ALLOWLOWERCASE, "small")
		else v.drawString(x, y, str, flg|V_ALLOWLOWERCASE) end
		return
	end

	--set the characer encoding
	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.charset, "MM.graphics.charset table is not initialized!")

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & V_MONOSPACE) spaceSize = 8
	elseif (flg & V_6WIDTHSPACE) spaceSize = 6 end

	--scale down if we want x0.5 font
	spaceSize = $ >> small

	--character position
	local cx = x
	local cy = y --leftover from the older code, used as an alias

	--init variables
	local chr
	local width
	local color = v.getStringColormap(0) --default to white color
	
	--draw the string
	for i = 1, #str do
		chr = string.byte(str:sub(i,i)) --numeric value of the single character

		--characters from 0x10 to 0x1F (16 - 31 in decimal) set the color
		if ((chr > 0x0F) and (chr < 0x20)) then color = v.getStringColormap((chr - 16) << 12) end --(chr - 16) * 4096

		--print the character
		if (chr > 0x20)
			if (MM.graphics.charset[chr])
				width = MM.graphics.charset[chr].width
				v.drawScaled((cx << FRACBITS), (cy << FRACBITS), (FU >> small), MM.graphics.charset[chr], flg, color)
			else --unknown symbol/patch not found, print "?"
				width = MM.graphics.charset[63].width --it should be 8, but we'll assume that STCFN font was replaced by an external add-on
				v.drawScaled((cx << FRACBITS), (cy << FRACBITS), (FU >> small), MM.graphics.charset[63], flg, color)
			end
		end

		--shift position for the next character
		if (chr == 0x20) then cx = $ + spaceSize --space has a different character width
		elseif (chr > 0x20) then cx = $ + (width >> small) end --it's a regular character
	end
end)

rawset(_G, "V_ConvertStringColor", function(str)
	--convert string color codes from SRB2 to MM format

	local strng = {}
	local chr
	for i = 1, #str
		chr = string.byte(str:sub(i,i))
		if (chr >= 128) then strng[i] = string.char(((chr & 0x7F) & 0x0F) + 0x0F)
		else strng[i] = str:sub(i,i) end
	end
	return table.concat(strng)
end)

rawset(_G, "V_ConvertStringColor2", function(str)
	--convert string color codes from MM to SRB2 format

	local strng = {}
	local chr
	for i = 1, #str
		chr = string.byte(str:sub(i,i))
		if ((chr >= 16) and (chr < 32)) then strng[i] = string.char((chr - 0x0F) + 0x80)
		else strng[i] = str:sub(i,i) end
	end
	return table.concat(strng)
end)

rawset(_G, "V_StrWidthASCII", function(str, flags, small)
	--Get string width for the V_DrawStrASCII() function

	if (not str) or (str == "") return 0 end

	if (small) small = 1
	else small = 0 end

	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.charset, "MM.graphics.charset table is not initialized!")

	--symbol width
	local flg = flags or 0
	local pixelLen = 0

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & V_MONOSPACE) then spaceSize = 8
	elseif (flg & V_6WIDTHSPACE) then spaceSize = 6 end

	--scale down for x0.5 (if needed)
	spaceSize = $ >> small

	local char

	for i = 1, #str do
		char = string.byte(str:sub(i, i)) --character number
		if (char == 0x20) then pixelLen = $ + spaceSize --space
		elseif ((char > 0x20) and MM.graphics.charset[char]) then --we count only visible charactrers
			pixelLen = $ + (MM.graphics.charset[char].width >> small)
		end
	end
	return pixelLen
end)

rawset(_G, "V_DrawStrASCII_Center", function(v, x, y, str, flags, small)
	V_DrawStrASCII(v, (x - (V_StrWidthASCII(str, flags, small) >> 1)), y, str, flags, small)
end)
rawset(_G, "V_DrawStrASCII_Right", function(v, x, y, str, flags, small)
	V_DrawStrASCII(v, (x - V_StrWidthASCII(str, flags, small)), y, str, flags, small)
end)

rawset(_G, "V_DrawTextPatch", function(v, x, y, xoff, yoff, patch, flags)
	--draw an image from the text data, similar to v.draw()
	--the text data itself is a table of strings containing the
	--SRB2 palette's color values
	assert(MM.graphics, "MM.graphics table is not initialized!")

	assert(v, "V_DrawTextPatch() argument #1: Video drawer object expected")
	local x = x or 0
	local y = y or 0
	local xoff = xoff or 0 --X offset
	local yoff = yoff or 0 --Y offset
	assert(patch, "V_DrawTextPatch() argument #4: patch text data expected")

	local pixelColor

	for row = 1, #patch do
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor != 0xFF) --pixel is not transparent
				v.drawFill((x - xoff + (column - 1)), (y - yoff + (row - 1)), 1, 1, pixelColor|flags) --draw it
			end
		end
	end
end)

rawset(_G, "V_TextPatch_SwapColor", function(patch, color1, color2)
	assert(patch, "V_TextPatch_SwapColor() argument #1: patch text data expected")
	local color1 = color1
	if (type(color1) == "string") color1 = color1:byte() end
	local color2 = color2
	if (type(color2) == "string") color2 = color2:byte() end

	local ptch = {} --the returned copy
	local pixelColor

	for row = 1, #patch do
		ptch[row] = patch[row] --copy line from original to copy
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor == color1) --is this the pixel we want to replace?
				ptch[row] = $:sub(1, column - 1) .. string.char(color2) .. $:sub(column + 1) --swap the color
			end
		end
	end

	return ptch
end)

rawset(_G, "V_GetTextPatchOffsetX", function(lang, patchname)
	if (MM.text[lang][patchname.."_INFO"]) and (MM.text[lang][patchname.."_INFO"].xoff)
		return MM.text[lang][patchname.."_INFO"].xoff
	else
		return 0
	end
end)
rawset(_G, "V_GetTextPatchOffsetY", function(lang, patchname)
	if (MM.text[lang][patchname.."_INFO"]) and (MM.text[lang][patchname.."_INFO"].yoff)
		return MM.text[lang][patchname.."_INFO"].yoff
	else
		return 0
	end
end)

rawset(_G, "V_TextPatchWidth", function(patch)
	assert(patch, "V_TextPatchWidth() argument #1: patch text data expected")
	local width = 0

	for row = 1, #patch do
		if (#patch[row] > width) then width = #patch[row] end
	end

	return width
end)

--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_ScrollTextPatch_Vertical", function(patch, offset, side)
	assert(patch, "V_ShiftTextPatch() argument #1: patch text data expected")
	if ((offset == nil) or (offset < 1)) then error("V_ShiftTextPatch() argument #2: positive offset value expected") end

	local buffer = {}

	for line = 1, #patch do
		buffer[line] = ""
		if (side)
			for i = offset, 1, -1 do
				buffer[line] = $..patch[line]:sub(i, i)
			end
			for i = #patch[line], (offset + 1), -1 do
				buffer[line] = $..patch[line]:sub(i, i)
			end
		else
			for i = offset, #patch[line] do
				buffer[line] = $..patch[line]:sub(i, i)
			end
			for i = 1, (offset - 1) do
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)

--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_CropTextPatch", function(patch, startColumn, endColumn, startLine, endLine)
	assert(patch, "V_CropTextPatch() argument #1: patch text data expected")
	if (startColumn < 0) then error("V_CropTextPatch() argument #2: positive starting column position value expected") end
	if (endColumn < 0) then error("V_CropTextPatch() argument #3: positive ending column position value expected") end
	if (startLine < 0) then error("V_CropTextPatch() argument #4: positive starting line position value expected") end
	if (endLine < 0) then error("V_CropTextPatch() argument #5: positive ending line position value expected") end

	if (not startColumn) then startColumn = 1 end
	if (not endColumn) then endColumn = 1 end
	if (not startLine) then startLine = 1 end
	if (not endLine) then endLine = 1 end

	local buffer = {}

	for line = startLine, #patch do
		if (line == endLine) then break end
		buffer[line] = ""
		for i = startColumn, #patch[line] do
			if (i <= width) then
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)

--Perfomance heavy Text Patch manipulation function!
--Useful only for the static images!
rawset(_G, "V_CropTextPatch_Relative", function(patch, startColumn, width, startLine, height)
	assert(patch, "V_CropTextPatch_Relative() argument #1: patch text data expected")
	if (not startColumn) then startColumn = 1 end
	if (not width) then width = V_TextPatchWidth(patch) end
	if (not startLine) then startLine = 1 end
	if (not height) then height = #patch end

	if (startColumn < 0) then error("V_CropTextPatch_Relative() argument #2: positive starting column position value expected") end
	if (width < 0) then error("V_CropTextPatch_Relative() argument #3: positive width value expected") end
	if (startLine < 0) then error("V_CropTextPatch_Relative() argument #4: positive starting line position value expected") end
	if (height < 0) then error("V_CropTextPatch_Relative() argument #5: positive height value expected") end

	local buffer = {}
	local x = 0
	local y = 0

	for line = startLine, #patch do
		y = $ + 1
		if (y > height) then break end
		buffer[line] = ""
		x = 0
		for i = startColumn, #patch[line] do
			x = $ + 1
			if (x <= width) then
				buffer[line] = $..patch[line]:sub(i, i)
			end
		end
	end

	return buffer
end)


--
--MINIGAME.LUA
--
rawset(_G, "PONG_GetMySlot", function(p)
	assert(p, "PONG_GetMysSlot(): player_t not given!")
	if (not MM.duelplrs) return end
	for i = 1, 2 do if (MM.duelplrs[i] == p) then return i end end
end)

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
--GLOBAL
--

--spawn Sheriff Emerald
rawset(_G, "MM_SpawnSHREMD", function(x, y, z, timezone)
	if (x == nil) or (y == nil) or (z == nil) error("Not enough arguments for MM_SpawnSHREMD(int x, int y, int z, [int timezone])") end
	local mo = P_SpawnMobj(x ,y, z, MT_SHREMD)
	if (timezone) mo.timezone = timezone end
	table.insert(MM.shremds, (#MM.shremds + 1), mo)
end)

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

rawset(_G, "isExtendedASCII", function(str)
	--does string contain Extended ASCII symbols? (0x80 - 0xFF)
	for CharID = 1, #str do
		if (string.byte(str:sub(CharID, CharID)) >= 128) then return true end
	end
	return false
end)
rawset(_G, "isStandartASCII", function(str)
	--is the whole string made of Standart ASCII symbols which are printable? (0x20 - 0x7F)
	local CharCode
	for CharID = 1, #str do
		CharCode = string.byte(str:sub(CharID, CharID))
		if ((CharCode < 32) or (CharCode >= 128)) then return false end
	end
	return true
end)

rawset(_G, "valid", function(arg)
	return (arg and arg.valid)
end)

rawset(_G, "SOC_IsTrue", function(arg)
	if (not arg) then return false end
	if (arg:upper() == "TRUE") or (arg == "1") then return true
	else return false end
end)

rawset(_G, "WordWrapString", function(s, x) --https://stackoverflow.com/questions/35006931/lua-line-breaks-in-strings
	if (not s) return {} end
	x = x or 38
	local t = {""}
	local function cleanse(s) return s:gsub("@x%d%d%d",""):gsub("@r","") end
	for prefix, word, suffix, newline in s:gmatch("([ \t]*)(%S*)([ \t]*)(\n?)") do
		if #(cleanse(t[#t])) + #prefix + #cleanse(word) > x and #t > 0 then
			table.insert(t, word..suffix) -- add new element
		else -- add to the last element
			t[#t] = t[#t]..prefix..word..suffix
		end
		if #newline > 0 then table.insert(t, "") end
	end
	return t
end)
