-- MAPK8 8-Ball Hotel by SuperOfSrb2 & LeonardoTheMutant

freeslot("MT_8BALL", "S_8BALL", "SPR_8BAL")

--The 8-Ball
mobjinfo[MT_8BALL] = {
    doomednum = 468,
    spawnstate = S_8BALL,
    spawnhealth = 1000,
    reactiontime = 8,
    speed = 12*FU,
    radius = 16*FU,
    height = 32*FU,
    mass = 50,
    activesound = sfx_statu2,
    flags = MF_SOLID|MF_SLIDEME|MF_PUSHABLE
}

states[S_8BALL] = {SPR_8BAL, 0, -1, nil, 0, 0, S_8BALL} -- S_RJETGLOOK1

addHook("MobjThinker", function(ball)
    if (ball) and (ball.valid)
	    if (ball.eflags & MFE_UNDERWATER) A_ZThrust(ball, 1001, 0) end
	end
end, MT_8BALL)

addHook("MapThingSpawn", function(mobj, mapthing)
    if (mapthing.options & MTF_AMBUSH) mobj.flags = $ & ~MF_PUSHABLE end
end, MT_8BALL)