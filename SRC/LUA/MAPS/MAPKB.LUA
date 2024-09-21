--Myst Island (MAPKB)
--Level script
--Original map idea by Cyan Inc.
--SRB2 map port & code by LeonardoTheMutant

local doors = {
    { --Holographic room door
        0,   --timer
        126, --Closing linedef executor tag
    },
    { --Selentic Age generator room door
        0, --timer
        25 --Closing linedef executor tag
    },
    { --Selentic Age Spaceship door
        0, --timer
        136 --Closing linedef executor tag
    }
}
local doordelay=280 --TICRATE*8
local towerlift = {
    0, --timer
    0  --state (0=low, 1=high)
}

addHook("LinedefExecute", do --Hologram room trigger
    P_LinedefExecute(125)
    doors[1][1] = doordelay
end,"KBHOLOPN")

addHook("LinedefExecute", do --Generator room trigger
    P_LinedefExecute(26)
    doors[2][1] = doordelay >> 1
end,"KBGENOPN")

addHook("LinedefExecute", do --Spaceship trigger
    P_LinedefExecute(135)
    doors[3][1] = doordelay >> 1
end,"KBSPCOPN")

addHook("LinedefExecute", do --Tower lift trigger
    if (not towerlift[1])
        if (towerlift[2]) then --lower the lift
            P_LinedefExecute(60)
            towerlift[2] = 0
        else --raise the lift
            P_LinedefExecute(59)
            towerlift[2] = 1
        end
        towerlift[1] = doordelay
    end
end,"KBTOWER")

addHook("ThinkFrame", do
    if (gamemap != 471) return end

    --Doors close timer
    for doornum, _ in pairs(doors) do
        if (not doors[doornum][1]) P_LinedefExecute(doors[doornum][2]) --close one of the doors
        else doors[doornum][1] = $ - 1 end --decrement the timer
    end

    --lift timer
    if (towerlift[1]) then towerlift[1] = $ - 1 end
end)
