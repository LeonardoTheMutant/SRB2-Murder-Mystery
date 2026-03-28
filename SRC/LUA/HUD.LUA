-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this



--
--Constants
--

--MM related stuff
local eMeM = MM
local MMtext = eMeM.text
local LoadPatch = eMeM.LoadPatch
local PlayerCount = eMeM.PlayerCount
local PlayerCountReal = eMeM.PlayerCountReal
local GetText = eMeM.GetText
local GetWepCfgFlags = eMeM.GetWepCfgFlags
local PlayersAlive = eMeM.PlayersAlive
local RoleColor = eMeM.RoleColor
local RoleColorHUD = eMeM.RoleColorHUD
local duelplrs = eMeM.duelplrs
local weapons = eMeM.weapons
local HudDigit = eMeM.textpatch["HUDDIGIT"]
local MMhud = eMeM.hud
local canvas = MMhud.canvas
local font = canvas.font
local font_small = font.small

local HudGame = MMhud.game
local HudGame_pos = HudGame.pos
local HudGame_flash = HudGame.flash
local HudRingWepOnly_x = HudGame.pos.ringWepOnly_x
local HudRingWep = HudGame.pos.ringWep

local HudScores = MMhud.scores
local HudScores_pos = HudScores.pos
local HudScores_pos_player = HudScores_pos.playerInfo
local HudScores_pos_teammate = HudScores_pos.teammateInfo

local HudInter = MMhud.intermission
local HudInter_pos = HudInter.pos
local HudInter_pos_players_y = HudInter_pos.players_y
local HudInter_pos_name_x = HudInter_pos.name_x
local HudInter_pos_kills_x = HudInter_pos.kills_x
local HudInter_pos_players2_y = HudInter_pos.players2_y
local HudInter_pos_name2_x = HudInter_pos_name2_x
local HudInter_pos_kills2_x = HudInter_pos_kills2_x


--HIDEO related stuff
local Hi = HIDEO
local DrawTextPatch = Hi.DrawTextPatch
local GetTextPatchWidth = Hi.GetTextPatchWidth
local DrawStrUnicode = Hi.DrawStrUnicode
local DrawStrUnicode_Center = Hi.DrawStrUnicode_Center
local DrawStrUnicode_Right = Hi.DrawStrUnicode_Right
local WordWrap = Hi.WordWrap
local charwidth = Hi.charwidth
local charheight = Hi.charheight


--The rest
local hudinfo_score = hudinfo[HUD_SCORE]
local hudinfo_time = hudinfo[HUD_TIME]
local hudinfo_rings = hudinfo[HUD_RINGS]
local hudinfo_lives = hudinfo[HUD_LIVES]


--
--Variables
--

local var1, var2, var3, HUDdigit_width
local HudLabelWidth = {0,0,0}
local cv_cryptic = CV_FindVar("mm_cryptic")
local cv_wepcfgCivil = CV_FindVar("mm_wepcfg_civil")
local showhud = CV_FindVar("showhud")



--
--Helper functions
--

local function wep2rw(wep) --convert WEP_* constant to RW_* constant
	return 2^(wep - 1)
end

local function V_GetSHREMDiconID(dist)
	if (dist < 256) then return 6
	elseif (dist < 512) then return 5
	elseif (dist < 1024) then return 4
	elseif (dist < 2048) then return 3
	elseif (dist < 4096) then return 2
	else return 1 end
end

local function V_DrawHudNum(v, x, y, flags, num)
	x = x or 0
	y = y or 0
	flags = flags or 0
	num = num or 0
	local w = GetTextPatchWidth(HudDigit[0])

	if (flags & (V_NOSCALESTART|V_NOSCALEPATCH)) then w = w * v.dupx() end

	-- draw the number
	repeat
		x = x - w
		DrawTextPatch(v, x, y, HudDigit[num % 10], 1, flags)
		num = num / 10
	until (not num)
end

local function V_DrawHudNumPadded(v, x, y, flags, num, digits)
	x = x or 0
	y = y or 0
	flags = flags or 0
	num = num or 0
	digits = digits or 0
	local w = GetTextPatchWidth(HudDigit[0])

	if (flags & (V_NOSCALESTART|V_NOSCALEPATCH)) then w = w * v.dupx() end

	-- draw the number
	repeat
		x = x - w
		DrawTextPatch(v, x, y, HudDigit[num % 10], 1, flags)
		num = num / 10
		digits = digits - 1
	until (not digits)
end

--F3 key/"showhud" locker
addHook("ThinkFrame", function()
	if (not showhud.value and gametype == GT_LTMMURDERMYSTERY) then CV_Set(showhud, 1) end
end)
addHook("KeyDown", function(e)
	if (e.num == KEY_F3 and gametype == GT_LTMMURDERMYSTERY) then MMhud.show = not MMhud.show; return true end
end)

