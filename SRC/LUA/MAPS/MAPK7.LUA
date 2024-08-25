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

local truthTextures = {
    4166, --"~152", blue
    4126, --"~112", green
    4086, --"~072", yellow
    4049  --"~035", red
}
local rayTimer
local rayControlLine

addHook("LinedefExecute", do --open door 1 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(23)
        doors[1][1] = doordelay
    end
end,"K7D1OPN")

addHook("LinedefExecute", do --open door 2 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(25)
        doors[2][1] = doordelay
    end
end,"K7D2OPN")

addHook("LinedefExecute", do --open door 3 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(27)
        doors[3][1] = doordelay
    end
end,"K7D3OPN")

--the Truth Ray
addHook("LinedefExecute", function(l,mo,s)
    if (gametype == GT_MURDERMYSTERY)
        --find the control linedef of the ray
        if (not rayControlLine)
            for line = 1, #s.lines
                if (s.lines[line].tag == 36)
                    rayControlLine = s.lines[line]
                    break
                end
            end
        end
        --now edit the texture of the ray to represent the kill count
        if valid(rayControlLine) rayControlLine.frontside.midtexture = truthTextures[(mo.player.kills % 4) + 1] end
        rayTimer = 35
    end
end,"K7_TRUTH")
addHook("ThinkFrame", do
    if (gametype!=GT_MURDERMYSTERY) or (gamemap != 467) return end

	--doors close timer
    for doornum, _ in pairs(doors)
        if (not doors[doornum][1]) then P_LinedefExecute(doors[doornum][2]) --close one of the doors, if the timer ran out AND it is 100% open (not in open/close animation)
        else doors[doornum][1] = $ - 1 end
    end

	--The Truth Ray reset
    if valid(rayControlLine)
        if (not rayTimer) rayControlLine.frontside.midtexture = 4029 --"~015", gray
        else rayTimer = $ - 1 end
    end
end)
