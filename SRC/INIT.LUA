if (MM) then
	error("\x87LTM's Murder Mystery \x81v"..MM.version.."\x80 is already loaded, only one MM add-on can be loaded at the time", 0)
	return
end

rawset(_G, "MM", {
	version = "1.3", --string, VERSION NUMBER, treat this as constant!
	debug = true, --boolean, if set to true, enable the debug functionality in MM. Do not modify this attribute during runtime, treat this as constant!
	RoleColor = { --Text Color codes for Console/Chat text, treat this as constant!
		[0] = "\x8F", --Dead
		"\x85", --Murderer
		"\x84", --Sheriff
		"\x83", --Innocent
		"\x82", --Hero
		"\x81", --Jester
	},
	RoleColorHUD = { --Text Color codes for HUD text, treat this as constant!
		[0] = "^F", --Dead
		"^5", --Murderer
		"^4", --Sheriff
		"^3", --Innocent
		"^2", --Hero
		"^1", --Jester
	},
	hud = { --variables that control the HUD renderer, not synched
		routines = {}, --collection of HUD drawing functions
		canvas = {
			width = 320,
			height = 200,
			font = {
				charwidth = 8,
				charheight = 16,
				scale = FU,
				small = {
					charwidth = 4,
					charheight = 8,
					scale = 32768 --FU/2
				}
			}
		},
		game = { --Main Game HUD
			routine = function(v, p, c) end, --actively running drawing function
			pos = {
				ringWepOnly_x = 144, --Murderer's weapon icon
				ringWep = {x=84, y=156}, --Location of the first weapon icon
				debug = {x=8, y=32}, --Debug info
			},
			roleflicker = 0,
			flash = {
				color = 0,
				duration = 0,
				translucency = 0
			}
		},
		scores = { --HUD for Scores Tab
			routine = function(v) end, --actively running drawing function
			pos = {
				playerInfo = {x=20, y=28}, --Player list
				teammateInfo = {x=20, y=136}, --Teammates list
				teammateInfoOffset1_x = 18, --Offset for current weapon icon
				teammateInfoOffset2_x = 36, --Offset for Rings counter
			}
		},
		intermission = { --Intermission HUD
			routine = function() end, --actively runnning drawing function
			pos = {
				players_y = 32,
				name_x = 24,
				kills_x = 264,
				players2_y = 40,
				name2_x = 12,
				kills2_x = 132,
			}
		},
		help = { --MMHELP UI
			active = false
		},
		minigames = {
			active = false
		}
	},
	shwdwn = false, --currently playing Showdown Duel track (also used to determine if the Duel is happening)
	susnse = false, --currently playing Suspense track
	winner = 0, --for intermission, netsynced
	winreason = 0, --for intermission, netsynced
	timelimit = 5, --for custom timelimit, netsynced
	shremds = {}, --table containing all dropped Sheriff Emeralds mobj_t values, netsynced
	shremdDist = 0, --distance to the closest Sheriff's Emerald, not synched
	pong = { --some of the variables for Pong minigame, netsynced
		ball = {x=80, y=40},
		velocity = {x=0, y=0},
		speed = 1,
		pads = {32, 32},
		hits = 0,
		padcolor = {37, 153} --player role colors
	},
	help = { --MMHELP console command related stuff
		active = false,
		page = 1,
		scroll = 1,
	},
	cameras = {}, --table containing all cameras for the current map, gets cleared every map load
	text = {}, --text strings used in the game, not synched, see the /LUA/TEXT/ directory
	lang = "EN"
})

if not isdedicatedserver then
	MM.hud.show = CV_FindVar("showhud").value
end

--Synchronized Variables
addHook("NetVars", function(net)
	MM.shremds = net(MM.shremds)
	MM.cameras = net(MM.cameras)
	MM.winner = net(MM.winner)
	MM.winreason = net(MM.winreason)
	MM.timelimit = net(MM.timelimit)
	MM.twopgame = net(MM.twopgame)
	MM.minigame = net(MM.minigame)
	MM.pong = net(MM.pong)
	MM.duelplrs = net(MM.duelplrs)
end)


--Load the library with some C functionality ported to LUA, the entire codebase relies on that lib
dofile("LIBRARIES/CAROLINE.LUA")

printf("\n\x87LeonardoTheMutant's MURDER MYSTERY \x81v%s\n", MM.version)

--
-- ENUMERATES & CONSTANTS
--

