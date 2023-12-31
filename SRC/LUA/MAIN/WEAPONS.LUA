-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Vanilla weaponry recreation for modding it

MM.weapons={}

MM.weapons[-1]={ --Red Ring
    "RINGIND", --HUD icon
    MT_REDRING, --MOBJ_T that represents this weapon
    0, --MF2_* flag
    16 --weapondelay
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

--I recreated all vanilla ring weapons to make red rings have higher weapon delay :skull:
addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
    if (gametype!=GT_MURDERMYSTERY) return end
    if (p.mmweapondelay) p.mmweapondelay = $ - 1 end
    if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL))
        p.pflags = $ & ~PF_ATTACKDOWN
        return
    end
    if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.mmweapondelay) or (not p.role) or (p.role==ROLE_INNOCENT) or ((MM.minigame) and (p.minigame)) or (p.playerstate == PST_DEAD) return end
    p.pflags = $|PF_ATTACKDOWN
    local mo
    if (p.cmd.buttons & BT_FIRENORMAL)
        if (p.currentweapon == 0) and (p.powers[pw_infinityring])
            P_SetWeaponDelay(p, MM.weapons[0][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[0][2], MM.weapons[0][3])
            p.powers[pw_infinityring] = $ - 1
        else
            if (p.rings < 1) return end
            P_SetWeaponDelay(p, MM.weapons[-1][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])
            P_GivePlayerRings(p, -1)
        end
    elseif (p.currentweapon == WEP_AUTO) and (p.powers[pw_automaticring])
        P_DrainWeaponAmmo(p, pw_automaticring)
        p.pflags = $ & ~PF_ATTACKDOWN
        P_SetWeaponDelay(p, MM.weapons[WEP_AUTO][4])
        mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_AUTO][2], MM.weapons[WEP_AUTO][3])
    elseif (p.currentweapon == WEP_BOUNCE) and (p.powers[pw_bouncering])
        P_DrainWeaponAmmo(p, pw_bouncering)
        P_SetWeaponDelay(p, MM.weapons[WEP_BOUNCE][4])
        mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_BOUNCE][2], MM.weapons[WEP_BOUNCE][3])
        if (mo) mo.fuse = 105 end
    elseif (p.currentweapon == WEP_SCATTER) and (p.powers[pw_scatterring])
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
        P_DrainWeaponAmmo(p, pw_grenadering)
        P_SetWeaponDelay(p, MM.weapons[WEP_GRENADE][4])
        mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_GRENADE][2], MM.weapons[WEP_GRENADE][3])
        if (mo) mo.fuse = mo.info.reactiontime end
    elseif (p.currentweapon == WEP_EXPLODE) and (p.powers[pw_explosionring])
        P_DrainWeaponAmmo(p, pw_explosionring)
        P_SetWeaponDelay(p, MM.weapons[WEP_EXPLODE][4])
        mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_EXPLODE][2], MM.weapons[WEP_EXPLODE][3])
    elseif (p.currentweapon == WEP_RAIL) and (p.powers[pw_railring])
        P_DrainWeaponAmmo(p, pw_railring)
        P_SetWeaponDelay(p, MM.weapons[WEP_RAIL][4])
        mo = P_SpawnPlayerMissile(p.mo, MM.weapons[WEP_RAIL][2], MM.weapons[WEP_RAIL][3])
        -- Rail has no unique thrown object, therefore its sound plays here.
        S_StartSound(p.mo, sfx_rail1)
    else --YES, I copied & pasted this part of the code as it is in the C source code
        if (p.currentweapon == 0) and (p.powers[pw_infinityring])
            P_SetWeaponDelay(p, MM.weapons[0][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[0][2], MM.weapons[0][3])
            p.powers[pw_infinityring] = $ - 1
        else
            if (p.rings < 1) return end
            P_SetWeaponDelay(p, MM.weapons[-1][4])
            mo = P_SpawnPlayerMissile(p.mo, MM.weapons[-1][2], MM.weapons[-1][3])
            P_GivePlayerRings(p, -1)
        end
    end
    --Rail ring main logic (sparkles, hit detection)
    if (mo)
		if (mo.flags & MF_MISSILE) and (mo.flags2 & MF2_RAILRING)
			for i=0, 256
				if (mo.flags&~MF_NOBLOCKMAP)
					--P_UnsetThingPosition(mo)
					mo.flags = $|MF_NOBLOCKMAP
					--P_SetThingPosition(mo)
                end
				if (i&1) P_SpawnMobj(mo.x, mo.y, mo.z, MT_SPARK) end
				if (P_RailThinker(mo)) break end -- mobj was removed (missile hit a wall) or couldn't move
			end
			-- Other rail sound plays at contact point.
			if (mo) and (mo.valid) S_StartSound(mo, sfx_rail2) end
        end
    end
end)