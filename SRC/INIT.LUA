if (MM)
	error("LTM's Murder Mystery v"..MM.version.." is already loaded, only one MM add-on can be loaded at the time", 0)
	return
end

rawset(_G, "MM", {
	version = "1.3", --string, VERSION NUMBER
	debug = true, --boolean, if set to true, enable the debug functionality in MM. Do not modify this attribute during runtime
	RoleColor = { --Text Color codes for Console/Chat text
		"\x85", --Murderer
		"\x84", --Sheriff
		"\x83", --Innocent
		"\x82", --Hero
		"\x8F" --Dead
	},
	RoleColorHUD = { --Text Color codes for HUD text
		"\1\x85", --Murderer
		"\1\x84", --Sheriff
		"\1\x83", --Innocent
		"\1\x82", --Hero
		"\1\x8F" --Dead
	},
	hud = { --variables that control the HUD renderer
		game = { --Main Game HUD
			active = true,
			pos = {
				ringWepOnly = {x = 144}, --Murderer's weapon icon
				ringWep = {x=84, y=156}, --Location of the first weapon icon
				debug = {x=8, y=48}, --Debug info
			}
		},
		scores = { --HUD for Scores Tab
			active = true,
			pos = {
				playerInfo = {x=20, y=28}, --Player list
				teammateInfo = {x=20, y=136}, --Teammates list
				teammateInfoOffset1 = {x=18}, --Offset for current weapon icon
				teammateInfoOffset2 = {x=36}, --Offset for Rings counter
			}
		},
		intermission = { --Intermission HUD
			active = true,
			pos = {
				players = {y=32},
				name = {x=24},
				kills = {x=264},
				players2 = {y=40},
				name2 = {x=12},
				kills2 = {x=132},
			}
		},
		minigames = {
			active = false,
		}
	},
	shwdwn = false, --currently playing Showdown Duel track (also used to determine if the Duel is happening)
	susnse = false, --currently playing Suspense track
	winner = 0, --for intermission, netsynced
	winreason = 0, --for intermission, netsynced
	timelimit = 5, --for custom timelimit, netsynced
	shremds = {}, --table containing all dropped Sheriff Emeralds mobj_t values, netsynced
	pong = { --some of the variables for Pong minigame, netsynced
		ball = {x=80, y=40},
		velocity = {x=0, y=0},
		speed = 1,
		pads = {32, 32},
		hits = 0,
		padcolor = {37, 153} --player role colors
	},
	text = {}
})

--Synchronized Variables
addHook("NetVars", function(net)
	MM.shremds = net($)
	MM.winner = net($)
	MM.winreason = net($)
	MM.timelimit = net($)
	MM.twopgame = net($)
	MM.minigame = net($)
	MM.pong = net($)
	MM.duelplrs = net($)
end)


--Load the library with some C functionality ported to LUA
dofile("LIBRARIES/CAROLINE.LUA")

printf("\n\x87LTM's MURDER MYSTERY \x81v%s\n", MM.version)

--
-- ENUMERATES
--

--Role constants
enum(
	"ROLE_NONE",
	"ROLE_MURDERER", --1
	"ROLE_SHERIFF",  --2
	"ROLE_CIVILIAN", --3
	"ROLE_HERO"      --4
)

--Win reason constants
enum(
	"WIN_NONE",
	"WIN_MURD",          --1
	"WIN_CIVILS",        --2
	"WIN_SHERIKILLINNO", --3
	"WIN_HEROKILLINNO",  --4
	"WIN_NODEFENDERS"    --5
)

--Time Zone constants
enum(
	"TIMEZONE_NONE",
	"TIMEZONE_PAST",       --1
	"TIMEZONE_PRESENT",    --2
	"TIMEZONE_FUTURE_BAD", --3
	"TIMEZONE_FUTURE_GOOD" --4
)

--Time Warp Sign values
enum(
	"TWS_NONE",
	"TWS_PAST",  --1
	"TWS_FUTURE" --2
)

