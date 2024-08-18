if (MM)
	error("Murder Mystery v"..MM.version.." is already loaded, only one MM add-on can be loaded at the time")
	return
end
rawset(_G, "MM", {
	version = "1.0-ALPHA", --string, VERSION NUMBER
	devbuild = true, --boolean, if set to true, enable the debug functionality in MM
	releasedate = "not released yet", --string, meant to contain the day of release
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
				teammateInfo = {x=20, y=136}, --Teammates tracklist
				teammateInfoOffset1 = {x=18}, --Offset for current weapon icon
				teammateInfoOffset2 = {x=36}, --Offset for Rings counter
			}
		},
		intermission = { --Intermisson HUD
			pos = {
				players = {y=32},
				num = {x=16},
				name = {x=48},
				kills = {x=264},
				players2 = {y=40},
				num2 = {x=4},
				name2 = {x=40},
				kills2 = {x=132},
				num3 = {x=4},
				name3 = {x=24}
			}
		}
	},
	weaponconfig = { --4 groups of 2-bit weapon configurations
		0, --Murderer (Normal)
		0, --Sheriff (Normal)
		0, --Murderer (Duel)
		0  --Sheriff (Duel)
	},
	shwdwn = false, --currently playing Showdown Duel track (also used to determine if the Duel is happening)
	winner = 0, --for intermission, netsynced
	winreason = 0, --for intermission, netsynced
	timelimit = 5, --for custom timelimit, netsynced
	shremls = {}, --table containing all dropped Sheriff Emeralds mobj_t values, netsynced
	pong = { --some of the variables for Pong minigame, netsynced
		ball = {x=80, y=40},
		velocity = {x=0, y=0},
		speed = 1,
		pads = {32, 32},
		hits = 0,
		padcolor = {37, 153} --player role colors
	}
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
	if (not langID) error("Invalid Language Index") end
	if (not langTbl) error("Invalid Language Table.") end
	if (type(langID) ~= "string") error("Language ID should be string and contain 2-3 characters long") end
	if (type(langTbl) ~= "table") error("Language Talbe shoulb be table.") end
	for l in pairs(MM.text)
		if (l == langID)
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MM.text[langID:upper()] = langTbl
	print("\x83Succesfuly added \x82"..langID.." \x83(by "..tostring(MM.text[langID:upper()]["AUTHOR"])..") lang as a MM language.")
	if (MM.text[langID:upper()]["VERSION"] ~= MM.version) print("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MM.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MM.version) end
end

--CVARs
local function VarChange(v) --callback function called by CV_CALL flag
	if (v.name == "mm_abilities")
		if (v.value) print("\x87Murder Mystery:\x80 Skin abilities are Enabled (no limits)")
		else print("\x87Murder Mystery:\x80 Skin abilities are Disabled (\"Regular person\" mode)") end
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
		print("\x87Murder Mystery:\x80 Weapon Configuration was changed to \x81"..v.value.."\x80. In other words...\n\t\x89Normal gameplay\x80:\n\t\t"..MM.RoleColor[ROLE_MURDERER].."Murderer\x80: "..sentences[MM.weaponconfig[1]].."\n\t\t"..MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80: "..sentences[MM.weaponconfig[2]].."\n\t\x88Showdown Duel\x80:\n\t\t"..MM.RoleColor[ROLE_MURDERER].."Murderer\x80: "..sentences[MM.weaponconfig[3]].."\n\t\t"..MM.RoleColor[ROLE_SHERIFF].."Sheriff\x80: "..sentences[MM.weaponconfig[4]])
	end
end
-- Flags: 4 = CV_NETVAR; 6 = CV_NETVAR|CV_CALL
CV_RegisterVar({name = "mm_abilities", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_customskins", defaultvalue = "No", PossibleValue = CV_YesNo, flags = 4})
CV_RegisterVar({name = "mm_chatdelay", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 60}, flags = 4})
--CV_RegisterVar({name = "mm_safechat", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_nocamping", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})
CV_RegisterVar({name = "mm_afk", defaultvalue = 2, PossibleValue = {MIN = 0, MAX = 10}, flags = 4})
CV_RegisterVar({name = "mm_wepconfig", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 255}, flags = 6, func = VarChange})
CV_RegisterVar({name = "mm_autofire", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4})

--
--MM startup init
--
print("\n\x87MURDER MYSTERY \x81v"..MM.version.."\n")

--Freeslot Gametype, Sheriff's Emerald & Knife object
freeslot('TOL_MURDERMYSTERY', 'MT_SHREML', 'MT_MMKNIFE')
freeslot('sfx_mmdth1', 'sfx_mmdth2', 'sfx_mmdth3', 'sfx_mmdth4', 'sfx_mmdth5', 'sfx_mmdth6', 'sfx_mmdth7')

G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MURDERMYSTERY,
	rules = GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_TIMELIMIT,
	intermissiontype = int_match,
	headerleftcolor = 37,
	headerrightcolor = 153,
	description = "Kill everyone as Murderer, prevent the murders as Sheriff and survive as Innocent!"
})

--Sheriff Drop Emerald
mobjinfo[MT_SHREML]={
	spawnstate = S_CEMG3,
	deathstate = S_SPRK1,
	deathsound = sfx_cgot,
	radius = 1048576, --16*FU
	height = 1048576, --16*FU
	flags = MF_SPECIAL
}

--Knife weapon
mobjinfo[MT_MMKNIFE]={
	spawnstate = S_SPRK1,
	radius = 4194304, --64*FU
	height = 3145728, --48*FU
	flags = MF_NOGRAVITY|MF_SPECIAL
}

--Death SFX captions
sfxinfo[sfx_mmdth1].caption = "\19 Good Night"
sfxinfo[sfx_mmdth2].caption = "Killed"
sfxinfo[sfx_mmdth3].caption = "Killed"
sfxinfo[sfx_mmdth4].caption = "Killed"
sfxinfo[sfx_mmdth5].caption = "OH NO!"
sfxinfo[sfx_mmdth6].caption = "Pain"
sfxinfo[sfx_mmdth7].caption = "Moonwalker"

--Script files init
dofile("TEXT.LUA")
dofile("FUNCTIONS.LUA")
if (MM.devbuild) dofile("DEBUG.LUA") end
dofile("GAME.LUA")
dofile("WEAPONS.LUA")
if (not isdedicatedserver) dofile("HUD.LUA") end
dofile("CHAT.LUA")
dofile("CCMD.LUA")
dofile("FOOTSTEPS.LUA")
dofile("ABILITIES.LUA")
dofile("TIMETRAVEL.LUA")

if (not isdedicatedserver) dofile("MINIGAMES/HUD_MINIGAMES.LUA") end
dofile("MINIGAMES/MINIGAMES.LUA")

dofile("MAPS/MAPK0.LUA")
dofile("MAPS/MAPK6.LUA")
dofile("MAPS/MAPK7.LUA")
dofile("MAPS/MAPK8.LUA")

print("\n\x83Murder Mystery add-on loaded succesfuly\n\x82Thank you for playtesting the\x81 ALPHA\x82 version of the gametype before the final release!\n\x85".."But we would like to ask you to NOT TALK or POST ABOUT this gametype on any Message Board or forum - we want to keep our work in Mystery until final release =)\n\x81If you are the server host \x81open this .PK3 (as a regular .ZIP) and look for \x82READ_BEFORE_HOSTING.txt\x81 file inside of it for imporant warnings and recommended server setup\x88\nThanks again =)\n")
--
--end of startup init
--

addHook("NetVars", function(net)
	MM.text = net($)
	MM.shremls = net($)
	MM.winner = net($)
	MM.winreason = net($)
	MM.timelimit = net($)
	MM.twopgame = net($)
	MM.minigame = net($)
	MM.pong = net($)
	MM.duelplrs = net($)
end)
