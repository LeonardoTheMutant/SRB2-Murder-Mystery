-- PaperModel
-- Made by Re & LeonardoTheMutant
-- Easy library for Objects made of objects.

rawset(_G, "PAPERMODEL", {})

freeslot("MT_MODELFACE")
mobjinfo[MT_MODELFACE] = {
	doomednum = -1,
	spawnstate = S_INVISIBLE,
	flags = MF_NOGRAVITY|MF_NOCLIP|MF_NOCLIPHEIGHT,
}

-- PaperModel Data Format (in C)
--[[

//Model's face (part of the model)
typedef struct {
	fixed_t x;     // X offset from model's origin point
	fixed_t y;     // Y
	fixed_t z;     // Z
	fixed_t angle; // Angle of the face (Z axis) relative to origin point's 0 degree
	fixed_t roll;  // Face's roll angle (X/Y axis)
	fixed_t scale; // Sprite's scale
	spritenum_t sprite; // SPR_* sprite
	UNIT32 frame;  // Sprite's frame number (A, B, C, etc.)
	UINT8 type;    // Face type: 0 will treat face as a regular object sprite, 1 is paper sprite, 2 is floor splat
} papermodel_face_t

//Paper model itself
typedef struct {
	papermodel_face_t *faces; // Table of faces (parts) to make the model with
} papermodel_model_t

//Paper model object. Is is strongly recomended to NOT modify values in this struct directly.
//Use helper functions provided by this library instead
typedef struct {
	fixed_t x; // X position
	fixed_t y; // Y position
	fixed_t z; // Z position
	fixed_t a; // Angle
	mobj_t *faces; // Table of mobj_t objects that are currently acting as model's faces
} papermodel_object_t

]]

--
-- PaperModel object spawner
--

--papermodel_object_t PAPERMODEL.SpawnObject(fixed_t x, fixed_t y, fixed_t z, papermodel_model_t model)
PAPERMODEL.SpawnObject = function(xpos, ypos, zpos, angle, model)
	xpos = xpos or 0
	ypos = ypos or 0
	zpos = zpos or 0
	angle = angle or 0

	local object = {x = xpos, y = ypos, z = zpos, a = angle, faces = {}}
	local entry
	local face

	if (model)
		for i = 1, #model do
			entry = model[i]

			--Handle default values
			entry.x = entry.x or 0
			entry.y = entry.y or 0
			entry.z = entry.z or 0
			entry.angle = entry.angle or 0
			entry.roll = entry.roll or 0
			entry.scale = entry.scale or FRACUNIT
			entry.sprite = entry.sprite or SPR_THOK
			entry.frame = entry.frame or A
			entry.type = entry.type or 0

			--print(string.format("===\n%d %d %d\n%d %d\n%d\n%d %d %d\n===", FixedInt(entry.x), FixedInt(entry.y), FixedInt(entry.z), FixedInt(AngleFixed(entry.angle)), FixedInt(AngleFixed(entry.roll)), FixedInt(entry.scale), entry.sprite, entry.frame, entry.type))
			face = P_SpawnMobj(xpos + FixedMul(entry.x, cos(angle)) - FixedMul(entry.y, sin(angle)), ypos + FixedMul(entry.x, sin(angle)) + FixedMul(entry.y, cos(angle)), zpos + (entry.z or 0), MT_MODELFACE)
			face.angle = angle + entry.angle
			face.roll = entry.roll
			face.scale = entry.scale
			face.sprite = entry.sprite
			face.frame = entry.frame
			if (entry.type == 1) then
				face.renderflags = face.renderflags | RF_PAPERSPRITE
			elseif (entry.type == 2) then
				face.renderflags = face.renderflags | RF_FLOORSPRITE | RF_NOSPLATBILLBOARD
			end
			table.insert(object.faces, face)
		end
	end

	return object
end

--
-- PaperModel object despawner
--

--void PAPERMODEL.DespawnObject(papermodel_object_t)
PAPERMODEL.DespawnObject = function(object)
	if (object) then
		for i = 1, #object do
			P_RemoveMobj(object[i])
		end
		object = nil
	end
