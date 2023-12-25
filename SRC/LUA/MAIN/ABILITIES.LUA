-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player character abbilities
-- MM constant is defined in INIT.LUA

-- For the ability limits
MM.CharStats["sonic"]={
	ability = CA_THOK,
	ability2 = CA2_SPINDASH,
	actionspd = 1966050, --30*FU
	charflags = 0,
	mindash = 327675, --5*FU
	maxdash = 2621400 --40*FU
}
MM.CharStats["tails"]={
	ability = CA_FLY,
	ability2 = CA2_SPINDASH,
	charflags = 0,
	actionspd = 3276750, --50*FU
	mindash = 327675, --5*FU
	pmaxdash = 2621400, --40*FU
}
MM.CharStats["knuckles"]={
	ability = CA_GLIDEANDCLIMB,
	ability2 = CA2_SPINDASH,
	charflags = 0,
	actionspd = 655350, --10*FU
	mindash = 327675, --5*FU
	maxdash = 2621400, --40*FU
}
MM.CharStats["amy"]={
	ability = CA_TWINSPIN,
	ability2 = CA2_MELEE,
	charflags = 384,
	actionspd = 1638375, --25*FU
	mindash = 131072, --2*FU
	maxdash = 393210, --6*FU
}
MM.CharStats["fang"]={
	ability = CA_BOUNCE,
	ability2 = CA2_NONE,
	charflags = 4480,
	actionspd = 1638375, --25*FU
	mindash = FU,
	maxdash = 2228190, --34*FU
}
MM.CharStats["metalsonic"]={
	ability = CA_FLOAT,
	ability2 = CA2_SPINDASH,
	actionspd = 1966050, --30*FU
	charflags = 1024,
	mindash = 327675, --5*FU
	maxdash = 2621400, --40*FU
}

local MMCHARMODE=CV_FindVar("mmcharmode")
local MMSPRINT=CV_FindVar("mmsprint")

addHook("PlayerThink", function(p)
	if (not p.realmo) return end
	local s = (p.realmo.skin or "sonic") -- added an or just incase the game slips
	local t = (MM.CharStats[s] or MM.CharStats["default"])
	if (gametype!=GT_MURDERMYSTERY) or (MMCHARMODE.value == 2) -- return abbilities to everyone if the gametype IS NOT MURDER MYSTERY
		p.charability = skins[s].ability
		p.charability2 = skins[s].ability2
		p.charflags = skins[s].flags
		p.actionspd = skins[s].actionspd
		p.mindash = skins[s].mindash
		p.maxdash = skins[s].maxdash
		p.normalspeed = 2359296 --36*FU
		return
	elseif (gametype==GT_MURDERMYSTERY) and (MMCHARMODE.value == 1) -- "Each character have limited abbilities" mode
		--MM.CharStats
		if (t.ability) p.charability = t.ability
		else p.charability = MM.CharStats["default"].ability end

		if (t.ability2) p.charability2 = t.ability2
		else p.charability2 = MM.CharStats["default"].ability2 end

		if (t.charflags) p.charflags = t.charflags
		else p.charflags = MM.CharStats["default"].charflags end

		if (t.actionspd) p.actionspd = t.actionspd
		else p.actionspd = MM.CharStats["default"].actionspd end

		if (t.mindash) p.mindash = t.mindash
		else p.mindash = MM.CharStats["default"].mindash end

		if (t.maxdash) p.maxdash = t.maxdash
		else p.maxdash = MM.CharStats["default"].maxdash end

		-- SA1 Tails flight by TeriosSonic
		if ((s=="tails") and (p.powers[pw_tailsfly]>70)) p.powers[pw_tailsfly]=70 end -- If your flight timer is higher than 2 seconds it will be set to 2 seconds.
		if (MMSPRINT.value)
			if ((p.cmd.buttons & BT_CUSTOM1) and (P_IsObjectOnGround(p.realmo))) p.normalspeed=2621440 --40*FU
			else p.normalspeed=1638400 end --25*FU
		end
	elseif ((gametype==GT_MURDERMYSTERY) and (not MMCHARMODE.value)) --"Everyone are regular persons" mode
		p.charability = 0
		p.charability2 = 0
		p.charflags = 0
		p.mindash = 327680 --5*FU
		p.maxdash = 2621440 --40*FU
		if (MMSPRINT.value)
			if ((p.cmd.buttons & BT_CUSTOM1) and (P_IsObjectOnGround(p.realmo))) p.normalspeed=2621440 --40*FU
			else p.normalspeed = 1638400 end --25*FU
		else
			if ((p.cmd.buttons & BT_SPIN) and (P_IsObjectOnGround(p.realmo))) --sneaking (when sprinting off)
				p.normalspeed = 131072 --2*FU
				p.sneak = true
			else
				p.normalspeed = 1638400 --25*FU
				p.sneak = false
			end
		end
	end
end)