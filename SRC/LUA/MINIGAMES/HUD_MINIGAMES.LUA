-- HUD_MINIGAMES.LUA
-- Code by LeonardoTheMutant
--
-- Dedicated HUD renderering functions for Minigames

local SonicRunBG = {} --Cached background images for Sonic Run
local coords = {
    pong = {x=80, y=60}, --offset coordinates from (0,0)
    sonicRun = {x=60, y=60} --offset coordinates from (0,0)
}

local var1, var2

local DrawTextPatch = HIDEO.DrawTextPatch
local GetTextPatchWidth = HIDEO.GetTextPatchWidth
local DrawStrUnicode = HIDEO.DrawStrUnicode
local DrawStrUnicode_Center = HIDEO.DrawStrUnicode_Center
local DrawStrUnicode_Right = HIDEO.DrawStrUnicode_Right

local eMeM = MM
local MMhud = eMeM.hud
local canvas = MMhud.canvas
local font = canvas.font
local font_small = font.small

local GetText = eMeM.GetText

local hudinfo_time = hudinfo[HUD_TIME]
local hudinfo_lives = hudinfo[HUD_LIVES]

local HUDDIGIT = "HUDDIGIT"
local HUD_MINIGAME = "HUD_MINIGAME"

local function V_DrawHudNum(v, x, y, flags, num)
	x = x or 0
	y = y or 0
	flags = flags or 0
	num = num or 0
	local w = GetTextPatchWidth(eMeM.textpatch[HUDDIGIT][0])

	if (flags & (V_NOSCALESTART|V_NOSCALEPATCH)) then
		w = w * v.dupx()
	end

	-- draw the number
	repeat
		x = x - w
		DrawTextPatch(v, x, y, eMeM.textpatch[HUDDIGIT][num % 10], 1, flags)
		num = num / 10
	until (not num)
end

local function V_DrawHudNumPadded(v, x, y, flags, num, digits)
	x = x or 0
	y = y or 0
	flags = flags or 0
	num = num or 0
	digits = digits or 0
	local w = GetTextPatchWidth(eMeM.textpatch[HUDDIGIT][0])

	if (flags & (V_NOSCALESTART|V_NOSCALEPATCH)) then
		w = w * v.dupx()
	end

	-- draw the number
	repeat
		x = x - w
		DrawTextPatch(v, x, y, eMeM.textpatch[HUDDIGIT][num % 10], 1, flags)
		num = num / 10
		digits = digits - 1
	until (not digits)
end

local function V_DrawMinigameTime(v)
	local localTransFlag = v.localTransFlag()
	local img_time = eMeM.text[eMeM.lang]["IMG_TIME"]

    --label size and X position
	local timeLabelWidth
	if (img_time) and (not splitscreen) then
		timeLabelWidth = GetTextPatchWidth(img_time) + 48
	else
		timeLabelWidth = 96
	end
	local timeLabelX = (160 - (timeLabelWidth / 2))

    --timer calculation
	local timertime = (eMeM.timelimit * 2100) - leveltime

	--"TIME" text
	if (img_time) and (not splitscreen) then
		--Draw the Text Label
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4)) then
			DrawTextPatch(v, timeLabelX, hudinfo_time.y, img_time, 2, V_SNAPTOTOP|localTransFlag) --Flashing
		else
			DrawTextPatch(v, timeLabelX, hudinfo_time.y, img_time, 1, V_SNAPTOTOP|localTransFlag) --Normal
		end
	else --in case Text Patch was not found or the game is splitscreen (HIDEO.DrawTextPatch() does not support per-player rendering)
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4)) then
			v.draw(timeLabelX, hudinfo_time.y, eMeM.graphics["STTRTIME"], V_SNAPTOTOP|localTransFlag)
		else
			v.draw(timeLabelX, hudinfo_time.y, eMeM.graphics["STTTIME"], V_SNAPTOTOP|localTransFlag)
		end
	end

	--Numbers
	V_DrawHudNumPadded(v, (timeLabelX + timeLabelWidth), hudinfo_time.y, V_SNAPTOTOP|localTransFlag, G_TicsToSeconds(timertime), 2)
	DrawTextPatch(v, (timeLabelX + timeLabelWidth - 24), hudinfo_time.y, eMeM.textpatch["HUDCOLON"], 1, V_SNAPTOTOP|localTransFlag)
	V_DrawHudNum(v, (timeLabelX + timeLabelWidth - 22), hudinfo_time.y, V_SNAPTOTOP|localTransFlag, G_TicsToMinutes(timertime))
