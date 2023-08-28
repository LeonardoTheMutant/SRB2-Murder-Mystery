-- ABBILITIES.LUA
-- Code by Jesus.B, Jisk and LeonardoTheMutant
--
-- This script takes care of player abbilities
-- MurderMystery variable is defined in INIT.LUA

-- For the ability limits
MurderMystery.AddCharStat("sonic", {
	ability=CA_THOK,
	ability2=CA2_SPINDASH,
	actionspd=30*FU,
	charflags=0,
	mindash=5*FU,
	maxdash=40*FU
})
MurderMystery.AddCharStat("tails", {
	ability=CA_FLY,
	ability2=CA2_SPINDASH,
	charflags=0,
	actionspd=50*FU,
	mindash=5*FU,
	pmaxdash=40*FU,
})
MurderMystery.AddCharStat("knuckles", {
	ability=CA_GLIDEANDCLIMB,
	ability2=CA2_SPINDASH,
	charflags=0,
	actionspd=10*FU,
	mindash=5*FU,
	maxdash=40*FU,
})
MurderMystery.AddCharStat("amy", {
	ability=CA_TWINSPIN,
	ability2=CA2_MELEE,
	charflags=384,
	actionspd=25*FU,
	mindash=2*FU,
	maxdash=6*FU,
})
MurderMystery.AddCharStat("fang", {
	ability=CA_BOUNCE,
	ability2=CA2_NONE,
	charflags=4480,
	actionspd=25*FU,
	mindash=1*FU,
	maxdash=34*FU,
})
MurderMystery.AddCharStat("metalsonic", {
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
	if not p.mo or p.spectator return end
	local s=p.mo.skin or "sonic" -- added an or just incase the game slips
	if gametype!=GT_MURDERMYSTERY -- return abbilities to everyone if the gametype IS NOT MURDER MYSTERY
		p.charability=skins[s].ability
		p.charability2=skins[s].ability2
		p.actionspd=skins[s].actionspd
		p.mindash=skins[s].mindash
		p.maxdash=skins[s].maxdash
	elseif gametype==GT_MURDERMYSTERY and MMCHARMODE.value -- "Each character have limited abbilities" mode
		--MurderMystery.CharStats
		p.charability=MurderMystery.CharStats[s].ability or MurderMystery.CharStats["default"].ability
		p.charability2=MurderMystery.CharStats[s].ability2 or MurderMystery.CharStats["default"].ability2
		p.charflags=MurderMystery.CharStats[s].charflags or MurderMystery.CharStats["default"].charflags
		p.actionspd=MurderMystery.CharStats[s].actionspd or MurderMystery.CharStats["default"].actionspd
		p.mindash=MurderMystery.CharStats[s].mindash or MurderMystery.CharStats["default"].mindash
		p.maxdash=MurderMystery.CharStats[s].maxdash or MurderMystery.CharStats["default"].maxdash
		-- SA1 Tails flight by TeriosSonic
		if s=="tails" and p.powers[pw_tailsfly]>70 p.powers[pw_tailsfly]=70 end -- If your flight timer is higher than 2 seconds it will be set to 2 seconds.
	elseif gametype==GT_MURDERMYSTERY and not MMCHARMODE.value --"Everyone are regular persons" mode
		p.charability=0
		p.charability2=0
		p.charflags=0
		p.mindash=5*FU
		p.maxdash=40*FU
	end
	if not P_IsObjectOnGround(p.mo) return
	else
		if gametype!=GT_MURDERMYSTERY
			p.normalspeed=36*FU
			return
		else
			if MMSPRINT.value and p.cmd.buttons & BT_CUSTOM1 p.normalspeed=40*FU --sprinting if its enabled by Admin
			elseif not MMCHARMODE.value and not MMSPRINT.value and p.cmd.buttons & BT_SPIN --sneaking (when sprinting off)
				p.normalspeed=2*FU
				p.sneak=true
			else
				p.normalspeed=25*FU
				p.sneak=nil
			end
		end
	end
end)