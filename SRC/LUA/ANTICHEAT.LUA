-- ANTICHEAT.LUA
-- Code by LeonardoTheMutant
--
-- A collection of anti-cheat algorithms

--"Kick Yourself"
COM_AddCommand("kys", function(p, ...)
	CONS_BufInsertText(server, string.format("kick %d %s", #p, msg or "Kicked itself")
end)

--
-- AIMBOT
--
addHook("PlayerSpawn", function(p)
	p.startangle = p.realmo.angle
end)
rawset(_G, "AimbotCheck", function(p)
	if (gametype ~= GT_LTMMURDERMYSTERY) then return false end
	for plr in players.iterate do
		if (p ~= plr) and (p.mo) and (plr.mo) then
			if (p.mo.angle == R_PointToAngle2(p.mo.x, p.mo.y, plr.mo.x, plr.mo.y)) and (p.mo.angle ~= p.startangle) then
				CONS_Printf(server, string.format("\x85!!! %s has attempted to use aimbot !!!", p.name))
				MM.KillPlayer(p.mo, true, true)
				MM.TryEndgame()
				return true
			end
		end
	end
	return false
end)



--
-- AUTOMAP
--

local cv_automap1 = CV_FindVar("automapoutsidedevmode")
local cv_automap2 = CV_FindVar("tsourdt3rd_debug_automapanywhere")
addHook("KeyDown", function(keyevent)
	if (gametype == GT_LTMMURDERMYSTERY) and (keyevent.num == 9) and ((cv_automap1 and cv_automap1.value) or (cv_automap2 and cv_automap2.value)) and (gametype == GT_LTMMURDERMYSTERY) then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, "KYS 'Automap usage'")
	end
end)



--
-- CHEAT CVAR
--
local cv_fullbrigth = CV_FindVar("fullbrite")
addHook("ThinkFrame", function()
	if (gametype == GT_LTMMURDERMYSTERY) and (cv_fullbrigth) and (cv_fullbrigth.value) and (leveltime > TICRATE) then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, "KYS 'Usage of cheat CVAR(s)'")
	end
end)



--
-- ILLEGAL MOVEMENT
--
local cv_abilities = CV_FindVar("mm_abilities")
addHook("PlayerThink", function(p)
	if (gametype == GT_LTMMURDERMYSTERY) and (cv_abilities) and not (cv_abilities.value) and (p.mo)
	and ((p.mo.state == S_PLAY_SPINDASH) or (p.mo.state == S_PLAY_DASH) or (p.mo.state == S_PLAY_FLY)
	or (p.mo.state == S_PLAY_GLIDE) or (p.mo.state == S_PLAY_FLOAT) or (p.mo.state == S_PLAY_FLOAT_RUN)) then
		CONS_Printf(server, string.format("\x85!!! %s has attempted to perform an illegal move !!!", p.name))
		MM.KillPlayer(p.mo, true, true)
		MM.TryEndgame()
	end
end)
