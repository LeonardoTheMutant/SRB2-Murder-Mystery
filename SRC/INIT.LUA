if MM or MurderMystery
	error("Murder Mystery v"..MM.version or MurderMystery.version.." is already loaded, only one version of MM can be present")
	return
end
rawset(_G, "MM", {
	version = "1.0-ALPHA", --string, VERSION NUMBER
	devbuild = true, --boolean, if set to true it enables debug functionality in MM
	releasedate = "not released yet", --string, meant to contain the day of release
	RoleColor = {
		"\x85", --Murderer
		"\x84", --Sheriff
		"\x83", --Innocent
		"\x82", --Hero
		"\x8F" --Dead
	},
	RoleColorHUD = {
		"\5", --Murderer
		"\4", --Sheriff
		"\3", --Innocent
		"\2", --Hero
		"\15" --Dead
	},
	hud = { --variables that control the HUD renderer
		game = { --Main Game HUD
			enabled = true,
			pos = {
				ringWepMurd = {x = 152}, --Murderer's weapon icon
				ringWep = {x=92, y=156}, --Location of the first weapon icon
				debug = {x=8, y=48}, --Debug info
			}
		},
		scores = { --HUD for Scores Tab
			enabled = true,
			pos = {
				teammateInfo = {x=20, y=120}, --Teammates tracklist
				teammateInfoOffset1 = {x=18}, --Offset for current weapon icon
				teammateInfoOffset2 = {x=36}, --Offset for Rings counter
			}
		},
		intermission = { --Intermisson HUD
			enabled = true,
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
	shwdwn = false, --is it Showdown Duel right now?
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
		padcolor = {36, 152} --player role colors
	}
})

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
	elseif (v.name == "mm_duelmode")
		if (v.value) print("\x87Murder Mystery:\x85 Murderers\x80 now have access to all weapons during the Showdown Duel")
		else print("\x87Murder Mystery:\x85 Murderers\x80 can only use Red and Infinite Rings during duels") end
	end
end
CV_RegisterVar{name = "mm_abilities", defaultvalue = 0, PossibleValue = CV_OnOff, flags = 6, func = VarChange}
CV_RegisterVar{name = "mm_customskins", defaultvalue = 0, PossibleValue = CV_OnOff, flags = 4}
CV_RegisterVar{name = "mm_spam", defaultvalue = 1, PossibleValue = {MIN = 0, MAX = 60}, flags = 4}
CV_RegisterVar{name = "mm_afk", defaultvalue = 2, PossibleValue = {MIN = 0, MAX = 10}, flags = 4}
CV_RegisterVar{name = "mm_semj", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4}
CV_RegisterVar{name = "mm_duelmode", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange}
CV_RegisterVar{name = "mm_autofire", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4}

--
--MM startup init
--
print("\x87MURDER MYSTERY v"..MM.version)
print("\x83".."Beginning of the \x87Murder Mystery\x83 loading...")

--Freeslot Gametype, Sheriff's Emerald & Knife object
freeslot('TOL_MM', 'MT_SHREML', 'MT_MMKNIFE')
--Various SFX
freeslot('SFX_MMDTH1', 'SFX_MMDTH2', 'SFX_MMDTH3', 'SFX_MMDTH4', 'SFX_DAMFLL', 'SFX_ALDI')
--Emoji sounds
freeslot('sfx_emj00', 'sfx_emj01', 'sfx_emj02', 'sfx_emj03', 'sfx_emj04', 'sfx_emj05', 'sfx_emj06', 'sfx_emj07', 'sfx_emj08', 'sfx_emj09', 'sfx_emj0a', 'sfx_emj0b', 'sfx_emj0c', 'sfx_emj0d', 'sfx_emj0e', 'sfx_emj0f')
freeslot('sfx_emj10', 'sfx_emj11', 'sfx_emj12', 'sfx_emj13', 'sfx_emj14', 'sfx_emj15', 'sfx_emj16', 'sfx_emj17', 'sfx_emj18', 'sfx_emj19', 'sfx_emj1a', 'sfx_emj1b', 'sfx_emj1c', 'sfx_emj1d', 'sfx_emj1e', 'sfx_emj1f')
freeslot('sfx_emj20')


G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MM,
	rules = GTR_SPECTATORS|GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_NOSPECTATORSPAWN,
	intermissiontype = int_match,
	headerleftcolor = 36,
	headerrightcolor = 152,
	description = "Kill everyone as Murderer or eliminate them as Sheriff! ...or be none of them and be Innocent"
})

--Sheriff Drop Emerald
mobjinfo[MT_SHREML]={
	spawnstate = S_CEMG3,
	deathstate = S_SPRK1,
	deathsound = sfx_cgot,
	spawnhealth = 1000,
	radius = 1048576, --16*FU
	height = 1048576, --16*FU
	reactiontime = 8,
	mass = 16,
	speed = EMERALD3
}

