-- MAPK8 8-Ball Hotel by SuperOfSrb2 & LeonardoTheMutant

freeslot("MT_8BALL", "S_8BALL", "SPR_8BAL")

--The 8-Ball
mobjinfo[MT_8BALL] = {
    --$Title 8-Ball
    --$Sprite 8BALA0
    --$Flags8Text Static?
    --$Arg0 Static?
    --$Arg0Type 11
    --$Arg0Enum {0="False"; 2="True";}
    --$NotAngled
    doomednum = 468,
    spawnstate = S_8BALL,
    speed = 786432, --12*FU
    radius = 1048576, --16*FU
    height = 2097152, --32*FU
    activesound = sfx_statu2,
    flags = MF_SOLID|MF_SLIDEME|MF_PUSHABLE
}

states[S_8BALL] = {SPR_8BAL, 0, -1, nil, 0, 0, S_8BALL} -- S_RJETGLOOK1

addHook("MapThingSpawn", function(mobj, mapthing)
    if (mapthing.options & MTF_AMBUSH) mobj.flags = $ & ~MF_PUSHABLE end
end, MT_8BALL)