end

--[[
local setOffsets = function(mo, tbl, base)
	local cx, cy = base.x + tbl[4], base.y + tbl[5]
	local px, py = base.x, base.y
	mo.xoff = FixedMul(tbl[4], cos(base.angle)) - FixedMul(tbl[5], sin(base.angle))
	mo.yoff = FixedMul(tbl[4], sin(base.angle)) + FixedMul(tbl[5], cos(base.angle))
	--print(mo.xoff/FRACUNIT .. ", " .. mo.yoff/FRACUNIT)
	--local d = R_PointToDist2(cx, cy, px, py)
	--mo.xoff = d*cos(base.angle)
	--mo.yoff = d*sin(base.angle)
	--mo.xoff = tbl[4]
	--mo.yoff = tbl[5]
	mo.zoff = tbl[6]
	mo.angle = base.angle + tbl[7]
end

-- Spawns a PaperModel
PAPERMODEL.spawnModel = function(base, dta)
	base.model = dta
	base.curmodel = {}
	base.modelframe = 1
	for k2,tbl in ipairs(dta[1]) do -- spawn using frame 1
		local mo = P_SpawnMobj(base.x, base.y, base.z, MT_MODELPIVOT)
		setOffsets(mo, tbl, base)
		--mo.xoff = tbl[4]
		--mo.yoff = tbl[5]
		--mo.angle = base.angle + tbl[7]
		mo.sprite = tbl[1]
		mo.frame = tbl[2]
		mo.scale = tbl[3]
		mo.rollangle = tbl[8]
		if tbl[9] == true or tbl[9] == 1 then
			mo.renderflags = $|RF_PAPERSPRITE
		end
		if tbl[9] == 2 then
			mo.renderflags = $|RF_FLOORSPRITE|RF_NOSPLATBILLBOARD
		end

		mo.tracer = base
		table.insert(base.curmodel, mo)
	end
end

-- Action for spawning a model, var1 shall be used as the table.
-- Just in case you're a freak that likes SOC.
-- If tables are even possible in SOC...
function A_SpawnModel(mo, dta)
	PAPERMODEL.spawnModel(mo, dta)
end

-- Sets a MOBJ's PaperModel's frame
PAPERMODEL.setFrame = function(base, frame)
	if frame == nil then return

	if base.model == nil then
		error("MOBJ has no PaperModel! Use PAPERMODEL.spawnModel() before calling this function.")
		return
	end

	if base.model[frame] == nil then
		error("Frame " .. frame .. " does not exist!")
		return
	end
	if #base.model[frame] ~= #base.curmodel then
		error("Frames must have the same number of objects!")
		return
	end

	base.modelframe = frame

	for k,mo in ipairs(base.curmodel) do
		local tbl = base.model[frame][k]
		--P_SpawnMobj(base.x, base.y, base.z, MT_MODELPIVOT)
		setOffsets(mo, tbl, base)
		P_MoveOrigin(mo, base.x + mo.xoff, base.y + mo.yoff, base.z + mo.zoff)
		mo.sprite = tbl[1]
		mo.frame = tbl[2]
		mo.scale = tbl[3]
		mo.rollangle = tbl[8]
		if tbl[9] == true or tbl[9] == 1 then
			mo.renderflags = $|RF_PAPERSPRITE
		end
		if tbl[9] == 2 then
			mo.renderflags = $|RF_FLOORSPRITE|RF_NOSPLATBILLBOARD
		end
	end
end

PAPERMODEL.moveModel = function(base)
	if base.model then
		for k,mo in ipairs(base.curmodel) do
			local tbl = base.model[base.modelframe][k]
			setOffsets(mo, tbl, base)
			P_MoveOrigin(mo, base.x + mo.xoff, base.y + mo.yoff, base.z + mo.zoff)
			if tbl[9] == true or tbl[9] == 1 then
				mo.renderflags = $|RF_PAPERSPRITE
			end
			if tbl[9] == 2 then
				mo.renderflags = $|RF_FLOORSPRITE|RF_NOSPLATBILLBOARD
			end
		end
	end
end

]]
