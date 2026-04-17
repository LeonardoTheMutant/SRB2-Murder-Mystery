-- CAMERA.LUA
-- By Re & LeonardoTheMutant
-- Cameras management code

freeslot("MT_MMCAMERA", "SPR_CAMS", "MT_MMTERMINAL", "sfx_static", "sfx_camopn")

mobjinfo[MT_MMCAMERA] = {
	--$Title Survivalence Camera
	--$Sprite CAMSDRDL
	--$Arg0 Status
	--$Arg0Type 11
	--$Arg0Enum { 0="Working"; 1="Audio only"; }
	--$StringArg0 Camera name
	--$Angled
	--$SpawnCeiling
	doomednum = 2026,
	radius = 524288, --8*FU
	height = 262144, --4*FU
	flags = MF_SOLID|MF_NOGRAVITY|MF_SPAWNCEILING
}

mobjinfo[MT_MMTERMINAL] = {
	--$Title Camera Terminal
	--$Sprite CAMSARAL
	--$Arg0 Camera group no.
	--Angled
	doomednum = 2027,
	spawnstate = S_INVISIBLE,
	radius = 2097152, --32*FU
	height = 3145728  --48*FU
}

local camera_model = {
	-- camera face
	{x = 24*FRACUNIT, y = 0, z = -4*FRACUNIT, angle = ANGLE_90, sprite = SPR_CAMS, frame = A, type = 1},

	-- side panels
	{x = 8*FRACUNIT, y =  8*FRACUNIT, z = -4*FRACUNIT, sprite = SPR_CAMS, frame = B, type = 1},
	{x = 8*FRACUNIT, y = -8*FRACUNIT, z = -4*FRACUNIT, sprite = SPR_CAMS, frame = B, type = 1},

	-- top and bottom
	{x = 8*FRACUNIT, y = -4*FRACUNIT, z =  8*FRACUNIT, angle = ANGLE_90, sprite = SPR_CAMS, frame = B, type = 2},
	{x = 8*FRACUNIT, y = -4*FRACUNIT, z = -8*FRACUNIT, angle = ANGLE_90, sprite = SPR_CAMS, frame = B, type = 2},

	-- back
	{x = -8*FRACUNIT, z = -4*FRACUNIT, angle = ANGLE_90, sprite = SPR_CAMS, frame = C, type = 1},

	-- shine
	{x = 24*FRACUNIT, y =  8*FRACUNIT, z = -4*FRACUNIT, angle =  ANGLE_45, sprite = SPR_CAMS, frame = D, type = 1},
	{x = 24*FRACUNIT, y = -8*FRACUNIT, z = -4*FRACUNIT, angle = -ANGLE_45, sprite = SPR_CAMS, frame = D, type = 1},

	-- wire
	{z = 0,            sprite = SPR_CAMS, frame = E},
	--{z = 192*FRACUNIT, sprite = SPR_CAMS, frame = E},
	--{z = 384*FRACUNIT, sprite = SPR_CAMS, frame = E}
}

--
-- Cameras spawning
--
addHook("MapThingSpawn", function(mo, thing)
 	--local cam_object = PAPERMODEL.SpawnObject(mo.x, mo.y, mo.z, thing.angle*ANG1, camera_model) --Need to figure out how to make the camera's paper model disappear when player is watching through the camera
	local cam_object = {x = mo.x, y = mo.y, z = mo.z, a = thing.angle*ANG1}
	cam_object.status = tonumber(thing.args[0]) or 0
	cam_object.name = thing.stringargs[0] or "CAM"..#MM.cameras
	cam_object.tag = thing.tag
	table.insert(MM.cameras, cam_object)
	MM.DebugPrint(string.format("Camera spawned at %d %d %d with args %s %s", FixedInt(mo.x), FixedInt(mo.y), FixedInt(mo.z), thing.args[0], thing.args[1]))
end, MT_MMCAMERA)


--
-- Camera Terminal
--
addHook("MapThingSpawn", function(mo, thing)
	MM.DebugPrint(string.format("Spawned a Camera Terminal at %d %d %d", FixedInt(mo.x), FixedInt(mo.y), FixedInt(mo.z)))
end, MT_MMTERMINAL)

local cv_chasecam = CV_FindVar("chasecam")
local static_level = 0