--
-- Main game HUD
--
hud.add(function(v, p)
	if (gametype ~= GT_LTMMURDERMYSTERY) then --in case if switched from MM to another gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("time")
		hud.enable("rings")
		hud.enable("weaponrings")
		return
	end

	local draw = v.draw
	local drawScaled = v.drawScaled
	local drawFill = v.drawFill
	local drawString = v.drawString
	local patchExists = v.patchExists
	local getColormap = v.getColormap
	local getSprite2Patch = v.getSprite2Patch
	local localTransFlag = v.localTransFlag()
	local v_width = v.width

	local prole = p.mm.role

	--Calculate important canvas values which are going to be used in the entire UI of the add-on
	canvas.width = v_width()/v.dupx()
	canvas.height = v.height()/v.dupy()
	font.scale = FU
	font.charwidth = FixedMul(charwidth, font.scale)
	font.charheight = FixedMul(charheight, font.scale)

	--Canvas values for small font
	if (v_width() < 640) then font_small.scale = font.scale
	else font_small.scale = 32768 end --MM.hud.canvas.font.scale/2
	font_small.charwidth = FixedMul(charwidth, font_small.scale)
	font_small.charheight = FixedMul(charheight, font_small.scale)

	HUDdigit_width = GetTextPatchWidth(HudDigit[0])

	--Patch Graphics loading
	if (not eMeM.graphics) then
		eMeM.DebugPrint("Loading graphics")
		Hi.LoadUnicodeFont(v) --Initialize Unicode renderer

		--Emerald icon
		LoadPatch(v, "CHAOS3")

		--Radar icons
		for i = 1, 6 do
			if patchExists("IDEYAR"..i) then LoadPatch(v, "IDEYAR"..i) end
		end

		--Weapon icons
		for i = -2, 6 do LoadPatch(v, eMeM.weapons[i][1]) end
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
			if patchExists("SNC_RUN"..i) then LoadPatch(v, "SNC_RUN"..i) end
		end
		--Spinning frames
		for i = 1, 3 do
			if patchExists("SNC_SPN"..i) then LoadPatch(v, "SNC_SPN"..i) end
		end
		--Idle/standing frame
		if patchExists("SNC_STND") then LoadPatch(v, "SNC_STND") end
		--Countdown numbers
		for i = 1, 3 do LoadPatch(v, "RACE"..i) end
		LoadPatch(v, "RACEGO")

		--Intermission background
		for i = 0, 5 do
			if patchExists("INTRMBG"..i) then LoadPatch(v, "INTRMBG"..i) end
		end
	end

	--Do not render the main HUD if it was disabled by another (MM) script
	if (not HudGame.active) or ((eMeM.twopgame and eMeM.minigame and (p.mm.flags & FLAG_MINIGAME)) or (not eMeM.twopgame and (p.mm.flags & FLAG_MINIGAME)) or (p.spectator and (p.mm.flags & FLAG_MINIGAME))) then return end

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	--HUD frontend for the flash/spark effects
	if (HudGame_flash.translucency) then v.fadeScreen(HudGame_flash.color, HudGame_flash.translucency) end

	if (not MMhud.show) then return end

	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	if (int(prole) <= ROLE_MURDERER) then var1 = "IMG_VICTIMS"
	else var1 = "IMG_SUSPECTS" end

	if (eMeM.text[eMeM.lang][var1]) then HudLabelWidth[1] = GetTextPatchWidth(eMeM.text[eMeM.lang][var1]) + HUDdigit_width*3
	else HudLabelWidth[1] = 88 end

	--TIME
	if (eMeM.text[eMeM.lang]["IMG_TIME"]) then HudLabelWidth[2] = GetTextPatchWidth(eMeM.text[eMeM.lang]["IMG_TIME"]) + HUDdigit_width*6
	else HudLabelWidth[2] = 88 end

	--RINGS
	if (eMeM.text[eMeM.lang]["IMG_RINGS"]) then HudLabelWidth[3] = GetTextPatchWidth(eMeM.text[eMeM.lang]["IMG_RINGS"]) + HUDdigit_width*5
	else HudLabelWidth[3] = 88 end

	--find the longest element
	var3 = HudLabelWidth[1] --maximum HUD label width
	for element = 2, 3 do if (HudLabelWidth[element] > var3) then var3 = HudLabelWidth[element] end end

	--now we can draw

	--SUSPECTS/VICTIMS
	--Draw the Text Label
	if (MMtext[eMeM.lang][var1]) then
		DrawTextPatch(v, hudinfo_score.x, hudinfo_score.y, MMtext[eMeM.lang][var1], 1, hudinfo_score.f|V_PERPLAYER|localTransFlag)
	else --in case Text Patch was not found
		switch(var1, {
			["IMG_VICTIMS"] = function() drawString(hudinfo_score.x, hudinfo_score.y, "VICTIMS", hudinfo_score.f|V_PERPLAYER|V_YELLOWMAP|localTransFlag) end,
			["IMG_SUSPECTS"] = function() drawString(hudinfo_score.x, hudinfo_score.y, "SUSPECTS", hudinfo_score.f|V_PERPLAYER|V_YELLOWMAP|localTransFlag) end
		})
	end
	--Calculate the number of suspects/victims
	switch(prole, {
		[ROLE_MURDERER] = function() var1 = PlayersAlive() - PlayerCount(ROLE_MURDERER) end,
		[ROLE_SHERIFF] = function() var1 = PlayersAlive() - PlayerCount(ROLE_SHERIFF) - PlayerCount(ROLE_HERO) end,
		[ROLE_HERO] = function() var1 = PlayersAlive() - PlayerCount(ROLE_SHERIFF) - PlayerCount(ROLE_HERO) end,
		['default'] = function() var1 = PlayersAlive() - 1 end --Civilian and Dead
	})
	--Draw the number
	V_DrawHudNum(v, (hudinfo_score.x + var3), hudinfo_score.y, hudinfo_score.f|V_PERPLAYER|localTransFlag, max(var1, 0))

	--TIME
	--timer calculation
	local timertime = (eMeM.timelimit * 2100) - leveltime

	if (timertime < 0) then timertime = 0 end
	var1 = MMtext[eMeM.lang]["IMG_TIME"]
	if (var1) and (not splitscreen) then
		--Draw the Text Label
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4)) then var2 = 2 --palette swap
		else var2 = 1 end
		DrawTextPatch(v, hudinfo_time.x, hudinfo_time.y, var1, var2, hudinfo_time.f|V_PERPLAYER|localTransFlag)
	else --in case Text Patch was not found
		if ((not G_TicsToMinutes(timertime)) and (leveltime & 4)) then
			drawString(hudinfo_time.x, hudinfo_time.y, "TIME", hudinfo_time.f|V_PERPLAYER|V_REDMAP|localTransFlag)
		else
			drawString(hudinfo_time.x, hudinfo_time.y, "TIME", hudinfo_time.f|V_PERPLAYER|V_YELLOWMAP|localTransFlag)
		end
	end
	--Draw the time
	V_DrawHudNumPadded(v, (hudinfo_time.x + var3), hudinfo_time.y, hudinfo_time.f|V_PERPLAYER|localTransFlag, G_TicsToSeconds(timertime), 2)
	DrawTextPatch(v, (hudinfo_time.x + var3 - 24), hudinfo_time.y, eMeM.textpatch["HUDCOLON"], 1, hudinfo_time.f|V_PERPLAYER|localTransFlag)
	V_DrawHudNum(v, (hudinfo_time.x + var3 - 22), hudinfo_time.y, hudinfo_time.f|V_PERPLAYER|localTransFlag, G_TicsToMinutes(timertime))

	--RINGS
	if (not p.spectator) then
		var1 = MMtext[eMeM.lang]["IMG_RINGS"]
		if (var1) and (not splitscreen) then
			if (not p.rings) and (leveltime & 4) then var2 = 2 --palette swap
			else var2 = 1 end
			DrawTextPatch(v, hudinfo_rings.x, hudinfo_rings.y, var1, var2, hudinfo_rings.f|V_PERPLAYER|localTransFlag)
		else --in case Text Patch was not found or the game is splitscreen
			if (not p.rings) and (leveltime & 4) then
				drawString(hudinfo_rings.x, hudinfo_rings.y, "RINGS", hudinfo_rings.f|V_PERPLAYER|V_REDMAP|localTransFlag)
			else
				drawString(hudinfo_rings.x, hudinfo_rings.y, "RINGS", hudinfo_rings.f|V_PERPLAYER|V_YELLOWMAP|localTransFlag)
			end
		end
		V_DrawHudNum(v, (hudinfo_rings.x + var3), hudinfo_rings.y, hudinfo_rings.f|V_PERPLAYER|localTransFlag, p.rings)
	end

	--Time Warp Sign ("Warp ticket")
	if (p.mm.timetravel) and (p.mm.timetravel.timesign) and (not p.spectator) and ((p.mm.timetravel.warptimer < 70) or ((p.mm.timetravel.warptimer >= 70) and (not (p.mm.timetravel.warptimer % 2)))) then
		switch(p.mm.timetravel.timesign, {
			--Past
			[1] = function() draw(hudinfo_lives.x, (hudinfo_lives.y - 18), eMeM.graphics["TWS_PAST"], hudinfo_lives.f|V_PERPLAYER|localTransFlag) end,
			--Future
			[2] = function() draw(hudinfo_lives.x, (hudinfo_lives.y - 18), eMeM.graphics["TWS_FUTR"], hudinfo_lives.f|V_PERPLAYER|localTransFlag) end
		})
	end

	--Life icon, player name and role
	drawScaled((hudinfo_lives.x * FU), (hudinfo_lives.y * FU), 32768, getSprite2Patch(p.skin, SPR2_XTRA), hudinfo_lives.f|V_PERPLAYER|localTransFlag, getColormap(p.skin, p.skincolor)) --FU/2
	drawString((hudinfo_lives.x + 18), hudinfo_lives.y, p.name, hudinfo_lives.f|V_ALLOWLOWERCASE|V_PERPLAYER|localTransFlag)

	--Show your role
	if ((prole) and (HudGame.roleflicker % 2) == 0) then
		switch(prole , {
			[ROLE_MURDERER] = function()
				var1 = "MURDERER"
				var2 = ROLE_MURDERER
			end,
			[ROLE_SHERIFF] = function()
				var1 = "SHERIFF"
				var2 = ROLE_SHERIFF
			end,
			[ROLE_CIVILIAN] = function()
				var1 = "CIVILIAN"
				var2 = ROLE_CIVILIAN
			end,
			[ROLE_HERO] = function()
				var1 = "HERO"
				var2 = ROLE_HERO
			end,
			[ROLE_JESTER] = function()
				var1 = "JESTER"
				var2 = ROLE_JESTER
			end,
			[ROLE_JESTERHERO] = function()
				var1 = "JESTER"
				var2 = ROLE_HERO
			end,
			['default'] = function()
				var1 = "DEAD"
				var2 = ROLE_DEAD
			end
		})
		DrawStrUnicode(v, (hudinfo_lives.x + 18), (hudinfo_lives.y + 8), RoleColorHUD[var2]..GetText("HUD_ROLES", var1), hudinfo_lives.f|V_PERPLAYER|localTransFlag, font.scale)
	end

	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.mm.timetravel) and (not p.spectator) then
		if (int(p.mm.timetravel.timezone) == TIMEZONE_PAST) then --Past
			DrawStrUnicode(v, (hudinfo_lives.x), (hudinfo_lives.y + 16), "^6"..GetText("HUD_PAST"), hudinfo_lives.f|V_PERPLAYER|localTransFlag, font.scale)
		elseif (int(p.mm.timetravel.timezone) > TIMEZONE_PRESENT) then --One of the Futures
			DrawStrUnicode(v, (hudinfo_lives.x), (hudinfo_lives.y + 16), "^6"..GetText("HUD_FUTURE"), hudinfo_lives.f|V_PERPLAYER|localTransFlag, font.scale)
		end
	end

	--DEAD player exclusive HUD
	if (prole == ROLE_DEAD) and (PlayerCount() > 1) then
		--DEAD role label
		DrawStrUnicode(v, (hudinfo_lives.x + 18), (hudinfo_lives.y + 8), RoleColorHUD[ROLE_DEAD]..GetText("HUD_ROLES", "DEAD"), hudinfo_lives.f|localTransFlag, font.scale)
		DrawStrUnicode_Center(v, 160, 120, WordWrap(0, canvas.width, 0, font.scale, GetText("HUD_DEAD")), localTransFlag, font.scale)

		--"You joined mid-game"
		if (prole == nil) then
			DrawStrUnicode_Center(v, 160, 156, WordWrap(0, canvas.width, 0, canvas.font_small.scale, GetText("HUD_MIDJOIN")), localTransFlag, font_small.scale)
		end

		--"Killed by"
		if (int(p.mm.killreason) == KILLBY_PLR) then
			if (p.mm.killername) then DrawStrUnicode(v, hudinfo_rings.x, (hudinfo_rings.y), "^5"..GetText("HUD_KILLEDBY", 1).."^0 "..p.mm.killername, hudinfo_rings.f) end
		else
			DrawStrUnicode(v, hudinfo_rings.x, (hudinfo_rings.y), "^5"..GetText("HUD_KILLEDBY", 1).."^0 "..GetText("HUD_KILLEDBY", p.mm.killreason), V_SNAPTOTOP|V_SNAPTOLEFT)
		end

		if not ((p.mm.flags & FLAG_MINIGAME) and (eMeM.minigame)) then
			DrawStrUnicode_Right(v, 320, 0, eMeM.GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
			DrawStrUnicode_Right(v, 320, font_small.charheight, GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
			DrawStrUnicode_Right(v, 320, 2*font_small.charheight, GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
		end
	end

	--Show the PONG-related text & invitations
	if (prole ~= ROLE_DEAD) and (eMeM.twopgame) and (duelplrs) then
		--determine the rival player
		if (valid(duelplrs[1]) and (duelplrs[1] == p)) then
			var1 = duelplrs[2]
		elseif (valid(duelplrs[2]) and (duelplrs[2] == p)) then
			var1 = duelplrs[1]
		end

		--draw the in-minigame text if the rival player still exists and is valid
		if (valid(var1)) then
			if not ((p.mm.flags & FLAG_MINIGAME) and (var1.mm.minigame)) then
				DrawStrUnicode_Right(v, 320, 0, GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
				DrawStrUnicode_Right(v, 320, font_small.charheight, GetText("HUD_MINIGAME", "REQUEST"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
			elseif ((p.mm.flags & FLAG_MINIGAME) and (not var1.mm.minigame)) then
				DrawStrUnicode_Right(v, 320, 0, GetText("HUD_MINIGAME", "WAIT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
				if (not p.mm.minigame_timeout) then
					DrawStrUnicode_Right(v, 320, font_small.charheight, (GetText("HUD_MINIGAME", "PRESS").." "..GetText("HUD_MINIGAME", "CANCEL")), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
				end
			elseif (not (p.mm.flags & FLAG_MINIGAME) and (var1.mm.minigame) and (leveltime % 2)) then
				DrawStrUnicode_Right(v, 320, 0, GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
				DrawStrUnicode_Right(v, 320, font_small.charheight, GetText("HUD_MINIGAME", "ACCEPT"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
			end
		end
	end

	--WEAPON RINGS

	--Weapon selector frame Y position calculation
	--ported from the SRB2's Source Code
	var1 = p.mm.weapondelay --q
	var2 = 0 --del
	var3 = 16 --pv
	while (var1) do
		if (var1 > var3) then
			var2 = var2 + var3
			var1 = var1 - var3
			var1 = var1 / 2
			if (var3 > 1) then var3 = var3 / 2 end
		else
			var2 = var2 + var1
			break
		end
	end

	--Weapon logic
	if ((prole == ROLE_MURDERER) or (prole == ROLE_SHERIFF) or (prole == ROLE_HERO) or (prole == ROLE_JESTERHERO)) then
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

		if (GetWepCfgFlags(prole) & WEPCFG_REDONLY) then

			--REDONLY|DISABLERED (Knife-only)
			if (GetWepCfgFlags(prole) & WEPCFG_DISABLERED) then
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[eMeM.weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon

			--REDONLY
			else
				if (p.powers[pw_infinityring]) then
					if (p.powers[pw_infinityring] >= weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag) --Infinite Ring icon
					drawString(HudRingWepOnly_x + 24, (HudRingWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER, "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Red Ring icon
				end
			end

			--Selector
			draw((HudRingWepOnly_x + 6), (HudRingWep.y - 2 - (var2 / 2)), eMeM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag)

		--Draw all weapons
		else
			--DISABLERED
			if (GetWepCfgFlags(prole) & WEPCFG_DISABLERED) then
				--Knife weapon
				if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
				draw((HudRingWep.x + 8), (HudRingWep.y), eMeM.graphics[weapons[-2][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER) --Knife icon

			--Draw Red/Infinite rings like normal
			else
				--Red/Infinity rings
				if (p.powers[pw_infinityring]) then
					if (p.powers[pw_infinityring] >= weapons[0][5]) then wepTextFlags[0] = wepTextFlags[0] | V_YELLOWMAP end
					draw((HudRingWep.x + 8), (HudRingWep.y), eMeM.graphics[weapons[0][1]], V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag) --Infinite Ring icon
					drawString((HudRingWep.x + 24), (HudRingWep.y + 8), p.powers[pw_infinityring], wepTextFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag, "thin-right") --Infinite Ring ammo counter
				else
					if (p.rings < 1) then wepPatchFlags[0] = V_80TRANS end
					draw((HudRingWep.x + 8), (HudRingWep.y), eMeM.graphics[weapons[-1][1]], wepPatchFlags[0]|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag) --Red Ring icon
				end
			end

			--Draw other weapons
			for weapon = 1, 6 do
				if (p.powers[weapon + 14]) then
					if (p.powers[weapon + 14] >= weapons[weapon][5]) then wepTextFlags[weapon] = wepTextFlags[weapon] | V_YELLOWMAP end

					if not (p.ringweapons & wep2rw(weapon)) then
						wepPatchFlags[weapon] = V_80TRANS
						wepTextFlags[weapon] = wepTextFlags[weapon] | V_TRANSLUCENT
					end
					draw((HudRingWep.x + 8 + weapon*20), (HudRingWep.y), eMeM.graphics[weapons[weapon][1]], wepPatchFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag) --Ring weapon icon
					if (weapons[weapon][2] == MT_THROWNAUTOMATIC) and (weapons[weapon][6][2] > 0) then
						--Draw overheat indicator
						drawFill((HudRingWep.x + 8 + weapon*20), (HudRingWep.y), 16, 16, 35|max(10 - weapons[weapon][6][2], 0)*FU|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag)
					end
					drawString((HudRingWep.x + 24 + weapon*20), (HudRingWep.y + 8), p.powers[weapon + 14], wepTextFlags[weapon]|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag, "thin-right") --Ammo counter
				elseif (p.ringweapons & wep2rw(weapon)) then
					draw((HudRingWep.x + 8 + weapon*20), (HudRingWep.y), eMeM.graphics[weapons[weapon][1]], V_TRANSLUCENT|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag)
				end
			end
			if ((p.ammoremovaltimer) and ((leveltime % 7) < 4)) then
				drawString((HudRingWep.x + 8 + (p.ammoremovalweapon*20)), (HudRingWep.y), "-"..p.ammoremoval, V_REDMAP|V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag) --Ammo removal penalty
			end

			--Selector
			draw((HudRingWep.x + 6 + p.currentweapon*20), (HudRingWep.y - 2 - (var2 / 2)), eMeM.graphics["CURWEAP"], V_SNAPTOBOTTOM|V_PERPLAYER|localTransFlag)
		end

	--Civilian weapon logic
	elseif (prole == ROLE_CIVILIAN) and (((p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 49)) or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 99))) and (cv_wepcfgCivil.value) then
		--Knife-only
		if (cv_wepcfgCivil.value == 2) then
			draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		if (p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY) then
			drawString((HudRingWepOnly_x + 24), (HudRingWep.y + 8), (p.rings / 50), V_SNAPTOBOTTOM|localTransFlag, "thin-right")
		else
			drawString((HHudRingWepOnly_x + 24), (HudRingWep.y + 8), (p.rings / 100), V_SNAPTOBOTTOM|localTransFlag, "thin-right")
		end

		--Selector
		draw((HudRingWepOnly_x + 6), (HudRingWep.y - 2 - (var2 / 2)), eMeM.graphics["CURWEAP"], V_SNAPTOBOTTOM|localTransFlag)
	elseif (prole == ROLE_JESTER) and (p.rings > 10) then
		--Knife-only
		if (cv_wepcfgCivil.value == 2) then
			draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[-2][1]], V_SNAPTOBOTTOM) --Knife icon
		else
			draw((HudRingWepOnly_x + 8), (HudRingWep.y), eMeM.graphics[weapons[-1][1]], V_SNAPTOBOTTOM) --Red Ring icon
		end

		--Ammo counter
		drawString((HudRingWepOnly_x + 24), (HudRingWep.y + 8), (p.rings / 10), V_SNAPTOBOTTOM|localTransFlag, "thin-right")

		--Selector
		draw((HudRingWepOnly_x + 6), (HudRingWep.y - 2 - (var2 / 2)), eMeM.graphics["CURWEAP"], V_SNAPTOBOTTOM|localTransFlag)
	end

	--Sheriff's Emerald Radar for Innocents
	if ((prole == ROLE_CIVILIAN) or (prole == ROLE_JESTER)) and (#eMeM.shremds) and (eMeM.shremdDist) and (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disableemeraldradar)) then
		drawScaled(9961472, 8912896, 32768, eMeM.graphics["IDEYAR"..V_GetSHREMDiconID(fixint(eMeM.shremdDist))], V_SNAPTOBOTTOM|localTransFlag) --152*FU, 136*FU, FU/2
	end

	--Are you alone?
	if (PlayerCount() == 1) and not (p.mm.flags & FLAG_SPECTATOR) then
		DrawStrUnicode_Center(v, 160, 136, WordWrap(0, canvasWidth, 0, font.scale, GetText("HUD_ALONE")), localTransFlag, font.scale)
	end

	--suggest a minigame
	if (PlayerCount() == 1) or ((p.spectator) and (not eMeM.minigame) and not (p.mm.flags & FLAG_MINIGAME) and (not eMeM.twopgame)) then
		DrawStrUnicode_Right(v, 320, 0, GetText("HUD_MINIGAME", "BORED"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
		DrawStrUnicode_Right(v, 320, font_small.charheight, GetText("HUD_MINIGAME", "PRESS"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
		DrawStrUnicode_Right(v, 320, 2*font_small.charheight, GetText("HUD_MINIGAME", "START"), V_SNAPTOTOP|V_SNAPTORIGHT|V_PERPLAYER|localTransFlag, font_small.scale)
	end

	--"Showdown duel!"
	if not (PlayerCount(ROLE_CIVILIAN) or PlayerCount(ROLE_JESTER)) and (not eMeM.twopgame) and (PlayerCount() > 1) then
		DrawStrUnicode_Center(v, 160, 192, "^8"..GetText("HUD_SHOWDOWN"), V_SNAPTOBOTTOM, font.scale)
	end

	--Sneaking
	if ((p.mm.flags & FLAG_SNEAK) and valid(p.mo) and P_IsObjectOnGround(p.mo)) then
		DrawStrUnicode(v, hudinfo_rings.x, (hudinfo_rings.y + 24), GetText("HUD_SNEAKING"), V_SNAPTOTOP|V_SNAPTOLEFT|V_PERPLAYER|localTransFlag, font_small.scale)
	end

	--Spectator mode text
	if (p.mm.flags & FLAG_SPECTATOR) then
		DrawStrUnicode_Center(v, 160, 156, WordWrap(0, canvas.width, 0, canvas.font_small.scale, GetText("HUD_SPECTATOR", "INFO")), localTransFlag, font_small.scale)
	end

	--Toggled the "Spectate"/"Enter Game" button
	if (p.mm.flags & FLAG_WAITSPECTATOR) then
		if (p.spectator) then
			DrawStrUnicode(v, 0, 0, WordWrap(0, canvas.width, 0, canvas.font_small.scale, GetText("HUD_SPECTATOR", "SWITCHING_FROM")), V_SNAPTOTOP|V_SNAPTOLEFT|localTransFlag, font_small.scale)
		else
			DrawStrUnicode(v, 0, 0, WordWrap(0, canvas.width, 0, canvas.font_small.scale, GetText("HUD_SPECTATOR", "SWITCHING_TO")), V_SNAPTOTOP|V_SNAPTOLEFT|localTransFlag, font_small.scale)
		end
	end
end, "game")

--
-- SCORES TAB
--
hud.add(function(v)
	if (gametype ~= GT_LTMMURDERMYSTERY) then hud.enable("rankings"); return end

	local draw = v.draw
	local drawFill = v.drawFill
	local drawString = v.drawString
	local localTransFlag = v.localTransFlag()

	if (not HudScores.active) then return end

	hud.disable("rankings")

	--HUD frontend for the flash/spark effects
	if (HudGame_flash.translucency) then v.fadeScreen(HudGame_flash.color, HudGame_flash.translucency) end

	DrawStrUnicode_Center(v, 160, 8, "^7"..GetText("HUD_MM"), localTransFlag, canvas.font.scale)

	--Player list
	if ((cv_cryptic.value) or (PlayerCount() < 2)) then
		DrawStrUnicode(v, 16, 24, WordWrap(16, 304, 0, canvas.font.scale, GetText("HUD_SCORESTAB")), localTransFlag, canvas.font.scale)
	else
		--Draw the player list
		--Suspects/Victims label
		if (int(consoleplayer.mm.role) == ROLE_MURDERER) then
			DrawStrUnicode(v, HudScores_pos_player.x, (HudScores_pos_player.y - 4), "^2"..GetText("HUD_VICTIMS")..":", localTransFlag, canvas.font.scale)
		else
			DrawStrUnicode(v, HudScores_pos_player.x, (HudScores_pos_player.y - 4), "^2"..GetText("HUD_SUSPECTS")..":", localTransFlag, canvas.font.scale)
		end

		--The list itself
		local shiftx, shifty = 0, 0
		local plrs = {}
		for p in players.iterate do
			if (p.mm.role ~= ROLE_DEAD) and (not eMeM.AreTeammates(consoleplayer, p)) and (consoleplayer ~= p) and (not p.quittime) and not (p.mm.flags & FLAG_SPECTATOR) then table.insert(plrs, p) end
		end
		for i = 1, #plrs do
			local p = plrs[i]
			if (PlayerCount() <= 20) then --Regular ("Double column") mode
				if (i > 10) then shiftx=140; shifty=80 end
				DrawStrUnicode(v, (HudScores_pos_player.x + shiftx), (HudScores_pos_player.y - shifty + (i * font.charheight)), "\x1E "..string.sub(p.name, 1, 15), localTransFlag, font.scale)
			else --Compact ("Tripple column") mode
				if (i > 11) then shiftx=94; shifty=88
				elseif (i > 22) then shiftx=188; shifty=88 end
				DrawStrUnicode(v, (HudScores_pos_player.x + shiftx), (HudScores_pos_player.y - shifty + (i * font.charheight)), "\x1E "..string.sub(p.name, 1, 16), localTransFlag, font.scale)
			end
		end

		--Teammates tracker
		if (eMeM.TeammatesCount(consoleplayer)) then
			local teammateNo = 0
			DrawStrUnicode(v, HudScores_pos_teammate.x, (HudScores_pos_teammate.y - 12), "^A"..GetText("HUD_TEAMMATES")..":", localTransFlag, canvas.font.scale)
			for p in players.iterate do
				local prole = p.mm.role
				if (eMeM.AreTeammates(consoleplayer, p) and (consoleplayer ~= p)) then
					--character icon
					v.drawScaled((HudScores_pos_teammate.x + (136 * (teammateNo / 2)))*FU, (HudScores_pos_teammate.y + ((teammateNo % 2) * 16))*FU, 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), localTransFlag, v.getColormap(p.skin, p.skincolor)) --FU/2
					--player name (colored as role)
					local role
					if (prole == ROLE_JESTERHERO) then role = ROLE_HERO
					else role = prole end

					v.drawString((HudScores_pos_teammate.x + 18 + (136 * (teammateNo / 2))), (HudScores_pos_teammate.y + ((teammateNo % 2) * 16)), RoleColor[role]..p.name, V_ALLOWLOWERCASE|localTransFlag)
					--icon of the currently held weapon
					v.drawScaled((HudScores_pos_teammate.x + HudScores_pos.teammateInfoOffset1_x + (136 * (teammateNo / 2)))*FU, (HudScores_pos_teammate.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, eMeM.graphics[weapons[p.currentweapon][1]], localTransFlag) --FU/2
					--amount of currently held weapon ammo
					v.drawString((HudScores_pos_teammate.x + HudScores_pos.teammateInfoOffset1_x + 18 + (136 * (teammateNo / 2))), (HudScores_pos_teammate.y + 8 + ((teammateNo % 2) * 16)), p.powers[pw_infinityring + p.currentweapon], localTransFlag, "thin")
					--red ring icon
					v.drawScaled((HudScores_pos_teammate.x + HudScores_pos.teammateInfoOffset1_x + HudScores_pos.teammateInfoOffset2_x + (136 * (teammateNo / 2)))*FU, (HudScores_pos_teammate.y + 8 + ((teammateNo % 2) * 16))*FU, 32768, eMeM.graphics[weapons[-1][1]], v.localTransFlag) --FU/2
					--amount of [red] rings
					v.drawString((HudScores_pos_teammate.x + HudScores_pos.teammateInfoOffset1_x + HudScores_pos.teammateInfoOffset2_x + 18 + (136 * (teammateNo / 2))), (HudScores_pos_teammate.y + 8 + ((teammateNo % 2) * 16)), p.rings, localTransFlag, "thin")
					teammateNo = teammateNo + 1
				end
			end
		end
	end

	v.drawFill(0, 172, 320, 2, localTransFlag) --horizontal line

	--Roles counter
	if (not cv_cryptic.value) then
		--Murderer
		DrawStrUnicode(v, 16, 176, RoleColorHUD[ROLE_MURDERER]..GetText("HUD_ROLESALIVE", ROLE_MURDERER)..": "..PlayerCount(ROLE_MURDERER), localTransFlag, font.scale)
		--Sheriff (and Hero)
		if (PlayerCount(ROLE_HERO) or (PlayerCount(ROLE_JESTERHERO))) then
			DrawStrUnicode(v, 16, 184, (RoleColorHUD[ROLE_SHERIFF]..GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..PlayerCount(ROLE_SHERIFF)..RoleColorHUD[ROLE_HERO].." + "..(PlayerCount(ROLE_HERO) + PlayerCount(ROLE_JESTERHERO))), localTransFlag, font.scale)
		else
			DrawStrUnicode(v, 16, 184, (RoleColorHUD[ROLE_SHERIFF]..GetText("HUD_ROLESALIVE", ROLE_SHERIFF)..": "..PlayerCount(ROLE_SHERIFF)), localTransFlag, font.scale)
		end
		--Civilian
		if (PlayerCount(ROLE_CIVILIAN)) then DrawStrUnicode(v, 16, 192, (RoleColorHUD[ROLE_CIVILIAN]..eMeM.GetText("HUD_ROLESALIVE", ROLE_CIVILIAN)..": "..(PlayerCount(ROLE_CIVILIAN) + PlayerCount(ROLE_JESTER))), localTransFlag, font.scale) end

		--"Sheriff's Emerald is available!"
		if ((#eMeM.shremds) and (leveltime % 2)) then
			drawScaled(262144, 12058440, 32768, eMeM.graphics["CHAOS3"], localTransFlag) --4*FU, 184*FU, FU/2
		end
	end

	--Online
	drawString(160, 176, string.format("\x89INGAME: %d \x8AONLINE: %d", PlayerCountReal() - eMeM.PlayerCountSpectators(), PlayerCountReal()), localTransFlag)

	--Role target
	local prole = consoleplayer.mm.role
	if (prole) then
		local role = ""
		local color = 1
		switch(prole , {
			[ROLE_MURDERER] = function()
				role = "MURDERER"
				color = ROLE_MURDERER
			end,
			[ROLE_SHERIFF] = function()
				role = "SHERIFF"
				color = ROLE_SHERIFF
			end,
			[ROLE_CIVILIAN] = function()
				role = "CIVILIAN"
				color = ROLE_CIVILIAN
			end,
			[ROLE_HERO] = function()
				role = "HERO"
				color = ROLE_HERO
			end,
			[ROLE_JESTER] = function()
				role = "JESTER"
				color = ROLE_JESTER
			end,
			[ROLE_JESTERHERO] = function()
				role = "JESTER"
				color = ROLE_HERO
			end
		})
		DrawStrUnicode(v, 160, (176 + font.charheight), RoleColorHUD[color]..WordWrap(160, 304, 0, font_small.scale, GetText("HUD_ROLETARGET", role)), localTransFlag, font_small.scale)
	end

	-- Prerelease/Debug
	if (eMeM.debug) then drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM|localTransFlag, "center") end
end, "scores")

--
-- Custom intermission HUD
--
hud.add(function(v)
	if (gametype ~= GT_LTMMURDERMYSTERY) then hud.enable("intermissiontally"); return end

	local draw = v.draw
	local drawScaled = v.drawScaled
	local drawFill = v.drawFill
	local drawString = v.drawString
	local getSprite2Patch = v.getSprite2Patch
	local getColormap = v.getColormap

	--Do not render the Intermission when MapVote is working or when other script specifically disables it
	if ((MapVote) or (MapVoteNet and (MapVoteNet.state > 0)) or (not HudInter.active)) then return end

	--Background
	local BGpatch
	switch(eMeM.winner, {
		[WIN_MURD] = function()
			BGpatch = eMeM.graphics["INTRMBG1"]
		end,
		[WIN_CIVILS] = function()
			BGpatch = eMeM.graphics["INTRMBG2"]
		end,
		[WIN_JESTERKILLED] = function()
			BGpatch = eMeM.graphics["INTRMBG5"]
		end,
		['default'] = function()
			BGpatch = eMeM.graphics["INTRMBG0"]
		end
	})
	for x = 0, v.width(), BGpatch.width * v.dupx() do
		for y = 0, v.height(), BGpatch.height * v.dupy() do
			draw(x, y, BGpatch, V_NOSCALESTART)
		end
	end

	hud.disable("intermissiontally")

	local plrs = {}
	local shiftx, shifty = 0, 0

	--Map name drawer
	if (mapheaderinfo[gamemap].actnum == 0) then
		drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *", 0, "center")
	else
		drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *", 0, "center")
	end

	drawFill(0, 40, 320, 2, 0) --horizontal line

	--player list
	for p in players.iterate do
		if not (p.mm.flags & FLAG_SPECTATOR) then table.insert(plrs, p) end
	end
	--sort players by kills count
	table.sort(plrs, function(a, b)
		return a.mm.kills > b.mm.kills
	end)

	-- Column names

	--vertical line and everything common for >8 player screen
	if (eMeM.PlayerCount() > 8) then
		drawFill(160, 40, 2, 144, 0)
		drawString(HudInter_pos_kills2_x, HudInter_pos_players_y, "\x82KILLS", 0, "thin")
		drawString((HudInter_pos_kills2_x + 160), HudInter_pos_players_y, "\x82KILLS", 0, "thin")
	end
	--everything else which is uncommon
	if (eMeM.PlayerCount() <= 8) then
		drawString(HudInter_pos_name_x, HudInter_pos_players_y, "\x82NAME", 0)
		drawString(HudInter_pos_kills_x, HudInter_pos_players_y, "\x82KILLS", 0)
-- 	elseif (eMeM.PlayerCount() > 8) and (eMeM.PlayerCount() <= 16) then
		--players 1-8
		drawString(HudInter_pos_name_x, HudInter_pos_players_y, "\x82NAME", 0, "thin")
		--players 9-16
		drawString((HudInter_pos_name_x + 160), HudInter_pos_players_y, "\x82NAME", 0, "thin")
	else
		--players 1-16
		drawString(HudInter_pos_name2_x, HudInter_pos_players_y, "\x82NAME", 0, "thin")
		--players 17-32
		drawString((HudInter_pos_name2_x + 160), HudInter_pos_players_y, "\x82NAME", 0, "thin")
	end

	-- Player stats

	for i = 1, #plrs do
		local p = plrs[i]
		local pmm = p.mm
		if (PlayerCount() <= 8) then --Regular mode
			--Character icon
			drawScaled((HudInter_pos_name_x - 20)*FU, ((HudInter_pos_players_y - 4) + (i * 16))*FU, 32768, getSprite2Patch(p.skin, SPR2_XTRA), 0, getColormap(p.skin, p.skincolor)) --FU/2
			--Player name (colored by role)
			local color = 1
			switch(pmm.role, {
				[ROLE_DEAD] = function()
					color = ROLE_DEAD
				end,
				[ROLE_MURDERER] = function()
					color = ROLE_MURDERER
				end,
				[ROLE_SHERIFF] = function()
					color = ROLE_SHERIFF
				end,
				[ROLE_CIVILIAN] = function()
					color = ROLE_CIVILIAN
				end,
				[ROLE_HERO] = function()
					color = ROLE_HERO
				end,
				[ROLE_JESTER] = function()
					color = ROLE_JESTER
				end,
				[ROLE_JESTERHERO] = function()
					color = ROLE_JESTER
				end
			})
			drawString((HudInter_pos_name_x), (HudInter_pos_players_y + (i * 16)), RoleColor[color]..p.name, V_ALLOWLOWERCASE)

			--Kills counter
			drawString((HudInter_pos_kills_x), (HudInter_pos_players_y + (i * 16)), p.mm.kills)
		elseif ((PlayerCount() > 8) and (PlayerCount() <= 16)) then --"Double column" mode
			if (i > 8) then shiftx=160; shifty=128 end --players 9-16 are drawn on the second column

			--Character icon
			drawScaled((HudInter_pos_name_x + shiftx - 20)*FU, ((HudInter_pos_players_y - 4) + (i * 16) - shifty)*FU, 32768, getSprite2Patch(p.skin, SPR2_XTRA), 0, v.getColormap(p.skin, p.skincolor)) --FU/2
			--Player name (colored by role)
			local color = 1
			switch(p.mm.role, {
				[ROLE_DEAD] = function()
					color = ROLE_DEAD
				end,
				[ROLE_MURDERER] = function()
					color = ROLE_MURDERER
				end,
				[ROLE_SHERIFF] = function()
					color = ROLE_SHERIFF
				end,
				[ROLE_CIVILIAN] = function()
					color = ROLE_CIVILIAN
				end,
				[ROLE_HERO] = function()
					color = ROLE_HERO
				end,
				[ROLE_JESTER] = function()
					color = ROLE_JESTER
				end,
				[ROLE_JESTERHERO] = function()
					color = ROLE_JESTER
				end
			})
			drawString((HudInter_pos_name_x + shiftx), (HudInter_pos_players_y + (i * 16) - shifty), RoleColor[color]..string.sub(p.name, 1, 13), V_ALLOWLOWERCASE)

			--Kills counter
			drawString((HudInter_pos_kills2_x + shiftx), (HudInter_pos_players_y + (i * 16) - shifty), p.mm.kills)
		else --"Double column compact" mode
			if (i > 16) then shiftx=160; shifty=128 end --players 17-32 are drawn on the second column

			--back to the rows
			--Character icon
			drawScaled((HudInter_pos_name2_x + shiftx - 10)*FU, ((HudInter_pos_players2_y - 1) + (i * 8) - shifty)*FU, 16384, getSprite2Patch(p.skin, SPR2_XTRA), 0, v.getColormap(p.skin, p.skincolor)) --FU/4
			--Player name (colored by role)
			local color = 1
			switch(p.mm.role, {
				[ROLE_DEAD] = function()
					color = ROLE_DEAD
				end,
				[ROLE_MURDERER] = function()
					color = ROLE_MURDERER
				end,
				[ROLE_SHERIFF] = function()
					color = ROLE_SHERIFF
				end,
				[ROLE_CIVILIAN] = function()
					color = ROLE_CIVILIAN
				end,
				[ROLE_HERO] = function()
					color = ROLE_HERO
				end,
				[ROLE_JESTER] = function()
					color = ROLE_JESTER
				end,
				[ROLE_JESTERHERO] = function()
					color = ROLE_JESTER
				end
			})
			drawString((HudInter_pos_name2_x + shiftx), (HudInter_pos_players2_y + (i * 8) - shifty), RoleColor[color]..p.name, V_ALLOWLOWERCASE, "thin")

			--Kills counter
			drawString((HudInter_pos_kills2_x + shiftx), (HudInter_pos_players2_y + (i * 8) - shifty), p.mm.kills, 0, "thin")
		end
	end

	-- Winner text
	if (not eMeM.winner) then
		DrawStrUnicode_Center(v, 160, 176, GetText("HUD_WIN", "TIE")) --Tie
	else
		local winner
		switch(eMeM.winner, {
			[WIN_MURD] = function()
				winner = "BAD"
			end,
			[WIN_CIVILS] = function()
				winner = "GOOD"
			end,
			[WIN_JESTERKILLED] = function()
				winner = "JESTER"
			end
		})
		DrawStrUnicode_Center(v, 160, 176, GetText("HUD_WINNERS").." "..GetText("HUD_WIN", winner))
	end

	--Prerelease/Debug
	if (eMeM.debug) then drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end, "intermission")
