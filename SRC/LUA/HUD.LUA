-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

--Constants
local HudInfoSize = {0,0,0}
local maxHudIfnfoSize = 0
local duelmodeCVAR = CV_FindVar("mm_duelmode")
local nogunsCVAR = CV_FindVar("mm_noguns")

local function wep2rw(wep) --convert WEP_* constant to RW_* constant
	return 2^(wep - 1)
end

local function V_GetSHREMLiconID(dist)
	if (dist < 256) return 6
	elseif (dist < 512) return 5
	elseif (dist < 1024) return 4
	elseif (dist < 2048) return 3
	elseif (dist < 4096) return 2
	else return 1 end
end

--
-- Main game HUD
--
hud.add(function(v, p)
	if (gametype != GT_MURDERMYSTERY) --in case if switched from MM to another gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("time")
		hud.enable("rings")
		hud.enable("weaponrings")
		return
	end

	--Patch Graphics loading
	if (not MM.graphics)
		if (MM.devbuild) print("\x82Loading MM graphics") end

		MM.graphics={}

		--Palette pixels
		MM.graphics.pixel={}
		for i = 0, 255 do
			if (v.patchExists("PIXEL_"..string.format("%02X", i))) then MM.graphics.pixel[i] = v.cachePatch("PIXEL_"..string.format("%02X", i)) end
		end

		--Colon for time counter
		V_LoadPatch(v, "STTCOLON")

		--Emerald icon
		V_LoadPatch(v, "CHAOS3")

		--Radar icons
		for i = 1, 6 do
			if v.patchExists("IDEYAR"..i) then V_LoadPatch(v, "IDEYAR"..i) end
		end

		--Weapon icons
		for i = -2, 6 do V_LoadPatch(v, MM.weapons[i][1]) end
		V_LoadPatch(v, "CURWEAP") --weapon selector

		--Past/Future Warp Signs
		V_LoadPatch(v, "TWS_FUTR")
		V_LoadPatch(v, "TWS_PAST")

		--MMHELP scrolling background
		V_LoadPatch(v, "NTSATKT2")
		V_LoadPatch(v, "NTSATKB1")

		--Sonic Run
		--Running frames
		for i = 1, 2 do
			if v.patchExists("SNC_RUN"..i) then V_LoadPatch(v, "SNC_RUN"..i) end
		end
		--Spinning frames
		for i = 1, 3 do
			if v.patchExists("SNC_SPN"..i) then V_LoadPatch(v, "SNC_SPN"..i) end
		end
		--Idle/standing frame
		if v.patchExists("SNC_STND") then V_LoadPatch(v, "SNC_STND") end
		--Countdown numbers
		for i = 1, 3 do V_LoadPatch(v, "RACE"..i) end
		V_LoadPatch(v, "RACEGO")
		
		--Character sets
		V_LoadCharset(v, "STCFN") --"Standart Console Font", built-in SRB2 set
		V_LoadCharset(v, "1250C") --Windows1250
		V_LoadCharset(v, "1251C") --Windows1251
		--V_LoadCharset(v, "1253C") --Windows1253
		V_LoadCharset(v, "1254C") --Windows1254
	end

	--Do not render the main HUD if it was disabled by another script
	if (p.mmhelp.active) or (p.debugdrawer) or (MM.minigame and p.minigame) return end

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"

	if (p != consoleplayer)
		if (p.role) then v.drawString(160, 100, MM.RoleColor[p.role].."* VIEWPOINT *", 0, "center")
		else v.drawString(160, 100, "* Left the game *", 0, "center") end
	end

	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	local scorePatchName
	if ((p.role == ROLE_MURDERER) or (p.spectator)) scorePatchName = "BMP_VICTIMS"
	else scorePatchName = "BMP_SUSPECTS" end

	if (MM.text[consoleplayer.mmlang][scorePatchName])
		HudInfoSize[1] = V_TextPatchWidth(MM.text[consoleplayer.mmlang][scorePatchName]) + 40
	else
		HudInfoSize[1] = 96
	end
	--TIME
	if (MM.text[consoleplayer.mmlang]["BMP_TIME"])
		HudInfoSize[2] = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_TIME"]) + 64
	else
		HudInfoSize[2] = 96
	end
	--RINGS
	if (MM.text[consoleplayer.mmlang]["BMP_RINGS"])
		HudInfoSize[3] = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_RINGS"]) + 52
	else
		HudInfoSize[3] = 92
	end

	--find the longest element
	maxHudIfnfoSize = HudInfoSize[1]
	for element = 2, 3 do if (HudInfoSize[element] > maxHudIfnfoSize) then maxHudIfnfoSize = HudInfoSize[element] end end

	local xoff --X offset for Text Patches
	local yoff --Y offset for Text Patches

	--now we can draw

	--SUSPECTS/VICTIMS
	--Draw the Text Label
	if (MM.text[consoleplayer.mmlang][scorePatchName])
		xoff = V_GetTextPatchOffsetX(consoleplayer.mmlang, scorePatchName)
		yoff = V_GetTextPatchOffsetY(consoleplayer.mmlang, scorePatchName)
		V_DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, xoff, yoff, MM.text[consoleplayer.mmlang][scorePatchName], hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())
	else --in case Text Patch was not found
		if (scorePatchName == "BMP_VICTIMS")
			v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "VICTIMS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
		else
			v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "SUSPECTS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
		end
	end
	--Calculate the number of suspects/victims
	local plrsAlive
	if (p.role == ROLE_MURDERER)
		plrsAlive = PlayersAlive() - PlayerCount(ROLE_MURDERER)
	elseif (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO)
		plrsAlive = PlayersAlive() - PlayerCount(ROLE_SHERIFF) - PlayerCount(ROLE_HERO)
	elseif (p.role == ROLE_INNOCENT) or (not p.role)
		plrsAlive = PlayersAlive() - 1
	end
	--Draw the number
	v.drawNum(((hudinfo[HUD_SCORE].x + maxHudIfnfoSize) - 16), hudinfo[HUD_SCORE].y, plrsAlive, hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())

	--TIME
	--timer calculation
	local timertime = (MM.timelimit * 2100) - leveltime

	if (timertime < 0) timertime = 0 end
	if (MM.text[consoleplayer.mmlang]["BMP_TIME"])
		xoff = V_GetTextPatchOffsetX(consoleplayer.mmlang, "BMP_TIME")
		yoff = V_GetTextPatchOffsetY(consoleplayer.mmlang, "BMP_TIME")
		--Draw the Text Label
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4))
			--Swap the colors in the label for flashing effect
			--0x49 in SRB2's palette is Yellow, 0x25 is Red
			V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, xoff, yoff, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f|V_PERPLAYER.localTransFlag())
		else
			V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, xoff, yoff, MM.text[consoleplayer.mmlang]["BMP_TIME"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
		end
	else --in case Text Patch was not found
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4))
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
		else
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
		end
	end
	--Draw the time
	v.drawPaddedNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timertime), 2, hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --seconds
	v.draw(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, MM.graphics["STTCOLON"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --colon
	v.drawNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timertime), hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --minutes

	--RINGS
	if (not p.spectator)
		if (MM.text[consoleplayer.mmlang]["BMP_RINGS"])
			xoff = V_GetTextPatchOffsetX(consoleplayer.mmlang, "BMP_RINGS")
			yoff = V_GetTextPatchOffsetY(consoleplayer.mmlang, "BMP_RINGS")
			if (not p.rings) and (leveltime & 4)
				V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, xoff, yoff, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_RINGS"], 0x49, 0x25), hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
			else
				V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, xoff, yoff, MM.text[consoleplayer.mmlang]["BMP_RINGS"], hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
			end
		else --in case Text Patch was not found or the game is splitscreen
			if (not p.rings) and (leveltime & 4)
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
			else
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
			end
		end
		v.drawNum(((hudinfo[HUD_RINGS].x + maxHudIfnfoSize) - 16), hudinfo[HUD_RINGS].y, p.rings, hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
	end
	
	--Time Warp Sign ("Warp ticket")
	if (p.timetravel) and (not p.spectator) and ((p.timetravel.warptimer < 70) or ((p.timetravel.warptimer >= 70) and (not (p.timetravel.warptimer & 1))))
		if (p.timetravel.timesign and (p.timetravel.timesign == 1)) --Past
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_PAST"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		elseif (p.timetravel.timesign and (p.timetravel.timesign == 2)) --Future
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_FUTR"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		end
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x << FRACBITS), (hudinfo[HUD_LIVES].y << FRACBITS), 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE|V_PERPLAYER|v.localTransFlag())

	--Show your role
	if ((p.role) and  (p.role > ROLE_NONE) and (not (p.roleflicker % 4)))
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), charset, MM.RoleColorHUD[p.role]..MM_GetText(consoleplayer.mmlang, "HUD_ROLES", p.role), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
	end
	
	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.timetravel and p.timetravel.timezone) and (not p.spectator)
		if (p.timetravel.timezone == TIMEZONE_PAST) --Past
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), charset, "\22"..MM_GetText(consoleplayer.mmlang, "HUD_PAST"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		elseif (p.timetravel.timezone > TIMEZONE_PRESENT) --One of the Futures
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), charset, "\22"..MM_GetText(consoleplayer.mmlang, "HUD_FUTURE"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		end
	end

	if (p.spectator)
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), charset, MM.RoleColorHUD[5]..MM_GetText(consoleplayer.mmlang, "HUD_ROLES", 5), hudinfo[HUD_LIVES].f|v.localTransFlag())
		if (MM.text[consoleplayer.mmlang]["HUD_DEAD"])
			for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_DEAD"])
				V_DrawStrASCII_Center(v, 160, (112 + (y << 3)), charset, i, v.localTransFlag())
			end
		else
			if (MM.devbuild) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mmlang.."\"\x87][\x80\"HUD_DEAD\"\x87]\x82 that does not exist!\x80") end
		end
		if (p.role == nil)
			if (MM.text[consoleplayer.mmlang]["HUD_MIDJOIN"])
				for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_MIDJOIN"])
					V_DrawStrASCII_Center(v, 160, (152 + (y << 2)), charset, i, v.localTransFlag(), true)
				end
			else
				if (MM.devbuild) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mmlang.."\"\x87][\x80\"HUD_MIDJOIN\"\x87]\x82 that does not exist!\x80") end
			end
		end
		if (p.killedby)
			if (p.killedby == "your stupidity")
				V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), charset, "\21"..MM_GetText(consoleplayer.mmlang, "HUD_KILLBY").."\16 "..MM_GetText(consoleplayer.mmlang, "HUD_STUPID"), V_SNAPTOTOP|V_SNAPTOLEFT)
			else
				V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), charset, "\21"..MM_GetText(consoleplayer.mmlang, "HUD_KILLBY").."\16 "..p.killedby, hudinfo[HUD_RINGS].f)
			end
		end
		if ((not p.minigame) and (not MM.twopgame) and (not MM.minigame))
			V_DrawStrASCII_Right(v, 320, 0, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
			V_DrawStrASCII_Right(v, 320, 4, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
			V_DrawStrASCII_Right(v, 320, 8, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
		end
	end

	if (not p.spectator) and (MM.twopgame) and (MM.duelplrs)
		local rival
		if (valid(MM.duelplrs[1]) and (MM.duelplrs[1] == p))
			rival = MM.duelplrs[2]
		elseif (valid(MM.duelplrs[2]) and (MM.duelplrs[2] == p))
			rival = MM.duelplrs[1]
		end

		if (valid(rival))
			if ((not p.minigame) and (not rival.minigame))
				V_DrawStrASCII_Right(v, 320, 0, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				V_DrawStrASCII_Right(v, 320, 4, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "REQUEST"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
			elseif ((p.minigame) and (not rival.minigame))
				V_DrawStrASCII_Right(v, 320, 0, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "WAIT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				if (not p.minigametimeout)
					V_DrawStrASCII_Right(v, 320, 4, charset, (MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "PRESS").." "..MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "CANCEL")), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				end
			elseif ((not p.minigame) and (rival.minigame) and (leveltime & 1))
				V_DrawStrASCII_Right(v, 320, 0, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				V_DrawStrASCII_Right(v, 320, 4, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "ACCEPT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
			end
		end
	end

	--I fucking recreated the whole vanilla ring weapons dock to slightly move it somewhere else :skull:
	if ((p.role == ROLE_MURDERER) or (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO))
		local wepPatchFlags={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --grenade
			0, --explosion
			0, --rail
		}
		wepPatchFlags[0] = 0 --infinity
		local wepTextFlags={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --grenade
			0, --explosion
			0, --rail
		}
		wepTextFlags[0] = 0 --infinity

		--weapon selector Y position calculation
		--ported from the C Source Code
		local q = p.mmweapondelay
		local del = 0
		local pv = 16
		while (q)
			if (q > pv)
				del = $ + pv
				q = $ - pv
				q = $ >> 1
				if (pv > 1) pv = $ >> 1 end
			else
				del = $ + q
				break
			end
		end

		if ((nogunsCVAR.value == 1) and (not MM.shwdwn) and PlayerCount(ROLE_INNOCENT)) or (nogunsCVAR.value == 2)
			if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
			v.draw((MM.hud.game.pos.ringWepMurd.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon
			v.draw((MM.hud.game.pos.ringWepMurd.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --selector
		else
			--Ring weapons
			if (p.role == ROLE_MURDERER) and (PlayerCount(ROLE_INNOCENT) or ((not PlayerCount(ROLE_INNOCENT)) and (not duelmodeCVAR.value)))
				--draw the only icon for Murderer
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWepMurd.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString(MM.hud.game.pos.ringWepMurd.x + 24, (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER, "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWepMurd.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Red Ring icon
				end
				v.draw((MM.hud.game.pos.ringWepMurd.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --selector
			elseif ((p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO) or ((p.role == ROLE_MURDERER) and (not PlayerCount(ROLE_INNOCENT)) and duelmodeCVAR.value))
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString((MM.hud.game.pos.ringWep.x + 24), (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Red Ring icon
				end
				for weapon = 1, 6 do
					if (p.powers[weapon + 14])
						if (p.powers[weapon + 14] >= MM.weapons[weapon][5]) then wepTextFlags[weapon] = wepTextFlags[weapon] | V_YELLOWMAP end

						if (p.ringweapons & wep2rw(weapon))
						else
							wepPatchFlags[weapon] = V_80TRANS
							wepTextFlags[weapon] = wepTextFlags[weapon] | V_TRANSLUCENT
						end
						v.draw((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[weapon][1]], wepPatchFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ring weapon icon
						v.drawString((MM.hud.game.pos.ringWep.x + 24 + weapon*20), (MM.hud.game.pos.ringWep.y + 8), p.powers[weapon + 14], wepTextFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Ammo counter
					elseif (p.ringweapons & wep2rw(weapon))
						v.draw((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[weapon][1]], V_PERPLAYER|V_SNAPTOBOTTOM|V_TRANSLUCENT|v.localTransFlag())
					end
				end
				if ((p.ammoremovaltimer) and ((leveltime % 8) < 4))
					v.drawString((MM.hud.game.pos.ringWep.x + 8 + (p.ammoremovalweapon*20)), (MM.hud.game.pos.ringWep.y), "-"..p.ammoremoval, V_REDMAP|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ammo removal penalty
				end
				v.draw((MM.hud.game.pos.ringWep.x + 6 + p.currentweapon*20), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --selector
			end
		end
	end

	--Sheriff Emerald Radar for Innocents
	if (p.role == ROLE_INNOCENT) and (#MM.shremls) and (p.shreml_dist)
		v.drawScaled(10027008, 10223616, 32768, MM.graphics["IDEYAR"..V_GetSHREMLiconID(fixint(p.shreml_dist))], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --153*FU, 156*FU, FU/2
	end

	--Are you alone?
	if (PlayerCount() == 1)
		if (MM.text[consoleplayer.mmlang]["HUD_ALONE"])
			--Draw the text
			for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_ALONE"]) do V_DrawStrASCII_Center(v, 160, (128 + (y << 3)), charset, i, V_PERPLAYER|v.localTransFlag()) end
		else
			if (MM.devbuild) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mmlang.."\"\x87][\x80\"HUD_ALONE\"\x87]\x82 that does not exist!\x80") end
		end
	end

	--suggest a minigame
	if (PlayerCount() == 1) or ((p.spectator) and (not MM.minigame) and (not p.minigame) and (not MM.twopgame))
		V_DrawStrASCII_Right(v, 320, 0, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
		V_DrawStrASCII_Right(v, 320, 4, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
		V_DrawStrASCII_Right(v, 320, 8, charset, MM_GetText(consoleplayer.mmlang, "HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
	end

	--"Showdown duel!"
	if (PlayerCount(ROLE_MURDERER) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT)))
		V_DrawStrASCII_Center(v, 160, 192, charset, "\24"..MM_GetText(consoleplayer.mmlang, "HUD_SHOWDOWN"))
	end

	--Sneaking
	if ((p.sneak) and valid(p.mo) and P_IsObjectOnGround(p.mo))
		V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 24), charset, MM_GetText(consoleplayer.mmlang, "HUD_SNEAKING"), V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER|v.localTransFlag(), true)
	end
	
	--red Flash effect when you die
	if (p.flashscrn)
		v.drawStretched(0,0, (v.width() << FRACBITS), (v.height() <<FRACBITS), MM.graphics.pixel[0x23], ((p.flashscrn - 1) << FRACBITS)|V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER)
	end
	
	--white time warp spark effect
	if (p.timetravel and p.timetravel.spark)
		v.drawStretched(0,0, (v.width() << FRACBITS), (v.height() << FRACBITS), MM.graphics.pixel[0], ((p.timetravel.spark - 1) << FRACBITS)|V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER)
	end
	
	--Debug
	if MM.devbuild
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y, "\x87".."SRB2 MM "..MM.version.." DEBUG", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+8, "\x81 "..p.realmo.x.." "..p.realmo.y.." "..p.realmo.z.." \x80("..fixint(p.realmo.x).." "..fixint(p.realmo.y).." "..fixint(p.realmo.z)..")", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+16, "\x82".."LEVELTIME: \x80"..leveltime, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+24, "\x82".."AFK: \x80"..p.afk, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+32, "\x82".."MMLANG: \x80"..p.mmlang, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+40, "\x82".."KILLS: \x80"..p.kills, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+48, "\x82".."CHATDELAY: \x80"..p.chatdelay, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+56, "\x82".."MM.TWOPGAME: \x80"..tostring(MM.twopgame), V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+64, "\x82".."MMWEAPONDELAY: \x80"..p.mmweapondelay, V_PERPLAYER, "thin")
		if (p.shreml_dist) v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+72, "\x82".."SHREML_DIST: \x81"..p.shreml_dist.." \x80("..fixint(p.shreml_dist)..")", V_PERPLAYER, "thin")
		else v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+72, "\x82".."SHREML_DIST: \x81nil", V_PERPLAYER, "thin") end
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+80, "\x82".."SPEED: \x81"..p.speed.." \x80("..fixint(p.speed)..")", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+88, "\x82".."PLAYERSTATE: \x80"..p.playerstate, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+96, "\x82".."CAMPING: \x80"..p.camping, V_PERPLAYER, "thin")
	end
end, "game")

--
-- SCORES TAB
--
hud.add(function(v)
	if (gametype != GT_MURDERMYSTERY)
		hud.enable("rankings")
		return
	end

	hud.disable("rankings")
	-- Prerelease/Debug
	v.drawString(160, 0, "GAMETYPE IN PRERELEASE STATE, VERSION "..MM.version, V_SNAPTOTOP|v.localTransFlag(), "center")

	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"

	--Text
	V_DrawStrASCII_Center(v, 160, 12, charset, "\17"..MM_GetText(consoleplayer.mmlang, "MM"), v.localTransFlag())
	if (MM.text[consoleplayer.mmlang]["HUD_SCORESTAB"])
		for y,i in ipairs(MM.text[consoleplayer.mmlang]["HUD_SCORESTAB"])
			V_DrawStrASCII(v, 16, (16 + (y << 3)), charset, i, v.localTransFlag())
		end
	else
		if (MM.devbuild) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mmlang.."\"\x87][\x80\"HUD_SCORESTAB\"\x87]\x82 that does not exist!\x80") end
	end

	--Teammates tracker
	if (MM_TeammatesCount(consoleplayer))
		local teammateNo = 0
		V_DrawStrASCII(v, MM.hud.scores.pos.teammateInfo.x, (MM.hud.scores.pos.teammateInfo.y - 12), charset, MM.RoleColorHUD[consoleplayer.role]..MM_GetText(consoleplayer.mmlang, "HUD_TEAMMATES")..":", v.localTransFlag())
		for p in players.iterate
			if (consoleplayer == p) continue end
			if (MM_AreTeammates(consoleplayer, p))
				--character icon
				v.drawScaled((MM.hud.scores.pos.teammateInfo.x + (136*(teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) << 4)) << FRACBITS, 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
				--player name (colored as role)
				v.drawString((MM.hud.scores.pos.teammateInfo.x + 18 + (136*(teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) << 4)), MM.RoleColor[p.role]..p.name, V_ALLOWLOWERCASE|v.localTransFlag())
				--icon of the currently held weapon
				v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + (136*(teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) << 4)) << FRACBITS, 32768, MM.graphics[MM.weapons[p.currentweapon][1]], v.localTransFlag()) --FU/2
				--amount of currently held weapon ammo
				v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + 18 + (136*(teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) << 4)), p.powers[pw_infinityring + p.currentweapon], v.localTransFlag(), "thin")
				--red ring icon
				v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + (136*(teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) << 4)) << FRACBITS, 32768, MM.graphics[MM.weapons[-1][1]], v.localTransFlag()) --FU/2
				--amount of [red] rings
				v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + 18 + (136*(teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) << 4)), p.rings, v.localTransFlag(), "thin")
				teammateNo = $ + 1
			end
		end
	end

	v.drawFill(0, 172, 320, 2, 0) --horizontal line

	--Roles counter
	--Murderer
	V_DrawStrASCII(v, 20, 176, charset, MM.RoleColorHUD[ROLE_MURDERER]..MM_GetText(consoleplayer.mmlang, "HUD_ROLESALIVE", ROLE_MURDERER)..": "..PlayerCount(ROLE_MURDERER), v.localTransFlag())
	--Sheriff (and Hero)
	if (PlayerCount(ROLE_HERO))
		V_DrawStrASCII(v, 20, 184, charset, (MM.RoleColorHUD[ROLE_SHERIFF]..MM_GetText(consoleplayer.mmlang, "HUD_ROLESALIVE", ROLE_SHERIFF)..": "..PlayerCount(ROLE_SHERIFF)..MM.RoleColorHUD[ROLE_HERO].." + "..PlayerCount(ROLE_HERO)), v.localTransFlag())
	else
		V_DrawStrASCII(v, 20, 184, charset, (MM.RoleColorHUD[ROLE_SHERIFF]..MM_GetText(consoleplayer.mmlang, "HUD_ROLESALIVE", ROLE_SHERIFF)..": "..PlayerCount(ROLE_SHERIFF)), v.localTransFlag())
	end

	--Innocent
	if (PlayerCount(ROLE_INNOCENT)) V_DrawStrASCII(v, 20, 192, charset, (MM.RoleColorHUD[ROLE_INNOCENT]..MM_GetText(consoleplayer.mmlang, "HUD_ROLESALIVE", ROLE_INNOCENT)..": "..PlayerCount(ROLE_INNOCENT)), v.localTransFlag()) end
	--Online
	v.drawString(160, 176, "ONLINE: "..PlayerCount(), v.localTransFlag())

	--"Sheriff's Emerald is available!"
	if ((#MM.shremls) and (leveltime & 1))
		v.drawScaled(524280, 12058440, 32768, MM.graphics["CHAOS3"], v.localTransFlag()) --8*FU, 184*FU, FU/2
	end

	--red Flash effect when you die
	if (consoleplayer.flashscrn)
		v.drawStretched(0,0, (v.width() << FRACBITS), (v.height() <<FRACBITS), MM.graphics.pixel[0x23], ((consoleplayer.flashscrn - 1) << FRACBITS)|V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER)
	end

	--white time warp spark effect
	if (consoleplayer.timetravel and consoleplayer.timetravel.spark)
		v.drawStretched(0,0, (v.width() << FRACBITS), (v.height() << FRACBITS), MM.graphics.pixel[0], ((consoleplayer.timetravel.spark - 1) << FRACBITS)|V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER)
	end

	-- Prerelease/Debug
	if (MM.devbuild) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|v.localTransFlag(), "center") end
end, "scores")

--
-- Custom intermission HUD
--
hud.add(function(v)
	if (gametype != GT_MURDERMYSTERY)
		hud.enable("intermissiontally")
		return
	end

	--Do not render the Intermission when MapVote is working
	if ((MapVote) or (MapVoteNet and (MapVoteNet.state > 0))) return end

	hud.disable("intermissiontally")
	
	--here starts the insanity
	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"
	local plrs = {}
	local multiply = {x=0, y=0}
	
	V_DrawStrASCII_Center(v, 160, 4, charset, "\23"..MM_GetText(consoleplayer.mmlang, "MM"))

	--Map name drawer
	if (mapheaderinfo[gamemap].actnum == 0)
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *", 0, "center")
	else
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *", 0, "center")
	end

	v.drawFill(0, 40, 320, 2, 0) --horizontal line

	--player list
	for p in players.iterate do table.insert(plrs,p) end
	--sort players by kills count
	table.sort(plrs, function(a, b)
		return a.kills > b.kills
	end)

	-- Column names

	--vertical line and everything common for >8 player screen
	if (PlayerCount() > 8)
		v.drawFill(160, 40, 2, 144, 0)
		v.drawString(MM.hud.intermission.pos.kills2.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
		v.drawString((MM.hud.intermission.pos.kills2.x + 160), MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
	end
	--everything else which is uncommon
	if (PlayerCount() <= 8)
		v.drawString(MM.hud.intermission.pos.num.x, MM.hud.intermission.pos.players.y, "\x82#", 0)
		v.drawString(MM.hud.intermission.pos.name.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0)
		v.drawString(MM.hud.intermission.pos.kills.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0)
	elseif (PlayerCount() > 8) and (PlayerCount() <= 16)
		--players 1-8
		v.drawString(MM.hud.intermission.pos.num2.x, MM.hud.intermission.pos.players.y, "\x82#", 0, "thin")
		v.drawString(MM.hud.intermission.pos.name2.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 9-16
		v.drawString((MM.hud.intermission.pos.num2.x + 160), MM.hud.intermission.pos.players.y, "\x82#", 0, "thin")
		v.drawString((MM.hud.intermission.pos.name2.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	else
		--players 1-16
		v.drawString(MM.hud.intermission.pos.num3.x, MM.hud.intermission.pos.players.y, "\x82#", 0, "thin")
		v.drawString(MM.hud.intermission.pos.name3.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 17-32
		v.drawString((MM.hud.intermission.pos.num3.x + 160), MM.hud.intermission.pos.players.y, "\x82#", 0, "thin")
		v.drawString((MM.hud.intermission.pos.name3.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	end

	-- Player stats

	for i = 1, #plrs
		if (PlayerCount() <= 8) --Regular mode
			--Player number
			v.drawString((MM.hud.intermission.pos.num.x), (MM.hud.intermission.pos.players.y + (i << 4)), i)
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x - 20) << FRACBITS, (((MM.hud.intermission.pos.players.y - 4) + i << 4) << FRACBITS), 32768, v.getSprite2Patch(plrs[i].skin,SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1))
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i << 4)), MM.RoleColor[plrs[i].role]..plrs[i].name, V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i << 4)), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills.x), (MM.hud.intermission.pos.players.y + (i << 4)), plrs[i].kills)
		elseif ((PlayerCount() > 8) and (PlayerCount() <= 16)) --"Double column" mode
			if (i > 8) --players 9-16 are drawn on the second column
				multiply.x = 160
				multiply.y = -128
			end
			--Player number
			v.drawString((MM.hud.intermission.pos.num2.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) + multiply.y), i)
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name2.x + multiply.x - 20) << FRACBITS, ((MM.hud.intermission.pos.players.y - 4) + (i << 4) + multiply.y) << FRACBITS, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1))
				v.drawString((MM.hud.intermission.pos.name2.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) + multiply.y), MM.RoleColor[plrs[i].role]..string.sub(plrs[i].name, 1, 11), V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name2.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) + multiply.y), MM.RoleColor[5]..string.sub(plrs[i].name, 1, 11), V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) + multiply.y), plrs[i].kills)
		elseif (PlayerCount() > 16) --"Double column compact" mode
			if (i > 16) --players 17-32 are drawn on the second column
				multiply.x = 160
				multiply.y = -128
			end
			--back to the rows
			--Player number
			v.drawString((MM.hud.intermission.pos.num3.x + multiply.x), (MM.hud.intermission.pos.first2.y + (i << 3) + multiply.y), i, 0, "thin")
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name3.x + multiply.x - 10) << FRACBITS, ((MM.hud.intermission.pos.first2.y - 1) + (i << 3) + multiply.y) << FRACBITS, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1))
				v.drawString((MM.hud.intermission.pos.name3.x + multiply.x), (MM.hud.intermission.pos.first2.y + (i << 3) + multiply.y), MM.RoleColor[plrs[i].role]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name3.x + multiply.x), (MM.hud.intermission.pos.first2.y + (i << 3) + multiply.y), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + multiply.x), (MM.hud.intermission.pos.first2.y + (i << 3) + multiply.y), plrs[i].kills, 0, "thin")
		end
	end

	-- Winner text
	if (MM.winner == 0) --tie
		V_DrawStrASCII_Center(v, 160, 176, charset, MM_GetText(consoleplayer.mmlang, "HUD_WIN", 1))
	else
		V_DrawStrASCII_Center(v, 160, 176, charset, MM_GetText(consoleplayer.mmlang, "HUD_WINNERS").." "..MM_GetText(consoleplayer.mmlang, "HUD_WIN", (MM.winner + 1)))
	end

	-- Prerelease/Debug
	v.drawString(0, 184, "MM PRERELEASE\nv"..MM.version, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	if (MM.devbuild) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
	--THANK GOD IT ENDED
end, "intermission")