--Space Mesa (MAPK7)
--Level script
--Map & code by LeonardoTheMutant

local doors={
    { --1st door
        0, --timer
        24 --close tag
    },
    { --2nd door
        0,
        26
    },
    { --3rd door
        0,
        28
    }
}
local doordelay=35

addHook("LinedefExecute", function() --open door 1 trigger
    P_LinedefExecute(23)
    doors[1][1] = doordelay
end,"K7D1OPN")

addHook("LinedefExecute", function() --open door 2 trigger
    P_LinedefExecute(25)
    doors[2][1] = doordelay
end,"K7D2OPN")

addHook("LinedefExecute", function() --open door 3 trigger
    P_LinedefExecute(27)
    doors[3][1] = doordelay
end,"K7D3OPN")

addHook("ThinkFrame", function()
    if (gamemap ~= 467) then return end

	--doors close timer
    for doornum, _ in pairs(doors) do
        if (not doors[doornum][1]) then P_LinedefExecute(doors[doornum][2]) --close one of the doors
        else doors[doornum][1] = doors[doornum][1] - 1 end --decrement the timer
    end
end)
