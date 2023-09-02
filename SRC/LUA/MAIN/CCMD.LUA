-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
--Code for MMHELP and MMLANG console commands

local function helpCMD(p, page)
	if gametype!=GT_MURDERMYSTERY
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end
	local l=p.mmlang
	if (page) page=$:upper() end
	if (p==server) and (isdedicatedserver) l="EN" end --Since Dedicated server host's player_t can't contain p.mmlang we have to emulate it
	if not page
		for i,str in pairs(MurderMystery.text[l]["MMHELP"]["MAIN"]) CONS_Printf(p, str) end
	elseif page=="INFO"
		CONS_Printf(p, "\x87SRB2 Murder Mystery\x80")
		CONS_Printf(p, "Version\x81 "..MurderMystery.version.."\x80 ("..MurderMystery.releasedate..")")
		CONS_Printf(p, "by \x82\"SRB2 MM_DEV team\"")
		CONS_Printf(p, "(Full credits are in README.TXT inside this .PK3)")
		CONS_Printf(p, "\nChanges from\x81 8.0-beta\x80:")
		CONS_Printf(p, " - New map: [new_map_name];")
		CONS_Printf(p, " - Huge bugfixes, we tried our best to make the game much stable than before. Still, bugs can occur;")
		CONS_Printf(p, " - Custom Language Files (CLF) can now include MMHELP text. In general the languages are much more customizable and easier to understand")
		CONS_Printf(p, "\nFound an issue or just want to help with \x87Murder Mystery for SRB2\x80 development? Any contribution to the project matters and can help!\n\x84".."Discord (MM_DEV team): https://discord.com/invite/UgG8h2djFE\n\x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		if (MurderMystery.text[l]["MMHELP"][page]) for i,str in pairs(MurderMystery.text[l]["MMHELP"][page]) CONS_Printf(p, str) end
		else
			CONS_Printf(p, "Can't find the \x82"..page.."\x80 page in help. Try these commands instead:")
			CONS_Printf(p, "\x87MMHELP\x80      - The basics")
			CONS_Printf(p, "\x87MMHELP GAME\x80 - More about gameplay and in-game situations")
			CONS_Printf(p, "\x87MMHELP BAD\x80  - Things that are bad to do in MM")
			CONS_Printf(p, "\x87MMHELP INFO\x80 - Technical information about version and changes")
		end
	end
	if (p==server) or (IsPlayerAdmin(p))
			CONS_Printf(p, "\n\x82".."ADMIN CONSOLE VARIABLES")
			CONS_Printf(p, "\x87MMCHARMODE\x80 - Turn vanilla abbilities ON/OFF (in limited form).")
			CONS_Printf(p, "\x87MMSPRINT\x80   - Turn sprinting ON/OFF (Sneaking with SPIN is Enabled when sprinting is OFF).")
			CONS_Printf(p, "\x87MMSPAM\x80     - Set the sending delay time in ticks to prevent chat spamming.")
			CONS_Printf(p, "\x87MMAFK\x80      - AFK timeout in ticks. \"If player.afk > afktimer then kick(player)\".") end
		if MurderMystery.devbuild
			CONS_Printf(p, "\n\x82".."DEVELOPER BUILD DEBUG COMMANDS")
			CONS_Printf(p, "\x87MMPLAYER\x80 - Change player state/role")
			CONS_Printf(p, "\x87MMNODES\x80  - Display everyone's player state and role") end
end
		-- CONS_Printf(p, "\x87Welcome to Murder Mystery!") --the original MMHELP before 4.2-beta
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
	if gametype!=GT_MURDERMYSTERY
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end
	if (p==server) and (isdedicatedserver)
		CONS_Printf(server, "Dedicated server host can have only ENGLISH language")
		return
	end
	if not l
		CONS_Printf(p, MurderMystery.text[p.mmlang]["MMLANG"][1])
		CONS_Printf(p, "Available languages:")
		local langCount=0
		local langOutdated=0
		for lang in pairs(MurderMystery.text)
			langCount=$+1
			if (MurderMystery.text[lang]["VERSION"]!=MurderMystery.version) langOutdated=$+1 end
			if (p.mmlang==lang) CONS_Printf(p,"\x82  "..lang.." (current lang)")
			elseif (MurderMystery.text[lang]["VERSION"]!=MurderMystery.version) CONS_Printf(p,"\x85  "..lang.." (OUTDATED)")
			else CONS_Printf(p,"  "..lang) end
		end
		CONS_Printf(p, langCount.." languages in total")
		if langOutdated~=0 CONS_Printf(p, "\x85"..langOutdated.." are outdated (they may result errors (and crashes) when selected)") end
	else
		l=l:upper()
		if MurderMystery.text[l]
			p.mmlang=l
			CONS_Printf(p, MurderMystery.text[p.mmlang]["MMLANG"][2])
			if (MurderMystery.text[l]["VERSION"]!=MurderMystery.version) CONS_Printf(p,"\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result crashes. Please ask \x81"..tostring(MurderMystery.text[l]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MurderMystery.version) end
			--local f=io.openlocal("client/MM.DAT", 'w')
			--if f
			--	f:write(l)
			--	f:close()
			--	CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			--else CONS_Printf(p, "\x85Failed to save\x80 Language preferences to \x81/luafiles/client/MM.DAT\x80. Does your folder lack read+write privileges?") end
		else CONS_Printf(p, "'\x82"..l.."\x80' language is not added\nIf you want to add it to the MM, please add the MM language file with\x87 ADDFILE [lang_file.lua]\x80 in the console or contact our MM_DEV Team:\n  \x84".."Discord: https://discord.com/invite/UgG8h2djFE\x80\n  \x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery") end
	end
end

COM_AddCommand("mmhelp", helpCMD, COM_LOCAL)
COM_AddCommand("mmlang", MMlang, COM_LOCAL)