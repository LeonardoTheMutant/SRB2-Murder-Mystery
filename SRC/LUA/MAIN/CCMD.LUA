-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
-- Code for MMHELP and MMLANG console comands

local function helpCMD(p, page)
	if (gametype != GT_MURDERMYSTERY)
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end
	local l = p.mmlang or "EN"
	if (page) page = $:upper() end

	--MMHELP GUI
	/*
	if (not isdedicatedserver) or ((p!=server) and (isdedicatedserver))
		if (not p.mmhelp) p.mmhelp = {} end
		if (not p.mmhelp.pos) or ((p.mmhelp.pos) and (p.mmhelp.page!=page)) p.mmhelp.pos = 0 end
		if (page)
			if (MM.text[p.mmlang]["MMHELP"][page]) p.mmhelp.page = page
			else p.mmhelp.page = "MAIN" end
		else
			if (not p.mmhelp.page) p.mmhelp.page = "MAIN" end
		end
		p.mmhelp.active = true
		if (not IsPlayerAdmin(p)) return end
	end
	*/

	--legacy MMHELP command
	if (not page)
		for i,str in ipairs(MM.text[l]["MMHELP"]["MAIN"]) do CONS_Printf(p, str) end
		MM_PrintContents(p,l)
	elseif (page == "INFO")
		CONS_Printf(p, "\x87SRB2 Murder Mystery\x80")
		CONS_Printf(p, "Version\x81 "..MM.version.."\x80 ("..MM.releasedate..")")
		CONS_Printf(p, "by \x82\"SRB2 MM_DEV team\"")
		CONS_Printf(p, "(Full credits are in README.TXT inside this .PK3)")
		CONS_Printf(p, "\nChanges from\x81 10.0-BETA\x80:")
		CONS_Printf(p, "\n - TODO")
		CONS_Printf(p, "\n\nFound an issue or just want to help with \x87Murder Mystery for SRB2\x80 development? Any contribution to the project matters and can help!\n\x84  Discord (MM_DEV team): https://discord.com/invite/UgG8h2djFE\n  \x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		if (MM.text[l]["MMHELP"][page])
			for i,str in ipairs(MM.text[l]["MMHELP"][page]) do CONS_Printf(p, str) end
			if (page == "CHAT") for i,str in ipairs(MM.SEMJ_info) do CONS_Printf(p, str) end end
			MM_PrintContents(p,l)
			
		else
			CONS_Printf(p, MM.text[l]["MMHELP_CMD"]["NOTFOUND"][1].."\x82 "..page.."\x80 "..MM.text[l]["MMHELP_CMD"]["NOTFOUND"][2])
			MM_PrintContents(p,l)
		end
	end

	if ((p == server) or (IsPlayerAdmin(p)))
		CONS_Printf(p, "\n\x82".."ADMIN CONSOLE VARIABLES")
		CONS_Printf(p, "\x87MMCHARMODE\x80 - Turn vanilla abbilities ON/OFF (in limited form).")
		CONS_Printf(p, "\x87MMSPRINT\x80   - Turn sprinting ON/OFF (Sneaking with SPIN is Enabled when sprinting is OFF).")
		CONS_Printf(p, "\x87MMSPAM\x80     - Set the sending delay time in ticks to prevent chat spamming.")
		CONS_Printf(p, "\x87MMSEMJ\x80     - Enable/Disable Sound Emojis for everyone.")
		CONS_Printf(p, "\x87MMAFK\x80      - AFK timeout in minutes. If player is AFK for [MMAFK] minutes straight he is going to be kicked")
	end
	if (MM.devbuild)
		CONS_Printf(p, "\n\x82".."DEVELOPER DEBUG COMMANDS")
		CONS_Printf(p, "\x87MMPLAYER\x80    - Change player state/role")
		CONS_Printf(p, "\x87MMNODES\x80     - Display everyone's player state and role")
		CONS_Printf(p, "\x87MMEXITLEVEL\x80 - Force round end with the winner")
		CONS_Printf(p, "\x87MMSHREML\x80    - Spawn Sheriff's Emerald at player's position")
	end
end
		--the original MMHELP before 4.2-beta
		-- CONS_Printf(p, "\x87Welcome to Murder Mystery!")
		-- CONS_Printf(p, "This is a MATCH based gametype where you still need to shoot but shoot only requiered players. Which?\nLet's start from the beginning:")
		-- CONS_Printf(p, "\nAt the start of the round you'll get the\x8B role\x80 that can be seen in your HUD, it can also be seen it in the chat (do not spoil your role!)")
		-- CONS_Printf(p, "\nThe \x8Broles\x80 are:\n\x83Innocent\x80 - You must run away from the \x85Murderer\x80 and help the \x84Sheriff\x80 find him.")
		-- CONS_Printf(p, "\x84Sheriff\x80 - With the help of the \x83Innocents\x80, you must find the \x85Murderer\x80 and eliminate him.")
		-- CONS_Printf(p, "\x85Murderer\x80 - You must kill everyone.")
		-- CONS_Printf(p, "\nIf sheriff kills the innocent the first one loses his 'job' and other Innocent recieves it. The game ends when no murderers or sheriffs are left alive.")
		-- CONS_Printf(p, "When you die from level hazards (like drowning, lasers or lava) you are free to respawn and continue your run.")
		-- CONS_Printf(p, "Your respawn capabilities are 'lost' when you are killed by someone else - you become\x8F dead\x80.")
		-- CONS_Printf(p, "\x8F".."Dead\x80 players cannot join the round and chat with players that are alive, they become alive once again when new round starts.\x82 Do not try to rename yourself or you'll be punished!")
		-- CONS_Printf(p, "It's also important to know that player thrown rings can KILL anyone from ONE SHOT (for gameplay reasons).")
		-- CONS_Printf(p, "\nI hope you remembered everything.")
		-- CONS_Printf(p, "\n(It's possible to change your language in this gametype by executing \x87MMLANG\x80)")

local function MMlang(p, l) --player, lang
	if (gametype != GT_MURDERMYSTERY)
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end
	if (p == server) and (isdedicatedserver)
		CONS_Printf(server, "Dedicated Host can have only ENGLISH language")
		return
	end
	if (not l)
		CONS_Printf(p, MM.text[p.mmlang]["MMLANG"][1])
		CONS_Printf(p, "Available languages:")
		local langCount = 0
		local langIncomp = 0
		local nonascii

		--sort languages order
		local langkeys = {}
		for langEntry in pairs(MM.text) do table.insert(langkeys, langEntry) end
		table.sort(langkeys)

		for id, lang in ipairs(langkeys)
			langCount = $ + 1
			local arg1 = ""
			local arg2 = ""
			local arg3 = "  "
			if (MM.text[lang]["VERSION"]!=MM.version) langIncomp = $ + 1 end
			if (MM.text[lang]["NONASCII"]) nonascii = true end

			if (p.mmlang == lang) arg1 = "\x82 (current lang)" end
			if (MM.text[lang]["VERSION"] != MM.version) arg2 = "\x85 (INCOMPATIBLE)" end
			if (MM.text[lang]["NONASCII"]) arg3 = "* " end
			CONS_Printf(p, arg3..lang..arg1..arg2)
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp) CONS_Printf(p, "\x85"..langIncomp.." are incompatible, they may result errors (or even crashes) when selected") end
		if (nonascii) CONS_Printf(p, "\n* \x80Language is not Latin based. All letters of this language in the console/chat texts will be simulated with English (ASCII compatible) ones.") end
	else
		l = $:upper()
		if (MM.text[l])
			p.mmlang = l
			CONS_Printf(p, MM.text[p.mmlang]["MMLANG"][2])
			if (MM.text[l]["VERSION"] != MM.version) then CONS_Printf(p,"\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask \x83"..tostring(MM.text[l]["AUTHOR"]).."\x80 to update it for \x87Murder Mystery "..MM.version) end
			local f = io.openlocal("client/MM.DAT", 'w')
			if f
				f:write(l)
				f:close()
				--CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			else CONS_Printf(p, "\x85Failed to save\x80 Language preferences to \x81/luafiles/client/MM.DAT\x80. Does your folder lack read+write privileges?") end
		else CONS_Printf(p, "'\x82"..l.."\x80' language is not present\nIf you have the MM language file for that language add it to the game with\x87 ADDFILE [lang_file.lua]\x80 in the console or contact our MM_DEV Team and help us add it to MM:\n  \x84".."Discord: https://discord.com/invite/UgG8h2djFE\x80\n  \x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery") end
	end