--MM player flags
enumbin(
	"FLAG_SNEAK",			--1
	"FLAG_MINIGAME",		--2
	"FLAG_WAITSPECTATOR",	--4
	"FLAG_SPECTATOR",		--8
	"FLAG_NEWCOMER"			--16
)

--Role constants
enum(
	"ROLE_DEAD",		--0
	"ROLE_MURDERER",	--1
	"ROLE_SHERIFF",		--2
	"ROLE_CIVILIAN",	--3
	"ROLE_HERO",		--4
	"ROLE_JESTER",		--5
	"ROLE_JESTERHERO"	--6
)

--Win reason constants
enum(
	"WIN_TIE",				--0
	"WIN_MURD",				--1
	"WIN_CIVILS",			--2
	"WIN_SHERIKILLINNO",	--3
	"WIN_HEROKILLINNO",		--4
	"WIN_NODEFENDERS",		--5
	"WIN_JESTERKILLED"		--6
)

--Time Zone constants
enum(
	"TIMEZONE_NONE",
	"TIMEZONE_PAST",		--1
	"TIMEZONE_PRESENT",		--2
	"TIMEZONE_FUTURE_BAD",	--3
	"TIMEZONE_FUTURE_GOOD"	--4
)

--Time Warp Sign values
enum(
	"TWS_NONE",
	"TWS_PAST",		--1
	"TWS_FUTURE"	--2
)

--Weapon Configuration subgroup flags
enumbin(
	"WEPCFG_REDONLY",	--1
	"WEPCFG_DISABLERED"	--2
)

--Kill reasons (what killed the player)
enum(
	"KILLBY_NOTHING",
	"KILLBY_PLR",	--1, by player
	"KILLBY_GAME",	--2, by game as a punishment
	"KILLBY_MAP"	--3, by map hazard
)

--Skins (number values)
enum(
	"SKIN_SONIC",		--0
	"SKIN_TAILS",		--1
	"SKIN_KNUCKLES",	--2
	"SKIN_AMY",			--3
	"SKIN_FANG",		--4
	"SKIN_METALSONIC",	--5
	"SKIN_CUSTOM"		--6
)



--
-- CVARs
--

--Additional CVAR text
local sentences = {
	[0] = "All weapons enabled",
	[1] = "Only Red/Infinite rings + Knife",
	[2] = "All weapons with Red/Infinite rings replaced by knife",
	[3] = "Knife only"
}
local sentences_civil = {
	[0] = "No weapons",
	[1] = "Red Ring + Knife",
	[2] = "Knife only"
}

--callback function called by CV_CALL flag
local function VarChange(v)
	switch(v.name, {
		["mm_abilities"] = function()
			if (v.value) then print("\x87Murder Mystery\x80: Skin abilities are Enabled (no limits)")
			else print("\x87Murder Mystery\x80: Skin abilities are Disabled (\"Regular person\" mode)") end
		end,
		["mm_allowshields"] = function()
			if (v.value) then print("\x87Murder Mystery\x80: Player shields got enabled. \x81Good luck surviving them.")
			else print("\x87Murder Mystery\x80: Disabled player shields") end
		end,
		["mm_wepcfg_civil"] = function()
			printf("%s %s%s \x81%s\x80. %s %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_CIVILIAN], "Civilian\x80 was changed to", v.value, "In other words...", sentences_civil[v.value])
		end,
		["mm_cryptic"] = function()
			if (v.value) then print("\x87Murder Mystery\x80: Nametags and most of the player counters got disabled. \x81Good Luck finding out who others are.")
			else print("\x87Murder Mystery\x80: Nametags and player counters are now enabled") end
		end,
		["mm_wepcfg_murd"] = function()
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_MURDERER], "Murderer\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value % 4], "Showdown Duel", sentences[(v.value / 4) % 4])
		end,
		["mm_wepcfg_sheri"] = function()
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_SHERIFF], "Sheriff\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value % 4], "Showdown Duel", sentences[(v.value / 4) % 4])
		end,
		["mm_wepcfg_hero"] = function()
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_HERO], "Hero\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value % 4], "Showdown Duel", sentences[(v.value / 4) % 4])
		end
	})
