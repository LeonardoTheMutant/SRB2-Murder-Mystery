-- WEAPONS.LUA
-- Code by LeonardoTheMutant
--
-- Vanilla weaponry recreation for modding it

addHook("PlayerSpawn", function(p)
    if (gametype!=GT_MURDERMYSTERY) return end
    if (p.role==ROLE_MURDERER) or (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
        if (not p.weapons)
            p.weapons[-1]={ --Red Ring
                "RINGIND", --HUD icon
                MT_REDRING, --MOBJ_T that represents this weapon
                0, --MF2_* flag
                16, --weapondelay
                nil --ammo (p.mmrings used instead)
            }
            p.weapons[0]={ --Infinity Ring
                "INFNIND", --HUD icon
                MT_THROWNINFINITY, --MOBJ_T that represents this weapon
                0, --MF2_* flag
                8, --weapondelay
                0 --ammo
            }
            if (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO)
                p.weapons[1]={ --Automatic Ring
                    "AUTOIND",
                    MT_THROWNAUTO,
                    MF2_AUTOMATIC,
                    2,
                    0
                }
                p.weapons[2]={ --Bounce Ring
                    "BNCEIND",
                    MT_THROWNBOUNCE,
                    MF2_BOUNCERING,
                    8,
                    0
                }
                p.weapons[3]={ --Scatter Ring
                    "SCATIND",
                    MT_THROWNSCATTER,
                    MF2_SCATTER,
                    23,
                    0
                }
                p.weapons[4]={ --Granade Ring
                    "GRENIND",
                    MT_THROWNGRENADE,
                    MF2_EXPLOSION,
                    11,
                    0
                }
                p.weapons[5]={ --Explosion Ring
                    "BOMBIND",
                    MT_THROWNEXPLOSION,
                    MF2_EXPLOSION,
                    52,
                    0
                }
                p.weapons[6]={ --Rail Ring
                    "RAILIND",
                    MT_REDRING,
                    MF2_RAILRING|MF2_DONTDRAW,
                    52,
                    0
                }
            end
        end
    end
    if (not p.mmrings) p.mmrings=0 end
end)
addHook("PlayerThink", function(p) --this whole hook is a port of P_DoFiring() from C source code
    if (gametype!=GT_MURDERMYSTERY) return end
    if (p.role==ROLE_MURDERER) or (p.role==ROLE_SHERIFF) or (p.role==ROLE_HERO) and (p.rings)
        p.mmrings=$+p.rings
        p.rings=0
    end
    if not (p.cmd.buttons & (BT_ATTACK|BT_FIRENORMAL))
        p.pflags = $&~PF_ATTACKDOWN
        return
    end
    if (p.pflags & PF_ATTACKDOWN) or (p.climbing) or (p.weapondelay) return end
    p.pflags = $|PF_ATTACKDOWN
    local mo
    if (p.cmd.buttons&BT_FIRENORMAL)
        if (p.cuurentweapon == 0) and (p.weapons[0][5])
            P_SetWeaponDelay(p, p.weapons[0][5])
            mo = P_SpawnPlayerMissile(p.mo, p.weapons[0][2], p.wepaons[0][3])
            p.weapons[0][5] = $-1
        else
            if (p.mmrings < 1) return end
            P_SetWeaponDelay(p, p.weapons[-1][4])
            mo = P_SpawnPlayerMissile(p.mo, p.weapons[-1][2], p.weapons[-1][3])
            p.mmrings = $-1
        end
    elseif (p.currentweapon == WEP_AUTO) and (p.weapons[WEP_AUTO][5])
        P_DrainWeaponAmmo(p, WEP_AUTO)
        P_SetWeaponDelay(p, p.weapons[WEP_AUTO][4])
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_AUTO][2], p.weapons[WEP_AUTO][3])
    elseif (p.currentweapon == WEP_BOUNCE) and (p.weapons[WEP_BOUNCE][5])
        P_DrainWeaponAmmo(p, WEP_BOUNCE)
        P_SetWeaponDelay(p, p.weapons[WEP_BOUNCE][4])
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_BOUNCE][2], p.weapons[WEP_BOUNCE][3])
        if (mo) mo.fuse=105 end
    elseif (p.currentweapon == WEP_SCATTER) and (p.weapons[WEP_SCATTER][5])
        local oldz = p.mo.z
        local shotangle = p.mo.angle
        local oldaiming = p.aiming
        P_DrainWeaponAmmo(p, WEP_SCATTER)
        P_SetWeaponDelay(p, p.weapons[WEP_SCATTER][4])
        -- Center
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_BOUNCE][2], p.weapons[WEP_BOUNCE][3])
        if (mo) shotangle = R_Point2Angle(p.mo.x, p.mo.y, mo.x, mo.y) end
        -- Left
        mo = P_SPMAngle(p.mo, p.weapons[WEP_SCATTER][2], shotangle-ANG2, true, p.weapons[WEP_SCATTER][3])
        -- Right
        mo = P_SPMAngle(p.mo, p.weapons[WEP_SCATTER][2], shotangle+ANG2, true, p.weapons[WEP_SCATTER][3])
        -- Up
        p.mo.z = $ + FixedMul(786432, p.mo.scale) --12*FU
        p.aiming = $ + ANG_1
        mo = P_SPMAngle(p.mo, p.weapons[WEP_SCATTER][2], shotangle, true, p.weapons[WEP_SCATTER][3])
        -- Down
        p.mo.z = $ - FixedMul(786432, p.mo.scale) --12*FU
        p.aiming = $ - ANG_2
        mo = P_SPMAngle(p.mo, p.weapons[WEP_SCATTER][2], shotangle, true, p.weapons[WEP_SCATTER][3])
        -- Reset everything modified previously
        p.mo.z = oldz
        p.aiming = oldaiming
        return
    elseif (p.currentweapon == WEP_GRENADE) and (p.weapons[WEP_GRENADE][5])
        P_DrainWeaponAmmo(p, WEP_GRENADE)
        P_SetWeaponDelay(p, p.weapons[WEP_GRENADE][4])
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_GRENADE][2], p.weapons[WEP_GRENADE][3])
        if (mo) mo.fuse = mo.info.reactiontime end
    elseif (p.currentweapon == WEP_EXPLODE) and (p.weapons[WEP_EXPLODE][5])
        P_DrainWeaponAmmo(p, WEP_EXPLODE)
        P_SetWeaponDelay(p, p.weapons[WEP_EXPLODE][4])
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_EXPLODE][2], p.weapons[WEP_EXPLODE][3])
    elseif (p.currentweapon == WEP_RAIL) and (p.weapons[WEP_RAIL][5])
        P_DrainWeaponAmmo(p, WEP_RAIL)
        P_SetWeaponDelay(p, p.weapons[WEP_RAIL][4])
        mo = P_SpawnPlayerMissile(p.mo, p.weapons[WEP_RAIL][2], p.weapons[WEP_RAIL][3])
        -- Rail has no unique thrown object, therefore its sound plays here.
        S_StartSound(p.mo, sfx_rail1)
    else --YES, I copied & pasted this part of the code as it is in the C source code
        if (p.cuurentweapon == 0) and (p.weapons[0][5])
            P_SetWeaponDelay(p, p.weapons[0][5])
            mo = P_SpawnPlayerMissile(p.mo, p.weapons[0][2], p.wepaons[0][3])
            p.weapons[0][5] = $-1
        else
            if (p.mmrings < 1) return end
            P_SetWeaponDelay(p, p.weapons[-1][4])
            mo = P_SpawnPlayerMissile(p.mo, p.weapons[-1][2], p.weapons[-1][3])
            p.mmrings = $-1
        end
    end
end)