-- FUNCTIONS.LUA
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Main logic functions & MM HUD Library

local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}

--
-- MM FUNCTIONS
--

MM.PlayerCount = function(role)
	local plrc = 0
	if (role)
		for p in players.iterate do if ((p.mm.role == role) and (not p.quittime)) then plrc = $ + 1 end end
	else
		for p in players.iterate do if (not p.quittime) then plrc = $ + 1 end end
	end
	return plrc
end

MM.PlayersAlive = function()
	local plrs = 0
	for p in players.iterate do if ((not p.spectator) and (not p.quittime)) then plrs = $ + 1 end end
	return plrs
end

--Player initializator
MM.InitPlayer = function(p)
	assert(p, "MM.InitPlayer(): player_t not given!")

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
end

-- how many players with same role should exist?
MM.GetRoleMultiplier = function()
	local plrcount = MM.PlayerCount()
	if (plrcount < 8) return 1
	elseif (plrcount >= 8) and (plrcount <= 14) return 2
	elseif (plrcount >= 15) and (plrcount <= 21) return 3
	elseif (plrcount >= 22) and (plrcount <= 28) return 4
	elseif (plrcount >= 29) return 5 end
end

--get the text line from the TEXT.LUA, if exists
MM.GetText = function(lang, line, param)
	if (lang)
		if (MM.text[lang])
			if (line)
				if (MM.text[lang][line])
					if (param)
						if (MM.text[lang][line][param])
							return MM.text[lang][line][param]
						else
							if (MM.debug) error("\x82Tried to access value at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87][\x80\""..param.."\"\x87]\x82 that does not exist!\x80") end
							return "MM.text["..lang.."]["..line.."]["..param.."]"
						end
					end
					if (type(MM.text[lang][line]) == "string")
						return MM.text[lang][line]
					else
						if (MM.debug) error("\x82Tried to access the table at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87]\x82 without parameter!\x80") end
						return "MM.text["..lang.."]["..line.."][nil]"
					end
				else
					if (MM.debug) error("\x82Tried to access value at \x87MM.text[\x80\""..lang.."\"\x87][\x80\""..line.."\"\x87]\x82 that does not exist!\x80") end
					return "MM.text["..lang.."]["..line.."]"
				end
			end
		else
			if (MM.debug) error("\x82Tried to access the \x87MM.text\x82 table with \x80"..lang.."\x82 language that does not exist!\x80") end
			return "MM.text["..lang.."]"
		end
	end
	return ""
