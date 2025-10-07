-- CCMD.LUA
-- Code by LeonardoTheMutant
--
-- Code for MMHELP, MMLANG and MMSETUP console comands

local adminCVARinfo = {
	"\x87MM_ABILITIES\x80    - Switch between \x81\"Mystery\"\x80 and \x81\"Vanilla\"\x80 skin abilities mode. Default is \"Mystery\" (OFF).",
	"\x87MM_ALLOWINVINC\x80  - Allow Invincibility powerup to be used in MM.\x82 Do not enable this unless you want chaos in your game.\x80 Default value is \"NO\".",
	"\x87MM_ALLOWSHIELDS\x80 - Allow Shield powerups to be used in MM.\x82 Do not enable this unless you want chaos in your game.\x80 Default value is \"NO\".",
	"\x87MM_ALLOWSHOES\x80   - Allow Speed Sneakers powerup to be used in MM. Default value is \"NO\".",
	"\x87MM_AUTOFIRE\x80     - Turn weapon autofire ON/OFF.",
	"\x87MM_CRYPTIC\x80      - Make the game more cryptic by disabling the teammate list, player nametags and most of the player counters on HUD.",
	"\x87MM_CUSTOMSKINS\x80  - Allow the usage of the Custom Skins/Characters in MM.",
	"\x87MM_FOOTMARKS\x80    - Enable/Disable the footmarks spawning.",
	"\x87MM_KILLTRAILS\x80   - Enable/Disable the Red Footmarks (Kill Trails) after Killing a player with the knife or stepping on the dead body.",
	"\x87MM_NOCAMPING\x80    - When enabled, \x85Murderers\x80 who are camping on the \x84Sheriff's Emerald\x80 for longer than 30 seconds will be kicked.",
	"\x87MM_SPEED_SNEAK\x80  - Adjust the sneaking speed for all players. This works only when \x87MM_ABILITIES\x80 is disabled.",
	"\x87MM_SPEED_WALK\x80   - Adjust the walk speed for all players. This works only when \x87MM_ABILITIES\x80 is disabled.",
	"\x87MM_WEPCFG_MURD\x80  - Weapon Configuration for the "..MM.RoleColor[ROLE_MURDERER].."Murderer\x80 role during the Normal Gameplay and the Showdown Duel.",
	"\x87MM_WEPCFG_SHERI\x80 - Weapon Configuration for the "..MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80 role during the Normal Gameplay and the Showdown Duel.",
	"\x87MM_WEPCFG_CIVIL\x80 - Weapon Configuration for the "..MM.RoleColor[ROLE_CIVILIAN].."Civilian\x80 role. Setting this variable to\x81 1\x80 will let them use Red Ring + Knife,\x82 2\x80 forces to Knife-only.",
	"\x87MM_WEPCFG_HERO\x80  - Weapon Configuration for the "..MM.RoleColor[ROLE_HERO].."Hero\x80 role during the Normal Gameplay and the Showdown Duel.\n",
	"\x87MMSETUP\x80 - MM setup utility (in case you are lazy to manually set each CVAR for the game)"
}

local function sortOfSine(a, base)
	local b = a % (base * 2)
	if (b > (base - 1)) then return (base * 2) - b - 1
	else return b end
end


--
-- MMSETUP (Admin-only CCMD)
--

