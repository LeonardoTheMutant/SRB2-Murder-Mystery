-- FOOTSTEPS.LUA
--
-- Original fork of the Modern Sonic's footstep engine available at:
-- https://mb.srb2.org/addons/footsteps.1378/
--
-- Modified by LeonardoTheMutant for LTM's Murder Mystery

local footmarksCVAR = CV_FindVar("mm_footmarks")
local killtrailCVAR = CV_FindVar("mm_killtrails")

freeslot(
	"sfx_sowoln", "sfx_socoln", "sfx_sodiln", "sfx_someln", "sfx_sogrln", "sfx_sowaln", "sfx_soglln", "sfx_sosnln", "sfx_sosaln", "sfx_soclln",
	"sfx_sowobr", "sfx_socobr", "sfx_sodibr", "sfx_somebr", "sfx_sogrbr", "sfx_sowabr", "sfx_soglbr",
	"sfx_soco1", "sfx_soco2", "sfx_soco3", "sfx_soco4",
	"sfx_sodi1", "sfx_sodi2", "sfx_sodi3", "sfx_sodi4",
	"sfx_sogl1", "sfx_sogl2", "sfx_sogl3",
	"sfx_sogr1", "sfx_sogr2", "sfx_sogr3", "sfx_sogr4",
	"sfx_some1", "sfx_some2", "sfx_some3", "sfx_some4",
	"sfx_sowa1", "sfx_sowa2", "sfx_sowa3", "sfx_sowa4",
	"sfx_sowo1", "sfx_sowo2", "sfx_sowo3", "sfx_sowo4",
	"sfx_sosn1", "sfx_sosn2", "sfx_sosn3", "sfx_sosn4",
	"sfx_sosa1", "sfx_sosa2", "sfx_sosa3", "sfx_sosa4",
	"sfx_socl1", "sfx_socl2", "sfx_socl3", "sfx_socl4"
)

sfxinfo[sfx_sowoln].caption="Wood landing"
sfxinfo[sfx_socoln].caption="Solid landing"
sfxinfo[sfx_sodiln].caption="Ground landing"
sfxinfo[sfx_someln].caption="Metal landing"
sfxinfo[sfx_sogrln].caption="Grass landing"
sfxinfo[sfx_sowaln].caption="Liquid landing"
sfxinfo[sfx_soglln].caption="Glass landing"
sfxinfo[sfx_sosnln].caption="Snow landing"
sfxinfo[sfx_soclln].caption="Cloth landing"

sfxinfo[sfx_sowobr].caption="Wood skidding"
sfxinfo[sfx_socobr].caption="Solid skidding"
sfxinfo[sfx_sodibr].caption="Ground Skidding"
sfxinfo[sfx_somebr].caption="Metal skidding"
sfxinfo[sfx_sogrbr].caption="Grass skidding"
sfxinfo[sfx_sowabr].caption="Liquid skidding"
sfxinfo[sfx_soglbr].caption="Glass skidding"

sfxinfo[sfx_soco1].caption="Solid steps"
sfxinfo[sfx_soco2].caption="Solid steps"
sfxinfo[sfx_soco3].caption="Solid steps"
sfxinfo[sfx_soco4].caption="Solid steps"

sfxinfo[sfx_sodi1].caption="Ground steps"
sfxinfo[sfx_sodi2].caption="Ground steps"
sfxinfo[sfx_sodi3].caption="Ground steps"
sfxinfo[sfx_sodi4].caption="Ground steps"

sfxinfo[sfx_sogl1].caption="Glass steps"
sfxinfo[sfx_sogl2].caption="Glass steps"
sfxinfo[sfx_sogl3].caption="Glass steps"

sfxinfo[sfx_sogr1].caption="Grass steps"
sfxinfo[sfx_sogr2].caption="Grass steps"
sfxinfo[sfx_sogr3].caption="Grass steps"
sfxinfo[sfx_sogr4].caption="Grass steps"

sfxinfo[sfx_some1].caption="Metal steps"
sfxinfo[sfx_some2].caption="Metal steps"
sfxinfo[sfx_some3].caption="Metal steps"
sfxinfo[sfx_some4].caption="Metal steps"