end
-- Flags: 4 = CV_NETVAR; 6 = CV_NETVAR|CV_CALL
CV_RegisterVar({name = "mm_wepcfg_murd", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_sheri", defaultvalue = 0, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_civil", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 2}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_hero", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_speed_walk", defaultvalue = 20, PossibleValue = {MIN = 6, MAX = 40}, flags = 4})
CV_RegisterVar({name = "mm_speed_sneak", defaultvalue = 3, PossibleValue = {MIN = 1, MAX = 5}, flags = 4})
CV_RegisterVar({name = "mm_nocamping", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_killtrails", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_footmarks", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_customskins", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_cryptic", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_autofire", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_allowshoes", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_allowshields", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_allowinvinc", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_abilities", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange})



--
-- BOOT SEQUENCE
--

--Define gametype
G_AddGametype({
	name = "LTM_MM",
	identifier = "LTMMURDERMYSTERY",
	typeoflevel = freeslot("TOL_LTM_MM")|TOL_MATCH|TOL_TAG,
	rules = GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_TIMELIMIT|GTR_SPECTATORS,
	intermissiontype = int_match,
	headerleftcolor = 37,
	headerrightcolor = 153,
	description = "\x88LeonardoTheMutant's\x80 \x87Murder Mystery\x80:\nKill everyone as \x85Murderer\x80, stop the genocide as \x84Sheriff\x80 and survive as\x83 Civilian\x80!"
})

--Load libraries
dofile("LIBRARIES/UNICODE.LUA")
dofile("LIBRARIES/MICHAELMYERS.LUA") --Core MM functionality
if (not isdedicatedserver) then dofile("LIBRARIES/HIDEO.LUA") end --HUD/Video library
dofile("LIBRARIES/DOMINICA.LUA")
dofile("LIBRARIES/PAPERMODEL.LUA")
dofile("LIBRARIES/VICTORIA.LUA")

--Load Data
print("\n\x87Murder Mystery\x80: Loading data...")
dofile("DATA/TEXT/CCMDTEXT.LUA")
dofile("DATA/TEXT/CAMTEXT.LUA")
dofile("DATA/FOOTSOUND.LUA")
dofile("DATA/FREESLOT.LUA")
if (not isdedicatedserver) then
	dofile("DATA/KEYS.LUA")
	dofile("DATA/TEXTPATCHES.LUA")
end

--Load the text and all translations
print("\n\x87Murder Mystery\x80: Loading text...")
dofile("DATA/TEXT/LANG/EN.LUA") --English text is required for the game to run on the basic level so DO NOT REMOVE OR COMMENT THIS LINE
dofile("DATA/TEXT/LANG/DE.LUA")
dofile("DATA/TEXT/LANG/ES.LUA")
dofile("DATA/TEXT/LANG/FR.LUA")
dofile("DATA/TEXT/LANG/GR.LUA")
dofile("DATA/TEXT/LANG/PL.LUA")
dofile("DATA/TEXT/LANG/RU.LUA")
dofile("DATA/TEXT/LANG/TR.LUA")
dofile("DATA/TEXT/LANG/UA.LUA")

--Script files load
print("\n\x87Murder Mystery\x80: Loading main logic scripts...")
if (MM.debug) then dofile("DEBUG.LUA") end
dofile("GAME.LUA")
dofile("WEAPONS.LUA")
dofile("OBJECTS.LUA")
if (not isdedicatedserver) then dofile("HUD.LUA") end
dofile("CHAT.LUA")
dofile("CCMD.LUA")
dofile("FOOTSTEPS.LUA")
dofile("ABILITIES.LUA")
dofile("TIMETRAVEL.LUA")
dofile("CAMERA.LUA")

--Minigames module
print("\n\x87Murder Mystery\x80: Loading minigames module...")
if (not isdedicatedserver) then dofile("MINIGAMES/HUD_MINIGAMES.LUA") end
dofile("MINIGAMES/MINIGAMES.LUA")

--Map scripts
print("\n\x87Murder Mystery\x80: Loading map scripts...")
dofile("MAPS/MAPK0.LUA")
dofile("MAPS/MAPK6.LUA")
dofile("MAPS/MAPK7.LUA")
dofile("MAPS/MAPK8.LUA")
dofile("MAPS/MAPKD.LUA")
dofile("MAPS/MAPKE.LUA")

print("\n\x87LTM's Murder Mystery\x84 add-on was loaded succesfuly\n\x82Have fun! =)\n")

if (MODVERSION ~= 56) then
	error("\x84LTM's \x87Murder Mystery \x81v"..MM.version.."\x80 was designed for \x84SRB2 v2.2.15\x80 only. You can ignore this warning, but incompatibilities may occur", 0)
end
