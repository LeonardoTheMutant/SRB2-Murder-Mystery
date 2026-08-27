-- ANTICHEAT.LUA
-- Code by LeonardoTheMutant, Re & nikoberry
--
-- A collection of anti-cheat algorithms



-- Hi,
-- Just wanted to say, if you are a cheater - fuck you.
-- Sincerely,
-- Leo


--
-- "KICK YOURSELF"
--

enum(
	"LOVEYOURSELF",
	"KYS_KIS",
	"KYS_AUTOMAP",
	"KYS_CVAR"
)

COM_AddCommand("kys", function(p, id)
	local msg = {
		"Kicked itself",
		"Automap usage",
		"Usage of cheat CVAR(s)"
	}

	id = tonumber(id) or KYS_KIS
	if (id < 1) or (id > #msg) then return end

	COM_BufInsertText(server, string.format("kick %d %s", #p, msg[id]))
end)



--
-- AUTOMAP
--

local cv_automap1 = CV_FindVar("automapoutsidedevmode")
local cv_automap2 = CV_FindVar("tsourdt3rd_debug_automapanywhere")
local cv_automap3 = CV_FindVar("forceautomap")
addHook("KeyDown", function(keyevent)
	if (gametype == GT_LTMMURDERMYSTERY) and (keyevent.num == 9)
	and ((cv_automap1 and cv_automap1.value) or (cv_automap2 and cv_automap2.value) or (cv_automap3 and cv_automap3.value))
	then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, string.format("KYS %d", KYS_AUTOMAP))
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
local cv_renderhitbox = CV_FindVar("renderhitbox")
addHook("ThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) or (leveltime < TICRATE) or (leveltime % 4) then return end
	if (cv_fullbright) and (cv_fullbright.value) then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, string.format("KYS %d", KYS_CVAR))
	end

	if (cv_renderhitbox) and (cv_renderhitbox.value) then
		COM_BufInsertText(consoleplayer, "QUIT")
		COM_BufInsertText(consoleplayer, string.format("KYS %d", KYS_CVAR))
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

	--Remove this block when NameChange hook will become real in Vanilla
	if (not srb2classic) then
		if (p.name ~= p.oldname) and (leveltime > 105) and (p.jointime > 105) then
			if (p.mm.role == ROLE_DEAD) and (MM.PlayerCount() > 2) and not (leveltime % 4) then
				MM.PunishPlayer(p, "Do not rename when dead!")
			else
				p.oldname = p.name
			end
		end
	end
end)



--
-- RENAME LOCK
-- for 2.2.16+
--
if (srb2classic) then
	addHook("NameChange", function(p, newname)
		if (gametype ~= GT_LTMMURDERMYSTERY) then return end

		if (gamestate == GS_LEVEL) and (p.mm.role == ROLE_DEAD) and (MM.PlayerCount() > 2) then
			return false --reject rename
		end
	end)
end
