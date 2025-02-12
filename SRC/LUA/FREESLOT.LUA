-- FREESLOT.LUA
--
-- Gametype definition and freeslots of the required add-on resources

G_AddGametype({
	name = "LTM_MM",
	identifier = "LTMMURDERMYSTERY",
	typeoflevel = freeslot("TOL_LTM_MM"),
	rules = GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_TIMELIMIT,
	intermissiontype = int_match,
	headerleftcolor = 37,
	headerrightcolor = 153,
	description = "\x88LeonardoTheMutant's\x80 \x87Murder Mystery\x80:\nKill everyone as \x85Murderer\x80, prevent the murders as \x84Sheriff\x80 and survive as \x83Innocent\x80!"
})

--
-- OBJECTS, STATES & SPRITES
--
freeslot(
    'MT_SHREMD',  --Sheriff's Emerald object
    'MT_MMKNIFE', --Knife weapon object
    'SPR_STEP', --Footmark sprite
    'S_MMSTEP',   --Footmark state
    'MT_MMSTEP',  --Footmark object
    'MT_DEADPLR', --Dead body object
    'S_MMSKELT',  --Dead body state (Skeleton)
    'S_SMMDEAD',  --Dead body state (Sonic)
    'S_TMMDEAD',  --Dead body state (Tails)
    'S_KMMDEAD',  --Dead body state (Knuckles)
    'S_AMMDEAD',  --Dead body state (Amy)
    'S_FMMDEAD',  --Dead body state (Fang)
    'S_MMMDEAD',  --Dead body state (Metal Sonic)
    'S_GMMDEAD',  --Dead body state (Superguide)
    'S_BMMDEAD',  --Dead body state (Bob)
    'SPR_SKEL',   --Dead body sprite (Skeleton)
    'SPR_SDED',   --Dead body sprite (Sonic)
    'SPR_TDED',   --Dead body sprite (Tails)
    'SPR_KDED',   --Dead body sprite (Knuckles)
    'SPR_ADED',   --Dead body sprite (Amy)
    'SPR_FDED',   --Dead body sprite (Fang)
    'SPR_MDED',   --Dead body sprite (Metal Sonic)
    'SPR_GDED',   --Dead body sprite (Superguide)
    'SPR_BDED'    --Dead body sprite (Bob)
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

--Knife weapon object
mobjinfo[MT_MMKNIFE]={
	spawnstate = S_SPRK1,
	radius = 4194304, --64*FU
	height = 3145728, --48*FU
	flags = MF_NOGRAVITY|MF_SPECIAL
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

--Dead body

--Skeleton state
states[S_MMSKELT]={
    sprite = SPR_SKEL,
    frame = A,
    tics = -1,
    nextstate = S_MMSKELT,
}

--Sonic state
states[S_SMMDEAD]={
    sprite = SPR_SDED,
    frame = A,
    tics = -1,
    nextstate = S_SMMDEAD,
}

--Tails state
states[S_TMMDEAD]={
    sprite = SPR_TDED,
    frame = A,
    tics = -1,
    nextstate = S_TMMDEAD,
}

--Knuckles state
states[S_KMMDEAD]={
    sprite = SPR_KDED,
    frame = A,
    tics = -1,
    nextstate = S_KMMDEAD,
}

--Amy state
states[S_AMMDEAD]={
    sprite = SPR_ADED,
    frame = A,
    tics = -1,
    nextstate = S_AMMDEAD,
}

--Fang state
states[S_FMMDEAD]={
    sprite = SPR_FDED,
    frame = A,
    tics = -1,
    nextstate = S_FMMDEAD,
}

--Metal Sonic state
states[S_MMMDEAD]={
    sprite = SPR_MDED,
    frame = A,
    tics = -1,
    nextstate = S_MMMDEAD,
}

--Superguide state
states[S_GMMDEAD]={
    sprite = SPR_GDED,
    frame = A,
    tics = -1,
    nextstate = S_GMMDEAD,
}

--Bob state
states[S_BMMDEAD]={
    sprite = SPR_BDED,
    frame = A,
    tics = -1,
    nextstate = S_MMMDEAD,
}

--Dead body object
mobjinfo[MT_DEADPLR]={
    --$Title Dead player body
    --$Sprite SKELA0
    --$Arg0 Skin (INT32)
    --$Arg0Type 11
    --$Arg0Enum {0="Skeleton"; 1="Sonic"; 2="Tails"; 3="Knuckles"; 4="Amy"; 5="Fang"; 6="Metal Sonic";}
    --$Arg1 Skincolor (SKINCOLOR_*)
    --$NotAngled
    spawnstate = S_MMSKELT,
    doomednum = 2023,
    radius = 1048576, --16*FU
    height = 1,
}

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
    'sfx_aldi'    --"I AM AT ALDI" (from "I am. All of me" by Crush40) for MAPKD ("East City")
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
