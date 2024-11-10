-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
-- Code for MMHELP and MMLANG console comands

local tech_info = {
	"\4LTM's \7Murder Mystery\16",
	"Version\17 "..MM.version.."\16 ("..MM.releasedate..")",
	"by \18\"SRB2 MM_DEV team\"\16",
	"(Full credits are in README.TXT inside this .PK3)",
	"\nChanges from\17 10.1-BETA\16:",
	" - TODO;",
	"\n\nFound an issue or just want to help in this gametype's development? Any kind of contribution to the project matters and can help!\n",
	"\20Discord (MM_DEV team):\ndiscord.com/invite/UgG8h2djFE\16\n",
	"\22GitHub:\ngithub.com/LeonardoTheMutant/SRB2-Murder-Mystery\16\n",
	"\27Website:\nleonardothemutant.github.io/SRB2-Murder-Mystery\16\n"
}

--MMHELP console command
COM_AddCommand("mmhelp", function(p, page)
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery to access this command")
		return
	end

	if ((p == server) or (IsPlayerAdmin(p)))
		CONS_Printf(p, "\x82".."ADMIN CONSOLE VARIABLES")
		CONS_Printf(p, "\x87MM_ABILITIES\x80   - Switch between \x81\"Mystery\"\x80 and \x81\"Vanilla\"\x80 skin abilities mode. Default is \"Mystery\" (OFF).")
		CONS_Printf(p, "\x87MM_AFK\x80         - AFK timeout in minutes. If player is AFK for the specified amount of minutes it is going to be kicked.")
		CONS_Printf(p, "\x87MM_AUTOFIRE\x80    - Turn weapon autofire ON/OFF.")
		CONS_Printf(p, "\x87MM_CHATDELAY\x80   - The message delay (in ticks) to control the time interval players must wait before sending another message.")
		CONS_Printf(p, "\x87MM_CRYPTIC\x80     - Make the game more cryptic by disabling the teammate list, player nametags and most of the player counters on HUD")
		CONS_Printf(p, "\x87MM_CUSTOMSKINS\x80 - Allow the usage of the Custom Skins/Characters in MM.")
		CONS_Printf(p, "\x87MM_NOCAMPING\x80   - When enabled, \x85Murderers\x80 who are camping on the \x84Sheriff's Emerald\x80 for longer than 30 seconds will be kicked")
		CONS_Printf(p, "\x87MM_WEPCONFIG\x80   - Set how weapons work for each role (except "..MM.RoleColor[ROLE_INNOCENT].."Innocent\x80) during the normal gameplay and the Showdown Duel")
		CONS_Printf(p, "\x87MM_WEPINNO\x80     - Enable/Disable weapons for "..MM.RoleColor[ROLE_INNOCENT].."Innocents\x80. Setting this CVAR to\x81 1\x80 will let them use Red Ring + Knife,\x82 2\x80 forces to Knife-only. In both situations "..MM.RoleColor[ROLE_INNOCENT].."Innocents\x80 need to have 100 rings (50 rings for some skins) to make one shot")
		CONS_Printf(p, "") --newline
	end
	if (MM.debug)
		CONS_Printf(p, "\x82".."DEVELOPER DEBUG COMMANDS")
		CONS_Printf(p, "\x87MMPLAYER\x80    - Change player state/role")
		CONS_Printf(p, "\x87MMEXITLEVEL\x80 - Force round end with the winner")
		CONS_Printf(p, "\x87MMSHREML\x80    - Spawn Sheriff's Emerald at player's position")
		CONS_Printf(p, "\x87MMTIMEWARP\x80  - Travel between different time zones (if map supports them)")
		CONS_Printf(p, "\x87MMDUEL\x80      - Start the Showdown Duel music")
		CONS_Printf(p, "\x87MMCHARSET\x80   - Display all Extended ASCII characters from specified character set")
		CONS_Printf(p, "") --newline
	end

	if (isdedicatedserver) return end

	if (p.minigame)
		CONS_Printf(p, "Unable to open MMHELP UI right now")
		return
	end

	if (not MM.debug)
		CONS_Printf(p, "The text of the game manual is being rewritten and is currently unavaiable, sorry") --Prerelease/Debug
		return
	end

	--MMHELP GUI
	--load HELP page
	if (tonumber(page))
		if (MM.text[p.mmlang]["MMHELP"][tonumber(page)])
			p.mmhelp.page = tonumber(page)
			p.mmhelp.pos = 1
		else p.mmhelp.page = 1 end
	end

	--enable the UI
	p.mmhelp.active = true
end, COM_LOCAL)

