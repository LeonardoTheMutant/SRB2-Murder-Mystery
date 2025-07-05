--DEBUG.LUA
--Code by LeonardoTheMutant
--
--Murder Mystery Debug commands
--This script is executed on startup if MM.debug is set to true
--I keep this minimalistic so don't wonder why code is unreadable and unstable here

local ShiftX,ShiftY,ShiftX2,ShiftY2,sign,patchNum
COM_AddCommand("mmplayer",function(p,pnum,prole,pdead) --change player role and state to alive/dead
	if (not pnum) or (not prole) CONS_Printf(p,"\x87MMPLAYER\x80 [playernum] [role (nil, 0-4)] [kill?]"); return end
	if (prole=="nil") players[tonumber(pnum)].mm.role=nil else players[tonumber(pnum)].mm.role=tonumber(prole) end
	if (pdead) MM.KillPlayerByPlayer(players[tonumber(pnum)].realmo,players[tonumber(pnum)].realmo)
	else players[tonumber(pnum)].spectator=0; players[tonumber(pnum)].pflags=$&~PF_GODMODE; players[tonumber(pnum)].mm.finished=false end
end)
COM_AddCommand("mmexitlevel",function(p,winner,reason) --exitlevel alternative
	winner=tonumber($); reason=tonumber($)
	if (winner==nil)
		CONS_Printf(p,"\x87MMEXITLEVEL\x80 [winner_role] [reason (optional)]")
		CONS_Printf(p,"Possible values for [winner]:\n 0 - Tie\n 1 - Murderers\n 2 - Civilians")
		CONS_Printf(p,"Possible values for [reason]:\n 1 - Regular Murd win\n 2 - Regular Sheriff win\n 3 - Sheriff killed last Inno\n 4 - Hero killed last Inno\n 5 - \"All defenders are dead\"")
		return
	end
	if (not reason) MM.EndRound(winner,"WIN",winner) else MM.EndRound(winner,"WIN",reason) end
end)
COM_AddCommand("mmshremd",function(p) --Spawn Sheriff's Emerald at player's position
	MM.SpawnSHREMD(p.realmo.x,p.realmo.y,p.realmo.z,p.mm.timetravel.timezone)
end)
COM_AddCommand("mmtimewarp",function(p,direction,shift) --Warp between different time zones manually
	if (gamestate!=1) or (not valid(p.mo)) return end
	if (not direction) CONS_Printf(p,"\x87MMTIMEWARP\x80 [+/-] [true/false (optinal)]"); return end
	if (mapheaderinfo[gamemap].mm_timetravel_shiftx and tonumber(mapheaderinfo[gamemap].mm_timetravel_shiftx)) ShiftX=tonumber(mapheaderinfo[gamemap].mm_timetravel_shiftx) else ShiftX=0 end
	if (mapheaderinfo[gamemap].mm_timetravel_shifty and tonumber(mapheaderinfo[gamemap].mm_timetravel_shifty)) ShiftY=tonumber(mapheaderinfo[gamemap].mm_timetravel_shifty) else ShiftY=0 end
	if (mapheaderinfo[gamemap].mm_timetravel_shiftx2 and tonumber(mapheaderinfo[gamemap].mm_timetravel_shiftx2)) ShiftX2=tonumber(mapheaderinfo[gamemap].mm_timetravel_shiftx2) else ShiftX2=0 end
	if (mapheaderinfo[gamemap].mm_timetravel_shifty2 and tonumber(mapheaderinfo[gamemap].mm_timetravel_shifty2)) ShiftY2=tonumber(mapheaderinfo[gamemap].mm_timetravel_shifty2) else ShiftY2=0 end
	if (direction=="-") sign=-1 else sign=1 end
	if (shift and shift!="false") P_MoveOrigin(p.mo,p.mo.x+ShiftX2*sign,p.mo.y+ShiftY2*sign,p.mo.z) else P_MoveOrigin(p.mo,p.mo.x+ShiftX*sign,p.mo.y+ShiftY*sign,p.mo.z) end
end)
COM_AddCommand("mmsusnse",do
	if (mapheaderinfo[gamemap].mm_suspensetrack) MM.susnse=mapheaderinfo[gamemap].mm_suspensetrack
	else if (#MM.susnse_music) MM.susnse=MM.susnse_music[P_RandomKey(#MM.susnse_music)+1] end end
	if (MM.susnse and S_MusicExists(MM.susnse)) S_ChangeMusic(MM.susnse, true) end
end)
COM_AddCommand("mmduel",do
	if (mapheaderinfo[gamemap].mm_showdowntrack) MM.shwdwn=mapheaderinfo[gamemap].mm_showdowntrack
	else if (#MM.shwdwn_music) MM.shwdwn=MM.shwdwn_music[P_RandomKey(#MM.shwdwn_music)+1] end end
	if (MM.shwdwn and S_MusicExists(MM.shwdwn)) S_ChangeMusic(MM.shwdwn, true) end
end)
COM_AddCommand("mmloadmus",do
	MM.LoadSuspenseTracks()
	printf("\x82%d %s",#MM.susnse_music,"Suspense Tracks")
	MM.LoadShowdownTracks()
	printf("\x82%d %s",#MM.shwdwn_music,"Showdown Tracks")
end)
--MMCHARSET: Draw Unicode characters
local mmcharset={0,0,0}
COM_AddCommand("mmcharset",function(p, r)
	mmcharset[1]=1; mmcharset[2]=0
	if tonumber(r) mmcharset[3]=tonumber(r) end
	MM.hud.game.active=false
end)
addHook("PlayerThink",function(p) --MMCHARSET logic
	if not p.mm or not mmcharset[1] return end
	if (p.cmd.buttons&BT_SPIN) mmcharset[1]=0; mmcharset[2]=0; MM.hud.game.active=true end
	if (p.cmd.buttons&BT_JUMP and not (p.lastbuttons&BT_JUMP)) mmcharset[2]=$+1; if (mmcharset[2]>15) mmcharset[2]=0 end end
end)
hud.add(function(v, p) --MMCHARSET render
	if (not p.mm or not mmcharset[1]) return end
	for row=-1, 20
		for column=-1,15
			if ((row==-1) and (column>-1)) v.drawString(24+(column<<3),0,string.format("%X",column))
			elseif ((column==-1) and (row>-1)) v.drawString(0,16+(row<<3),string.format("%02X",row))
			elseif (column>-1) and (row>-1)
				patchNum=mmcharset[3]+((row)<<4)+column
				if (MM.graphics.unicode[patchNum]) v.draw((24+column<<3),(16+row<<3),MM.graphics.unicode[patchNum],0,v.getStringColormap(mmcharset[2]<<12)) end
			end
		end
	end
	for row=20, 41
		for column=-1,15
			if ((row==20) and (column>-1)) v.drawString(192+(column<<3),0,string.format("%X",column))
			elseif ((column==-1) and (row>20)) v.drawString(160,-152+(row<<3),string.format("%02X",row))
			elseif (column>-1) and (row>20)
				patchNum=mmcharset[3]+((row)<<4)+column
				if (MM.graphics.unicode[patchNum]) v.draw((192+column<<3),(-152+row<<3),MM.graphics.unicode[patchNum],0,v.getStringColormap(mmcharset[2]<<12)) end
			end
		end
	end
	v.drawString(0,184,"Color: "..mmcharset[2]); v.drawString(0,192,"JUMP - next color, SPIN - exit")
end,"game")