sfxinfo[sfx_sowa1].caption="Liquid steps"
sfxinfo[sfx_sowa2].caption="Liquid steps"
sfxinfo[sfx_sowa3].caption="Liquid steps"
sfxinfo[sfx_sowa4].caption="Liquid steps"

sfxinfo[sfx_sowo1].caption="Wood steps"
sfxinfo[sfx_sowo2].caption="Wood steps"
sfxinfo[sfx_sowo3].caption="Wood steps"
sfxinfo[sfx_sowo4].caption="Wood steps"

sfxinfo[sfx_sosn1].caption="Snow steps"
sfxinfo[sfx_sosn2].caption="Snow steps"
sfxinfo[sfx_sosn3].caption="Snow steps"
sfxinfo[sfx_sosn4].caption="Snow steps"

sfxinfo[sfx_sosa1].caption="Sand steps"
sfxinfo[sfx_sosa2].caption="Sand steps"
sfxinfo[sfx_sosa3].caption="Sand steps"
sfxinfo[sfx_sosa4].caption="Sand steps"

sfxinfo[sfx_socl1].caption="Cloth steps"
sfxinfo[sfx_socl2].caption="Cloth steps"
sfxinfo[sfx_socl3].caption="Cloth steps"
sfxinfo[sfx_socl4].caption="Cloth steps"

local soundinfolist={
	["grass"]={
	  ["steps"]={sfx_sogr1, sfx_sogr2, sfx_sogr3, sfx_sogr4},
	  ["skid"]={sfx_sogrbr},
	  ["land"]={sfx_sogrln},
	},["metal"]={
	  ["steps"]={sfx_some1, sfx_some2, sfx_some3, sfx_some4},
	  ["skid"]={sfx_somebr},
	  ["land"]={sfx_someln},
	},["dirt"]={
	  ["steps"]={sfx_sodi1, sfx_sodi2, sfx_sodi3, sfx_sodi4},
	  ["skid"]={sfx_sodibr},
	  ["land"]={sfx_sodiln},
	},["snow"]={
	  ["steps"]={sfx_sosn1, sfx_sosn2, sfx_sosn3, sfx_sosn4},
	  ["skid"]={sfx_sodibr},
	  ["land"]={sfx_sosnln},
	},["cloth"]={
	  ["steps"]={sfx_socl1, sfx_socl2, sfx_socl3, sfx_socl4},
	  ["skid"]={sfx_sodibr},
	  ["land"]={sfx_soclln},
	},["sand"]={
	  ["steps"]={sfx_sosa1, sfx_sosa2, sfx_sosa3, sfx_sosa4},
	  ["skid"]={sfx_sodibr},
	  ["land"]={sfx_sosaln},
	},["wood"]={
	  ["steps"]={sfx_sowo1, sfx_sowo2, sfx_sowo3, sfx_sowo4},
	  ["skid"]={sfx_sowobr},
	  ["land"]={sfx_sowoln},
	},["stone"]={
	  ["steps"]={sfx_soco1, sfx_soco2, sfx_soco3, sfx_soco4},
	  ["skid"]={sfx_socobr},
	  ["land"]={sfx_socoln},
	},["water"]={
	  ["steps"]={sfx_sowa1, sfx_sowa2, sfx_sowa3, sfx_sowa4},
	  ["skid"]={sfx_sowabr},
	  ["land"]={sfx_sowaln},
	},["lava"]={
	  ["steps"]={sfx_sowa1, sfx_sowa2, sfx_sowa3, sfx_sowa4},
	  ["skid"]={sfx_sowabr},
	  ["land"]={sfx_sowaln},
	},["glass"]={
	  ["steps"]={sfx_sogl1, sfx_sogl2, sfx_sogl3},
	  ["skid"]={sfx_soglbr},
	  ["land"]={sfx_soglln},
	}
}