--MMLANG console command
COM_AddCommand("mmlang", function(p, l) --player, lang
	if (gametype != GT_LTMMURDERMYSTERY)
		CONS_Printf(p, "The game must be LTM's Murder Mystery to access this command")
		return
	end
	if (p == server) and (isdedicatedserver)
		CONS_Printf(server, "Dedicated Host can have only ENGLISH language")
		return
	end
	if (not l)
		CONS_Printf(p, MM_GetText(p.mmlang, "MMLANG", 1))
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
			if (MM.text[lang]["NONASCII"]) then nonascii = true end

			if (p.mmlang == lang) then arg1 = "\x82 (current lang)" end
			if (MM_GetText(lang, "VERSION") != MM.version) then 
				langIncomp = $ + 1
				arg2 = "\x85 (INCOMPATIBLE)"
			end
			if (MM.text[lang]["NONASCII"]) then arg3 = "* " end
			CONS_Printf(p, arg3..lang..arg1..arg2)
		end
		CONS_Printf(p, langCount.." languages in total")
		if (langIncomp) then CONS_Printf(p, "\x85"..langIncomp.." are incompatible, they may result errors (or even crashes) when selected") end
		if (nonascii) then CONS_Printf(p, "\n* \x80Language is not Latin based. All letters of this language in the console/chat texts will be simulated with English (ASCII compatible) ones.") end
		CONS_Printf(p, "\nIf you cannot find your language here please ask the game administrator(s) to add the required MM language file or contact our \x82SRB2 MM_DEV Team\x80 to help us add it to this gametype:\n  \x84".."Discord: https://discord.com/invite/UgG8h2djFE\x80\n  \x86GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery")
	else
		l = $:upper()
		if (MM.text[l])
			p.mmlang = l
			if (not p.mmhelp) p.mmhelp = {page = 1} end
			p.mmhelp.pos = 1
			CONS_Printf(p, "\x82"..p.mmlang.."\x80 translation made by \x88"..MM_GetText(p.mmlang, "AUTHOR"))
			CONS_Printf(p, MM_GetText(p.mmlang, "MMLANG", 2))
			if (MM_GetText(l, "VERSION") != MM.version) then CONS_Printf(p,"\x82WARNING:\x80 Selected language is \x85OUTDATED\x80 and may result errors. Please ask the Authors of this translation to update it for \x87Murder Mystery "..MM.version) end
			local f = io.openlocal("client/MM.DAT", 'w')
			if f
				f:write(l)
				f:close()
				--CONS_Printf(p, "\x83NOTE:\x80 Language preferences saved to \x81/luafiles/client/MM.DAT")
			else CONS_Printf(p, "\x85Failed to save\x80 Language preferences to \x81/luafiles/client/MM.DAT\x80. Does your folder lack read+write privileges?") end
		else CONS_Printf(p, "'\x82"..l.."\x80' language is not present/loaded into the game\nPlease ask your game Administrator to add the required MM language file or contact our SRB2 MM_DEV Team for help.") end
	end
end, COM_LOCAL)

--
-- MMHELP UI
--
local scrnRows = 0
local scrnColumns = 0
--local scrollBarHeight
local realPagelen
--local scrollstep

--insert an array of data to the screen buffer
local function V_InsertToBuffer(player, array)
	for i, line in ipairs(array) do
		local wordWrapTemp = WordWrapString(line, scrnColumns)
		for lineWrap = 1, #wordWrapTemp do table.insert(player.buffer, wordWrapTemp[lineWrap]) end
	end
end

