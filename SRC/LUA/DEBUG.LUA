-- DEBUG.LUA
-- Code by LeonardoTheMutant
--
-- Murder Mystery Debug commands
-- This script is executes on startup if MM.devbuild is set to true

if (MM.devbuild)
	--change player's role (and state to alive/dead)
    COM_AddCommand("mmplayer", function(p, pnum, prole, pdead, killby)
		if (not pnum) or (not prole)
			CONS_Printf(p, "\x87MMPLAYER\x80 [playernum] [role (nil, 0-4)] [dead (0/1)] [killedby (optional)]")
			return
		end
		if (prole=="nil") players[tonumber(pnum)].role=nil
		else players[tonumber(pnum)].role=tonumber(prole) end
		if (pdead=="1") MM_KillPlayerByPlayer(players[tonumber(pnum)].realmo, players[tonumber(pnum)].realmo)
		else players[tonumber(pnum)].spectator=false end
		if (killby) players[tonumber(pnum)].killedby=killby end
    end)
    --Show nodes and their role with state
    COM_AddCommand("mmnodes", do
		for p in players.iterate print(p.name..": "..tostring(p.role)..", "..tostring(p.spectator)) end
    end)
    --exitlevel alternative
    COM_AddCommand("mmexitlevel", function(p, winner, reason)
		winner = tonumber($)
		reason = tonumber($)
		if (winner==nil)
			CONS_Printf(p, "\x87MMEXITLEVEL\x80 [winner_role] [reason (optional)]")
			CONS_Printf(p, "Possible values for [winner]:\n 0 - Tie\n 1 - Murderers\n 2 - Civilians")
			CONS_Printf(p, "Possible values for [reason]:\n 1 - Regular Murd win\n 2 - Regular Sheriff win\n 3 - Sheriff killed last Inno\n 4 - Hero killed last Inno\n 5 - \"All defenders are dead\"")
			return
		end
		if (not reason) MM_EndRound(winner, "WIN", winner)
		else MM_EndRound(winner, "WIN", reason) end
    end)
    --Spawn Sheriff's Emerald at player's position
    COM_AddCommand("mmshreml", function(p)
		MM_SpawnSHREML(p.realmo.x, p.realmo.y, p.realmo.z)
    end)

	--Draw all characters from the Extended ASCII character set
    COM_AddCommand("mmcharset", function(p, set)
		if (not set) CONS_Printf(p, "\x87MMCHARSET\x80 [characterset_prefix]") end
		p.debugdrawer=set
		p.debugcolor=0
	end)

	local function num2hex(int)
		if (int<10) return int
		elseif (int==10) return "A"
		elseif (int==11) return "B"
		elseif (int==12) return "C"
		elseif (int==13) return "D"
		elseif (int==14) return "E"
		elseif (int==15) return "F"
		end
	end

	addHook("PlayerThink", function(p)
		if (not p.debugdrawer) return end
		if (p.cmd.buttons&BT_SPIN)
			p.debugdrawer = nil
			p.debugcolor = nil
		end
		if (p.cmd.buttons&BT_JUMP)
			if (not p.debugjumped)
				p.debugcolor=$+1
				if (p.debugcolor>15) p.debugcolor=0 end
			end
			p.debugjumped=1
		else p.debugjumped=nil end
	end)

	hud.add(function(v, p)
		if (not p.debugdrawer) return end
		local patchNum
		local patchName
		for row=-1, 7 do
			for column=-1,15  do
				if (row==-1) and (column>-1) v.drawString(16+(column*16),0,num2hex(column))
				elseif ((column==-1) and (row>-1)) v.drawString(0,16+(row*16),num2hex(row+8))
				elseif ((column>-1) and (row>-1))
					patchNum=((row+8)*16)+column
					if (patchNum<10) patchName="00"..patchNum
					elseif (patchNum<100) patchName="0"..patchNum
					else patchName=patchNum end
					if (v.patchExists(p.debugdrawer..patchName)) v.draw((16 + column*16),(16 + row*16),v.cachePatch(p.debugdrawer..patchName),0,v.getStringColormap(p.debugcolor*4096)) end
				end
			end
		end
		v.drawString(0,184,"Color: "..p.debugcolor)
		v.drawString(0,192,"JUMP to change color, SPIN to exit")
	end, "game")
end
