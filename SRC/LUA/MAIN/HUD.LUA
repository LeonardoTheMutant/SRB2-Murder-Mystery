-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script takes care of HUD elements
-- Good luck reading all of this

-- Constants
local coords={ --HUD screen coordinates
	teammateInfo = {x=20, y=120},
	teammateInfoOffset1 = {x=18},
	teammateInfoOffset2 = {x=36},
	firstRingWepMurd = {x = 152},
	firstRingWep = {x=92, y=156}, --for weapon icons
	debugHUD = {x=8, y=48},
	--this and everything below is for custom intermission screen
	first = {y=32},
	num = {x=16},
	name = {x=48},
	kills = {x=264},
	first2 = {y=40},
	num2 = {x=4},
	name2 = {x=40},
	kills2 = {x=132},
	num3 = {x=4},
	name3 = {x=24}
}

local expectedHudInfoSize = {0,0,0}
local maxHudIfnfoSize = 0
local duelmodeCVAR = CV_FindVar("mmduelmode")

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
	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("score")
	hud.disable("time")
	hud.disable("rings")
	hud.disable("weaponrings")

	--Do not render the main HUD if MMHELP command, Debug Drawer, "Sonic Run" or "PONG" minigames are active
	if (((consoleplayer.mmhelp) and (consoleplayer.mmhelp.active)) --MMHELP
		or (consoleplayer.debugdrawer)) --debug drawer
		or ((p.minigame) and ((p.spectator) or (PlayerCount() == 1)) and (not (MM.minigame and MM.twopgame))) --Sonic Run
		or ((MM.minigame) and (p.minigame)) --PONG
		return
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
	--Draw the Text Label
	V_DrawTextPatch(v, hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, MM.text[consoleplayer.mmlang][scorePatchName], hudinfo[HUD_SCORE].f)
	--Calculate the number of suspects/victims
	local plrsAlive
	if (p.spectator) plrsAlive = PlayersAlive()
	else
		plrsAlive = PlayersAlive() - 1
		if (plrsAlive < 0) plrsAlive = 0 end
	end
	--Draw the number
	v.drawNum(((hudinfo[HUD_SCORE].x + maxHudIfnfoSize) - 16), hudinfo[HUD_SCORE].y, plrsAlive, hudinfo[HUD_SCORE].f)

	--TIME
	--timer calculation
	local timeleft = (MM.timelimit * 2100) - leveltime
	--Draw the Text Label
	if ((not G_TicsToMinutes(timeleft)) and (leveltime & 4))
		--Swap the colors in the label for flashing effect
		--0x49 in SRB2's palette is Yellow, 0x25 is Red
		V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_TIME"], 0x49, 0x25), hudinfo[HUD_TIME].f)
	else
		V_DrawTextPatch(v, hudinfo[HUD_TIME].x, hudinfo[HUD_TIME].y, MM.text[consoleplayer.mmlang]["BMP_TIME"], hudinfo[HUD_TIME].f)
	end
	--Draw the time
	v.drawPaddedNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 16), hudinfo[HUD_TIME].y, G_TicsToSeconds(timeleft), 2, hudinfo[HUD_TIME].f) --seconds
	v.draw(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, v.cachePatch("STTCOLON"), hudinfo[HUD_TIME].f) --colon
	v.drawNum(((hudinfo[HUD_TIME].x + maxHudIfnfoSize) - 40), hudinfo[HUD_TIME].y, G_TicsToMinutes(timeleft), hudinfo[HUD_TIME].f) --minutes

	--RINGS
	if (not p.spectator)
		if (not p.rings) and (leveltime & 4) V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, V_TextPatch_SwapColor(MM.text[consoleplayer.mmlang]["BMP_RINGS"], 0x49, 0x25), hudinfo[HUD_RINGS].f)
		else V_DrawTextPatch(v, hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y, MM.text[consoleplayer.mmlang]["BMP_RINGS"], hudinfo[HUD_RINGS].f) end
		v.drawNum(((hudinfo[HUD_RINGS].x + maxHudIfnfoSize) - 16), hudinfo[HUD_RINGS].y, p.rings, hudinfo[HUD_RINGS].f)
	end
	
	--Time Warp Sign ("Warp ticket")
	if (p.timetravel and (not p.spectator) and not (p.timetravel.warping & 1))
		if (p.timetravel.timesign and (p.timetravel.timesign == 1)) --Past
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), v.cachePatch("TWS_PAST"), hudinfo[HUD_LIVES].f)
		elseif (p.timetravel.timesign and (p.timetravel.timesign == 2)) --Future
			v.draw(hudinfo[HUD_LIVES].x, (hudinfo[HUD_LIVES].y - 18), v.cachePatch("TWS_FUTR"), hudinfo[HUD_LIVES].f)
		end
	end

	--Life icon, player name and role
	v.drawScaled((hudinfo[HUD_LIVES].x*FU), (hudinfo[HUD_LIVES].y*FU), 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString((hudinfo[HUD_LIVES].x + 18), hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)

	--Show your role
	if ((p.role) and  (p.role > ROLE_NONE) and (not (p.roleflicker % 4)))
		V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x + 18), (hudinfo[HUD_LIVES].y + 8), consoleplayer.mmlang, MM.RoleColorHUD[p.role]..MM.text[consoleplayer.mmlang]["HUD_ROLES"][p.role], hudinfo[HUD_LIVES].f)
	end
	
	--Print the name of the current timezone you're in (exclusive for MAPKD ("East City"))
	if (p.timetravel and p.timetravel.timezone)
		if (p.timetravel.timezone == 1) --Past
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), consoleplayer.mmlang, "\6"..MM.text[consoleplayer.mmlang]["HUD_PAST"], hudinfo[HUD_LIVES].f)
		elseif (p.timetravel.timezone > 2) --One of the Futures
			V_DrawStrASCII(v, (hudinfo[HUD_LIVES].x), (hudinfo[HUD_LIVES].y + 16), consoleplayer.mmlang, "\6"..MM.text[consoleplayer.mmlang]["HUD_FUTURE"], hudinfo[HUD_LIVES].f)
		end
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
		if (p.role == ROLE_MURDERER) and (PlayerCount(ROLE_INNOCENT) or ((not PlayerCount(ROLE_INNOCENT)) and (not duelmodeCVAR.value)))
			--draw the only icon for Murderer
			if (p.powers[pw_infinityring])
				v.draw(coords.firstRingWepMurd.x, (coords.firstRingWep.y), v.cachePatch(MM.weapons[0][1]), V_SNAPTOBOTTOM) --Infinite Ring icon
				v.drawString(160, (coords.firstRingWep.y+8), p.powers[pw_infinityring], ringTrans[7]|V_SNAPTOBOTTOM, "thin-center") --Infinite Ring ammo counter
			else v.draw(coords.firstRingWepMurd.x, (coords.firstRingWep.y), v.cachePatch(MM.weapons[-1][1]), ringTrans[7]|V_SNAPTOBOTTOM) end --Red Ring icon
			v.draw((coords.firstRingWepMurd.x - 2), (coords.firstRingWep.y - (p.mmweapondelay >> 1) - 2), v.cachePatch("CURWEAP"), V_SNAPTOBOTTOM) --selector
		elseif ((p.role == ROLE_SHERIFF) or (p.role == ROLE_HERO) or ((p.role == ROLE_MURDERER) and (not PlayerCount(ROLE_INNOCENT)) and duelmodeCVAR.value))
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
	
	--white time warp spark effect
	if (p.timetravel and p.timetravel.spark) v.drawStretched(0,0, (v.width()*FU), (v.height()*FU), v.cachePatch("PIXEL_0"), ((p.timetravel.spark - 1)*FU)|V_SNAPTOTOP|V_SNAPTOLEFT) end

	
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
		v.drawString(coords.debugHUD.x, coords.debugHUD.y+80, "\x82".."SPEED: \x81"..p.speed.." \x80("..fixint(p.speed)..")",0,"thin")
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

	-- Prerelease/Debug
	if (MM.devbuild) v.drawString(160, 160, "\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOBOTTOM, "center") end
end, "scores")

--
-- Custom intermission HUD
--
hud.add(function(v)
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
end, "intermission")