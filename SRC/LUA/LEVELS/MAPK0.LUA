freeslot("sfx_doropn", "sfx_dorcls")
sfxinfo[sfx_doropn].caption="Door open"
sfxinfo[sfx_dorcls].caption="Door close"

local doorstate=1

addHook("LinedefExecute",do
    if (doorstate) and (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(49)
        doorstate=0
    end
end,"K0LOWDR")
addHook("LinedefExecute",do
    if (not doorstate) and (gametype==GT_MURDERMYSTERY)
        P_LinedefExecute(48)
        doorstate=1
    end
end,"K0HIGDR")