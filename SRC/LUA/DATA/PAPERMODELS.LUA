-- PAPERMODELS.LUA
-- By Re & LeonardoTheMutant
-- Models for the PaperModel library

rawset(_G, "PaperModel_Camera", {
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
})
