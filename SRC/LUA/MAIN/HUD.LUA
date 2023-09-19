-- HUD.LUA
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script controlls HUD elements
-- Good luck reading all of this
--
-- Note: Some Video Flags are presented as intergers
-- V_ALLOWLOWERCASE = 8388608

-- Constants
local coords={ --HUD screen coordinates
	first={y=32}, --this and everything below for custom intermission
	num={x=16},
	name={x=48},
	kills={x=192},
	role={x=248},
	first2={y=40},
	num2={x=4},
	name2={x=24},
	kills2={x=108},
	role2={x=134},
	firstRingWep={ --for weapon icons
		x=100,
		y=156
	}
}
local infoSCORE=hudinfo[HUD_SCORE]
local infoTIME=hudinfo[HUD_TIME]
local infoRINGS=hudinfo[HUD_RINGS]
local debugHUD={x=8,y=80}

local mmtxt=MM.text

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

	--"People alive" (replaces SCORES)
	v.draw(infoSCORE.x, infoSCORE.y, v.cachePatch("HUD_PPLE"), infoSCORE.f)
	v.draw(infoSCORE.x+56, infoSCORE.y, v.cachePatch("HUD_ALVE"), infoSCORE.f)
	v.drawNum(infoSCORE.x+120, infoSCORE.y, PlayersAlive(), infoSCORE.f)

	--Time
	local timeleft = (MM.timelimit*60*TICRATE) - leveltime
	if (G_TicsToMinutes(timeleft)==0) and (leveltime%4==0) v.draw(infoTIME.x, infoTIME.y, v.cachePatch("STTRTIME"), infoTIME.f)
	else v.draw(infoTIME.x, infoTIME.y, v.cachePatch("STTTIME"), infoTIME.f) end
	
	v.drawNum(hudinfo[HUD_MINUTES].x, hudinfo[HUD_MINUTES].y, G_TicsToMinutes(timeleft), hudinfo[HUD_MINUTES].f)
	v.draw(hudinfo[HUD_TIMECOLON].x, hudinfo[HUD_TIMECOLON].y, v.cachePatch("STTCOLON"), hudinfo[HUD_TIMECOLON].f)
	if (G_TicsToSeconds(timeleft)>=10) v.drawNum(hudinfo[HUD_SECONDS].x, hudinfo[HUD_SECONDS].y, G_TicsToSeconds(timeleft), hudinfo[HUD_SECONDS].f)
	else
		v.drawNum(hudinfo[HUD_SECONDS].x-8, hudinfo[HUD_SECONDS].y, 0, hudinfo[HUD_SECONDS].f)
		v.drawNum(hudinfo[HUD_SECONDS].x, hudinfo[HUD_SECONDS].y, G_TicsToSeconds(timeleft), hudinfo[HUD_SECONDS].f)
	end

	--Rings
	v.draw(infoRINGS.x, infoRINGS.y, v.cachePatch("STTRINGS"), infoRINGS.f)
	v.drawNum(hudinfo[HUD_RINGSNUM].x, hudinfo[HUD_RINGSNUM].y, p.rings, hudinfo[HUD_RINGSNUM].f)

	--Life icon, player name and role
	v.drawScaled(hudinfo[HUD_LIVES].x*FU, hudinfo[HUD_LIVES].y*FU, 32768, v.getSprite2Patch(p.realmo.skin, SPR2_XTRA), hudinfo[HUD_LIVES].f, v.getColormap(p.skin, p.skincolor)) --FU/2
	v.drawString(hudinfo[HUD_LIVES].x+18, hudinfo[HUD_LIVES].y, p.name, hudinfo[HUD_LIVES].f|V_ALLOWLOWERCASE)

	--Show your role (and translate it)
	if (p.role) and (p.role>=1) v.drawString(hudinfo[HUD_LIVES].x+18, hudinfo[HUD_LIVES].y+8,MM.RoleColor[p.role]..mmtxt[p.mmlang]["ROLES_HUD"][p.role], hudinfo[HUD_LIVES].f) end
	if (p.role) and (p.role==ROLE_MURDERER) or (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
		if PlayerCount(p.role)>1 v.drawString(0, 192, MM.RoleColor[p.role]..mmtxt[p.mmlang]["TEAMALIVE_HUD"].." "..PlayerCount(p.role), V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
	elseif (p.spectator)
		v.drawString(hudinfo[HUD_LIVES].x+18, hudinfo[HUD_LIVES].y+8, MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD"][5], hudinfo[HUD_LIVES].f)
		for y,i in pairs(mmtxt[p.mmlang]["HUD_DEAD"]) drawStrCentered(v, 112+y*8, i,8388608) end
		if (p.role==nil)
			for y,i in pairs(mmtxt[p.mmlang]["HUD_MIDJOIN"]) drawStrCentered(v, 152+y*8, i, 8388608, "thin") end
		end
		if (p.killedby)
			if p.killedby=="Your stupidity" v.drawString(infoRINGS.x, infoRINGS.y+16, "\x85"..mmtxt[p.mmlang]["KILLBY_HUD"].."\x80 "..mmtxt[p.mmlang]["STUPID"], V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE)
			else v.drawString(infoRINGS.x, infoRINGS.y+16, "\x85"..mmtxt[p.mmlang]["KILLBY_HUD"].."\x80 "..p.killedby, infoRINGS.f|V_ALLOWLOWERCASE) end
		end
	end

	--I fucking recreated the whole vanilla ring weapons dock to slightly move it somewhere else :skull:
	if (p.role==ROLE_MURDERER) or (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
		local ringTrans={
			0, --automatic
			0, --bounce
			0, --scatter
			0, --granade
			0, --explosion
			0, --rail
			0  --red/infinity
		}
		local ringPatches={
			"AUTOIND",
			"BNCEIND",
			"SCATIND",
			"GRENIND",
			"BOMBIND",
			"RAILIND"
		}
		--transluency for the red ring icon
		if (p.powers[pw_infinityring]==0) and (p.rings==0) ringTrans[7]=458752 --70% transluent
		else ringTrans[7]=0 end
		--transluency for other weapons
		for weapon=1,6
			if ((p.powers[weapon+14]) and (not (p.ringweapons&wep2rw(weapon))) or ((not p.powers[weapon+14]) and (p.ringweapons&wep2rw(weapon)))) ringTrans[weapon]=458752 --70% transluent
			else ringTrans[weapon]=0 end
		end

		--Ring weapons
		if (p.role==ROLE_MURDERER)
			coords.firstRingWep.x=152
			--draw the only icon for Murderer
			if (p.powers[pw_infinityring])
				v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("INFNIND"))
				drawStrCentered(v, (coords.firstRingWep.y+8), p.powers[pw_infinityring], ringTrans[7], "thin")
			else v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("RINGIND"), ringTrans[7]) end
			v.draw((coords.firstRingWep.x-2), (coords.firstRingWep.y-p.weapondelay-2), v.cachePatch("CURWEAP"))
		elseif (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
			coords.firstRingWep.x=100
			if (p.powers[pw_infinityring])
				v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("INFNIND"))
				v.drawString((coords.firstRingWep.x+1), (coords.firstRingWep.y+8), p.powers[pw_infinityring], ringTrans[7], "thin")
			else v.draw((coords.firstRingWep.x), (coords.firstRingWep.y), v.cachePatch("RINGIND"), ringTrans[7]) end
			for weapon=1,6
				if (p.ringweapons&wep2rw(weapon)) or (p.powers[weapon+14])
					v.draw((coords.firstRingWep.x+weapon*20), (coords.firstRingWep.y), v.cachePatch(ringPatches[weapon]), ringTrans[weapon])
					if (p.powers[weapon+14]) v.drawString(coords.firstRingWep.x+1+weapon*20, (coords.firstRingWep.y+8), p.powers[weapon+14], ringTrans[weapon], "thin") end
				end
			end
			if ((p.ammoremovaltimer) and (leveltime%2==0)) v.drawString(coords.firstRingWep.x+1+p.ammoremovalweapon*20, (coords.firstRingWep.y+2), "\x85-"..p.ammoremoval, nil, "thin") end
			v.draw((coords.firstRingWep.x-2+p.currentweapon*20), (coords.firstRingWep.y-(p.weapondelay>>2)-2), v.cachePatch("CURWEAP"))
		end
	end

	--Reminder
	if (CV_FindVar("rejointimeout").value!=0)
		drawStrCentered(v, 96, "ADMIN, DISABLE THE\x87 REJOINTIMEOUT")
		drawStrCentered(v, 104, "MM DOESN'T WORK PROPERLY WITH THIS CVAR")
	end

	--Are you alone? Draw the text
	if (PlayerCount()==1) for y,i in pairs(mmtxt[p.mmlang]["HUD_ALONE"]) drawStrCentered(v, 128+y*8, i, 8388608) end end
	--"Showdown duel!"
	if (PlayerCount(ROLE_MURDERER)!=0) and (PlayerCount(ROLE_SHERIFF)!=0 or PlayerCount(ROLE_HERO)!=0) and (PlayerCount(ROLE_INNOCENT)==0) drawStrCentered(v, 184, "\x88Showdown duel!",8388608) end

	--ABILITIES.LUA part
	if (CV_FindVar("mmsprint").value) v.drawString(infoRINGS.x, infoRINGS.y+32, "\x82Sprint (hold):\x80 CUSTOM1", V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	elseif (p.sneak) v.drawString(infoRINGS.x, infoRINGS.y+24, "Sneaking...", V_SNAPTOTOP|V_SNAPTOLEFT, "thin") end

	--Debug
	if MM.devbuild
		v.drawString(debugHUD.x, debugHUD.y, "\x87"..MM.version.."-"..MM.devbuild,0,"thin")
		v.drawString(debugHUD.x, debugHUD.y+8, "\x82".."AFK: \x80"..p.afk,0,"thin")
		v.drawString(debugHUD.x, debugHUD.y+16, "\x82".."MMLANG: \x80"..p.mmlang,0,"thin")
		v.drawString(debugHUD.x, debugHUD.y+24, "\x82".."KILLS: \x80"..p.kills,0,"thin")
		v.drawString(debugHUD.x, debugHUD.y+32, "\x82".."CHATDELAY: \x80"..p.chatdelay,0,"thin")
	end
end
local function scoresHUD(v) --SCORES TAB
	if gametype!=GT_MURDERMYSTERY
		hud.enable("rankings")
		return
	end
	local p=consoleplayer --for shortage
	hud.disable("rankings")
	drawStrCentered(v,0,"WORK IN PROGRESS GAMETYPE, VERSION "..MM.version, V_SNAPTOTOP)

	--Main body
	drawStrCentered(v, 20, mmtxt[p.mmlang]["MM"], V_SNAPTOTOP|V_ALLOWLOWERCASE)
	for y,i in pairs(mmtxt[p.mmlang]["HUD_SCORESTAB"])
		v.drawString(20, (24+y*16), i, V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE|V_RETURN8)
	end

	--Roles counter
	-- Murderer
	v.drawString(20,176, MM.RoleColor[1]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][1].." "..PlayerCount(ROLE_MURDERER), V_SNAPTOTOP|V_SNAPTOLEFT)
	-- Sheriff (and Hero)
	if (PlayerCount(ROLE_HERO)!=0) v.drawString(20,184, MM.RoleColor[2]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][2].." "..PlayerCount(ROLE_SHERIFF)..MM.RoleColor[4].." + "..PlayerCount(ROLE_HERO), V_SNAPTOTOP|V_SNAPTOLEFT)
	else v.drawString(20,184, MM.RoleColor[2]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][2].." "..PlayerCount(ROLE_SHERIFF), V_SNAPTOTOP|V_SNAPTOLEFT) end
	-- Innocent
	if (PlayerCount(ROLE_INNOCENT)!=0) v.drawString(20,192, MM.RoleColor[3]..mmtxt[p.mmlang]["HUD_ROLESALIVE"][3].." "..PlayerCount(ROLE_INNOCENT), V_SNAPTOTOP|V_SNAPTOLEFT) end
	-- Online
	v.drawString(192,176, "ONLINE: "..PlayerCount(), V_SNAPTOTOP|V_SNAPTOLEFT)
	-- "Sheriff Emerald is available!"
	if (MM.shreml_dropped!=0) and (leveltime%2==0) v.drawScaled(524280,12058440,32768,v.cachePatch("CHAOS3"), V_SNAPTOTOP|V_SNAPTOLEFT) end --8*FU, 184*FU, FU/2

	if (MM.devbuild) drawStrCentered(v,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!",V_SNAPTOTOP|V_SNAPTOBOTTOM) end
end
local function interHUD(v) --Custom intermission HUD
	if gametype!=GT_MURDERMYSTERY
		hud.enable("intermissiontally")
		return
	end
	hud.disable("intermissiontally")
	--here starts the insanity
	local p=consoleplayer
	local plrs={}
	local multiply={x=0,y=0}
	
	drawStrCentered(v,4,"\x87"..mmtxt[p.mmlang]["MM"])
	if (mapheaderinfo[gamemap].actnum==0) drawStrCentered(v,16,"* "..mapheaderinfo[gamemap].lvlttl.." *")
	else drawStrCentered(v,16,"* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *") end
	v.drawFill(0,40,320,2,0) --horizontal line
	for p in players.iterate table.insert(plrs,p) end
	
	for i=1,#plrs
		if PlayerCount()<9
			v.drawString(coords.num.x,coords.first.y,"\x82#")
			v.drawString(coords.name.x,coords.first.y,"\x82NAME")
			v.drawString(coords.kills.x,coords.first.y,"\x82KILLS")
			v.drawString(coords.role.x,coords.first.y,"\x82ROLE")

			v.drawString((coords.num.x),(coords.first.y+i*16),i)
			v.drawScaled((coords.name.x-20)*FU,((coords.first.y-4)+i*16)*FU,32768,v.getSprite2Patch(plrs[i].skin,SPR2_XTRA),0,v.getColormap(plrs[i].skin,plrs[i].skincolor)) --FU/2
			v.drawString((coords.name.x),(coords.first.y+i*16),string.sub(plrs[i].name, 1, 17),8388608)
			v.drawString((coords.kills.x),(coords.first.y+i*16),plrs[i].kills)

			if (plrs[i].role) and (plrs[i].role>=1) v.drawString((coords.role.x),(coords.first.y+i*16),MM.RoleColor[plrs[i].role]..mmtxt[p.mmlang]["ROLES_HUD"][plrs[i].role])
			else v.drawString((coords.role.x),(coords.first.y+i*16),MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD"][5]) end
		else --if >=9 plrs present
			v.drawFill(160,40,2,144,0) --vertical line
			--names of columns
			for i=0,1
				v.drawString((coords.num2.x+i*160),(coords.first.y),"\x82#",0,"thin")
				v.drawString((coords.name2.x+i*160),(coords.first.y),"\x82NAME",0,"thin")
				v.drawString((coords.kills2.x+i*160),(coords.first.y),"\x82KILL",0,"thin")
				v.drawString((coords.role2.x+i*160),(coords.first.y),"\x82ROLE",0,"thin")
			end
			if i>16 --players 17-32 are drawn on the second column
				multiply.x=160
				multiply.y=-128
			end
			--rows
			v.drawString((coords.num2.x+multiply.x),(coords.first2.y+i*8+multiply.y),i,0,"thin")
			v.drawScaled((coords.name2.x+multiply.x-10)*FU,((coords.first2.y-1)+i*8+multiply.y)*FU,16384,v.getSprite2Patch(plrs[i].skin,SPR2_XTRA),0,v.getColormap(plrs[i].skin,plrs[i].skincolor)) --FU/4
			v.drawString((coords.name2.x+multiply.x),(coords.first2.y+i*8+multiply.y),string.sub(plrs[i].name, 1, 16),8388608,"thin")
			v.drawString((coords.kills2.x+multiply.x),(coords.first2.y+i*8+multiply.y),plrs[i].kills,0,"thin")

			if (plrs[i].role) and (plrs[i].role>=1) v.drawString((coords.role2.x+multiply.x),(coords.first2.y+i*8+multiply.y),(MM.RoleColor[plrs[i].role]..mmtxt[p.mmlang]["ROLES_HUD_SHORT"][plrs[i].role]),0,"thin")
			else v.drawString((coords.role2.x+multiply.x),(coords.first2.y+i*8+multiply.y),(MM.RoleColor[5]..mmtxt[p.mmlang]["ROLES_HUD_SHORT"][5]),0,"thin") end
		end
	end

	if MM.winner==0 drawStrCentered(v,176,mmtxt[p.mmlang]["WIN_HUD"][1]) --tie
	else drawStrCentered(v,176,mmtxt[p.mmlang]["WINNERS_HUD"].." "..mmtxt[p.mmlang]["WIN_HUD"][MM.winner+1],8388608) end

	if (not MM.devbuild) v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	else
		v.drawString(0,184,"WIP GAMETYPE\nv"..MM.version.."-"..MM.devbuild, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
		drawStrCentered(v,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOTOP|V_SNAPTOBOTTOM)
	end
	--THANK GOD IT ENDED
end

hud.add(mainHUD, "game")
hud.add(scoresHUD, "scores")
hud.add(interHUD, "intermission")