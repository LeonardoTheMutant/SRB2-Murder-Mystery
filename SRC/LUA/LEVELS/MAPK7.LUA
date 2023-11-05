-- (MAPK7)
--Level script
--Map & code by LeonardoTheMutant

local doortimers={
    0, --1st door
    0, --2nd
    0 --3rd
}
local doordelay=35

addHook("LinedefExecute", function(l,mo) --open door 1 trigger
    if (gametype==GT_MURDERMYSTERY) and (mo.type==MT_PLAYER)
        P_LinedefExecute(23)
        doortimers[1]=doordelay
    end
end,"K7DR1OPN")
addHook("LinedefExecute", function(l,mo) --open door 2 trigger
    if (gametype==GT_MURDERMYSTERY) and (mo.type==MT_PLAYER)
        P_LinedefExecute(25)
        doortimers[2]=doordelay
    end
end,"K7DR2OPN")
addHook("LinedefExecute", function(l,mo) --open door 3 trigger
    if (gametype==GT_MURDERMYSTERY) and (mo.type==MT_PLAYER)
        P_LinedefExecute(27)
        doortimers[3]=doordelay
    end
end,"K7DR3OPN")

addHook("ThinkFrame", do --close timer
    if (gametype!=GT_MURDERMYSTERY) or (gamemap!=467) return end
    for doornum,doortimer in pairs(doortimers)
        if (doortimer==0) P_LinedefExecute(22+doornum*2) --close one of the doors
        else doortimers[doornum]=$-1 end
    end
end)