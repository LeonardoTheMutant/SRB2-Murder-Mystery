--East City (MAPKD)
--Level script
--Map & code by LeonardoTheMutant

--freeslots
freeslot("MT_TIMESIGN_P", "MT_TIMESIGN_F", "SPR_TMSN", "S_TIMESIGN_P", "S_TIMESIGN_F", "S_TIMESIGN_SPIN")

mobjinfo[MT_TIMESIGN_P]={
	doomednum = 36,
	spawnstate = S_TIMESIGN_P,
	radius = 2097152, --32*FU
	height = 4194304, --64*FU
}
mobjinfo[MT_TIMESIGN_F]={
	doomednum = 37,
	spawnstate = S_TIMESIGN_F,
	radius = 2097152, --32*FU
	height = 4194304, --64*FU
}
states[S_TIMESIGN_P] = {
	sprite = SPR_TMSN,
	frame = A,
	tics = -1,
	nextstate = S_TIMESIGN_P
}
states[S_TIMESIGN_F] = {
	sprite = SPR_TMSN,
	frame = B,
	tics = -1,
	nextstate = S_TIMESIGN_F
	
}
states[S_TIMESIGN_SPIN] = {
	sprite = SPR_TMSN,
	frame = C,
	tics = -1,
	nextstate = S_TIMESIGN_SPIN
}

--Time Zone constants
rawset(_G, "TIMEZONE_NONE", 0)
rawset(_G, "TIMEZONE_PAST", 1)
rawset(_G, "TIMEZONE_PRESENT", 2)
rawset(_G, "TIMEZONE_FUTURE_BAD", 3)
rawset(_G, "TIMEZONE_FUTURE_GOOD", 4)

--Time Warp Sign values
rawset(_G, "TWS_NONE", 0)
rawset(_G, "TWS_PAST", 1)
rawset(_G, "TWS_FUTURE", 2)

addHook("PlayerSpawn", function(p)
	if ((gametype != GT_MURDERMYSTERY) or (gamemap != 473)) then 
		p.timetravel = nil
		return
	end
	p.timetravel = {timezone = TIMEZONE_PRESENT, timesign = TWS_NONE, warptimer = 0, warping = 0, spark = 0}
end)

addHook("PlayerThink", function(p)
	if ((gametype != GT_MURDERMYSTERY) or (gamemap != 473) or (not p.timetravel)) return end
	
	if (p.timetravel.timesign)
		if (p.speed >= 2949120) --45*FU
			p.timetravel.warptimer = $ + 1
			P_SpawnMobjFromMobj(p.mo,0,0,0,MT_SUPERSPARK) --Time Warp trail
			--if you move fast for 2 seconds and more you enter the warping substate
			if (p.timetravel.warptimer >= 70)
				p.timetravel.warping = $ + 1
			end
			
			--Time Warp itself
			if ((p.timetravel.warping >= 70))
				if (p.timetravel.timesign == TWS_PAST) --warping to the more Past stage
					if (p.timetravel.timezone == TIMEZONE_FUTURE_BAD) --warp from Bad Future
						p.timetravel.timezone = TIMEZONE_PRESENT
						P_MoveOrigin(p.mo, p.mo.x - 335544320, p.mo.y, p.mo.z) --5120*FU
						S_ChangeMusic("MAPKDM", true)
					elseif (p.timetravel.timezone == TIMEZONE_FUTURE_GOOD) --warp from Good Future
						p.timetravel.timezone = TIMEZONE_PRESENT
						P_MoveOrigin(p.mo, p.mo.x - 671088640, p.mo.y, p.mo.z) --10240*FU
						S_ChangeMusic("MAPKDM", true)
					elseif (p.timetravel.timezone == TIMEZONE_PRESENT) --warp from present
						p.timetravel.timezone = TIMEZONE_PAST
						P_MoveOrigin(p.mo, p.mo.x - 335544320, p.mo.y, p.mo.z) --5120*FU
						S_ChangeMusic("MAPKDP", true)
					end
				else --warping to the more Future stage
					if (p.timetravel.timezone == TIMEZONE_PAST) --warp from Past
						p.timetravel.timezone = TIMEZONE_PRESENT
						P_MoveOrigin(p.mo, p.mo.x + 335544320, p.mo.y, p.mo.z) --5120*FU
						S_ChangeMusic("MAPKDM", true)
					elseif (p.timetravel.timezone == TIMEZONE_PRESENT) --warp from Present
						if (PlayerCount(ROLE_MURDERER))
							p.timetravel.timezone = TIMEZONE_FUTURE_BAD
							P_MoveOrigin(p.mo, p.mo.x + 335544320, p.mo.y, p.mo.z) --5120*FU
							S_ChangeMusic("MAPKDB", true)
						else --You will never see the Good Future version of this level in a regular playthrough :)
							p.timetravel.timezone = TIMEZONE_FUTURE_GOOD
							P_MoveOrigin(p.mo, p.mo.x + 671088640, p.mo.y, p.mo.z) --10240*FU
							S_ChangeMusic("MAPKDG", true)
						end
					end
				end
				p.timetravel.spark = 1
				--P_SpawnMobjFromMobj(p.mo,0,0,0,MT_THROWNEXPLOSION) --blast after a time warp (visual effect)
				S_StartSound(p.mo, sfx_mixup, p)
				p.timetravel.timesign = TWS_NONE
				p.timetravel.warptimer = 0
				p.timetravel.warping = 0
			end
		else
			p.timetravel.warptimer = 0
			--if you lost speed while being in warping substate you lose your "Warp Ticket"
			if (p.timetravel.warping)
				p.timetravel.timesign = TWS_NONE
				p.timetravel.warping = 0
			end
		end
	end
	
	--reduce spark level after time warp
	if (p.timetravel.spark and (leveltime % 8 == 0))
		p.timetravel.spark = $ + 1
		if (p.timetravel.spark >= 10) p.timetravel.spark = 0 end
	end
end)

--
-- TIME WARP SIGN OBJECTS
--
--Past
addHook("MobjThinker", function(mo)
	if ((gametype != GT_MURDERMYSTERY) or (gamemap != 473)) return end
	searchBlockmap("objects", function(ref, found)
		if (found) and (found.player) and (found.player.timetravel.timesign != TWS_PAST) and (P_AproxDistance(found.x - ref.x, found.y - ref.y) < 4194304) and (P_AproxDistance(found.z - ref.z, 0) < 4194304) --64*FU, 64*FU
			found.player.timetravel.timesign = TWS_PAST
			S_StartSound(found.player.mo, sfx_cdpcm1, found.player)
			ref.spinning = 1
		end
	end, mo)
	
	if (mo.spinning)
	end
end, MT_TIMESIGN_P)

--Future
addHook("MobjThinker", function(mo)
	if ((gametype != GT_MURDERMYSTERY) or (gamemap != 473)) return end
	searchBlockmap("objects", function(ref, found)
		if (found) and (found.player) and (found.player.timetravel.timesign != TWS_FUTURE) and (P_AproxDistance(found.x - ref.x, found.y - ref.y) < 4194304) and (P_AproxDistance(found.z - ref.z, 0) < 4194304) --64*FU, 64*FU
			found.player.timetravel.timesign = TWS_FUTURE
			S_StartSound(found.player.mo, sfx_cdpcm0, found.player)
			ref.spinning = 1
		end
	end, mo)
	
	if (mo.spinning)
	end
end, MT_TIMESIGN_F)