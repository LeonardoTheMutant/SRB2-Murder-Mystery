--Myst Island (MAPKB)
--Level script
--Original map idea by Cyan Inc.
--SRB2 map port & code by LeonardoTheMutant

local door={ --Selentic Age generator room door
    0, --timer
    25 --Linedef executor tag (to close)
}
local doordelay=280 --TICRATE*8
local towerlift={
    0, --timer
    0  --state (0=low, 1=high)
}

addHook("LinedefExecute", function(l,mo) --Generator room trigger
    P_LinedefExecute(26)
    door[1] = doordelay
end,"KBGENOPN")

addHook("LinedefExecute", function(l,mo) --Tower lift trigger
    if (not towerlift[1])
        if (towerlift[2]) then
            P_LinedefExecute(60)
            towerlift[2] = 0
        else
            P_LinedefExecute(59)
            towerlift[2] = 1
        end
        towerlift[1] = doordelay
    end
end,"KBTOWER")

addHook("ThinkFrame", do
    if (gamemap!=471) return end

    --door close timer
    if (not door[1]) P_LinedefExecute(door[2]) --close the door
    else door[1] = $ - 1 end

    --lift timer
    if (towerlift[1]) then towerlift[1] = $ - 1 end
end)