end

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
MM.AssignRoles = function()
	if (gametype != GT_LTMMURDERMYSTERY) return end

	-- Take care of the lonely player
	if (MM.PlayerCount() < 2)
		for p in players.iterate do p.mm.role = nil end
		return
	end

	local plrs = {} --table of player nodes that exist and are valid
	for p in players.iterate --prepare players and get their player nodes
		p.mm.role = ROLE_NONE
		table.insert(plrs, #p)
	end
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign Murderers and Sheriffs
        for i = 1, MM.GetRoleMultiplier()
            local randPlr = P_RandomKey(#plrs) + 1 --select random player
            players[plrs[randPlr]].mm.role = r --assign the role to that player
            table.remove(plrs, randPlr) --and finally forget about it
        end
    end
	--tell each player its role personally
	for p in players.iterate
		if (p.mm.role == ROLE_NONE) p.mm.role = ROLE_CIVILIAN end --we previously didn't make Innos so make them now
		chatprintf(p, MM.GetText(p.mm.lang, "ROLE_GET", p.mm.role))
		p.mm.hud.roleflicker = 105 --timer for role name flickering on HUD
	end
end

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
MM.ChatprintGlobal = function(msg, var)
	for p in players.iterate
		if ((msg == "MURD_KILLED") or (msg == "SHERI_KILLED") or (msg == "HERO_KILLED"))
			chatprintf(p, MM.GetText(p.mm.lang, msg, 1).." "..var.." "..MM.GetText(p.mm.lang, msg, 2))
		elseif (msg == "SHERI_KILLED_DROP")
			chatprintf(p, MM.GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." "..MM.GetText(p.mm.lang, "SHERI_KILLED", 2).." "..MM.GetText(p.mm.lang, "SHERI_KILLED", 3))
		elseif (msg == "MURD_DIED")
			chatprintf(p, MM.GetText(p.mm.lang, "MURD_KILLED", 1).." "..var.." \x80"..MM.GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "SHERI_DIED")
			chatprintf(p, MM.GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." \x80"..MM.GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "HERO_DIED")
			chatprintf(p, MM.GetText(p.mm.lang, "HERO_KILLED", 1).." "..var.." \x80"..MM.GetText(p.mm.lang, "DIED_HAZARD"))
		elseif (msg == "SHERI_DIED_DROP")
			chatprintf(p, MM.GetText(p.mm.lang, "SHERI_KILLED", 1).." "..var.." \x80"..MM.GetText(p.mm.lang, "DIED_HAZARD")..". "..MM.GetText(p.mm.lang, "SHERI_KILLED", 3))
		elseif ((msg == "LAST_QUIT") or (msg == "ONE_QUIT") or (msg == "REPLACE_QUIT"))
			if (var != ROLE_HERO) then chatprintf(p, MM.GetText(p.mm.lang, msg, var)) --for Murd and Sheri
			else chatprintf(p, MM.GetText(p.mm.lang, msg, 3)) end --for Hero
		elseif (msg == "WIN")
			chatprintf(p, MM.GetText(p.mm.lang, "ENDROUND", var))
		elseif msg
			chatprintf(p, MM.GetText(p.mm.lang, msg, var))
		end
	end
end

MM.IsTimelineCorrect = function(timezone1, timezone2)
	return ((timezone1 == TIMEZONE_PAST) and (timezone2 >= TIMEZONE_PAST))
		or ((timezone1 == TIMEZONE_PRESENT) and (timezone2 >= TIMEZONE_PRESENT))
		or (timezone1 == TIMEZONE_FUTURE_BAD) and (timezone2 == TIMEZONE_FUTURE_BAD)
		or (timezone1 == TIMEZONE_FUTURE_GOOD) and (timezone2 == TIMEZONE_FUTURE_GOOD)
end

--Skeleton Body spawn (exclusive for MAPKD ("East City"))
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

--spawn Sheriff Emerald
MM.SpawnSHREMD = function(x, y, z, timezone)
	if (x == nil) or (y == nil) or (z == nil) error("Not enough arguments for MM.SpawnSHREMD(int x, int y, int z, [int timezone])") end
	local mo = P_SpawnMobj(x ,y, z, MT_SHREMD)
	if (timezone) mo.timezone = timezone end
	table.insert(MM.shremds, (#MM.shremds + 1), mo)
end

MM.KillPlayerByPlayer = function(p, k) --player, killer (both MOBJ_T)
	if ((not p) or (not p.player)) error("MM.KillPlayerByPlayer() argument #1: player's mobj_t expected") end
	if ((not k) or (not k.player)) error("MM.KillPlayerByPlayer() argument #2: killer player's mobj_t expected") end
	local plr = p.player
	plr.spectator = true
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_NONE
	MM.StartFlashFX(plr, 4, 0x23) --Red flash effect
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
	else body.state = S_MMSKELT end --skeleton, fallback for custom chars
	body.color = p.color

	if (plr.mm.timetravel.timezone) then MM.SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end

	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end

MM.KillPlayerByHazard = function(p, spawnbody) --player (mobt_t), "Spawn dead body?" (boolean)
	if ((not p) or (not p.player)) error("MM.KillPlayerByHazard() argument #1: player's mobj_t expected") end
	local plr = p.player
	plr.spectator = true
	plr.powers[pw_shield] = 0
	plr.mm.role = ROLE_NONE
	MM.StartFlashFX(plr, 4, 0x23) --Red flash effect
	plr.mm.killername = "your stupidity"

	if (spawnbody)
		local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
		if (p.skin == "sonic") body.state = S_SMMDEAD
		elseif (p.skin == "tails") body.state = S_TMMDEAD
		elseif (p.skin == "knuckles") body.state = S_KMMDEAD
		elseif (p.skin == "amy") body.state = S_AMMDEAD
		elseif (p.skin == "fang") body.state = S_FMMDEAD
		elseif (p.skin == "metalsonic") body.state = S_MMMDEAD
		elseif (p.skin == "superguide") body.state = S_GMMDEAD
		elseif (p.skin == "bob") body.state = S_BMMDEAD
		else body.state = S_MMSKELT end --skeleton, fallback for custom chars
		body.color = p.color

		if (plr.mm.timetravel.timezone) then MM.SpawnSkeletonBody(p, plr.mm.timetravel.timezone) end
	else
		S_StartSound(p, sfx_altdi1) --play global death sound
	end
	
	S_StartSound(nil, MM.death_sfx[P_RandomKey(#MM.death_sfx) + 1], plr) --play random death sound personally
end

MM.TeammatesCount = function(p)
	local teammates = false

	if (p.mm.role == ROLE_MURDERER)
		teammates = MM.PlayerCount(ROLE_MURDERER) - 1 
	elseif (p.mm.role == ROLE_SHERIFF)
		teammates = (MM.PlayerCount(ROLE_SHERIFF) - 1) + MM.PlayerCount(ROLE_HERO)
	elseif (p.mm.role == ROLE_HERO)
		teammates = MM.PlayerCount(ROLE_SHERIFF) + (MM.PlayerCount(ROLE_HERO) - 1)
	end

	return teammates
end

MM.AreTeammates = function(p1, p2)
	if ((not p1.mm.role) or (not p2.mm.role)) then return false end

	return ((p1.mm.role == ROLE_MURDERER) and (p2.mm.role == ROLE_MURDERER))
		or (((p1.mm.role == ROLE_SHERIFF) or (p1.mm.role == ROLE_HERO)) and ((p2.mm.role == ROLE_SHERIFF) or (p2.mm.role == ROLE_HERO)))
end

MM.HitTeammate = function(v, a)
	chatprintf(a, MM.RoleColor[v.mm.role]..MM.GetText(a.mm.lang, "TEAMMATE_HIT", 1))
	chatprintf(v, MM.RoleColor[a.mm.role]..MM.GetText(v.mm.lang, "TEAMMATE_HIT", 2))
	P_DoPlayerPain(v)
	P_PlayerWeaponAmmoBurst(v)
	v.powers[pw_flashing] = 105 --3 seconds
end

MM.PlayerQuit = function(p)
	if (p.mm.role == ROLE_MURDERER)
		p.mm.role = ROLE_NONE
		if ((not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_MURDERER))) or ((MM.PlayerCount(ROLE_CIVILIAN) == 1) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_MURDERER)))
			MM.EndRound(0, "LAST_QUIT", ROLE_MURDERER)
		elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_MURDERER)))
			MM.ChatprintGlobal("REPLACE_QUIT", ROLE_MURDERER)
			MM.SetRandomInnoAs(ROLE_MURDERER, 1)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer replaced") end
		else
			MM.ChatprintGlobal("ONE_QUIT", ROLE_MURDERER)
			if (isdedicatedserver) CONS_Printf(server, "- Murderer left") end
		end
	elseif (p.mm.role == ROLE_SHERIFF)
		p.mm.role = ROLE_NONE
		if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF))
			if (MM.PlayerCount(ROLE_HERO)) then MM.ChatprintGlobal("LAST_QUIT", ROLE_SHERIFF)
			else MM.EndRound(0, "LAST_QUIT", ROLE_SHERIFF) end
		elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_SHERIFF)))
			MM.ChatprintGlobal("REPLACE_QUIT", ROLE_SHERIFF)
			MM.SetRandomInnoAs(ROLE_SHERIFF, 2)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff replaced") end
		else
			MM.ChatprintGlobal("ONE_QUIT", ROLE_SHERIFF)
			if (isdedicatedserver) CONS_Printf(server,"- Sheriff left") end
		end
	elseif (p.mm.role == ROLE_HERO)
		p.mm.role = ROLE_NONE
		if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_HERO))
			if (MM.PlayerCount(ROLE_SHERIFF)) then MM.ChatprintGlobal("LAST_QUIT", ROLE_HERO)
			else MM.EndRound(0, "LAST_QUIT", ROLE_HERO) end
		elseif (MM.PlayerCount(ROLE_CIVILIAN) and (not MM.PlayerCount(ROLE_HERO)) and (not MM.PlayerCount(ROLE_SHERIFF)))
			MM.ChatprintGlobal("REPLACE_QUIT", ROLE_HERO)
			MM.SetRandomInnoAs(ROLE_HERO, 3)
			if (isdedicatedserver) CONS_Printf(server, "- Hero replaced") end
		else
			MM.ChatprintGlobal("ONE_QUIT", ROLE_HERO)
			if (isdedicatedserver) CONS_Printf(server, "- Hero left") end
		end
	elseif (p.mm.role == ROLE_CIVILIAN)
		p.mm.role = ROLE_NONE
		if (not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO))
			MM.EndRound(0, "LAST_QUIT", 3) --The Civilian has left the game where he was the last hope, we will still consider him as the Hero
		end
	end

	--If player was one of the PONG rivals, forget about him
	local myslot = PONG_GetMySlot(p)
	if (myslot) then MM.duelplrs[myslot] = nil end

	MM.StartSuspenseMusic()
	MM.StartShowdownMusic()
