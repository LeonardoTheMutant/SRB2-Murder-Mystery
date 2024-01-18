-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Vanilla weaponry recreation for modding it

MM.weapons={}

-- VANILLA WEAPONS
MM.weapons[-1]={ --Knife
    "RINGIND", --HUD icon, gonna be replaced
    MT_MMKNIFE, --MOBJ_T that represents this weapon
    0, --MF2_* flag
    60 --weapondelay
}
MM.weapons[0]={ --Infinity Ring
    "INFNIND", --HUD icon
    MT_THROWNINFINITY, --MOBJ_T that represents this weapon
    0, --MF2_* flag
    16 --weapondelay
}
MM.weapons[1]={ --Automatic Ring
    "AUTOIND",
    MT_THROWNAUTOMATIC,
    MF2_AUTOMATIC,
    2
}
MM.weapons[2]={ --Bounce Ring
    "BNCEIND",
    MT_THROWNBOUNCE,
    MF2_BOUNCERING,
    8
}
MM.weapons[3]={ --Scatter Ring
    "SCATIND",
    MT_THROWNSCATTER,
    MF2_SCATTER,
    23
}
MM.weapons[4]={ --Granade Ring
    "GRENIND",
    MT_THROWNGRENADE,
    MF2_EXPLOSION,
    11
}
MM.weapons[5]={ --Explosion Ring
    "BOMBIND",
    MT_THROWNEXPLOSION,
    MF2_EXPLOSION,
    52
}
MM.weapons[6]={ --Rail Ring
    "RAILIND",
    MT_REDRING,
    MF2_RAILRING|MF2_DONTDRAW,
    52
}

-- Knife logic
local function MM_DoKnife(p)
    P_SetWeaponDelay(p, MM.weapons[-1][4])
    local m = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])
    P_GivePlayerRings(p, -1)

    searchBlockmap("objects", function(ref, fmo)
        if ((fmo.valid) and (fmo.player) and (fmo.player.valid) and (fmo != ref.target) and (P_AproxDistance(P_AproxDistance(fmo.x - ref.x, fmo.y - ref.y), fmo.z - ref.z) < USERANGE))
            P_DamageMobj(fmo, ref, ref.target)
        end
    end, m)

    if (not p.sneak) S_StartSound(p.mo, sfx_thok) end --yeah, stealth included
end

--I recreated all vanilla ring weapons to make red rings have higher weapon delay :skull:
addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
    if (gametype != GT_MURDERMYSTERY) return end
    if (p.mmweapondelay) p.mmweapondelay = $ - 1 end
    if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL))
        p.pflags = $ & ~PF_ATTACKDOWN
        return
    end
    if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.mmweapondelay) or (not p.role) or (p.role == ROLE_INNOCENT) or ((MM.minigame) and (p.minigame)) or (p.playerstate == PST_DEAD) return end

    p.pflags = $|PF_ATTACKDOWN
    local mo

    if (p.cmd.buttons & BT_FIRENORMAL)
        -- KNIFE --
        if (p.rings < 1) return end
        MM_DoKnife(p)
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
    else
        if (p.currentweapon == 0) and (p.powers[pw_infinityring])
            -- INFINITY --
            P_SetWeaponDelay(p, MM.weapons[0][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[0][2], MM.weapons[0][3])
            p.powers[pw_infinityring] = $ - 1
        else
            -- KNIFE --
            if (p.rings < 1) return end
            MM_DoKnife(p)
        end
    end
    --Rail ring main logic (sparkles, hit detection)
    if ((mo) and (mo.flags & MF_MISSILE) and (mo.flags2 & MF2_RAILRING))
	    for i = 0, 256
            if (mo.flags & ~MF_NOBLOCKMAP)
                --P_UnsetThingPosition(mo)
                mo.flags = $|MF_NOBLOCKMAP
                --P_SetThingPosition(mo)
            end
	        if (i & 1) P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPARK) end
	        if (P_RailThinker(mo)) break end -- mobj was removed (missile hit a wall) or couldn't move
	    end
	    -- Other rail sound plays at contact point.
	    if (mo) and (mo.valid) S_StartSound(mo, sfx_rail2) end
    end
end)

-- "Wall hug" bug fix for all weapons
--
-- Bug explanation:
-- Some projectiles can go through walls if they have travel speed higher than radius.
-- In SRB2 all weapons are like this and if the players "hugs" the wall there is a chance
-- that your weapon will clip through wall and be at the other side of it.
-- You can watch Decino's much more detailed explanation here:
-- https://www.youtube.com/watch?v=kRC7hGDrNsM

addHook("MapLoad", do
    for weapon = 0, #MM.weapons do
        if (gametype == GT_MURDERMYSTERY)
            mobjinfo[MM.weapons[weapon][2]].radius = 28*FU
            mobjinfo[MM.weapons[weapon][2]].speed = 28*FU
        else --return everything to default if gametype is not MM
            mobjinfo[MM.weapons[weapon][2]].radius = 16*FU
            mobjinfo[MM.weapons[weapon][2]].speed = 60*FU
        end
    end
end)