end

--
-- SONIC RUN minigame renderer
--
MMhud.routines["minigame_sonicrun"] = function(v, p)
	local drawFill = v.drawFill
	local drawString = v.drawString
	local drawCropped = v.drawCropped
	local localTransFlag = v.localTransFlag()

	--Load Sonic Run graphics into memory (if not already loaded)
	--Backgrounds
	if (not #SonicRunBG) then
		for i = 0, 2 do
			if (v.patchExists("SNCRNBG"..i)) then SonicRunBG[i] = v.cachePatch("SNCRNBG"..i) end
		end
	end

	--CUSTOM3 related text
	DrawStrUnicode_Right(v, 320, 0, (GetText(HUD_MINIGAME, "PRESS").." "..GetText(HUD_MINIGAME, "LEAVE")), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)

	local SR = SonicRun

	--TIME
	V_DrawMinigameTime(v)

	--Draw scrolling background
	--Despite checking for the patch width, it can currently work only with 200x80 images
	local scroll = SR.score % SonicRunBG[SR.background].width
	drawCropped((coords.sonicRun.x * FU), (coords.sonicRun.y * FU), FU, FU, SonicRunBG[SR.background], localTransFlag, nil, (scroll * FU), 0, (SonicRunBG[SR.background].width - scroll)*FU, 5242880) --80*FU
	drawCropped((coords.sonicRun.x + SonicRunBG[SR.background].width - scroll)*FU, (coords.sonicRun.y * FU), FU, FU, SonicRunBG[SR.background], localTransFlag, nil, 0, 0, (scroll * FU), 5242880) --80*FU


	--Sonic
	local sonicSprite
	switch(SR.state, {
		[0] = function() --Standing
			sonicSprite = "SNC_STND"
		end,
		[1] = function() --Running
			sonicSprite = "SNC_RUN"..((leveltime % 2) + 1)
		end,
		[2] = function() --Spinning/Jumping
			switch(leveltime % 4, {
				[1] = function()
					sonicSprite = "SNC_SPN2"
				end,
				[3] = function()
					sonicSprite = "SNC_SPN3"
				end,
				['default'] = function()
					sonicSprite = "SNC_SPN1"
				end
			})
		end
	})
	v.draw((coords.sonicRun.x + 16), (coords.sonicRun.y + (80 - SR.Height - SR.Y)), eMeM.graphics[sonicSprite], localTransFlag)

	--hazards
	local hazardSprite = "SPIK"..CHAR[65 + ((leveltime % 16) / 2)].."0"
	for id, hazard in pairs(SR.hazards) do
		v.drawScaled((coords.sonicRun.x + hazard[1] + 14)*FU, (coords.sonicRun.y + (80 - hazard[2]))*FU, 32768, v.cachePatch(hazardSprite), localTransFlag) --FU/2
	end

	--black screen outline
	drawFill((coords.sonicRun.x - 16),  (coords.sonicRun.y),      16,  80, 31|localTransFlag) --left side
	drawFill((coords.sonicRun.x + 200), (coords.sonicRun.y),      16,  80, 31|localTransFlag) --right
	drawFill((coords.sonicRun.x - 16),  (coords.sonicRun.y - 16), 232, 16, 31|localTransFlag) --top
	drawFill((coords.sonicRun.x - 16),  (coords.sonicRun.y + 80), 232, 16, 31|localTransFlag) --bottom

	--Startup timer
	if (SR.timeout) then
		local secondsLeft = SR.timeout / TICRATE
		if (secondsLeft) then
			local countdownPatch = "RACE3"
			if (secondsLeft <= 2) then
				countdownPatch = "RACE"..secondsLeft
			end
			v.draw(152, 100, eMeM.graphics[countdownPatch], localTransFlag)
		else
			v.draw(142, 100, eMeM.graphics["RACEGO"], localTransFlag)
		end
	end

	--score
	drawString((coords.sonicRun.x + 200 - v.stringWidth(SR.score)), (coords.sonicRun.y - 12), SR.score, V_BLUEMAP|localTransFlag)

	if (not SR.active) then
		drawString(160, (coords.sonicRun.y + 44), "GAME OVER", V_INVERTMAP|localTransFlag, "center")
	end

	drawString(160, (coords.sonicRun.y + 84), "Controls: \x87JUMP\x80 & \x87SPIN\x80", localTransFlag, "center")

	--player side information
	--character icon
	v.drawScaled((hudinfo_lives.x * FU), (hudinfo_lives.y * FU), 32768, v.getSprite2Patch(p.skin, SPR2_XTRA), hudinfo_lives.f|localTransFlag, v.getColormap(p.skin, p.skincolor)) --FU/2
	--name
	drawString((hudinfo_lives.x + 18), hudinfo_lives.y, p.name, hudinfo_lives.f|V_ALLOWLOWERCASE|localTransFlag)
	--role ("DEAD" label)
	if (p.mm.role == ROLE_DEAD and eMeM.PlayerCount() > 1) then
		DrawStrUnicode(v, (hudinfo_lives.x + 18), (hudinfo_lives.y + 8), eMeM.RoleColorHUD[ROLE_DEAD]..GetText("HUD_ROLES", "DEAD"), hudinfo_lives.f|localTransFlag, font.scale)
	end

	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.mm.timetravel and p.mm.timetravel.timezone) then
		if (p.mm.timetravel.timezone == TIMEZONE_PAST) then --Past
			DrawStrUnicode(v, (hudinfo_lives.x), (hudinfo_lives.y + 8 + font.charheight), "^6"..GetText("HUD_PAST"), hudinfo_lives.f|V_PERPLAYER|localTransFlag, font.scale)
		elseif (p.mm.timetravel.timezone > TIMEZONE_PRESENT) then --One of the Futures
			DrawStrUnicode(v, (hudinfo_lives.x), (hudinfo_lives.y + 8 + font.charheight), "^6"..GetText("HUD_FUTURE"), hudinfo_lives.f|V_PERPLAYER|localTransFlag, font.scale)
		end
	end

	if (eMeM.debug) then
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y, "\x87SONIC RUN",0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+8, "\x82State:\x80 "..SR.state,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+16, "\x82Y:\x80 "..SR.Y,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+24, "\x82Height:\x80 "..SR.Height,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+32, "\x82Velocity:\x80 "..SR.velocity,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+40, "\x82Ttimeout\x80 "..SR.timeout,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+48, "\x82Leveltime\x80 "..leveltime,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+56, "\x82#Hazards:\x80 "..#SR.hazards,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+64, "\x82Hazards timeout:\x80 "..SR.hazardsTimeout,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+72, "\x82".."Background:\x80 "..SR.background,0,"thin")
	end