local wepcfg_option = {[0] = "All weapons", [1] = "Only Red Rings & Knife", [2] = "All weapons without Red Rings", [3] = "Knife only"}
local NoYes_option = {[0] = "No", [1] = "Yes"}
local DisableEnable_option = {[0] = "Disable", [1] = "Enable"}
local mmsetup_entries = {
	{cvar = CV_FindVar("mm_abilities"), min = 0, max = 1, values = {[0] = "MM", [1] = "SRB2"}, name = "Player abilities", description = "Switch between differemt player abilities:\nMM - Slow walk speed, no skin abilities except sneaking ability\nSRB2 - use Vanilla behaviour"},
	{cvar = CV_FindVar("mm_allowinvinc"), min = 0, max = 1, values = NoYes_option, name = "Allow Invincibility powerup", description = "Allow the usage of the Invincibility powerup during the MM game."},
	{cvar = CV_FindVar("mm_allowshields"), min = 0, max = 1, values = NoYes_option, name = "Allow any Shield powerups", description = "Allow the usage of any Shield powerups during the MM game."},
	{cvar = CV_FindVar("mm_allowshoes"), min = 0, max = 1, values = NoYes_option, name = "Allow Speed Shoes powerup", description = "Allow the usage of the Speed Shoes powerup during the MM game."},
	{cvar = CV_FindVar("mm_customskins"), min = 0, max = 1, values = NoYes_option, name = "Allow custom skins", description = "Allow players to use Custom Skins from external add-ons during\nthe MM game."},
	{cvar = CV_FindVar("mm_autofire"), min = 0, max = 1, values = {[0] = "Automatic Ring only", [1] = "All weapons"}, name = "Weapons autofire", description = "Set the autofire behaviour for all weapons in the game for every player\nAutomatic Ring only - Vanilla SRB2 bahaviour\nAll weapons - Enable autofire for all weapons."},
	{cvar = CV_FindVar("mm_cryptic"), min = 0, max = 1, values = DisableEnable_option, name = "Cryptic game", description = "Make the game more cryptic by disabling the player & teammate lists,\nplayer nametags and most of the player counters."},
	{cvar = CV_FindVar("mm_footmarks"), min = 0, max = 1, values = DisableEnable_option, name = "Player footmarks", description = "Enable/Disable the Footmarks that players leave on flat surfaces\nafter each step."},
	{cvar = CV_FindVar("mm_killtrails"), min = 0, max = 1, values = DisableEnable_option, name = "Kill trails", description = "Enable/Disable the red recolor of the footsteps after player kills\nanother player with a knife or steps on the dead body.\nPlayer footmarks must be enabled for this to work."},
	{cvar = CV_FindVar("mm_nocamping"), min = 0, max = 1, values = DisableEnable_option, name = "Anti-camp system for Murderers", description = "Murderer players being near the emerald for longer than 20 seconds\nare kicked from the game."},
	{cvar = CV_FindVar("mm_speed_sneak"), min = 1, max = 5, name = "Sneaking speed", description = "Sneaking speed."},
	{cvar = CV_FindVar("mm_speed_walk"), min = 6, max = 40, name = "Walking speed", description = "Walking speed."},
	{cvar = CV_FindVar("mm_wepcfg_murd"), min = 0, max = 3, values = wepcfg_option, name = "Normal gameplay weapons - Murderer", description = "Set weapons for the Murderer role during the normal gameplay.", valueMask = 0x3},
	{cvar = CV_FindVar("mm_wepcfg_sheri"), min = 0, max = 3, values = wepcfg_option, name = "Normal gameplay weapons - Sheriff", description = "Set weapons for the Sheriff role during the normal gameplay.", valueMask = 0x3},
	{cvar = CV_FindVar("mm_wepcfg_civil"), min = 0, max = 3, values = {[0] = "No weapons", [1] = "Red Rings & Knife", [2] = "Knife only"}, name = "Normal gameplay weapons - Civilian", description = "Set weapons for the Civilian role during the normal gameplay."},
	{cvar = CV_FindVar("mm_wepcfg_hero"), min = 0, max = 3, values = wepcfg_option, name = "Normal gameplay weapons - Hero", description = "Set weapons for the Hero role during the normal gameplay.", valueMask = 0x3},
	{cvar = CV_FindVar("mm_wepcfg_murd"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Murderer", description = "Set weapons for the Murderer role during the Showdown Duel.", valueMask = 0xC, shift = 4},
	{cvar = CV_FindVar("mm_wepcfg_sheri"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Sheriff", description = "Set weapons for the Sheriff role during the Showdown Duel.", valueMask = 0xC, shift = 4},
	{cvar = CV_FindVar("mm_wepcfg_hero"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Hero", description = "Set weapons for the Hero role during the Showdown Duel.", valueMask = 0xC, shift = 4},
	{cvar = CV_FindVar("timelimit"), min = 0, max = 30, values = {[0] = "Let MM decide"}, name = "Round time limit", description = "Time limit for the round in minutes. With the \"Let MM decide\" option\nthe game will automatically choose the time limit for each round.\nChanging this value will require a level restart in order for the\nchanges to fully apply"},
	{cvar = CV_FindVar("maxplayers"), min = 2, max = 32, name = "Maximum players", description = "The maximum amount of players allowed to be in the MM game.\nJoining players who do not fit into this limit will be rejected."},
	{cvar = CV_FindVar("allowjoin"), min = 0, max = 1, values = NoYes_option, name = "Allow joining", description = "Allow players to connect to the server."},
}
COM_AddCommand("mmsetup", function(p)
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command")
		return
	end

	if (isdedicatedserver)
		for line = 1, #adminCVARinfo do CONS_Printf(p, adminCVARinfo[line]) end
		return
	end

	if ((MM.twopgame and MM.minigame and p.mm.minigame) or (not MM.twopgame and p.mm.minigame) or (p.spectator and p.mm.minigame) or p.mm.help.active)
		CONS_Printf(p, "Unable to open MMSETUP UI right now")
		return
	end

	p.mmsetupcursor = 1
	for i = 1, #mmsetup_entries do --Update the values so they represent real (current) CVAR values
		if (mmsetup_entries[i].valueMask)
			mmsetup_entries[i].value = mmsetup_entries[i].cvar.value & mmsetup_entries[i].valueMask
			if (mmsetup_entries[i].shift) then mmsetup_entries[i].value = $ / mmsetup_entries[i].shift end
		else mmsetup_entries[i].value = mmsetup_entries[i].cvar.value end
	end
end, COM_ADMIN)

-- MMSETUP's core
local mmsetupIncrement = do
	mmsetup_entries[consoleplayer.mmsetupcursor].value = $ + 1
	if (mmsetup_entries[consoleplayer.mmsetupcursor].value > mmsetup_entries[consoleplayer.mmsetupcursor].max) then mmsetup_entries[consoleplayer.mmsetupcursor].value = mmsetup_entries[consoleplayer.mmsetupcursor].min end
	S_StartSound(nil, sfx_menu1, consoleplayer)
end
local mmsetupExitNoSave = do
	for k = 1, #mmsetup_entries do
		mmsetup_entries[k].value = mmsetup_entries[k].cvar.value
	end
	consoleplayer.mmsetupcursor = nil
	MM.hud.game.active = true

end
addHook("KeyDown", function(ev)
	local ignore = true
	if not ((gametype == GT_LTMMURDERMYSTERY) and consoleplayer.mmsetupcursor) then return end
	MM.hud.game.active = false
	switch(ev.num, {
		[KEY_ENTER] = do --ENTER/RETURN
			switch(consoleplayer.mmsetupcursor, {
				[#mmsetup_entries + 1] = do --Save & Exit
					for k = 1, #mmsetup_entries do
						if (mmsetup_entries[k].shift) then CV_StealthSet(mmsetup_entries[k].cvar, (mmsetup_entries[k].cvar.value | (mmsetup_entries[k].value * mmsetup_entries[k].shift)))
						else CV_StealthSet(mmsetup_entries[k].cvar, mmsetup_entries[k].value) end
					end
					consoleplayer.mmsetupcursor = nil
					MM.hud.game.active = true
					print("\x87Murder Mystery\x80: Saved the new game settings")
				end,
				[#mmsetup_entries + 2] = mmsetupExitNoSave, --Exit without save
				['default'] = mmsetupIncrement --ENTER works as RIGHT and increments the value
			})
		end,
		[KEY_ESCAPE] = mmsetupExitNoSave, --ESCAPE
		[KEY_CONSOLE] = do --TILDE '~'
			ignore = false
		end,
		[KEY_F3] = do --F3
			local cvar = CV_FindVar("showhud")
			if (not cvar.value) then CV_Set(cvar, 1) end
		end,
		[KEY_UPARROW] = do --UP
			consoleplayer.mmsetupcursor = $ - 1
			if (not consoleplayer.mmsetupcursor) then consoleplayer.mmsetupcursor = #mmsetup_entries + 2 end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
		[KEY_LEFTARROW] = do --LEFT
			mmsetup_entries[consoleplayer.mmsetupcursor].value = $ - 1
			if (mmsetup_entries[consoleplayer.mmsetupcursor].value < mmsetup_entries[consoleplayer.mmsetupcursor].min) then mmsetup_entries[consoleplayer.mmsetupcursor].value = mmsetup_entries[consoleplayer.mmsetupcursor].max end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
		[KEY_RIGHTARROW] = mmsetupIncrement, --RIGHT
		[KEY_DOWNARROW] = do --DOWN
			consoleplayer.mmsetupcursor = $ + 1
			if (consoleplayer.mmsetupcursor == (#mmsetup_entries + 3)) then consoleplayer.mmsetupcursor = 1 end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
	})
	return ignore
end)

-- MMSETUP UI's renderer
local textcolor, yPos, cursorVFlag
hud.add(function(v, p)
	if (not p.mmsetupcursor) or (gametype != GT_LTMMURDERMYSTERY) return end

	v.fadeScreen(16, 10) --gray background

	--Top blue wave bar
	for x = 0, (v.width() / 8) do v.drawFill((x * 8), 0, 8, 8, (144 + sortOfSine((leveltime / 4) + x, 16))|V_SNAPTOTOP|V_SNAPTOLEFT) end
	v.drawString(160, 0, "MM setup utility", V_SNAPTOTOP|V_MONOSPACE|V_ALLOWLOWERCASE, "center")

	--Entries list
	for k = 1, #mmsetup_entries do
		yPos = 24 + (k * 4) + k
		if (p.mmsetupcursor == k) then textcolor = "\x82" else textcolor = "" end
		v.drawString(32, yPos, textcolor..mmsetup_entries[k].name, V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_MONOSPACE, "small")
		if (mmsetup_entries[k].values and mmsetup_entries[k].values[mmsetup_entries[k].value])
			v.drawString(288, yPos, textcolor..mmsetup_entries[k].values[mmsetup_entries[k].value], V_SNAPTOTOP|V_ALLOWLOWERCASE|V_MONOSPACE, "small-right")
		else
			v.drawString(288, yPos, textcolor..mmsetup_entries[k].value, V_SNAPTOTOP|V_ALLOWLOWERCASE|V_MONOSPACE, "small-right")
		end
	end

	--Entries description
	if ((p.mmsetupcursor <= #mmsetup_entries) and mmsetup_entries[p.mmsetupcursor].description) then
		v.drawString(32, 152, mmsetup_entries[p.mmsetupcursor].description, V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_GRAYMAP|V_ALLOWLOWERCASE|V_MONOSPACE|V_RETURN8, "small")
	end

	--"Save & Exit"
	if (p.mmsetupcursor == (#mmsetup_entries + 1)) then textcolor = "\x82" else textcolor = "" end
	v.drawString(32, 176, textcolor.."SAVE & EXIT", V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	--"Exit without save"
	if (p.mmsetupcursor == (#mmsetup_entries + 2)) then textcolor = "\x82" else textcolor = "" end
	v.drawString(32, 184, textcolor.."EXIT WITHOUT SAVING", V_SNAPTOBOTTOM|V_SNAPTOLEFT)

	--Cursor
	switch(p.mmsetupcursor, {
		[#mmsetup_entries + 1] = do
			yPos = 176
			cursorVFlag = V_SNAPTOBOTTOM
		end,
		[#mmsetup_entries + 2] = do
			yPos = 184
			cursorVFlag = V_SNAPTOBOTTOM
		end,
		['default'] = do
			yPos = 24 + (p.mmsetupcursor * 4) + p.mmsetupcursor
			cursorVFlag = V_SNAPTOTOP
		end
	})
	v.draw(8, yPos, v.cachePatch("M_CURSOR"), V_SNAPTOLEFT|cursorVFlag)

	--Additional info
	v.drawString(0, 196, "LTM_MM v"..MM.version, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_GRAYMAP|V_ALLOWLOWERCASE, "small")
	v.drawString(320, 184, "\23             Select item", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	v.drawString(320, 188, "\24             Change item", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	v.drawString(320, 192, "ENTER              Select", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	v.drawString(320, 196, "ESC   Exit without saving", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
end)



--
-- MMHELP
--

local help_page = 1
local help_scroll = 1

COM_AddCommand("mmhelp", function(p, page)
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command")
		return
	end

	if ((p == server) or (IsPlayerAdmin(p)))
		CONS_Printf(p, "\x82".."ADMIN ZONE")
		for line = 1, #adminCVARinfo do CONS_Printf(p, adminCVARinfo[line]) end
	end
	if (MM.debug)
		CONS_Printf(p, "\x82".."DEBUG COMMANDS")
		CONS_Printf(p, "\x87MMPLAYER\x80    - Change player state/role")
		CONS_Printf(p, "\x87MMEXITLEVEL\x80 - Force round end with the winner")
		CONS_Printf(p, "\x87MMSHREMD\x80    - Spawn Sheriff's Emerald at player's position")
		CONS_Printf(p, "\x87MMTIMEWARP\x80  - Travel between different time zones (if map supports them)")
		CONS_Printf(p, "\x87MMSUSNSE\x80    - Start the Suspense music")
		CONS_Printf(p, "\x87MMDUEL\x80      - Start the Showdown Duel music")
		CONS_Printf(p, "\x87MMLOADMUS\x80   - (Re)load the Suspense and Showdown music tracklists")
		CONS_Printf(p, "\x87MMCHARSET\x80   - Display the loaded symbols in the Character Video Memory\n")
	end

	if (isdedicatedserver) return end

	if (p.mm.minigame or p.mmsetupcursor)
		CONS_Printf(p, "Unable to open MMHELP UI right now")
		return
	end

	--MMHELP GUI
	--load HELP page
	local pageInt = tonumber(page)
	if (pageInt)
		if (pageInt <= (#MM.text[MM.lang]["HUD_MMHELP"] + 1))
			help_page = pageInt
			help_scroll = 1
		else help_page = 1 end
	end

	--enable the UI
	MM.hud.help.active = true
	MM.hud.game.active = false
end, COM_LOCAL)

--
-- MMHELP UI's core
--
local tech_info = {
	"^4LTM's ^7Murder Mystery^0",
	"Version ^1"..MM.version.."^0",
	"by ^2\"SRB2MM_DEV team\"^0",
	"Full credits are in the ^6README.TXT^0 inside this .PK3 file",
	"\n\nThe developer team can be reached out by using one of the following links:\n",
	"\nDiscord: ^4https://www.discord.com/invite/UgG8h2djFE^0",
	"\nMatrix: ^3https://matrix.to/#/#ltm_mm:matrix.org^0",
	"\nGitHub: ^6https://www.github.com/LeonardoTheMutant/SRB2-Murder-Mystery^0",
	"\nWebsite: ^Bhttps:/leonardothemutant.github.io/SRB2-Murder-Mystery^0"
}

--Default canvas resolution for 16:10 screen ratio resolutions
local canvasWidth = 320
local canvasHeight = 200

local renderBuffer = {}
local pageLength = 0
--local scrollBarHeight
--local scrollstep

local oldCanvasWidth = 0
local oldCanvasHeight = 0
local oldPage = 0
local oldLang = ""

--Backend
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	if (MM.hud.help.active) and (MM.text[MM.lang]["HUD_MMHELP"])

		--Update render buffer only when neccesary
		if ((oldCanvasWidth != canvasWidth) or (oldCanvasWidth != canvasWidth) or (oldPage != help_page) or (oldLang != MM.lang))
			MM.DebugPrint(string.format("\x87MMHELP\x80: Updating screen... (%dx%d; Language %s; Page: %d)", canvasWidth, canvasHeight, MM.lang, help_page))
			renderBuffer = {}
			pageLength = 0
			oldCanvasWidth = canvasWidth
			oldCanvasHeight = canvasHeight
			oldPage = help_page
			oldLang = MM.lang

			--Insert data into the render buffer
			if (help_page <= #MM.text[MM.lang]["HUD_MMHELP"])
				renderBuffer = MM.GetText("HUD_MMHELP", help_page)
			elseif (help_page == (#MM.text[MM.lang]["HUD_MMHELP"] + 1)) --last page is always a technical info page
				renderBuffer = tech_info
			end
		end
	end
end)

--Inputs
addHook("KeyDown", function(ev)
	local ignore = true
	if not ((gametype == GT_LTMMURDERMYSTERY) and (MM.hud.help.active)) then return end
	local c = ev.num
	if ((c == KEY_ESCAPE) or (c == input.gameControlToKeyNum(GC_CUSTOM1)) or (c == input.gameControlToKeyNum(GC_CUSTOM2)) or (c == input.gameControlToKeyNum(GC_CUSTOM3)))
		MM.hud.game.active = true
		MM.hud.help.active = false
	elseif (c == KEY_CONSOLE)
		ignore = false
	elseif (c == KEY_F3)
		local cvar = CV_FindVar("showhud")
		if (not cvar.value) then CV_Set(cvar, 1) end
	elseif ((c == KEY_UPARROW or c == KEY_MOUSEWHEELUP or c == input.gameControlToKeyNum(GC_FORWARD)) and help_scroll > 1)
		help_scroll = $ - 1
	elseif ((c == KEY_DOWNARROW or c == KEY_MOUSEWHEELDOWN or c == input.gameControlToKeyNum(GC_BACKWARD)) and (help_scroll < pageLength))
		help_scroll = $ + 1
	elseif ((c == KEY_LEFTARROW or c == input.gameControlToKeyNum(GC_STRAFELEFT)) and help_page ~= 1)
		help_page = $ - 1
		help_scroll = 1
	elseif ((c == KEY_RIGHTARROW or c == input.gameControlToKeyNum(GC_STRAFERIGHT)) and help_page <= #MM.text[MM.lang]["HUD_MMHELP"])
		help_page = $ + 1
		help_scroll = 1
	end
	return ignore
end)

--Renderer, Frontend
hud.add(function(v, p)
	if not ((MM.hud.help.active) and (MM.text[MM.lang]["HUD_MMHELP"]) and (MM.graphics) and (gametype == GT_LTMMURDERMYSTERY)) then return end

	--Update the Canvas resolution
	canvasWidth = v.width() / v.dupx()
	canvasHeight = v.height() / v.dupy()

	
	--
	-- Text renderer
	--
	local x = 0
	local y = 8 - help_scroll * 8
	local str, prev_linereturn, isTextCode
	local colormap = v.getStringColormap(0)
	pageLength = 0

	v.fadeScreen(16, 5) --gray background

	--Foreground scrolling blue triangle thingies
	for i = -3, 3
		v.draw(((i * MM.graphics["NTSATKT2"].width) - (leveltime % MM.graphics["NTSATKT2"].width)), -102, MM.graphics["NTSATKT2"], V_SNAPTOTOP)
		v.draw(((i * MM.graphics["NTSATKB1"].width) + (leveltime % MM.graphics["NTSATKB1"].width)), 180, MM.graphics["NTSATKB1"], V_SNAPTOBOTTOM)
	end

	--draw text from the render buffer
	for i = 1, #renderBuffer do
		str = HIDEO.WordWrap(0, canvasWidth, V_MONOSPACE, FU, renderBuffer[i], v)

		for b, c, j in unicode.chars(str) do
			if (c == '\n') --newline
				if (not prev_linereturn) then
					y = $ + 8
					x = 0
					pageLength = $ + 1
				end
				prev_linereturn = true
				continue
			end

			if (c == '^') --Caret Code
				isTextCode = not $
				if (isTextCode) then continue end
			end

			if (isTextCode)
				colormap = v.getStringColormap(HIDEO.GetColorFlagFromHexDigit(code))
				isTextCode = false
				continue
			else
				local code = unicode.code(c)
				prev_linereturn = false
				if (((y >= 0) and (y < (canvasHeight - 16))) and (code >= 22) and (code ~= 32))
					v.draw(x, y, HIDEO.GetUnicodeFont(v, code), V_SNAPTOTOP|V_SNAPTOLEFT, colormap)
				end

				x = $ + 8 --V_MONOSPACE

				if ((x >= canvasWidth) and (i <= #renderBuffer))
					x = 0
					y = $ + 8
					pageLength = $ + 1
					prev_linereturn = true
				end
			end
		end

		x = 0
		y = $ + 8
		pageLength = $ + 1
	end

	pageLength = $ - (canvasHeight / 8) + 3
	pageLength = max($, 1) --for short pages


	--
	-- Scroll Bar
	-- (Unfinished)
	--

	--local thumbH
	--if (pageLength*8 <= canvasHeight-16) then thumbH = canvasHeight-16
	--else thumbH = max(8, (canvasHeight-16 / pageLength*8) * canvasHeight-16)
	--
	--local contentRange = pageLength*8 - canvasHeight-16
	--local thumbRange = canvasHeight-16 - thumbH
	--local thumbPos = (help_scroll / contentRange) * thumbRange
	--
	--
	--local scrollBarHeight = canvasHeight - 16
	--v.drawFill(canvasWidth - 8, 0, 8, scrollBarHeight, 16|V_SNAPTOTOP|V_SNAPTOLEFT) --scroll bar
	--
	--scrollstep = #renderBuffer/scrnRows * scrollBarHeight
	--v.drawFill(312, ((help_scroll - 1)*scrollstep), 8, (scrollBarHeight/#renderBuffer), V_SNAPTOTOP|V_SNAPTOLEFT) --scroll slider


	--
	-- Footer
	--
	v.drawFill(0, 184, canvasWidth, 2, V_SNAPTOBOTTOM|V_SNAPTOLEFT) --horizontal line

	v.drawString(0, 186, ("\x89Scroll: "..help_scroll.."/"..pageLength), V_SNAPTOBOTTOM|V_SNAPTOLEFT, "thin") --Scroll position counter
	v.drawString(80, 186, ("\x88Page: "..help_page.."/"..(#MM.text[MM.lang]["HUD_MMHELP"] + 1)), V_SNAPTOBOTTOM|V_SNAPTOLEFT, "thin") --Page counter

	HIDEO.DrawStrUnicode(v, 0, 192, MM.GetText("HUD_MMHELP_UI", 1), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true) --"Arrow keys to scroll and change page"
	HIDEO.DrawStrUnicode(v, 0, 196, MM.GetText("HUD_MMHELP_UI", 2), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true) --"ESC to leave"
end, "game")



--
-- MMLANG
--

COM_AddCommand("mmlang", function(p, l) --player, lang
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command")
		return
	end
	if (p == server) and (isdedicatedserver)
		CONS_Printf(server, "Dedicated Host can have only ENGLISH language")
		return
	end
	if (not l)
		local langname = MM.text[MM.lang]["LANGUAGE"] or MM.lang
		CONS_Printf(p, "Your current language in use is \x82"..langname.."\x80\nYou can change it with \x87MMLANG [language]\x80 command.")
		CONS_Printf(p, "Available languages:")
		local langCount = 0
		local langIncomp = 0

		--sort languages order
		local langkeys = {}
		for langEntry in pairs(MM.text) do table.insert(langkeys, langEntry) end
		table.sort(langkeys)

		for id, lang in ipairs(langkeys)
			langCount = $ + 1
			local arg1 = ""
			local arg2 = ""

			if (MM.lang == lang) then arg1 = "\x82[current lang]" end
			if (MM.text[lang]["VERSION"] and (MM.text[lang]["VERSION"] != MM.version))
				langIncomp = $ + 1
				arg2 = "\x85{INCOMPATIBLE}"
			end
			CONS_Printf(p, string.format("\x88 %s %s %s",lang,arg1,arg2))
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp) then
			CONS_Printf(p, "\x85"..langIncomp.." are incompatible, they may result errors (or even crashes) when selected")
		end
		CONS_Printf(p, "\nIf you cannot find your language here please ask the Game Administrator(s) to add the required MM language file or contact our \x82SRB2MM_DEV Team\x80 to help us add it to this gametype:\n\t\x84".."Discord: https://discord.com/invite/UgG8h2djFE\x80\n\t\x83Matrix: https://matrix.to/#/#ltm_mm:matrix.org\x80\n\t\x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		l = $:upper()
		if (MM.text[l])
			MM.lang = l
			help_scroll = 1

			if (MM.text[l]["AUTHOR"]) then CONS_Printf(p, string.format("\x88%s\x80 translation made by \x89%s", l, MM.text[l]["AUTHOR"])) end
			local langname = MM.text[MM.lang]["LANGUAGE"] or MM.lang
			CONS_Printf(p, "Personal language for \x87Murder Mystery\x80 is set to \x82"..langname)
			if (MM.text[l]["VERSION"] and (MM.text[l]["VERSION"] != MM.version))
				CONS_Printf(p, "\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask the Authors of this translation to update it for \x87Murder Mystery v"..MM.version)
			end
			local f = io.openlocal("client/MM.DAT", 'w')
			if f
				f:write(l)
				f:close()
				--CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			else CONS_Printf(p, "\x85".."ERROR:\x80 Failed to save personal language preference to \x81/luafiles/client/MM.DAT\x80") end
		else
			CONS_Printf(p, "'\x82"..l.."\x80' language is not present or not loaded into the game\nPlease ask your Game Administrator to add the required MM language file or contact our SRB2MM_DEV Team for help.")
		end
	end
end, COM_LOCAL)
