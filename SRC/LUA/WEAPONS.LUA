-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Weapon Ring stuff

local autofireCVAR = CV_FindVar("mm_autofire")
local killtrailCVAR = CV_FindVar("mm_killtrails")
local wepcfgCVARs = {CV_FindVar("mm_wepcfg_murd"), CV_FindVar("mm_wepcfg_sheri"), CV_FindVar("mm_wepcfg_civil"), CV_FindVar("mm_wepcfg_hero")}
local knifeRadius = MELEERANGE --64*FU
local knifeHeight = 1048576 --16*FU
MM.weapons = {}

MM.weapons[-2]={ --Knife
	"KNIFEIND", --HUD icon
	0, --MOBJ_T of this weapon
	0, --MF2_* flag
	35, --Weapon delay
}

-- VANILLA WEAPONS
MM.weapons[-1]={ --Red Ring
	"RINGIND", --HUD icon
	MT_REDRING, --MOBJ_T of this weapon
	0, --MF2_* flag
	16, --Weapon delay
}
MM.weapons[0]={ --Infinity Ring
	"INFNIND", --HUD icon
	MT_THROWNINFINITY, --MOBJ_T of this weapon
	0, --MF2_* flag
	16, --Weapon delay
	800 --max amonut
}
MM.weapons[WEP_AUTO]={ --Automatic Ring
	"AUTOIND",
	MT_THROWNAUTOMATIC,
	MF2_AUTOMATIC,
	2,
	400,
	{0, 0} --Weapon overheat (firing timer, delay value)
}
MM.weapons[WEP_BOUNCE]={ --Bounce Ring
	"BNCEIND",
	MT_THROWNBOUNCE,
	MF2_BOUNCERING,
	8,
	100
}
MM.weapons[WEP_SCATTER]={ --Scatter Ring
	"SCATIND",
	MT_THROWNSCATTER,
	MF2_SCATTER,
	23,
	50
}
MM.weapons[WEP_GRENADE]={ --Granade Ring
	"GRENIND",
	MT_THROWNGRENADE,
	MF2_EXPLOSION,
	11,
	100
}
MM.weapons[WEP_EXPLODE]={ --Explosion Ring
	"BOMBIND",
	MT_THROWNEXPLOSION,
	MF2_EXPLOSION,
	52,
	50
}
MM.weapons[WEP_RAIL]={ --Rail Ring
	"RAILIND",
	MT_REDRING,
	MF2_RAILRING|MF2_DONTDRAW,
	52,
	50
}

--Do not let player to switch to another weapon, if he is not allowed to
addHook("KeyDown", function(e)
	if (gametype != GT_LTMMURDERMYSTERY) return end

	local key1, key2
	for key = GC_WEAPONNEXT, GC_WEPSLOT10 do
		key1, key2 = input.gameControlToKeyNum(key)
		if (e.num == key1) or (e.num == key2)
			if (MM.GetWepCfgFlags(consoleplayer.mm.role) & WEPCFG_REDONLY) then return true end
		end
	end
end)

--Function ports from the C source code with MM modifications
local function P_DrainWeaponAmmo(p, weapon)
	p.powers[weapon] = $ - 1

	if (p.rings < 1)
		p.ammoremovalweapon = p.currentweapon;
		p.ammoremovaltimer  = ammoremovaltics;

		if (p.powers[weapon] > 0) -- can't take a ring that doesn't exist
			p.powers[weapon] = $ - 1
			p.ammoremoval = 2
		else
			p.ammoremoval = 1
		end
	else
		P_GivePlayerRings(p, -1)
	end
end

local function P_SetWeaponDelay(p, delay)
	p.mm.weapondelay = delay;

	--Decrease the delay for Knuckles
	--Note that Knuckles has this feature in the vanilla game too, I just copied this feature into MM
	if ((p.skin == SKIN_KNUCKLES) and (not autofireCVAR.value))
		-- Multiply before dividing.
		-- Loss of precision can make a surprisingly large difference.
		p.mm.weapondelay = ($ * 2)/3
	end
