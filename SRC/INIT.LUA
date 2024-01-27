if MM or MurderMystery
	error("Murder Mystery v"..MM.version or MurderMystery.version.." is already loaded, only one version of MM can be present")
	return
end
rawset(_G, "MM", {
	version="10.0-BETA-RC1", --string, VERSION NUMBER
	devbuild=nil, --string, meant to be a devbuild number. If set to nil it disables all debug functionality in MM
	releasedate="not released yet", --string, meant to contain the day of release
	SEMJ_info={ --for MMHELP CHAT
		"   \x88Keyword\x80       | \x89Sound",
		"  ---------------+---------------------------",
		"  	:skull:       | \"Bad to the Bones\"",
		"  	:fart:        | Fart sound",
		"   :pain:        | Very loud pain scream",
		"  	:wow:         | Anime-like \"WOW!\"",
		"  	:|            | Vine boom",
		"   OMG           | \"OOHhhh myyy Goooddddd...\"",
		" * bruh          | \"bruh\"",
		"   sus           | SUS",
		"   AMONGUS       | \"*AMONG US*\"",
		"  	AMONG US      | \"*AMONG US*\"",
		" * OH NO         | Knuckles' \'OH NO\'",
		"   AGHH / AHH    | Eggman's \'AGHHHH!\'",
		" * AHA           | Eggman's \'AHA!\'",
		"   NO WAY        | Eggman's \'NO WAY!\'",
		" * NOPE          | Nope.",
		"   GET OVER HERE | \"GET OVER HERE!\"",
		"   NOOO          | Shadow screaming \"NOOOOOOoooooo...\"",
		" * NO!           | Heavy's \'NO!\'",
		" * HELP          | Tyler1's \'HELP!\'",
		"  	hehe          | DOOMGUY chuckle",
		"  	HEHEHE HA     | Clash Royal King's laugh",
		"  	hehe boi      | \"Hehe boi...\"",
		"   PINGAS        | \"SnooPING AS usual I see?\"",
		"   HUH           | \"Huh?\"",
		"   HAH           | \"HAH!\"",
		"	Hello there   | Obi-Wan's iconic phrase",
		"  ---------------+---------------------------",
		"\n * This keyword has to be present in the message alone to work"
	},CharStats={
		default={
			ability = CA_NONE,
			ability2 = CA_NONE,
			actionspd = 2621440, --40*FU
			charflags = 0,
			mindash = 196608, --3*FU
			maxdash = 1966080 --30*FU
		}
	},RoleColor={
		"\5", --Murderer
		"\4", --Sheriff
		"\3", --Innocent
		"\2", --Hero
		"\15" --Dead
	},
	winner=0, --for intermission, netsynced
	winreason=0, --for intermission, netsynced
	timelimit=5, --for timelimit in TIME.LUA, netsynced
	shremls={}, --table containing all dropped Sheriff Emeralds mobj_t values, netsynced
	pong = { --some of the variables for Pong minigame, netsynced
		ball = {x=80, y=50},
		velocity = {x=0, y=0},
		speed = 1,
		pads = {44, 44},
		hits = 0,
		padcolor = {36, 152} --player role colors
	}
})

rawset(_G, "MurderMystery", MM) --for backwards compatibility

--Roles constants
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
MM.AddCharStat = function(skin, tb)
	if (not skin) error("Invalid skin.") end
	if (not tb) error("Invalid table.") end
	if type(skin)~="string" error("Skin must be string.") end
	if type(tb)~="table" error("tb must phrase as a table.") end
	MM.CharStats[skin]=tb;
	print("\x83Succesfuly patched \x82\""..skin.."\"\x83 skin for MM")