--Knife weapon
mobjinfo[MT_MMKNIFE] = {
	spawnhealth = 1000,
	spawnstate = S_SPRK1,
	radius = FU,
	height = FU,
	flags = MF_NOGRAVITY|MF_NOBLOCKMAP
}

--
--SFX closed captions
--

--Death sounds
sfxinfo[sfx_mmdth1].caption="\x19 Good Night \x19"
sfxinfo[sfx_mmdth2].caption="Killed"
sfxinfo[sfx_mmdth3].caption="Killed"
sfxinfo[sfx_mmdth4].caption="Killed"
--for MAPK5 (Dam Zone)
sfxinfo[sfx_damfll].caption="Falling from the Dam..."
--for MAPKD (East City)
sfxinfo[sfx_aldi].caption="\x19 I AM AT ALDI"
--Chat sound emojis
sfxinfo[sfx_emj00].caption=":skull:"
sfxinfo[sfx_emj01].caption="hehe"
sfxinfo[sfx_emj02].caption=":fart:"
sfxinfo[sfx_emj03].caption="OOOhhh my gooodd..."
sfxinfo[sfx_emj04].caption="bruh"
sfxinfo[sfx_emj05].caption="Vine boom"
sfxinfo[sfx_emj06].caption="WOW"
sfxinfo[sfx_emj07].caption="AMONGUS"
sfxinfo[sfx_emj08].caption="OH NO"
sfxinfo[sfx_emj09].caption="SUS"
sfxinfo[sfx_emj0a].caption="AGGHHHHH"
sfxinfo[sfx_emj0b].caption="AHA!"
sfxinfo[sfx_emj0c].caption="NO WAY!"
sfxinfo[sfx_emj0d].caption="nope."
sfxinfo[sfx_emj0e].caption="GET OVER HERE!"
sfxinfo[sfx_emj0f].caption="NOOOOoooo..."
sfxinfo[sfx_emj10].caption="HELP!"
sfxinfo[sfx_emj11].caption="HEHEHE HA"
sfxinfo[sfx_emj12].caption="hehe boiii..."
sfxinfo[sfx_emj13].caption="PINGAS"
sfxinfo[sfx_emj14].caption="PAIN"
sfxinfo[sfx_emj15].caption="imbouttoblow"
sfxinfo[sfx_emj16].caption="NO!"
sfxinfo[sfx_emj17].caption="HAH!"
sfxinfo[sfx_emj18].caption="SIREN"
sfxinfo[sfx_emj19].caption="Hello there"
sfxinfo[sfx_emj1a].caption="Good"
sfxinfo[sfx_emj1b].caption="WHAT THE HELL"
sfxinfo[sfx_emj1c].caption="Another one."
sfxinfo[sfx_emj1d].caption="HOLD UP"
sfxinfo[sfx_emj1e].caption="YOU MUST DIE!"
sfxinfo[sfx_emj1f].caption="I need more bullets!"
sfxinfo[sfx_emj20].caption="NOW!"


--Script files init
dofile("MAIN/TEXT.LUA")
dofile("MAIN/FUNCTIONS.LUA")
if (MM.devbuild) dofile("MAIN/DEBUG.LUA") end
dofile("MAIN/GAME.LUA")
dofile("MAIN/WEAPONS.LUA")
dofile("MAIN/HUD.LUA")
dofile("MAIN/CHAT.LUA")
dofile("MAIN/CCMD.LUA")
dofile("MAIN/ABILITIES.LUA")

dofile("MINIGAMES/HUD_MINIGAMES.LUA")
dofile("MINIGAMES/MINIGAMES.LUA")

dofile("LEVELS/MAPK0.LUA")
dofile("LEVELS/MAPK7.LUA")
dofile("LEVELS/MAPK8.LUA")
dofile("LEVELS/MAPKD.LUA")

dofile("MISC/FOOTSTEPS.LUA")

print("\x83Murder Mystery loaded succesfuly\nNote that this is WORK IN PROGRESS GAMETYPE and everything you see in this version can be completely changed in the future!\n\x85Please DO NOT TALK or POST ABOUT this gametype on any Message Board or forum, we would like to keep this in Mystery until release =)\n\x81If you are the server host \x81open this .PK3 (as a regular .ZIP) and look for \x82READ_BEFORE_HOSTING.txt\x81 file inside of it for imporant warnings and recommended server setup\x88\nThank you")
--
--end of startup init
--

addHook("NetVars", function(net)
	MM.text = net($)
	MM.CharStats = net($)
	MM.shremls = net($)
	MM.winner = net($)
	MM.winreason = net($)
	MM.timelimit = net($)
	MM.twopgame = net($)
	MM.minigame = net($)
	MM.pong = net($)
	MM.duelplrs = net($)
	MM.singleplr = net($)
end)
