-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Vanilla weaponry recreation for modding it

local autofireCVAR = CV_FindVar("mm_autofire")
MM.weapons = {}

-- VANILLA WEAPONS
MM.weapons[-2]={ --Knife
    "KNIFEIND", --HUD icon
    MT_MMKNIFE, --MOBJ_T of this weapon
    0, --MF2_* flag
    35, --Weapon delay
}
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
MM.weapons[1]={ --Automatic Ring
    "AUTOIND",
    MT_THROWNAUTOMATIC,
    MF2_AUTOMATIC,
    2,
    400
}
MM.weapons[2]={ --Bounce Ring
    "BNCEIND",
    MT_THROWNBOUNCE,
    MF2_BOUNCERING,
    8,
    100
}
MM.weapons[3]={ --Scatter Ring
    "SCATIND",
    MT_THROWNSCATTER,
    MF2_SCATTER,
    23,
    50
}
MM.weapons[4]={ --Granade Ring
    "GRENIND",
    MT_THROWNGRENADE,
    MF2_EXPLOSION,
    11,
    100
}
MM.weapons[5]={ --Explosion Ring
    "BOMBIND",
    MT_THROWNEXPLOSION,
    MF2_EXPLOSION,
    52,
    50
}
MM.weapons[6]={ --Rail Ring
    "RAILIND",
    MT_REDRING,
    MF2_RAILRING|MF2_DONTDRAW,
    52,
    50
}

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
	if ((p.skin == 2) and (not autofireCVAR.value))
		-- Multiply before dividing.
		-- Loss of precision can make a surprisingly large difference.
		p.mm.weapondelay = ($ << 1)/3
	end
end

addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
    if (gametype != GT_LTMMURDERMYSTERY) return end

    if (MM_WeaponConfigFlags(p.mm.role, WEPCFG_REDONLY) or (p.mm.role == ROLE_INNOCENT)) then p.currentweapon = 0 end --Force to weapon Slot 1

    p.weapondelay = 1 --vanilla weapons don't shoot anymore, only the MM recreation

    if (p.mm.weapondelay) p.mm.weapondelay = $ - 1 end
    if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL))
        p.pflags = $ & ~PF_ATTACKDOWN
        return
    end
    if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.mm.weapondelay)
		or (not p.mm.role) or ((MM.minigame) and (p.mm.minigame))
		or (p.playerstate == PST_DEAD) or (p.spectator)
	then return end

    if (not autofireCVAR.value) then p.pflags = $|PF_ATTACKDOWN end

    local mo

    if (p.cmd.buttons & BT_FIRENORMAL) or ((p.currentweapon == 0) and MM_WeaponConfigFlags(p.mm.role, WEPCFG_DISABLERED))
        -- KNIFE --
        if ((p.mm.role != ROLE_INNOCENT) and (p.rings > 0)) or ((p.mm.role == ROLE_INNOCENT) and ((((p.skin == 1) or (p.skin == 5)) and (p.rings > 49)) or (((p.skin != 1) and (p.skin != 5)) and (p.rings > 99))))
            P_SetWeaponDelay(p, MM.weapons[-2][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-2][2], MM.weapons[-2][3])
            if (p.mm.role == ROLE_INNOCENT) --Weapon shot/use costs 100 rings for Innocents
                if ((p.skin == 1) or (p.skin == 5)) then P_GivePlayerRings(p, -50) --Player is Tails, take 50 rings instead
                else P_GivePlayerRings(p, -100) end
            else P_GivePlayerRings(p, -1) end

            if (not p.mm.sneak) S_StartSound(p.mo, sfx_wepfir) end --yeah, stealth included
        end
    elseif (p.currentweapon == WEP_AUTO) and (p.powers[pw_automaticring])
        -- AUTOMATIC --
        P_DrainWeaponAmmo(p, pw_automaticring)
        p.pflags = $ & ~PF_ATTACKDOWN
        P_SetWeaponDelay(p, MM.weapons[WEP_AUTO][4])
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
        return
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
    elseif not (MM_WeaponConfigFlags(p.mm.role, WEPCFG_DISABLERED))
        if (p.currentweapon == 0) and (p.powers[pw_infinityring]) and (p.mm.role != ROLE_INNOCENT)
            -- INFINITY --
            P_SetWeaponDelay(p, MM.weapons[0][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[0][2], MM.weapons[0][3])
            p.powers[pw_infinityring] = $ - 1
        else
            -- RED RING --
            if ((p.mm.role != ROLE_INNOCENT) and (p.rings > 0)) or ((p.mm.role == ROLE_INNOCENT) and (((p.skin == 1 or p.skin == 5) and p.rings > 49) or (p.skin != 1 and p.rings > 99)))
                P_SetWeaponDelay(p, MM.weapons[-1][4])
                mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])
                if (p.mm.role == ROLE_INNOCENT) --Weapon shot/use costs 100 rings for Innocents
                    if ((p.skin == 1) or (p.skin == 5)) then P_GivePlayerRings(p, -50) --Player is Tails or MetalSonic, take 50 rings instead
                    else P_GivePlayerRings(p, -100) end
                else P_GivePlayerRings(p, -1) end
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
	        if (i & 1) P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPARK) end
	        if (P_RailThinker(mo)) break end -- mobj was removed (missile hit a wall) or couldn't move
	    end
	    -- Other rail sound plays at contact point.
	    if valid(mo) then S_StartSound(mo, sfx_rail2) end
    end
end)

--Knife collision and attack
addHook("TouchSpecial", function(special, toucher)
    if (special.state != S_SPRK1) then return true end
    P_DamageMobj(toucher, special, special.target)
    return true
end, MT_MMKNIFE)

-- Weapon Ring Panel despawner
-- Works only when Weapon Configuration has "Red only" flag set everywhere

--Bounce
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_BOUNCEPICKUP)

--Rail
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_RAILPICKUP)

--Automatic
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_AUTOPICKUP)

--Explosion
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_EXPLODEPICKUP)

--Scatter
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_SCATTERPICKUP)

--Grenade
addHook("MapThingSpawn", function(m)
	if ((gametype == GT_LTMMURDERMYSTERY) and (MM.weaponconfig[1] & WEPCFG_REDONLY) and (MM.weaponconfig[2] & WEPCFG_REDONLY) and (MM.weaponconfig[3] & WEPCFG_REDONLY) and (MM.weaponconfig[4] & WEPCFG_REDONLY))
		m.state = 0
		return true
	end
end, MT_GRENADEPICKUP)