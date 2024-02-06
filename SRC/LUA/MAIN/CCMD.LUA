-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
-- Code for MMHELP and MMLANG console commands

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
		for i,str in pairs(MM.text[l]["MMHELP"]["MAIN"]) CONS_Printf(p, str) end
		MM_PrintContents(p,l)
	elseif (page == "INFO")
		CONS_Printf(p, "\x87SRB2 Murder Mystery\x80")
		CONS_Printf(p, "Version\x81 "..MM.version.."\x80 ("..MM.releasedate..")")
		CONS_Printf(p, "by \x82\"SRB2 MM_DEV team\"")
		CONS_Printf(p, "(Full credits are in README.TXT inside this .PK3)")
		CONS_Printf(p, "\nChanges from\x81 8.1-BETA\x80:")
		CONS_Printf(p, "\x87SRB2 MM Aniversary Update! A whole year of the development!\nWe tried to fit a lot of content in this update to celebrate our project's first year of the development! This update took us 4 months to make and we hope it was worth it. Enjoy!")
		CONS_Printf(p, "\n - 2 new maps making a total of 10! Investigate the murders in the new \"Space Base\" and \"8-Ball Hotel\"!")
		CONS_Printf(p, "\n - 7 new Sound Emojis (memes) to fill the game with the sounds of your thoughts;")
		CONS_Printf(p, "\n - Completely redesigned Heads-up Display. There was A LOT of work done there just to make following changes possible;")
		CONS_Printf(p, "\n - HUD text can now display your language's native letters, it is much more readable now!")
		CONS_Printf(p, "\n - Your role on HUD flickers each time it changes to make sure you don't miss it!")
		CONS_Printf(p, "\n - \x84Sheriffs\x80 and \x82Heros\x80 can see each other's teammate count on HUD;")
		CONS_Printf(p, "\n - \x84Sheriffs\x80 and \x82Heros\x80 have shared team chat;")
		CONS_Printf(p ,"\n - Added a \x81PONG\x80 minigame for 2-players who are alone on the server. A nice way to get rid of the boredom... for some time...")
		CONS_Printf(p, "\n - Added Round Ending themes for intermission. Each ending has its own musical theme!")
		CONS_Printf(p, "\n - Changed the Custom Language File's format for the new update;")
		CONS_Printf(p, "\n - All text in all localizations has been completely rewritten to be fully gender-free. It was extremely hard to manage but now the female players can feel more comfortable with the new text (We hope);")
		CONS_Printf(p, "\n - A lot of documentation for developers and modders;")
		CONS_Printf(p, "\n - Fixed instant round end by giving the invincibility effect to everyone at the beginning of the round;")
		CONS_Printf(p, "\n - Old maps were redesigned again;")
		CONS_Printf(p, "\n - All maps are now in UMDF format;")
		CONS_Printf(p, "\n - Round time limit is now dynamic and depends on player count (More players - more time);")
		CONS_Printf(p, "\n - Anti-rename was pretty violent in the past so we redesigned it to kick only\x8F Dead\x80 players who try to rename;")
		CONS_Printf(p, "\n - \"rejointimeout\" console variable is no longer an issue for MM (at least it works better now);")
		CONS_Printf(p, "\n - AFK is working properly again;")
		CONS_Printf(p, "\n - Weapon Rings were reworked to fix the \"Wall Hug/Clip\" bug;")
		CONS_Printf(p, "\n - Added a KNIFE weapon for @everyone (except \x83Innocents\x80)!!!")
		CONS_Printf(p, "\n - Added \x87MMHELP TIPS\x80 page which contains some gamplay tips collected by us, the players")
		CONS_Printf(p, "\n - Restored the Language preferences removed in version 8.0-BETA. Your prefered language will be loaded when you join the MM server again!")
		CONS_Printf(p, "\n - Added \x87MMCHARMODE 2\x80 option to disable all character ability limits!")
		CONS_Printf(p, "\n - Footsteps engine was remade and footsteps are acting differently now;")
		CONS_Printf(p, "\n - Added the \x84Sheriff Emerald Radar\x80 for \x83Innocents\x80, it is now much easier to find the emerald with this;")
		CONS_Printf(p, "\n - Removed \"Shut Up Chatbug!\" functionality for compatibility reasons;")
		CONS_Printf(p, "\n - Bugfixes, of course;")
		CONS_Printf(p, "\n\nFound an issue or just want to help with \x87Murder Mystery for SRB2\x80 development? Any contribution to the project matters and can help!\n\x84  Discord (MM_DEV team): https://discord.com/invite/UgG8h2djFE\n  \x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		if (MM.text[l]["MMHELP"][page])
			for i,str in pairs(MM.text[l]["MMHELP"][page]) CONS_Printf(p, str) end
			if (page == "CHAT") for i,str in pairs(MM.SEMJ_info) CONS_Printf(p, str) end end
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
		CONS_Printf(server, "Dedicated server host can have only ENGLISH language")
		return
	end
	if (not l)
		CONS_Printf(p, MM.text[p.mmlang]["MMLANG"][1])
		CONS_Printf(p, "Available languages:")
		local langCount = 0
		local langIncomp = 0
		local nonascii
		for lang in pairs(MM.text)
			langCount = $ + 1
			local arg1 = ""
			local arg2 = ""
			local arg3 = " "
			if (MM.text[lang]["VERSION"]!=MM.version) langIncomp = $ + 1 end
			if (MM.text[lang]["NONASCII"]) nonascii = true end

			if (p.mmlang == lang) arg1 = "\x82 (current lang)" end
			if (MM.text[lang]["VERSION"] != MM.version) arg2 = "\x85 (INCOMPATIBLE)" end
			if (MM.text[lang]["NONASCII"]) arg3 = "*" end
			CONS_Printf(p, arg3.." "..lang..arg1..arg2)
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp != 0) CONS_Printf(p, "\x85"..langIncomp.." are incompatible, they may result errors (or even crashes) when selected") end
		if (nonascii) CONS_Printf(p, "\n* \x80Language is not Latin based. All letters of this language in the console/chat texts will be simulated with English (ASCII compatible) ones.") end
	else
		l = $:upper()
		if (MM.text[l])
			p.mmlang = l
			CONS_Printf(p, MM.text[p.mmlang]["MMLANG"][2])
			if (MM.text[l]["VERSION"] != MM.version) CONS_Printf(p,"\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask \x83"..tostring(MM.text[l]["AUTHOR"]).."\x80 to update it for \x87Murder Mystery "..MM.version) end
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