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
	local b = a % (base << 1)
	if (b > (base - 1)) then return (base << 1) - b - 1
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
	{cvar = CV_FindVar("mm_wepcfg_murd"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Murderer", description = "Set weapons for the Murderer role during the Showdown Duel.", valueMask = 0xC, bitshift = 2},
	{cvar = CV_FindVar("mm_wepcfg_sheri"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Sheriff", description = "Set weapons for the Sheriff role during the Showdown Duel.", valueMask = 0xC, bitshift = 2},
	{cvar = CV_FindVar("mm_wepcfg_hero"), min = 0, max = 3, values = wepcfg_option, name = "Showdown Duel weapons - Hero", description = "Set weapons for the Hero role during the Showdown Duel.", valueMask = 0xC, bitshift = 2},
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
			if (mmsetup_entries[i].bitshift) then mmsetup_entries[i].value = $ >> mmsetup_entries[i].bitshift end
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
addHook("KeyDown", function(keyevent)
	local ignore = true
	if not ((gametype == GT_LTMMURDERMYSTERY) and consoleplayer.mmsetupcursor) then return end
	MM.hud.game.active = false
	switch(keyevent.num, {
		[13] = do --ENTER/RETURN
			switch(consoleplayer.mmsetupcursor, {
				[#mmsetup_entries + 1] = do --Save & Exit
					for k = 1, #mmsetup_entries do
						if (mmsetup_entries[k].bitshift) then CV_StealthSet(mmsetup_entries[k].cvar, (mmsetup_entries[k].cvar.value | (mmsetup_entries[k].value << mmsetup_entries[k].bitshift)))
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
		[27] = mmsetupExitNoSave, --ESCAPE
		[96] = do --TILDE '~'
			ignore = false
		end,
		[189] = do --F3
			local cvar = CV_FindVar("showhud")
			if (not cvar.value) then CV_Set(cvar, 1) end
		end,
		[230] = do --UP
			consoleplayer.mmsetupcursor = $ - 1
			if (not consoleplayer.mmsetupcursor) then consoleplayer.mmsetupcursor = #mmsetup_entries + 2 end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
		[233] = do --LEFT
			mmsetup_entries[consoleplayer.mmsetupcursor].value = $ - 1
			if (mmsetup_entries[consoleplayer.mmsetupcursor].value < mmsetup_entries[consoleplayer.mmsetupcursor].min) then mmsetup_entries[consoleplayer.mmsetupcursor].value = mmsetup_entries[consoleplayer.mmsetupcursor].max end
			S_StartSound(nil, sfx_menu1, consoleplayer)
		end,
		[235] = mmsetupIncrement, --RIGHT
		[238] = do --DOWN
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
	for x = 0, (v.width() >> 3) do v.drawFill((x << 3), 0, 8, 8, (144 + sortOfSine((leveltime >> 2) + x, 16))|V_SNAPTOTOP|V_SNAPTOLEFT) end
	v.drawString(160, 0, "MM setup utility", V_SNAPTOTOP|V_MONOSPACE|V_ALLOWLOWERCASE, "center")

	--Entries list
	for k = 1, #mmsetup_entries do
		yPos = 24 + (k << 2) + k
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
			yPos = 24 + (p.mmsetupcursor << 2) + p.mmsetupcursor
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
		CONS_Printf(p, MM.GetText(p.mm.lang, "CHAT_MMLANG", 1))
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

			if (p.mm.lang == lang) then arg1 = "\x82 [current lang]" end
			if (MM.GetText(lang, "VERSION") != MM.version) then 
				langIncomp = $ + 1
				arg2 = "\x85 {INCOMPATIBLE}"
			end
			CONS_Printf(p, "\x88 "..lang..arg1..arg2)
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp) then CONS_Printf(p, "\x85"..langIncomp.." are incompatible, they may result errors (or even crashes) when selected") end
		 CONS_Printf(p, "\nIf you cannot find your language here please ask the game administrator(s) to add the required MM language file or contact our \x82SRB2MM_DEV Team\x80 to help us add it to this gametype:\n\t\x84".."Discord: https://discord.com/invite/UgG8h2djFE\x80\n\t\x83Matrix: https://matrix.to/#/#ltm_mm:matrix.org\x80\n\t\x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		l = $:upper()
		if (MM.text[l])
			p.mm.lang = l
			p.mm.help.pos = 1

			CONS_Printf(p, "\x82"..p.mm.lang.."\x80 translation made by \x88"..MM.GetText(p.mm.lang, "AUTHOR"))
			CONS_Printf(p, MM.GetText(p.mm.lang, "CHAT_MMLANG", 2))
			if (MM.GetText(l, "VERSION") != MM.version) then CONS_Printf(p,"\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask the Authors of this translation to update it for \x87Murder Mystery v"..MM.version) end
			CONS_Printf(p, "\x81WARNING\x80: Unicode (UTF-8) text rendering is experimental, some text may dissapear entirely or appear corrupted. Please report all problems you encounter at \x86https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery/issues")
			local f = io.openlocal("client/MM.DAT", 'w')
			if f
				f:write(l)
				f:close()
				--CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			else CONS_Printf(p, "\x85Failed to save\x80 Language preferences to \x81/luafiles/client/MM.DAT\x80. Does your folder lack read+write privileges?") end
		else CONS_Printf(p, "'\x82"..l.."\x80' language is not present/loaded into the game\nPlease ask your game Administrator to add the required MM language file or contact our SRB2MM_DEV Team for help.") end
	end
end, COM_LOCAL)



--
-- MMHELP
--

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
		if (pageInt <= (#MM.text[p.mm.lang]["HUD_MMHELP"] + 1))
			p.mm.help.page = pageInt
			p.mm.help.pos = 1
		else p.mm.help.page = 1 end
	end

	--enable the UI
	p.mm.help.active = true
	MM.hud.game.active = false
end, COM_LOCAL)

--
-- MMHELP UI's core
--
local tech_info = {
	"\1\x84LTM's \1\x87Murder Mystery\4",
	"Version\1\x81 "..MM.version.."\4",
	"by \1\x82\"SRB2MM_DEV team\"\4",
	"Full credits are in the \1\x86README.TXT\4 inside this .PK3 file",
	"\n\nThe developer team can be reached out by using one of the following links:\n",
	"Discord:\n\1\x84https://www.discord.com/invite/\nUgG8h2djFE\n",
	"Matrix:\n\1\x83https://matrix.to/#/#ltm_mm:matrix.org\n",
	"GitHub:\n\1\x86https://www.github.com/\nLeonardoTheMutant/SRB2-Murder-Mystery\n",
	"Website:\n\1\x8Bhttps:/leonardothemutant.github.io/\nSRB2-Murder-Mystery"
}

--Default canvas resolution for 16:10 screen ratio resolutions (values in characters, character is 8x8 pixels)
local scrnRows = 23
local scrnColumns = 40

local renderBuffer = {}
local pageLength = 0
--local scrollBarHeight
--local scrollstep

local oldScrnRows = 0
local oldScrnColumns = 0
local oldPage = 0
local oldLang = ""

--Insert an array of data to the render buffer
local function V_InsertToBuffer(array)
	for i, line in ipairs(array) do
		local wordWrapTemp = HIDEO.WordWrapString(line, scrnColumns)
		for lineWrap = 1, #wordWrapTemp do table.insert(renderBuffer, wordWrapTemp[lineWrap]) end
	end
end

--Backend
--I was unable to lock player controls here because clients would desynchronise each time they press something
--Enjoy what you already have
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	if (p.mm.help and p.mm.help.active) and (MM.text[consoleplayer.mm.lang]["HUD_MMHELP"])

		--
		-- UI LOGIC
		--

		--Update render buffer only when neccesary
		if ((oldScrnColumns != scrnColumns) or (oldScrnRows != scrnRows) or (oldPage != p.mm.help.page) or (oldLang != p.mm.lang))
			MM.DebugPrint(string.format("\x87MMHELP\x80: Updating screen... (Columns: %d; Rows: %d; Language %s; Page: %d)", scrnColumns, scrnRows, p.mm.lang, p.mm.help.page))
			renderBuffer = {}
			pageLength = 0
			oldScrnColumns = scrnColumns
			oldScrnRows = scrnRows
			oldPage = p.mm.help.page
			oldLang = p.mm.lang

			--Insert data into the render buffer
			if (p.mm.help.page <= #MM.text[consoleplayer.mm.lang]["HUD_MMHELP"])
				V_InsertToBuffer(MM.GetText(consoleplayer.mm.lang, "HUD_MMHELP", p.mm.help.page))
			elseif (p.mm.help.page == (#MM.text[consoleplayer.mm.lang]["HUD_MMHELP"] + 1)) --last page is always a technical info page
				V_InsertToBuffer(tech_info)
			end

			--calculate the page length
			if (scrnRows > (#renderBuffer + 1)) pageLength = 1
			else pageLength = #renderBuffer + 1 - scrnRows end
		end

		--
		-- INPUTS
		--

		--p.powers[pw_nocontrol] = 1 --this completely destroys the game for clients

		if (p.cmd.buttons & BT_CUSTOM1) --CUSTOM1, leave HELP
			p.mm.help.active = false
			MM.hud.game.active = true
		end

		if (p.cmd.buttons & BT_JUMP) --JUMP, scroll up
			if (not (p.lastbuttons & BT_JUMP) and (p.mm.help.pos > 1))
				p.mm.help.pos = $ - 1
			end
		end

		if (p.cmd.buttons & BT_SPIN) --SPIN, scroll down
			if (not (p.lastbuttons & BT_SPIN) and (p.mm.help.pos < pageLength))
				p.mm.help.pos = $ + 1
			end
		end

		if (p.cmd.buttons & BT_WEAPONNEXT) --NextWeapon, next page
			if (not (p.lastbuttons & BT_WEAPONNEXT))
				p.mm.help.page = $ + 1
				p.mm.help.pos = 1
				if (p.mm.help.page >= (#MM.text[consoleplayer.mm.lang]["HUD_MMHELP"] + 1)) p.mm.help.page = (#MM.text[consoleplayer.mm.lang]["HUD_MMHELP"] + 1) end
			end
		end

		if (p.cmd.buttons & BT_WEAPONPREV) --PrevWeapon, previous page
			if (not (p.lastbuttons & BT_WEAPONPREV))
				p.mm.help.page = $ - 1
				p.mm.help.pos = 1
				if (p.mm.help.page <= 1) p.mm.help.page = 1 end
			end
		end
	end
end)

--renderer, frontend
hud.add(function(v, p)
	if not ((p.mm.help) and (p.mm.help.active)) or (not MM.text[consoleplayer.mm.lang]["HUD_MMHELP"]) or (not MM.graphics) or (gametype != GT_LTMMURDERMYSTERY) return end

	--Update the Canvas resolution
	scrnColumns = ((v.width()/v.dupx()) >> 3)-- - 2
	scrnRows = ((v.height()/v.dupy()) >> 3) - 2

	local y = 0

	v.fadeScreen(16, 5) --gray background

	--Foreground scrolling blue triangle thingies
	for i = -3, 3
		v.draw(((i * MM.graphics["NTSATKT2"].width) - (leveltime % MM.graphics["NTSATKT2"].width)), -102, MM.graphics["NTSATKT2"], V_SNAPTOTOP)
		v.draw(((i * MM.graphics["NTSATKB1"].width) + (leveltime % MM.graphics["NTSATKB1"].width)), 180, MM.graphics["NTSATKB1"], V_SNAPTOBOTTOM)
	end

	--draw text from the render buffer
	for lineID = p.mm.help.pos, #renderBuffer do
		HIDEO.DrawStrUnicode(v, 0, y, renderBuffer[lineID], V_SNAPTOTOP|V_SNAPTOLEFT)

		y = $ + 8 --line is drawn, move one row down for the next one
		if (y >= (scrnRows << 3)) then break end --Trying to draw out of canvas bounds, stop rendering here
	end

	--scroll bar
	--quite unfinished

	--scrollBarHeight = v.height()/v.dupy() - 16
	--v.drawFill(312, 0, 8, scrollBarHeight, 16|V_SNAPTOTOP|V_SNAPTORIGHT) --scroll bar

	--scrollstep = #renderBuffer/scrnRows * scrollBarHeight
	--v.drawFill(312, ((p.mm.help.pos - 1)*scrollstep), 8, (scrollBarHeight/#renderBuffer), V_SNAPTOTOP|V_SNAPTORIGHT) --scroll slider

	v.drawFill(0, 184, (v.width()/v.dupx()), 2, V_SNAPTOBOTTOM|V_SNAPTOLEFT) --horizontal line

	--bottom text
	v.drawString(0, 186, ("\x89Scroll: "..p.mm.help.pos.."/"..pageLength), V_SNAPTOBOTTOM|V_SNAPTOLEFT, "thin") --Scroll position counter
	v.drawString(80, 186, ("\x88Page: "..p.mm.help.page.."/"..(#MM.text[consoleplayer.mm.lang]["HUD_MMHELP"] + 1)), V_SNAPTOBOTTOM|V_SNAPTOLEFT, "thin") --Page counter

	HIDEO.DrawStrUnicode(v, 0, 192, MM.GetText(consoleplayer.mm.lang, "HUD_MMHELP_UI", 1), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true) --"Press SPIN/JUMP to scroll, NextWep/PrevWep to switch page"
	HIDEO.DrawStrUnicode(v, 0, 196, MM.GetText(consoleplayer.mm.lang, "HUD_MMHELP_UI", 2), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true) --"Press CUSTOM1 to leave"
end, "game")