local playeraniminfo={ --only Vanilla characters are left
	["sonic"]={
		["runFrames"]={0, 2},
		["dashFrames"]={-1},
		["walkFrames"]={3, 7},
		["waitFrames"]={0},
		["run"]=true,
		["dash"]=false,
		["walk"]=true,
		["idle"]=true,
		["wait"]=true,
	},["tails"]={
		["runFrames"]={-1},
		["dashFrames"]={-1},
		["walkFrames"]={3, 7},
		["waitFrames"]={-1},
		["run"]=false,
		["dash"]=false,
		["walk"]=true,
		["idle"]=true,
		["wait"]=false,
	},["knuckles"]={
		["runFrames"]={0, 2},
		["dashFrames"]={-1},
		["walkFrames"]={3, 7},
		["waitFrames"]={-1},
		["run"]=true,
		["dash"]=false,
		["walk"]=true,
		["idle"]=true,
		["wait"]=false,
	},["amy"]={
		["runFrames"]={2, 7},
		["dashFrames"]={-1},
		["walkFrames"]={3, 7},
		["waitFrames"]={1, 3},
		["run"]=true,
		["dash"]=false,
		["walk"]=true,
		["idle"]=true,
		["wait"]=true,
	},["fang"]={
		["runFrames"]={1, 4},
		["dashFrames"]={-1},
		["walkFrames"]={3, 7},
		["waitFrames"]={-1},
		["run"]=true,
		["dash"]=false,
		["walk"]=true,
		["idle"]=true,
		["wait"]=false,
	},["metal_sonic"]={
		["runFrames"]={-1},
		["dashFrames"]={-1},
		["walkFrames"]={-1},
		["waitFrames"]={-1},
		["run"]=false,
		["dash"]=false,
		["walk"]=false,
		["idle"]=true,
		["wait"]=false,
	}
}

local function reset(player)
	if valid(player.mo)
		player.lastframe=0
		player.lastanim=nil
		player.playsound=false
		player.wasfalling=false
		player.variablesset=true
		player.groundtexture=nil
		player.lastgroundtexture=nil
	end
end
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then return true end
    end

    return false
end
local function getGroundTexture(mo)
    local result
    
    if (mo.eflags & MFE_VERTICALFLIP)
		if (mo.ceilingrover) result=mo.ceilingrover.bottompic
        elseif ((mo.standingslope) and (mo.standingslope == mo.subsector.sector.c_slope)) result=mo.subsector.sector.ceilingpic
        elseif (mo.ceilingz == mo.subsector.sector.ceilingheight) result=mo.subsector.sector.ceilingpic end
    else
        if (mo.floorrover) result=mo.floorrover.toppic
		elseif ((mo.standingslope) and (mo.standingslope == mo.subsector.sector.f_slope)) result=mo.subsector.sector.floorpic
        elseif (mo.floorz == mo.subsector.sector.floorheight) result=mo.subsector.sector.floorpic end
	end
	return result
end

