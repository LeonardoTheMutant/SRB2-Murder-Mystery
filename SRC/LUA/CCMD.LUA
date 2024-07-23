-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
-- Code for MMHELP and MMLANG console comands

local tech_info = {
	"\7SRB2 Murder Mystery\16",
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

local function helpCMD(p, page)
	if (gametype != GT_MURDERMYSTERY)
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end

	if ((p == server) or (IsPlayerAdmin(p)))
		CONS_Printf(p, "\n\x82".."ADMIN CONSOLE VARIABLES")
		CONS_Printf(p, "\x87MM_ABILITIES\x80   - Switch between \x81\"Mystery\"\x80 and \x81\"Vanilla\"\x80 skin abilities mode. Default is \"Mystery\" (OFF).")
		CONS_Printf(p, "\x87MM_CUSTOMSKINS\x80 - Allow the usage of the Custom Skins/Characters in MM.")
		CONS_Printf(p, "\x87MM_SPAM\x80        - Set the sending delay time in ticks to prevent chat spamming.")
		CONS_Printf(p, "\x87MM_SAFECHAT\x80    - Enable/Disable the chat automoderation system for cases like \"I am [role]\" reveals.")
		CONS_Printf(p, "\x87MM_AFK\x80         - AFK timeout in minutes. If player is AFK for [MMAFK] minutes straight he is going to be kicked.")
		CONS_Printf(p, "\x87MM_NOGUNS\x80      - Take all weapons from everyone except the knife. Possible values:\x89 0 - Unlock all weapons\x80;\x8A 1 - Limit to Knife when not Duel\x80;\x8B 2 - Limit to Knife all the time\x80.")
		CONS_Printf(p, "\x87MM_DUELMODE\x80    - Enable/Disable access to all weapons for \x85Murderers\x80 during the \x88Showdown Duel\x80.")
		CONS_Printf(p, "\x87MM_AUTOFIRE\x80    - Turn weapon autofire ON/OFF.")
	end
	if (MM.devbuild)
		CONS_Printf(p, "\n\x82".."DEVELOPER DEBUG COMMANDS")
		CONS_Printf(p, "\x87MMPLAYER\x80    - Change player state/role")
		CONS_Printf(p, "\x87MMNODES\x80     - Display everyone's player state and role")
		CONS_Printf(p, "\x87MMEXITLEVEL\x80 - Force round end with the winner")
		CONS_Printf(p, "\x87MMSHREML\x80    - Spawn Sheriff's Emerald at player's position")
		CONS_Printf(p, "\x87MMTIMEWARP\x80  - Travel between different time zones (if map supports them)")
		CONS_Printf(p, "\x87MMCHARSET\x80   - Display all Extended ASCII characters from specified character set")
	end

	if (isdedicatedserver) return end

	if (p.minigame)
		CONS_Printf(p, "Unable to open MMHELP UI right now")
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
end

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
end

COM_AddCommand("mmhelp", helpCMD, COM_LOCAL)
COM_AddCommand("mmlang", MMlang, COM_LOCAL)

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
	if not (p.mmhelp and p.mmhelp.active) or (not MM.text[consoleplayer.mmlang]["MMHELP"]) or (gametype != GT_MURDERMYSTERY) return end

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
end)

--renderer, frontend
hud.add(function(v, p)
	if not ((p.mmhelp) and (p.mmhelp.active)) or (not MM.text[consoleplayer.mmlang]["MMHELP"]) or (gametype != GT_MURDERMYSTERY) return end
		
	--init everything
	local cx = 0
	local cy = 0
	scrnColumns = ((v.width()/v.dupx()) >> 3)-- - 2
	scrnRows = ((v.height()/v.dupy()) >> 3) - 2
	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"
	local color = v.getStringColormap(0) --default to white color
	local chr, strchar, stringToRender, wordWrapTemp
		
	v.drawStretched(0,0, (v.width() << 16), (v.height() << 16), v.cachePatch("PIXEL_10"), V_70TRANS|V_SNAPTOTOP|V_SNAPTOLEFT) --gray background
		
	for i = -3, 3
		v.draw(((i*320) - (leveltime%320)), -102, v.cachePatch("NTSATKT2"), V_SNAPTOTOP)
		v.draw(((i*320) + (leveltime%320)), 180, v.cachePatch("NTSATKB1"), V_SNAPTOBOTTOM)
	end

	--draw the data from the screen buffer
	for lineID = p.mmhelp.pos, #p.buffer do
		stringToRender = p.buffer[lineID]

		--draw the line character-by-character
		for charID = 1, stringToRender:len() do
			chr = string.byte(stringToRender:sub(charID, charID)) --numeric value of the single character

			if (chr < 100) then strchar = "0"..chr --make the number to be 3 digit
			else strchar = chr end

			--characters from 0x10 to 0x1F (16 - 31 in decimal) set the color
			if ((chr > 0x0F) and (chr < 0x20)) then color = v.getStringColormap(chr << 12) end -- chr*4096

			--print the character
			if (chr > 0x7F) --Extended ASCII
				if (v.patchExists(charset..strchar))
					v.draw((cx << 3), (cy << 3), v.cachePatch(charset..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
				else --unknown symbol, print "?"
					v.drawString((cx << 3), (cy << 3), "?", V_SNAPTOTOP|V_SNAPTOLEFT)
				end
			elseif ((chr > 0x20) and (chr < 0x7F)) --Printable symbols of the Standart ASCII
				v.draw((cx << 3), (cy << 3), v.cachePatch("STCFN"..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
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

	V_DrawStrASCII(v, 0, 192, charset, MM_GetText(consoleplayer.mmlang, "MMHELP_CMD", 1), V_SNAPTOBOTTOM|V_SNAPTOLEFT, 32768) --FU/2
	V_DrawStrASCII(v, 0, 196, charset, MM_GetText(consoleplayer.mmlang, "MMHELP_CMD", 2), V_SNAPTOBOTTOM|V_SNAPTOLEFT, 32768) --FU/2
end, "game")