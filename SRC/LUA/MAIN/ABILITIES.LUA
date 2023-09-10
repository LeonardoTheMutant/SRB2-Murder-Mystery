-- ABILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player character abbilities
-- MM constant is defined in INIT.LUA

-- For the ability limits
MM.AddCharStat("sonic", {
	ability=CA_THOK,
	ability2=CA2_SPINDASH,
	actionspd=30*FU,
	charflags=0,
	mindash=5*FU,
	maxdash=40*FU
})
MM.AddCharStat("tails", {
	ability=CA_FLY,
	ability2=CA2_SPINDASH,
	charflags=0,
	actionspd=50*FU,
	mindash=5*FU,
	pmaxdash=40*FU,
})
MM.AddCharStat("knuckles", {
	ability=CA_GLIDEANDCLIMB,
	ability2=CA2_SPINDASH,
	charflags=0,
	actionspd=10*FU,
	mindash=5*FU,
	maxdash=40*FU,
})
MM.AddCharStat("amy", {
	ability=CA_TWINSPIN,
	ability2=CA2_MELEE,
	charflags=384,
	actionspd=25*FU,
	mindash=2*FU,
	maxdash=6*FU,
})
MM.AddCharStat("fang", {
	ability=CA_BOUNCE,
	ability2=CA2_NONE,
	charflags=4480,
	actionspd=25*FU,
	mindash=1*FU,
	maxdash=34*FU,
})
MM.AddCharStat("metalsonic", {
	ability=CA_FLOAT,
	ability2=CA2_SPINDASH,
	actionspd=30*FU,
	charflags=1024,
	mindash=5*FU,
	maxdash=40*FU,
})

local MMCHARMODE=CV_FindVar("mmcharmode")
local MMSPRINT=CV_FindVar("mmsprint")

addHook("PlayerThink", function(p)
	if (not p.realmo) return end
	local s=p.realmo.skin or "sonic" -- added an or just incase the game slips
	if gametype!=GT_MURDERMYSTERY -- return abbilities to everyone if the gametype IS NOT MURDER MYSTERY
		p.charability=skins[s].ability
		p.charability2=skins[s].ability2
		p.actionspd=skins[s].actionspd
		p.mindash=skins[s].mindash
		p.maxdash=skins[s].maxdash
		p.normalspeed=36*FU
		return
	elseif (gametype==GT_MURDERMYSTERY) and (MMCHARMODE.value) -- "Each character have limited abbilities" mode
		--MM.CharStats
		p.charability=MM.CharStats[s].ability or MM.CharStats["default"].ability
		p.charability2=MM.CharStats[s].ability2 or MM.CharStats["default"].ability2
		p.charflags=MM.CharStats[s].charflags or MM.CharStats["default"].charflags
		p.actionspd=MM.CharStats[s].actionspd or MM.CharStats["default"].actionspd
		p.mindash=MM.CharStats[s].mindash or MM.CharStats["default"].mindash
		p.maxdash=MM.CharStats[s].maxdash or MM.CharStats["default"].maxdash
		-- SA1 Tails flight by TeriosSonic
		if (s=="tails") and (p.powers[pw_tailsfly]>70) p.powers[pw_tailsfly]=70 end -- If your flight timer is higher than 2 seconds it will be set to 2 seconds.
		if (MMSPRINT.value)
			if (p.cmd.buttons & BT_CUSTOM1) and (P_IsObjectOnGround(p.realmo)) p.normalspeed=40*FU
			else p.normalspeed=25*FU end
		end
	elseif (gametype==GT_MURDERMYSTERY) and (not MMCHARMODE.value) --"Everyone are regular persons" mode
		p.charability=0
		p.charability2=0
		p.charflags=0
		p.mindash=5*FU
		p.maxdash=40*FU
		if (MMSPRINT.value)
			if (p.cmd.buttons & BT_CUSTOM1) and (P_IsObjectOnGround(p.realmo)) p.normalspeed=40*FU
			else p.normalspeed=25*FU end
		else
			if (p.cmd.buttons & BT_SPIN) and (P_IsObjectOnGround(p.realmo)) --sneaking (when sprinting off)
				p.normalspeed=2*FU
				p.sneak=true
			else
				p.normalspeed=25*FU
				p.sneak=false
			end
		end
	end
end)