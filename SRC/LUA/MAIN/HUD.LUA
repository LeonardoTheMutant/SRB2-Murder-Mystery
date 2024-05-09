-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

-- Constants
local coords={ --HUD screen coordinates
	first = {y=32}, --this and everything below for custom intermission
	num = {x=16},
	name = {x=48},
	kills = {x=264},
	first2 = {y=40},
	num2 = {x=4},
	name2 = {x=40},
	kills2 = {x=132},
	num3 = {x=4},
	name3 = {x=24},
	teammateInfo = {
		x=20, y=120
	},
	teammateInfoOffset1 = {x=18},
	teammateInfoOffset2 = {x=36},
	firstRingWepMurd = {x = 152},
	firstRingWep = { --for weapon icons
		x=92, y=156
	},debugHUD = {
		x=8, y=48
	},pong = { --offset coordinates from screen's (0,0)
		x=80, y=60
	},sonicRun = { --offset coordinates from screen's (0,0)
		x=60, y=60
	},minigameTime = {
		x=124, y=24
	}
}

local expectedHudInfoSize = {0,0,0}
local maxHudIfnfoSize = 0

-- Hook Functions

local function mainHUD(v, p) --main game HUD
	if (gametype != GT_MURDERMYSTERY) --in case if switched from MM to another gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("time")
		hud.enable("rings")
		hud.enable("weaponrings")
		return
	end
	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	if (((consoleplayer.mmhelp) and (consoleplayer.mmhelp.active)) or (consoleplayer.debugdrawer)) return end

	--timer calculation
	local timeleft = (MM.timelimit * 2100) - leveltime

	--
	-- SONIC RUN minigame renderer
	--
	if ((p.minigame) and ((p.spectator) or (PlayerCount() == 1)) and (not (MM.minigame and MM.twopgame)))
		--CUSTOM3 related text
		if (not p.minigametimeout) V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 0, consoleplayer.mmlang, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) end --FU/2

		--TIME
		--"TIME" text
		local timePatchWidth = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_TIME"])
		if (not G_TicsToMinutes(timeleft)) and (leveltime & 4) V_DrawTextPatch(v, coords.minigameTime.x, coords.minigameTime.y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25))
		else V_DrawTextPatch(v, coords.minigameTime.x, coords.minigameTime.y, MM.text[consoleplayer.mmlang]["BMP_TIME"]) end
		--minutes
		if (G_TicsToMinutes(timeleft) > 9)
			v.draw((coords.minigameTime.x + timePatchWidth + 6), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft/10))) --first digit
			v.draw((coords.minigameTime.x + timePatchWidth + 14), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft%10))) --second digit
		else
			v.draw((coords.minigameTime.x + timePatchWidth + 14), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft)))
		end
		--colon
		v.draw((coords.minigameTime.x + timePatchWidth + 22), coords.minigameTime.y, v.cachePatch("STTCOLON"))
		--seconds
		if (G_TicsToSeconds(timeleft) > 9)
			v.draw((coords.minigameTime.x + timePatchWidth + 30), coords.minigameTime.y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)/10))) --first digit
			v.draw((coords.minigameTime.x + timePatchWidth + 38), coords.minigameTime.y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)%10))) --second digit
		else
			v.draw((coords.minigameTime.x + timePatchWidth + 30), coords.minigameTime.y, v.cachePatch("STTNUM0")) --first digit is always 0
			v.draw((coords.minigameTime.x + timePatchWidth + 38), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToSeconds(timeleft))) --second digit
		end

		--white screen background
		v.drawFill(coords.sonicRun.x, coords.sonicRun.y, 200, 80, 0)

		--Sonic
		local sonicSprite
		if (p.SonicRun.state == 0)
			sonicSprite = "SNC_STND"
		elseif (p.SonicRun.state == 1)
			if (leveltime & 1) sonicSprite = "SNC_RUN1"
			else sonicSprite = "SNC_RUN2" end
		elseif (p.SonicRun.state == 2)
			if (leveltime % 4 == 0) sonicSprite = "SNC_SPN1"
			elseif (leveltime % 4 == 1) sonicSprite = "SNC_SPN2"
			elseif (leveltime % 4 == 2) sonicSprite = "SNC_SPN1"
			elseif (leveltime % 4 == 3) sonicSprite = "SNC_SPN3" end
		end
		v.draw((coords.sonicRun.x + 16), (coords.sonicRun.y + (80 - p.SonicRun.Height - p.SonicRun.Y)), v.cachePatch(sonicSprite))

		--hazards
		local hazardSprite = "SPIK"..string.char(65 + ((leveltime % 16) >> 1)).."0"
		for id, hazard in pairs(p.SonicRun.hazards)
			v.drawScaled((coords.sonicRun.x + hazard.x + 14)*FU, (coords.sonicRun.y + (80 - hazard.y))*FU, 32768, v.cachePatch(hazardSprite)) --FU/2
		end

		--black screen outline
		v.drawFill((coords.sonicRun.x - 16), (coords.sonicRun.y), 16, 80, 31) --left side
		v.drawFill((coords.sonicRun.x + 200), (coords.sonicRun.y), 16, 80, 31) --right
		v.drawFill((coords.sonicRun.x - 16), (coords.sonicRun.y - 16), 232, 16, 31) --top
		v.drawFill((coords.sonicRun.x - 16), (coords.sonicRun.y + 80), 232, 16, 31) --bottom

		--Startup timer
		if (p.SonicRun.timeout)
			local secondsLeft = p.SonicRun.timeout / TICRATE
			if (secondsLeft)
				local countdownPatch = "RACE3"
				if (secondsLeft <= 2) countdownPatch = "RACE"..secondsLeft end
				v.draw(152, 100, v.cachePatch(countdownPatch))
			elseif v.draw(142, 100, v.cachePatch("RACEGO")) end
		end

		--score
		local scoreWidth = v.stringWidth(p.SonicRun.score)
		v.drawString((coords.sonicRun.x + 200 - scoreWidth), (coords.sonicRun.y - 12), p.SonicRun.score, V_SNAPTORIGHT|V_BLUEMAP)

		if (not p.SonicRun.active)
			v.drawString(160, (coords.sonicRun.y + 84), "GAME OVER", 0, "center")
		end

		v.drawString(160, (coords.sonicRun.y + 100), "Controls: \x87JUMP\x80 & \x87SPIN\x80", 0, "center")

		--player side information
		--character icon
		v.drawScaled((hudinfo[HUD_LIVES].x*FU), (hudinfo[HUD_LIVES].y*FU), 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
		--name
		v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)
		--role
		if (p.role) V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), consoleplayer.mmlang, MM.RoleColorHUD[p.role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][p.role], hudinfo[HUD_LIVES].f)
		elseif (p.spectator) V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), consoleplayer.mmlang, MM.RoleColorHUD[5]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][5], hudinfo[HUD_LIVES].f) end

		if (MM.devbuild)
			v.drawString(coords.debugHUD.x, coords.debugHUD.y, "\x87SONIC RUN",0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+8, "\x82State:\x80 "..p.SonicRun.state,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+16, "\x82Y:\x80 "..p.SonicRun.Y,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+24, "\x82Height:\x80 "..p.SonicRun.Height,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+32, "\x82Velocity:\x80 "..p.SonicRun.velocity,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+40, "\x82Ttimeout\x80 "..p.SonicRun.timeout,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+48, "\x82Leveltime\x80 "..leveltime,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+56, "\x82#Hazards:\x80 "..#p.SonicRun.hazards,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+64, "\x82Hazards timeout:\x80 "..p.SonicRun.hazardsTimeout,0,"thin")
		end
		return
	end

	--
	-- PONG minigame renderer
	--
	if (MM.minigame) and (p.minigame)
		if (not MM.duelplrs[1].valid) or (not MM.duelplrs[2].valid) return end
		--CUSTOM3 related text and show yourself
		if (p == MM.duelplrs[1]) or (p == MM.duelplrs[2])
			if (not p.minigametimeout) V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 0, consoleplayer.mmlang, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) end --FU/2
			if (p == MM.duelplrs[1]) V_DrawStrASCIIcentered(v, 32, 48, consoleplayer.mmlang, "\2"..MM.text[consoleplayer.mmlang]["HUD_YOU"], V_SNAPTOLEFT)
			elseif (p == MM.duelplrs[2]) V_DrawStrASCIIcentered(v, 288, 48, consoleplayer.mmlang, "\2"..MM.text[consoleplayer.mmlang]["HUD_YOU"], V_SNAPTORIGHT) end
		else
			V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATING"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATING"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768)
			if (not p.minigametimeout) V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 4, consoleplayer.mmlang, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) end
			V_DrawStrASCIIcentered(v, 160, 152, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PONGBALL"]) --spectator ball text
		end

		--TIME
		--"TIME" text
		local timePatchWidth = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_TIME"])
		if (not G_TicsToMinutes(timeleft)) and (leveltime & 4) V_DrawTextPatch(v, coords.minigameTime.x, coords.minigameTime.y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25))
		else V_DrawTextPatch(v, coords.minigameTime.x, coords.minigameTime.y, MM.text[consoleplayer.mmlang]["BMP_TIME"]) end
		--minutes
		if (G_TicsToMinutes(timeleft) > 9)
			v.draw((coords.minigameTime.x + timePatchWidth + 6), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft/10))) --first digit
			v.draw((coords.minigameTime.x + timePatchWidth + 14), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft%10))) --second digit
		else
			v.draw((coords.minigameTime.x + timePatchWidth + 14), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft)))
		end
		--colon
		v.draw((coords.minigameTime.x + timePatchWidth + 22), coords.minigameTime.y, v.cachePatch("STTCOLON"))
		--seconds
		if (G_TicsToSeconds(timeleft) > 9)
			v.draw((coords.minigameTime.x + timePatchWidth + 30), coords.minigameTime.y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)/10))) --first digit
			v.draw((coords.minigameTime.x + timePatchWidth + 38), coords.minigameTime.y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)%10))) --second digit
		else
			v.draw((coords.minigameTime.x + timePatchWidth + 30), coords.minigameTime.y, v.cachePatch("STTNUM0")) --first digit is always 0
			v.draw((coords.minigameTime.x + timePatchWidth + 38), coords.minigameTime.y, v.cachePatch("STTNUM"..G_TicsToSeconds(timeleft))) --second digit
		end

		--draw board
		v.drawFill((coords.pong.x - 2), (coords.pong.y - 2), 164, 84, 0) --white outline
		v.drawFill(coords.pong.x, coords.pong.y, 160, 80, 31) --black background
		--draw player paddles
		v.drawFill((coords.pong.x + 8), (coords.pong.y + MM.pong.pads[1]), 2, 16, MM.pong.padcolor[MM.duelplrs[1].role])
		v.drawFill((310 - coords.pong.x), (coords.pong.y + MM.pong.pads[2]), 2, 16, MM.pong.padcolor[MM.duelplrs[2].role])
		--draw ball
		if (MM.pong.wintimeout & 1) v.drawFill((coords.pong.x + MM.pong.ball.x), (coords.pong.y + MM.pong.ball.y), 2, 2, 72) end
		--winner text
		if (MM.pong.winner != nil)
			if (not MM.pong.winner) V_DrawStrASCIIcentered(v, 160, 160, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_WIN"][1])
			else V_DrawStrASCIIcentered(v, 160, 160, consoleplayer.mmlang, MM.RoleColorHUD[MM.duelplrs[MM.pong.winner].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[MM.pong.winner].role].."\0 "..MM.text[consoleplayer.mmlang]["HUD_WON"]) end
		end
		--player 1 side information
		if (MM.duelplrs[1].valid)
			--player name
			v.drawString(16, 176, MM.duelplrs[1].name, V_ALLOWLOWERCASE|V_SNAPTOLEFT)
			--role
			V_DrawStrASCII(v, 16, 184, consoleplayer.mmlang, (MM.RoleColorHUD[MM.duelplrs[1].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[1].role]), V_SNAPTOLEFT)
			--character picture
			v.draw(48, 80, v.getSprite2Patch(MM.duelplrs[1].skin, SPR2_XTRA), V_ALLOWLOWERCASE|V_SNAPTOLEFT, v.getColormap(MM.duelplrs[1].skin, MM.duelplrs[1].skincolor)) --draw character icon flipped horizontaly
			--win count
			V_DrawStrASCIIcentered(v, (coords.pong.x + 10), 44, consoleplayer.mmlang, (MM.RoleColorHUD[MM.duelplrs[1].role]..MM.duelplrs[1].kills))
		end
		--player 2 side information
		if (MM.duelplrs[2].valid)
			--name
			v.drawString((304 - v.stringWidth(MM.duelplrs[2].name)), 176, MM.duelplrs[2].name, V_ALLOWLOWERCASE|V_SNAPTORIGHT)
			--role
			V_DrawStrASCII(v, (304 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[2].role])), 184, consoleplayer.mmlang, (MM.RoleColorHUD[MM.duelplrs[2].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[2].role]), V_SNAPTORIGHT)
			--charpic
			v.draw(272, 80, v.getSprite2Patch(MM.duelplrs[2].skin, SPR2_XTRA), V_SNAPTORIGHT, v.getColormap(MM.duelplrs[2].skin, MM.duelplrs[2].skincolor))
			--win
			V_DrawStrASCIIcentered(v, (310 - coords.pong.x), 44, consoleplayer.mmlang, (MM.RoleColorHUD[MM.duelplrs[2].role]..MM.duelplrs[2].kills))
		end

		if (MM.devbuild)
			v.drawString(coords.debugHUD.x, coords.debugHUD.y, "\x87PONG",0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+8, "\x82".."Ball:\x80 "..MM.pong.ball.x.." "..MM.pong.ball.y,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+16, "\x82Velocity:\x80 "..MM.pong.velocity.x.." "..MM.pong.velocity.y,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+24, "\x82Hits:\x80 "..MM.pong.hits,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+32, "\x82Speed:\x80 "..MM.pong.speed,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+40, "\x82Winner:\x80 "..tostring(MM.pong.winner),0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+48, "\x82Wintimeout\x80 "..MM.pong.wintimeout,0,"thin")
			v.drawString(coords.debugHUD.x, coords.debugHUD.y+56, "\x82Leveltime\x80 "..leveltime,0,"thin")
		end
		return
	elseif (MM.minigame) and (not p.minigame)
		V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATE"]), 0, 32768)), 0, consoleplayer.mmlang, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
		V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["DUEL"], 0, 32768)), 4, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["DUEL"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
	end

	--
	-- SUSPECTS - TIME - RINGS
	--

	--precalculate the expected sizes of these elements to make the HUD look SonicCD-style
	--SUSPECTS/VICTIMS (replaces SCORES)
	local scorePatchName
	if ((p.role == ROLE_MURDERER) or (p.spectator)) scorePatchName = "BMP_VICTIMS"
	else scorePatchName = "BMP_SUSPECTS" end
	expectedHudInfoSize[1] = V_TextPatchWidth(MM.text[consoleplayer.mmlang][scorePatchName]) + 40
	--TIME
	expectedHudInfoSize[2] = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_TIME"]) + 64
	--RINGS
	expectedHudInfoSize[3] = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_RINGS"]) + 52

	--find the longest element
	maxHudIfnfoSize = expectedHudInfoSize[1]
	for element = 2, 3 do if (expectedHudInfoSize[element] > maxHudIfnfoSize) then maxHudIfnfoSize = expectedHudInfoSize[element] end end

	--now we can draw

	--SUSPECTS/VICTIMS
	V_DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, MM.text[consoleplayer.mmlang][scorePatchName], hudinfo[HUD_SCORE].f)
	local plrsAlive
	if (p.spectator) plrsAlive = PlayersAlive()
	else
		plrsAlive = PlayersAlive() - 1
		if (plrsAlive < 0) plrsAlive = 0 end
	end

	v.drawNum(((hudinfo[HUD_SCORE].x + maxHudIfnfoSize) - 16), hudinfo[HUD_SCORE].y, plrsAlive, hudinfo[HUD_SCORE].f)
	--if (plrsAlive < 10) v.draw((hudinfo[HUD_SCORE].x + scorePatchWidth), hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM"..plrsAlive), hudinfo[HUD_SCORE].f)
	--else
	--	v.draw((hudinfo[HUD_SCORE].x + scorePatchWidth), hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM"..(plrsAlive/10)), hudinfo[HUD_SCORE].f)
	--	v.draw((hudinfo[HUD_SCORE].x + scorePatchWidth + 8), hudinfo[HUD_SCORE].y, v.cachePatch("STTNUM"..(plrsAlive%10)), hudinfo[HUD_SCORE].f)
	--end

	--TIME
	if ((not G_TicsToMinutes(timeleft)) and (leveltime & 4))
		V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f)
	else V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, MM.text[consoleplayer.mmlang]["BMP_TIME"], hudinfo[HUD_TIME].f) end
	v.drawPaddedNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timeleft), 2, hudinfo[HUD_TIME].f) --seconds
	v.draw(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, v.cachePatch("STTCOLON"), hudinfo[HUD_TIME].f) --colon
	v.drawNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timeleft), hudinfo[HUD_TIME].f) --minutes
	/*
	--minutes
	if (G_TicsToMinutes(timeleft) > 9)
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 6), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft/10)), hudinfo[HUD_TIME].f) --first digit
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 14), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft%10)), hudinfo[HUD_TIME].f) --second digit
	else
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 14), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..G_TicsToMinutes(timeleft)), hudinfo[HUD_TIME].f)
	end
	--colon
	v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 22), hudinfo[HUD_TIME].y, v.cachePatch("STTCOLON"), hudinfo[HUD_TIME].f)
	--seconds
	if (G_TicsToSeconds(timeleft) > 9)
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 30), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)/10)), hudinfo[HUD_TIME].f) --first digit
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 38), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..(G_TicsToSeconds(timeleft)%10)), hudinfo[HUD_TIME].f) --second digit
	else
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 30), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM0"), hudinfo[HUD_TIME].f) --first digit is always 0
		v.draw((hudinfo[HUD_TIME].x + timePatchWidth + 38), hudinfo[HUD_TIME].y, v.cachePatch("STTNUM"..G_TicsToSeconds(timeleft)), hudinfo[HUD_TIME].f) --second digit
	end
	*/

	--RINGS
	if (not p.spectator)
		if (not p.rings) and (leveltime & 4) V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_RINGS"], 0x49, 0x25), hudinfo[HUD_RINGS].f)
		else V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, MM.text[consoleplayer.mmlang]["BMP_RINGS"], hudinfo[HUD_RINGS].f) end
		v.drawNum(((hudinfo[HUD_RINGS].x + maxHudIfnfoSize) - 16), hudinfo[HUD_RINGS].y, p.rings, hudinfo[HUD_RINGS].f)
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x*FU), (hudinfo[HUD_LIVES].y*FU), 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)

	--Show your role
	if ((p.role) and  (p.role > ROLE_NONE) and (not (p.roleflicker % 4)))
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), consoleplayer.mmlang, MM.RoleColorHUD[p.role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][p.role], hudinfo[HUD_LIVES].f)
	end

	if (p.spectator)
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), consoleplayer.mmlang, MM.RoleColorHUD[5]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][5], hudinfo[HUD_LIVES].f)
		for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_DEAD"]) do V_DrawStrASCIIcentered(v, 160, (112 + y*8), consoleplayer.mmlang, i) end
		if (p.role == nil)
			for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_MIDJOIN"]) V_DrawStrASCIIcentered(v, 160, (152 + y*4), consoleplayer.mmlang, i, 0, 32768) end --FU/2
		end
		if (p.killedby)
			if (p.killedby == "your stupidity") V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), consoleplayer.mmlang, "\5"..MM.text[consoleplayer.mmlang]["HUD_KILLBY"].."\0 "..MM.text[consoleplayer.mmlang]["HUD_STUPID"], V_SNAPTOTOP|V_SNAPTOLEFT)
			else V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y), consoleplayer.mmlang, "\5"..MM.text[consoleplayer.mmlang]["HUD_KILLBY"].."\0 "..p.killedby, hudinfo[HUD_RINGS].f) end
		end
		if ((not p.minigame) and (not MM.twopgame) and (not MM.minigame))
			V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["BORED"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["BORED"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
			V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], 0, 32768)), 4, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
			V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["START"], 0, 32768)), 8, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["START"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
		end
	end

	if (not p.spectator) and (MM.twopgame)
		local rival
		if (MM.duelplrs and MM.duelplrs[1] and MM.duelplrs[2])
			if ((MM.duelplrs[1].valid) and (MM.duelplrs[1] == p)) rival = MM.duelplrs[2]
			elseif (MM.duelplrs[2] == p) rival = MM.duelplrs[1] end
		end
		if ((rival) and (rival.valid))
			if ((not p.minigame) and (not rival.minigame))
				V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
				V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["REQUEST"], 0, 32768)), 4, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["REQUEST"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
			elseif ((p.minigame) and (not rival.minigame))
				V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["WAIT"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["WAIT"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
				if (not p.minigametimeout)
					V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["CANCEL"]), 0, 32768)), 4, consoleplayer.mmlang, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["CANCEL"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
				end
			elseif ((not p.minigame) and (rival.minigame) and (leveltime & 1))
				V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
				V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["ACCEPT"], 0, 32768)), 4, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["ACCEPT"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
			end
		end
	end

	--I fucking recreated the whole vanilla ring weapons dock to slightly move it somewhere else :skull:
	if ((p.role == ROLE_MURDERER) or (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO))
		local ringTrans={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --grenade
			0, --explosion
			0, --rail
			0  --red/infinity
		}
		--translucency for the red ring icon
		if ((p.powers[pw_infinityring] == 0) and (p.rings == 0)) ringTrans[7] = 458752 --70% translucent
		else ringTrans[7] = 0 end
		--translucency for other weapons
		for weapon = 1,6
			if ((p.powers[weapon + 14]) and (not (p.ringweapons & wep2rw(weapon))) or ((not p.powers[weapon + 14]) and (p.ringweapons & wep2rw(weapon)))) ringTrans[weapon] = 458752 --70% transluent
			else ringTrans[weapon] = 0 end
		end

		--Ring weapons
		if (p.role == ROLE_MURDERER)
			--draw the only icon for Murderer
			if (p.powers[pw_infinityring])
				v.draw(coords.firstRingWepMurd.x, (coords.firstRingWep.y), v.cachePatch(MM.weapons[0][1]), V_SNAPTOBOTTOM) --Infinite Ring icon
				v.drawString(160, (coords.firstRingWep.y+8), p.powers[pw_infinityring], ringTrans[7]|V_SNAPTOBOTTOM, "thin-center") --Infinite Ring ammo counter
			else v.draw(coords.firstRingWepMurd.x, (coords.firstRingWep.y), v.cachePatch(MM.weapons[-1][1]), ringTrans[7]|V_SNAPTOBOTTOM) end --Red Ring icon
			v.draw((coords.firstRingWepMurd.x - 2), (coords.firstRingWep.y - (p.mmweapondelay >> 1) - 2), v.cachePatch("CURWEAP"), V_SNAPTOBOTTOM) --selector
		elseif (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO)
			if (p.powers[pw_infinityring])
				v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch(MM.weapons[0][1]), V_SNAPTOBOTTOM) --Infinite Ring icon
				v.drawString((coords.firstRingWep.x + 1), (coords.firstRingWep.y + 8), p.powers[pw_infinityring], ringTrans[7]|V_SNAPTOBOTTOM, "thin") --Infinite Ring ammo counter
			else v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch(MM.weapons[-1][1]), ringTrans[7]|V_SNAPTOBOTTOM) end --Red Ring icon
			for weapon = 1,6
				if (p.ringweapons&wep2rw(weapon)) or (p.powers[weapon+14])
					v.draw((coords.firstRingWep.x + weapon*20), (coords.firstRingWep.y), v.cachePatch(MM.weapons[weapon][1]), ringTrans[weapon]|V_SNAPTOBOTTOM) --Ring weapon icon
					if (p.powers[weapon + 14]) v.drawString((coords.firstRingWep.x + 1 + weapon*20), (coords.firstRingWep.y + 8), p.powers[weapon + 14], ringTrans[weapon]|V_SNAPTOBOTTOM, "thin") end --Ammo counter
				end
			end
			if ((p.ammoremovaltimer) and (leveltime & 1)) v.drawString((coords.firstRingWep.x + 1 + p.ammoremovalweapon*20), (coords.firstRingWep.y + 2), "\x85-"..p.ammoremoval, V_SNAPTOBOTTOM, "thin") end --Ammo removal penalty
			v.draw((coords.firstRingWep.x - 2 + p.currentweapon*20), (coords.firstRingWep.y - (p.mmweapondelay>>2) - 2), v.cachePatch("CURWEAP"), V_SNAPTOBOTTOM) --selector
		end
	elseif ((p.role == ROLE_INNOCENT) and (#MM.shremls) and (p.shreml_dist)) --innocents have Sheriff Emerald radar instead of weapon dock
		v.drawScaled(10027008, 10223616, 32768, v.cachePatch("IDEYAR"..V_GetSHREMLiconID(fixint(p.shreml_dist))), V_SNAPTOBOTTOM) --153*FU, 156*FU, FU/2
	end

	--Are you alone?
	if (PlayerCount() == 1)
		--Draw the text
		for y,i in pairs(MM.text[consoleplayer.mmlang]["HUD_ALONE"]) do V_DrawStrASCIIcentered(v, 160, (128 + y*8), consoleplayer.mmlang, i) end
	end

	--suggest a minigame
	if ((PlayerCount() == 1) or (p.spectator) and (not MM.minigame) and (not p.minigame))
		V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["BORED"], 0, 32768)), 0, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["BORED"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
		V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], 0, 32768)), 4, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
		V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["START"], 0, 32768)), 8, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["START"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
	end

	--"Showdown duel!"
	if (PlayerCount(ROLE_MURDERER) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO)) and (not PlayerCount(ROLE_INNOCENT)))
		V_DrawStrASCIIcentered(v, 160, 192, consoleplayer.mmlang, "\8"..MM.text[consoleplayer.mmlang]["HUD_SHOWDOWN"])
	end

	--ABILITIES.LUA part
	if (CV_FindVar("mmsprint").value) v.drawString(hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 32), "\x82Sprint (hold):\x80 CUSTOM1", V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	elseif (p.sneak) V_DrawStrASCII(v, hudinfo[HUD_RINGS].x, (hudinfo[HUD_RINGS].y + 24), consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_SNEAKING"], V_SNAPTOTOP|V_SNAPTOLEFT, 32768) end --FU/2

	--red Flash effect when you die
	if (p.flashscrn) v.drawStretched(0,0, (v.width()*FU), (v.height()*FU), v.cachePatch("PIXEL_5"), ((p.flashscrn - 1)*FU)|V_SNAPTOTOP|V_SNAPTOLEFT) end

	--Debug
	if MM.devbuild
		v.drawString(coords.debugHUD.x, coords.debugHUD.y, "\x87".."SRB2 MM "..MM.version.." DEBUG",0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+8, "\x81 "..p.realmo.x.." "..p.realmo.y.." "..p.realmo.z.." \x80("..fixint(p.realmo.x).." "..fixint(p.realmo.y).." "..fixint(p.realmo.z)..")",0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+16, "\x82".."LEVELTIME: \x80"..leveltime,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+24, "\x82".."AFK: \x80"..p.afk,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+32, "\x82".."MMLANG: \x80"..p.mmlang,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+40, "\x82".."KILLS: \x80"..p.kills,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+48, "\x82".."CHATDELAY: \x80"..p.chatdelay,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+56, "\x82".."TWOPGAME: \x80"..tostring(MM.twopgame),0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+64, "\x82".."ROLEFLICKER: \x80"..p.roleflicker,0,"thin")
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+72, "\x82".."SHREML_DIST: \x81"..tostring(p.shreml_dist),0,"thin")
	end
