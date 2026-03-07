-- CCMD.LUA
-- Code by LeonardoTheMutant
--
-- Code for MMHELP, MMLANG and MMSETUP console comands

--Libraries "import"
local eMeM = MM
local Hi = HIDEO

local color_2 = "\x82"
local color_5 = "\x85"

local function sortOfSine(a, base)
	local doublebase = base * 2
	local b = a % doublebase
	if (b > (base - 1)) then b = doublebase - b - 1 end
	return b
end


--
-- MMSETUP (Admin-only CCMD)
--

local wepcfg_options = {
	[0] = "All",
	[1] = "RR&K only",
	[2] = "All no RR",
	[3] = "Knife"
}
local wepcfg_fmt = "\x81Game:\x80 %-9s \x82 Duel:\x80 %-9s"

local wepcfg_description = string.format([[
Options description:
"%s"       - All weapons allowed;
"%s" - Only Red Rings & Knife;
"%s" - All weapons except Red Rings;
"%s"     - Only Knife is allowed.]], wepcfg_options[0], wepcfg_options[1], wepcfg_options[2], wepcfg_options[3])
local wepcfg_option = {}
for y = 0, 3 do
	for x = 0, 3 do
		wepcfg_option[y*4 + x] = string.format(wepcfg_fmt, wepcfg_options[x], wepcfg_options[y])
	end
end

local NoYes_option = {[0] = "No", [1] = "Yes"}
local DisableEnable_option = {[0] = "Disable", [1] = "Enable"}
local mmsetup_entries = {
	{cvar = CV_FindVar("mm_abilities"), min = 0, max = 1, values = {[0] = "MM", [1] = "SRB2"}, name = "Player abilities",
		description = "Switch between differemt player abilities:\n\"MM\"   - Slow walk speed, no skin abilities except sneaking (instead of spindash);\n\"SRB2\" - use Vanilla behaviour"},
	{cvar = CV_FindVar("mm_allowinvinc"), min = 0, max = 1, values = NoYes_option, name = "Allow Invincibility powerup",
		description = "Allow the usage of the Invincibility powerup in the MM game. Do not enable this unless you want chaos in your game."},
	{cvar = CV_FindVar("mm_allowshields"), min = 0, max = 1, values = NoYes_option, name = "Allow any Shield powerups",
		description = "Allow the usage of any Shield powerups in the MM game. Do not enable this unless you want chaos in your game."},
	{cvar = CV_FindVar("mm_allowshoes"), min = 0, max = 1, values = NoYes_option, name = "Allow Speed Shoes powerup",
		description = "Allow the usage of the Speed Shoes powerup in the MM game."},
	{cvar = CV_FindVar("mm_customskins"), min = 0, max = 1, values = NoYes_option, name = "Allow custom skins",
		description = "Allow players to use Custom Skins from external add-ons in the MM game."},
	{cvar = CV_FindVar("mm_autofire"), min = 0, max = 1, values = {[0] = "Automatic Ring only", [1] = "All weapons"}, name = "Weapons autofire",
		description = "Set the autofire behaviour for all weapons in the game for every player.\n\"Automatic Ring only\" - Vanilla SRB2 bahaviour\n\"All weapons\"         - Enable autofire for all weapons."},
	{cvar = CV_FindVar("mm_cryptic"), min = 0, max = 1, values = DisableEnable_option, name = "Cryptic game",
		description = "Make the game more cryptic by disabling the player & teammate lists, player nametags and most of the player counters."},
	{cvar = CV_FindVar("mm_footmarks"), min = 0, max = 1, values = DisableEnable_option, name = "Player footmarks",
		description = "Enable/Disable the Footmarks that players leave on flat surfaces after each step."},
	{cvar = CV_FindVar("mm_killtrails"), min = 0, max = 1, values = DisableEnable_option, name = "Kill trails",
		description = [[
Enable/Disable the red recolor of the footsteps after killing another player with a knife or steping on the dead body.
Player footmarks must be enabled for this to work.]]
	},
	{cvar = CV_FindVar("mm_nocamping"), min = 0, max = 1, values = DisableEnable_option, name = "Anti-camp system for Murderers",
		description = "If enabled, Murderer players who are near the emerald for longer than 20 seconds get killed as a punishment."},
	{cvar = CV_FindVar("mm_speed_sneak"), min = 1, max = 5, name = "Sneaking speed",
		description = "Sneaking speed."},
	{cvar = CV_FindVar("mm_speed_walk"), min = 6, max = 40, name = "Walking speed",
		description = "Walking speed."},
	{cvar = CV_FindVar("mm_wepcfg_murd"), min = 0, max = 15, values = wepcfg_option, name = "Weapons set - Murderer",
		description = "Set weapons for the Murderer role. "..wepcfg_description},
	{cvar = CV_FindVar("mm_wepcfg_sheri"), min = 0, max = 15, values = wepcfg_option, name = "Weapons set - Sheriff",
		description = "Set weapons for the Sheriff role. "..wepcfg_description},
	{cvar = CV_FindVar("mm_wepcfg_hero"), min = 0, max = 15, values = wepcfg_option, name = "Weapons set - Hero",
		description = "Set weapons for the Hero role. "..wepcfg_description},
	{cvar = CV_FindVar("mm_wepcfg_civil"), min = 0, max = 2, values = {[0] = "No weapons", [1] = "Red Rings & Knife", [2] = "Knife only"}, name = "Weapons set - Civilian",
		description = "Set weapons for the Civilian role during the normal gameplay."},
	{cvar = CV_FindVar("timelimit"), min = 0, max = 30, values = {[0] = "Let MM decide"}, name = "Round time limit",
		description = [[
Time limit for the round in minutes. With the "Let MM decide" option the game will automatically choose the time limit for each round.
Changing this value will require a level restart in order for the changes to fully apply]]
	},
	{cvar = CV_FindVar("maxplayers"), min = 2, max = 32, name = "Maximum players",
		description = "The maximum amount of players allowed to be in the server.\nJoining players who do not fit into this limit will be rejected."},
	{cvar = CV_FindVar("allowjoin"), min = 0, max = 1, values = NoYes_option, name = "Allow joining",
		description = "Allow players to connect to the server."},
}

