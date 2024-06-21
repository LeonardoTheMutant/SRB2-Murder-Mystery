-- HUD_MINIGAMES.LUA
-- Code by LeonardoTheMutant
--
-- Dedicated HUD renderer for Minigames

local coords = {
    pong = {x=80, y=60}, --offset coordinates from screen's (0,0)
    sonicRun = {x=60, y=60} --offset coordinates from screen's (0,0)
}

local function V_DrawMinigameTime(v)
    --label size and X position
	local timeLabelWidth
	if (MM.text[consoleplayer.mmlang]["BMP_TIME"]) and (not splitscreen)
		timeLabelWidth = V_TextPatchWidth(MM.text[consoleplayer.mmlang]["BMP_TIME"]) + 64
	else
		timeLabelWidth = 96
	end
	local timeLabelX = (169 - (timeLabelWidth >> 1)) --[value]/2

    --timer calculation
	local timertime
	if (timelimit)
		timertime = (MM.timelimit * 2100) - leveltime
	else
		timertime = leveltime
	end

	--"TIME" text
	if (MM.text[consoleplayer.mmlang]["BMP_TIME"]) and (not splitscreen)
		local xoff = V_GetTextPatchOffsetX(consoleplayer.mmlang, "BMP_TIME")
		local yoff = V_GetTextPatchOffsetY(consoleplayer.mmlang, "BMP_TIME")
		--Draw the Text Label
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4))
			--Swap the colors in the label for flashing effect
			--0x49 in SRB2's palette is Yellow, 0x25 is Red
			V_DrawTextPatch(v, timeLabelX, hudinfo[HUD_TIME].y, xoff, yoff, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f)
		else
			V_DrawTextPatch(v, timeLabelX, hudinfo[HUD_TIME].y, xoff, yoff, MM.text[consoleplayer.mmlang]["BMP_TIME"], hudinfo[HUD_TIME].f)
		end
	else --in case Text Patch was not found or the game is splitscreen (V_DrawTextPatch() does not support per-player rendering)
		if (timelimit and (not G_TicsToMinutes(timertime)) and (leveltime & 4))
			v.draw(timeLabelX, hudinfo[HUD_TIME].y, v.cachePatch("STTRTIME"), hudinfo[HUD_TIME].f)
		else
			v.draw(timeLabelX, hudinfo[HUD_TIME].y, v.cachePatch("STTTIME"), hudinfo[HUD_TIME].f)
		end
	end

	--Numbers
	v.drawPaddedNum((timeLabelX + timeLabelWidth - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timertime), 2, V_SNAPTOTOP) --seconds
	v.draw((timeLabelX + timeLabelWidth - 40), hudinfo[HUD_TIME].y, v.cachePatch("STTCOLON"), V_SNAPTOTOP) --colon
	v.drawNum((timeLabelX + timeLabelWidth - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timertime), V_SNAPTOTOP) --minutess