end

local function scoresHUD(v) --SCORES TAB
	if (gametype != GT_MURDERMYSTERY)
		hud.enable("rankings")
		return
	end
	hud.disable("rankings")
	v.drawString(160, 0, "WORK IN PROGRESS GAMETYPE, VERSION "..MM.version, V_SNAPTOTOP, "center")

	--Text
	V_DrawStrASCIIcentered(v, 160, 12, consoleplayer.mmlang, "\1"..MM.text[consoleplayer.mmlang]["MM"])
	for y,i in ipairs(MM.text[consoleplayer.mmlang]["HUD_SCORESTAB"])
		V_DrawStrASCII(v, 16, (16 + y*8), consoleplayer.mmlang, i)
	end

	--Teammates tracker
	--let's first understand do we have teammates at all
	local doIhaveTeam = 0
	if (consoleplayer.role == ROLE_MURDERER) doIhaveTeam = PlayerCount(ROLE_MURDERER) - 1 
	elseif (consoleplayer.role == ROLE_SHERIFF) doIhaveTeam = (PlayerCount(ROLE_SHERIFF) - 1) + PlayerCount(ROLE_HERO)
	elseif (consoleplayer.role == ROLE_HERO) doIhaveTeam = PlayerCount(ROLE_SHERIFF) + (PlayerCount(ROLE_HERO) - 1) end

	--now we can finally show the team list
	if (doIhaveTeam)
		local teammateNo = 0
		V_DrawStrASCII(v, coords.teammateInfo.x, (coords.teammateInfo.y - 12), consoleplayer.mmlang, MM.RoleColorHUD[consoleplayer.role]..MM.text[consoleplayer.mmlang]["HUD_TEAMMATES"]..":")
		for p in players.iterate
			if (consoleplayer == p) continue end
			if (((consoleplayer.role == ROLE_MURDERER) and (p.role == ROLE_MURDERER)) or (((consoleplayer.role == ROLE_SHERIFF) or (consoleplayer.role == ROLE_HERO)) and ((p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO))))
				--character icon
				v.drawScaled(coords.teammateInfo.x*FU, (coords.teammateInfo.y + (16*teammateNo))*FU, 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), 0, v.getColormap(p.skin, p.skincolor)) --FU/2
				--player name (colored as role)
				v.drawString((coords.teammateInfo.x + 18), (coords.teammateInfo.y + (16*teammateNo)), MM.RoleColor[p.role]..p.name, V_ALLOWLOWERCASE)
				--icon of the currently held weapon
				v.drawScaled((coords.teammateInfo.x + coords.teammateInfoOffset1.x)*FU, (coords.teammateInfo.y + 8 + (16*teammateNo))*FU, 32768, v.cachePatch(MM.weapons[p.currentweapon][1])) --FU/2
				--amount of currently held weapon ammo
				v.drawString((coords.teammateInfo.x + coords.teammateInfoOffset1.x + 18), (coords.teammateInfo.y + 8 + (16*teammateNo)), p.powers[pw_infinityring + p.currentweapon], 0, "thin")
				--red ring icon
				v.drawScaled((coords.teammateInfo.x + coords.teammateInfoOffset1.x + coords.teammateInfoOffset2.x)*FU, (coords.teammateInfo.y + 8 + (16*teammateNo))*FU, 32768, v.cachePatch(MM.weapons[-1][1])) --FU/2
				--amount of [red] rings
				v.drawString((coords.teammateInfo.x + coords.teammateInfoOffset1.x + coords.teammateInfoOffset2.x + 18), (coords.teammateInfo.y + 8 + (16*teammateNo)), p.rings, 0, "thin")
				teammateNo = $ + 1
			end
		end
	end

	v.drawFill(0, 172, 320, 2, 0) --horizontal line

	--Roles counter
	--Murderer
	V_DrawStrASCII(v, 20, 176, consoleplayer.mmlang, MM.RoleColorHUD[1]..MM.text[consoleplayer.mmlang]["HUD_ROLESALIVE"][1]..": "..PlayerCount(ROLE_MURDERER))
	--Sheriff (and Hero)
	if (PlayerCount(ROLE_HERO)) V_DrawStrASCII(v, 20, 184, consoleplayer.mmlang, (MM.RoleColorHUD[2]..MM.text[consoleplayer.mmlang]["HUD_ROLESALIVE"][2]..": "..PlayerCount(ROLE_SHERIFF)..MM.RoleColorHUD[4].." + "..PlayerCount(ROLE_HERO)))
	else V_DrawStrASCII(v, 20, 184, consoleplayer.mmlang, (MM.RoleColorHUD[2]..MM.text[consoleplayer.mmlang]["HUD_ROLESALIVE"][2]..": "..PlayerCount(ROLE_SHERIFF))) end
	--Innocent
	if (PlayerCount(ROLE_INNOCENT)) V_DrawStrASCII(v, 20, 192, consoleplayer.mmlang, (MM.RoleColorHUD[3]..MM.text[consoleplayer.mmlang]["HUD_ROLESALIVE"][3]..": "..PlayerCount(ROLE_INNOCENT))) end
	--Online
	v.drawString(160, 176, "ONLINE: "..PlayerCount())
	--"Sheriff's Emerald is available!"
	if ((#MM.shremls) and (leveltime & 1)) v.drawScaled(524280, 12058440, 32768, v.cachePatch("CHAOS3")) end --8*FU, 184*FU, FU/2

	if (MM.devbuild) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end

local function interHUD(v) --Custom intermission HUD
	if (gametype!=GT_MURDERMYSTERY)
		hud.enable("intermissiontally")
		return
	end
	hud.disable("intermissiontally")
	
	--here starts the insanity
	local plrs = {}
	local multiply = {x=0, y=0}
	
	V_DrawStrASCIIcentered(v,160, 4, consoleplayer.mmlang, "\7"..MM.text[consoleplayer.mmlang]["MM"])
	if (mapheaderinfo[gamemap].actnum == 0) v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *", 0, "center")
	else v.drawString(160, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *", 0, "center") end
	v.drawFill(0, 40, 320, 2, 0) --horizontal line
	for p in players.iterate do table.insert(plrs,p) end

	-- Column names

	--vertical line and everything common for >8 player screen
	if (PlayerCount() > 8)
		v.drawFill(160, 40, 2, 144, 0)
		v.drawString(coords.kills2.x, coords.first.y, "\x82KILLS",0,"thin")
		v.drawString((coords.kills2.x + 160), coords.first.y, "\x82KILLS",0,"thin")
	end
	--everything else which is uncommon
	if (PlayerCount() <= 8)
		v.drawString(coords.num.x, coords.first.y,"\x82#")
		v.drawString(coords.name.x, coords.first.y,"\x82NAME")
		v.drawString(coords.kills.x, coords.first.y,"\x82KILLS")
	elseif (PlayerCount() > 8) and (PlayerCount() <= 16)
		--players 1-8
		v.drawString(coords.num2.x, coords.first.y, "\x82#",0,"thin")
		v.drawString(coords.name2.x, coords.first.y, "\x82NAME",0,"thin")
		--players 9-16
		v.drawString((coords.num2.x + 160), coords.first.y, "\x82#",0,"thin")
		v.drawString((coords.name2.x + 160), coords.first.y, "\x82NAME",0,"thin")
	else
		--players 1-16
		v.drawString(coords.num3.x, coords.first.y, "\x82#",0,"thin")
		v.drawString(coords.name3.x, coords.first.y, "\x82NAME",0,"thin")
		--players 17-32
		v.drawString((coords.num3.x + 160), coords.first.y, "\x82#",0,"thin")
		v.drawString((coords.name3.x + 160), coords.first.y, "\x82NAME",0,"thin")
	end

	-- Player stats

	for i = 1, #plrs
		if (PlayerCount() <= 8) --Regular mode
			--Player number
			v.drawString((coords.num.x), (coords.first.y + i*16), i)
			--Character icon
			v.drawScaled((coords.name.x - 20)*FU, (((coords.first.y - 4) + i*16)*FU), 32768, v.getSprite2Patch(plrs[i].skin,SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1) and (not plrs[i].spectator))
				v.drawString((coords.name.x), (coords.first.y + i*16), MM.RoleColor[plrs[i].role]..plrs[i].name, V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((coords.name.x), (coords.first.y + i*16), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((coords.kills.x), (coords.first.y + i*16), plrs[i].kills)
		elseif ((PlayerCount() > 8) and (PlayerCount() <= 16)) --"Double column" mode
			if (i > 8) --players 9-16 are drawn on the second column
				multiply.x = 160
				multiply.y = -128
			end
			--Player number
			v.drawString((coords.num2.x + multiply.x), (coords.first.y + i*16 + multiply.y), i)
			--Character icon
			v.drawScaled((coords.name2.x + multiply.x - 20)*FU, ((coords.first.y - 4) + i*16 + multiply.y)*FU, 32768, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/2
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1) and (not plrs[i].spectator))
				v.drawString((coords.name2.x + multiply.x), (coords.first.y + i*16 + multiply.y), MM.RoleColor[plrs[i].role]..string.sub(plrs[i].name, 1, 11), V_ALLOWLOWERCASE)
			else
				--DEAD
				v.drawString((coords.name2.x + multiply.x), (coords.first.y + i*16 + multiply.y), MM.RoleColor[5]..string.sub(plrs[i].name, 1, 11), V_ALLOWLOWERCASE)
			end
			--Kills counter
			v.drawString((coords.kills2.x + multiply.x), (coords.first.y + i*16 + multiply.y), plrs[i].kills)
		elseif (PlayerCount() > 16) --"Double column compact" mode
			if (i > 16) --players 17-32 are drawn on the second column
				multiply.x = 160
				multiply.y = -128
			end
			--back to the rows
			--Player number
			v.drawString((coords.num3.x + multiply.x), (coords.first2.y + i*8 + multiply.y), i, 0, "thin")
			--Character icon
			v.drawScaled((coords.name3.x + multiply.x - 10)*FU, ((coords.first2.y - 1) + i*8 + multiply.y)*FU, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			--Player name (colored by role)
			if ((plrs[i].role) and (plrs[i].role >= 1) and (not plrs[i].spectator))
				v.drawString((coords.name3.x + multiply.x), (coords.first2.y + i*8 + multiply.y), MM.RoleColor[plrs[i].role]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			else
				--DEAD
				v.drawString((coords.name3.x + multiply.x), (coords.first2.y + i*8 + multiply.y), MM.RoleColor[5]..plrs[i].name, V_ALLOWLOWERCASE, "thin")
			end
			--Kills counter
			v.drawString((coords.kills2.x + multiply.x), (coords.first2.y + i*8 + multiply.y), plrs[i].kills, 0, "thin")
		end
	end

	-- Winner text

	if (MM.winner == 0) V_DrawStrASCIIcentered(v, 160, 176, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_WIN"][1]) --tie
	else V_DrawStrASCIIcentered(v, 160, 176, consoleplayer.mmlang, MM.text[consoleplayer.mmlang]["HUD_WINNERS"].." "..MM.text[consoleplayer.mmlang]["HUD_WIN"][MM.winner + 1]) end

	-- Prerelease/Debug

	v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	if (MM.devbuild) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
	--THANK GOD IT ENDED
end

hud.add(mainHUD, "game")
hud.add(scoresHUD, "scores")
hud.add(interHUD, "intermission")