--input handler
--I was unable to lock player controls here because clients would desynchronise each time they press something
--Enjoy what you already have
addHook("PlayerThink", function(p)
	if (gametype != GT_LTMMURDERMYSTERY) return end
	--MMHELP UI controls
	if (p.mmhelp and p.mmhelp.active) and (MM.text[consoleplayer.mmlang]["MMHELP"])

		--p.powers[pw_nocontrol] = 1 --this completely destroys the game for clients

		p.buffer = {}

		if (p.mmhelp.page <= #MM.text[consoleplayer.mmlang]["MMHELP"])
			V_InsertToBuffer(p, MM_GetText(consoleplayer.mmlang, "MMHELP", p.mmhelp.page))
		end

		if (p.mmhelp.page == (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1)) --last page is always a technical info page
			V_InsertToBuffer(p, tech_info)
		end

		if (p.cmd.buttons & BT_ATTACK) --FIRE, leave HELP
			p.pflags = $|PF_ATTACKDOWN --this does not help
			p.mmhelp.active = false
			return --this also doesn't
		end

		if (p.cmd.buttons & BT_JUMP) --JUMP, up
			if (not (p.lastbuttons & BT_JUMP))
				p.mmhelp.pos = $ - 1
				if (p.mmhelp.pos < 1) p.mmhelp.pos = 1 end
			end
		end

		if (p.cmd.buttons & BT_SPIN) --SPIN, down
			if (not (p.lastbuttons & BT_SPIN))
    	    	p.mmhelp.pos = $ + 1
    	    	--hit the end of the page
    	    	if (p.mmhelp.pos + scrnRows > (#p.buffer + 1)) then p.mmhelp.pos = $ - 1 end
			end
    	end

    	if (p.cmd.buttons & BT_WEAPONNEXT) --Next weapon, right
			if (not (p.lastbuttons & BT_WEAPONNEXT))
    	    	p.mmhelp.page = $ + 1
    	    	p.mmhelp.pos = 1
    	    	if (p.mmhelp.page >= (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1)) p.mmhelp.page = (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1) end
			end
    	end

    	if (p.cmd.buttons & BT_WEAPONPREV) --Prev weapon, left
			if (not (p.lastbuttons & BT_WEAPONPREV))
    	    	p.mmhelp.page = $ - 1
    	    	p.mmhelp.pos = 1
    	    	if (p.mmhelp.page <= 1) p.mmhelp.page = 1 end
			end
    	end
	end
end)

--renderer, frontend
hud.add(function(v, p)
	if not ((p.mmhelp) and (p.mmhelp.active)) or (not MM.text[consoleplayer.mmlang]["MMHELP"]) or (not ((MM.graphics) and (MM.graphics.pixel))) or (gametype != GT_LTMMURDERMYSTERY) return end
		
	--init everything
	local cx = 0
	local cy = 0
	scrnColumns = ((v.width()/v.dupx()) >> 3)-- - 2
	scrnRows = ((v.height()/v.dupy()) >> 3) - 2
	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"
	local color = v.getStringColormap(0) --default to white color
	local chr, stringToRender, wordWrapTemp
		
	v.drawStretched(0,0, (v.width() << FRACBITS), (v.height() << FRACBITS), MM.graphics.pixel[0x10], V_70TRANS|V_SNAPTOTOP|V_SNAPTOLEFT) --gray background
		
	for i = -3, 3
		v.draw(((i*320) - (leveltime%320)), -102, MM.graphics["NTSATKT2"], V_SNAPTOTOP)
		v.draw(((i*320) + (leveltime%320)), 180, MM.graphics["NTSATKB1"], V_SNAPTOBOTTOM)
	end

	--draw the data from the screen buffer
	for lineID = p.mmhelp.pos, #p.buffer do
		stringToRender = p.buffer[lineID]

		--draw the line character-by-character
		for charID = 1, stringToRender:len() do
			chr = string.byte(stringToRender:sub(charID, charID)) --numeric value of the single character

			--characters from 0x10 to 0x1F (16 - 31 in decimal) set the color
			if ((chr > 0x0F) and (chr < 0x20)) then color = v.getStringColormap(chr << 12) end -- chr*4096

			--print the character
			if (chr > 0x7F) --Extended ASCII
				if (MM.graphics.charset[charset][chr])
					v.draw((cx << 3), (cy << 3), MM.graphics.charset[charset][chr], V_SNAPTOTOP|V_SNAPTOLEFT, color)
				else --unknown symbol, print "?"
					v.drawString((cx << 3), (cy << 3), "?", V_SNAPTOTOP|V_SNAPTOLEFT)
				end
			elseif ((chr > 0x20) and (chr < 0x7F)) --Printable symbols of the Standart ASCII
				v.draw((cx << 3), (cy << 3), MM.graphics.charset["STCFN"][chr], V_SNAPTOTOP|V_SNAPTOLEFT, color)
			end

			--position shifting for the next character
			if (chr > 0x1F) then cx = $ + 1 end --make place for the next non-color character
		end

		--line is drawn, prepare everything for the next one
		cx = 0
		cy = $ + 1
		if (cy >= scrnRows) then break end --Trying to draw out of screen bounds, stop rendering here
	end

	--scroll bar
	--quite unfinished
		
	--scrollBarHeight = v.height()/v.dupy() - 16
	--v.drawFill(312, 0, 8, scrollBarHeight, 16|V_SNAPTOTOP|V_SNAPTORIGHT) --scroll bar

	if ((#p.buffer + 1 - scrnRows) <= 0) realPagelen = 1
	else realPagelen = #p.buffer + 1 - scrnRows end

	--scrollstep = #p.buffer/scrnRows * scrollBarHeight
	--v.drawFill(312, ((p.mmhelp.pos - 1)*scrollstep), 8, (scrollBarHeight/#p.buffer), V_SNAPTOTOP|V_SNAPTORIGHT) --scroll slider

	v.drawFill(0, 184, (v.width()/v.dupx()), 2, V_SNAPTOBOTTOM|V_SNAPTOLEFT) --horizontal line

	--bottom text
	v.drawString(0, 186, ("\x89Scroll: "..p.mmhelp.pos.."/"..realPagelen), V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, "thin") --Scroll position counter
	v.drawString(80, 186, ("\x88Page: "..p.mmhelp.page.."/"..(#MM.text[consoleplayer.mmlang]["MMHELP"] + 1)), V_SNAPTOBOTTOM|V_SNAPTOLEFT|V_MONOSPACE, "thin") --Page counter

	V_DrawStrASCII(v, 0, 192, charset, MM_GetText(consoleplayer.mmlang, "MMHELP_CMD", 1), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true)
	V_DrawStrASCII(v, 0, 196, charset, MM_GetText(consoleplayer.mmlang, "MMHELP_CMD", 2), V_SNAPTOBOTTOM|V_SNAPTOLEFT, true)
end, "game")
