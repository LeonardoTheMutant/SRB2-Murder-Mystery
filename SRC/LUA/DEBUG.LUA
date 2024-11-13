--DEBUG.LUA
--Code by LeonardoTheMutant
--
--Murder Mystery Debug commands
--This script is executes on startup if MM.debug is set to true
--I keep this minimalistic so don't wonder why code is unreadable there

local shwdwn_music={"S2MSBS","S2GGBS","EWJ2TN","DRMBM2","STORMR","UNDYNE","SSBLSD"}

local ShiftX,ShiftY,ShiftX2,ShiftY2,sign,patchNum
COM_AddCommand("mmplayer",function(p,pnum,prole,pdead) --change player role and state to alive/dead
	if (not pnum) or (not prole)
		CONS_Printf(p,"\x87MMPLAYER\x80 [playernum] [role (nil, 0-4)] [kill?]")
		return
	end
	if (prole=="nil") players[tonumber(pnum)].mm.role=nil
	else players[tonumber(pnum)].mm.role=tonumber(prole) end
	if (pdead) MM_KillPlayerByPlayer(players[tonumber(pnum)].realmo,players[tonumber(pnum)].realmo)
	else players[tonumber(pnum)].spectator=0 end
end)
COM_AddCommand("mmexitlevel",function(p,winner,reason) --exitlevel alternative
	winner=tonumber($)
	reason=tonumber($)
	if (winner==nil)
		CONS_Printf(p,"\x87MMEXITLEVEL\x80 [winner_role] [reason (optional)]")
		CONS_Printf(p,"Possible values for [winner]:\n 0 - Tie\n 1 - Murderers\n 2 - Civilians")
		CONS_Printf(p,"Possible values for [reason]:\n 1 - Regular Murd win\n 2 - Regular Sheriff win\n 3 - Sheriff killed last Inno\n 4 - Hero killed last Inno\n 5 - \"All defenders are dead\"")
		return
	end
	if (not reason) MM_EndRound(winner,"WIN",winner)
	else MM_EndRound(winner,"WIN",reason) end
end)
COM_AddCommand("mmshremd",function(p) --Spawn Sheriff's Emerald at player's position
	MM_SpawnSHREMD(p.realmo.x,p.realmo.y,p.realmo.z,p.mm.timetravel.timezone)
end)
COM_AddCommand("mmtimewarp",function(p,direction,shift) --Warp between different time zones manually
	if (gamestate!=1) or (not valid(p.mo)) return end
	if (not direction)
		CONS_Printf(p,"\x87MMTIMEWARP\x80 [+/-] [true/false (optinal)]")
		return
	end
	if (mapheaderinfo[gamemap].timetravel_shiftx and tonumber(mapheaderinfo[gamemap].timetravel_shiftx)) ShiftX=tonumber(mapheaderinfo[gamemap].timetravel_shiftx)
	else ShiftX=0 end
	if (mapheaderinfo[gamemap].timetravel_shifty and tonumber(mapheaderinfo[gamemap].timetravel_shifty)) ShiftY=tonumber(mapheaderinfo[gamemap].timetravel_shifty)
	else ShiftY=0 end
	if (mapheaderinfo[gamemap].timetravel_shiftx2 and tonumber(mapheaderinfo[gamemap].timetravel_shiftx2)) ShiftX2=tonumber(mapheaderinfo[gamemap].timetravel_shiftx2)
	else ShiftX2=0 end
	if (mapheaderinfo[gamemap].timetravel_shifty2 and tonumber(mapheaderinfo[gamemap].timetravel_shifty2)) ShiftY2=tonumber(mapheaderinfo[gamemap].timetravel_shifty2)
	else ShiftY2=0 end
	if (direction=="-") sign=-1 else sign=1 end
	if (shift and shift!="false") P_MoveOrigin(p.mo,p.mo.x+ShiftX2*sign,p.mo.y+ShiftY2*sign,p.mo.z)
	else P_MoveOrigin(p.mo,p.mo.x+ShiftX*sign,p.mo.y+ShiftY*sign,p.mo.z) end
end)
COM_AddCommand("mmsusnce",function()
	if (not MM.susnce)
		if (mapheaderinfo[gamemap].suspensetrack) MM.shwdwn=mapheaderinfo[gamemap].suspensetrack
		else MM.susnce="SUSNCE" end
		S_ChangeMusic(MM.susnce,true)
	end
end)
COM_AddCommand("mmduel",function()
	if (not MM.shwdwn)
		if (mapheaderinfo[gamemap].showdowntrack) MM.shwdwn=mapheaderinfo[gamemap].showdowntrack
		else MM.shwdwn=shwdwn_music[P_RandomKey(#shwdwn_music)+1] end
		S_ChangeMusic(MM.shwdwn,true)
	end
end)
COM_AddCommand("mmcharset",function(p, set) --Draw all characters from the Extended ASCII character set
	if (not set) CONS_Printf(p,"\x87MMCHARSET\x80 [characterset_prefix]") end
	p.mm.debugdrawer=set
	p.mm.debugcolor=0
end)
addHook("PlayerThink",function(p) --MMCHARSET logic
	if not p.mm or not p.mm.debugdrawer return end
	if (p.cmd.buttons&BT_SPIN)
		p.mm.debugdrawer=nil
		p.mm.debugcolor=nil
	end
	if p.cmd.buttons&BT_JUMP
		if not p.mm.debugjumped
			p.mm.debugcolor=$+1
			if p.mm.debugcolor>15 p.mm.debugcolor=0 end
		end
		p.mm.debugjumped=1
	else p.mm.debugjumped=nil end
end)
hud.add(function(v, p) --MMCHARSET render
	if not p.mm.debugdrawer return end
	for row=-1, 7
		for column=-1,15
			if ((row==-1) and (column>-1)) v.drawString(16+(column<<4),0,string.format("%X",column))
			elseif ((column==-1) and (row>-1)) v.drawString(0,16+(row<<4),string.format("%X",row+8))
			elseif (column>-1) and (row>-1)
				patchNum=((row+8)<<4)+column
				if (MM.graphics.charset[p.mm.debugdrawer][patchNum]) v.draw((16 + column<<4),(16 + row<<4),MM.graphics.charset[p.mm.debugdrawer][patchNum],0,v.getStringColormap(p.mm.debugcolor<<12)) end
			end
		end
	end
	v.drawString(0,184,"Color: "..p.mm.debugcolor)
	v.drawString(0,192,"JUMP - next color, SPIN - exit")
end,"game")
