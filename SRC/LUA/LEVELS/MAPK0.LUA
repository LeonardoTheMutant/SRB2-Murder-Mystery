--Adandoned Shelter (MAPK0)
--Level script
--Map & code by LeonardoTheMutant

freeslot("sfx_doropn", "sfx_dorcls")
sfxinfo[sfx_doropn].caption="Door open"
sfxinfo[sfx_dorcls].caption="Door close"

local doorsector

addHook("MapLoad", function(m) --finding the Eggman's Room door
    if (gametype!=GT_MURDERMYSTERY) or (m != 460) or (doorsector) return end
    for ID = 1, #sectors do
        if (sectors[ID].tag == 44)
            doorsector = sectors[ID]
            return
        end
    end
end)

addHook("LinedefExecute", do
    if ((gametype==GT_MURDERMYSTERY) and (doorsector) and (doorsector.ceilingheight == -22544384)) -- -344 map units
        P_LinedefExecute(49)
    end
end,"K0LOWDR")
addHook("LinedefExecute", do
    if ((gametype==GT_MURDERMYSTERY) and (doorsector) and (doorsector.ceilingheight == -33554432)) -- -512 map units
        P_LinedefExecute(48)
    end
end,"K0HIGDR")