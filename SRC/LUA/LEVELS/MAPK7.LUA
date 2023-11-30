-- (MAPK7)
--Level script
--Map & code by LeonardoTheMutant

local doortimers={
    0, --1st door
    0, --2nd
    0 --3rd
}
local doordelay=35

local truthTextures = {
    4049, --"~035", red
    4166, --"~152", blue
    4126, --"~112", green
    4086  --"~072", yellow
}

addHook("LinedefExecute", function(l,mo) --open door 1 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(23)
        doortimers[1]=doordelay
    end
end,"K7DR1OPN")
addHook("LinedefExecute", function(l,mo) --open door 2 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(25)
        doortimers[2]=doordelay
    end
end,"K7DR2OPN")
addHook("LinedefExecute", function(l,mo) --open door 3 trigger
    if (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(27)
        doortimers[3]=doordelay
    end
end,"K7DR3OPN")

addHook("LinedefExecute", function(l,mo,s) --the truth ray
    if (gametype==GT_MURDERMYSTERY)
        for line=1,#s.lines do
            if (s.lines[line].tag == 36)
                s.lines[line].frontside.midtexture = truthTextures[(mo.player.rings % 4)+1] --I know, bad formula
                return
            end
        end
    end
end,"K7_TRUTH")

addHook("ThinkFrame", do --close timer
    if (gametype!=GT_MURDERMYSTERY) or (gamemap!=467) return end
    for doornum,doortimer in pairs(doortimers)
        if (doortimer==0) P_LinedefExecute(22+doornum*2) --close one of the doors
        else doortimers[doornum]=$-1 end
    end
end)