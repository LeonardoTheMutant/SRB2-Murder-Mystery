-- HUD.LUA
-- Former name: RolesSettings.lua
-- Base code by Tedvin11
-- Improved and developed further by LeonardoTheMutant
--
-- This script controlls HUD elements
--
-- Note: Some Video Flags are presented as intergers
-- V_ALLOWLOWERCASE = 8388608

-- Constants
local R_MURDERER=1
local R_SHERIFF=2
local R_INNO=3
local coords={
	first={y=32},
	num={x=16},
	name={x=48},
	kills={x=192},
	role={x=248},
	first2={y=40},
	num2={x=8},
	name2={x=26},
	kills2={x=84},
	role2={x=118}
}
local MM=MurderMystery
local mmtext=MM.text

	/*["FR"]={ --Piksqu's French (abandoned)
		["RM_HUD"]="ASSASSIN",
		["RS_HUD"]="SHERIFF",
		["RI_HUD"]="INOCENT",
		["DD_HUD"]="MORT",
		["TeamLeft_HUD"]="Coequipiers vivants: "*/
		
local function drawStrCentered(v,y,str,flags,font)
	if flags==nil flags=0 end
	v.drawString(160-v.stringWidth(str,flags,font)/2, y, str, flags, font)
end

local function mainHUD(v, p) --main game HUD
	if gametype != GT_MURDERMYSTERY --in case if switched from MM to other gametype
		hud.enable("lives")
		hud.enable("textspectator")
		hud.enable("score")
		hud.enable("weaponrings")
		return
	end
	hud.disable("score")
	hud.disable("lives")
	hud.disable("textspectator")
	hud.disable("weaponrings")
	--Draw "People alive" in HUD
	v.draw(hudinfo[HUD_SCORE].x, hudinfo[HUD_SCORE].y, v.cachePatch("HUD_PPLE"), V_SNAPTOTOP|V_SNAPTOLEFT)
	v.draw(hudinfo[HUD_SCORE].x+56, hudinfo[HUD_SCORE].y, v.cachePatch("HUD_ALVE"), V_SNAPTOTOP|V_SNAPTOLEFT)
	v.drawNum(hudinfo[HUD_SCORE].x+112, hudinfo[HUD_SCORE].y, MM.howMuchPlayersAlive(), V_SNAPTOTOP|V_SNAPTOLEFT)
	if CV_FindVar("rejointimeout").value!=0
		drawStrCentered(v, 96, "ADMIN, DISABLE THE\x87 REJOINTIMEOUT")
		drawStrCentered(v, 104, "MM DOESN'T WORK PROPERLY WITH THIS CVAR")
	end
	--Show your role in HUD (and translate it)
	if p.role~=nil and p.role>=1 v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+16,mmtext[p.mmlang]["R"..p.role.."_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT) end
	if p.role~=nil and p.role==1
		if MM.howMuchPlayersWithRole(R_MURDERER)>1 v.drawString(0, 192, "\x85"..mmtext[p.mmlang]["TeamLeft_HUD"]..MM.howMuchPlayersWithRole(R_MURDERER), V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
		hud.enable("weaponrings")
	elseif p.role~=nil and p.role==2
		if MM.howMuchPlayersWithRole(R_SHERIFF)>1 v.drawString(0, 192, "\x84"..mmtext[p.mmlang]["TeamLeft_HUD"]..MM.howMuchPlayersWithRole(R_SHERIFF), V_SNAPTOBOTTOM|V_SNAPTOLEFT) end
		hud.enable("weaponrings")
	elseif p.spectator
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+16, mmtext[p.mmlang]["DD_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT)
		for i=1,mmtext[p.mmlang]["DEADSTRNUM"] drawStrCentered(v, 128+i*8, mmtext[p.mmlang]["DEAD"..i], 8388608) end
		if p.role==nil for j=1,mmtext[p.mmlang]["MIDJOINSTRNUM"] drawStrCentered(v, 168+j*8, mmtext[p.mmlang]["MIDJOIN"..j], 8388608, "thin") end end
		if p.killedby!=nil v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+24, "\x85"..mmtext[p.mmlang]["KILLBY_HUD"].."\x80"..p.killedby, V_SNAPTOTOP|V_SNAPTOLEFT|V_ALLOWLOWERCASE) end
	end
	if MM.playerCount()==1 for i=1,mmtext[p.mmlang]["ALONESTRNUM"] drawStrCentered(v, 128+i*8, mmtext[p.mmlang]["ALONE"..i], 8388608) end end
	if MM.howMuchPlayersWithRole(R_INNO)==0 and MM.howMuchPlayersWithRole(R_MURDERER)!=0 and MM.howMuchPlayersWithRole(R_SHERIFF)!=0 v.drawString(108, 168, "\x88Showdown duel!", V_ALLOWLOWERCASE) end
	if CV_FindVar("mmsprint").value v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+32, "\x82Sprint (hold):\x80 CUSTOM1", V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	elseif p.sneak v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+32, "Sneaking...", V_SNAPTOTOP|V_SNAPTOLEFT, "thin") end
	if MM.devbuild
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+96, "\x87"..MM.version.."-"..MM.devbuild, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+104, "\x82".."AFK: \x80"..p.afk, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+112, "\x82".."MMLANG: \x80"..p.mmlang, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
		v.drawString(hudinfo[HUD_RINGS].x, hudinfo[HUD_RINGS].y+120, "\x82".."KILLS: \x80"..p.kills, V_SNAPTOTOP|V_SNAPTOLEFT, "thin")
	end
end
local function scoresHUD(v) --SCORES TAB
	if gametype!=GT_MURDERMYSTERY then
		hud.enable("rankings")
		return
	end
	local p=consoleplayer --for shortage
	hud.disable("rankings")
	
	drawStrCentered(v, 20, mmtext[p.mmlang]["MM"], V_SNAPTOTOP|V_ALLOWLOWERCASE)
	for i=1,mmtext[p.mmlang]["SCORESSTRNUM"] v.drawString(20, 24+i*16, mmtext[p.mmlang]["SCORES"..i.."_HUD"], V_SNAPTOTOP|V_SNAPTOLEFT|V_RETURN8|V_ALLOWLOWERCASE) end
	for i=1,3
		if i==3 and MM.howMuchPlayersWithRole(3)==0 continue end
		v.drawString(20, 168+i*8, mmtext[p.mmlang]["SCORESR"..i.."_HUD"]..MM.howMuchPlayersWithRole(i), V_SNAPTOTOP|V_SNAPTOLEFT)
	end
	v.drawString(192, 176, "ONLINE: "..MM.playerCount(), V_SNAPTOTOP|V_SNAPTOLEFT)
	drawStrCentered(v,0,"WORK IN PROGRESS GAMETYPE, VERSION "..MM.version, V_SNAPTOTOP)
	if MM.devbuild drawStrCentered(v,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!",V_SNAPTOTOP|V_SNAPTOBOTTOM) end
end
local function interHUD(v) --Intermission HUD
	if gametype!=GT_MURDERMYSTERY
		hud.enable("intermissiontally")
		return
	end
	hud.disable("intermissiontally")
	local p=consoleplayer
	local plrs={}
	local multiply={x=0,y=0}
	
	drawStrCentered(v,4,"\x87"..mmtext[p.mmlang]["MM"])
	if mapheaderinfo[gamemap].actnum==0 drawStrCentered(v,16,"* "..mapheaderinfo[gamemap].lvlttl.." *")
	else drawStrCentered(v,16,"* "..mapheaderinfo[gamemap].lvlttl.." "..mapheaderinfo[gamemap].actnum.." *") end
	v.drawFill(0,40,320,2,0)
	for p in players.iterate table.insert(plrs,p) end
	
	for i=1,#plrs
		if MM.playerCount()<8
			v.drawString(coords.num.x,coords.first.y,"\x82#")
			v.drawString(coords.name.x,coords.first.y,"\x82NAME")
			v.drawString(coords.kills.x,coords.first.y,"\x82KILLS")
			v.drawString(coords.role.x,coords.first.y,"\x82ROLE")
			v.drawString(coords.num.x,coords.first.y+i*16,i)
			v.drawScaled((coords.name.x-20)*FU,((coords.first.y-4)+i*16)*FU,FU/2,v.getSprite2Patch(plrs[i].skin,SPR2_XTRA),0,v.getColormap(plrs[i].skin,plrs[i].skincolor))
			v.drawString(coords.name.x, coords.first.y+i*16, plrs[i].name,8388608)
			v.drawString(coords.kills.x, coords.first.y+i*16,plrs[i].kills)
			if plrs[i].role~=nil and plrs[i].role==0 or plrs[i].spectator v.drawString(coords.role.x,coords.first.y+i*16,"\x8F"..mmtext[p.mmlang]["DD_HUD"])
			elseif plrs[i].role~=nil and plrs[i].role>=1 v.drawString(coords.role.x,coords.first.y+i*16,"\x85"..mmtext[p.mmlang]["R"..plrs[i].role.."_HUD"])
			elseif plrs[i].role==nil v.drawString(coords.role.x,coords.first.y+i*16,"\x8F"..mmtext[p.mmlang]["DD_HUD"]) end
		else
			v.drawFill(160,40,2,144,0)
			v.drawString(coords.num2.x,coords.first.y,"\x82#",0,"thin")
			v.drawString(coords.name2.x,coords.first.y,"\x82NAME",0,"thin")
			v.drawString(coords.kills2.x,coords.first.y,"\x82KILLS",0,"thin")
			v.drawString(coords.role2.x,coords.first.y,"\x82ROLE",0,"thin")
			v.drawString(coords.num2.x+160,coords.first.y,"\x82#",0,"thin")
			v.drawString(coords.name2.x+160,coords.first.y,"\x82NAME",0,"thin")
			v.drawString(coords.kills2.x+160,coords.first.y,"\x82KILLS",0,"thin")
			v.drawString(coords.role2.x+160,coords.first.y,"\x82ROLE",0,"thin")
			if i>16
				multiply.x=160
				multiply.y=-128
			end
			v.drawString(coords.num2.x+multiply.x,coords.first2.y+i*8+multiply.y,i,0,"thin")
			v.drawScaled((coords.name2.x+multiply.x-10)*FU,((coords.first2.y-1)+i*8+multiply.y)*FU,FU/4,v.getSprite2Patch(plrs[i].skin,SPR2_XTRA),0,v.getColormap(plrs[i].skin,plrs[i].skincolor))
			v.drawString(coords.name2.x+multiply.x,coords.first2.y+i*8+multiply.y,plrs[i].name,8388608,"thin")
			v.drawString(coords.kills2.x+multiply.x,coords.first2.y+i*8+multiply.y,plrs[i].kills,0,"thin")
			if plrs[i].role~=nil and plrs[i].role==0 or plrs[i].spectator v.drawString(coords.role2.x+multiply.x,coords.first2.y+i*8+multiply.y,"\x8F"..mmtext[p.mmlang]["DD_HUD"],0,"thin")
			elseif plrs[i].role~=nil and plrs[i].role>=1 v.drawString(coords.role2.x+multiply.x,coords.first2.y+i*8+multiply.y,"\x85"..mmtext[p.mmlang]["R"..plrs[i].role.."_HUD"],0,"thin")
			elseif plrs[i].role==nil v.drawString(coords.role2.x+multiply.x,coords.first2.y+i*8+multiply.y,"\x8F"..mmtext[p.mmlang]["DD_HUD"],0,"thin") end
		end
	end
	if server.winner==0 drawStrCentered(v,176,mmtext[p.mmlang]["WIN"..server.winner.."_HUD"], 8388608)
	else drawStrCentered(v,176,mmtext[p.mmlang]["WINNERS_HUD"]..mmtext[p.mmlang]["WIN"..server.winner.."_HUD"], 8388608) end
	if MM.devbuild==nil v.drawString(0, 184, "WIP GAMETYPE\nv"..MM.version, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	else
		v.drawString(0,184,"WIP GAMETYPE\nv"..MM.version.."-"..MM.devbuild, V_RETURN8|V_ALLOWLOWERCASE|V_SNAPTOBOTTOM|V_SNAPTOLEFT)
		drawStrCentered(v,160,"\x82".."DEVELOPER BUILD! NOT FOR PUBLIC HOSTING!!!", V_SNAPTOTOP|V_SNAPTOBOTTOM)
	end
end

hud.add(mainHUD, "game")
hud.add(scoresHUD, "scores")
hud.add(interHUD, "intermission")