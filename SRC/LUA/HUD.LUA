-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

--Constants
local HudInfoSize = {0,0,0}
local maxHudIfnfoSize = 0
local crypticCVAR = CV_FindVar("mm_cryptic")
local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}
local scorePatchName, plrsAlive, rival

local function wep2rw(wep) --convert WEP_* constant to RW_* constant
	return 2^(wep - 1)
end

local function V_GetSHREMDiconID(dist)
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
	if (gametype != GT_LTMMURDERMYSTERY) --in case if switched from MM to another gametype
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
		MM.DebugPrint("\x82Loading MM graphics")

		V_HideoInit()
		V_LoadUnicode(v) --Initialize Unicode renderer

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
	end

	--Do not render the main HUD if it was disabled by another (MM) script
	if (not MM.hud.game.active) or ((MM.twopgame and MM.minigame and p.mm.minigame) or (not MM.twopgame and p.mm.minigame) or (p.spectator and p.mm.minigame)) return end

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")
	
	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.finished)) then scorePatchName = "BMP_VICTIMS"
	else scorePatchName = "BMP_SUSPECTS" end

	if (MM.text[consoleplayer.mm.lang][scorePatchName]) then HudInfoSize[1] = V_TextPatchWidth(MM.text[consoleplayer.mm.lang][scorePatchName]) + 40
	else HudInfoSize[1] = 96 end

	--TIME
	if (MM.text[consoleplayer.mm.lang]["BMP_TIME"]) then HudInfoSize[2] = V_TextPatchWidth(MM.text[consoleplayer.mm.lang]["BMP_TIME"]) + 64
	else HudInfoSize[2] = 96 end

	--RINGS
	if (MM.text[consoleplayer.mm.lang]["BMP_RINGS"]) then HudInfoSize[3] = V_TextPatchWidth(MM.text[consoleplayer.mm.lang]["BMP_RINGS"]) + 52
	else HudInfoSize[3] = 92 end

	--find the longest element
	maxHudIfnfoSize = HudInfoSize[1]
	for element = 2, 3 do if (HudInfoSize[element] > maxHudIfnfoSize) then maxHudIfnfoSize = HudInfoSize[element] end end

	local xoff, yoff --X and Y offsets for Text Patches

	--now we can draw

	--SUSPECTS/VICTIMS
	--Draw the Text Label
	if (MM.text[consoleplayer.mm.lang][scorePatchName])
		xoff = V_GetTextPatchOffsetX(consoleplayer.mm.lang, scorePatchName)
		yoff = V_GetTextPatchOffsetY(consoleplayer.mm.lang, scorePatchName)
		V_DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, xoff, yoff, MM.text[consoleplayer.mm.lang][scorePatchName], hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())
	else --in case Text Patch was not found
		switch(scorePatchName, {
			["BMP_VICTIMS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "VICTIMS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end,
			["BMP_SUSPECTS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "SUSPECTS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end
		})
	end
	--Calculate the number of suspects/victims
	switch(p.mm.role, {
		[ROLE_MURDERER] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_MURDERER) end,
		[ROLE_SHERIFF] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		[ROLE_HERO] = do plrsAlive = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		['default'] = do plrsAlive = MM.PlayersAlive() - 1 end --Civilian and Dead
	})
	--Draw the number
	v.drawNum(((hudinfo[HUD_SCORE].x + maxHudIfnfoSize) - 16), hudinfo[HUD_SCORE].y, max(plrsAlive, 0), hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())

	--TIME
	--timer calculation
	local timertime = (MM.timelimit * 2100) - leveltime

	if (timertime < 0) timertime = 0 end
	if (MM.text[consoleplayer.mm.lang]["BMP_TIME"])
		xoff = V_GetTextPatchOffsetX(consoleplayer.mm.lang, "BMP_TIME")
		yoff = V_GetTextPatchOffsetY(consoleplayer.mm.lang, "BMP_TIME")
		--Draw the Text Label
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4))
			--Swap the colors in the label for flashing effect
			--0x49 in SRB2's palette is Yellow, 0x25 is Red
			V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, xoff, yoff, V_TextPatch_SwapColor(MM.text[consoleplayer.mm.lang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
		else
			V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, xoff, yoff, MM.text[consoleplayer.mm.lang]["BMP_TIME"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
		end
	else --in case Text Patch was not found
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4))
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
		if (MM.text[consoleplayer.mm.lang]["BMP_RINGS"])
			xoff = V_GetTextPatchOffsetX(consoleplayer.mm.lang, "BMP_RINGS")
			yoff = V_GetTextPatchOffsetY(consoleplayer.mm.lang, "BMP_RINGS")
			if (not p.rings) and (leveltime & 4)
				V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, xoff, yoff, V_TextPatch_SwapColor(MM.text[consoleplayer.mm.lang]["BMP_RINGS"], 0x49, 0x25), hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
			else
				V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, xoff, yoff, MM.text[consoleplayer.mm.lang]["BMP_RINGS"], hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
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
	if (p.mm.timetravel) and (not p.spectator) and ((p.mm.timetravel.warptimer < 70) or ((p.mm.timetravel.warptimer >= 70) and (not (p.mm.timetravel.warptimer & 1))))
		if (p.mm.timetravel.timesign and (p.mm.timetravel.timesign == 1)) --Past
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_PAST"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		elseif (p.mm.timetravel.timesign and (p.mm.timetravel.timesign == 2)) --Future
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_FUTR"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		end
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x << FRACBITS), (hudinfo[HUD_LIVES].y << FRACBITS), 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE|V_PERPLAYER|v.localTransFlag())

	--Show your role
	if ((p.mm.role) and  (p.mm.role > ROLE_NONE) and (not (p.mm.hud.roleflicker & 3)))
		V_DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[p.mm.role]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLES", p.mm.role), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
	end
	
	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.mm.timetravel and p.mm.timetravel.timezone) and (not p.spectator)
		if (p.mm.timetravel.timezone == TIMEZONE_PAST) --Past
			V_DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "\1\x86"..MM.GetText(consoleplayer.mm.lang, "HUD_PAST"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		elseif (p.mm.timetravel.timezone > TIMEZONE_PRESENT) --One of the Futures
			V_DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "\1\x86"..MM.GetText(consoleplayer.mm.lang, "HUD_FUTURE"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag())
		end
	end

	--DEAD player exclusive HUD
	if (p.mm.finished)
		V_DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[5]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLES", 5), hudinfo[HUD_LIVES].f|v.localTransFlag())
		if (MM.text[consoleplayer.mm.lang]["HUD_DEAD"])
			for y,i in pairs(MM.text[consoleplayer.mm.lang]["HUD_DEAD"])
				V_DrawStrUnicode_Center(v, 160, (112 + (y << 3)), i, v.localTransFlag())
			end
		else
			if (MM.debug) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mm.lang.."\"\x87][\x80\"HUD_DEAD\"\x87]\x82 that does not exist!\x80") end
		end
		if (p.mm.role == nil)
			if (MM.text[consoleplayer.mm.lang]["HUD_MIDJOIN"])
				for y,i in pairs(MM.text[consoleplayer.mm.lang]["HUD_MIDJOIN"])
					V_DrawStrUnicode_Center(v, 160, (152 + (y << 2)), i, v.localTransFlag(), true)
				end
			else
				if (MM.debug) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mm.lang.."\"\x87][\x80\"HUD_MIDJOIN\"\x87]\x82 that does not exist!\x80") end
			end
		end
		if (p.mm.killername)
			if (p.mm.killername == "your stupidity")
				V_DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "\1\x85"..MM.GetText(consoleplayer.mm.lang, "HUD_KILLBY").."\4 "..MM.GetText(consoleplayer.mm.lang, "HUD_STUPID"), V_SNAPTOTOP|V_SNAPTOLEFT)
			else
				V_DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "\1\x85"..MM.GetText(consoleplayer.mm.lang, "HUD_KILLBY").."\4 "..p.mm.killername, hudinfo[HUD_RINGS].f)
			end
		end
		if ((not p.mm.minigame) and (not MM.minigame))
			V_DrawStrUnicode_Right(v, 320, 0, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
			V_DrawStrUnicode_Right(v, 320, 4, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
			V_DrawStrUnicode_Right(v, 320, 8, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), true)
		end
	end

	--Show the PONG-related text & invitations
	if (not p.spectator) and (MM.twopgame) and (MM.duelplrs)
		local rival
		if (valid(MM.duelplrs[1]) and (MM.duelplrs[1] == p))
			rival = MM.duelplrs[2]
		elseif (valid(MM.duelplrs[2]) and (MM.duelplrs[2] == p))
			rival = MM.duelplrs[1]
		end

		if (valid(rival))
			if ((not p.mm.minigame) and (not rival.mm.minigame))
				V_DrawStrUnicode_Right(v, 320, 0, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				V_DrawStrUnicode_Right(v, 320, 4, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "REQUEST"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
			elseif ((p.mm.minigame) and (not rival.mm.minigame))
				V_DrawStrUnicode_Right(v, 320, 0, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "WAIT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				if (not p.mm.minigame.timeout)
					V_DrawStrUnicode_Right(v, 320, 4, (MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "PRESS").." "..MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "CANCEL")), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				end
			elseif ((not p.mm.minigame) and (rival.mm.minigame) and (leveltime & 1))
				V_DrawStrUnicode_Right(v, 320, 0, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
				V_DrawStrUnicode_Right(v, 320, 4, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "ACCEPT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
			end
		end
	end

	--WEAPON RINGS

	--Weapon selector frame Y position calculation
	--ported from the SRB2's Source Code
	local q = p.mm.weapondelay
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

	--Weapon logic
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO))
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

		if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_REDONLY)

			--REDONLY|DISABLERED (Knife-only)
			if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED)
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon

			--REDONLY
			else
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString(MM.hud.game.pos.ringWepOnly.x + 24, (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER, "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Red Ring icon
				end
			end

			--Selector
			v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())

		--Draw all weapons
		else
			--DISABLERED
			if (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED)
				--Knife weapon
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon
			
			--Draw Red/Infinite rings like normal
			else
				--Red/Infinity rings
				if (p.powers[pw_infinityring])
					if (p.powers[pw_infinityring] >= MM.weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Infinite Ring icon
					v.drawString((MM.hud.game.pos.ringWep.x + 24), (MM.hud.game.pos.ringWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					v.draw((MM.hud.game.pos.ringWep.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Red Ring icon
				end
			end

			--Draw other weapons
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
			if ((p.ammoremovaltimer) and ((leveltime % 7) < 4))
				v.drawString((MM.hud.game.pos.ringWep.x + 8 + (p.ammoremovalweapon*20)), (MM.hud.game.pos.ringWep.y), "-"..p.ammoremoval, V_REDMAP|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ammo removal penalty
			end

			--Selector
			v.draw((MM.hud.game.pos.ringWep.x + 6 + p.currentweapon*20), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
		end
	
	--Civilian weapon logic
	elseif (p.mm.role == ROLE_CIVILIAN) and ((((p.skin == 1) or (p.skin == 3)) and (p.rings > 49)) or (((p.skin != 1) and (p.skin != 3)) and (p.rings > 99))) and (wepcfgCVARs[ROLE_CIVILIAN].value)
		--Knife-only
		if (wepcfgCVARs[ROLE_CIVILIAN].value == 2)
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		if (p.skin == 1) or (p.skin == 3) --Player is Tails or Amy
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 50), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		else
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 100), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		end
		
		--Selector
		v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (del >> 1)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|v.localTransFlag())
	end

	--Sheriff Emerald Radar for Innocents
	if (p.mm.role == ROLE_CIVILIAN) and (#MM.shremds) and (p.mm.shremd_dist) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))
		v.drawScaled(9961472, 8912896, 32768, MM.graphics["IDEYAR"..V_GetSHREMDiconID(fixint(p.mm.shremd_dist))], V_SNAPTOBOTTOM|v.localTransFlag()) --152*FU, 136*FU, FU/2
	end

	--Are you alone?
	if (MM.PlayerCount() == 1)
		if (MM.text[consoleplayer.mm.lang]["HUD_ALONE"])
			--Draw the text
			for y,i in pairs(MM.text[consoleplayer.mm.lang]["HUD_ALONE"]) do V_DrawStrUnicode_Center(v, 160, (128 + (y << 3)), i, v.localTransFlag()) end
		else
			if (MM.debug) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mm.lang.."\"\x87][\x80\"HUD_ALONE\"\x87]\x82 that does not exist!\x80") end
		end
	end

	--suggest a minigame
	if (MM.PlayerCount() == 1) or ((p.spectator) and (not MM.minigame) and (not p.mm.minigame) and (not MM.twopgame))
		V_DrawStrUnicode_Right(v, 320, 0, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
		V_DrawStrUnicode_Right(v, 320, 4, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
		V_DrawStrUnicode_Right(v, 320, 8, MM.GetText(consoleplayer.mm.lang, "HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), true)
	end

	--"Showdown duel!"
	if ((not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.twopgame) and (MM.PlayerCount() > 1))
		V_DrawStrUnicode_Center(v, 160, 192, "\1\x88"..MM.GetText(consoleplayer.mm.lang, "HUD_SHOWDOWN"), V_SNAPTOBOTTOM)
	end

	--Sneaking
	if ((p.mm.sneak) and valid(p.mo) and P_IsObjectOnGround(p.mo))
		V_DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 24), MM.GetText(consoleplayer.mm.lang, "HUD_SNEAKING"), V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER|v.localTransFlag(), true)
	end
	
	--HUD frontend for the flash/spark effects
	if (p.mm.hud.fx_translucency) then v.fadeScreen(p.mm.hud.fx_color, p.mm.hud.fx_translucency) end

	--Debug
	if MM.debug
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y, "\x87".."LTM_MM v"..MM.version.." DEBUG", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+8, "\x81 "..p.realmo.x.." "..p.realmo.y.." "..p.realmo.z.." \x80("..fixint(p.realmo.x).." "..fixint(p.realmo.y).." "..fixint(p.realmo.z)..")", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+16, "\x82".."GAMEMAP: \x80"..gamemap, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+24, "\x82".."LEVELTIME: \x80"..leveltime, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+32, "\x82".."FINISHED: \x80"..tostring(p.mm.finished), V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+40, "\x82".."PLAYERNODE: \x80"..#p, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+48, "\x82".."LASTINPUTTIME: \x80"..consoleplayer.lastinputtime, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+56, "\x82".."LANG: \x80"..p.mm.lang, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+64, "\x82".."KILLS: \x80"..p.mm.kills, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+72, "\x82".."KILLTRAILSTEPS: \x80"..p.mm.killtrailsteps, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+80, "\x82".."WEAPONDELAY: \x80"..p.mm.weapondelay, V_PERPLAYER, "thin")
		if (p.mm.shremd_dist) v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+88, "\x82".."SHREMD_DIST: \x81"..p.mm.shremd_dist.." \x80("..fixint(p.mm.shremd_dist)..")", V_PERPLAYER, "thin")
		else v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+88, "\x82".."SHREMD_DIST: \x81nil", V_PERPLAYER, "thin") end
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+96, "\x82".."SPEED: \x81"..p.speed.." \x80("..fixint(p.speed)..")", V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+104, "\x82".."CAMPING: \x80"..p.mm.camping, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+112, "\x82".."PFLAGS: \x80"..p.pflags, V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+120, "\x82".."MM.TWOPGAME: \x80"..tostring(MM.twopgame), V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+128, "\x82".."MM.SHWDWN: \x80"..tostring(MM.shwdwn), V_PERPLAYER, "thin")
		v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+136, "\x82".."MM.SUSNSE: \x80"..tostring(MM.susnse), V_PERPLAYER, "thin")
	end
end, "game")

--
-- SCORES TAB
--
hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY)
		hud.enable("rankings")
		return
	end

	if (not MM.hud.scores.active) then return end

	hud.disable("rankings")

	V_DrawStrUnicode_Center(v, 160, 12, "\1\x87"..MM.GetText(consoleplayer.mm.lang, "MM"), v.localTransFlag())

	--Player list
	if ((crypticCVAR.value) or (MM.PlayerCount() == 1))
		--Draw some text to replace the list
		if (MM.text[consoleplayer.mm.lang]["HUD_SCORESTAB"])
			for y,i in ipairs(MM.text[consoleplayer.mm.lang]["HUD_SCORESTAB"])
				V_DrawStrUnicode(v, 16, (16 + (y << 3)), i, v.localTransFlag())
			end
		else
			if (MM.debug) error("\x82Tried to access \x87MM.text[\x80\""..consoleplayer.mm.lang.."\"\x87][\x80\"HUD_SCORESTAB\"\x87]\x82 that does not exist!\x80") end
		end
	else
		--Draw the player list
		--Suspects/Victims label
		if (consoleplayer.mm.role and (consoleplayer.mm.role == ROLE_MURDERER))
			V_DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "\1\x82"..MM.GetText(consoleplayer.mm.lang, "HUD_VICTIMS")..":", v.localTransFlag())
		else
			V_DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "\1\x82"..MM.GetText(consoleplayer.mm.lang, "HUD_SUSPECTS")..":", v.localTransFlag())
		end

		--The list itself
		local multiply = {x=0, y=0}
		local plrs = {}
		for p in players.iterate do
			if ((not p.spectator) and (not MM.AreTeammates(consoleplayer, p)) and (consoleplayer != p) and (not p.quittime)) then table.insert(plrs, p) end
		end
		for i = 1, #plrs do
			if (MM.PlayerCount() <= 20) --Regular ("Double column") mode
				if (i > 10) then multiply = {x=140, y=80} end
				v.drawString((MM.hud.scores.pos.playerInfo.x + multiply.x), (MM.hud.scores.pos.playerInfo.y - multiply.y + (i << 3)), "\30 "..string.sub(plrs[i].name, 1, 15), V_ALLOWLOWERCASE|v.localTransFlag())
			else --Compact ("Tripple column") mode
				if (i > 11) then multiply = {x=94, y=88}
				elseif (i > 22) then multiply = {x=188, y=88} end
				v.drawString((MM.hud.scores.pos.playerInfo.x + multiply.x), (MM.hud.scores.pos.playerInfo.y - multiply.y + (i << 3)), "\45 "..string.sub(plrs[i].name, 1, 16), V_ALLOWLOWERCASE|v.localTransFlag(), "thin")
			end
		end

		--Teammates tracker
		if (MM.TeammatesCount(consoleplayer))
			local teammateNo = 0
			V_DrawStrUnicode(v, MM.hud.scores.pos.teammateInfo.x, (MM.hud.scores.pos.teammateInfo.y - 12), MM.RoleColorHUD[consoleplayer.mm.role]..MM.GetText(consoleplayer.mm.lang, "HUD_TEAMMATES")..":", v.localTransFlag())
			for p in players.iterate
				if (MM.AreTeammates(consoleplayer, p) and (consoleplayer != p))
					--character icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + (136 * (teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + ((teammateNo & 1) << 4)) << FRACBITS, 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
					--player name (colored as role)
					v.drawString((MM.hud.scores.pos.teammateInfo.x + 18 + (136 * (teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + ((teammateNo & 1) << 4)), MM.RoleColor[p.mm.role]..p.name, V_ALLOWLOWERCASE|v.localTransFlag())
					--icon of the currently held weapon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + (136 * (teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo & 1) << 4)) << FRACBITS, 32768, MM.graphics[MM.weapons[p.currentweapon][1]], v.localTransFlag()) --FU/2
					--amount of currently held weapon ammo
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + 18 + (136 * (teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo & 1) << 4)), p.powers[pw_infinityring + p.currentweapon], v.localTransFlag(), "thin")
					--red ring icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + (136 * (teammateNo >> 1))) << FRACBITS, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo & 1) << 4)) << FRACBITS, 32768, MM.graphics[MM.weapons[-1][1]], v.localTransFlag()) --FU/2
					--amount of [red] rings
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + 18 + (136 * (teammateNo >> 1))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo & 1) << 4)), p.rings, v.localTransFlag(), "thin")
					teammateNo = $ + 1
				end
			end
		end
	end

	v.drawFill(0, 172, 320, 2, v.localTransFlag()) --horizontal line

	--Roles counter
	if (not crypticCVAR.value)
		--Murderer
		V_DrawStrUnicode(v, 20, 176, MM.RoleColorHUD[ROLE_MURDERER]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLESALIVE", ROLE_MURDERER)..": "..MM.PlayerCount(ROLE_MURDERER), v.localTransFlag())
		--Sheriff (and Hero)
		if (MM.PlayerCount(ROLE_HERO))
			V_DrawStrUnicode(v, 20, 184, (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)..MM.RoleColorHUD[ROLE_HERO].." + "..MM.PlayerCount(ROLE_HERO)), v.localTransFlag())
		else
			V_DrawStrUnicode(v, 20, 184, (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)), v.localTransFlag())
		end
		--Innocent
		if (MM.PlayerCount(ROLE_CIVILIAN)) V_DrawStrUnicode(v, 20, 192, (MM.RoleColorHUD[ROLE_CIVILIAN]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLESALIVE", ROLE_CIVILIAN)..": "..MM.PlayerCount(ROLE_CIVILIAN)), v.localTransFlag()) end

		--"Sheriff's Emerald is available!"
		if ((#MM.shremds) and (leveltime & 1))
			v.drawScaled(524280, 12058440, 32768, MM.graphics["CHAOS3"], v.localTransFlag()) --8*FU, 184*FU, FU/2
		end
	end

	--Online
	v.drawString(160, 176, "ONLINE: "..MM.PlayerCount(), v.localTransFlag())

	--Role target
	if (consoleplayer.mm.role) then V_DrawStrUnicode(v, 160, 184, MM.RoleColorHUD[consoleplayer.mm.role]..MM.GetText(consoleplayer.mm.lang, "HUD_ROLETARGET", consoleplayer.mm.role), v.localTransFlag(), true) end

	--HUD frontend for the flash/spark effects
	if (consoleplayer.mm.hud.fx_translucency) then v.fadeScreen(consoleplayer.mm.hud.fx_color, consoleplayer.mm.hud.fx_translucency) end

	-- Prerelease/Debug
	if (MM.debug) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|v.localTransFlag(), "center") end
end, "scores")

--
-- Custom intermission HUD
--
hud.add(function(v)
	if (gametype != GT_LTMMURDERMYSTERY)
		hud.enable("intermissiontally")
		return
	end

	--Do not render the Intermission when MapVote is working or when other script specifically disables it
	if ((MapVote) or (MapVoteNet and (MapVoteNet.state > 0)) or (not MM.hud.intermission.active)) return end

	hud.disable("intermissiontally")

	local plrs = {}
	local multiply = {x=0, y=0}
	
	V_DrawStrUnicode_Center(v, 160, 4, "\1\x87"..MM.GetText(consoleplayer.mm.lang, "MM"))

	--Map name drawer
	if (mapheaderinfo[gamemap].actnum == 0)
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *", 0, "center")
	else
		v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *", 0, "center")
	end

	v.drawFill(0, 40, 320, 2, 0) --horizontal line

	--player list
	for p in players.iterate do table.insert(plrs, p) end
	--sort players by kills count
	table.sort(plrs, function(a, b)
		return a.mm.kills > b.mm.kills
	end)

	-- Column names

	--vertical line and everything common for >8 player screen
	if (MM.PlayerCount() > 8)
		v.drawFill(160, 40, 2, 144, 0)
		v.drawString(MM.hud.intermission.pos.kills2.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
		v.drawString((MM.hud.intermission.pos.kills2.x + 160), MM.hud.intermission.pos.players.y, "\x82KILLS", 0, "thin")
	end
	--everything else which is uncommon
	if (MM.PlayerCount() <= 8)
		v.drawString(MM.hud.intermission.pos.name.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0)
		v.drawString(MM.hud.intermission.pos.kills.x, MM.hud.intermission.pos.players.y, "\x82KILLS", 0)
	elseif (MM.PlayerCount() > 8) and (MM.PlayerCount() <= 16)
		--players 1-8
		v.drawString(MM.hud.intermission.pos.name.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 9-16
		v.drawString((MM.hud.intermission.pos.name.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	else
		--players 1-16
		v.drawString(MM.hud.intermission.pos.name2.x, MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
		--players 17-32
		v.drawString((MM.hud.intermission.pos.name2.x + 160), MM.hud.intermission.pos.players.y, "\x82NAME", 0, "thin")
	end

	-- Player stats

	for i = 1, #plrs
		if (MM.PlayerCount() <= 8) --Regular mode
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x - 20) << FRACBITS, (((MM.hud.intermission.pos.players.y - 4) + (i << 4)) << FRACBITS), 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i << 4)), MM.RoleColor[plrs[i].mm.role]..plrs[i].name, V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i << 4)), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills.x), (MM.hud.intermission.pos.players.y + (i << 4)), plrs[i].mm.kills)
		elseif ((MM.PlayerCount() > 8) and (MM.PlayerCount() <= 16)) --"Double column" mode
			if (i > 8) multiply = {x=160, y=128} end --players 9-16 are drawn on the second column

			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x + multiply.x - 20) << FRACBITS, ((MM.hud.intermission.pos.players.y - 4) + (i << 4) - multiply.y) << FRACBITS, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) - multiply.y), MM.RoleColor[plrs[i].mm.role]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) - multiply.y), MM.RoleColor[5]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + multiply.x), (MM.hud.intermission.pos.players.y + (i << 4) - multiply.y), plrs[i].mm.kills)
		else --"Double column compact" mode
			if (i > 16) then multiply = {x=160, y=128} end --players 17-32 are drawn on the second column

			--back to the rows
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name2.x + multiply.x - 10) << FRACBITS, ((MM.hud.intermission.pos.players2.y - 1) + (i << 3) - multiply.y) << FRACBITS, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				v.drawString((MM.hud.intermission.pos.name2.x + multiply.x), (MM.hud.intermission.pos.players2.y + (i << 3) - multiply.y), MM.RoleColor[plrs[i].mm.role]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name2.x + multiply.x), (MM.hud.intermission.pos.players2.y + (i << 3) - multiply.y), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + multiply.x), (MM.hud.intermission.pos.players2.y + (i << 3) - multiply.y), plrs[i].mm.kills, 0, "thin")
		end
	end

	-- Winner text
	if (MM.winner == 0) --tie
		V_DrawStrUnicode_Center(v, 160, 176, MM.GetText(consoleplayer.mm.lang, "HUD_WIN", 1))
	else
		V_DrawStrUnicode_Center(v, 160, 176, MM.GetText(consoleplayer.mm.lang, "HUD_WINNERS").." "..MM.GetText(consoleplayer.mm.lang, "HUD_WIN", (MM.winner + 1)))
	end

	--Prerelease/Debug
	if (MM.debug) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end, "intermission")