end

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

	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	local charset = MM.text[consoleplayer.mmlang]["CHARSET"] or "STCFN"

    --
	-- SONIC RUN minigame renderer
	--
    if ((p.minigame) and ((p.spectator) or (PlayerCount() == 1)) and (not (MM.minigame and MM.twopgame)))
		--CUSTOM3 related text
		if (not p.minigametimeout)
			V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 0, charset, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
		end

		--TIME
		V_DrawMinigameTime(v)

		--white screen background
		v.drawFill(coords.sonicRun.x, coords.sonicRun.y, 200, 80, 0)

		--Sonic
		local sonicSprite
		if (p.SonicRun.state == 0)
			sonicSprite = "SNC_STND"
		elseif (p.SonicRun.state == 1)
			if (leveltime & 1) then sonicSprite = "SNC_RUN1"
			else sonicSprite = "SNC_RUN2" end
		elseif (p.SonicRun.state == 2)
			if (leveltime % 4 == 0) or (leveltime % 4 == 2) then sonicSprite = "SNC_SPN1"
			elseif (leveltime % 4 == 1) then sonicSprite = "SNC_SPN2"
			elseif (leveltime % 4 == 3) then sonicSprite = "SNC_SPN3" end
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
				if (secondsLeft <= 2)
					countdownPatch = "RACE"..secondsLeft
				end
				v.draw(152, 100, v.cachePatch(countdownPatch))
			elseif
				v.draw(142, 100, v.cachePatch("RACEGO"))
			end
		end

		--score
		local scoreWidth = v.stringWidth(p.SonicRun.score)
		v.drawString((coords.sonicRun.x + 200 - scoreWidth), (coords.sonicRun.y - 12), p.SonicRun.score, V_BLUEMAP)

		if (not p.SonicRun.active)
			v.drawString(160, (coords.sonicRun.y + 44), "GAME OVER", V_INVERTMAP, "center")
		end

		v.drawString(160, (coords.sonicRun.y + 84), "Controls: \x87JUMP\x80 & \x87SPIN\x80", 0, "center")

		--player side information
		--character icon
		v.drawScaled((hudinfo[HUD_LIVES].x*FU), (hudinfo[HUD_LIVES].y*FU), 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
		--name
		v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)
		--role
		if (p.role)
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), charset, MM.RoleColorHUD[p.role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][p.role], hudinfo[HUD_LIVES].f)
		elseif (p.spectator)
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), charset, MM.RoleColorHUD[5]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][5], hudinfo[HUD_LIVES].f)
		end

		--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
		if (p.timetravel and p.timetravel.timezone)
			if (p.timetravel.timezone == 1) --Past
				V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), charset, "\6"..MM.text[consoleplayer.mmlang]["HUD_PAST"], hudinfo[HUD_LIVES].f|V_PERPLAYER)
			elseif (p.timetravel.timezone > 2) --One of the Futures
				V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), charset, "\6"..MM.text[consoleplayer.mmlang]["HUD_FUTURE"], hudinfo[HUD_LIVES].f|V_PERPLAYER)
			end
		end

		if (MM.devbuild)
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y, "\x87SONIC RUN",0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+8, "\x82State:\x80 "..p.SonicRun.state,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+16, "\x82Y:\x80 "..p.SonicRun.Y,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+24, "\x82Height:\x80 "..p.SonicRun.Height,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+32, "\x82Velocity:\x80 "..p.SonicRun.velocity,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+40, "\x82Ttimeout\x80 "..p.SonicRun.timeout,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+48, "\x82Leveltime\x80 "..leveltime,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+56, "\x82#Hazards:\x80 "..#p.SonicRun.hazards,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+64, "\x82Hazards timeout:\x80 "..p.SonicRun.hazardsTimeout,0,"thin")
		end

    --
    -- PONG minigame
    --
    elseif (MM.minigame) and (p.minigame)
		if (not MM.duelplrs[1].valid) or (not MM.duelplrs[2].valid) return end
		--CUSTOM3 related text and show yourself
		if (p == MM.duelplrs[1]) or (p == MM.duelplrs[2])
			if (not p.minigametimeout) then
				V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 0, charset, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
			end
			if (not splitscreen)
				if (p == MM.duelplrs[1])
					V_DrawStrASCIIcentered(v, 32, 48, charset, "\2"..MM.text[consoleplayer.mmlang]["HUD_YOU"], V_SNAPTOLEFT)
				elseif (p == MM.duelplrs[2])
					V_DrawStrASCIIcentered(v, 288, 48, charset, "\2"..MM.text[consoleplayer.mmlang]["HUD_YOU"], V_SNAPTORIGHT)
				end
			end
		else
			V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATING"], 0, 32768)), 0, charset, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATING"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768)
			if (not p.minigametimeout) then
				V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), 0, 32768)), 4, charset, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["LEAVE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768)
			end
			V_DrawStrASCIIcentered(v, 160, 152, charset, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PONGBALL"]) --spectator ball text
		end

		--TIME
		V_DrawMinigameTime(v)

		--draw board
		v.drawFill((coords.pong.x - 2), (coords.pong.y - 2), 164, 84, 0) --white outline
		v.drawFill(coords.pong.x, coords.pong.y, 160, 80, 31) --black background
		--draw player paddles
		v.drawFill((coords.pong.x + 8), (coords.pong.y + MM.pong.pads[1]), 2, 16, MM.pong.padcolor[MM.duelplrs[1].role])
		v.drawFill((310 - coords.pong.x), (coords.pong.y + MM.pong.pads[2]), 2, 16, MM.pong.padcolor[MM.duelplrs[2].role])
		--draw ball
		if (MM.pong.wintimeout & 1)
			v.drawFill((coords.pong.x + MM.pong.ball.x), (coords.pong.y + MM.pong.ball.y), 2, 2, 72)
		end
		--winner text
		if (MM.pong.winner != nil)
			if (not MM.pong.winner)
				V_DrawStrASCIIcentered(v, 160, 160, charset, MM.text[consoleplayer.mmlang]["HUD_WIN"][1])
			else
				V_DrawStrASCIIcentered(v, 160, 160, charset, MM.RoleColorHUD[MM.duelplrs[MM.pong.winner].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[MM.pong.winner].role].."\0 "..MM.text[consoleplayer.mmlang]["HUD_WON"])
			end
		end
		--player 1 side information
		if (MM.duelplrs[1].valid)
			--player name
			v.drawString(16, 176, MM.duelplrs[1].name, V_ALLOWLOWERCASE|V_SNAPTOLEFT)
			--role
			V_DrawStrASCII(v, 16, 184, charset, (MM.RoleColorHUD[MM.duelplrs[1].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[1].role]), V_SNAPTOLEFT)
			--character picture
			v.draw(48, 80, v.getSprite2Patch(MM.duelplrs[1].skin, SPR2_XTRA), V_ALLOWLOWERCASE|V_SNAPTOLEFT, v.getColormap(MM.duelplrs[1].skin, MM.duelplrs[1].skincolor)) --draw character icon flipped horizontaly
			--win count
			V_DrawStrASCIIcentered(v, (coords.pong.x + 10), 44, charset, (MM.RoleColorHUD[MM.duelplrs[1].role]..MM.duelplrs[1].kills))
		end
		--player 2 side information
		if (MM.duelplrs[2].valid)
			--name
			v.drawString((304 - v.stringWidth(MM.duelplrs[2].name)), 176, MM.duelplrs[2].name, V_ALLOWLOWERCASE|V_SNAPTORIGHT)
			--role
			V_DrawStrASCII(v, (304 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[2].role])), 184, charset, (MM.RoleColorHUD[MM.duelplrs[2].role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][MM.duelplrs[2].role]), V_SNAPTORIGHT)
			--charpic
			v.draw(272, 80, v.getSprite2Patch(MM.duelplrs[2].skin, SPR2_XTRA), V_SNAPTORIGHT, v.getColormap(MM.duelplrs[2].skin, MM.duelplrs[2].skincolor))
			--win
			V_DrawStrASCIIcentered(v, (310 - coords.pong.x), 44, charset, (MM.RoleColorHUD[MM.duelplrs[2].role]..MM.duelplrs[2].kills))
		end

		if (MM.devbuild)
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y, "\x87PONG",0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+8, "\x82".."Ball:\x80 "..MM.pong.ball.x.." "..MM.pong.ball.y,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+16, "\x82Velocity:\x80 "..MM.pong.velocity.x.." "..MM.pong.velocity.y,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+24, "\x82Hits:\x80 "..MM.pong.hits,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+32, "\x82Speed:\x80 "..MM.pong.speed,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+40, "\x82Winner:\x80 "..tostring(MM.pong.winner),0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+48, "\x82Wintimeout\x80 "..MM.pong.wintimeout,0,"thin")
			v.drawString(MM.hud.game.pos.debug.x, MM.hud.game.pos.debug.y+56, "\x82Leveltime\x80 "..leveltime,0,"thin")
		end
    elseif (MM.minigame) and (not p.minigame)
        --Draw the invitation/suggestion text
        V_DrawStrASCII(v, (320 - V_StrWidthASCII((MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATE"]), 0, 32768)), 0, charset, (MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["PRESS"].." "..MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["SPECTATE"]), V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
        V_DrawStrASCII(v, (320 - V_StrWidthASCII(MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["DUEL"], 0, 32768)), 4, charset, MM.text[consoleplayer.mmlang]["HUD_MINIGAME"]["DUEL"], V_SNAPTOTOP|V_SNAPTORIGHT, 32768) --FU/2
	end
end, "game")