local mmsetupcursor
COM_AddCommand("mmsetup", function(p)
	if (gametype ~= GT_LTMMURDERMYSTERY) then
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command"); return
	end

	if not (IsPlayerAdmin(p) or p == server) then
		CONS_Printf(p, "You must be a game hoster or administrator to access this command"); return
	end

	if (isdedicatedserver) then CONS_Printf(p, info_mmhelp_adminCVAR); return end

	if ((MM.twopgame and MM.minigame and (p.mm.flags & FLAG_MINIGAME)) or (not MM.twopgame and (p.mm.flags & FLAG_MINIGAME))
	or (p.spectator and (p.mm.flags & FLAG_MINIGAME)) or MM.hud.help.active) then
		CONS_Printf(p, "Unable to open MMSETUP UI right now"); return
	end

	mmsetupcursor = 1
	for i = 1, #mmsetup_entries do --Update the values so they represent real (current) CVAR values
		mmsetup_entries[i].value = mmsetup_entries[i].cvar.value
	end
	input.setMouseGrab(false)
end, COM_ADMIN|COM_LOCAL)

-- MMSETUP's core
local mmsetupIncrement = function()
	local entry = mmsetup_entries[mmsetupcursor]

	entry.value = entry.value + 1
	if (entry.value > entry.max) then entry.value = entry.min end
	S_StartSound(nil, sfx_menu1, consoleplayer)
end
local mmsetupExitNoSave = function()
	for k = 1, #mmsetup_entries do
		mmsetup_entries[k].value = mmsetup_entries[k].cvar.value
	end
	mmsetupcursor = nil
	MM.hud.game.active = true
	input.setMouseGrab(true)
