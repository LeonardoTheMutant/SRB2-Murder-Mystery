--Adandoned Shelter (MAPK0)
--Level script
--Map & code by LeonardoTheMutant

freeslot("sfx_doropn", "sfx_dorcls")
sfxinfo[sfx_doropn].caption="Door open"
sfxinfo[sfx_dorcls].caption="Door close"

local doorheight

addHook("ThinkFrame", function(m) --finding the Eggman's Room door
    if (gametype != GT_MURDERMYSTERY) or (gamemap != 460) or (doorsector) return end
    doorheight = sectors.tagged(44)[1].ceilingheight
end)

addHook("LinedefExecute", do
    if ((gametype == GT_MURDERMYSTERY) and (doorheight) and (doorheight == -22544384)) -- -344 map units
        P_LinedefExecute(49)
    end
end,"K0LOWDR")
addHook("LinedefExecute", do
    if ((gametype == GT_MURDERMYSTERY) and (doorheight) and (doorheight == -33554432)) -- -512 map units
        P_LinedefExecute(48)
    end
end,"K0HIGDR")