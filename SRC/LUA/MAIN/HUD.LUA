-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this
--
-- Note: Some Video Flags are represented directly as intergers
-- for example V_ALLOWLOWERCASE = 8388608

-- Constants
local coords={ --HUD screen coordinates
	first = {y=32}, --this and everything below for custom intermission
	num = {x=16},
	name = {x=48},
	kills = {x=192},
	role = {x=248},
	first2 = {y=40},
	num2 = {x=4},
	name2 = {x=24},
	kills2 = {x=108},
	role2 = {x=134},
	firstRingWep = { --for weapon icons
		x=92, y=156
	},debugHUD = {
		x=8, y=48
	},pong = { --offset cordinates from screen's (0,0)
		x=80, y=50
	}
}

local firstRingWepX = 152

local infoSCORE=hudinfo[HUD_SCORE]
local infoTIME=hudinfo[HUD_TIME]
local infoRINGS=hudinfo[HUD_RINGS]

local mmtxt=MM.text

-- Hook Functions

local function mainHUD(v, p) --main game HUD
	if gametype!=GT_MURDERMYSTERY --in case if switched from MM to other gametype
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

	--MMHELP UI renderer
	--unfinished (too hard coding challenge for me)
	/*
	if (p.mmhelp) and (p.mmhelp.active)
		if (MM.text[p.mmlang]["MMHELP"][p.mmhelp.page]) --page exists?
			--init everything
			local cx = 0
			local cy = 0
			local scrnColumns = ((v.width()/v.dupx())>>3) - 2
			local scrnRows = ((v.height()/v.dupy())>>3) - 2
			local chr, strchar, stringToRender
			local pagelen = 0
			local sublines = {}
			local charset = MM.text[p.mmlang]["CHARSET"] or "STCFN"
			local color=v.getStringColormap(0) --default to white color

			v.drawString(0, 192, (p.mmhelp.pos + scrnRows) - V_GetHelpPageSize(p.mmlang, p.mmhelp.page, scrnColumns))

			--print("scrnColumns: "..scrnColumns)
			--print("scrnRows: "..scrnRows)

			--read line-by-line from the database
			for i, line in pairs(MM.text[p.mmlang]["MMHELP"][p.mmhelp.page]) do
				--if string is too long to fit entirely in one line we have to divide it
				sublines = WordWrapString(MM.text[p.mmlang]["MMHELP"][p.mmhelp.page][i + p.mmhelp.pos], scrnColumns)
				pagelen = $ + #WordWrapString(MM.text[p.mmlang]["MMHELP"][p.mmhelp.page][i + p.mmhelp.pos], scrnColumns)

        		for sublineID = 1, #sublines do
					--draw character-by-character
					stringToRender = sublines[sublineID]
					for charID=1, stringToRender:len() do
						chr = string.byte(stringToRender:sub(charID, charID)) --numeric value of the single character

						if (chr<100) strchar="0"..chr --make the number to be 3 digit
						else strchar=chr end

						--characters from 0x00 to 0x0f set the color
						if (chr<16) color=v.getStringColormap(chr*4096) end

						--print the character
						if (chr>=128) --extended ASCII
							if (v.patchExists(charset..strchar))
								v.draw(cx*8, cy*8, v.cachePatch(charset..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
							else --unknown symbol, print "?"
								v.draw(cx*8, cy*8, v.cachePatch("STCFN063"), V_SNAPTOTOP|V_SNAPTOLEFT, color)
							end
						elseif (chr>=16) and (chr<128) --standart ASCII
							if (v.patchExists("STCFN"..strchar))
								v.draw(cx*8, cy*8, v.cachePatch("STCFN"..strchar), V_SNAPTOTOP|V_SNAPTOLEFT, color)
							else --unknown symbol, print "?" unless it's a space symbol
								if (chr!=32) v.draw(cx*8, cy*8, v.cachePatch("STCFN063"), V_SNAPTOTOP|V_SNAPTOLEFT, color) end
							end 
						end

						--position shifting for the next character
						if (chr>16) cx = $ + 1 end --make place for the next non-color character
					end
					--subline ended, prepare everything for the next one
					cx = 0
					cy = $ + 1
					if (cy >= scrnRows) break end --end text rendering if the buffer is full
				end

				--line ended, prepare everything for the next one
				cx = 0
				cy = $ + 1
				color = v.getColormap(0)
				if (cy >= scrnRows) break end --end text rendering if the buffer is full
			end
			v.drawString(32, 192, pagelen)
		else --page does not exist
			V_DrawStrASCII(v, cx, cy, "EN", "Failed to load page "..p.mmhelp.page)
			V_DrawStrASCII(v, cx, cy + 8, "EN", "Press \7SPIN\0 to leave HELP")
		end
		return
	end
	*/

	--TicTacToe minigame renderer
	if (MM.minigame) and (p.minigame)
		if (not MM.duelplrs[1].valid) or (not MM.duelplrs[2].valid) return end
		--CUSTOM3 related text and show yourself
		if (p==MM.duelplrs[1]) or (p==MM.duelplrs[2])
			if (not p.minigametimeout) V_DrawStrRight(v, 0, "Press\x82 CUSTOM3\x80 to leave", V_SNAPTOTOP|V_SNAPTORIGHT, "thin") end
			if (p==MM.duelplrs[1]) V_DrawStrASCIIcentered(v, 32, 48, p.mmlang, "\2"..mmtxt[p.mmlang]["YOU_HUD"], V_SNAPTOLEFT)
			elseif (p==MM.duelplrs[2]) V_DrawStrASCIIcentered(v, 288, 48, p.mmlang, "\2"..mmtxt[p.mmlang]["YOU_HUD"], V_SNAPTORIGHT) end
		else
			V_DrawStrRight(v, 0, "Spectating a duel...", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
			if (not p.minigametimeout) V_DrawStrRight(v, 8, "Press\x82 CUSTOM3\x80 to leave", V_SNAPTOTOP|V_SNAPTORIGHT, "thin") end
		end
		--draw board
		v.drawFill((coords.pong.x - 2), (coords.pong.y - 2), 164, 104, 0) --white outline
		v.drawFill(coords.pong.x, coords.pong.y, 160, 100, 31) --black background
		--draw player paddles
		v.drawFill((coords.pong.x + 8), (coords.pong.y + MM.pong.pads[1]), 2, 16, MM.pong.padcolor[MM.duelplrs[1].role])
		v.drawFill((310 - coords.pong.x), (coords.pong.y + MM.pong.pads[2]), 2, 16, MM.pong.padcolor[MM.duelplrs[2].role])
		--draw ball
		if (MM.pong.wintimeout & 1) v.drawFill((coords.pong.x + MM.pong.ball.x), (coords.pong.y + MM.pong.ball.y), 2, 2, 72) end
		--winner text
		if (MM.pong.winner != nil)
			if (MM.pong.winner == 0) V_DrawStrASCIIcentered(v, 160, 160, p.mmlang, mmtxt[p.mmlang]["WIN_HUD"][1])
			else V_DrawStrASCIIcentered(v, 160, 160, p.mmlang, MM.RoleColor[MM.duelplrs[MM.pong.winner].role]..mmtxt[p.mmlang]["ROLES_HUD"][MM.duelplrs[MM.pong.winner].role].."\0 "..mmtxt[p.mmlang]["WON_HUD"]) end
		end
		--player 1 side information
		if (MM.duelplrs[1].valid)
			v.drawString(16, 176, MM.duelplrs[1].name, 8388608|V_SNAPTOLEFT)
			V_DrawStrASCII(v, 16, 184, p.mmlang, MM.RoleColor[MM.duelplrs[1].role]..mmtxt[p.mmlang]["ROLES_HUD"][MM.duelplrs[1].role], V_SNAPTOLEFT)
			v.draw(48, 88, v.getSprite2Patch(MM.duelplrs[1].skin, SPR2_XTRA), 8388608|V_SNAPTOLEFT, v.getColormap(MM.duelplrs[1].skin,MM.duelplrs[1].skincolor)) --draw character icon flipped horizontaly
			V_DrawStrASCIIcentered(v, (coords.pong.x + 10), 36, p.mmlang, MM.RoleColor[MM.duelplrs[1].role]..MM.duelplrs[1].kills, V_SNAPTOLEFT)
		end
		--player 2 side information
		if (MM.duelplrs[2].valid)
			v.drawString((304 - v.stringWidth(MM.duelplrs[2].name)), 176, MM.duelplrs[2].name, 8388608|V_SNAPTORIGHT)
			V_DrawStrASCII(v, (304 - V_StrWidthASCII(mmtxt[p.mmlang]["ROLES_HUD"][MM.duelplrs[2].role])), 184, p.mmlang, MM.RoleColor[MM.duelplrs[2].role]..mmtxt[p.mmlang]["ROLES_HUD"][MM.duelplrs[2].role], V_SNAPTORIGHT)
			v.draw(272, 88, v.getSprite2Patch(MM.duelplrs[2].skin, SPR2_XTRA), V_SNAPTORIGHT, v.getColormap(MM.duelplrs[2].skin,MM.duelplrs[2].skincolor))
			V_DrawStrASCIIcentered(v, (310 - coords.pong.x), 36, p.mmlang, MM.RoleColor[MM.duelplrs[2].role]..MM.duelplrs[2].kills, V_SNAPTORIGHT)
		end

		if (MM.devbuild)
			v.drawString(coords.debugHUD.x, coords.debugHUD.y, "\x87Pong "..MM.version.."-"..MM.devbuild,0,"thin")
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
		V_DrawStrRight(v, 0, "Press\x82 CUSTOM3\x80 to spectate", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
		V_DrawStrRight(v, 8, "a minigame duel", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
	end

	--"People alive" (replaces SCORES)
	v.draw(infoSCORE.x, infoSCORE.y, v.cachePatch("HUD_PPLE"), infoSCORE.f)
	v.draw((infoSCORE.x + 56), infoSCORE.y, v.cachePatch("HUD_ALVE"), infoSCORE.f)
	v.drawNum((infoSCORE.x + 120), infoSCORE.y, PlayersAlive(), infoSCORE.f)

	--Time
	local timeleft = (MM.timelimit * 2100) - leveltime
	if (G_TicsToMinutes(timeleft) == 0) and (leveltime&4) v.draw(infoTIME.x, infoTIME.y, v.cachePatch("STTRTIME"), infoTIME.f)
	else v.draw(infoTIME.x, infoTIME.y, v.cachePatch("STTTIME"), infoTIME.f) end
	
	v.drawNum(hudinfo[HUD_MINUTES].x, hudinfo[HUD_MINUTES].y, G_TicsToMinutes(timeleft), hudinfo[HUD_MINUTES].f)
	v.draw(hudinfo[HUD_TIMECOLON].x, hudinfo[HUD_TIMECOLON].y, v.cachePatch("STTCOLON"), hudinfo[HUD_TIMECOLON].f)
	if (G_TicsToSeconds(timeleft) >= 10) v.drawNum(hudinfo[HUD_SECONDS].x, hudinfo[HUD_SECONDS].y, G_TicsToSeconds(timeleft), hudinfo[HUD_SECONDS].f)
	else
		v.drawNum(hudinfo[HUD_SECONDS].x-8, hudinfo[HUD_SECONDS].y, 0, hudinfo[HUD_SECONDS].f)
		v.drawNum(hudinfo[HUD_SECONDS].x, hudinfo[HUD_SECONDS].y, G_TicsToSeconds(timeleft), hudinfo[HUD_SECONDS].f)
	end

	--Rings
	v.draw(infoRINGS.x, infoRINGS.y, v.cachePatch("STTRINGS"), infoRINGS.f)
	v.drawNum(hudinfo[HUD_RINGSNUM].x, hudinfo[HUD_RINGSNUM].y, p.rings, hudinfo[HUD_RINGSNUM].f)

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x*FU), (hudinfo[HUD_LIVES].y*FU), 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)

	--Show your role (and translate it)
	if (p.role)
		if ((p.role > 0) and (p.roleflicker % 4 == 0)) V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), p.mmlang, MM.RoleColor[p.role]..mmtxt[p.mmlang]["ROLES_HUD"][p.role], hudinfo[HUD_LIVES].f) end
		if (p.role == ROLE_MURDERER) and (PlayerCount(ROLE_MURDERER) > 1) V_DrawStrASCII(v, infoRINGS.x, infoRINGS.y+16, p.mmlang, MM.RoleColor[ROLE_MURDERER]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(ROLE_MURDERER), infoRINGS.f)
		elseif (p.role == ROLE_SHERIFF)
			if (PlayerCount(ROLE_HERO)) V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, MM.RoleColor[ROLE_SHERIFF]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(ROLE_SHERIFF)..MM.RoleColor[ROLE_HERO].." + "..PlayerCount(ROLE_HERO), infoRINGS.f)
			elseif (PlayerCount(ROLE_SHERIFF) > 1) and (PlayerCount(ROLE_HERO) == 0)  V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, MM.RoleColor[ROLE_SHERIFF]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(ROLE_SHERIFF), infoRINGS.f) end
		elseif (p.role == ROLE_HERO)
			if (PlayerCount(ROLE_SHERIFF)) V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, MM.RoleColor[ROLE_HERO]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(ROLE_HERO)..MM.RoleColor[ROLE_SHERIFF].." + "..PlayerCount(ROLE_SHERIFF), infoRINGS.f)
			elseif (PlayerCount(ROLE_HERO) > 1) and (PlayerCount(ROLE_SHERIFF) == 0) V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, MM.RoleColor[ROLE_HERO]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(ROLE_HERO), infoRINGS.f) end
		end
	end
	if (p.spectator)
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), p.mmlang, MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD"][5], hudinfo[HUD_LIVES].f)
		for y,i in pairs(mmtxt[p.mmlang]["HUD_DEAD"]) do V_DrawStrASCIIcentered(v, 160, (112 + y*8), p.mmlang, i) end
		if (p.role == nil)
			for y,i in pairs(mmtxt[p.mmlang]["HUD_MIDJOIN"]) V_DrawStrASCIIcentered(v, 160, (152 + y*8), p.mmlang, i, 0, 32768) end --FU/2
		end
		if (p.killedby)
			if (p.killedby == "your stupidity") V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, "\5"..mmtxt[p.mmlang]["KILLBY_HUD"].."\0 "..mmtxt[p.mmlang]["STUPID"], V_SNAPTOTOP|V_SNAPTOLEFT)
			else V_DrawStrASCII(v, infoRINGS.x, (infoRINGS.y + 16), p.mmlang, "\5"..mmtxt[p.mmlang]["KILLBY_HUD"].."\0 "..p.killedby, infoRINGS.f) end
		end
	end

	if (not p.spectator) and (MM.twopgame)
		local rival
		if (MM.duelplrs[1] == p) rival = MM.duelplrs[2]
		elseif (MM.duelplrs[2] == p) rival = MM.duelplrs[1] end
		if ((rival) and (rival.valid))
			if ((not p.minigame) and (not rival.minigame))
				V_DrawStrRight(v, 0, "Press\x82 CUSTOM3\x80 to", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
				V_DrawStrRight(v, 8, "request a \x87Pong\x80 game", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
			elseif ((p.minigame) and (not rival.minigame))
				V_DrawStrRight(v, 0, "Waiting for rival to accept...", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
				if (not p.minigametimeout) V_DrawStrRight(v,8,"Press\x82 CUSTOM3\x80 to cancel", V_SNAPTOTOP|V_SNAPTORIGHT, "thin") end
			elseif ((not p.minigame) and (rival.minigame) and (leveltime & 1))
				V_DrawStrRight(v, 0, "Press\x82 CUSTOM3\x80 to", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
				V_DrawStrRight(v, 8, "accept the \x87Pong\x80 challenge!", V_SNAPTOTOP|V_SNAPTORIGHT, "thin")
			end
		end
	end

	--I fucking recreated the whole vanilla ring weapons dock to slightly move it somewhere else :skull:
	if ((p.role == ROLE_MURDERER) or (p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO))
		local ringTrans={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --granade
			0, --explosion
			0, --rail
			0  --red/infinity
		}
		--transluency for the red ring icon
		if ((p.powers[pw_infinityring] == 0) and (p.rings == 0)) ringTrans[7]=458752 --70% transluent
		else ringTrans[7]=0 end
		--transluency for other weapons
		for weapon=1,6
			if ((p.powers[weapon + 14]) and (not (p.ringweapons & wep2rw(weapon))) or ((not p.powers[weapon + 14]) and (p.ringweapons & wep2rw(weapon)))) ringTrans[weapon] = 458752 --70% transluent
			else ringTrans[weapon] = 0 end
		end

		--Ring weapons
		if (p.role == ROLE_MURDERER)
			--draw the only icon for Murderer
			if (p.powers[pw_infinityring])
				v.draw(firstRingWepX, (coords.firstRingWep.y), v.cachePatch("INFNIND")) --Infinite Ring icon
				V_DrawStrCentered(v, (coords.firstRingWep.y+8), p.powers[pw_infinityring], ringTrans[7], "thin") --Infinite Ring ammo counter
			else v.draw(firstRingWepX, (coords.firstRingWep.y), v.cachePatch("RINGIND"), ringTrans[7]) end --Red Ring icon
			v.draw((firstRingWepX - 2), (coords.firstRingWep.y - (p.mmweapondelay>>1) - 2), v.cachePatch("CURWEAP")) --selector
		elseif (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
			if (p.powers[pw_infinityring])
				v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("INFNIND")) --Infinite Ring icon
				v.drawString((coords.firstRingWep.x + 1), (coords.firstRingWep.y + 8), p.powers[pw_infinityring], ringTrans[7], "thin") --Infinite Ring ammo counter
			else v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("RINGIND"), ringTrans[7]) end --Red Ring icon
			for weapon = 1,6
				if (p.ringweapons&wep2rw(weapon)) or (p.powers[weapon+14])
					v.draw((coords.firstRingWep.x + weapon*20), (coords.firstRingWep.y), v.cachePatch(MM.weapons[weapon][1]), ringTrans[weapon]) --Ring weapon icon
					if (p.powers[weapon + 14]) v.drawString((coords.firstRingWep.x + 1 + weapon*20), (coords.firstRingWep.y + 8), p.powers[weapon + 14], ringTrans[weapon], "thin") end --Ammo counter
				end
			end
			if ((p.ammoremovaltimer) and (leveltime & 1)) v.drawString((coords.firstRingWep.x + 1 + p.ammoremovalweapon*20), (coords.firstRingWep.y + 2), "\x85-"..p.ammoremoval, nil, "thin") end --Ammo removal penalty
			v.draw((coords.firstRingWep.x - 2 + p.currentweapon*20), (coords.firstRingWep.y - (p.mmweapondelay>>2) - 2), v.cachePatch("CURWEAP")) --selector
		end
	elseif ((p.role == ROLE_INNOCENT) and (#MM.shremls) and (p.shreml_dist)) --innocents have Sheriff Emerald radar instead of weapon dock
		v.drawScaled(153*FU, 156*FU, 32768, v.cachePatch("IDEYAR"..V_GetSHREMLiconID(fixint(p.shreml_dist))))
	end


	--Are you alone? Draw the text
	if (PlayerCount() == 1) for y,i in pairs(mmtxt[p.mmlang]["HUD_ALONE"]) do V_DrawStrASCIIcentered(v, 160, (128 + y*8), p.mmlang, i) end end
	--"Showdown duel!"
	if (PlayerCount(ROLE_MURDERER) and (PlayerCount(ROLE_SHERIFF) or PlayerCount(ROLE_HERO)) and PlayerCount(ROLE_INNOCENT)==0) V_DrawStrCentered(v, 184, "\x88Showdown duel!",8388608) end

	--ABILITIES.LUA part
	if (CV_FindVar("mmsprint").value) v.drawString(infoRINGS.x, infoRINGS.y+32, "\x82Sprint (hold):\x80 CUSTOM1", V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	elseif (p.sneak) v.drawString(infoRINGS.x, infoRINGS.y+24, "Sneaking...", V_SNAPTOTOP|V_SNAPTOLEFT, "thin") end

	--Flash screen when you die
	if (p.flashscrn) v.drawStretched(0,0, (v.width()*FU), (v.height()*FU), v.cachePatch("HUD_FLSH"), ((p.flashscrn-1)*FU)|V_SNAPTOTOP|V_SNAPTOLEFT) end

	--Debug
	if MM.devbuild
		v.drawString(coords.debugHUD.x, coords.debugHUD.y, "\x87"..MM.version.."-"..MM.devbuild,0,"thin")
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
	local p = consoleplayer --for shortage
	hud.disable("rankings")
	V_DrawStrCentered(v,0,"WORK IN PROGRESS GAMETYPE, VERSION "..MM.version, V_SNAPTOTOP)

	--Main body
	V_DrawStrASCIIcentered(v, 160, 20, p.mmlang, mmtxt[p.mmlang]["MM"], V_SNAPTOTOP)
	for y,i in pairs(mmtxt[p.mmlang]["HUD_SCORESTAB"])
		V_DrawStrASCII(v, 20, (24 + y*8), p.mmlang, i, V_SNAPTOTOP|V_SNAPTOLEFT)
	end

	--Roles counter
	-- Murderer
	V_DrawStrASCII(v, 20, 176, p.mmlang, MM.RoleColor[1]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][1].." "..PlayerCount(ROLE_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
	-- Sheriff (and Hero)
	if (PlayerCount(ROLE_HERO)) V_DrawStrASCII(v, 20, 184, p.mmlang, MM.RoleColor[2]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][2].." "..PlayerCount(ROLE_SHERIFF)..MM.RoleColor[4].." + "..PlayerCount(ROLE_HERO), V_SNAPTOTOP|V_SNAPTOLEFT)
	else V_DrawStrASCII(v, 20, 184, p.mmlang, MM.RoleColor[2]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][2].." "..PlayerCount(ROLE_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT) end
	-- Innocent
	if (PlayerCount(ROLE_INNOCENT)) V_DrawStrASCII(v, 20,192, p.mmlang, MM.RoleColor[3]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][3].." "..PlayerCount(ROLE_INNOCENT), V_SNAPTOTOP|V_SNAPTOLEFT) end
	-- Online
	v.drawString(192, 176, "ONLINE: "..PlayerCount(), V_SNAPTOTOP|V_SNAPTOLEFT)
	-- "Sheriff Emerald is available!"
	if ((#MM.shremls) and (leveltime & 1)) v.drawScaled(524280, 12058440, 32768, v.cachePatch("CHAOS3"), V_SNAPTOTOP|V_SNAPTOLEFT) end --8*FU, 184*FU, FU/2

	if (MM.devbuild) V_DrawStrCentered(v,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!",V_SNAPTOTOP|V_SNAPTOBOTTOM) end
end
local function interHUD(v) --Custom intermission HUD
	if (gametype!=GT_MURDERMYSTERY)
		hud.enable("intermissiontally")
		return
	end
	hud.disable("intermissiontally")
	--here starts the insanity
	local p = consoleplayer
	local plrs = {}
	local multiply = {x=0, y=0}
	
	V_DrawStrASCIIcentered(v,160, 4, p.mmlang, "\7"..mmtxt[p.mmlang]["MM"])
	if (mapheaderinfo[gamemap].actnum == 0) V_DrawStrCentered(v, 16, "* "..mapheaderinfo[gamemap].lvlttl.." *")
	else V_DrawStrCentered(v, 16, "* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *") end
	v.drawFill(0, 40, 320, 2, 0) --horizontal line
	for p in players.iterate do table.insert(plrs,p) end
	
	--names of columns
	if (PlayerCount() <= 16)
		v.drawString(coords.num.x,coords.first.y,"\x82#")
		v.drawString(coords.name.x,coords.first.y,"\x82NAME")
		v.drawString(coords.kills.x,coords.first.y,"\x82KILLS")
		v.drawString(coords.role.x,coords.first.y,"\x82ROLE")
	else
		v.drawFill(160, 40, 2, 144, 0) --vertical line
		--players 1-16
		v.drawString(coords.num2.x, coords.first.y, "\x82#",0,"thin")
		v.drawString(coords.name2.x, coords.first.y, "\x82NAME",0,"thin")
		v.drawString(coords.kills2.x, coords.first.y, "\x82KILL",0,"thin")
		v.drawString(coords.role2.x, coords.first.y, "\x82ROLE",0,"thin")
		--players 17-32
		v.drawString((coords.num2.x + 160), coords.first.y, "\x82#",0,"thin")
		v.drawString((coords.name2.x + 160), coords.first.y, "\x82NAME",0,"thin")
		v.drawString((coords.kills2.x + 160), coords.first.y, "\x82KILL",0,"thin")
		v.drawString((coords.role2.x + 160), coords.first.y, "\x82ROLE",0,"thin")
	end

	--draw player stats
	for i = 1,#plrs
		if (PlayerCount() < 9) --Regular mode
			v.drawString((coords.num.x), (coords.first.y + i*16), i)
			v.drawScaled((coords.name.x - 20)*FU, (((coords.first.y - 4) + i*16)*FU), 32768, v.getSprite2Patch(plrs[i].skin,SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --32768 = FU/2
			v.drawString((coords.name.x), (coords.first.y + i*16), string.sub(plrs[i].name, 1, 17), 8388608)
			v.drawString((coords.kills.x), (coords.first.y + i*16), plrs[i].kills)

			if (plrs[i].role) and (plrs[i].role >= 1) V_DrawStrASCII(v, (coords.role.x), (coords.first.y + i*16), p.mmlang, MM.RoleColor[plrs[i].role]..mmtxt[p.mmlang]["ROLES_HUD"][plrs[i].role])
			else V_DrawStrASCII(v, (coords.role.x), (coords.first.y + i*16), p.mmlang, MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD"][5]) end
		elseif ((PlayerCount() >= 9) and (PlayerCount() <= 16)) --"Compact" mode
			v.drawString((coords.num.x), (coords.first2.y + i*8), i, 0, "thin")
			v.drawScaled((coords.name.x - 16)*FU, ((coords.first2.y - 1) + i*8)*FU, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --16384 = FU/4
			v.drawString((coords.name.x), (coords.first2.y + i*8), string.sub(plrs[i].name, 1, 32), 8388608, "thin")
			v.drawString((coords.kills.x), (coords.first2.y + i*8), plrs[i].kills, 0, "thin")

			if (plrs[i].role) and (plrs[i].role >= 1) V_DrawStrASCII(v, (coords.role.x),(coords.first.y + i*16), p.mmlang, MM.RoleColor[plrs[i].role]..mmtxt[p.mmlang]["ROLES_HUD"][plrs[i].role], 0, 32768) --FU/2
			else V_DrawStrASCII(v, (coords.role.x), (coords.first.y + i*16), p.mmlang, MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD"][5], 0, 32768) end --FU/2
		elseif (PlayerCount() > 16) --"Double column compact" mode
			if (i > 16) --players 17-32 are drawn on the second column
				multiply.x = 160
				multiply.y = -128
			end
			--back to the rows
			v.drawString((coords.num3.x + multiply.x), (coords.first2.y + i*8 + multiply.y),i,0,"thin")
			v.drawScaled((coords.name3.x + multiply.x - 10)*FU, ((coords.first2.y - 1) + i*8 + multiply.y)*FU, 16384, v.getSprite2Patch(plrs[i].skin, SPR2_XTRA), 0, v.getColormap(plrs[i].skin, plrs[i].skincolor)) --FU/4
			v.drawString((coords.name3.x + multiply.x), (coords.first2.y + i*8 + multiply.y), string.sub(plrs[i].name, 1, 16), 8388608, "thin")
			v.drawString((coords.kills3.x + multiply.x), (coords.first2.y + i*8 + multiply.y), plrs[i].kills, 0, "thin")

			if (plrs[i].role) and (plrs[i].role >= 1) V_DrawStrASCII(v, (coords.role2.x + multiply.x), (coords.first2.y + i*8 + multiply.y), p.mmlang, (MM.RoleColor[plrs[i].role]..mmtxt[p.mmlang]["ROLES_HUD_SHORT"][plrs[i].role]), 0, 32768) --FU/2
			else V_DrawStrASCII(v, (coords.role2.x + multiply.x), (coords.first2.y + i*8 + multiply.y), p.mmlang, (MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD_SHORT"][5]), 0, 32768) end --FU/2
		end
	end

	if (MM.winner == 0) V_DrawStrASCIIcentered(v, 160, 176, p.mmlang, mmtxt[p.mmlang]["WIN_HUD"][1]) --tie
	else V_DrawStrASCIIcentered(v, 160, 176, p.mmlang, mmtxt[p.mmlang]["WINNERS_HUD"].." "..mmtxt[p.mmlang]["WIN_HUD"][MM.winner + 1]) end

	if (not MM.devbuild) v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version, V_RETURN8|8388608|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	else
		v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version.."-"..MM.devbuild, V_RETURN8|8388608|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
		V_DrawStrCentered(v, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOTOP|V_SNAPTOBOTTOM)
	end
	--THANK GOD IT ENDED
end

hud.add(mainHUD, "game")
hud.add(scoresHUD, "scores")
hud.add(interHUD, "intermission")