end

MM.StartFlashFX = function(p, duration, color)
	assert(p, "MM.StartFlashFX argument #1: player_t not given!")
	assert(p.mm, "MM.StartFlashFX argument #1: player_t.mm table is not initialized!")
	assert(p.mm.hud, "MM.StartFlashFX argument #1: player_t.mm.hud table is not initialized!")
	assert(duration, "MM.StartFlashFX argument #2: Effect duration time is not specified")
	if (type(duration) != "number") then error("MM.StartFlashFX argument #2: The value of the effect duration must be a number") end
	if (color and (type(color) != "number")) then error("MM.StartFlashFX argument #3: The value of the effect's color must be a number") end

	color = color or 0

	p.mm.hud.fx_translucency = 10
	p.mm.hud.fx_duration = duration
	p.mm.hud.fx_color = color
end

--Function to end the round, arguments here:
--possible values for the winner of the game are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat (taken from the MM.text)
--reason is used differently for each endtext message but usualy it is a win reason (WIN_* constant)
MM.EndRound = function(winner, endtext, reason)
	MM.winner = winner
	if (endtext == "WIN") then MM.winreason = reason end
	MM.shwdwn = false
	MM.susnse = false
	G_ExitLevel()
	if (endtext) MM.ChatprintGlobal(endtext, reason) end
	if (isdedicatedserver) --console log for dedicated host
		if (endtext == "WIN") then CONS_Printf(server, "- "..MM.GetText("EN", "ENDROUND", reason))
		else CONS_Printf(server, "- "..MM.GetText("EN", endtext, reason)) end
	end