--Weapon Configuration subgroup flags
enum(
	"WEPCFG_NONE",
	"WEPCFG_REDONLY",   --1
	"WEPCFG_DISABLERED" --2
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
		["mm_abilities"] = do
			if (v.value) print("\x87Murder Mystery\x80: Skin abilities are Enabled (no limits)")
			else print("\x87Murder Mystery\x80: Skin abilities are Disabled (\"Regular person\" mode)") end
		end,
		["mm_allowshields"] = do
			if (v.value) print("\x87Murder Mystery\x80: Player shields got enabled. \x81Good luck surviving them.")
			else print("\x87Murder Mystery\x80: Disabled player shields") end
		end,
		["mm_wepcfg_civil"] = do
			printf("%s %s%s \x81%s\x80. %s %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_CIVILIAN], "Civilian\x80 was changed to", v.value, "In other words...", sentences_civil[v.value])
		end,
		["mm_cryptic"] = do
			if (v.value) print("\x87Murder Mystery\x80: Nametags and most of the player counters got disabled. \x81Good Luck finding out who others are.")
			else print("\x87Murder Mystery\x80: Nametags and player counters are now enabled") end
		end,
		["mm_wepcfg_murd"] = do
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_MURDERER], "Murderer\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value & 3], "Showdown Duel", sentences[(v.value >> 2) & 3])
		end,
		["mm_wepcfg_sheri"] = do
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_SHERIFF], "Sheriff\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value & 3], "Showdown Duel", sentences[(v.value >> 2) & 3])
		end,
		["mm_wepcfg_hero"] = do
			printf("%s %s%s \x81%s\x80. %s\x80: %s \n\t\x88%s\x80: %s", "\x87Murder Mystery\x80: Weapon Configuration for role", MM.RoleColor[ROLE_HERO], "Hero\x80 was changed to", v.value, "In other words...\n\t\x89Normal gameplay", sentences[v.value & 3], "Showdown Duel", sentences[(v.value >> 2) & 3])
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

--Load libraries
dofile("LIBRARIES/MICHAELMYERS.LUA") --Core MM functionality
if (not isdedicatedserver) dofile("LIBRARIES/HIDEO.LUA") end --HUD/Video library

--Freeslot
dofile("FREESLOT.LUA")

--Load the text and all translations
print("\n\x87Murder Mystery\x80: Loading text...")
dofile("TEXT/EN.LUA") --English text is required for the game to run on the basic level so DO NOT REMOVE OR COMMENT THIS LINE
dofile("TEXT/FR.LUA")
dofile("TEXT/PL.LUA")
dofile("TEXT/RU.LUA")
dofile("TEXT/TR.LUA")
dofile("TEXT/UA.LUA")

--Script files load
print("\n\x87Murder Mystery\x80: Loading main logic scripts...")
if (MM.debug) dofile("DEBUG.LUA") end
dofile("GAME.LUA")
dofile("WEAPONS.LUA")
if (not isdedicatedserver) dofile("HUD.LUA") end
dofile("CHAT.LUA")
dofile("CCMD.LUA")
dofile("FOOTSTEPS.LUA")
dofile("ABILITIES.LUA")
dofile("TIMETRAVEL.LUA")

--Minigames module
print("\n\x87Murder Mystery\x80: Loading minigames module...")
if (not isdedicatedserver) dofile("MINIGAMES/HUD_MINIGAMES.LUA") end
dofile("MINIGAMES/MINIGAMES.LUA")

--Map scripts
print("\n\x87Murder Mystery\x80: Loading map scripts...")
dofile("MAPS/MAPK0.LUA")
dofile("MAPS/MAPK6.LUA")
dofile("MAPS/MAPK7.LUA")
dofile("MAPS/MAPK8.LUA")
dofile("MAPS/MAPKC.LUA")
dofile("MAPS/MAPKE.LUA")

print("\n\x87LTM's Murder Mystery\x84 add-on was loaded succesfuly\n\x82Have fun! =)\n")

if (MODVERSION != 56) error("\x84LTM's \x87Murder Mystery\x80 was designed for SRB2 v2.2.15 only. Incompatibilities may occur", 0) end