addHook("PreThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	for p in players.iterate do
		local pcam = p.mm.camera

		pcam.available = false

		if (pcam.timer) then pcam.timer = pcam.timer - 1 end

		if (pcam.active) then
			camera.angle = MM.cameras[1].a
			p.pflags = p.pflags | PF_FULLSTASIS

			if (p.cmd.forwardmove) then p.cmd.forwardmove = 0 end

			if (p.cmd.buttons & BT_WEAPONNEXT) then
				pcam.id = pcam.id + 1
				pcam.timer = 52
				static_level = 0
				S_StartSound(nil, sfx_static, p)
				if (pcam.id > #MM.cameras) then pcam.id = 1 end
			end

			if (p.cmd.buttons & BT_WEAPONPREV) then
				pcam.id = pcam.id - 1
				pcam.timer = 52
				static_level = 0
				S_StartSound(nil, sfx_static, p)
				if not (pcam.id) then pcam.id = #MM.cameras end
			end

			if ((p.cmd.buttons & BT_JUMP) or (p.cmd.buttons & BT_SPIN)) and not (pcam.timer) then
				p.cmd.buttons = 0
				MM.hud.game.routine = MM.hud.routines["game_main"]
				MM.hud.scores.routine = MM.hud.routines["scores_main"]
				pcam.active = false
				pcam.timer = 3
				S_StartSound(nil, sfx_camopn, p)
			end

			p.cmd.buttons = 0
			p.cmd.forwardmove = 0
			p.cmd.sidemove = 0
		end
	end
end)

addHook("PostThinkFrame", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	local p = consoleplayer

	if valid(p) and (p.mm.camera.active) then
		local cam_id = p.mm.camera.id
		P_TeleportCameraMove(camera, MM.cameras[cam_id].x, MM.cameras[cam_id].y, MM.cameras[cam_id].z)
		camera.angle = MM.cameras[cam_id].a
		camera.aiming = 0
		if (p.cmd.sidemove) then
			camera.angle = camera.angle - ((p.cmd.sidemove * ANG1) / 15)
		end
	end
end)

--Reset cameras on Map Change and disable Terminal view for all players
addHook("MapChange", function()
	if (gametype ~= GT_LTMMURDERMYSTERY) then return end

	MM.cameras = {}
	for p in players.iterate do
		if (p.mm.camera.active) then
			p.mm.camera.active = false
			MM.ResetHUD(p)
		end
	end
end)

--
-- Terminal screen renderer
--
-- Renderer
local moire_step = 8
local noise_pixel_multiplier = 4
local function terminal_renderer(v)
	local width = v.width()
	local height = v.height()

	local p = consoleplayer
	local c = camera

	hud.disable("rankings")

	if not (CV_FindVar("chasecam").value) then
		v.drawFill(0, 0, width, height, 152|V_NOSCALESTART)
		HIDEO.DrawStrUnicode(v, 0, 0, HIDEO.WordWrap(0, width/v.dupx(), 0, MM.hud.canvas.font.small.scale, string.format(cam_require_3rdperson, p.rings, tostring(p), tostring(p.mm), tostring(p.mm.camera), tostring(MM))), V_SNAPTOTOP|V_SNAPTOLEFT, MM.hud.canvas.font.small.scale)
		return
	end

	if (MM.cameras[p.mm.camera.id].status) then v.drawFill()
	else v.drawFill(0, 0, width, height, 31|V_60TRANS|V_NOSCALESTART) end

	--Draw White Noise static
	if (static_level < 9) and not (leveltime % 4) then static_level = static_level + 1 end
	for y = 0, MM.hud.canvas.height, noise_pixel_multiplier do
		for x = 0, MM.hud.canvas.width, noise_pixel_multiplier do
			v.drawFill(x, y, noise_pixel_multiplier, noise_pixel_multiplier, v.RandomRange(0, 31)|V_SNAPTOTOP|V_SNAPTOLEFT|(static_level*65536))
		end
	end

	v.drawString(0, 0, MM.cameras[p.mm.camera.id].name, V_SNAPTOTOP|V_SNAPTOLEFT)
	if (MM.cameras[p.mm.camera.id].status) then v.drawString(0, 8, "No video signal", V_SNAPTOTOP|V_SNAPTOLEFT) end
	v.drawString(0, 192, "JUMP or SPIN to exit", V_SNAPTOBOTTOM|V_SNAPTOLEFT)
	v.drawString(0, 184, "NEXT/PREV WEAPON to switch", V_SNAPTOBOTTOM|V_SNAPTOLEFT)

	--Draw moire effect
	for i = 0, height, moire_step do
		v.drawFill(0, (-moire_step + i + (leveltime % (moire_step))), width, 4, 31|V_90TRANS|V_NOSCALESTART)
	end
end

--
-- Terminal view toggle
--
-- This logic could be much more simple if "TouchSpecial" hook was used, but for some reason
-- it executes twice per tic for me so I am forced to do more complicated things
addHook("MobjThinker", function(mo)
	searchBlockmap("objects", function(ref, found)
		if (ref == found) then return end --ignore itself

		if (found.type == MT_PLAYER) and (AngleFixed(found.angle) > AngleFixed(ref.angle - ANG30)) and (AngleFixed(found.angle) < AngleFixed(ref.angle + ANG30))
		and (R_PointToDist2(found.x, found.y, ref.x, ref.y) < ref.radius) and (found.z <= (ref.z + ref.height)) and (found.z >= ref.z) then
			local p = found.player
			p.mm.camera.available = true
			if (p.cmd.buttons & BT_CUSTOM1) and not (p.lastbuttons & BT_CUSTOM1) and not (p.mm.camera.active) then
				if (p == consoleplayer) then
					MM.hud.game.routine = terminal_renderer
					MM.hud.scores.routine = terminal_renderer
					static_level = 0
					S_StartSound(nil, sfx_camopn, p)
					S_StartSound(nil, sfx_static, p)
				end
				p.mm.camera.active = true
			end
		end
	end, mo, mo.x - mo.radius, mo.x + mo.radius, mo.y - mo.radius, mo.y + mo.radius)

	return true
end, MT_MMTERMINAL)
