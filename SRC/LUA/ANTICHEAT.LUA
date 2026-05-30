-- ANTICHEAT.LUA
-- Code by LeonardoTheMutant, Re & nikoberry
--
-- A collection of anti-cheat algorithms

--"Kick Yourself"
COM_AddCommand("kys", function(p, id)
	local msg = {
		"Automap usage",
		"Usage of cheat CVAR(s)"
	}
	COM_BufInsertText(server, string.format("kick %d %s", #p, msg[tonumber(id)] or "Kicked itself"))
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
		COM_BufInsertText(consoleplayer, "KYS '1'")
	end
end)



--
-- CHEAT CVAR
--

local function Blind(str)
	MM.hud.game.flash.translucency = 10
	MM.hud.game.flash.duration = 1
	MM.hud.game.flash.color = 31
	if not (leveltime % TICRATE) then
		chatprintf(consoleplayer, str)
	end
end

local cv_fullbright = CV_FindVar("fullbrite")
local cv_secbright = CV_FindVar("r_secbright")
local cv_camclipping = CV_FindVar("cam_clipping")
local cv_forceautomap = CV_FindVar("forceautomap")
addHook("ThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) or (leveltime < TICRATE) then return end
	if (cv_fullbright) and (cv_fullbright.value) then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, "KYS '2'")
	end

	if (cv_camclipping) and (cv_camclipping.value == 0) then
		Blind("Please set \"cam_clipping\" to a value other than 0")
	end

	if (cv_forceautomap) and (cv_forceautomap.value) then
		Blind("Please disable \"forceautomap\" in your console")
	end

	if (cv_secbright) and (cv_secbright.value) then
		Blind("Please set \"r_secbright\" to 0")
	end
end)



--
-- ILLEGAL STATES
--

addHook("PlayerSpawn", function(p)
	p.oldname = p.name
end)

local cv_abilities = CV_FindVar("mm_abilities")
local cv_restrictskinchange = CV_FindVar("restrictskinchange")
addHook("PlayerThink", function(p)
	if (gametype ~= GT_LTMMURDERMYSTERY) or (leveltime < TICRATE) then return end
	if (cv_abilities) and not (cv_abilities.value) and (p.mo)
	and ((p.mo.state == S_PLAY_SPINDASH) or (p.mo.state == S_PLAY_DASH) or (p.mo.state == S_PLAY_FLY)
	or (p.mo.state == S_PLAY_GLIDE) or (p.mo.state == S_PLAY_FLOAT) or (p.mo.state == S_PLAY_FLOAT_RUN)
	or (p.mo.state == S_PLAY_TWINSPIN) or (p.mo.state == S_PLAY_MELEE_FINISH)) then
		CONS_Printf(server, string.format("\x85!!! %s has attempted to perform an illegal move !!!", p.name))
		MM.KillPlayer(p.mo, true, true)
		MM.TryEndgame()
	end

	if (p.name ~= p.oldname) and (leveltime > TICRATE)
		if (p.mm.role == ROLE_DEAD) and (MM.PlayerCount() > 2) then
			MM.PunishPlayer(p, "Do not rename when dead!", true)
		else
			p.oldname = p.name
		end
	end
end)