end
addHook("KeyDown", function(ev)
	local ignore = true
	if not ((gametype == GT_LTMMURDERMYSTERY) and mmsetupcursor) then return end
	MM.hud.game.active = false
	switch(ev.num, {
		[KEY_ENTER] = function() --ENTER/RETURN
			switch(mmsetupcursor, {
				[#mmsetup_entries + 1] = function() --Save & Exit
					for k = 1, #mmsetup_entries do CV_StealthSet(mmsetup_entries[k].cvar, mmsetup_entries[k].value) end --Silently update all CVARs
					mmsetupcursor = nil
					MM.hud.game.active = true
					input.setMouseGrab(true)
					print("\x87Murder Mystery\x80: Saved the new game settings")
				end,
				[#mmsetup_entries + 2] = mmsetupExitNoSave, --Exit without save
				['default'] = mmsetupIncrement --ENTER works as RIGHT and increments the value
			})
		end,
		[KEY_ESCAPE] = mmsetupExitNoSave, --ESCAPE
		[KEY_CONSOLE] = function() --TILDE '~'
			ignore = false
		end,
		[KEY_F3] = function() --F3
			local cvar = CV_FindVar("showhud")
			if (not cvar.value) then CV_Set(cvar, 1) end
		end,
		[KEY_F11] = function()
			ignore = false
		end,
		[KEY_UPARROW] = function() --UP
			mmsetupcursor = mmsetupcursor - 1
			if (not mmsetupcursor) then mmsetupcursor = #mmsetup_entries + 2 end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
		[KEY_LEFTARROW] = function() --LEFT
			if (mmsetupcursor <= #mmsetup_entries) then
				local entry = mmsetup_entries[mmsetupcursor]

				entry.value = entry.value - 1
				if (entry.value < entry.min) then entry.value = entry.max end
				S_StartSound(nil, sfx_menu1, consoleplayer)
			end
		end,
		[KEY_RIGHTARROW] = function() --RIGHT
			if (mmsetupcursor <= #mmsetup_entries) then mmsetupIncrement() end
		end,
		[KEY_DOWNARROW] = function() --DOWN
			mmsetupcursor = mmsetupcursor + 1
			if (mmsetupcursor == (#mmsetup_entries + 3)) then mmsetupcursor = 1 end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
	})
	return ignore
end)

-- MMSETUP UI's renderer
local textcolor, yPos, cursorVFlag
hud.add(function(v, p)
	if not ((mmsetupcursor) and (gametype == GT_LTMMURDERMYSTERY)) then return end

	local drawString = v.drawString

	v.fadeScreen(16, 10) --gray background

	--Top blue wave bar
	for x = 0, (v.width() / 8) do v.drawFill((x * 8), 0, 8, 8, (144 + sortOfSine((leveltime / 4) + x, 16))|V_SNAPTOTOP|V_SNAPTOLEFT) end
	drawString(160, 0, "MM setup utility", V_SNAPTOTOP|V_MONOSPACE|V_ALLOWLOWERCASE, "center")

	--Entries list
	for k = 1, #mmsetup_entries do
		yPos = 24 + (k * 4) + k
		if (mmsetupcursor == k) then textcolor = color_2 else textcolor = "" end
		drawString(32, yPos, textcolor..mmsetup_entries[k].name, V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_MONOSPACE, "small")
		if (mmsetup_entries[k].values and mmsetup_entries[k].values[mmsetup_entries[k].value]) then
			drawString(288, yPos, textcolor..mmsetup_entries[k].values[mmsetup_entries[k].value], V_SNAPTOTOP|V_SNAPTORIGHT|V_ALLOWLOWERCASE|V_MONOSPACE, "small-right")
		else
			drawString(288, yPos, textcolor..mmsetup_entries[k].value, V_SNAPTOTOP|V_SNAPTORIGHT|V_ALLOWLOWERCASE|V_MONOSPACE, "small-right")
		end
	end

	--Entries description
	switch(mmsetupcursor, {
		[#mmsetup_entries + 1] = function()
			Hi.DrawStrUnicode(v, 32, 152, "^6Apply the changes and exit", V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, eMeM.hud.canvas.font.small.scale)
		end,
		[#mmsetup_entries + 2] = function()
			Hi.DrawStrUnicode(v, 32, 152, "^6Exit without applying the changes", V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, eMeM.hud.canvas.font.small.scale)
		end,
		['default'] = function()
			if (mmsetup_entries[mmsetupcursor].description) then
				Hi.DrawStrUnicode(v, 32, 152, "^6"..Hi.WordWrap(32, eMeM.hud.canvas.width - 64, 0, eMeM.hud.canvas.font.small.scale, mmsetup_entries[mmsetupcursor].description), V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, MM.hud.canvas.font.small.scale)
			end
		end
	})

	--"Save & Exit"
	if (mmsetupcursor == (#mmsetup_entries + 1)) then textcolor = color_2 else textcolor = "" end
	drawString(32, 176, textcolor.."SAVE & EXIT", V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	--"Exit without save"
	if (mmsetupcursor == (#mmsetup_entries + 2)) then textcolor = color_2 else textcolor = "" end
	drawString(32, 184, textcolor.."EXIT WITHOUT SAVING", V_SNAPTOBOTTOM|V_SNAPTOLEFT)

	--Cursor
	switch(mmsetupcursor, {
		[#mmsetup_entries + 1] = function()
			yPos = 176
			cursorVFlag = V_SNAPTOBOTTOM
		end,
		[#mmsetup_entries + 2] = function()
			yPos = 184
			cursorVFlag = V_SNAPTOBOTTOM
		end,
		['default'] = function()
			yPos = 24 + (mmsetupcursor * 4) + mmsetupcursor
			cursorVFlag = V_SNAPTOTOP
		end
	})
	v.draw(8, yPos, v.cachePatch("M_CURSOR"), V_SNAPTOLEFT|cursorVFlag)

	--Additional info
	drawString(0, 196, "LTM_MM v"..MM.version, V_SNAPTOLEFT|V_SNAPTOBOTTOM|V_GRAYMAP|V_ALLOWLOWERCASE, "small")
	drawString(320, 184, "\23             Select item", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	drawString(320, 188, "\24             Change item", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	drawString(320, 192, "ENTER              Select", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
	drawString(320, 196, "ESC   Exit without saving", V_SNAPTORIGHT|V_SNAPTOBOTTOM|V_GRAYMAP|V_MONOSPACE|V_ALLOWLOWERCASE, "small-right")
end)



--
-- MMHELP
--

local help_page = 1
local help_scroll = 1

COM_AddCommand("mmhelp", function(p, page)
	if (gametype ~= GT_LTMMURDERMYSTERY) then
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command"); return
	end

	if ((p == server) or (IsPlayerAdmin(p))) then
		CONS_Printf(p, color_2.."ADMIN ZONE"); CONS_Printf(p, info_mmhelp_adminCVAR)
	end
	if (MM.debug) then
		CONS_Printf(p, color_2.."DEBUG COMMANDS"); CONS_Printf(p, info_mmhelp_debug)
	end

	if (isdedicatedserver) then return end

	if ((p.mm.flags & FLAG_MINIGAME) or mmsetupcursor) then
		CONS_Printf(p, "Unable to open MMHELP UI right now"); return
	end

	--MMHELP GUI
	--load HELP page
	local pageInt = tonumber(page)
	if (pageInt) then
		if (pageInt <= (#MM.text[MM.lang]["HUD_MMHELP"] + 1)) then
			help_page = pageInt
			help_scroll = 1
		else help_page = 1 end
	end

	--enable the UI
	MM.hud.help.active = true
	MM.hud.game.active = false
	input.setMouseGrab(false)
end, COM_LOCAL)

--
-- MMHELP UI's core
--

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
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	local MM_text = eMeM.text[MM.lang]["HUD_MMHELP"]
	local MM_hud = eMeM.hud
	local canvas = MM_hud.canvas
	local canvas_width = canvas.width
	local canvas_height = canvas.height

	if (MM_hud.help.active) and (MM_text) then

		--Update render buffer only when neccesary
		if ((oldCanvasWidth ~= canvas_width) or (oldCanvasHeight ~= canvas_height) or (oldPage ~= help_page) or (oldLang ~= MM.lang)) then
			eMeM.DebugPrint(string.format("\x87MMHELP\x80: Updating screen... (%dx%d; Language %s; Page: %d)", canvas_width, canvas_height, MM.lang, help_page))
			renderBuffer = {}
			pageLength = 0
			oldCanvasWidth = canvas_width
			oldCanvasHeight = canvas_height
			oldPage = help_page
			oldLang = eMeM.lang

			--Insert data into the render buffer
			if (help_page <= #MM_text) then renderBuffer = eMeM.GetText("HUD_MMHELP", help_page)
			elseif (help_page == (#MM_text + 1)) then --last page is always a technical info page
				renderBuffer = {info_mmhelp_technical}
			end
		end
	end
end)

--Inputs
addHook("KeyDown", function(ev)
	local ignore = true

	if not ((gametype == GT_LTMMURDERMYSTERY) and (MM.hud.help.active)) then return end

	local c = ev.num
	if ((c == KEY_ESCAPE) or (c == input.gameControlToKeyNum(GC_CUSTOM1)) or (c == input.gameControlToKeyNum(GC_CUSTOM2)) or (c == input.gameControlToKeyNum(GC_CUSTOM3))) then
		MM.hud.game.active = true
		MM.hud.help.active = false
		input.setMouseGrab(true)
	elseif ((c == KEY_CONSOLE) or ((c >= KEY_F1) and (c <= KEY_F12))) then
		ignore = false
	elseif (c == KEY_F3) then
		local cvar = CV_FindVar("showhud")
		if (not cvar.value) then CV_Set(cvar, 1) end
	elseif ((c == KEY_UPARROW or c == KEY_MOUSEWHEELUP or c == input.gameControlToKeyNum(GC_FORWARD)) and help_scroll > 1) then
		help_scroll = help_scroll - 1
	elseif ((c == KEY_DOWNARROW or c == KEY_MOUSEWHEELDOWN or c == input.gameControlToKeyNum(GC_BACKWARD)) and (help_scroll < pageLength)) then
		help_scroll = help_scroll + 1
	elseif ((c == KEY_LEFTARROW or c == input.gameControlToKeyNum(GC_STRAFELEFT)) and help_page ~= 1) then
		help_page = help_page - 1
		help_scroll = 1
	elseif ((c == KEY_RIGHTARROW or c == input.gameControlToKeyNum(GC_STRAFERIGHT)) and help_page <= #MM.text[MM.lang]["HUD_MMHELP"]) then
		help_page = help_page + 1
		help_scroll = 1
	elseif (c == KEY_F11) then
		ignore = false
	end
	return ignore
end)

--Renderer, Frontend
hud.add(function(v, p)
	local MM_text = eMeM.text[eMeM.lang]["HUD_MMHELP"]
	if not ((eMeM.hud.help.active) and (MM_text) and (eMeM.graphics) and (gametype == GT_LTMMURDERMYSTERY)) then return end

	local vi = v
	local draw = vi.draw
	local drawString = vi.drawString
	local drawFill = vi.drawFill
	local v_width = vi.width()
	local bool_doSmall = bool2int(v_width < 640)

	local Hi = HIDEO
	local DrawCharUnicode = Hi.DrawCharUnicode
	local DrawStrUnicode = Hi.DrawStrUnicode
	local WordWrap = Hi.WordWrap
	local GetColorFlagFromHexDigit = Hi.GetColorFlagFromHexDigit

	local canv = eMeM.hud.canvas
	local canvas_font = canv.font
	local canvas_width = canv.width
	local canvas_height = canv.height
	local canvas_font_scale = canvas_font.scale
	local canvas_font_charwidth = canvas_font.charwidth
	local canvas_font_charheight = canvas_font.charheight
	local infoArea_y = canvas_height - (2*canvas_font_charheight)

	local GetText = eMeM.GetText

	--
	-- Text renderer
	--
	local x = 0
	local y = canvas_font_charheight - help_scroll * canvas_font_charheight
	local str, prev_linereturn, isTextCode
	local colormap = v.getStringColormap(0)
	pageLength = 0

	v.fadeScreen(16, 5) --gray background

	local NTSATKT2 = eMeM.graphics["NTSATKT2"]; local NTSATKT2_width = NTSATKT2.width
	local NTSATKB1 = eMeM.graphics["NTSATKB1"]; local NTSATKB1_width = NTSATKB1.width

	--Foreground scrolling blue triangle thingies
	for i = -3, 3 do
		draw(((i * NTSATKT2_width) - (leveltime % NTSATKT2_width)), -102, NTSATKT2, V_SNAPTOTOP)
		draw(((i * NTSATKB1_width) + (leveltime % NTSATKB1_width)), 180, NTSATKB1, V_SNAPTOBOTTOM)
	end

	--draw text from the render buffer
	for i = 1, #renderBuffer do
		str = WordWrap(0, canvas_width, V_MONOSPACE, canvas_font_scale, renderBuffer[i])

		for b, c, j in unicode.chars(str) do
		repeat
			--Space
			if (c == ' ') then
				x = x + canvas_font_charwidth --V_MONOSPACE
				break
			end

			--Newline
			if (c == '\n') then
				if (not prev_linereturn) then
					x = 0; y = y + canvas_font_charheight
					pageLength = pageLength + 1
				end
				prev_linereturn = true
				break
			end

			--Caret Code
			if (c == '^') then
				isTextCode = not isTextCode
				if (isTextCode) then break end
			end

			if (isTextCode) then
				colormap = v.getStringColormap(GetColorFlagFromHexDigit(c:byte()))
				isTextCode = false
				break
			else
				prev_linereturn = false
				if (y >= 0) and (y < (infoArea_y - (canvas_font_charheight*bool_doSmall))) then
					HIDEO.DrawCharUnicode(v, x, y, unicode.code(c), V_SNAPTOTOP|V_SNAPTOLEFT, colormap)
				end

				x = x + canvas_font_charwidth --V_MONOSPACE

				if ((x >= canvas_width) and (i <= #renderBuffer)) then
					x = 0; y = y + canvas_font_charheight
					pageLength = pageLength + 1
					prev_linereturn = true
				end
			end
			break
		until true
		end

		x = 0; y = y + canvas_font_charheight
		pageLength = pageLength + 1
	end

	pageLength = pageLength - (canvas_height / canvas_font_charheight) + 3
	pageLength = max(pageLength, 1) --for short pages


	--
	-- Scroll Bar
	-- (Unfinished)
	--

	--local thumbH
	--if (pageLength*8 <= canvas_height-16) then thumbH = canvas_height-16
	--else thumbH = max(8, (canvas_height-16 / pageLength*8) * canvas_height-16)
	--
	--local contentRange = pageLength*8 - canvas_height-16
	--local thumbRange = canvas_height-16 - thumbH
	--local thumbPos = (help_scroll / contentRange) * thumbRange
	--
	--
	--local scrollBarHeight = canvas_height - 16
	--drawFill(canvasWidth - 8, 0, 8, scrollBarHeight, 16|V_SNAPTOTOP|V_SNAPTOLEFT) --scroll bar
	--
	--scrollstep = #renderBuffer/scrnRows * scrollBarHeight
	--drawFill(312, ((help_scroll - 1)*scrollstep), 8, (scrollBarHeight/#renderBuffer), V_SNAPTOTOP|V_SNAPTOLEFT) --scroll slider

	local canvas_font_small = canvas_font.small
	local canvas_font_small_charheight = canvas_font_small.charheight
	local canvas_font_small_scale = canvas_font_small.scale
	local thin = "thin"
	local slash = "/"

	--
	-- Footer
	--
	drawFill(0, (infoArea_y - (canvas_font_charheight * bool_doSmall)), canvas_width, 2, V_SNAPTOTOP|V_SNAPTOLEFT) --horizontal line

	drawString(0, (infoArea_y + 2 - (canvas_font_charheight * bool_doSmall)), ("\x89Scroll: "..help_scroll..slash..pageLength), V_SNAPTOTOP|V_SNAPTOLEFT, thin) --Scroll position counter
	drawString(80, (infoArea_y + 2 - (canvas_font_charheight * bool_doSmall)), ("\x88Page: "..help_page..slash..(#MM_text + 1)), V_SNAPTOTOP|V_SNAPTOLEFT, thin) --Page counter

	DrawStrUnicode(v, 0, (canvas_height - 2*canvas_font_small_charheight), GetText("HUD_MMHELP_UI", 1), V_SNAPTOTOP|V_SNAPTOLEFT, canvas_font_small_scale) --"Arrow keys to scroll and change page"
	DrawStrUnicode(v, 0, (canvas_height - canvas_font_small_charheight), GetText("HUD_MMHELP_UI", 2), V_SNAPTOTOP|V_SNAPTOLEFT, canvas_font_small_scale) --"ESC to leave"
end, "game")



--
-- MMLANG
--

COM_AddCommand("mmlang", function(p, l) --player, lang
	if (gametype ~= GT_LTMMURDERMYSTERY) then
		CONS_Printf(p, "The game must be LTM's Murder Mystery (LTM_MM) to access this command"); return
	end
	if (p == server) and (isdedicatedserver) then
		CONS_Printf(server, "Dedicated Host can have only ENGLISH language"); return
	end
	if (not l) then
		local langname = MM.text[MM.lang]["LANGUAGE"] or MM.lang
		CONS_Printf(p, "Your current language in use is \x82"..langname.."\x80\nYou can change it with \x87MMLANG [language]\x80 command.")
		CONS_Printf(p, "Available languages:")
		local langCount = 0
		local langIncomp = 0

		--sort languages order
		local langkeys = {}
		for langEntry in pairs(MM.text) do table.insert(langkeys, langEntry) end
		table.sort(langkeys)

		for id, lang in ipairs(langkeys) do
			langCount = $ + 1
			local arg1 = ""
			local arg2 = ""

			if (MM.lang == lang) then arg1 = "\x82[current lang]" end
			if (MM.text[lang]["VERSION"] and (MM.text[lang]["VERSION"] ~= MM.version)) then
				langIncomp = $ + 1
				arg2 = "\x85{INCOMPATIBLE}"
			end
			CONS_Printf(p, string.format("\x88 %s %s %s",lang,arg1,arg2))
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp) then
			CONS_Printf(p, color_5..langIncomp.." are incompatible, they may result errors (or even crashes) when selected")
		end
		CONS_Printf(p, [[
If you cannot find your language here please ask the Game Administrator(s) to add the required MM language file or contact our ‚SRB2MM_DEV Team€ to help us add it to this gametype:
	„Discord: https://discord.com/invite/UgG8h2djFE€
	ƒMatrix: https://matrix.to/#/#ltm_mm:matrix.org€
	†GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery]])
	else
		l = $:upper()
		if (MM.text[l]) then
			MM.lang = l; help_scroll = 1

			if (MM.text[l]["AUTHOR"]) then CONS_Printf(p, string.format("\x88%s\x80 translation made by \x89%s", l, MM.text[l]["AUTHOR"])) end
			local langname = MM.text[MM.lang]["LANGUAGE"] or MM.lang
			CONS_Printf(p, "Personal language for \x87Murder Mystery\x80 is set to \x82"..langname)
			if (MM.text[l]["VERSION"] and (MM.text[l]["VERSION"] ~= MM.version)) then
				CONS_Printf(p, "\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask the Authors of this translation to update it for \x87Murder Mystery v"..MM.version)
			end
			local f = io.openlocal("client/MM.DAT", 'w')
			if (f) then
				f:write(l); f:close()
				--CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			else CONS_Printf(p, color_5.."ERROR:\x80 Failed to save personal language preference to \x81/luafiles/client/MM.DAT\x80") end
		else
			CONS_Printf(p, color_2..l.."\x80' language is not present or not loaded into the game\nPlease ask your Game Administrator to add the required MM language file or contact our SRB2MM_DEV Team for help.")
		end
	end
end, COM_LOCAL)
