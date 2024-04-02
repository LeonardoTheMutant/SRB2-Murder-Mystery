-- CCMD.LUA
-- Code by LeonardoTheMutant
-- Translations by awesome MM_DEV members
--
-- Code for MMHELP and MMLANG console comands

local SEMJ_info = { --for the 4th page in HELP
	"\n  \8Keyword\0 : \9Sound\0\n",
	"  \8:skull:\0 - \9\"Bad to the Bones\"\0",
	"  \8:fart:\0 - \9Fart sound\0",
	"  \8:pain:\0 - \9Very loud pain scream\0",
	"  \8:wow:\0 - \9Anime-like \"WOW!\"\0",
	"  \8:|\0 - \9Vine boom\0",
	"  \8OMG\0 - \9\"OOHhhh myyy Goooddddd...\"\0",
	"  \8bruh\0 - \9\"bruh\"\0",
	"  \8sus\0 - \9SUS\0",
	"  \8AMONGUS\0 - \9\"*AMONG US*\"\0",
	"* \8OH NO\0 - \9Knuckles' \'OH NO\'\0",
	"  \8AGHH / AHH\0 - \9Eggman's \'AGHHHH!\'\0",
	"* \8AHA\0 - \9Eggman's \'AHA!\'\0",
	"  \8NO WAY\0 - \9Eggman's \'NO WAY!\'\0",
	"* \8NOPE\0 - \9Nope.\0",
	"  \8GET OVER HERE\0 - \9\"GET OVER HERE!\"\0",
	"  \8NOOO\0 - \9Shadow screaming \"NOOOOOOoooooo...\"\0",
	"* \8NO!\0 - \9Heavy's \'NO!\'\0",
	"* \8HELP\0 - \9Tyler1's \'HELP!\'\0",
	"  \8hehe\0 - \9DOOMGUY chuckle\0",
	"  \8HEHEHE HA\0 - \9Clash Royal King's laugh\0",
	"  \8hehe boi\0 - \9\"Hehe boi...\"\0",
	"  \8PINGAS\0 - \9\"SnooPING AS usual I see?\"\0",
	"  \8imbouttoblow\0 \9Dreamybull's \"imbouttoblow\"\0",
	"  \8HAH\0 - \9\"HAH!\"\0",
	"  \8Hello there\0 - \9Obi-Wan's iconic phrase\0",
	"\n* This keyword has to be present in the message alone to work"
}

local tech_info = {
	"\7SRB2 Murder Mystery\0",
	"Version\1 "..MM.version.."\0 ("..MM.releasedate..")",
	"by \2\"SRB2 MM_DEV team\"\0",
	"(Full credits are in README.TXT inside this .PK3)",
	"\nChanges from\1 10.0-BETA\0:",
	"\n - TODO",
	"\n\nFound an issue or just want to help with \7Murder Mystery for SRB2\0 development? Any kind of contribution to the project matters and can help!\n\4  Discord (MM_DEV team): https://discord.com/invite/UgG8h2djFE\0\n  \6GitHub: https://github.com/LeonardoTheMutant/SRB2-Murder-Mystery"
}

local function helpCMD(p, page)
	if (gametype != GT_MURDERMYSTERY)
		CONS_Printf(p, "The game must be Murder Mystery to access this command")
		return
	end
	local l = p.mmlang or "EN"

	--MMHELP GUI
	if (not isdedicatedserver)
		--first time init
		if (not p.mmhelp) p.mmhelp = {page = 1, pos = 1} end

		--load HELP page
		if (page)
			if (MM.text[p.mmlang]["MMHELP"][page])
				p.mmhelp.page = page
				p.mmhelp.pos = 1
			else p.mmhelp.page = 1 end
		end

		--enable the UI for non-admins
		if (not IsPlayerAdmin(p) or (p != server))
			p.UIbackground = 0
			p.disablemovement = true
			p.mmhelp.active = true
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
		CONS_Printf(p, "\x87MMCHARSET\x80   - Display all Extended ASCII characters from specified character set")
	end
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
			if (not p.mmhelp) p.mmhelp = {page = 1} end
			p.mmhelp.pos = 1
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

COM_AddCommand("mmhelp", helpCMD, COM_LOCAL)
COM_AddCommand("mmlang", MMlang, COM_LOCAL)

--
-- MMHELP UI
--
local scrnRows = 0
local scrnColumns = 0
local realPagelen
local pagestep
local buffer = {}

--insert an array of data to the screen buffer
local function V_InsertToBuffer(array)
	for i, line in ipairs(array) do
		local wordWrapTemp = WordWrapString(line, scrnColumns)
		for lineWrap = 1, #wordWrapTemp do table.insert(buffer, wordWrapTemp[lineWrap]) end
	end
end

--addHook("PlayerThink", function(p)
--	if ((not p.mmhelp) or (not p.mmhelp.active) or (gametype != GT_MURDERMYSTERY)) return end
--end)