end

--MMHELP UI input thinker
--not ready yet
/*
local function MMHELP_GUI_ThinkCmd(p)
	if ((not p.mmhelp) or (not p.mmhelp.active) or (gametype!=GT_MURDERMYSTERY)) return end

	if (p.cmd.buttons&BT_SPIN) p.mmhelp.active = false end --leave MMHELP UI

	if (p.cmd.forwardmove > 0) --up
		if not (p.uppressed)
			p.mmhelp.pos = $ - 1
			if (p.mmhelp.pos < 0) p.mmhelp.pos = 0 end
		end
		p.uppressed = true
	else p.uppressed = false end

	if (p.cmd.forwardmove < 0) --down
		if not (p.downpressed)
			p.mmhelp.pos = $ + 1
			--these integers are placeholders and meant to be replaced with real ScreenRows and ScreenColumns values respectively, tested with 640x400 resolution
			if (p.mmhelp.pos + 23 > V_GetHelpPageSize(p.mmlang, p.mmhelp.page, 38)) p.mmhelp.pos = $ - 1 end
		end
		p.downpressed = true
	else p.downpressed = false end
end
*/

COM_AddCommand("mmhelp", helpCMD, COM_LOCAL)
COM_AddCommand("mmlang", MMlang, COM_LOCAL)
--addHook("PlayerThink", MMHELP_GUI_ThinkCmd)
