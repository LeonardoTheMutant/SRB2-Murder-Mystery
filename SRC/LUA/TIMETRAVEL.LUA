-- TIMETRAVEL.LUA
-- Code by LeonardoTheMutant
--
-- Script responcible for time traveling in MM maps

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

local TimeTravel_ShiftX
local TimeTravel_ShiftY
local TimeTravel_ShiftX2
local TimeTravel_ShiftY2

local TimeTravel_Mus_P  --Music for PAST
local TimeTravel_Mus_PR --PRESENT
local TimeTravel_Mus_BF --BAD FUTURE
local TimeTravel_Mus_GF --GOOD FUTURE

addHook("MapLoad", function(map)
	--Get the lengths between different Time Zones (if map has Time Travel)
	if (mapheaderinfo[map].timetravel_shiftx) and (tonumber(mapheaderinfo[map].timetravel_shiftx))
		TimeTravel_ShiftX = tonumber(mapheaderinfo[map].timetravel_shiftx)
	else
		TimeTravel_ShiftX = 0
	end
	if (mapheaderinfo[map].timetravel_shifty) and (tonumber(mapheaderinfo[map].timetravel_shifty))
		TimeTravel_ShiftY = tonumber(mapheaderinfo[map].timetravel_shifty)
	else
		TimeTravel_ShiftY = 0
	end
	if (mapheaderinfo[map].timetravel_shiftx2) and (tonumber(mapheaderinfo[map].timetravel_shiftx2))
		TimeTravel_ShiftX2 = tonumber(mapheaderinfo[map].timetravel_shiftx2)
	else
		TimeTravel_ShiftX2 = 0
	end
	if (mapheaderinfo[map].timetravel_shifty2) and (tonumber(mapheaderinfo[map].timetravel_shifty2))
		TimeTravel_ShiftY2 = tonumber(mapheaderinfo[map].timetravel_shifty2)
	else
		TimeTravel_ShiftY2 = 0
	end
	
	--Get the name of the music lumps for each Time Zone
	if (mapheaderinfo[map].TimeTravel_Mus_P)
		TimeTravel_Mus_P = mapheaderinfo[map].TimeTravel_Mus_P
	else
		TimeTravel_Mus_P = G_BuildMapName(map).."P"
	end
	if (mapheaderinfo[map].TimeTravel_Mus_PR)
		TimeTravel_Mus_PR = mapheaderinfo[map].TimeTravel_Mus_PR
	else
		TimeTravel_Mus_PR = G_BuildMapName(map).."M"
	end
	if (mapheaderinfo[map].TimeTravel_Mus_BF)
		TimeTravel_Mus_BF = mapheaderinfo[map].TimeTravel_Mus_BF
	else
		TimeTravel_Mus_BF = G_BuildMapName(map).."B"
	end
	if (mapheaderinfo[map].TimeTravel_Mus_GF)
		TimeTravel_Mus_GF = mapheaderinfo[map].TimeTravel_Mus_GF
	else
		TimeTravel_Mus_GF = G_BuildMapName(map).."G"
	end
end)

addHook("PlayerSpawn", function(p)
	if (gametype != GT_MURDERMYSTERY) then 
		p.timetravel = nil
		return
	end
	p.timetravel = {timezone = TIMEZONE_PRESENT, timesign = TWS_NONE, warptimer = 0, warping = 0, spark = 0}
end)

addHook("PlayerThink", function(p)
	if ((gametype != GT_MURDERMYSTERY) or (not p.timetravel)) return end
	
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
						P_MoveOrigin(p.mo, p.mo.x - TimeTravel_ShiftX, p.mo.y - TimeTravel_ShiftY, p.mo.z) --5120*FU
						S_ChangeMusic(TimeTravel_Mus_PR, true)
					elseif (p.timetravel.timezone == TIMEZONE_FUTURE_GOOD) --warp from Good Future
						p.timetravel.timezone = TIMEZONE_PRESENT
						P_MoveOrigin(p.mo, p.mo.x - TimeTravel_ShiftX2, p.mo.y - TimeTravel_ShiftY2, p.mo.z) --10240*FU
						S_ChangeMusic(TimeTravel_Mus_PR, true)
					elseif (p.timetravel.timezone == TIMEZONE_PRESENT) --warp from present
						p.timetravel.timezone = TIMEZONE_PAST
						P_MoveOrigin(p.mo, p.mo.x - TimeTravel_ShiftX, p.mo.y - TimeTravel_ShiftY, p.mo.z) --5120*FU
						S_ChangeMusic(TimeTravel_Mus_P, true)
					end
				else --warping to the more Future stage
					if (p.timetravel.timezone == TIMEZONE_PAST) --warp from Past
						p.timetravel.timezone = TIMEZONE_PRESENT
						P_MoveOrigin(p.mo, p.mo.x + TimeTravel_ShiftX, p.mo.y + TimeTravel_ShiftY, p.mo.z) --5120*FU
						S_ChangeMusic(TimeTravel_Mus_PR, true)
					elseif (p.timetravel.timezone == TIMEZONE_PRESENT) --warp from Present
						if (PlayerCount(ROLE_MURDERER))
							p.timetravel.timezone = TIMEZONE_FUTURE_BAD
							P_MoveOrigin(p.mo, p.mo.x + TimeTravel_ShiftX, p.mo.y + TimeTravel_ShiftY, p.mo.z) --5120*FU
							S_ChangeMusic(TimeTravel_Mus_BF, true)
						else --You will never see the Good Future version of this level in a regular playthrough :)
							p.timetravel.timezone = TIMEZONE_FUTURE_GOOD
							P_MoveOrigin(p.mo, p.mo.x + TimeTravel_ShiftX2, p.mo.y + TimeTravel_ShiftY2, p.mo.z) --10240*FU
							S_ChangeMusic(TimeTravel_Mus_GF, true)
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
	if (gametype != GT_MURDERMYSTERY) return end
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
	if (gametype != GT_MURDERMYSTERY) return end
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