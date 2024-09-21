--Adandoned Shelter (MAPK0)
--Level script
--Map & code by LeonardoTheMutant

local doorheight
sfxinfo[sfx_doora1].caption = "Sliding close" --too add more sense

addHook("ThinkFrame", function(m) --finding the Eggman's Room door
    if (gamemap != 460) or (doorsector) return end
    doorheight = sectors.tagged(44)[1].ceilingheight
end)

addHook("LinedefExecute", do
    if (doorheight) and (doorheight == -22544384) -- -344 map units
        P_LinedefExecute(49)
    end
end,"K0LOWDR")
addHook("LinedefExecute", do
    if (doorheight) and (doorheight == -33554432) -- -512 map units
        P_LinedefExecute(48)
    end
end,"K0HIGDR")