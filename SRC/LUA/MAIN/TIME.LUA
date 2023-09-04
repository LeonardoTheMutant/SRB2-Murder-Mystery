-- TIME.LUA
-- Code by LeonardoTheMutant
--
-- A replacement script for SRB2's built-in TIMELIMIT (original sucks)

addHook("MapLoad", function(map)
    if gametype==GT_MURDERMYSTERY
        MurderMystery.timelimit = tonumber(mapheaderinfo[map].mm_timelimit) or 5
        print(MurderMystery.timelimit)
    else return end
end)

addHook("ThinkFrame", function()
    if (gametype==GT_MURDERMYSTERY) and (leveltime >= (MurderMystery.timelimit*60*TICRATE)-1)
        G_ExitLevel()
    end
end)