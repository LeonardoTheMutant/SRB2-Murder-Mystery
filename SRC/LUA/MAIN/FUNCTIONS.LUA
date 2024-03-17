-- FUNCTIONS.LUA
-- Code by LeonardoTheMutant, Jisk and Tedvin11
--
-- Function declarations

--
--CONSTANTS
--
local mmtxt=MM.text
local dthsfx={sfx_mmdth1, sfx_mmdth2, sfx_mmdth3, sfx_mmdth4, sfx_emj08, sfx_emj14} --SFXs that are used as Death Sounds

--
--GAME.LUA
--

-- how many players with same role should exist?
rawset(_G, "MM_GetRoleMultiplier", function()
	if (PlayerCount()<7) return 1
	elseif (PlayerCount()>=7) and (PlayerCount()<=10) return 2
	elseif (PlayerCount()>=11) and (PlayerCount()<=14) return 3
	elseif (PlayerCount()>14) return 4 end --EVEN THIS NUMBER WAS REACHED!!!
end)

-- RoleAssigner v5
-- Give roles at the beginning of each new round
-- F to LeoTM - he got insane while coding this 256 times
rawset(_G, "MM_AssignRoles", function()
	if (gametype != GT_MURDERMYSTERY) return
	elseif (gametype == GT_MURDERMYSTERY) and (splitscreen)
		COM_BufInsertText(server, "MAP JADE VALLEY -GAMETYPE MATCH")
		print("\x85Hold on!\x80\nMurder Mystery is not designed for splitscreen mode! Your game switched to MATCH becase it's as same as playing 1v1 in MM.\nSo don't try to load Murder Mystery in splitscreen again. It will have no sense.")
		return
	end

	-- Take care of the lonely player
	if (PlayerCount() < 2)
		for p in players.iterate do p.role = nil end
		return
	end

	local plrs = {}
	for p in players.iterate --prepare players and get their player nodes
		p.role = ROLE_NONE
		table.insert(plrs, #p)
	end
    for r = ROLE_MURDERER, ROLE_SHERIFF --assign Murderers and Sheriffs
        for i = 1, MM_GetRoleMultiplier()
            local randPlr = P_RandomKey(#plrs) + 1 --select random player
            players[plrs[randPlr]].role = r --assign the role to that player
            table.remove(plrs, randPlr) --and finally forget about it
        end
    end
	--tell each player its role personally
	for p in players.iterate
		if (p.role == ROLE_NONE) p.role = ROLE_INNOCENT end --we previously didn't make Innos so make them now
		chatprintf(p, mmtxt[p.mmlang]["ROLE_GET"][p.role])
		p.roleflicker = 105 --timer for role name flickering on HUD
	end
	if (MM.devbuild)
		print("\x82".."MM_AssignRoles() results:")
		for p in players.iterate print(p.name..": "..p.role) end
	end
end)

--Function to display global messages in chat
--Works as regular chatprint but sends the global message personally to everyone in their (player.mmlang) language
--var argument is mostly used as an INTEGER for win reasons or player role that left. For some messages it's STRING
rawset(_G, "MM_ChatprintGlobal", function(msg, var)
	for p in players.iterate
		if ((msg == "MURD_KILLED") or (msg == "SHERI_KILLED") or (msg == "HERO_KILLED")) chatprintf(p, mmtxt[p.mmlang][msg][1].." "..var.." "..mmtxt[p.mmlang][msg][2])
		elseif (msg == "SHERI_KILLED_NODROP") chatprintf(p, mmtxt[p.mmlang]["SHERI_KILLED"][1].." "..var.." "..mmtxt[p.mmlang]["SHERI_KILLED"][3])
		elseif ((msg == "LAST_LEFT") or (msg=="ONE_LEFT") or (msg=="REPLACE_LEFT"))
			if (var != ROLE_HERO) chatprintf(p, mmtxt[p.mmlang][msg][var]) --for Murd and Sheri
			else chatprintf(p, mmtxt[p.mmlang][msg][3]) end --for Hero
		elseif (msg == "WIN") chatprintf(p, mmtxt[p.mmlang]["ENDROUND"][var])
		elseif (msg == "INNO_HURT") chatprintf(p, mmtxt[p.mmlang]["INNO_HURT"][var])
		elseif msg
			if (mmtxt[p.mmlang][msg]) chatprintf(p, mmtxt[p.mmlang][msg])
			else chatprintf(p, msg.."; "..var) end --no text exists in the database
		end
	end
end)

rawset(_G, "MM_KillPlayer", function(p, k) --player, killer (both MOBJ_T)
	if ((not p) or (not p.player)) error("MM_KillPlayer() argument #1: player's mobj_t expected") end
	local plr = p.player
	plr.spectator = true
	plr.role = ROLE_NONE
	plr.flashscrn = 1
	if ((k) and (k.player))
		plr.killedby = k.player.name
		k.player.kills = $ + 1
	else plr.killedby = "your stupidity" end

	local body = P_SpawnMobjFromMobj(p,0,0,0,MT_DEADPLR)
	if (p.skin == "tails") body.state = S_TMMDEAD
	elseif (p.skin == "knuckles") body.state = S_KMMDEAD
	elseif (p.skin == "amy") body.state = S_AMMDEAD
	elseif (p.skin == "fang") body.state = S_FMMDEAD
	elseif (p.skin == "metalsonic") body.state = S_MMMDEAD
	else body.state = S_SMMDEAD end --Sonic, also fallback for custom chars (I really should ban them)
	body.color = p.color

	S_StartSound(p, dthsfx[P_RandomKey(#dthsfx) + 1], plr) --play random death sound personally
end)

--Function to end the round, arguments here:
--w is the role that won the game, the possible values are 0-None (Tie), 1-Murderer, 2-Civilians (Sheriff, Innocent, Hero)
--endtext is the text to display in the chat
--reason is used differently for each message but usualy it is a win reason
rawset(_G, "MM_EndRound", function(w, endtext, reason)
	MM.winner=w
	if (endtext=="WIN") MM.winreason=reason end
	G_ExitLevel()
	if (endtext) MM_ChatprintGlobal(endtext, reason) end
	for p in players.iterate p.spectator=false end
	if isdedicatedserver --console log for dedicated host
		if (endtext=="WIN") CONS_Printf(server, "- "..mmtxt["EN"]["ENDROUND"][reason])
		else CONS_Printf(server, "- "..mmtxt["EN"][endtext][reason]) end
	end
end)

rawset(_G, "MM_CheckPlayers", function()
	if (PlayerCount(ROLE_MURDERER)) and (not PlayerCount(ROLE_SHERIFF)) and (not PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT)) MM_EndRound(ROLE_MURDERER, "WIN", WIN_MURD)
	elseif (PlayerCount(ROLE_MURDERER)) and ((PlayerCount(ROLE_SHERIFF)) or (PlayerCount(ROLE_HERO))) and (not PlayerCount(ROLE_INNOCENT)) S_ChangeMusic("SHWDWN", 1) end
end)

rawset(_G, "MM_SetRandomInnoAs", function(role)
	local plrs={}
	for plr in players.iterate
		if (not plr.spectator) and (plr.role==ROLE_INNOCENT) table.insert(plrs, #plr) end
	end
    local p = players[plrs[P_RandomKey(#plrs)+1]]
	p.role=role
	p.roleflicker=70
	if (role!=ROLE_HERO) chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][p.role]) --for Murd/Sheriff
	else chatprintf(p, MM.text[p.mmlang]["NEWROLE_GET"][3]) end --for Hero
	return
end)

rawset(_G, "MM_GetSHREMLinterval", function(dist)
	if (dist < 256) return 5
	elseif (dist < 512) return 10
	elseif (dist < 1024) return 20
	elseif (dist < 2048) return 30
	elseif (dist < 3072) return 35
	else return 0 end
end)

--
--HUD.LUA
--
rawset(_G, "V_DrawStrASCII", function(v, x, y, lang, str, flags, fontsize)
	--Draw strings in Murder Mystery format with swapable ASCII table

	assert(v, "V_DrawStrASCII() argument #1: drawer variable expected")
	if (not str) or (type(str) != "string") error("V_DrawStrASCII() argument #5: string expected")
	elseif (not fontsize) fontsize = FU end

	local x = x or 0
	local y = y or 0
	local flg = flags or 0

	--set the characer encoding for the given language
	local charset = MM.text[lang]["CHARSET"] or "STCFN"

	--set the width of symbols
	local width = fontsize >> 13 --fontsize/8192

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & 3072) spaceSize = 8 --V_MONOSPACE
	elseif (flg & 1024) spaceSize = 6 end --V_6WIDTHSPACE
	--scale for different font sizes
	if (fontsize < FU) spaceSize = $/(FU/fontsize)
	elseif (fontsize > FU) spaceSize = $*fontsize/FU end

	--text
	local color=v.getStringColormap(0) --default to white color

	--character X position
	local cx = x

	--init variables
	local chr
	local strchar --the string version of the char number
	
	--draw the string
	for i = 1,#str
		chr = string.byte(str:sub(i,i)) --numeric value of the single character
		
		if (chr < 100) strchar = "0"..chr --make the number to be 3 digit
		else strchar = chr end

		--characters from 0x00 to 0x0f set the color
		if (chr < 16) color = v.getStringColormap(chr*4096) end

		--print the character
		if (chr >= 128) --extended ASCII
			if (v.patchExists(charset..strchar))
				v.drawScaled(FU*cx, FU*y, fontsize, v.cachePatch(charset..strchar), flg, color)
			else --unknown symbol, print "?"
				v.drawScaled(FU*cx, FU*y, fontsize, v.cachePatch("STCFN063"), flg, color)
			end
		elseif (chr >= 16) and (chr < 128) --standart ASCII
			if (v.patchExists("STCFN"..strchar))
				v.drawScaled(FU*cx, FU*y, fontsize, v.cachePatch("STCFN"..strchar), flg, color)
			else --unknown symbol, print "?" unless it's a space symbol
				if (chr != 32) v.drawScaled(FU*cx, FU*y, fontsize, v.cachePatch("STCFN063"), flg, color) end
			end 
		end

		--shift X position for the next character
		if (chr == 32) cx = $ + spaceSize --space has a different character width
		elseif (chr > 16) and (chr != 32) cx = $ + width end --it's a regular character
	end
end)

rawset(_G, "V_ConvertStringColor", function(str)
	--convert string color codes from SRB2 to MM format

	local strng = {}
	local chr
	for i = 1, #str
		chr = string.byte(str:sub(i,i))
		if (chr >= 128) strng[i] = string.char((chr%0x80)%0x10)
		else strng[i] = str:sub(i,i) end
	end
	return table.concat(strng)
end)

rawset(_G, "V_ConvertStringColor2", function(str)
	--convert string color codes from MM to SRB2 format

	local strng = {}
	local chr
	for i = 1, #str
		chr = string.byte(str:sub(i,i))
		if (chr < 16) strng[i] = string.char(chr + 0x80)
		else strng[i] = str:sub(i,i) end
	end
	return table.concat(strng)
end)

rawset(_G, "V_StrWidthASCII", function(str, flags, fontsize)
	--Get string width for the V_DrawStrASCII() function

	if (not str) or (str == "") return 0 end

	--symbol width
	local width
	if (fontsize) width = fontsize >> 13 --fontsize/8192
	else
		width = 8
		fontsize = FU
	end
	local flg = flags or 0
	local pixelLen = 0

	--set the space width
	local spaceSize = 4 --default to V_OLDSPACING
	if (flg & 3072) spaceSize = 8 --V_MONOSPACE
	elseif (flg & 1024) spaceSize = 6 end --V_6WIDTHSPACE
	--scale for different font sizes
	if (fontsize < FU) spaceSize = $/(FU/fontsize)
	elseif (fontsize > FU) spaceSize = $*(fontsize/FU) end

	local char

	for i = 1,#str
		char=string.byte(str:sub(i, i)) --character number
		if (char > 16) --character should be not a MM color code
			if (char == 32) pixelLen = $ + spaceSize --space
			else pixelLen = $ + width end --regular character
		end
	end
	return pixelLen
end)

rawset(_G, "V_DrawStrASCIIcentered", function(v, x, y, lang, str, flags, fontsize)
	V_DrawStrASCII(v, x - V_StrWidthASCII(str,flags,fontsize)>>1, y, lang, str, flags, fontsize)
end)

rawset(_G, "V_DrawTextPatch", function(v, x, y, patch)
	--draw an image from the text data, similar to v.draw()
	--the text data itself is a table of strings containing the
	--SRB2 palette's color values

	assert(v, "V_DrawTextPatch() argument #1: drawer variable expected")
	local x = x or 0
	local y = y or 0
	assert(patch, "V_DrawTextPatch() argument #4: patch text data expected")

	local pixelColor

	for row = 1, #patch do
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor != 0xFF) --pixel is not transparent
				v.drawFill((x + column), (y + row), 1, 1, pixelColor) --draw it
			end
		end
	end
end)

rawset(_G, "V_TextPatch_SwapColor", function(patch, color1, color2)
	assert(patch, "V_TextPatch_SwapColor() argument #1: patch text data expected")
	local color1 = color1
	if (type(color1) == "string") color1 = color1:byte() end
	local color2 = color2
	if (type(color2) == "string") color2 = color2:byte() end

	local ptch = {} --the returned copy
	local pixelColor

	for row = 1, #patch do
		ptch[row] = patch[row] --copy line from original to copy
		for column = 1, #patch[row] do
			pixelColor = patch[row]:byte(column, column) --get the pixel color value
			if (pixelColor == color1) --swap the color
				ptch[row] = $:sub(1, column - 1) .. string.char(color2) .. $:sub(column + 1)
			end
		end
	end

	return ptch
end)

rawset(_G, "V_TextPatchWidth", function(patch)
	assert(patch, "V_TextPatchWidth() argument #1: patch text data expected")
	local width = 0

	for row = 1, #patch do
		if (#patch[row] > width) width = #patch[row] end
	end

	return width
end)

rawset(_G, "wep2rw", function(wep) --convert WEP_* constant to RW_* constant
	if (wep==1) return 1
	elseif (wep==2) return 2
	elseif (wep==3) return 4
	elseif (wep==4) return 8
	elseif (wep==5) return 16
	elseif (wep==6) return 32
	end
end)

rawset(_G, "V_GetSHREMLiconID", function(dist)
	if (dist < 256) return 6
	elseif (dist < 512) return 5
	elseif (dist < 1024) return 4
	elseif (dist < 2048) return 3
	elseif (dist < 3072) return 2
	else return 1 end
end)

--
--CHAT.LUA
--
rawset(_G, "MM_ChatPlaySFX", function(sfx)
	for p in players.iterate S_StartSound(nil, sfx, p) end
end)

--
--CCMD.LUA
--
rawset(_G, "MM_PrintContents", function(p,l)
	CONS_Printf(p, "")
	for i, str in pairs(MM.text[l]["MMHELP_CMD"]["CONTENTS"]) CONS_Printf(p, str) end
end)

--
--WEAPONS.LUA
--
-- A port of P_DrainWeaponAmmo() from C source code with MM modifications
rawset(_G, "P_DrainWeaponAmmo", function(p, weapon)
	p.powers[weapon] = $ - 1

	if (p.rings < 1)
		p.ammoremovalweapon = p.currentweapon;
		p.ammoremovaltimer  = ammoremovaltics;

		if (p.powers[weapon] > 0) -- can't take a ring that doesn't exist
			p.powers[weapon] = $ - 1
			p.ammoremoval = 2
		else
			p.ammoremoval = 1
		end
	else
		P_GivePlayerRings(p, -1)
	end
end)

-- A port of P_SetWeaponDelay() from C source code
rawset(_G, "P_SetWeaponDelay", function(p, delay)
	p.mmweapondelay = delay;

	if (p.skin == 2) -- Knuckles
		-- Multiply before dividing.
		-- Loss of precision can make a surprisingly large difference.
		p.mmweapondelay = ($*2)/3
	end
end)

--
--MINIGAME.LUA
--
rawset(_G, "PONG_SetVelocity", function(side)
	side = $ or 0

	local x = 0
	if (side < 0) x = -1
	elseif (side > 0) x = 1
	else while (not x) do x = P_RandomRange(-1, 1) end end

	local y = 0
	while (not y) y = P_RandomRange(-2, 2) end

	MM.pong.velocity.x = x
	MM.pong.velocity.y = y
end)

rawset(_G, "PONG_Reset", do
	MM.pong.ball.x = 79
	MM.pong.ball.y = 39

	PONG_SetVelocity()

	MM.pong.hits = 0
	MM.pong.speed = 1
end)

--
--GLOBAL
--
rawset(_G, "PlayerCount", function(role)
	local plrc = 0
	if (role)
		for p in players.iterate do if (p.role == role) plrc = $ + 1 end end
	else
		for p in players.iterate do plrc = $ + 1 end
	end
	return plrc
end)
rawset(_G, "PlayersAlive", function()
	local plrs = 0
	for p in players.iterate do if (not p.spectator) plrs = $ + 1 end end
	return plrs
end)
rawset(_G, "MM_Get2Players", function()
	if (PlayerCount() != 2) return false end
	local plrs = {}
	for p in players.iterate
		plrs[#plrs + 1] = p
		if (#plrs == 2) break end
	end
	return plrs
end)

--spawn Sheriff Emerald
rawset(_G, "MM_SpawnSHREML", function(x, y, z)
	if (x == nil) or (y == nil) or (z == nil) error("Not enough arguments for MM_SpawnSHREML(int x, int y, int z)") end
	table.insert(MM.shremls, (#MM.shremls + 1), P_SpawnMobj(x ,y, z, MT_SHREML))
end)

-- Returns the height of the sector floor at (x, y)
rawset(_G, "P_GetSectorFloorZAt", function(sector, x, y)
	if (sector.f_slope) return P_GetZAt(sector.f_slope, x, y)
	else return sector.floorheight end
end)

-- Returns the height of the sector ceiling at (x, y)
rawset(_G, "P_GetSectorCeilingZAt", function(sector, x, y)
	if (sector.c_slope) return P_GetZAt(sector.c_slope, x, y)
	else return sector.ceilingheight end
end)
-- Returns the top height of the FOF at (x, y)
rawset(_G, "P_GetFOFTopZAt", function(fof, x, y)
	if (fof.t_slope) return P_GetZAt(fof.t_slope, x, y)
	else return fof.topheight end
end)

-- Returns the height of the sector ceiling at (x, y)
rawset(_G, "P_GetFOFBottomZAt", function(fof, x, y)
	if (fof.b_slope) return P_GetZAt(fof.b_slope, x, y)
	else return fof.bottomheight end
end)

/*
rawset(_G, "WordWrapString", function(s, x) --https://stackoverflow.com/questions/35006931/lua-line-breaks-in-strings
	if (not s) return {} end
	x = x or 38
	local t = {""}
	local function cleanse(s) return s:gsub("@x%d%d%d",""):gsub("@r","") end
	for prefix, word, suffix, newline in s:gmatch("([ \t]*)(%S*)([ \t]*)(\n?)") do
		if #(cleanse(t[#t])) + #prefix + #cleanse(word) > x and #t > 0 then
			table.insert(t, word..suffix) -- add new element
		else -- add to the last element
			t[#t] = t[#t]..prefix..word..suffix
		end
		if #newline > 0 then table.insert(t, "") end
	end
	return t
end)

rawset(_G, "V_GetHelpPageSize", function(l, p, x)
	assert(MM.text[l]["MMHELP"][p], "Page specified does not exist. Is language specified correctly?")
	local size = 0
	for lineID = 0, #MM.text[l]["MMHELP"][p] do
		for sublineID, sublineText in pairs(WordWrapString(MM.text[l]["MMHELP"][p][lineID], x))
			size = $ + 1
		end
	end
	return size
end)
*/