-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player skin and abilities

local MM_ABILITIES = CV_FindVar("mm_abilities")
local speedsneakCVAR = CV_FindVar("mm_speed_sneak")
local speedwalkCVAR = CV_FindVar("mm_speed_walk")

addHook("PlayerThink", function(p)
	if (not valid(p.mo)) return end
	local s = (p.mo.skin or "sonic") -- added an or just incase the game slips

	--Enable skin abilities if the MM_ABILITIES CVAR is enabled OR the gametype is not Murder Mystery
	if (gametype != GT_LTMMURDERMYSTERY) or (MM_ABILITIES.value)
		p.charability = skins[s].ability
		p.charability2 = skins[s].ability2
		p.charflags = skins[s].flags
		p.normalspeed = skins[s].normalspeed
		if (p.mm) p.mm.sneak = false end

	--"Everyone are regular persons" mode (MM_ABILITIES disabled)
	elseif ((gametype == GT_LTMMURDERMYSTERY) and (not MM_ABILITIES.value))
		p.charability = 0
		p.charability2 = 0
		p.charflags = 0
		if ((p.cmd.buttons & BT_SPIN)) --sneaking
			p.normalspeed = speedsneakCVAR.value << FRACBITS
			p.mm.sneak = true
		else
			if (SOC_IsTrue(mapheaderinfo[gamemap].mm_slowwalkspeed)) then p.normalspeed = (speedwalkCVAR.value - (speedwalkCVAR.value >> 2) - (speedwalkCVAR.value >> 3)) << FRACBITS --x0.625 of the normal speed
			else p.normalspeed = speedwalkCVAR.value << FRACBITS end
			p.mm.sneak = false
		end
	end

	--disable custom skins if the admin did not allow their usage
	if (gametype == GT_LTMMURDERMYSTERY) and (not CV_FindVar("mm_customskins").value) and valid(p.mo) and (#skins[p.mo.skin] > 5)
		CONS_Printf(p, "The Game Administrator has disabled the usage of Custom Skins in the current MM game")
		R_SetPlayerSkin(p, "sonic")
	end
end)
