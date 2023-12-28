-- DEBUG.LUA
-- Code by LeonardoTheMutant
--
-- Murder Mystery Debug commands
-- This script is executed on startup if MM.devbuild is true

if (MM.devbuild)
	--change player's role (and state to alive/dead)
    COM_AddCommand("mmplayer", function(p, pnum, prole, pdead, killby)
    	if (not pnum) or (not prole) or (not pdead)
    		CONS_Printf(p, "\x87MMPLAYER\x80 [playernum] [role] [dead (0/1)] [killedby (optional)]")
    		return
    	end
    	if (prole=="nil") players[tonumber(pnum)].role=nil
    	else players[tonumber(pnum)].role=tonumber(prole) end
    	if (pdead=="1") MM_KillPlayer(players[tonumber(pnum)].realmo, players[tonumber(pnum)].realmo)
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
end