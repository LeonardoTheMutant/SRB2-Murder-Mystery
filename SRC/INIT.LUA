if (MM)
	error("SRB2 (LTM's) Murder Mystery v"..MM.version.." is already loaded, only one MM add-on can be loaded at the time", 0)
	return
end

rawset(_G, "MM", {
	version = "1.0", --string, VERSION NUMBER
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
	weaponconfig = { --4 groups of 2-bit weapon configurations
		0, --Murderer (Normal)
		0, --Sheriff (Normal)
		0, --Murderer (Duel)
		0  --Sheriff (Duel)
	},
	shwdwn_music = { --Tracks used as Showdown Duel themes
		"DRMBM2", --Dr. Robotnik's Mean Bean Machine: "2 Player Vs."
		"PWAAPR", --Phoenix Wright Ace Atourney: "Pressing Pursuit"
		"PWTTPR", --Phoenix Wright: Trials and Tribulations: "Pressing Pursuit"
		"RDBSTR", --Deltarune: "Rude Buster" (by Toby Fox)
		"S2MSBS", --Sonic 2 (Master System): "Boss"
		"S2GGBS", --Sonic 2 (Game Gear): "Boss"
		--"SSBLBS", --Sonic Spinball: "Boss"
		"SSBLSD", --Sonic Spinball: "Showdown"
		"STORMR", --Freedoom Phase 2: "Stormer" (by Blastfrog & Korp)
		"UNDYNE", --Undertale: "Battle Against A True Hero" (by Toby Fox)
	},
	shwdwn = false, --currently playing Showdown Duel track (also used to determine if the Duel is happening)
	susnce = false, --currently playing Suspense track
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

--
-- CONSTANTS
--

--Role constants
rawset(_G, "ROLE_NONE", 0)
rawset(_G, "ROLE_MURDERER", 1)
rawset(_G, "ROLE_SHERIFF", 2)
rawset(_G, "ROLE_INNOCENT", 3)
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

--Customization API
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

--CVARs
local function VarChange(v) --callback function called by CV_CALL flag
	if (v.name == "mm_abilities")
		if (v.value) print("\x87Murder Mystery\x80: Skin abilities are Enabled (no limits)")
		else print("\x87Murder Mystery\x80: Skin abilities are Disabled (\"Regular person\" mode)") end
	elseif (v.name == "mm_allowshields")
		if (v.value) print("\x87Murder Mystery\x80: Player shields got enabled. \x81Good luck surviving them.")
		else print("\x87Murder Mystery\x80: Disabled player shields") end
	elseif (v.name == "mm_wepconfig")
		local sentences = {
			[0] = "All weapons enabled",
			[1] = "Only Red/Infinite rings + Knife",
			[2] = "All weapons with Red/Infinite rings replaced by knife",
			[3] = "Knife only"
		}
		MM.weaponconfig[1] = v.value & 3
		MM.weaponconfig[2] = (v.value >> 2) & 3
		MM.weaponconfig[3] = (v.value >> 4) & 3
		MM.weaponconfig[4] = (v.value >> 6) & 3
		print("\x87Murder Mystery\x80: Weapon Configuration was changed to \x81"..v.value.."\x80. In other words...\n\t\x89Normal gameplay\x80:\n\t\t"..MM.RoleColor[ROLE_MURDERER].."Murderer\x80: "..sentences[MM.weaponconfig[1]].."\n\t\t"..MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80: "..sentences[MM.weaponconfig[2]].."\n\t\x88Showdown Duel\x80:\n\t\t"..MM.RoleColor[ROLE_MURDERER].."Murderer\x80: "..sentences[MM.weaponconfig[3]].."\n\t\t"..MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80: "..sentences[MM.weaponconfig[4]])
	elseif (v.name == "mm_wepinno")
		if (v.value == 0) print("\x87Murder Mystery\x80: Weapons are disabled for "..MM.RoleColor[ROLE_INNOCENT].."Innoncents")
		elseif (v.value == 1) print("\x87Murder Mystery\x80: "..MM.RoleColor[ROLE_INNOCENT].."Innoncents\x80 have an access to the Knife and Red Ring weapons")
		elseif (v.value == 2) print("\x87Murder Mystery\x80: "..MM.RoleColor[ROLE_INNOCENT].."Innoncents\x80 have an access to the Knife") end
	elseif (v.name == "mm_cryptic")
		if (v.value) print("\x87Murder Mystery\x80: Nametags and most of the player counters got disabled. \x81Good Luck finding out who others are.")
		else print("\x87Murder Mystery\x80: Nametags and player counters are now enabled") end
	end
end
-- Flags: 4 = CV_NETVAR; 6 = CV_NETVAR|CV_CALL
CV_RegisterVar({name = "mm_wepinno", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 2}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_wepconfig", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 255}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_nocamping", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_customskins", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_cryptic", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_autofire", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_allowshields", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_abilities", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange})

--
--Boot sequence
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

print("\n\x84LTM's Murder Mystery add-on was loaded succesfuly\n\x82Thank you for playtesting the\x81 ALPHA\x82 version of the gametype before the final release!\n\x85".."But we would like to ask you to NOT TALK or POST ABOUT this gametype on any Message Board or forum - we want to keep our work in Mystery until final release =)\n\x81If you are the server host \x81open this .PK3 (as a regular .ZIP) and look for \x82READ_BEFORE_HOSTING.txt\x81 file inside of it for imporant warnings and recommended server setup\x88\nThanks again =)\n")
--
--end of startup init
--

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

if (MODVERSION != 55) error("\x84LTM's \x87Murder Mystery\x80 was designed for SRB2 v2.2.14 only. Incompatibilities may occur", 0) end
