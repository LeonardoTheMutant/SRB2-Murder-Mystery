-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

--Constants
local HudLabelWidth = {0,0,0}
local cv_cryptic = CV_FindVar("mm_cryptic").value
local cv_wepcfgCivil = CV_FindVar("mm_wepcfg_civil").value
local showhud = CV_FindVar("showhud")
local var1, var2, var3 --multipurpose variables

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

--Custom rendering-related functions used in this script
--I am defining them in a variable like this to reduce the table lookup times on each function call

local LoadPatch = MM.LoadPatch
local DrawTextPatch = HIDEO.DrawTextPatch
local GetTextPatchWidth = HIDEO.GetTextPatchWidth
local DrawStrUnicode = HIDEO.DrawStrUnicode
local DrawStrUnicode_Center = HIDEO.DrawStrUnicode_Center
local DrawStrUnicode_Right = HIDEO.DrawStrUnicode_Right
local WordWrap = HIDEO.WordWrap

--F3 key/"showhud" locker
addHook("ThinkFrame", do
	if (not showhud.value and gametype == GT_LTMMURDERMYSTERY) then CV_Set(showhud, 1) end
end)
addHook("KeyDown", function(e)
	if (e.num == KEY_F3 and gametype == GT_LTMMURDERMYSTERY)
		MM.hud.show = not $
		return true
	end
end)

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

	--Calculate important canvas values which are going to be used in the entire UI of the add-on
	MM.hud.canvas.width = v.width()/v.dupx()
	MM.hud.canvas.height = v.height()/v.dupy()
	MM.hud.canvas.font.scale = FU
	MM.hud.canvas.font.charwidth = FixedMul(HIDEO.charwidth, MM.hud.canvas.font.scale)
	MM.hud.canvas.font.charheight = FixedMul(HIDEO.charheight, MM.hud.canvas.font.scale)

	--Canvas values for small font
	if (v.width() < 640) then MM.hud.canvas.font.small.scale = MM.hud.canvas.font.scale
	else MM.hud.canvas.font.small.scale = 32768 end --MM.hud.canvas.font.scale/2
	MM.hud.canvas.font.small.charwidth = FixedMul(HIDEO.charwidth, MM.hud.canvas.font.small.scale)
	MM.hud.canvas.font.small.charheight = FixedMul(HIDEO.charheight, MM.hud.canvas.font.small.scale)

	--Patch Graphics loading
	if (not MM.graphics)
		MM.DebugPrint("Loading graphics")
		HIDEO.LoadUnicodeFont(v) --Initialize Unicode renderer

		--Colon for time counter
		LoadPatch(v, "STTCOLON")

		--Emerald icon
		LoadPatch(v, "CHAOS3")

		--Radar icons
		for i = 1, 6 do
			if v.patchExists("IDEYAR"..i) then LoadPatch(v, "IDEYAR"..i) end
		end

		--Weapon icons
		for i = -2, 6 do LoadPatch(v, MM.weapons[i][1]) end
		LoadPatch(v, "CURWEAP") --weapon selector

		--Past/Future Warp Signs
		LoadPatch(v, "TWS_FUTR")
		LoadPatch(v, "TWS_PAST")

		--MMHELP scrolling background
		LoadPatch(v, "NTSATKT2")
		LoadPatch(v, "NTSATKB1")

		--Sonic Run
		--Running frames
		for i = 1, 2 do
			if v.patchExists("SNC_RUN"..i) then LoadPatch(v, "SNC_RUN"..i) end
		end
		--Spinning frames
		for i = 1, 3 do
			if v.patchExists("SNC_SPN"..i) then LoadPatch(v, "SNC_SPN"..i) end
		end
		--Idle/standing frame
		if v.patchExists("SNC_STND") then LoadPatch(v, "SNC_STND") end
		--Countdown numbers
		for i = 1, 3 do LoadPatch(v, "RACE"..i) end
		LoadPatch(v, "RACEGO")

		--Intermission background
		for i = 0, 5 do
			if v.patchExists("INTRMBG"..i) then LoadPatch(v, "INTRMBG"..i) end
		end
	end

	--Do not render the main HUD if it was disabled by another (MM) script
	if (not MM.hud.game.active) or ((MM.twopgame and MM.minigame and p.mm.minigame) or (not MM.twopgame and p.mm.minigame) or (p.spectator and p.mm.minigame)) return end

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	--HUD frontend for the flash/spark effects
	if (MM.hud.game.flash.translucency) then v.fadeScreen(MM.hud.game.flash.color, MM.hud.game.flash.translucency) end

	if (not MM.hud.show) then return end
	
	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.finished)) then var1 = "IMG_VICTIMS"
	else var1 = "IMG_SUSPECTS" end

	if (MM.text[MM.lang][var1]) then HudLabelWidth[1] = GetTextPatchWidth(MM.text[MM.lang][var1]) + 40
	else HudLabelWidth[1] = 96 end

	--TIME
	if (MM.text[MM.lang]["IMG_TIME"]) then HudLabelWidth[2] = GetTextPatchWidth(MM.text[MM.lang]["IMG_TIME"]) + 64
	else HudLabelWidth[2] = 96 end

	--RINGS
	if (MM.text[MM.lang]["IMG_RINGS"]) then HudLabelWidth[3] = GetTextPatchWidth(MM.text[MM.lang]["IMG_RINGS"]) + 52
	else HudLabelWidth[3] = 92 end

	--find the longest element
	var3 = HudLabelWidth[1] --maximum HUD label width
	for element = 2, 3 do if (HudLabelWidth[element] > var3) then var3 = HudLabelWidth[element] end end

	--now we can draw

	--SUSPECTS/VICTIMS
	--Draw the Text Label
	if (MM.text[MM.lang][var1])
		DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, MM.text[MM.lang][var1], 1, hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())
	else --in case Text Patch was not found
		switch(var1, {
			["IMG_VICTIMS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "VICTIMS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end,
			["IMG_SUSPECTS"] = do v.drawString(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, "SUSPECTS", hudinfo[HUD_SCORE].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag()) end
		})
	end
	--Calculate the number of suspects/victims
	switch(p.mm.role, {
		[ROLE_MURDERER] = do var1 = MM.PlayersAlive() - MM.PlayerCount(ROLE_MURDERER) end,
		[ROLE_SHERIFF] = do var1 = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		[ROLE_HERO] = do var1 = MM.PlayersAlive() - MM.PlayerCount(ROLE_SHERIFF) - MM.PlayerCount(ROLE_HERO) end,
		['default'] = do var1 = MM.PlayersAlive() - 1 end --Civilian and Dead
	})
	--Draw the number
	v.drawNum(((hudinfo[HUD_SCORE].x + var3) - 16), hudinfo[HUD_SCORE].y, max(var1, 0), hudinfo[HUD_SCORE].f|V_PERPLAYER|v.localTransFlag())

	--TIME
	--timer calculation
	local timertime = (MM.timelimit * 2100) - leveltime

	if (timertime < 0) timertime = 0 end
	var1 = MM.text[MM.lang]["IMG_TIME"]
	if (var1) and (not splitscreen)
		--Draw the Text Label
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4)) then var2 = 2 --palette swap
		else var2 = 1 end
		DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, var1, var2, hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag())
	else --in case Text Patch was not found
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4))
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
		else
			v.drawString(hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, "TIME", hudinfo[HUD_TIME].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
		end
	end
	--Draw the time
	v.drawPaddedNum(((hudinfo[HUD_TIME].x + var3) - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timertime), 2, hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --seconds
	v.draw(((hudinfo[HUD_TIME].x + var3) - 40), hudinfo[HUD_TIME].y, MM.graphics["STTCOLON"], hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --colon
	v.drawNum(((hudinfo[HUD_TIME].x + var3) - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timertime), hudinfo[HUD_TIME].f|V_PERPLAYER|v.localTransFlag()) --minutes

	--RINGS
	if (not p.spectator)
		var1 = MM.text[MM.lang]["IMG_RINGS"]
		if (var1) and (not splitscreen)
			if (not p.rings) and (leveltime & 4) then var2 = 2 --palette swap
			else var2 = 1 end
			DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, var1, var2, hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
		else --in case Text Patch was not found or the game is splitscreen
			if (not p.rings) and (leveltime & 4)
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_REDMAP|v.localTransFlag())
			else
				v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, "RINGS", hudinfo[HUD_RINGS].f|V_PERPLAYER|V_YELLOWMAP|v.localTransFlag())
			end
		end
		v.drawNum(((hudinfo[HUD_RINGS].x + var3) - 16), hudinfo[HUD_RINGS].y, p.rings, hudinfo[HUD_RINGS].f|V_PERPLAYER|v.localTransFlag())
	end
	
	--Time Warp Sign ("Warp ticket")
	if (p.mm.timetravel) and (p.mm.timetravel.timesign) and (not p.spectator) and ((p.mm.timetravel.warptimer < 70) or ((p.mm.timetravel.warptimer >= 70) and (not (p.mm.timetravel.warptimer % 2))))
		switch(p.mm.timetravel.timesign, {
			--Past
			[1] = do v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_PAST"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag()) end,
			--Future
			[2] = do v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), MM.graphics["TWS_FUTR"], hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag()) end
		})
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x * FU), (hudinfo[HUD_LIVES].y * FU), 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE|V_PERPLAYER|v.localTransFlag())

	--Show your role
	if ((p.mm.role) and  (p.mm.role > ROLE_NONE) and (MM.hud.game.roleflicker % 2) == 0)
		switch(p.mm.role , {
			[ROLE_MURDERER] = do
				var1 = "MURDERER"
				var2 = ROLE_MURDERER
			end,
			[ROLE_SHERIFF] = do
				var1 = "SHERIFF"
				var2 = ROLE_SHERIFF
			end,
			[ROLE_CIVILIAN] = do
				var1 = "CIVILIAN"
				var2 = ROLE_CIVILIAN
			end,
			[ROLE_HERO] = do
				var1 = "HERO"
				var2 = ROLE_HERO
			end,
			[ROLE_JESTER] = do
				var1 = "JESTER"
				var2 = ROLE_JESTER
			end,
			[ROLE_JESTERHERO] = do
				var1 = "JESTER"
				var2 = ROLE_HERO
			end
		})
		DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[var2]..MM.GetText("HUD_ROLES", var1), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
	end
	
	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.mm.timetravel and p.mm.timetravel.timezone) and (not p.spectator)
		if (p.mm.timetravel.timezone == TIMEZONE_PAST) --Past
			DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "^6"..MM.GetText("HUD_PAST"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
		elseif (p.mm.timetravel.timezone > TIMEZONE_PRESENT) --One of the Futures
			DrawStrUnicode(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), "^6"..MM.GetText("HUD_FUTURE"), hudinfo[HUD_LIVES].f|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.scale)
		end
	end

	--DEAD player exclusive HUD
	if (p.mm.finished)
		--DEAD role label
		DrawStrUnicode(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), MM.RoleColorHUD[6]..MM.GetText("HUD_ROLES", "DEAD"), hudinfo[HUD_LIVES].f|v.localTransFlag(), MM.hud.canvas.font.scale)
		DrawStrUnicode_Center(v, 160, 120, WordWrap(0, MM.hud.canvas.width, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_DEAD")), v.localTransFlag(), MM.hud.canvas.font.scale)

		--"You joined mid-game"
		if (p.mm.role == nil)
			DrawStrUnicode_Center(v, 160, 156, WordWrap(0, MM.hud.canvas.width, 0, MM.hud.canvas.font.small.scale, MM.GetText("HUD_MIDJOIN")), v.localTransFlag(), MM.hud.canvas.font.small.scale)
		end

		--"Killed by"
		if (p.mm.killreason)
			switch(p.mm.killreason, {
				[KILLBY_PLR] = do
					if (p.mm.killername) then DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "^5"..MM.GetText("HUD_KILLEDBY", 1).."^0 "..p.mm.killername, hudinfo[HUD_RINGS].f) end
				end,
				['default'] = do
					DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), "^5"..MM.GetText("HUD_KILLEDBY", 1).."^0 "..MM.GetText("HUD_KILLEDBY", p.mm.killreason), V_SNAPTOTOP|V_SNAPTOLEFT)
				end
			})
		end

		if ((not p.mm.minigame) and (not MM.minigame))
			DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			DrawStrUnicode_Right(v, 320, 2*MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		end
	end

	--Show the PONG-related text & invitations
	if (not p.spectator) and (MM.twopgame) and (MM.duelplrs)
		--determine the rival player
		if (valid(MM.duelplrs[1]) and (MM.duelplrs[1] == p))
			var1 = MM.duelplrs[2]
		elseif (valid(MM.duelplrs[2]) and (MM.duelplrs[2] == p))
			var1 = MM.duelplrs[1]
		end

		--draw the in-minigame text if the rival player still exists and is valid
		if (valid(var1))
			if ((not p.mm.minigame) and (not var1.mm.minigame))
				DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "REQUEST"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			elseif ((p.mm.minigame) and (not var1.mm.minigame))
				DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "WAIT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				if (not p.mm.minigame.timeout)
					DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, (MM.GetText("HUD_MINIGAME", "PRESS").." "..MM.GetText("HUD_MINIGAME", "CANCEL")), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				end
			elseif ((not p.mm.minigame) and (var1.mm.minigame) and (leveltime % 2))
				DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
				DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "ACCEPT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
			end
		end
	end

	--WEAPON RINGS

	--Weapon selector frame Y position calculation
	--ported from the SRB2's Source Code
	var1 = p.mm.weapondelay --q
	var2 = 0 --del
	var3 = 16 --pv
	while (var1)
		if (var1 > var3)
			var2 = var2 + var3
			var1 = var1 - var3
			var1 = var1 / 2
			if (var3 > 1) var3 = var3 / 2 end
		else
			var2 = var2 + var1
			break
		end
	end

	--Weapon logic
	if ((p.mm.role == ROLE_MURDERER) or (p.mm.role == ROLE_SHERIFF) or (p.mm.role == ROLE_HERO) or (p.mm.role == ROLE_JESTERHERO))
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
			v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (var2 / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())

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
					if (MM.weapons[weapon][2] == MT_THROWNAUTOMATIC) and (MM.weapons[weapon][6][2] > 0)
						--Draw overheat indicator
						v.drawFill((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), 16, 16, 35|max(10 - MM.weapons[weapon][6][2], 0)*FU|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
					end
					v.drawString((MM.hud.game.pos.ringWep.x + 24 + weapon*20), (MM.hud.game.pos.ringWep.y + 8), p.powers[weapon + 14], wepTextFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag(), "thin-right") --Ammo counter
				elseif (p.ringweapons & wep2rw(weapon))
					v.draw((MM.hud.game.pos.ringWep.x + 8 + weapon*20), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[weapon][1]], V_TRANSLUCENT|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
				end
			end
			if ((p.ammoremovaltimer) and ((leveltime % 7) < 4))
				v.drawString((MM.hud.game.pos.ringWep.x + 8 + (p.ammoremovalweapon*20)), (MM.hud.game.pos.ringWep.y), "-"..p.ammoremoval, V_REDMAP|V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag()) --Ammo removal penalty
			end

			--Selector
			v.draw((MM.hud.game.pos.ringWep.x + 6 + p.currentweapon*20), (MM.hud.game.pos.ringWep.y - 2 - (var2 / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|v.localTransFlag())
		end
	
	--Civilian weapon logic
	elseif (p.mm.role == ROLE_CIVILIAN) and (((p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 49)) or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 99))) and (cv_wepcfgCivil)
		--Knife-only
		if (cv_wepcfgCivil == 2)
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		if (p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 50), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		else
			v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 100), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		end
		
		--Selector
		v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (var2 / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|v.localTransFlag())
	elseif (p.mm.role == ROLE_JESTER) and (p.rings > 10)
		--Knife-only
		if (cv_wepcfgCivil == 2)
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			v.draw((MM.hud.game.pos.ringWepOnly.x + 8), (MM.hud.game.pos.ringWep.y), MM.graphics[MM.weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		v.drawString((MM.hud.game.pos.ringWepOnly.x + 24), (MM.hud.game.pos.ringWep.y + 8), (p.rings / 10), V_SNAPTOBOTTOM|v.localTransFlag(), "thin-right")
		
		--Selector
		v.draw((MM.hud.game.pos.ringWepOnly.x + 6), (MM.hud.game.pos.ringWep.y - 2 - (var2 / 2)), MM.graphics["CURWEAP"], V_SNAPTOBOTTOM|v.localTransFlag())
	end

	--Sheriff's Emerald Radar for Innocents
	if ((p.mm.role == ROLE_CIVILIAN) or (p.mm.role == ROLE_JESTER)) and (#MM.shremds) and (MM.shremdDist) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar))
		v.drawScaled(9961472, 8912896, 32768, MM.graphics["IDEYAR"..V_GetSHREMDiconID(fixint(MM.shremdDist))], V_SNAPTOBOTTOM|v.localTransFlag()) --152*FU, 136*FU, FU/2
	end

	--Are you alone?
	if (MM.PlayerCount() == 1)
		DrawStrUnicode_Center(v, 160, 136, WordWrap(0, canvasWidth, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_ALONE")), v.localTransFlag(), MM.hud.canvas.font.scale)
	end

	--suggest a minigame
	if (MM.PlayerCount() == 1) or ((p.spectator) and (not MM.minigame) and (not p.mm.minigame) and (not MM.twopgame))
		DrawStrUnicode_Right(v, 320, 0, MM.GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		DrawStrUnicode_Right(v, 320, MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
		DrawStrUnicode_Right(v, 320, 2*MM.hud.canvas.font.small.charheight, MM.GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
	end

	--"Showdown duel!"
	if ((not MM.PlayerCount(ROLE_CIVILIAN)) and (not MM.twopgame) and (MM.PlayerCount() > 1))
		DrawStrUnicode_Center(v, 160, 192, "^8"..MM.GetText("HUD_SHOWDOWN"), V_SNAPTOBOTTOM, MM.hud.canvas.font.scale)
	end

	--Sneaking
	if ((p.mm.sneak) and valid(p.mo) and P_IsObjectOnGround(p.mo))
		DrawStrUnicode(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 24), MM.GetText("HUD_SNEAKING"), V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER|v.localTransFlag(), MM.hud.canvas.font.small.scale)
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

	DrawStrUnicode_Center(v, 160, 8, "^7"..MM.GetText("HUD_MM"), v.localTransFlag(), MM.hud.canvas.font.scale)

	--Player list
	if ((cv_cryptic) or (MM.PlayerCount() == 1))
		DrawStrUnicode(v, 16, 24, WordWrap(16, 304, 0, MM.hud.canvas.font.scale, MM.GetText("HUD_SCORESTAB")), v.localTransFlag(), MM.hud.canvas.font.scale)
	else
		--Draw the player list
		--Suspects/Victims label
		if (consoleplayer.mm.role and (consoleplayer.mm.role == ROLE_MURDERER))
			DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "^2"..MM.GetText("HUD_VICTIMS")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
		else
			DrawStrUnicode(v, MM.hud.scores.pos.playerInfo.x, (MM.hud.scores.pos.playerInfo.y - 4), "^2"..MM.GetText("HUD_SUSPECTS")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
		end

		--The list itself
		local shift = {x=0, y=0}
		local plrs = {}
		for p in players.iterate do
			if ((not p.spectator) and (not MM.AreTeammates(consoleplayer, p)) and (consoleplayer != p) and (not p.quittime)) then table.insert(plrs, p) end
		end
		for i = 1, #plrs do
			if (MM.PlayerCount() <= 20) --Regular ("Double column") mode
				if (i > 10) then shift = {x=140, y=80} end
				DrawStrUnicode(v, (MM.hud.scores.pos.playerInfo.x + shift.x), (MM.hud.scores.pos.playerInfo.y - shift.y + (i * MM.hud.canvas.font.charheight)), "\x1E "..string.sub(plrs[i].name, 1, 15), v.localTransFlag(), MM.hud.canvas.font.scale)
			else --Compact ("Tripple column") mode
				if (i > 11) then shift = {x=94, y=88}
				elseif (i > 22) then shift = {x=188, y=88} end
				DrawStrUnicode(v, (MM.hud.scores.pos.playerInfo.x + shift.x), (MM.hud.scores.pos.playerInfo.y - shift.y + (i * MM.hud.canvas.font.charheight)), "\x1E "..string.sub(plrs[i].name, 1, 16), v.localTransFlag(), MM.hud.canvas.font.scale)
			end
		end

		--Teammates tracker
		if (MM.TeammatesCount(consoleplayer))
			local teammateNo = 0
			DrawStrUnicode(v, MM.hud.scores.pos.teammateInfo.x, (MM.hud.scores.pos.teammateInfo.y - 12), "^A"..MM.GetText("HUD_TEAMMATES")..":", v.localTransFlag(), MM.hud.canvas.font.scale)
			for p in players.iterate
				if (MM.AreTeammates(consoleplayer, p) and (consoleplayer != p))
					--character icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) * 16))*FU, 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), v.localTransFlag(), v.getColormap(p.skin, p.skincolor)) --FU/2
					--player name (colored as role)
					local role
					switch(p.mm.role, {
						[ROLE_JESTERHERO] = do
							role = 4
						end,
						['default'] = do
							role = p.mm.role
						end
					})
					v.drawString((MM.hud.scores.pos.teammateInfo.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + ((teammateNo % 2) * 16)), MM.RoleColor[role]..p.name, V_ALLOWLOWERCASE|v.localTransFlag())
					--icon of the currently held weapon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, MM.graphics[MM.weapons[p.currentweapon][1]], v.localTransFlag()) --FU/2
					--amount of currently held weapon ammo
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16)), p.powers[pw_infinityring + p.currentweapon], v.localTransFlag(), "thin")
					--red ring icon
					v.drawScaled((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + (136 * (teammateNo / 2)))*FU, (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, MM.graphics[MM.weapons[-1][1]], v.localTransFlag()) --FU/2
					--amount of [red] rings
					v.drawString((MM.hud.scores.pos.teammateInfo.x + MM.hud.scores.pos.teammateInfoOffset1.x + MM.hud.scores.pos.teammateInfoOffset2.x + 18 + (136 * (teammateNo / 2))), (MM.hud.scores.pos.teammateInfo.y + 8 + ((teammateNo % 2) * 16)), p.rings, v.localTransFlag(), "thin")
					teammateNo = $ + 1
				end
			end
		end
	end
 
	v.drawFill(0, 172, 320, 2, v.localTransFlag()) --horizontal line

	--Roles counter
	if (not cv_cryptic)
		--Murderer
		DrawStrUnicode(v, 16, 176, MM.RoleColorHUD[ROLE_MURDERER]..MM.GetText("HUD_ROLESALIVE", ROLE_MURDERER)..": "..MM.PlayerCount(ROLE_MURDERER), v.localTransFlag(), MM.hud.canvas.font.scale)
		--Sheriff (and Hero)
		if (MM.PlayerCount(ROLE_HERO) or (MM.PlayerCount(ROLE_JESTERHERO)))
			DrawStrUnicode(v, 16, 184, (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)..MM.RoleColorHUD[ROLE_HERO].." + "..(MM.PlayerCount(ROLE_HERO) + MM.PlayerCount(ROLE_JESTERHERO))), v.localTransFlag(), MM.hud.canvas.font.scale)
		else
			DrawStrUnicode(v, 16, 184, (MM.RoleColorHUD[ROLE_SHERIFF]..MM.GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..MM.PlayerCount(ROLE_SHERIFF)), v.localTransFlag(), MM.hud.canvas.font.scale)
		end
		--Civilian
		if (MM.PlayerCount(ROLE_CIVILIAN)) DrawStrUnicode(v, 16, 192, (MM.RoleColorHUD[ROLE_CIVILIAN]..MM.GetText("HUD_ROLESALIVE", ROLE_CIVILIAN)..": "..(MM.PlayerCount(ROLE_CIVILIAN) + MM.PlayerCount(ROLE_JESTER))), v.localTransFlag(), MM.hud.canvas.font.scale) end

		--"Sheriff's Emerald is available!"
		if ((#MM.shremds) and (leveltime % 2))
			v.drawScaled(262144, 12058440, 32768, MM.graphics["CHAOS3"], v.localTransFlag()) --4*FU, 184*FU, FU/2
		end
	end

	--Online
	v.drawString(160, 176, "ONLINE: "..MM.PlayerCount(), v.localTransFlag())

	--Role target
	if (consoleplayer.mm.role)
		local role = ""
		local color = 1
		switch(consoleplayer.mm.role , {
			[ROLE_MURDERER] = do
				role = "MURDERER"
				color = ROLE_MURDERER
			end,
			[ROLE_SHERIFF] = do
				role = "SHERIFF"
				color = ROLE_SHERIFF
			end,
			[ROLE_CIVILIAN] = do
				role = "CIVILIAN"
				color = ROLE_CIVILIAN
			end,
			[ROLE_HERO] = do
				role = "HERO"
				color = ROLE_HERO
			end,
			[ROLE_JESTER] = do
				role = "JESTER"
				color = ROLE_JESTER
			end,
			[ROLE_JESTERHERO] = do
				role = "JESTER"
				color = ROLE_HERO
			end
		})
		DrawStrUnicode(v, 160, (176 + MM.hud.canvas.font.charheight), MM.RoleColorHUD[color]..WordWrap(160, 304, 0, MM.hud.canvas.font.small.scale, MM.GetText("HUD_ROLETARGET", role)), v.localTransFlag(), MM.hud.canvas.font.small.scale)
	end

	--HUD frontend for the flash/spark effects
	if (MM.hud.game.flash.translucency) then v.fadeScreen(MM.hud.game.flash.color, MM.hud.game.flash.translucency) end

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

	--Background
	local width = v.width
	local height = v.height
	local dupx = v.dupx
	local dupy = v.dupy
	local BGpatch
	switch(MM.winner, {
		[WIN_MURD] = do
			BGpatch = MM.graphics["INTRMBG1"]
		end,
		[WIN_CIVILS] = do
			BGpatch = MM.graphics["INTRMBG2"]
		end,
		[WIN_JESTERKILLED] = do
			BGpatch = MM.graphics["INTRMBG5"]
		end,
		['default'] = do
			BGpatch = MM.graphics["INTRMBG0"]
		end
	})
	for x = 0, width(), BGpatch.width * dupx() do
		for y = 0, height(), BGpatch.height * dupy() do
			v.draw(x, y, BGpatch, V_NOSCALESTART)
		end
	end

	hud.disable("intermissiontally")

	local plrs = {}
	local shift = {x=0, y=0}

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
			v.drawScaled((MM.hud.intermission.pos.name.x - 20)*FU, ((MM.hud.intermission.pos.players.y - 4) + (i * 16))*FU, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				local color = 1
				switch(plrs[i].mm.role , {
					[ROLE_MURDERER] = do
						color = ROLE_MURDERER
					end,
					[ROLE_SHERIFF] = do
						color = ROLE_SHERIFF
					end,
					[ROLE_CIVILIAN] = do
						color = ROLE_CIVILIAN
					end,
					[ROLE_HERO] = do
						color = ROLE_HERO
					end,
					[ROLE_JESTER] = do
						color = ROLE_JESTER
					end,
					[ROLE_JESTERHERO] = do
						color = ROLE_JESTER
					end
				})
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i * 16)), MM.RoleColor[color]..plrs[i].name, V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x), (MM.hud.intermission.pos.players.y + (i * 16)), MM.RoleColor[6]..plrs[i].name, V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills.x), (MM.hud.intermission.pos.players.y + (i * 16)), plrs[i].mm.kills)
		elseif ((MM.PlayerCount() > 8) and (MM.PlayerCount() <= 16)) --"Double column" mode
			if (i > 8) shift = {x=160, y=128} end --players 9-16 are drawn on the second column

			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name.x + shift.x - 20)*FU, ((MM.hud.intermission.pos.players.y - 4) + (i * 16) - shift.y)*FU, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				local color = 1
				switch(plrs[i].mm.role , {
					[ROLE_MURDERER] = do
						color = ROLE_MURDERER
					end,
					[ROLE_SHERIFF] = do
						color = ROLE_SHERIFF
					end,
					[ROLE_CIVILIAN] = do
						color = ROLE_CIVILIAN
					end,
					[ROLE_HERO] = do
						color = ROLE_HERO
					end,
					[ROLE_JESTER] = do
						color = ROLE_JESTER
					end,
					[ROLE_JESTERHERO] = do
						color = ROLE_JESTER
					end
				})
				v.drawString((MM.hud.intermission.pos.name.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), MM.RoleColor[color]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), MM.RoleColor[6]..string.sub(plrs[i].name, 1, 13), V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + shift.x), (MM.hud.intermission.pos.players.y + (i * 16) - shift.y), plrs[i].mm.kills)
		else --"Double column compact" mode
			if (i > 16) then shift = {x=160, y=128} end --players 17-32 are drawn on the second column

			--back to the rows
			--Character icon
			v.drawScaled((MM.hud.intermission.pos.name2.x + shift.x - 10)*FU, ((MM.hud.intermission.pos.players2.y - 1) + (i * 8) - shift.y)*FU, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			--Player name (colored by role)
			if ((plrs[i].mm.role) and (plrs[i].mm.role > ROLE_NONE))
				local color = 1
				switch(plrs[i].mm.role , {
					[ROLE_MURDERER] = do
						color = ROLE_MURDERER
					end,
					[ROLE_SHERIFF] = do
						color = ROLE_SHERIFF
					end,
					[ROLE_CIVILIAN] = do
						color = ROLE_CIVILIAN
					end,
					[ROLE_HERO] = do
						color = ROLE_HERO
					end,
					[ROLE_JESTER] = do
						color = ROLE_JESTER
					end,
					[ROLE_JESTERHERO] = do
						color = ROLE_JESTER
					end
				})
				v.drawString((MM.hud.intermission.pos.name2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), MM.RoleColor[color]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			else
				--DEAD
				v.drawString((MM.hud.intermission.pos.name2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), MM.RoleColor[6]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			end
			--Kills counter
			v.drawString((MM.hud.intermission.pos.kills2.x + shift.x), (MM.hud.intermission.pos.players2.y + (i * 8) - shift.y), plrs[i].mm.kills, 0, "thin")
		end
	end

	-- Winner text
	if (not MM.winner)
		DrawStrUnicode_Center(v, 160, 176, MM.GetText("HUD_WIN", 1)) --Tie
	else
		local winner
		switch(MM.winner, {
			[0] = do
				winner = 1
			end,
			[WIN_MURD] = do
				winner = 2
			end,
			[WIN_CIVILS] = do
				winner = 3
			end,
			[WIN_JESTERKILLED] = do
				winner = 4
			end
		})
		DrawStrUnicode_Center(v, 160, 176, MM.GetText("HUD_WINNERS").." "..MM.GetText("HUD_WIN", winner))
	end

	--Prerelease/Debug
	if (MM.debug) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end, "intermission")