end

local function P_DoKnife(source)
	assert(source, "P_DoKnife() argument #1: mobj_t expected")

	--calculate the knife coordinates. X and Y coordinates point in front of a player
	local x = source.x + (FixedInt(MELEERANGE) * cos(source.angle))
	local y = source.y + (FixedInt(MELEERANGE) * sin(source.angle))
	local z --we need to do the flipped object checks
	if (source.eflags & MFE_VERTICALFLIP) then z = source.z + (2 * source.height / 3) - FixedMul(mobjinfo[MT_MMKNIFE].height, source.scale)
	else z = source.z + source.height / 3 end

	--dummy object to act as a center of the blockmap search
	local mo = P_SpawnMobj(x, y, z, MT_RAY)

	--Find the players around the calculated point
	searchBlockmap("objects", function(r, found)
		if (source != found) and (found.type == MT_PLAYER) --Ignore the source player and every non-player object
		and (R_PointToDist2(x, y, found.x, found.y) < knifeRadius) --player must be in knife hitbox's range
		and (((found.z + found.height) > z) and (found.z < (z + knifeHeight))) --do precise Z axis check
			P_DamageMobj(found, source, source) --damage the found player
			if (source.player.mm and killtrailCVAR.value) then source.player.mm.killtrailsteps = 60 end
		end
	end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608)) --128*FU radius range in every 4 arguments

	--Spawn a visual indicator to show that player just used the knife
	--We do not move it to the actual knife coordinates because it can spawn in a wall and be placed incorrectly on the Z axis
	P_SpawnMobj(source.x, source.y, z, MT_SPARK)
end

addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
	if (gametype != GT_LTMMURDERMYSTERY) then return end

	if ((p.mm.role != ROLE_CIVILIAN) and (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_REDONLY)) or (p.mm.role == ROLE_CIVILIAN) then p.currentweapon = 0 end --Force to weapon Slot 1

	p.weapondelay = 1 --vanilla weapons don't shoot anymore, only the MM recreation

	if (p.mm.weapondelay) p.mm.weapondelay = $ - 1 end
	if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL))
		p.pflags = $ & ~PF_ATTACKDOWN
		--"Let automatic ring cool down"
		MM.weapons[WEP_AUTO][6][1] = $ - 1
		if (MM.weapons[WEP_AUTO][6][2] and leveltime % 16 == 0) MM.weapons[WEP_AUTO][6][2] = $ - 1 end
		return
	end
	if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.mm.weapondelay)
		or (not p.mm.role) or ((MM.minigame) and (p.mm.minigame))
		or (p.playerstate == PST_DEAD) or (p.spectator) or (not p.mm.role)
	then return end

	if (not autofireCVAR.value) then p.pflags = $|PF_ATTACKDOWN end

	local mo

	if (p.cmd.buttons & BT_FIRENORMAL) or ((p.mm.role == ROLE_CIVILIAN) and (wepcfgCVARs[ROLE_CIVILIAN].value == 2)) or ((p.mm.role != ROLE_CIVILIAN) and (p.currentweapon == 0) and (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED))
		-- KNIFE --
		if (p.mm.role == ROLE_CIVILIAN)
			if (((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) and (p.rings > 49)) or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 99)) and (wepcfgCVARs[ROLE_CIVILIAN].value)
				P_SetWeaponDelay(p, MM.weapons[-2][4])
				P_DoKnife(p.mo)

				--Weapon shot/use costs 100 rings for Innocents
				if ((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) then P_GivePlayerRings(p, -50) --Player is Tails or Amy, take 50 rings instead
				else P_GivePlayerRings(p, -100) end

				if (not p.mm.sneak) S_StartSound(p.mo, sfx_wepfir) end --yeah, stealth included
			end
		else --Roles other than Civilian
			if (p.rings > 0)
				P_SetWeaponDelay(p, MM.weapons[-2][4])
				P_DoKnife(p.mo)
				P_GivePlayerRings(p, -1)

				if (not p.mm.sneak) S_StartSound(p.mo, sfx_wepfir) end --stealth
			end
		end
	elseif (p.currentweapon == WEP_AUTO) and (p.powers[pw_automaticring])
		-- AUTOMATIC --
		P_DrainWeaponAmmo(p, pw_automaticring)
		p.pflags = $ & ~PF_ATTACKDOWN
		
		--"Heat up the weapon" (make additional firing delay)
		MM.weapons[WEP_AUTO][6][1] = $ + 1
		if (MM.weapons[WEP_AUTO][6][1] % 4 == 0) MM.weapons[WEP_AUTO][6][2] = $ + 1 end

		P_SetWeaponDelay(p, MM.weapons[WEP_AUTO][4] + MM.weapons[WEP_AUTO][6][2])
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_AUTO][2], MM.weapons[WEP_AUTO][3])
	elseif (p.currentweapon == WEP_BOUNCE) and (p.powers[pw_bouncering])
		-- BOUNCE --
		P_DrainWeaponAmmo(p, pw_bouncering)
		P_SetWeaponDelay(p, MM.weapons[WEP_BOUNCE][4])
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_BOUNCE][2], MM.weapons[WEP_BOUNCE][3])
		if (mo) mo.fuse = 105 end
	elseif (p.currentweapon == WEP_SCATTER) and (p.powers[pw_scatterring])
		-- SCATTER --
		local oldz = p.mo.z
		local shotangle = p.mo.angle
		local oldaiming = p.aiming
		P_DrainWeaponAmmo(p, pw_scatterring)
		P_SetWeaponDelay(p, MM.weapons[WEP_SCATTER][4])
		-- Center
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_SCATTER][2], MM.weapons[WEP_SCATTER][3])
		if (mo) shotangle = R_PointToAngle2(p.mo.x, p.mo.y, mo.x, mo.y) end
		-- Left
		mo = P_SPMAngle(p.mo, MM.weapons[WEP_SCATTER][2], shotangle-ANG2, 1, MM.weapons[WEP_SCATTER][3])
		-- Right
		mo = P_SPMAngle(p.mo, MM.weapons[WEP_SCATTER][2], shotangle+ANG2, 1, MM.weapons[WEP_SCATTER][3])
		-- Up
		p.mo.z = $ + FixedMul(786420, p.mo.scale) --12*FU
		p.aiming = $ + ANG1
		mo = P_SPMAngle(p.mo, MM.weapons[WEP_SCATTER][2], shotangle, 1, MM.weapons[WEP_SCATTER][3])
		-- Down
		p.mo.z = $ - FixedMul(1572840, p.mo.scale) --24*FU
		p.aiming = $ - ANG2
		mo = P_SPMAngle(p.mo, MM.weapons[WEP_SCATTER][2], shotangle, 1, MM.weapons[WEP_SCATTER][3])
		-- Reset everything modified previously
		p.mo.z = oldz
		p.aiming = oldaiming
	elseif (p.currentweapon == WEP_GRENADE) and (p.powers[pw_grenadering])
		-- GRENADE --
		P_DrainWeaponAmmo(p, pw_grenadering)
		P_SetWeaponDelay(p, MM.weapons[WEP_GRENADE][4])
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_GRENADE][2], MM.weapons[WEP_GRENADE][3])
		if (mo) mo.fuse = mo.info.reactiontime end
	elseif (p.currentweapon == WEP_EXPLODE) and (p.powers[pw_explosionring])
		-- EXPLOSION --
		P_DrainWeaponAmmo(p, pw_explosionring)
		P_SetWeaponDelay(p, MM.weapons[WEP_EXPLODE][4])
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_EXPLODE][2], MM.weapons[WEP_EXPLODE][3])
	elseif (p.currentweapon == WEP_RAIL) and (p.powers[pw_railring])
		-- RAIL --
		P_DrainWeaponAmmo(p, pw_railring)
		P_SetWeaponDelay(p, MM.weapons[WEP_RAIL][4])
		mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_RAIL][2], MM.weapons[WEP_RAIL][3])
		-- Rail has no unique thrown object, therefore its sound plays here.
		S_StartSound(p.mo, sfx_rail1)
	else
		if (p.mm.role == ROLE_CIVILIAN)
			-- RED RING --
			if ((p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and p.rings > 49) or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and p.rings > 99) and (wepcfgCVARs[ROLE_CIVILIAN].value == 1)
				P_SetWeaponDelay(p, MM.weapons[-1][4])
				mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])

				if ((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) then P_GivePlayerRings(p, -50) --Player is Tails or Amy, take 50 rings instead
				else P_GivePlayerRings(p, -100) end
			end
		else --Roles other than Civilian
			if (not (MM.GetWepCfgFlags(p.mm.role) & WEPCFG_DISABLERED))
				if (p.currentweapon == 0) and (p.powers[pw_infinityring])
					-- INFINITY --
					P_SetWeaponDelay(p, MM.weapons[0][4])
					mo = P_SpawnPlayerMissile(p.mo, MM.weapons[0][2], MM.weapons[0][3])
					p.powers[pw_infinityring] = $ - 1
				else
					-- RED RING --
					if ((p.mm.role != ROLE_CIVILIAN) and (p.rings > 0)) or ((p.mm.role == ROLE_CIVILIAN) and (((p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and p.rings > 49) or (not (p.skin == SKIN_TAILS and p.skin == SKIN_AMY) and p.rings > 99)))
						P_SetWeaponDelay(p, MM.weapons[-1][4])
						mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])
						P_GivePlayerRings(p, -1)
					end
				end
			end
		end
	end

	--Rail ring main logic (sparkles, hit detection)
	if ((mo) and (mo.flags & MF_MISSILE) and (mo.flags2 & MF2_RAILRING))
		for i = 0, 255
			if (mo.flags & ~MF_NOBLOCKMAP)
				--P_UnsetThingPosition(mo)
				mo.flags = $|MF_NOBLOCKMAP
				--P_SetThingPosition(mo)
			end
			if (i % 2) P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPARK) end
			if (P_RailThinker(mo)) break end -- mobj was removed (missile hit a wall) or couldn't move
		end
		-- Other rail sound plays at contact point.
		if valid(mo) then S_StartSound(mo, sfx_rail2) end
	end
