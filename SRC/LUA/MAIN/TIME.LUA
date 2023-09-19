-- TIME.LUA
-- Code by LeonardoTheMutant
--
-- A replacement script for SRB2's built-in TIMELIMIT (original sucks)

addHook("MapLoad", function(map)
    if gametype==GT_MURDERMYSTERY
        MM.timelimit = tonumber(mapheaderinfo[map].mm_timelimit) or 5
        print("Time limit for this map is "..MM.timelimit.." minutes")
    else return end
end)

addHook("ThinkFrame", function()
    if (gametype==GT_MURDERMYSTERY) and (leveltime >= (MM.timelimit*2100)-1)
        G_ExitLevel()
    end
end)