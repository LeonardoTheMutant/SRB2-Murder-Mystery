-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player skin and abilities

local MM_ABILITIES = CV_FindVar("mm_abilities")

addHook("PlayerThink", function(p)
	if (not valid(p.mo)) return end
	local s = (p.mo.skin or "sonic") -- added an or just incase the game slips

	--Enable skin abilities if the MM_ABILITIES CVAR is enabled OR the gametype is not Murder Mystery
	if (gametype != GT_LTMMURDERMYSTERY) or (MM_ABILITIES.value)
		p.charability = skins[s].ability
		p.charability2 = skins[s].ability2
		p.charflags = skins[s].flags
		p.mindash = skins[s].mindash
		p.maxdash = skins[s].maxdash
		p.normalspeed = skins[s].normalspeed
		if (p.mm) p.mm.sneak = false end

	--"Everyone are regular persons" mode (MM_ABILITIES disabled)
	elseif ((gametype == GT_LTMMURDERMYSTERY) and (not MM_ABILITIES.value))
		p.charability = 0
		p.charability2 = 0
		p.charflags = 0
		p.mindash = 327680 --5*FU
		p.maxdash = 2621440 --40*FU
		if ((p.cmd.buttons & BT_SPIN)) --sneaking
			p.normalspeed = 196608 --3*FU
			p.mm.sneak = true
			--if (not p.speed) then p.state = S_PLAY_STND end
		else
			if (SOC_IsTrue(mapheaderinfo[gamemap].slowwalkspeed)) then p.normalspeed = 917504 --14*FU
			else p.normalspeed = 1572864 end --24*FU
			p.mm.sneak = false
		end
	end

	--disable custom skins if the admin did not allow their usage
	if (gametype == GT_LTMMURDERMYSTERY) and (not CV_FindVar("mm_customskins").value) and valid(p.mo) and (#skins[p.mo.skin] > 5)
		CONS_Printf(p, "The Game Administrator has disabled the usage of Custom Skins in the current MM game")
		R_SetPlayerSkin(p, "sonic")
	end
end)
