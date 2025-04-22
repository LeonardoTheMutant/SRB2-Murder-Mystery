if (MM)
	error("SRB2 (LTM's) Murder Mystery v"..MM.version.." is already loaded, only one MM add-on can be loaded at the time", 0)
	return
end

rawset(_G, "MM", {
	version = "1.2", --string, VERSION NUMBER
	debug = true, --boolean, if set to true, enable the debug functionality in MM
	builddate = "N/A", --string, meant to contain the day of the build
	RoleColor = {
		"\x85", --Murderer
		"\x84", --Sheriff
		"\x83", --Innocent
		"\x82", --Hero
		"\x8F" --Dead
	},
	RoleColorHUD = {
		"\21", --Murderer
		"\20", --Sheriff
		"\19", --Innocent
		"\18", --Hero
		"\31" --Dead
	},
	hud = { --variables that control the HUD renderer
		game = { --Main Game HUD
			pos = {
				ringWepOnly = {x = 144}, --Murderer's weapon icon
				ringWep = {x=84, y=156}, --Location of the first weapon icon
				debug = {x=8, y=48}, --Debug info
			}
		},
		scores = { --HUD for Scores Tab
			pos = {
				playerInfo = {x=20, y=28}, --Player list
				teammateInfo = {x=20, y=136}, --Teammates list
				teammateInfoOffset1 = {x=18}, --Offset for current weapon icon
				teammateInfoOffset2 = {x=36}, --Offset for Rings counter
			}
		},
		intermission = { --Intermisson HUD
			pos = {
				players = {y=32},
				name = {x=24},
				kills = {x=264},
				players2 = {y=40},
				name2 = {x=12},
				kills2 = {x=132},
			}
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
	MM.text = net($)
	MM.shremds = net($)
	MM.winner = net($)
	MM.winreason = net($)
	MM.timelimit = net($)
	MM.twopgame = net($)
	MM.minigame = net($)
	MM.pong = net($)
	MM.duelplrs = net($)
end)



--
-- ENUMERATES
--

--Role constants
rawset(_G, "ROLE_NONE", 0)
rawset(_G, "ROLE_MURDERER", 1)
rawset(_G, "ROLE_SHERIFF", 2)
rawset(_G, "ROLE_CIVILIAN", 3)
rawset(_G, "ROLE_HERO", 4)

--Win reason constants
rawset(_G, "WIN_MURD", 1)
rawset(_G, "WIN_CIVILS", 2)
rawset(_G, "WIN_SHERIKILLINNO", 3)
rawset(_G, "WIN_HEROKILLINNO", 4)
rawset(_G, "WIN_NODEFENDERS", 5)

--Time Zone constants
rawset(_G, "TIMEZONE_PAST", 1)
rawset(_G, "TIMEZONE_PRESENT", 2)
rawset(_G, "TIMEZONE_FUTURE_BAD", 3)
rawset(_G, "TIMEZONE_FUTURE_GOOD", 4)

--Time Warp Sign values
rawset(_G, "TWS_NONE", 0)
rawset(_G, "TWS_PAST", 1)
rawset(_G, "TWS_FUTURE", 2)

--Weapon Configuration subgroup flags
rawset(_G, "WEPCFG_REDONLY", 1)
rawset(_G, "WEPCFG_DISABLERED", 2)



--
-- API FUNCTIONS
--

--Add language/translation to the game
MM.AddLang = function(langID,langTbl)
	assert(langID, "Invalid Language Index")
	assert(langTbl, "Invalid Language Table.")
	if (type(langID) ~= "string") error("Language ID should be string and contain 2-3 characters long") end
	if (type(langTbl) ~= "table") error("Language Talbe shoulb be table.") end
	for l in pairs(MM.text)
		if (l == langID)
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MM.text[langID:upper()] = langTbl
	print("\x87Murder Mystery\x80: Added \x82\""..langID.."\"\x80 language by "..tostring(MM.text[langID:upper()]["AUTHOR"]))
	if (MM.text[langID:upper()]["VERSION"] ~= MM.version) print("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MM.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MM.version) end
end

--(Re)Load a list of available Suspense music
MM.LoadSuspenseTracks = function()
	MM.susnse_music = {}
	local lumpname
	for i = 0, 15 do
		lumpname = string.format("MMSUS%X", i)
		if (S_MusicExists(lumpname))
			table.insert(MM.susnse_music, lumpname)
			if (MM.debug) print("Loaded Suspense Track \x81"..lumpname) end
		end
	end
end

--(Re)Load a list of available Showdown Duel music
MM.LoadShowdownTracks = function()
	MM.shwdwn_music = {}
	local lumpname
	for i = 0, 15 do
		lumpname = string.format("MMSHD%X", i)
		if (S_MusicExists(lumpname))
			table.insert(MM.shwdwn_music, lumpname)
			if (MM.debug) print("Loaded Showdown Track \x81"..lumpname) end
		end
	end
end



--
-- CVARs
--

--Additional CVAR text
local rolenames = {
	MM.RoleColor[ROLE_MURDERER].."Murderer\x80",
	MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80",
	MM.RoleColor[ROLE_CIVILIAN].."Civilian\x80",
	MM.RoleColor[ROLE_HERO].."Hero\x80"
}
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
	if (v.name == "mm_abilities")
		if (v.value) print("\x87Murder Mystery\x80: Skin abilities are Enabled (no limits)")
		else print("\x87Murder Mystery\x80: Skin abilities are Disabled (\"Regular person\" mode)") end
	elseif (v.name == "mm_allowshields")
		if (v.value) print("\x87Murder Mystery\x80: Player shields got enabled. \x81Good luck surviving them.")
		else print("\x87Murder Mystery\x80: Disabled player shields") end
	elseif (v.name == "mm_wepcfg_murd") or (v.name == "mm_wepcfg_sheri") or (v.name == "mm_wepcfg_hero")
		local role = 0
		if (v.name == "mm_wepcfg_murd") then role = ROLE_MURDERER
		elseif (v.name == "mm_wepcfg_sheri") then role = ROLE_SHERIFF
		elseif (v.name == "mm_wepcfg_hero") then role = ROLE_HERO
		end

		print("\x87Murder Mystery\x80: Weapon Configuration for role "..rolenames[role].." was changed to \x81"..v.value.."\x80. In other words...\n\t\x89Normal gameplay\x80 :"..sentences[v.value & 3].."\n\t\x88Showdown Duel\x80 :"..sentences[(v.value >> 2) & 3])
	elseif (v.name == "mm_wepcfg_civil")
		print("\x87Murder Mystery\x80: Weapon Configuration for role "..rolenames[ROLE_CIVILIAN].." was changed to \x81"..v.value.."\x80. In other words... "..sentences_civil[v.value])
	elseif (v.name == "mm_cryptic")
		if (v.value) print("\x87Murder Mystery\x80: Nametags and most of the player counters got disabled. \x81Good Luck finding out who others are.")
		else print("\x87Murder Mystery\x80: Nametags and player counters are now enabled") end
	end
end
-- Flags: 4 = CV_NETVAR; 6 = CV_NETVAR|CV_CALL
CV_RegisterVar({name = "mm_wepcfg_murd", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_sheri", defaultvalue = 0, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_civil", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 2}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepcfg_hero", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 15}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_speed_walk", defaultvalue = 20, PossibleValue = {MIN = 6, MAX = 40}, flags = 4})
CV_RegisterVar({name = "mm_speed_sneak", defaultvalue = 3, PossibleValue = {MIN = 1, MAX = 5}, flags = 4})
CV_RegisterVar({name = "mm_nocamping", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
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
print("\n\x87LTM's MURDER MYSTERY \x81v"..MM.version.."\n")

--Freeslot
dofile("FREESLOT.LUA")

--Load the text and all translations (they have to be loaded before the scripts)
print("\n\x87Murder Mystery\x80: Loading text...")
dofile("TEXT/EN.LUA") --English text is required for the game to run on the basic level so DO NOT REMOVE OR COMMENT THIS LINE
dofile("TEXT/ES.LUA")
dofile("TEXT/FR.LUA")
dofile("TEXT/PL.LUA")
dofile("TEXT/RU.LUA")
dofile("TEXT/TR.LUA")
dofile("TEXT/UA.LUA")

--Script files load
print("\n\x87Murder Mystery\x80: Loading main logic scripts...")
dofile("FUNCTIONS.LUA")
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

print("\n\x87LTM's Murder Mystery\x84 add-on was loaded succesfuly\n\x82Have fun! =)\n")

if (MODVERSION != 56) error("\x84LTM's \x87Murder Mystery\x80 was designed for SRB2 v2.2.15 only. Incompatibilities may occur", 0) end