end
MM.AddLang = function(langID,langTbl)
	if (not langID) error("Invalid Language Index") end
	if (not langTbl) error("Invalid Language Table.") end
	if type(langID)~="string" error("Language ID should be string and contain 2-3 characters long") end
	if type(langTbl)~="table" error("Language Talbe shoulb be table.") end
	for l in pairs(MM.text)
		if l==langID
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MM.text[langID:upper()]=langTbl
	print("\x83Succesfuly added \x82"..langID.." \x83(by "..tostring(MM.text[langID:upper()]["AUTHOR"])..") lang as a MM language.")
	if MM.text[langID:upper()]["VERSION"]~=MM.version print("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MM.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MM.version) end
end

--CVARs
local function VarChange(v) --callback functions called by CV_CALL flag
	if (v.name=="mmcharmode")
		if (v.value==2) print("\x87Murder Mystery:\x80 Every character have their abilities back")
		elseif (v.value==1) print("\x87Murder Mystery:\x80 Vanilla character abbilities turned ON, but in limited form")
		else print("\x87Murder Mystery:\x80 \"Regular person\" character mode enabled (abbilities off)") end
	elseif (v.name=="mmsprint")
		if (v.value) print("\x87Murder Mystery:\x80 Everyone now can use sprinting by holding CUSTOM1 button!")
		else print("\x87Murder Mystery:\x80 Sprinting is now disabled") end
	end
end
CV_RegisterVar{name = "mmcharmode", defaultvalue = 0, PossibleValue = {MIN = 0, MAX = 2}, flags = 6, func = VarChange}
CV_RegisterVar{name = "mmsprint", defaultvalue = "Off", PossibleValue = CV_OnOff, flags = 6, func = VarChange}
CV_RegisterVar{name = "mmspam", defaultvalue = 1, PossibleValue = {MIN = 0, MAX=60}, flags = 4}
CV_RegisterVar{name = "mmafk", defaultvalue = 2, PossibleValue = {MIN = 0, MAX = 10}, flags = 4}
CV_RegisterVar{name = "mmsemj", defaultvalue = "On", PossibleValue = CV_OnOff, flags = 4}

--
--MM startup init
--
print("\x87MURDER MYSTERY v"..MM.version)
print("\x83".."Beginning of the \x87Murder Mystery\x83 loading...")

freeslot('TOL_MM', 'MT_SHREML', 'SFX_MMDTH1', 'SFX_MMDTH2', 'SFX_MMDTH3', 'SFX_MMDTH4', 'SFX_DAMFLL', 'MT_MMKNIFE')
freeslot('sfx_emj00', 'sfx_emj01', 'sfx_emj02', 'sfx_emj03', 'sfx_emj04', 'sfx_emj05', 'sfx_emj06', 'sfx_emj07', 'sfx_emj08', 'sfx_emj09', 'sfx_emj0a', 'sfx_emj0b', 'sfx_emj0c', 'sfx_emj0d', 'sfx_emj0e', 'sfx_emj0f')
freeslot('sfx_emj10', 'sfx_emj11', 'sfx_emj12', 'sfx_emj13', 'sfx_emj14', 'sfx_emj15', 'sfx_emj16', 'sfx_emj17', 'sfx_emj18', 'sfx_emj19')

G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MM,
	rules = GTR_SPECTATORS|GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_NOSPECTATORSPAWN,
	intermissiontype = int_match,
	headerleftcolor = 38,
	headerrightcolor = 150,
	description = "Kill everyone as Murderer or eliminate him as Sheriff! ...or be none of them and be Innocent"
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
sfxinfo[sfx_mmdth1].caption="Good Night"
sfxinfo[sfx_mmdth2].caption="Killed"
sfxinfo[sfx_mmdth3].caption="Killed"
sfxinfo[sfx_mmdth4].caption="Killed"
--for MAPK5 (Dam Zone)
sfxinfo[sfx_damfll].caption="Falling from the Dam..."
--Chat sound emojis
sfxinfo[sfx_emj00].caption=":skull:"
sfxinfo[sfx_emj01].caption="hehe"
sfxinfo[sfx_emj02].caption=":fart:"
sfxinfo[sfx_emj03].caption="OOOOOhhhh myy gooodddd...."
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
sfxinfo[sfx_emj15].caption="huh?"
sfxinfo[sfx_emj16].caption="NO!"
sfxinfo[sfx_emj17].caption="HAH!"
sfxinfo[sfx_emj18].caption="SIREN"
sfxinfo[sfx_emj19].caption="Hello there"

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
dofile("MAIN/NOCHEAT.LUA")
dofile("MAIN/MINIGAME.LUA")

dofile("LEVELS/MAPK0.LUA")
dofile("LEVELS/MAPK7.LUA")
dofile("LEVELS/MAPK8.LUA")

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
end)