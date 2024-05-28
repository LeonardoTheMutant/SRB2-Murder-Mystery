-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player skin and abilities
-- MM constant is defined in INIT.LUA

local MMABILITIES = CV_FindVar("mm_abilities")
local MMCUSTOMSKINS = CV_FindVar("mm_customskins")

addHook("PlayerThink", function(p)
	if (not p.realmo) or (not p.realmo.valid) return end
	local s = (p.realmo.skin or "sonic") -- added an or just incase the game slips

	--Enable skin abilities if the MMABILITIES CVAR is enabled OR the gametype is not Murder Mystery
	if (gametype != GT_MURDERMYSTERY) or (MMABILITIES.value)
		p.charability = skins[s].ability
		p.charability2 = skins[s].ability2
		p.charflags = skins[s].flags
		p.mindash = skins[s].mindash
		p.maxdash = skins[s].maxdash
		p.normalspeed = skins[s].normalspeed
		p.sneak = false
	--"Everyone are regular persons" mode (MMABILITIES disabled)
	elseif ((gametype == GT_MURDERMYSTERY) and (not MMABILITIES.value))
		p.charability = 0
		p.charability2 = 0
		p.charflags = 0
		p.mindash = 327680 --5*FU
		p.maxdash = 2621440 --40*FU
		if ((p.cmd.buttons & BT_SPIN) and (P_IsObjectOnGround(p.realmo))) --sneaking
			p.normalspeed = 196608 --3*FU
			p.sneak = true
		else
			p.normalspeed = 1638400 --25*FU
			p.sneak = false
		end
	end
end)

addHook("ThinkFrame", do
	--disable custom skins if the admin did not allow their usage
	for p in players.iterate do
		if (gametype == GT_MURDERMYSTERY) and (not MMCUSTOMSKINS.value) and (p.realmo and p.realmo.valid) and (#skins[p.realmo.skin] > 5)
			CONS_Printf(p, "The Administrator has disabled the use of Custom Skins in the current MM game")
			R_SetPlayerSkin(p, "sonic")
		end
	end
end)
