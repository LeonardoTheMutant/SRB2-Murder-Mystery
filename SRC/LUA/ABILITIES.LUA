-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player skin and abilities

local cv_abilities = CV_FindVar("mm_abilities")
local cv_speedsneak = CV_FindVar("mm_speed_sneak")
local cv_speedwalk = CV_FindVar("mm_speed_walk")

addHook("PlayerThink", function(p)
	if (not valid(p.mo)) then return end
	local s = (p.mo.skin or "sonic") -- added an or just incase the game slips

	--Enable skin abilities if the MM_ABILITIES CVAR is enabled OR the gametype is not Murder Mystery
	if (gametype ~= GT_LTMMURDERMYSTERY) or (cv_abilities.value) then
		local skin = skins[s]
		p.charability = skin.ability
		p.charability2 = skin.ability2
		p.charflags = skin.flags
		p.normalspeed = skin.normalspeed
		local pmm = p.mm
		if (pmm) then pmm.flags = pmm.flags & ~FLAG_SNEAK end

	--"Everyone are regular persons" mode (MM_ABILITIES disabled)
	elseif ((gametype == GT_LTMMURDERMYSTERY) and (not cv_abilities.value)) then
		local pmm = p.mm
		p.charability = 0
		p.charability2 = 0
		p.charflags = 0
		if ((p.cmd.buttons & BT_SPIN)) then --sneaking
			p.normalspeed = cv_speedsneak.value * FU
			pmm.flags = pmm.flags | FLAG_SNEAK
		else
			if (SOC_IsTrue(mapheaderinfo[gamemap].mm_slowwalkspeed)) then p.normalspeed = (cv_speedwalk.value - (cv_speedwalk.value / 4) - (cv_speedwalk.value / 8))*FU --x0.625 of the normal speed
			else p.normalspeed = cv_speedwalk.value * FU end
			pmm.flags = pmm.flags & ~FLAG_SNEAK
		end
	end

	--disable custom skins if the admin did not allow their usage
	if (gametype == GT_LTMMURDERMYSTERY) and (not CV_FindVar("mm_customskins").value) and valid(p.mo) and (#skins[p.mo.skin] > 5) then
		CONS_Printf(p, "The Game Administrator has disabled the usage of Custom Skins in the current MM game")
		R_SetPlayerSkin(p, "sonic")
	end
end)