end

--Enable Suspense music when there are no Sheriffs & Heroes left but one Innocent and at least one dropped Sheriff's Emerald
MM.StartSuspenseMusic = function()
	if (not MM.PlayerCount(ROLE_SHERIFF)) and (not MM.PlayerCount(ROLE_HERO)) and (MM.PlayerCount(ROLE_CIVILIAN) == 1) and ((#MM.shremds and not wepcfgCVARs[ROLE_CIVILIAN].value) or (wepcfgCVARs[ROLE_CIVILIAN].value))
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

--Enable Showdown music when there are no innocents left
MM.StartShowdownMusic = function()
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

MM.SetRandomInnoAs = function(role, message)
	local plrs = {}
	for plr in players.iterate
		if ((not plr.spectator) and (plr.mm.role == ROLE_CIVILIAN)) then table.insert(plrs, #plr) end
	end
    local p = players[plrs[P_RandomKey(#plrs)+1]]
	p.mm.role = role
	p.mm.hud.roleflicker = 70
	chatprintf(p, MM.GetText(p.mm.lang, "NEWROLE_GET", message))
	return
end

MM.PunishPlayer = function(p, msg, ban) --player (player_t), punishment message (string), ban instead of kick? (boolean)
	if (p == server) then COM_BufInsertText(server, "QUIT")
	else
		if (ban) then COM_BufInsertText(server, "BAN "..#p.." "..msg)
		else COM_BufInsertText(server, "KICK "..#p.." "..msg) end
	end
end

MM.GetWepCfgFlags = function(role)
	if (not role) or (role < ROLE_MURDERER) or (role > ROLE_HERO) or (role == ROLE_CIVILIAN) then return 0 end
	if (MM.PlayerCount(ROLE_CIVILIAN)) --Normal gameplay
		return wepcfgCVARs[role].value & 3
	else --Showdown Duel
		return (wepcfgCVARs[role].value >> 2) & 3
	end
end



--
-- MINIGAME.LUA
--
rawset(_G, "PONG_GetMySlot", function(p)
	assert(p, "PONG_GetMySlot(): player_t not given!")
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
-- UTF-8 LIBRARY
--
-- https://github.com/blitmap/lua-utf8-simple

rawset(_G, "utf8", {})
local pattern = '[%z\1-\127\194-\244][\128-\191]*'

-- helper function
local posrelat = function (pos, len)
	if (pos < 0) then pos = len + pos + 1 end
	return pos
end

-- THE MEAT

-- maps f over s's utf8 characters f can accept args: (visual_index, utf8_character, byte_index)
utf8.map = function(s, f, no_subs)
	local i = 0

	if no_subs then
		for b, e in s:gmatch('()' .. pattern .. '()') do
			i = i + 1
			local c = e - b
			f(i, c, b)
		end
	else
		for b, c in s:gmatch('()(' .. pattern .. ')') do
			i = i + 1
			f(i, c, b)
		end
	end
end

-- THE REST

-- generator for the above -- to iterate over all utf8 chars
utf8.chars = function(s, no_subs)
	return coroutine.wrap(function () return utf8.map(s, coroutine.yield, no_subs) end)
end

-- returns the number of characters in a UTF-8 string
utf8.len = function(s)
	-- count the number of non-continuing bytes
	return select(2, s:gsub('[^\128-\193]', ''))
end

-- replace all utf8 chars with mapping
utf8.replace = function(s, map)
	return s:gsub(pattern, map)
end

-- reverse a utf8 string
utf8.reverse = function(s)
	-- reverse the individual greater-than-single-byte characters
	s = s:gsub(pattern, function (c) return #c > 1 and c:reverse() end)

	return s:reverse()
end

-- strip non-ascii characters from a utf8 string
utf8.strip = function(s)
	return s:gsub(pattern, function (c) return #c > 1 and '' end)
end

-- like string.sub() but i, j are utf8 strings
-- a utf8-safe string.sub()
utf8.sub = function(s, i, j)
	local l = utf8.len(s)

	i =       posrelat(i, l)
	j = j and posrelat(j, l) or l

	if (i < 1) then i = 1 end
	if (j > l) then j = l end

	if (i > j) then return '' end

	local diff = j - i
	local iter = utf8.chars(s, true)

	-- advance up to i
	for _ = 1, i - 1 do iter() end

	local c, b = select(2, iter())

	-- i and j are the same, single-charaacter sub
	if (not diff) then
		return string.sub(s, b, b + c - 1)
	end

	i = b

	-- advance up to j
	for _ = 1, diff - 1 do iter() end

	c, b = select(2, iter())

	return string.sub(s, i, b + c - 1)
end

--https://stackoverflow.com/questions/24190608/lua-string-byte-for-non-ascii-characters
--Return an integer value of a single Unicode symbol
utf8.byte = function(char)
    local b1, b2 = char:byte(1, 2)
    local b3, b4 = char:byte(3, 4)
    if (b1 < 128) then return b1 --b1 is less than 128, it's a single-byte character
    elseif (b1 < 194) then return nil
    elseif (b1 < 224) then return (b1 - 192) * 64 + (b2 - 128)
    elseif (b1 < 240) then return (b1 - 192) * 64 + (b2 - 128)
    elseif (b1 < 245) then return (b1 - 240) * 262144 + (b2 - 128) * 4096 + (b3 - 128) * 64 + (b4 - 128)
	else return nil end
end

--Iterator function that returns integer values of all symbols in the string
--ChatGPT helped with this one
utf8.bytes = function(str)
	local pos = 1
	local isTextCode = false

    return function()
        if (pos > #str) then return nil end

        local b1 = string.byte(str, pos)
		local bytes = 0
		local codepoint

        --"Next byte is an SRB2 text code" (Start of Header)
        if (b1 == 0x01) then
			pos = $ + 1
			if (pos <= #str) then
				isTextCode = true
                return b1 --return 1
            else
                error("Encountered SOH (\"Start of Header\", 0x01) character at the very end of the string")
            end
		elseif (isTextCode) then --Text color code
			pos = $ + 1
			isTextCode = false
			return b1
		elseif (b1 == 0x04) then --Text Formatting reset (End of Transmission)
            pos = pos + 1
            return b1 --return 4
		elseif (b1 < 0x80) then
            -- 1-byte ASCII (U+0000 - U+007F)
            codepoint = b1
            bytes = 1

        -- 2-byte UTF-8
		elseif (b1 >= 0xC2) and (b1 <= 0xDF) then
			local b2 = str:byte(pos + 1)
			if (b2 and (b2 >= 0x80) and (b2 <= 0xBF)) then
				codepoint = ((b1 & 0x1F) << 6) | (b2 & 0x3F)
				bytes = 2
			else
				codepoint = 0xFFFD
				bytes = 1
			end

		-- 3-byte UTF-8
		elseif (b1 >= 0xE0) and (b1 <= 0xEF) then
			local b2 = str:byte(pos + 1)
			local b3 = str:byte(pos + 2)
			if (b2 and b3 and ((b2 >= 0x80) and (b2 <= 0xBF)) and ((b3 >= 0x80) and (b3 <= 0xBF))) then
				codepoint = ((b1 & 0x0F) << 12) | ((b2 & 0x3F) << 6) | (b3 & 0x3F)
				bytes = 3

				-- Reject UTF-16 surrogate pairs (U+D800–DFFF)
				if ((codepoint >= 0xD800) and (codepoint <= 0xDFFF)) then
					codepoint = 0xFFFD
					bytes = 3
				end
			else
				codepoint = 0xFFFD
				bytes = 1
			end
        else --Malformed sequence
            codepoint = 0xFFFD
            bytes = 1
        end

        pos = $ + bytes
        return codepoint
    end
end



--
-- MM HUD LIBRARY
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
	if (type(patch) != "string") then error("V_UnloadPatch() argument #1: Patch graphic name expected in string type") end

	if (MM.graphics[patch])
		MM.graphics[patch] = nil
		if (MM.debug) print("Unloaded patch \x81"..patch) end
	else
		if (MM.debug) print("\x87Trying to unload patch \x81"..patch.."\x87 that is not in the memory!") end
	end
end)

--UNICODE STRING RENDERER

rawset(_G, "V_LoadUnicode", function(v, a, b)
	assert(v, "V_LoadUnicode() argument #1: Video drawer object expected")
	--assert(a, "V_LoadUnicode() argument #2: Start index integer expected")
	--assert(b, "V_LoadUnicode() argument #2: End index integer expected")
	--if ((type(a) != "number") or (type(b) != "number")) then error("V_LoadUnicode() argument #2 & #3: Start & End indexes should be integer") end
	assert(MM.graphics, "MM.graphics table is not initialized!")

	if (not MM.graphics.unicode) then MM.graphics.unicode = {} end

	local patchname
	a = a or 0x10
	b = b or 0xFFFF
	for i = a, b do
		patchname = "UNIC"..string.format("%04X", i)
		if (v.patchExists(patchname))
			MM.graphics.unicode[i] = v.cachePatch(patchname)
			if (MM.debug) print("Loaded patch \x81UNIC\x82"..string.format("%04X", i).."\x80 into the Unicode Character Table") end
		end
	end
end)

rawset(_G, "V_DrawStrUnicode", function(v, x, y, str, flags, small)
	--Draw strings encoded in UTF-8 formatting
	--The function mostly assumes you have font with 8x8 pixel characters

	assert(v, "V_DrawStrUnicode() argument #1: Video drawer object expected")
	if (not str) or (type(str) != "string") error("V_DrawStrUnicode() argument #5: string expected") end

	if (small) small = 1
	else small = 0 end

	local x = x or 0
	local y = y or 0
	local flg = flags or 0

	--set the characer encoding
	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.unicode, "MM.graphics.unicode table is not initialized!")

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
	local isTextCode = false
	local color = v.getStringColormap(0) --default to white color
	local translucency = 0
	
	--draw the string
	for chr in utf8.bytes(str) do

		--SOH (Start of Header)
		--Tell the interpreter "Hey, the next character is not a unicode symbol but a text code to change the color & translucency!"
		if (chr == 0x01)
			isTextCode = true
			continue
		end

		--EOH (End of Transmission), clear the text formating
		if (chr == 0x04)
			color = v.getStringColormap(0)
			translucency = 0
			continue
		end

		--newline
		if (chr == 0x0A)
			cx = x --carriage return
			cy = $ + (8 >> small)
		end

		--characters from 0x80 to 0xFF (128 - 255 in decimal) set the color AND translucency
		if ((chr >= 0x80) and (chr <= 0xFF) and isTextCode) then
			color = v.getStringColormap((chr & 0x7F & 0x0F) << 12)
			translucency = ((chr - 0x80) >> 4) << 16
			isTextCode = false
			continue
		end

		--draw the character
		if ((chr > 0x0F) and (chr != 0x20))
			if (not MM.graphics.unicode[chr]) then chr = 0xFFFD end --if character is not found in the graphics table, replace the character with the "Replacement Character" (U+FFFD)
			v.drawScaled((cx << FRACBITS), (cy << FRACBITS), (FU >> small), MM.graphics.unicode[chr], flg|translucency, color)
		end

		--shift position for the next character
		if (chr == 0x20) then cx = $ + spaceSize --space has a different character width
		else
			if (chr > 0x0F) then cx = $ + (MM.graphics.unicode[chr].width >> small) end --it's a regular character
		end
	end
end)

rawset(_G, "V_StrWidthUnicode", function(str, flags, small)
	--Get string width for the V_DrawStrUnicode() function

	if (not str) or (str == "") return 0 end

	if (small) small = 1
	else small = 0 end

	assert(MM.graphics, "MM.graphics table is not initialized!")
	assert(MM.graphics.unicode, "MM.graphics.unicode table is not initialized!")

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

	for char in utf8.bytes(str)
		if (char == 0x20) then pixelLen = $ + spaceSize --space
		elseif ((char > 0x20) and MM.graphics.unicode[char]) then --we count only visible charactrers
			pixelLen = $ + (MM.graphics.unicode[char].width >> small)
		end
	end
	return pixelLen
end)

rawset(_G, "V_DrawStrUnicode_Center", function(v, x, y, str, flags, small)
	V_DrawStrUnicode(v, (x - (V_StrWidthUnicode(str, flags, small) >> 1)), y, str, flags, small)
end)
rawset(_G, "V_DrawStrUnicode_Right", function(v, x, y, str, flags, small)
	V_DrawStrUnicode(v, (x - V_StrWidthUnicode(str, flags, small)), y, str, flags, small)
end)

--TEXT PATCH RENDERING & MANIPULATION

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

--Word wrapper, assisted with ChatGPT
--Although he gave a direction, I had to spend a lot of time fixing the crap code he suggested
--I know there are still bugs in this code, with color code wrapping to be precise, but I really could not figure them out
rawset(_G, "V_WordWrapString", function(s, max_width)
	local lines = {}
	local current_line = ""
	local current_word = ""
	local visible_len = 0
	local word_len = 0

	local textcodes = ""

	local i = 1 --iterator

	while (i <= #s)
		local b1 = s:byte(i)

		-- Set formatting (SOH, Start of Header)
		if ((b1 == 0x01) and (i < #s)) then
			i = $ + 1 --skip a byte
			textcodes = "\1" .. s:sub(i, i)
			current_line = $ .. current_word .. textcodes
			visible_len = $ + word_len
			current_word = ""
			word_len = 0

		-- Reset formatting (EOT, End of Text)
		elseif (b1 == 0x04) then
			current_word = $ .. string.char(0x04)
			textcodes = ""

		-- Newline ('\n')
		elseif (b1 == 0x0A) then
			current_line = $ .. current_word --finish the current line we were doing
			table.insert(lines, current_line) --send to the buffer

			--create a new line with the currently applied text formatting
			current_line = textcodes
			current_word = ""
			visible_len = 0
			word_len = 0
			
			--Newline at the very end of the string
			if (i == #s) then table.insert(lines, "") end

		-- Space: word delimiter
		elseif (b1 == 0x20) then
			if (visible_len + word_len) > max_width then
				--reached max string length
				table.insert(lines, current_line)
				if (word_len) then current_line = textcodes .. current_word .. " "
				else current_line = textcodes end
				visible_len = word_len + 1
			else
				--continue the current line
				current_line = $ .. current_word .. " "
				visible_len = $ + word_len + 1
			end
			current_word = ""
			word_len = 0

		--Interpreting bytes as Unicode symbols
		--1-byte ASCII
		elseif (b1 < 0x80) then
			current_word = current_word .. s:sub(i, i)
			word_len = word_len + 1

		-- 2-byte UTF-8
		elseif ((b1 >= 0xC2) and (b1 <= 0xDF) and ((i + 1) <= #s)) then
			local b2 = s:byte(i + 1)
			if b2 and b2 >= 0x80 and b2 <= 0xBF then
				local cp = ((b1 & 0x1F) << 6) | (b2 & 0x3F)
				if (cp <= 0xFFFF) then
					current_word = current_word .. s:sub(i, i + 1)
					word_len = $ + 1
				else
					current_word = $ .. "�"
					word_len = $ + 1
				end
				i = i + 1
			else
				current_word = $ .. "�"
				word_len = $ + 1
			end

		-- 3-byte UTF-8
		elseif ((b1 >= 0xE0) and (b1 <= 0xEF) and ((i + 2) <= #s)) then
			local b2 = s:byte(i + 1)
			local b3 = s:byte(i + 2)
			if (b2 and b3 and ((b2 >= 0x80) and (b2 <= 0xBF)) and ((b3 >= 0x80) and (b3 <= 0xBF))) then
				local cp = ((b1 & 0x0F) << 12) | ((b2 & 0x3F) << 6) | (b3 & 0x3F)
				if (cp <= 0xFFFF) then
					current_word = $ .. s:sub(i, i + 2)
					word_len = $ + 1
				else
					current_word = $ .. "�"
					word_len = $ + 1
				end
				i = i + 2
			else
				current_word = $ .. "�"
				word_len = $ + 1
			end

		else
			-- invalid byte or higher multibyte char: replace with "?"
			current_word = $ .. "�"
			word_len = $ + 1
		end

		i = $ + 1
	end

	-- Handle last word
	if (#current_word) then
		if (visible_len + word_len) > max_width then
			table.insert(lines, current_line)
			current_line = textcodes .. current_word
		else
			current_line = $ .. current_word
		end
	end

	-- Add final line
	if (#current_line) then table.insert(lines, current_line) end

	return lines
end)



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

rawset(_G, "valid", function(arg)
	return (arg and arg.valid)
end)

rawset(_G, "SOC_IsTrue", function(arg)
	if (not arg) then return false end
	if (arg:upper() == "TRUE") or (arg == "1") then return true
	else return false end
end)