--input handler
addHook("KeyDown", function(k)
    --MMHELP UI
    if ((consoleplayer.mmhelp) and (consoleplayer.mmhelp.active))
        if (k.num == 27) --ESC leave MMHELP UI
            consoleplayer.disablemovement = false
            consoleplayer.mmhelp.active = false
            return true
        end

        if (k.num == 230) --up
            consoleplayer.mmhelp.pos = $ - 1
            if (consoleplayer.mmhelp.pos < 1) consoleplayer.mmhelp.pos = 1 end
            return true
        end

        if (k.num == 238) --down
            consoleplayer.mmhelp.pos = $ + 1
            --hit the end of the page
            if (consoleplayer.mmhelp.pos + scrnRows > #buffer) then consoleplayer.mmhelp.pos = $ - 1 end
            return true
        end

        if (k.num == 235) --right
            consoleplayer.mmhelp.page = $ + 1
            consoleplayer.mmhelp.pos = 1
            if (consoleplayer.mmhelp.page >= (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1)) consoleplayer.mmhelp.page = (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1) end
            return true
        end

        if (k.num == 233) --left
            consoleplayer.mmhelp.page = $ - 1
            consoleplayer.mmhelp.pos = 1
            if (consoleplayer.mmhelp.page <= 1) consoleplayer.mmhelp.page = 1 end
            return true
        end
    end
end)


--renderer
hud.add(function(v, p)
	if (p.mmhelp) and (p.mmhelp.active) and (gametype == GT_MURDERMYSTERY)
		--init everything
		local cx = 0
		local cy = 0
		scrnColumns = ((v.width()/v.dupx())>>3) - 2
		scrnRows = ((v.height()/v.dupy())>>3) - 2
		buffer = {}
		local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"
		local color = v.getStringColormap(0) --default to white color
		local chr, strchar, stringToRender, wordWrapTemp

		if (p.mmhelp.page <= #MM.text[consoleplayer.mmlang]["MMHELP"])
			V_InsertToBuffer(MM.text[consoleplayer.mmlang]["MMHELP"][p.mmhelp.page])
		end

		if (p.mmhelp.page == 4) then V_InsertToBuffer(SEMJ_info) end --Sound Emojis info for Chat page

		if (p.mmhelp.page == (#MM.text[consoleplayer.mmlang]["MMHELP"] + 1)) --last page is always a technical info page
			V_InsertToBuffer(tech_info)
		end

		--draw the data from the screen buffer
		for lineID = p.mmhelp.pos, #buffer do
			stringToRender = buffer[lineID]

			--draw the line character-by-character
			for charID = 1, stringToRender:len() do
				chr = string.byte(stringToRender:sub(charID, charID)) --numeric value of the single character

				if (chr<100) strchar="0"..chr --make the number to be 3 digit
				else strchar=chr end

				--characters from 0x00 to 0x0f set the color
				if (chr<16) color=v.getStringColormap(chr*4096) end

				--print the character
				if (((chr >= 16) and (chr < 32)) or (chr>=128)) --Extended ASCII
					if (v.patchExists(charset..strchar))
						v.draw(cx*8, cy*8, v.cachePatch(charset..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
					else --unknown symbol, print "?"
						v.drawString(cx*8, cy*8, "?", V_SNAPTOTOP|V_SNAPTOLEFT)
					end
				elseif ((chr > 32) and (chr < 127)) --Standart ASCII (printable symbols)
					v.draw(cx*8, cy*8, v.cachePatch("STCFN"..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
				end

				--position shifting for the next character
				if (chr>=16) cx = $ + 1 end --make place for the next non-color character
			end

			--line is drawn, prepare everything for the next one
			cx = 0
			cy = $ + 1
			if (cy >= scrnRows) break end --Trying to draw out of screen bounds, stop rendering here
		end
		--scroll bar
		--not quite finished
		v.drawFill(312, 0, 8, 200, 16|V_SNAPTOTOP|V_SNAPTORIGHT) --scroll bar
		if ((#buffer - scrnColumns) <= 0) realPagelen = scrnColumns
		else realPagelen = #buffer - scrnColumns end
		pagestep = #buffer/scrnColumns
		v.drawFill(312, ((p.mmhelp.pos - 1)*pagestep), 8, realPagelen, V_SNAPTOTOP|V_SNAPTORIGHT) --scroll slider

		v.drawFill(0, 188, (v.width()/v.dupx()), 2, V_SNAPTOBOTTOM|V_SNAPTOLEFT) --horizontal line

		V_DrawStrASCII(v, 0, 192, "EN", "Use \7Up\0/\7Down\0 arrow keys to scroll, \7Left\0/\7Right\0 keys to switch pages", V_SNAPTOBOTTOM|V_SNAPTOLEFT, 32768) --FU/2
		V_DrawStrASCII(v, 0, 196, "EN", "Press \7ESC\0 to leave HELP", V_SNAPTOBOTTOM|V_SNAPTOLEFT, 32768) --FU/2
		v.drawString(144, 192, "\x81Work in progress UI", V_SNAPTOBOTTOM|V_SNAPTORIGHT)
	end
end, "game")