end)

-- Weapon Ring Panel despawner
-- Works only when Weapon Configuration has "Red only" flag set everywhere

local function IsRedOnlyEverywhere()
	return (wepcfgCVARs[ROLE_MURDERER].value & WEPCFG_REDONLY) and ((wepcfgCVARs[ROLE_MURDERER].value / 4) & WEPCFG_REDONLY)
			and (wepcfgCVARs[ROLE_SHERIFF].value & WEPCFG_REDONLY) and ((wepcfgCVARs[ROLE_SHERIFF].value / 4) & WEPCFG_REDONLY)
			and (wepcfgCVARs[ROLE_HERO].value & WEPCFG_REDONLY) and ((wepcfgCVARs[ROLE_HERO].value / 4) & WEPCFG_REDONLY)
end

local weaponPanelMobjs = {
	MT_BOUNCEPICKUP,  --Bounce
	MT_RAILPICKUP,    --Rail
	MT_AUTOPICKUP,    --Automatic
	MT_EXPLODEPICKUP, --Explosion
	MT_SCATTERPICKUP, --Scatter
	MT_GRENADEPICKUP  --Grenade
}

for i = 1, #weaponPanelMobjs do
	addHook("MapThingSpawn", function(m)
		if ((gametype == GT_LTMMURDERMYSTERY) and IsRedOnlyEverywhere())
			m.state = 0
			return true
		end
	end, weaponPanelMobjs[i])
end
