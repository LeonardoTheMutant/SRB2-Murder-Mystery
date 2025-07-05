-- FREESLOT.LUA
--
-- Gametype definition and freeslots of the required add-on resources

G_AddGametype({
	name = "LTM_MM",
	identifier = "LTMMURDERMYSTERY",
	typeoflevel = freeslot("TOL_LTM_MM")|TOL_MATCH|TOL_TAG,
	rules = GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_TIMELIMIT,
	intermissiontype = int_match,
	headerleftcolor = 37,
	headerrightcolor = 153,
	description = "\x88LeonardoTheMutant's\x80 \x87Murder Mystery\x80:\nKill everyone as \x85Murderer\x80, stop the genocide as \x84Sheriff\x80 and survive as\x83 Civilian\x80!"
})

--
-- OBJECTS, STATES & SPRITES
--
freeslot(
	'MT_SHREMD',  --Sheriff's Emerald object
	'MT_PONGOVERLAY', --Pong overlay bubble object
	'SPR_PNGO', --Pong overlay bubble sprite
	'S_PNGOVR1', --Pong overlay bubble state
	'S_PNGOVR2', --Pong overlay bubble state
	'S_PNGOVR3', --Pong overlay bubble state
	'S_PNGOVR4', --Pong overlay bubble state
	'S_PNGOVR5', --Pong overlay bubble state
	'S_PNGOVR6', --Pong overlay bubble state
	'SPR_STEP', --Footmark sprite
	'S_MMSTEP',   --Footmark state
	'MT_MMSTEP',  --Footmark object
	'MT_DEADPLR', --Dead body object
	'S_MMPLRDEAD',--Dead player body state
	'SPR2_SHIT',  --Dead player body Sprite2
	'S_MMSKELT',  --Dead player body state (Skeleton)
	'SPR_SKEL'    --Dead player body sprite (Skeleton)
)

--Sheriff's Emerald object
mobjinfo[MT_SHREMD]={
	spawnstate = S_CEMG3,
	deathstate = S_SPRK1,
	deathsound = sfx_cgot,
	radius = 1048576, --16*FU
	height = 1048576, --16*FU
	flags = MF_SPECIAL
}

--Footmark state
states[S_MMSTEP]={
	sprite = SPR_STEP,
	frame = FF_SEMIBRIGHT|FF_FLOORSPRITE|A,
	tics = 700, --20 seconds
	nextstate = S_NULL
}

--Footmark object
mobjinfo[MT_MMSTEP] = {
	spawnstate = S_MMSTEP,
	height = 1,
	flags = MF_NOGRAVITY
}

--Dead player body state

states[S_MMPLRDEAD] = {
	sprite = SPR_PLAY,
	frame = SPR2_SHIT|A,
	tics = -1,
	nextstate = S_MMPLRDEAD
}

--Skeleton state
states[S_MMSKELT]={
	sprite = SPR_SKEL,
	frame = A,
	tics = -1,
	nextstate = S_MMSKELT,
}

--Dead player body object
mobjinfo[MT_DEADPLR]={
	--$Title Dead player body
	--$Sprite SKELA0
	--$Arg0 Skincolor (SKINCOLOR_*)
	--$StringArg0 Skin (string)
	--$NotAngled
	spawnstate = S_MMSKELT,
	doomednum = 2023,
	radius = 1048560, --16*FU
	height = 1,
	flags = MF_SPECIAL
}


--Pong overlay object
mobjinfo[MT_PONGOVERLAY]={
	spawnstate = S_PNGOVR1,
	flags = MF_NOGRAVITY
}
--Pong overlay states
states[S_PNGOVR1] = {SPR_PNGO, A, 12, nil, 0, 0, S_PNGOVR2}
states[S_PNGOVR2] = {SPR_PNGO, B, 12, nil, 0, 0, S_PNGOVR3}
states[S_PNGOVR3] = {SPR_PNGO, C, 12, nil, 0, 0, S_PNGOVR4}
states[S_PNGOVR4] = {SPR_PNGO, D, 12, nil, 0, 0, S_PNGOVR5}
states[S_PNGOVR5] = {SPR_PNGO, E, 12, nil, 0, 0, S_PNGOVR6}
states[S_PNGOVR6] = {SPR_PNGO, F, 12, nil, 0, 0, S_PNGOVR1}

--
-- SOUNDS
--
freeslot(
	--Death SFX
	'sfx_mmdth1', --Super Mario World: Game Over theme
	'sfx_mmdth2', --Among Us: Death theme
	'sfx_mmdth3', --DOOM: Player death SFX 1
	'sfx_mmdth4', --DOOM: Player death SFX 2
	'sfx_mmdth5', --Sonic Adventure: Knuckles' "Oh no!"
	'sfx_mmdth6', --Meme scream/pain
	'sfx_mmdth7', --Michael Jackson's Moonwalker (Sega Mega Drive): Title theme
	'sfx_mmdth8', --Metal Gear Solid: Game Over theme
	'sfx_mmdth9', --Metal Gear Solid: Solid Snake's death

	--SFX for maps
	'sfx_fallin', --Falling SFX
	'sfx_aldi',   --"I AM AT ALDI" (from "I am. All of me" by Crush40) for MAPKD ("East City")
	'sfx_consle'  --Computer beeping
)

--Captions
--Death SFX
sfxinfo[sfx_mmdth1].caption = "\25 Good Night"
sfxinfo[sfx_mmdth2].caption = "Killed"
sfxinfo[sfx_mmdth3].caption = "Killed"
sfxinfo[sfx_mmdth4].caption = "Killed"
sfxinfo[sfx_mmdth5].caption = "OH NO!"
sfxinfo[sfx_mmdth6].caption = "Pain"
sfxinfo[sfx_mmdth7].caption = "Moonwalker"
sfxinfo[sfx_mmdth8].caption = "Game Over"
sfxinfo[sfx_mmdth9].caption = "AAAARGH..."

MM.death_sfx = { --Add the SFX to the global table
	sfx_mmdth1, --Super Mario World: Game Over theme
	sfx_mmdth2, --Among Us: Death theme
	sfx_mmdth3, --DOOM: Doomguy death 1
	sfx_mmdth4, --DOOM: Doomguy death 2
	sfx_mmdth5, --Sonic Adventure: Knuckles' "OH NO"
	sfx_mmdth6, --Pain meme sfx
	sfx_mmdth7, --Michael Jackson's Moonwalker (Sega Mega Drive): Intro theme
	sfx_mmdth8, --Metal Gear Solid: Game Over theme
	sfx_mmdth9  --Metal Gear Solid: Solid Snake's death
}

--Maps
sfxinfo[sfx_fallin].caption = "Falling..."
sfxinfo[sfx_aldi].caption = "\25 I AM AT ALDI"
sfxinfo[sfx_consle].caption = "Console working"
