-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Weapon Ring stuff

local eMeM = MM
local GetWepCfgFlags = MM.GetWepCfgFlags

local cv_autofire = CV_FindVar("mm_autofire").value
local cv_killtrails = CV_FindVar("mm_killtrails").value
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
--(Weapon Switch sound silencer)
addHook("KeyDown", function(e)
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	local key1, key2
	for key = GC_WEAPONNEXT, GC_WEPSLOT7 do
		key1, key2 = input.gameControlToKeyNum(key)
		if (e.num == key1) or (e.num == key2) then
			if (GetWepCfgFlags(consoleplayer.mm.role) & WEPCFG_REDONLY or ((consoleplayer.mm.role < ROLE_MURDERER or consoleplayer.mm.role > ROLE_JESTERHERO))) then return true end
		end
	end
end)

--Function ports from the C source code with MM modifications
local function P_DrainWeaponAmmo(p, weapon)
	p.powers[weapon] = p.powers[weapon] - 1

	if (p.rings < 1) then
		p.ammoremovalweapon = p.currentweapon;
		p.ammoremovaltimer  = ammoremovaltics;

		if (p.powers[weapon] > 0) then -- can't take a ring that doesn't exist
			p.powers[weapon] = p.powers[weapon] - 1
			p.ammoremoval = 2
		else
			p.ammoremoval = 1
		end
	else
		P_GivePlayerRings(p, -1)
	end
end

local function P_SetWeaponDelay(p, delay)
	local pmm = p.mm
	pmm.weapondelay = delay;

	--Decrease the delay for Knuckles
	--Note that Knuckles has this feature in the vanilla game too, I just copied this feature into MM
	if ((p.skin == SKIN_KNUCKLES) and (not cv_autofire)) then
		-- Multiply before dividing.
		-- Loss of precision can make a surprisingly large difference.
		pmm.weapondelay = (pmm.weapondelay * 2)/3
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
		if (source ~= found) and (found.type == MT_PLAYER) --Ignore the source player and every non-player object
		and (R_PointToDist2(x, y, found.x, found.y) < knifeRadius) --player must be in knife hitbox's range
		and (((found.z + found.height) > z) and (found.z < (z + knifeHeight))) then --do precise Z axis check

			P_DamageMobj(found, source, source) --damage the found player
			if (source.player.mm and cv_killtrails) then
				switch(source.player.mm.role, {
					[ROLE_JESTER] = function() --Do not spill ketchup if Jester used knife on somebody
					end,
					[ROLE_JESTERHERO] = function() --Jester with Hero priviledges can only get dirty if he killed Murderer
						if (found.player.mm and found.player.mm.role == ROLE_MURDERER) then
							source.player.mm.killtrailsteps = 60
						end
					end,
					['default'] = function() --Always spill ketchup for other players
						source.player.mm.killtrailsteps = 60
					end
				})
			end
		end
	end, mo, (mo.x - 8388608), (mo.x + 8388608), (mo.y - 8388608), (mo.y + 8388608)) --128*FU radius range in every 4 arguments

	--Spawn a visual indicator to show that player just used the knife
	--We do not move it to the actual knife coordinates because it can spawn in a wall and be placed incorrectly on the Z axis
	P_SpawnMobj(source.x, source.y, z, MT_SPARK)
end

addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	local pmm = p.mm
	local pmo = p.mo
	local prole = pmm.role

	if ((prole ~= ROLE_CIVILIAN) and (GetWepCfgFlags(prole) & WEPCFG_REDONLY)) or (prole == ROLE_CIVILIAN) then p.currentweapon = 0 end --Force to weapon Slot 1

	p.weapondelay = 1 --vanilla weapons don't shoot anymore, only the MM recreation

	if (pmm.weapondelay) then pmm.weapondelay = pmm.weapondelay - 1 end
	if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL)) then
		p.pflags = p.pflags & ~PF_ATTACKDOWN
		--"Let automatic ring cool down"
		eMeM.weapons[WEP_AUTO][6][1] = eMeM.weapons[WEP_AUTO][6][1] - 1
		if (eMeM.weapons[WEP_AUTO][6][2] and leveltime % 16 == 0) then eMeM.weapons[WEP_AUTO][6][2] = eMeM.weapons[WEP_AUTO][6][2] - 1 end
		return
	end
	if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.mm.weapondelay)
	or (not prole) or ((eMeM.minigame) and (p.mm.flags & FLAG_MINIGAME))
	or (p.playerstate == PST_DEAD) or (p.spectator) or (not prole) then
		return
	end

	if (not cv_autofire) then p.pflags = p.pflags|PF_ATTACKDOWN end

	local mo

	if (p.cmd.buttons & BT_FIRENORMAL) or ((prole == ROLE_CIVILIAN) and (wepcfgCVARs[ROLE_CIVILIAN].value == 2))
	or ((prole ~= ROLE_CIVILIAN) and (p.currentweapon == 0) and (GetWepCfgFlags(prole) & WEPCFG_DISABLERED)) then
		-- KNIFE --
		switch(prole, {
			[ROLE_CIVILIAN] = function()
				if (((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) and (p.rings > 49))
				or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and (p.rings > 99)) and (wepcfgCVARs[ROLE_CIVILIAN].value) then
					P_SetWeaponDelay(p, eMeM.weapons[-2][4])
					P_DoKnife(pmo)

					--Weapon shot/use costs 100 rings for Innocents
					if ((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) then P_GivePlayerRings(p, -50) --Player is Tails or Amy, take 50 rings instead
					else P_GivePlayerRings(p, -100) end

					if (not (pmm.flags & FLAG_SNEAK)) then S_StartSound(pmo, sfx_wepfir) end --yeah, stealth included
				end
			end,
			[ROLE_JESTER] = function()
				if (p.rings > 9) then
					P_SetWeaponDelay(p, eMeM.weapons[-2][4])
					P_DoKnife(pmo)
					P_GivePlayerRings(p, -10)
					if (not (pmm.flags & FLAG_SNEAK)) then S_StartSound(pmo, sfx_wepfir) end
				end
			end,
			['default'] = function()
				if (p.rings > 0) then
					P_SetWeaponDelay(p, eMeM.weapons[-2][4])
					P_DoKnife(pmo)
					P_GivePlayerRings(p, -1)

					if (not (pmm.flags & FLAG_SNEAK)) then S_StartSound(pmo, sfx_wepfir) end --stealth
				end
			end
		})
	elseif (p.currentweapon == WEP_AUTO) and (p.powers[pw_automaticring]) then
		-- AUTOMATIC --
		P_DrainWeaponAmmo(p, pw_automaticring)
		p.pflags = p.pflags & ~PF_ATTACKDOWN

		--"Heat up the weapon" (make additional firing delay)
		eMeM.weapons[WEP_AUTO][6][1] = eMeM.weapons[WEP_AUTO][6][1] + 1
		if (eMeM.weapons[WEP_AUTO][6][1] % 4 == 0) then eMeM.weapons[WEP_AUTO][6][2] = eMeM.weapons[WEP_AUTO][6][2] + 1 end

		P_SetWeaponDelay(p, eMeM.weapons[WEP_AUTO][4] + eMeM.weapons[WEP_AUTO][6][2])
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_AUTO][2], eMeM.weapons[WEP_AUTO][3])
	elseif (p.currentweapon == WEP_BOUNCE) and (p.powers[pw_bouncering]) then
		-- BOUNCE --
		P_DrainWeaponAmmo(p, pw_bouncering)
		P_SetWeaponDelay(p, eMeM.weapons[WEP_BOUNCE][4])
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_BOUNCE][2], eMeM.weapons[WEP_BOUNCE][3])
		if (mo) then mo.fuse = 105 end
	elseif (p.currentweapon == WEP_SCATTER) and (p.powers[pw_scatterring]) then
		-- SCATTER --
		local oldz = pmo.z
		local shotangle = pmo.angle
		local oldaiming = p.aiming
		P_DrainWeaponAmmo(p, pw_scatterring)
		P_SetWeaponDelay(p, eMeM.weapons[WEP_SCATTER][4])
		-- Center
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_SCATTER][2], eMeM.weapons[WEP_SCATTER][3])
		if (mo) then shotangle = R_PointToAngle2(pmo.x, pmo.y, mo.x, mo.y) end
		-- Left
		mo = P_SPMAngle(pmo, eMeM.weapons[WEP_SCATTER][2], shotangle-ANG2, 1, eMeM.weapons[WEP_SCATTER][3])
		-- Right
		mo = P_SPMAngle(pmo, eMeM.weapons[WEP_SCATTER][2], shotangle+ANG2, 1, eMeM.weapons[WEP_SCATTER][3])
		-- Up
		pmo.z = pmo.z + FixedMul(786420, pmo.scale) --12*FU
		p.aiming = p.aiming + ANG1
		mo = P_SPMAngle(pmo, eMeM.weapons[WEP_SCATTER][2], shotangle, 1, eMeM.weapons[WEP_SCATTER][3])
		-- Down
		pmo.z = pmo.z - FixedMul(1572840, pmo.scale) --24*FU
		p.aiming = p.aiming - ANG2
		mo = P_SPMAngle(pmo, eMeM.weapons[WEP_SCATTER][2], shotangle, 1, eMeM.weapons[WEP_SCATTER][3])
		-- Reset everything modified previously
		pmo.z = oldz
		p.aiming = oldaiming
	elseif (p.currentweapon == WEP_GRENADE) and (p.powers[pw_grenadering]) then
		-- GRENADE --
		P_DrainWeaponAmmo(p, pw_grenadering)
		P_SetWeaponDelay(p, eMeM.weapons[WEP_GRENADE][4])
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_GRENADE][2], eMeM.weapons[WEP_GRENADE][3])
		if (mo) then mo.fuse = mo.info.reactiontime end
	elseif (p.currentweapon == WEP_EXPLODE) and (p.powers[pw_explosionring]) then
		-- EXPLOSION --
		P_DrainWeaponAmmo(p, pw_explosionring)
		P_SetWeaponDelay(p, eMeM.weapons[WEP_EXPLODE][4])
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_EXPLODE][2], eMeM.weapons[WEP_EXPLODE][3])
	elseif (p.currentweapon == WEP_RAIL) and (p.powers[pw_railring]) then
		-- RAIL --
		P_DrainWeaponAmmo(p, pw_railring)
		P_SetWeaponDelay(p, eMeM.weapons[WEP_RAIL][4])
		mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[WEP_RAIL][2], eMeM.weapons[WEP_RAIL][3])
		-- Rail has no unique thrown object, therefore its sound plays here.
		S_StartSound(pmo, sfx_rail1)
	else
		-- RED RING / INFINITY --
		switch(prole, {
			[ROLE_CIVILIAN] = function()
				-- RED RING --
				if ((p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and p.rings > 49)
				or (not (p.skin == SKIN_TAILS or p.skin == SKIN_AMY) and p.rings > 99) and (wepcfgCVARs[ROLE_CIVILIAN].value == 1) then
					P_SetWeaponDelay(p, eMeM.weapons[-1][4])
					mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[-1][2], eMeM.weapons[-1][3])

					if ((p.skin == SKIN_TAILS) or (p.skin == SKIN_AMY)) then P_GivePlayerRings(p, -50) --Player is Tails or Amy, take 50 rings instead
					else P_GivePlayerRings(p, -100) end
				end
			end,
			[ROLE_JESTER] = function()
				-- RED RING --
				if (p.rings > 9) then
					P_SetWeaponDelay(p, eMeM.weapons[-1][4])
					mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[-1][2], eMeM.weapons[-1][3])
					P_GivePlayerRings(p, -10)
				end
			end,
			['default'] = function()
				if (not (GetWepCfgFlags(prole) & WEPCFG_DISABLERED)) then
					if (p.currentweapon == 0) and (p.powers[pw_infinityring]) then
						-- INFINITY --
						P_SetWeaponDelay(p, eMeM.weapons[0][4])
						mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[0][2], eMeM.weapons[0][3])
						p.powers[pw_infinityring] = p.powers[pw_infinityring] - 1
					else
						-- RED RING --
						if (p.rings > 0) then
							P_SetWeaponDelay(p, eMeM.weapons[-1][4])
							mo = P_SpawnPlayerMissile(pmo, eMeM.weapons[-1][2], eMeM.weapons[-1][3])
							P_GivePlayerRings(p, -1)
						end
					end
				end
			end
		})
	end

	--Rail ring main logic (sparkles, hit detection)
	if ((mo) and (mo.flags & MF_MISSILE) and (mo.flags2 & MF2_RAILRING)) then
		for i = 0, 255 do
			if (mo.flags & ~MF_NOBLOCKMAP) then
				--P_UnsetThingPosition(mo)
				mo.flags = mo.flags|MF_NOBLOCKMAP
				--P_SetThingPosition(mo)
			end
			if (i % 2) then P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPARK) end
			if (P_RailThinker(mo)) then break end -- mobj was removed (missile hit a wall) or couldn't move
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
		if ((gametype == GT_LTMMURDERMYSTERY) and IsRedOnlyEverywhere()) then
			m.state = 0
			return true
		end
	end, weaponPanelMobjs[i])
end
