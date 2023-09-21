-- SLOPEROLL.LUA
-- Original code by Golden (https://mb.srb2.org/threads/sloperollangle-character-rotation-on-slopes.27164/)
-- Modified by LeonardoTheMutant

-- sloperollangle.lua by Golden
-- Angles characters on the side of slopes without requiring additional sprites.
-- v3 now includes the togglable ability to use camera rolling. Default off, because motion sickness.

-- hello hacker fucker this is golden heres the deal. if you steal this lua i will find you and break your legs and thats a promise
-- LeonardoTheMutant: Go ahead, you made this script Open Asset on SRB2 MB so try to sue me now (:P)

local cv_cameraroll = CV_RegisterVar{"cameraroll", "off", 0, CV_OnOff}
local cv_cam_rollspeed = CV_RegisterVar{"cam_rollspeed", "0.1", 16, {MIN=0, MAX=FRACUNIT}} --CV_FLOAT

--CV_RegisterVar{"cv_", "off", CV_NETVAR, CV_OnOff, func} --what is this for?

-- Centers you!
local function resetRollAngle(rollangle)
	-- The speed at which you are centered at.
	local speed = FixedAngle(6*FRACUNIT)

	if (rollangle > FixedAngle(0) + speed) then rollangle = $ - speed -- rollangle more than centered + centering speed? - Subtract the speed!
	elseif (rollangle < FixedAngle(0) - speed) then rollangle = $ + speed -- rollangle less than centered - centering speed? - Add the speed!
	else rollangle = FixedAngle(0) end-- rollangle between +centering speed and -centering speed? - Center!

	return rollangle -- Return the resulting rollangle.
end

local function getSlopeAngleForRollAngle(mo, dontflip)
	local lookAngle = R_PointToAngle(mo.x, mo.y) -- Get the angle that we're looking from.

	if (not R_PointToDist(mo.x, mo.y)) then lookAngle = mo.angle end -- Camera at player? - Use player angle instead of whatever R_PointToAngle generates..

	-- zangle and direction of the slope we're on (if any).
	local zangle = mo.standingslope.zangle
	local xydirection = mo.standingslope.xydirection

	if ((mo.eflags & MFE_VERTICALFLIP) and (not dontflip)) then zangle = InvAngle(zangle) end-- Flipped? - Flip the zangle too!

	-- Fancy angle math that rolls the sprite against the slope.
	-- Trust me on this one.
	return FixedMul(zangle, sin(lookAngle - xydirection))
end

local function normalPlayerStuff(mo)
	-- Generic sanity checks.
	if (not mo.subsector) or (not mo.subsector.sector) return end

	local player = mo.player -- Get player
	local sector = mo.subsector.sector -- Get sector

	if (not P_IsObjectOnGround(mo)) then -- Off the ground?
		if (not player.sloperollangle_override) then mo.rollangle = resetRollAngle(mo.rollangle) end -- Center that rollangle!

		if (cv_cameraroll.value) and (player.viewrollangle != nil) then -- They've enabled the camera rolling? - Smoothly reset it to 0.
			player.viewrollangle = FixedMul($, FRACUNIT - cv_cam_rollspeed.value)
		end

		return -- Don't continue.
	end

	if (player.pflags & PF_SPINNING) and (mo.standingslope) then -- Spinning?
		if (not player.sloperollangle_override) then mo.rollangle = FixedAngle(0) end -- Reset rollangle.

		if (cv_cameraroll.value) and (player.viewrollangle ~= nil) then -- They've enabled the camera rolling?
			-- Instead of resetting,
			-- calculate the normal camera rolling.
			-- Spinning shouldn't effect the camera roll!
			player.viewrollangle = $ - FixedMul(getSlopeAngleForRollAngle(mo, true) + $, cv_cam_rollspeed.value)
		end

		return -- Don't continue.
	elseif (not mo.standingslope) then -- No slope?
		if (not player.sloperollangle_override) then mo.rollangle = FixedAngle(0) end -- Reset rollangle.

		if (cv_cameraroll.value) and (player.viewrollangle != nil) then -- They've enabled the camera rolling?
			-- Adjust camera for maximum motion sickness.
			player.viewrollangle = FixedMul($, FRACUNIT - cv_cam_rollspeed.value) -- Smoothly reset it to 0.
		end

		return -- Don't continue.
	end

	-- Use fancy formula that sets the player's roll angle to what it should be.
	if (not player.sloperollangle_override) then mo.rollangle = getSlopeAngleForRollAngle(mo) end

	if (cv_cameraroll.value) and (player.viewrollangle != nil) then -- They've enabled the camera rolling?
		-- Adjust camera for maximum motion sickness.
		player.viewrollangle = $ - FixedMul(getSlopeAngleForRollAngle(mo, true) + $, cv_cam_rollspeed.value)
	end
end

local function mobjThinker(mo)
	if (gametype!=GT_MURDERMYSTERY) return end
	-- Generic sanity checks.
	if (not mo.player) return end

	local p = mo.player

	if (not cv_cameraroll.value) and (p.viewrollangle != nil) then -- Off, but viewroll exists?
		p.viewrollangle = FixedMul($, FRACUNIT - cv_cam_rollspeed.value) -- Smoothly reset it to 0.
	end

	normalPlayerStuff(mo)
end

-- Tails overlay thinker, for Tails' tails.
local function tailsOverlay(tails)
	if (gametype!=GT_MURDERMYSTERY) return end
	-- Check if Tails exists.
	if (not tails.tracer) or (not tails.tracer.player) return end

	if (not tails.tracer.player.sloperollangle_override) tails.rollangle = tails.tracer.rollangle end -- Set our rollangle to Tails's rollangle.
	-- ~ Fin ~
end

-- Add le hooks.
addHook("MobjThinker", mobjThinker, MT_PLAYER)
addHook("MobjThinker", tailsOverlay, MT_TAILSOVERLAY)