-- MAPK8 8-Ball Hotel by SuperOfSrb2

--Item Socs 
freeslot("MT_8BALL", "S_8BALL", "SPR_8BAL")

--The 8-Ball in question
--had to learn how to freeslot in lua just now because game loads lua before soc so there might be errors
mobjinfo[MT_8BALL] = {
    doomednum = 468,
    spawnstate = S_8BALL,
    spawnhealth = 1000,
    reactiontime = 8,
    speed = 12*FU,
    radius = 56*FU,
    height = 112*FU,
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
    if (mapthing.options & MTF_AMBUSH) mobj.flags = $ & ~MF_PUSHABLE
    elseif (mapthing.options & MTF_EXTRA) mobj.scale=FU/5 end
end, MT_8BALL)