end

--
-- PONG minigame renderer
--
MMhud.routines["minigame_pong"] = function(v, p)
	local drawFill = v.drawFill
	local drawString = v.drawString
	local localTransFlag = v.localTransFlag()

	if (not eMeM.duelplrs) or (not valid(eMeM.duelplrs[1])) or (not valid(eMeM.duelplrs[2])) then return end

	local player1 = eMeM.duelplrs[1]
	local player2 = eMeM.duelplrs[2]

	--CUSTOM3 related text and show yourself
	if (PONG_GetMySlot(p)) then
		DrawStrUnicode_Right(v, 320, 0, (GetText(HUD_MINIGAME, "PRESS").." "..GetText(HUD_MINIGAME, "LEAVE")), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
		if (not splitscreen) then
			local youX
			if (p == player1) then youX = 32
			elseif (p == player2) then youX = 288 end
			DrawStrUnicode_Center(v, youX, 48, "^2"..eMeM.GetText("HUD_YOU"), V_SNAPTOLEFT|localTransFlag, font.scale)
		end
	else
		DrawStrUnicode_Right(v, 320, 0, GetText(HUD_MINIGAME, "SPECTATING"), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
		DrawStrUnicode_Right(v, 320, font_small.charheight, (GetText(HUD_MINIGAME, "PRESS").." "..GetText(HUD_MINIGAME, "LEAVE")), V_SNAPTOTOP|V_SNAPTORIGHT|localTransFlag, font_small.scale)
	end

	--TIME
	V_DrawMinigameTime(v)

	--draw board
	drawFill((coords.pong.x - 2), (coords.pong.y - 2), 164, 84, localTransFlag) --white outline
	drawFill(coords.pong.x, coords.pong.y, 160, 80, 31|localTransFlag) --black background
	--draw player paddles
	drawFill((coords.pong.x + 8), (coords.pong.y + eMeM.pong.pads[1]), 2, 16, eMeM.pong.padcolor[player1.mm.role]|localTransFlag)
	drawFill((310 - coords.pong.x), (coords.pong.y + eMeM.pong.pads[2]), 2, 16, eMeM.pong.padcolor[player2.mm.role]|localTransFlag)
	--draw ball
	if not (eMeM.pong.timeout % 2) then
		v.drawFill((coords.pong.x + eMeM.pong.ball.x), (coords.pong.y + eMeM.pong.ball.y), 2, 2, 72|localTransFlag)
	end
	--winner text
	if (eMeM.pong.winner ~= nil) then
		if (not eMeM.pong.winner) then
			DrawStrUnicode_Center(v, 160, 160, GetText("HUD_WIN", 1), localTransFlag, font.scale)
		else
			DrawStrUnicode_Center(v, 160, 160, eMeM.RoleColorHUD[eMeM.duelplrs[eMeM.pong.winner].mm.role]..GetText("HUD_MINIGAME", "GOAL"), localTransFlag, font.scale)
		end
	end

	--player 1 side information
	--player name
	drawString(16, 176, player1.name, V_ALLOWLOWERCASE|V_SNAPTOLEFT|localTransFlag)
	--role
	switch(player1.mm.role , {
		[ROLE_MURDERER] = function()
			var1 = "MURDERER"
			var2 = ROLE_MURDERER
		end,
		[ROLE_SHERIFF] = function()
			var1 = "SHERIFF"
			var2 = ROLE_SHERIFF
		end,
		['default'] = function()
			var1 = "DEAD"
			var2 = ROLE_DEAD
		end
	})
	DrawStrUnicode(v, hudinfo_lives.x, (hudinfo_lives.y + font.charheight), eMeM.RoleColorHUD[var2]..GetText("HUD_ROLES", var1), V_SNAPTOLEFT|localTransFlag, font.scale)
	--character picture
	v.draw(48, 80, v.getSprite2Patch(player1.skin, SPR2_XTRA), V_ALLOWLOWERCASE|V_SNAPTOLEFT|localTransFlag, v.getColormap(player1.skin, player1.skincolor)) --draw character icon flipped horizontaly
	--win count
	DrawStrUnicode_Center(v, (coords.pong.x + 10), 44, (eMeM.RoleColorHUD[player1.mm.role]..player1.mm.kills), localTransFlag, font.scale)

	--player 2 side information
	--name
	drawString((304 - v.stringWidth(player2.name)), 176, player2.name, V_ALLOWLOWERCASE|V_SNAPTORIGHT|localTransFlag)
	--role
	switch(player2.mm.role , {
		[ROLE_MURDERER] = function()
			var1 = "MURDERER"
			var2 = ROLE_MURDERER
		end,
		[ROLE_SHERIFF] = function()
			var1 = "SHERIFF"
			var2 = ROLE_SHERIFF
		end,
		['default'] = function()
			var1 = "DEAD"
			var2 = ROLE_DEAD
		end
	})
	DrawStrUnicode_Right(v, (320 - hudinfo_lives.x), (hudinfo_lives.y + font.charheight), eMeM.RoleColorHUD[var2]..GetText("HUD_ROLES", var1), V_SNAPTORIGHT|localTransFlag, font.scale)
	--charpic
	v.draw(272, 80, v.getSprite2Patch(player2.skin, SPR2_XTRA), V_SNAPTORIGHT|localTransFlag, v.getColormap(player2.skin, player2.skincolor))
	--win count
	DrawStrUnicode_Center(v, (310 - coords.pong.x), 44, (eMeM.RoleColorHUD[player2.mm.role]..player2.mm.kills), localTransFlag, font.scale)

	if (eMeM.debug) then
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y, "\x87PONG",0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+8, "\x82".."Ball:\x80 "..eMeM.pong.ball.x.." "..eMeM.pong.ball.y,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+16, "\x82Velocity:\x80 "..eMeM.pong.velocity.x.." "..eMeM.pong.velocity.y,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+24, "\x82Hits:\x80 "..eMeM.pong.hits,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+32, "\x82Speed:\x80 "..eMeM.pong.speed,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+40, "\x82Winner:\x80 "..tostring(eMeM.pong.winner),0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+48, "\x82Timeout\x80 "..eMeM.pong.timeout,0,"thin")
		drawString(MMhud.game.pos.debug.x, MMhud.game.pos.debug.y+56, "\x82Leveltime\x80 "..leveltime,0,"thin")
	end
end