addHook("PlayerThink", function(player)
	if (gametype!=GT_LTMMURDERMYSTERY) return end
	if (valid(player.mo)) and (player.mo.state != S_PLAY_DEAD) and (not player.spectator)
		local pmo = player.mo
		local panimInfo=playeraniminfo[pmo.skin]
		if (panimInfo)
			if (not player.variablesset) reset(player) end
			player.groundtexture=getGroundTexture(pmo)
			if (not player.groundtexture) and (player.lastgroundtexture) player.groundtexture=player.lastgroundtexture end
			local material
			local soundType
			player.playsound=false

			local minHeight
			if (pmo.eflags & MFE_VERTICALFLIP)
				if (pmo.ceilingrover) minHeight = P_GetFOFBottomZAt(pmo.ceilingrover, pmo.x, pmo.y)
				else minHeight = P_GetSectorCeilingZAt(pmo.subsector.sector, pmo.x, pmo.y) end
			else
				--pmo.floorrover (and pmo.ceilingrover) does not nil when player's origin is not on FOF but instead stands on the edge of it. This leads to afwul results in a form of "poop flying marks" on FOF edges. Any way to fix this?
				if (pmo.floorrover) minHeight = P_GetFOFTopZAt(pmo.floorrover, pmo.x, pmo.y)
				else minHeight = P_GetSectorFloorZAt(pmo.subsector.sector, pmo.x, pmo.y) end
			end

			if ((pmo.z == minHeight) or ((pmo.standingslope) and (pmo.standingslope.zdelta < 32768))) --FU/2
				if not(player.wasfalling)
					if (player.skidtime==16)
						player.playsound=true
						soundType="skid"
					elseif not (player.powers[pw_carry])
						switch(pmo.state, {
							[S_PLAY_RUN] = do
								player.playsound=panimInfo["run"] and (has_value(panimInfo["runFrames"], pmo.frame & FF_FRAMEMASK) or has_value(panimInfo["runFrames"], pmo.frame))
							end,
							[S_PLAY_DASH] = do
								player.playsound=panimInfo["dash"] and (has_value(panimInfo["dashFrames"], pmo.frame & FF_FRAMEMASK) or has_value(panimInfo["dashFrames"], pmo.frame))
							end,
							[S_PLAY_WALK] = do
								player.playsound=panimInfo["walk"] and (has_value(panimInfo["walkFrames"], pmo.frame & FF_FRAMEMASK) or has_value(panimInfo["walkFrames"], pmo.frame))
							end,
							[S_PLAY_STND] = do
								player.playsound=panimInfo["idle"] and player.lastanim ~= player.panim
							end,
							[S_PLAY_EDGE] = do
								player.playsound=panimInfo["idle"] and player.lastanim ~= player.panim
							end,
							[S_PLAY_WAIT] = do
								player.playsound=panimInfo["wait"] and (has_value(panimInfo["waitFrames"], pmo.frame & FF_FRAMEMASK) or has_value(panimInfo["waitFrames"], pmo.frame))
							end
						})

						soundType="steps"
						player.playsound=player.playsound and player.lastframe ~= pmo.frame
						player.lastframe=pmo.frame
						player.lastanim=player.panim
					end
				else
					player.wasfalling=false
					player.playsound=true
					soundType="land"
				end
			elseif (not P_IsObjectOnGround(pmo))
				player.wasfalling=true
			end
			if (player.playsound) and (not player.mm.sneak)
				if not (pmo.eflags & MFE_GOOWATER)
					if (player.groundtexture) material=MM.FootstepFlatSound[player.groundtexture] end
					if (not material) material="stone" end
					player.lastgroundtexture = player.groundtexture
					if (material) and (soundType) and (soundinfolist[material]) and (soundinfolist[material][soundType])
						local sounds = soundinfolist[material][soundType]
						if (sounds)
							S_StartSound(pmo, sounds[P_RandomKey(#sounds) + 1])
							if (not SOC_IsTrue(mapheaderinfo[gamemap].mm_disablefootmarks) and footmarksCVAR.value)
								local mobjstep = P_SpawnMobjFromMobj(pmo,0,0,0,MT_MMSTEP)
								mobjstep.eflags = pmo.eflags
								--Kill trail steps
								if (player.mm.killtrailsteps and killtrailCVAR.value)
									mobjstep.frame = FF_SEMIBRIGHT|FF_FLOORSPRITE|min((player.mm.killtrailsteps / 2), 9)
									player.mm.killtrailsteps= $ - 1
								else
									mobjstep.frame = FF_SEMIBRIGHT|FF_FLOORSPRITE --reset to black
								end
							end
						end
					end
				end
				if (pmo.eflags & MFE_TOUCHLAVA)
					local sounds=soundinfolist["lava"][soundType]
					if (sounds) S_StartSound(pmo, sounds[P_RandomKey(#sounds) + 1]) end
				elseif (pmo.eflags & MFE_UNDERWATER) or (pmo.eflags & MFE_TOUCHWATER) or (pmo.eflags & MFE_GOOWATER)
					local sounds=soundinfolist["water"][soundType]
					if (sounds) S_StartSound(pmo, sounds[P_RandomKey(#sounds) + 1]) end
				end
			end
		end
	end
end)


--Somewhat effective function to remove the "flying footmarks"
--The problem is, this function does not allow for footmarks to spawn on FOF surfaces and slopes

--addHook("MobjThinker", function(mo)
--	if (not P_IsObjectOnGround(mo)) then P_KillMobj(mo) end
--end, MT_MMSTEP)
