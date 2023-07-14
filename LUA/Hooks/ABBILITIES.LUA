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
	actionspd=15*FU,
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

local function VarChange(v)
	if v.name=="mmcharmode"
		if v.value print("\x87Murder Mystery:\x80 Vanilla character abbilities turned ON, but in limited form")
		else print("\x87Murder Mystery:\x80 \"Regular person\" character mode enabled (abbilities off)") end
	elseif v.name=="mmsprint"
		if v.value print("\x87Murder Mystery:\x80 Everyone now can use sprinting by holding CUSTOM1 button!")
		else print("\x87Murder Mystery:\x80 Sprinting is now disabled") end
	end
end
local MMCHARMODE=CV_RegisterVar{name="mmcharmode",defaultvalue=0,PossibleValue=CV_OnOff,flags=6,func=VarChange}
local MMSPRINT=CV_RegisterVar{name="mmsprint",defaultvalue=0,PossibleValue=CV_OnOff,flags=6,func=VarChange}

addHook("PlayerThink", function(p)
	if not p.mo or p.spectator return end
	local skin=p.mo.skin or "sonic" -- added an or just incase the game slips
	if gametype!=GT_MURDERMYSTERY -- return abbilities to everyone if the gametype IS NOT MURDER MYSTERY
		p.charability=skins[skin].ability
		p.charability2=skins[skin].ability2
		p.actionspd=skins[skin].actionspd
		p.mindash=skins[skin].mindash
		p.maxdash=skins[skin].maxdash
	elseif gametype==GT_MURDERMYSTERY and MMCHARMODE.value -- "Each character have limited abbilities" mode
		--MurderMystery.CharStats
		p.charability=MurderMystery.CharStats[skin].ability or MurderMystery.CharStats["default"].ability
		p.charability2=MurderMystery.CharStats[skin].ability2 or MurderMystery.CharStats["default"].ability2
		p.charflags=MurderMystery.CharStats[skin].charflags or MurderMystery.CharStats["default"].charflags
		p.actionspd=MurderMystery.CharStats[skin].actionspd or MurderMystery.CharStats["default"].actionspd
		p.mindash=MurderMystery.CharStats[skin].mindash or MurderMystery.CharStats["default"].mindash;
		p.maxdash=MurderMystery.CharStats[skin].maxdash or MurderMystery.CharStats["default"].maxdash
		-- SA1 Tails flight by TeriosSonic
		if p.mo.skin=="tails" and p.powers[pw_tailsfly]>70 p.powers[pw_tailsfly]=70 end -- If your flight timer is higher than 2 seconds it will be set to 2 seconds.
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
			elseif not MMCHARMODE.value and not MMSPRINT.value and p.cmd.buttons & BT_SPIN and P_IsObjectOnGround(p.mo) --sneaking (when sprinting off)
				p.normalspeed=2*FU
				p.sneak=true
			else
				p.normalspeed=25*FU
				p.sneak=nil
			end
		end
	end
end)