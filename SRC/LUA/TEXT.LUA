--TEXT.LUA
--Text by MM_DEV translators
--
--All text strings used in the mod

MM.text={
    ["EN"]={ -- English
		["VERSION"]="1.0-ALPHA", --to check if lang content is not OUTDATED
		["AUTHOR"]="SRB2 MM_DEV community",
		["MM"]="Murder Mystery",
		["CHARSET"]="STCFN",

		--The following sections contain strings that allow your language's native letters to display.
		--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.
		--Color codes in "MM string format" are ranged from 0 to 15 (ASCII) and do not support translucency
		--For more details read /SRC/DOCS/MM_HUD_Library.md
		["MMHELP_CMD"]={
			"Use \23JUMP\16/\23SPIN\16 to scroll, \23Next\16/\23Prev Weapon\16 to switch pages",
			"Press \23FIRE\16 to leave HELP"
		},
		["MMHELP"]={ --MMHELP command
			{ --MAIN
				"\23Welcome to Murder Mystery!",
				"\23The SRB2 interpretation of the \23popular \23multiplayer \23game!\16\n",
				"The game's goal is to find and eliminate all the \21Murderers\16 before they kill\19 everyone else\16. This gametype is more like MATCH so you will need your aiming and shooting skills for this gametype.",
				"You need to learn some basics first before you can start playing...",
				"\nAt the beginning of each round you will get a \26Role\16 which defines what your task is during the game. Here are all 3 possible \26Roles\16 you might get:",
				" * \21Murderer\16 - A true criminal. They have to kill everyone, but they are equipped only with Knives and Red Rings;",
				" * \20Sheriff\16  - Their task is to find and eliminate the \21Murderer(s)\16. Sheriffs may use every Weapon Ring available on the map;",
				" * \19Innocent\16 - Completely armless civilian, they must avoid being killed but also can help to find the \21Murderer\16.",
				"\nThat is all basic information required to start playing, for more information, read this manual to the end."
			},
			--GAME
			{
				"\23".."About the gameplay situations\16\n",
				"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \21Murderer(s)\16, but different gameplay situations may occur:",
				"\n* If you get killed, you'll enter the\31 Dead\16 stat Players with this state cannot respawn or talk globally to players that are still alive, their messages are visible only to other\31 Dead\16 players.",
				"You can't talk to/PM players who are still alive while you are\31 Dead\16.",
				"Also\18 DO \2NOT \2TRY \2TO \2RENAME \2YOURSELF\16, more details on this are on the next page.",
				"\n* The \20Sheriff's\16 task is to eliminate all the \21Murderers\16 around, but they can accidentally shoot an \19Innocent\16.",
				"If this occurs, the \20Sheriff\16 will turn into an \19Innocent\16 and a random \19Innocent\16 will silently take his role. Next time you want to shoot somebody as a \20Sheriff\16 think twice before pulling that trigger!",
				"\n* When a \21Murderer\16 kills a \20Sheriff\16 and there are still \19Innocents\16 alive, the Sheriff will drop the \20Sheriff's Emerald\16 near their corpse.",
				"Unlike the 7 Chaos Emeralds, this emerald will assign the \2Hero\16 role to any \19Innocent\16 that picks it up. If you're one of the \19Innocents\16, it's your chance to be a Hero and save everyone from the \21Murderer(s)\16!",
				"The \2Hero\16 role does not differ from the \20Sheriff\16 except for some details such as when the \2Hero\16 kills an \19Innocent\16 their role isn't shared and both just die. A Hero will not drop a \20Sheriff's \20Emerald\16 on their death.",
				"\n* Depending on the player count, there can be more than one \21Murderer\16 and \20Sheriff\16 amongst the players in the round. For example, starting from 7 players and more, \26Teams\16 of \21Murderers\16 and \20Sheriffs\16 will be formed.",
				"\26Teammates\16 can chat with each other in their team chat with the \23SAYTEAM\16 console command (note that SAYTEAM chat button will work as same as regular chat).",
				"If one \26teammate\16 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
			},
			--BAD
			{
				"\23Things that are bad to do in Murder \23Mystery\16\n",
				"Rule No.1 of any game: \1Be kind and \1have \1fun!\16 Other than this...",
				"\n* Self-spoiling of the \26Role\16 will not make the game a \'Mystery\' (even if you are joking), you can tell someone else's role if you are sure of it, but never tell your own.",
				"\n* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you accuse every player for no reason.",
				"\n* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
				"\n* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename yourself if you are alive. Just wait for the intermission to rename safely.",
				"\nBreaking one of these rules may result in a kick or sometimes, a ban from the Admin! Please do not break them and play fairly."
			},
			--TIPS
			{
				"\23Useful tips\16\n",
				"We've collected some tips that can help you during your game in MM:",
				"\n* If character abilities are disabled by admin, press \2SPIN\16 to sneak around quietly without leaving traces or making noise;",
				"\n* When you pick up the \20Sherrif's \20Emerald\16, you will have access to all the weapons and rings you collected beforehand;",
				"\n* Finding out who your \26teammate\16 is by using the \23SAYTEAM\16 command would help as it would make you avoid shooting them and accidentally making you reveal your role;",
				"\n* You can get hurt by obstacles like lava, spikes, fire to gain invincibility for 3 seconds;",
				"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
				"\n* If your role gets leaked, you can rename yourself and/or change the skin color. \1Keep \1in \1mind \1that \1your \1rename \1will \1be \1shown \1in \1chat\16;",
				"\n*\18 FIRENORMAL\16 button allows you to use the Knife anywhere as long as you have rings (Innocents do not have a knife). Also, a Knife does not produce an attack sound if you sneak."
			}
		},

		--
		-- Console/Chat messages (vanilla formatted)
		--

		--MMLANG command
		["MMLANG"]={
			"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]\x80 command",
			"Personal language for Murder Mystery is set to\x82 English"
		},
		--GAME.LUA
		-- "You got the role"
		["ROLE_GET"]={
			"You're the \x85Murderer\x80! \x85Murder everyone!",
			"You're the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. If you kill an innocent, you'll be stripped of your role.",
			"You're an \x83Innocent\x80! Hide and help with the investigation."
		},
		-- SetRandomPlayerAs()
		["NEWROLE_GET"]={
			"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!",
			"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!",
			"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!",
			"\x87You have eliminated one of the \x85Murderers\x87! You were promoted to \x82Hero\x87!"
		},
		-- Teammate hit
		["TEAMMATE_HIT"]={
			"This player is your teammate. Please do not hit your teammates next time.",
			"A teammate hit you. Please don't take your revenge on them."
		},
		-- Murderer killed
		["MURD_KILLED"]={
			"\x85Murderer\x87", --beginning of the string
			"\x80got eliminated", --ending
		},
		-- Sheriff killed
		["SHERI_KILLED"]={
			"\x84Sheriff\x87", --beginning
			"\x80got murdered!", --ending
			"Find their\x84 Emerald\x80!" --additional ending if Sheriff's Emerald is dropped
		},
		--Hero killed
		["HERO_KILLED"]={
			"\x82Hero\x87",
			"\x80got murdered!",
		},
		["DIED_HAZARD"]="has died in an accident", --player was crushed, has drown or fell into a pit
		["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
		--Player killed someone it did not have to
		["KILL_PUNISHMENT_PM"]={
			"\x87You murdered an \x83Innocent\x87! You got fired. (You're no longer a Sheriff)", --Sheriff killed Innocent
			"\x82Heroes\x87 are not meant to kill \x83Innocents\x87. You got the death penalty for that.", --Hero killed Innocent
			"\x87Oh no! You murdered a \x84Sheriff\x87!!! You got the death penalty for that", --Innocent killed Sheriff
			"\x87You murdered an \x83Innocent\x87 player just like you! You got the death penalty for that", --Innocent killed Innocent
			"\x87Oh no! You murdered a \x82Hero\x87! You got the death penalty for that" --Innocent killed Hero
		},
		["INNO_HURT"]={
			"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!",
			"The \x82Hero\x80 decided to become a villian by killing the \x83Innocent\x80. Now both are lying dead. Shame on such\x82 Hero\x80"
		},
		-- "One of the [role]s left!"
		["ONE_LEFT"]={
			"One of the \x85Murderers\x80 left!",
			"One of the \x84Sheriffs\x80 left!!!",
			"One of the \x82Heroes\x80 has abandoned us!"
		},
		-- "Last [role] left!"
		["LAST_LEFT"]={
			"The last \x85Murderer\x80 has left!",
			"The last \x84Sheriff\x80 has left!",
			"The last \x82Hero\x80 has left!"
		},
		-- "[role] left, replaced him"
		["REPLACE_LEFT"]={
			"The \x85Murderer\x80 left! Some random \x83Innocent\x80 will take their role!",
			"The \x84Sheriff\x80 left! Some random \x83Innocent\x80 will take their role!",
			"A \x82Hero\x80 left! Some random \x83Innocent\x80 will take their role!"
		},
		-- Win texts
		["ENDROUND"]={
			"Everyone is dead. The \x85Murderers\x80 win!",
			"All of the \x85Murderers\x80 were killed! The\x83 Civilians\x80 win!",
			"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent! Shame on the \x84Sheriff\x80",
			"The \x82Hero\x80 chose to kill the last Innocent. The \x85Murderers\x80 win!",
			"The Defenders of the\x83 Innocents\x80 are dead. The \x85Murderers\x80 win!"
		},
		--HUD.LUA
		-- Bitmap patches
		["BMP_VICTIMS_INFO"]={
			xoff = 0, --X offset
			yoff = 0  --Y offset
		},
		["BMP_VICTIMS"]={
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F\xFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFIII\x1F1F\x1F1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFF\xFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFF\xFFFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFF\xFFFF\xFFIII\x1F",
			"IIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1F",
			"\x1FIIII\x1FFF\xFFFFII\x1FFF\xFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFF1FII\x1FFF\xFFFF\xFFII\x1FFF\xFF1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\x1FIIII\x1F",
			"\xFFFF\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F"
		},
		["BMP_SUSPECTS_INFO"]={
			xoff = 0,
			yoff = 0
		},
		["BMP_SUSPECTS"]={
			"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1F",
			"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1F1FII\x1F",
			"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFIII\x1F1F\x1F",
			"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFF\x1FIII\x1F",
			"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFF\xFFII\x1FFF\xFFFF\xFFFFIII\x1F",
			"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIIII\x1F",
			"\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\x1FIIII\x1F",
			"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},
		["BMP_TIME_INFO"]={
			xoff = 0,
			yoff = 0
		},
		["BMP_TIME"]={
			"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFFFII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFII\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFFIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1F1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F"
		},
		["BMP_RINGS_INFO"]={
			xoff = 0,
			yoff = 0
		},
		["BMP_RINGS"]={
			"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
			"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
			"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1F\xFFII\x1FFF\x1F1F\x1FFF\xFFIII\x1F",
			"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFF\xFFFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFF\xFFFF\xFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},

		--
		--MM String formatted HUD section
		--

		-- Role names
		["HUD_ROLES"]={
			"MURDERER",
			"SHERIFF",
			"INNOCENT",
			"HERO",
			"DEAD"
		},
		["HUD_TEAMMATES"]="Teammates",
		["HUD_KILLBY"]="Killed by",
		["HUD_STUPID"]="your stupidity",
		-- Scores TAB screen
		["HUD_SCORESTAB"]={
			"If you're new to the gametype use \23MMHELP\16",
			"command in the Console for help and",
			"\23MMLANG\16 to change the language here",
			"",
			"",
			"\18Have Fun!"
		},
		-- Scores TAB screen role counters
		["HUD_ROLESALIVE"]={
			"Murderers",
			"Sheriffs",
			"Innocents"
		},
		-- Centered text when you're dead
		["HUD_DEAD"]={
			"You are\31 dead",
			"You can't respawn or talk to",
			"people who aren't dead."
		},
		-- Centered text when you joined
		["HUD_MIDJOIN"]={
			"You joined \20mid-game\16, please wait for this round to finish.",
			"While you are waiting, please read the game rules in the \23MMHELP\16 console command"
		},
		-- Centered text when you are alone
		["HUD_ALONE"]={
			"\20".."2 players\16 are required for the game,",
			"Please wait for \20one more\16 player to start"
		},
		["HUD_SNEAKING"]="Sneaking...", --Sneaking
		["HUD_SHOWDOWN"]="Showdown duel!", -- "Showdown duel!"
		--minigame stuff
		["HUD_MINIGAME"]={
			["PRESS"] = "Press\18 CUSTOM3\16 to", --must contain MM escape color codes
			["LEAVE"]="leave",
			["CANCEL"]="cancel",
			["SPECTATE"]="spectate",
			["DUEL"]="a minigame duel",
			["REQUEST"]="request a \23PONG\16 minigame", --must contain MM escape color codes
			["START"]="start a \23SONIC RUN\16 minigame", --must contain MM escape color codes
			["ACCEPT"]="accept the \23PONG\16 challenge!", --must contain MM escape color codes
			["WAIT"]="Waiting for the rival to accept...",
			["SPECTATING"]="Spectating a duel...",
			["BORED"]="Bored?",
			["PONGBALL"]="Spectators can change the ball's direction"
		},
		["HUD_YOU"]="YOU",
		-- Winner stuff
		["HUD_WINNERS"]="Winners:",
		["HUD_WON"]="won!",
		["HUD_WIN"]={
			"TIE!",
			"\21MURDERERS", --must contain MM escape color code
			"\19CIVILIANS" --must contain MM escape color code
		},
		--Time Travel stuff
		["HUD_PAST"]="PAST",
		["HUD_FUTURE"]="FUTURE"
	},["ES"]={ --Spanish by Jesus.B
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Jesus.B",
		["MM"]="Murder Mystery",
		["CHARSET"]="1250C",
		["MMHELP_CMD"]={
			"Usa \23JUMP\16/\23SPIN\16 para desplazarte, \23Next\16/\23Prev Weapon\16 para cambiar de pagina",
			"Presiona \23FIRE\16 para abandonar AYUDA"
		},["MMHELP"]={
			{
				"\23Bienvenido a Murder Mystery!",
				"\23La interpretacion en SRB2 del \23juego \23multijugador \23popular!\16\n",
				"El objetivo del juego es encontrar y eliminar a todos los \21Asesinos\16 antes de que maten a\19 todos los demas\16. Este modo de juego es mas como MATCH asi que nesecitaras tus habilidades de apuntar y disparar para este modo de juego.",
				"Nesecitaras aprender unas cosas basicas primero antes de empezar a jugar...",
				"\nAl inicio de cada ronda, conseguiras un \27Rol\16 que define cual sera tu tarea en la partida. Aqui estan los 3 posibles \27Roles\16 que puedes conseguir:",
				" * \21Asesino\16 - Un verdadero criminal. Tiene que matar a todos, pero solo esta equipado con cuchillos y anillos rojos;",
				" * \20Comisario\16  - Su tarea es encontrar y eliminar a el/los \21Asesinos(s)\16. Los Comisarios pueden usar cualquier Anillo Arma que se encuentre en el mapa;",
				" * \19Inocente\16 - Un civil completamente desarmado, deben evitar ser asesinados pero tambien deben ayudar a encontrar al \21Asesino\16.",
				"\nEsa es toda la informacion basica requerida para empezar a jugar, para mas informacion, lee este manual hasta el final."
			},{
				"\23Sobre situaciones de gameplay\16\n",
				"Como se explico anteriormente en lo basico, el objetivo de los Comisarios es eliminar a todos los \21Asesinos\16, pero situaciones diferentes en el gameplay pueden ocurrir:",
				"\n* Si te matan, entraras en el estado de\31 Muerto\16 los Jugadores en este estado no pueden reaparecer o hablarles globalmente a los jugadores que esten vivos, sus mensajes solo seran visibles para otros jugadores\x8F Muertos\x80",
				"No puedes enviar mensajes/PM players a jugadores vivos mientras estas\31 Muerto\16.",
				"Por cierto,\18 NO \2INTENTES \2CAMBIAR \2TU \2NOMBRE\16, mas detalles sobre esto en la siguiente pagina.",
				"\n* La tarea del \20Comisario\16 es eliminar a todos los \21Asesinos\16 alrededor, pero puede disparar un \19Inocente\16 por accidente.",
				"Si esto ocurre, el \20Comisario\16 se convertira en un \19Inocente\16 y un \19Inocente\16 aleatorio va a tomar su rol silenciosamente. La proxima vez que quieras disparar a alguien como \20Comisario\16 , ¡piensa 2 veces antes de jalar el gatillo!",
				"\n* Cuando un \21Asesino\16 mata a un \20Comisario\16 y todavia hay \19Inocentes\16 vivos, el Comisario dejara caer la \20Esmeralda del Comisario\16 cerca de su cadaver.",
				"A diferencia de las 7 Esmeraldas del Caos, esta esmeralda asignara el rol de \2Heroe\16 a cualquier \19Inocente\16 que la recoja. Si eres uno de los \19Inocentes\16, es tu oportunidad de ser un Heroe y salvar a todos de el (o los) \21Asesino(s)\16!",
				"El rol de \2Heroe\16 no se diferencia de el de \20Comisario\16 excepto por algunos detalles, si el \2Heroe\16 mata a un \19Inocente\16 su rol no se comparte y ambos mueren. Un Heroe no dejara caer una \20Esmeralda del \20Comisario\16 al morir.",
				"\n* Dependiendo de la cantidad de jugadores, puede haber mas de un \21Asesino\16 y \20Comisario\16 entre los jugadores en la ronda. Por ejemplo, empezado a partir de 7 jugadores o mas, \27Equipos\16 de \21Asesinos\16 y \20Comisarios\16 se formaran.",
				"Los \27Aliados\16 pueden chatear entre si en su chat de equipo con el comando de consola \23SAYTEAM\16 (nota que el boton de chat SAYTEAM funcionara como el chat normal).",
				"Si un \27aliado\16 golpea a otro, ambos tendran una alerta personalizada que hara que se reconozcan. ¡Recuerda que otros pueden ver su interaccion 'amistosas' y ver quien eres!"
			},{
				"\23Cosas malas para \23hacer \23en \23Murder \23Mystery\16\n",
				"La regla No.1 de cada juego: \1Se \1amable \1y \1diviertete!\16 Ademas de eso...\n",
				"* Filtrar tu \27Rol\16 no hara el juego un \'Misterio\' (incluso si bromeas), puedes decir el rol de alguien mas si estas seguro, pero no digas el tuyo.\n",
				"* No insultes otros jugadores, las bromas estan permitidas, pero solo en un modo amigable. Nadie confiara en ti si acusas a cualquier jugador sin razon.\n",
				"* Estar AFK es un crimen de guerra. Te tiraran bombas y tu existencia cesara si te quedas quieto por mucho tiempo.\n",
				"* No te renombres durante una partida si estas muerto, hacer esto te expulsara del servidor. Puedes renombrarte si estas vivo. Solo espera la intermision para renombrarte de manera segura.\n",
				"Romper una de estas reglas resulta en una expulsion o algunas veces, un ban por el Admin! Porfavor no las rompas y juega limpiamente."
			},{
				"\23Consejos utiles\16\n",
				"Hemos collecionado algunos consejos que te pueden ayudar en tus partidas de MM:",
				"\n* Si las habilidades de los personajes estan deshabilitadas por el admin, presiona \2SPIN\16 para escabullirte silenciosamente sin dejar rastro o hacer ruido;",
				"\n* Cuando agarras la \20Esmeralda del \20Comisario\16, tendras acceso a todas las armas que recolectaste de antemano;",
				"\n* Averiguar quien es tu \27aliado\16 usando el comando \23SAYTEAM\16 te ayudaria a evitar que les dispares por accidente y que no se revele tu rol;",
				"\n* Puedes lastimarte con obstaculos como lava, pinchos, fuego para tener invencibilidad por 3 segundos;",
				"\n* Intenta encontrar un escondite en el mapa. Aveces te ayuda a deshacerte de la publicidad no deseada;",
				"\n* Si se filtra tu rol, puedes renombrarte y/o cambiar tu skincolor. \1Ten \1en \1cuenta \1que \1tu \1renombre \1se \1mostrara \1en \1el \1chat\16;",
				"\n* El boton\18 FIRENORMAL\16 te permite usar el Cuchillo donde sea siempre que tengas anillos (Los inocentes no tienen un Cuchillo). Y tambien, un Cuchillo no produce un sonido de ataque si estas escabullendote."
			}
		},["MMLANG"]={
			"El idioma que actualmente estas usando es\x82 Espanol\x80\nPuedes cambiarlo con \x87MMLANG [idioma]",
			"El idioma personal para Murder Mystery ha sido cambiado a\x82 Espanol"
		},["ROLE_GET"]={
			"Eres el\x85 Asesino\x80! \x85Mata a todos!",
			"Eres el\x84 Comisario\x80!\x84 Elimina a todos los Asesinos\x80. If you kill an innocent, you'll be stripped of your role.",
			"Eres un \x83Inocente\x80! Escondete y ayuda con la investigacion."
		},["NEWROLE_GET"]={
			"\x87La vida decidio al azar que seras un\x85 Asesino\x87.\x85 Ahora ve y matalos a todos!",
			"\x87".."El universo te hizo un\x84 Comisario\x87! Ve y\x84 elimina a todos los Asesinos\x87!",
			"\x87Se ha decidido que seras un \x82Heroe\x87. Salva a todos de los Asesinos!"
		},["TEAMMATE_HIT"]={
			"Este jugador es uno de tus aliados. Porfavor no golpees a tus aliados la proxima.",
			"Te golpeo uno de tus aliados. No te vengues de el."
		},["MURD_KILLED"]={
			"El\x85 Asesino\x87",
			"\x80".."fue eliminado!"
		},["SHERI_KILLED"]={
			"El\x84 Comisario\x87",
			"\x80".."fue asesinado!",
			"Encuentra su\x84 Esmeralda\x80!"
		},["HERO_KILLED"]={
			"El \x82Heroe\x87",
			"\x80".."fue asesinado!"
		},["DIED_HAZARD"]="ha muerto en un accidente",
		["SHREML_PICK"]="Alguien ha tomado la\x84 Esmeralda del Comisario\x80...",
		["KILL_PUNISHMENT_PM"]={
			"\x87Has matado a un \x83Inocente\x87! Has sido despedido!. (Ya no eres un Comisario)",
			"Los \x82Heroes\x87 no estan hechos para matar \x83Inocentes\x87. Conseguiste la penalizacion de muerte por eso."
		},["INNO_HURT"]={
			"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!",
			"El \x82Heroe\x80 es un pendejo, ha matado a un \x83Inocente\x80. Ahora ambos estan muertos en el suelo. Que verguenza \x82Pendejo\x80"
		},["ONE_LEFT"]={
			"Uno de los\x85 Asesinos\x80 se fue!",
			"Uno de los\x84 Comisarios\x80 se fue!!!",
			"Uno de los \x82Heroes\x80 nos ha abandonado!"
		},["LAST_LEFT"]={
			"El ultimo\x85 Asesino\x80 se fue!",
			"El ultimo\x84 Comisario\x80 se fue!",
			"El ultimo \x82Heroe\x80 se fue!"
		},["REPLACE_LEFT"]={
			"El\x85 Asesino\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!",
			"El\x84 Comisario\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!",
			"Un \x82Heroe\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!"
		},["ENDROUND"]={
			"Todos estan muertos. Los\x85 Asesinos\x80 ganan!",
			"Todos los\x85 Asesinos\x80 fueron asesinados! Los\x83 Civiles\x80 ganan!",
			"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 asesino al ultimo Inocente! Que verguenza,\x84 Comisario\x80",
			"El \x82Heroe\x80 eligio matar al ultimo Inocente. Los\x85 Asesinos\x80 ganan!",
			"Los defensores de los\x83 Inocentes\x80 estan muertos. Los\x85 Asesinos\x80 ganan!"
		},["BMP_VICTIMS"]={
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\xFFIII\x1FFF\xFFFFIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIII\xFFIIII\x1FFF\xFFII\x1FII\x1FFF\xFFIII\x1F1F\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFF\xFFII\x1FII\x1FFF\xFFFFIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FII\x1FFF\xFFII\x1F1FII\x1FFF\xFFFFIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FI\x1FFFII\x1FFF\xFFIIIIII\x1FFF\xFFFF\xFFIII\x1F",
			"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIIII\x1FFFII\x1FFFII\x1F",
			"\xFFIIII\x1FFF\xFFII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\x1F",
			"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F"
		},["BMP_SUSPECTS"]={
			"\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
			"\xFFFFIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFIIIIII\x1FFFIIIII\x1FFF\xFFII\x1FFF\x1F1F\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1F",
			"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1F",
			"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1F",
			"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},["BMP_TIME"]={
			"IIIIII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIII\x1FFF\xFFFFIIII\x1F",
			"IIIIII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFFFII\x1F1F\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFFIIIII\x1FFF\xFFIIIIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFFIIIII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1F",
			"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFF1F\x1F1F\x1F"
		},["BMP_RINGS"]={
			"\xFFFF\xFFFFIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
			"\xFFFF\xFFIIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFFF\xFFIIII\x1FFF\xFFIII\xFFFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFFFII\x1FII\x1FFF\xFFIIII\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
			"\xFFFFII\x1FII\x1FFF\xFFIIIII\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1FIIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIII\x1F",
			"\xFFIIIIII\x1FFFII\x1F1FIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1F",
			"IIIIIII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"III\x1FFFII\x1FFFII\x1FFF\xFF1FII\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"II\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
			"\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},["HUD_ROLES"]={
			"ASESINO",
			"COMISARIO",
			"INOCENTE",
			"HEROE",
			"MUERTO"
		},["HUD_TEAMMATES"]="Aliados",
		["HUD_KILLBY"]="Asesinado por",
		["HUD_STUPID"]="tu estupidez",
		["HUD_SCORESTAB"]={
			"Si eres nuevo al modo de juego, usa el",
			"comando \23MMHELP\16 en la Consola para ayuda y",
			"\23MMLANG\16 para cambiar tu idioma aqui",
			"",
			"",
			"\2Diviertete!"
		},["HUD_ROLESALIVE"]={
			"Asesinos",
			"Comisarios",
			"Inocentes"
		},["HUD_DEAD"]={
			"Estas\31 muerto",
			"No puedes reaparecer o hablarle a",
			"gente que no esta muerta."
		},["HUD_MIDJOIN"]={
			"Te has unido \20en medio de una partida\16, porfavor espera que se acabe esta ronda",
			"Mientras esperas, porfavor lee las reglas del juego en el comando de la consola \23MMHELP\16"
		},["HUD_ALONE"]={
			"\20".."2 jugadores\16 son requeridos para la partida,",
			"Porfavor espera \20un jugador mas\16 para empezar"
		},["HUD_SNEAKING"]="Escabullendote...",
		["HUD_SHOWDOWN"]="Duelo de enfrentamiento!",
		["HUD_MINIGAME"]={
			["PRESS"]="Presiona\18 CUSTOM3\16 para",
			["LEAVE"]="abandonar",
			["CANCEL"]="cancelar",
			["SPECTATE"]="espectar",
			["DUEL"]="un minijuego de duelo",
			["REQUEST"]="pide una partida de \23PONG",
			["START"]="empieza una partida de \23\"SONIC RUN\"",
			["ACCEPT"]="acepta el reto de \23PONG\16!",
			["WAIT"]="Esperando a que el rival acepte...",
			["SPECTATING"]="Espectando un duelo...",
			["BORED"]="Aburrido?",
			["PONGBALL"]="Los espectadores pueden cambiar la direccion de la pelota"
		},["HUD_YOU"]="TU",
		["HUD_WINNERS"]="Ganadores:",
		["HUD_WON"]="ganaron!",
		["HUD_WINS"]="Ganan",
		["HUD_WIN"]={
			"EMPATE!",
			"\21ASESINOS",
			"\19CIVILES"
		},["HUD_PAST"]="PASADO",
		["HUD_FUTURE"]="FUTURO"
	},["FR"]={ --French by Troplucky
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Troplucky",
		["MM"]="Murder Mystery",
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			"Utiliser \23JUMP\16/\23SPIN\16 pour faire d\xE9".."filer, \23Next\16/\23Prev Weapon\16 pour changer de pages",
			"Appuyer sur \23FIRE\16 pour quitter l'aide"
		},["MMHELP"]={
			{
				"\23Bienvenue dans Murder Mystery!",
				"\23L'interpr\xE9tation de SRB2 du \23jeu \23multijoueur \23populaire!\16\n",
				"Le but du jeu est de trouver et \xE9liminer tout les \21Meurtriers\16 avant qu'ils tue\19 tout les autres \16. Ce mode de jeux est similaire \xE0 MATCH donc vous aurez besoins de vos talents de tirs et pr\xE9".."cision.",
				"Vous devez apprendres quelques bases avant de jouer...",
				"\nAu d\xE9".."but de chaque round cous recevrez un \27Role\16 qui d\xE9".."finira votre t\xE2".."che dans cette partie . Voici les tout 3 \27Roles\16 que vous pouvez avoir:",
				" * \21Meurtrier \16 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
				" * \20Sheriff\16  - leur t\xE2".."che est de trouver et tuer le/les \21Meurtrier(s)\16. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
				" * \19Innocent\16 - Complètement sans armes, ils doivent \xE9viter de mourir mais peuvent aider a trouver le \21Meurtrier\16.",
				"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel."
			},{
				"\23".."par-apport  aux gameplay\16\n",
				"Expliquer plus-t\xF4t dans les bases, le but des Sheriffs est d'\xE9liminer tout les \21Meurtriers\16, mais des situations de gameplay differentes peuvent arriv\xE9:",
				"\n* Si vous mourez, vous entrerez l'\xE9tat\31 Mort\16 , Les joueurs dans cet \xE9tat ne peuvent pas r\xE9".."appara\xEEtre ni parler aux joueurs en vie, uniquement pas les autres joueurs Mort.",
				"Vous pouvez pas parler via /PM avec les \31 Mort\16.",
				"aussi\18 N'ESSAYER \2PAS \2DE \2CHANGER \2DE \2NOM\16, plus de d\xE9tails sur la prochaine page.",
				"\n* la t\xE2".."che du \20Sheriff\16 est d'\xE9liminer tout les \21Meurtriers \16 alentours, mais ils peuvent accidentellement tirer sur un \19Innocent\16.",
				"Si cela arrive, le \20Sheriff\16 deviendra \19Innocent\16 et un \19Innocent\16 al\xE9".."atoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que \20Sheriff\16 r".."fl\xE9".."chissez deux fois avant de tirer!",
				"\n* Quand un \21Meurtrier \16 tue un \20Sheriff\16 et qu'il restent des \19Innocents\16 en vie, le Sheriff va l\xE2".."cher l\xE0 \20Sheriff's Emerald\16 vers leur corps.",
				"contraire aux 7 Chaos Emeralds, cette \xE9meraude va donner le r\xF4le \2H\xE9ro\16 \xE0  \19l'Innocent\16 qui l\xE0 ramasse. Si vous \xEAtes un \19l'Innocent\16, c'est votre chance d'\xEAtre un H\xE9ro et de sauver les gens des \21Meurtriers\16!",
				"Le r\xF4le du \2H\xE9ro\16 r\xF4le ne change pas du \20Sheriff\16 except\xE9 quelques d\xE9tails tel que quand le \2H\xE9ro\16 tue un \19Innocent\16 sont r\xF4le ne se partagera pas et les deux mourront. un H\xE9ro ne l\xE2".."chera pas une \20Sheriff's \20Emerald\16 \xE0 sa mort.",
				"\n* Bas\xE9 sur le nombre de joueurs, il-est possible d'avoir plus d'un \21Meurtrier\16 et \20Sheriff\16 parmis les joueurs dans le round. par exemple, \xE0 partir de 7 joueurs ou plus, \27Des \xE9quipes\16 de \21Meurtriers\16 et \20Sheriffs\16 seront faites.",
				"\27Les alli\xE9s\16 peuvent parler en utilisant la commande de console \23SAYTEAM\16 (A not\xE9 que la touche sayteam fonctionne comme la touche say).",
				"Si un \27Alli\xE9\16 en attaque un autre, les deux recevron un message personnel qui sert de rappel. N'oublier pas que votre interaction \"amicale\" peut r\xE9v\xE9ler quit vous \xEAtes!"
			},{
				"\23Choses\xE0 pas faire dans Murder \23Mystery\16\n",
				"R\xE8gle No.1 pour tout les jeux: \1Soyer gentil et \1amusez-vous!\16 A-part \xE7".."a...",
				"\n* R\xE9v\xE9ler son \27Role\16 ruine le \'Myst\xE8re\' (m\xEAme en blague), Vous pouvez r\xE9v\xE9ler le role d'une personne mais pas le votre.",
				"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous cro\xEEre si vous accuser a tord constamment.",
				"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
				"\n* Ne changer pas de nom quand vous \xEAtes mort, vous allez vous faire kick automatiquement du server. Changer de nom est acceptable si vous \xEAtes en vie. Attender juste que la partie se finisse pour \xEAtre s\xFBr.",
				"\nNe pas respecter ces r\xE8gle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
			},{
				"\23Conseils\16\n",
				"Voici des conseils collecter pour MM:",
				"\n* Si les capacit\xE9".."es des personnages est d\xE9sactiver par les administrateurs, appuyer sur \2SPIN\16 pour vous d\xE9placer de fa\xE7on silencieuse;",
				"\n* Quand vous ramasser une \20Sherrif \20Emerald\16, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
				"\n* Trouver vos \27alli\xE9s\16 avec la commande \23SAYTEAM\16 permettera de savoir qui est dans votre \xE9quipe sans prendre de risque;",
				"\n* Prendres des d\xE9gats de tout sauf un \20Sherrif\16 ou un \21Meurtrier\16 vous donne 3 secondes d'invincibilit\xE9;",
				"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicit\xE9s pas voulu en moins;",
				"\n* Si votres role est r\xE9v\xE9ler, Vous pouvez changer de nom/couleur. \1Les \1changement \1de \1nom \1sont \1expos\xE9\16;",
				"\n*La touche \18 FIRENORMAL\16 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
			}
		},["MMLANG"]={
			"Votre langue actuel est\x82 Francais\x80\nVous pouver le changer avec la commande \x87MMLANG [langue]",
			"Votre langue choisie est actuellement\x82 Francais"
		},["ROLE_GET"]={
			"Vous etes le \x85Meurtrier\x80! \x85tuer tout le monde!",
			"Vous etes le \x84Sheriff\x80!\x84 Eliminer tout les Meurtriers\x80. Si vous tuer un innocent, vous perdrer votre role.",
			"Vous etes \x83Innocent\x80! Cacher vous et aider avec l'investigation."
		},["NEWROLE_GET"]={
			"\x87La vie a decider que vous serez un \x85Meurtrier\x87.\x85 Maintenant tuer tout le monde!",
			"\x87L'univers vous a transformer en \x84Sheriff\x87! Allez\x84 eliminer tout les meurtriers\x87!",
			"\x87Vous avez ete choisi comme \x82Hero\x87. Sauvez tout le monde des meurtriers!"
		},["TEAMMATE_HIT"]={
			"Ce joueur est vous Allie. Ne l'attaquer pas un autre fois.",
			"Un Allie vous a attaquer. Ne vous venger pas sur eux."
		},["MURD_KILLED"]={
			"\x85Murtrier\x87",
			"\x80".."est eliminer"
		},["SHERI_KILLED"]={
			"\x84Sheriff\x87",
			"\x80".."a ete assassiner!",
			"Trouver leur\x84 Emeraulde\x80!"
		},["HERO_KILLED"]={
			"\x82Hero\x87",
			"\x80".."a ete assassiner!"
		},["DIED_HAZARD"]="est mort dans un accident",
		["SHREML_PICK"]="Quelqu'un a pris la \x84Sheriff's Emerald\x80...",
		["KILL_PUNISHMENT_PM"]={
			"\x87Vous avez tuer un \x83Innocent\x87! ous etes virez. (You're no longer a Sheriff)",
			"Les \x82Heros\x87 ne doivent pas tuer les \x83Innocents\x87. Vous avez la penaliter de morts pour ca."
		},["INNO_HURT"]={
			"Le \x84Sheriff\x80 a tuer \x83Innocent\x80! Quelqu'un d'autre dois finir le travail!",
			"Le \x82Hero\x80 est devenu un villain et a tuer un \x83Innocent\x80. Maintenant les deux sont morts. C'est t'a faute le\x82 \"Hero\"\x80"
		},["ONE_LEFT"]={
			"Un des \x85Meurtriers\x80 est parti!",
			"Un des \x84Sheriffs\x80 est parti!!!",
			"Un des \x82Heros\x80 nous a abandonner!"
		},["LAST_LEFT"]={
			"Le dernier \x85Meurtrier\x80 est parti!",
			"Le dernier \x84Sheriff\x80 est parti!",
			"Le dernier \x82Hero\x80 est parti!"
		},["REPLACE_LEFT"]={
			"Le \x85Meurtrier\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
			"Le \x84Sheriff\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
			"Un \x82Hero\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!"
		},["ENDROUND"]={
			"Tout le mondes est mort. Les \x85Meurtriers\x80 gagnent!",
			"Tout les \x85Meurtriers\x80 sont morts! Les\x83 Civils\x80 gagnent!",
			"Les \x85Meurtriers\x80 ont gagner car le \x84Sheriff\x80 a tuer le dernier Innocent ! Faute au \x84Sheriff\x80",
			"Le \x82Hero\x80 a choisis de tuer le dernier Innocent. Les \x85Meurtriers\x80 gagnent!",
			"Les protecteurs des \x83Innocents\x80 sont morts. Les \x85Meurtriers\x80 gagnent!"
		},["BMP_VICTIMS"]={
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF",
			"\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFFFIII\x1F1F\x1F1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFIII\x1FFF\xFF",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFF",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFIII\x1FFF",
			"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF",
			"\x1FIIII\x1FFF\xFFII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF",
			"\xFF1FII\x1FFF\xFFFFII\x1FFF\x1FIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\x1FIIII\x1F1F\xFF",
			"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1FFF\xFF"
		},["BMP_SUSPECTS"]={
			"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1F",
			"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1F1FII\x1F",
			"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFIII\x1F1F\x1F",
			"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFF\x1FIII\x1F",
			"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFF\xFFII\x1FFF\xFFFF\xFFFFIII\x1F",
			"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIIII\x1F",
			"\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\x1FIIII\x1F",
			"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},["BMP_TIME"]={
			"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFFFII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFII\x1F",
			"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFFIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1F1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
			"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
			"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1F\xFFII\x1FFF\x1F1F\x1FFF\xFFIII\x1F",
			"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFF\xFFFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFF\xFFFF\xFFIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
		},["HUD_ROLES"]={
			"MEURTRIER",
			"SHERIFF",
			"INNOCENT",
			"HERO",
			"MORT"
		},["HUD_TEAMMATES"]="Alli\xE9s",
		["HUD_KILLBY"]="Tuer par",
		["HUD_STUPID"]="Votre stupidit\xE9".."e",
		["HUD_SCORESTAB"]={
			"Si vous \xEAtes nouveau au mode utiliser ",
			"la commande \23MMHELP\16 dans la Console et",
			"\23MMLANG\16 pour changer la langue ici",
			"",
			"",
			"\2Amusez-Vous!!"
		},["HUD_ROLESALIVE"]={
			"Meurtriers",
			"Sheriffs",
			"Innocents"
		},["HUD_DEAD"]={
			"Vous \xEAtes\31 mort",
			"Vous ne pouvez ni r\xE9".."apparaitre, ni parler",
			"au personnes en vie."
		},["HUD_MIDJOIN"]={
			"Vous avez rejoins en \20pleine partie\16, attendez que le round ce finisse..."
		},["HUD_ALONE"]={
			"\20".."2 joueurs\16 sont requis pour commencer,",
			"attendez pour \20Un\16 joueur de plus",
			"pour commencer"
		},["HUD_SNEAKING"]="En Discret...",
		["HUD_SHOWDOWN"]="Duel Final!",
		["HUD_MINIGAME"]={
			["PRESS"]="Appuyer sur\18 CUSTOM3\16 pour",
			["LEAVE"]="quitter",
			["CANCEL"]="annulez",
			["SPECTATE"]="Regarder",
			["DUEL"]="un minijeux duel",
			["REQUEST"]="demander une partie de \23PONG\16",
			["START"]="d\xE9marrer une partie de \23\"SONIC RUN\"\16",
			["ACCEPT"]="accepter le duel de \23PONG\16!",
			["WAIT"]="En attente que le rival accepte...",
			["SPECTATING"]="En train de regarder un duel...",
			["BORED"]="Ennuyez?",
			["PONGBALL"]="Les Spectateurs peuvent changer la direction de la balle."
		},["HUD_YOU"]="VOUS",
		["HUD_WINNERS"]="GAGNANTS:",
		["HUD_WIN"]={
			"MATCH NUL!",
			"\21MEURTRIERS",
			"\19CIVILS"
		},
	},["PL"]={ -- Polish by sopix & LeonardoTheMutant
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="sopix & LeonardoTheMutant",
		["CHARSET"]="1250C",
		["MM"]="Tajemnica Morderstw",
		["MMHELP_CMD"]={
			"Dla scrollingu wci\x9Cnij klawisz\xEA \23JUMP\16/\23SPIN\16, \xBF".."eby zmieni\xE6".."c stron\xEA wci\x9Cnij \23NEXT\16/\23PREV WEAPON\xF1\16",
			"\23FIRE\16 - wyj\x9C\xE6 z menu pomocy"
		},["MMHELP"]={
			{
				"\23Witaj w Tajemnicy Morderstw!\n\23Interpretacji popularnej gry multiplayer w SRB2!\16\n",
				"Celem gry jest znalezienie i wyeliminowanie wszystkich \21Morderc\xF3w\16 zanim zabij\xB9\19 wszystkich\16. Ten typ gry jest jak MATCH wi\xEA".."c musisz potrafi\xE6 strzela\xE6.",
				"B\xEA".."dziesz potrzebowa\xE6 kilku podstaw....",
				"\nNa pocz\xB9tku ka\xBF".."dej rundy dostaniesz \26Role\16 kt\xF3ra dyktuje co masz robi\xE6 w grze. To s\xB9 3 mozliwe \26Role\16 kt\xF3re mo\xBF".."esz dosta\xE6:",
				" * \21Morderca\16 - Prawdziwy kryminalista. Ma zabi\xE6 wszystkich, ale posiada tylko N\xF3BF ta Czerwone Ringi;",
				" * \20Szeryf\16   - Jego zadaniem jest znalezienie i wyeliminowanie \21Morderc\xF3w\16. Szeryfi mog\xB9 u\xBFywa\xE6 wszystkich typ\xF3w pier\x9C".."cieni;",
				" * \19Niewinny\16 - Kompletnie bezbronny cywil, musi nie zosta\xE6 zabity i pom\xF3".."c w znalezieniu \21Mordercy\16.",
				"\nTo cala podstawa do gry, je\x9Cli nadal czego\x9C nie wiesz lub chcesz dowiedzie\xE6 si\xEA wi\xEA".."cej przeczytaj ten podr\xEA".."cznik do ko\xF1".."ca"
			},{
				"\23O sytuacjach w grze\16\n",
				"Jak wyja\x9Cniono wcze\x9Cniej, ce\xB3".."em jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale r\xF3BFne sytuacje mog\xB9 zasta\xE6:",
				"\n* Je\x9Cli kto\x9C ci\xEA zastrzeli to staniesz si\xEA\31 Martwy\16. Gracze w tym stanie nie mog\xB9 si\xEA odnowi\xE6 ani gada\xE6 na globalnym czacie, twoje wiadomo\x9C".."ci s\xB9 tylko widoczne dla innych\x15 martwych\16 graczy.",
				"Nie mo\xBF".."esz u\xBFy\xE6 \23SAYTO\16 lub PW do osoby kt\xF3ra jest \xBFywa jako\31 MARTWY\16.",
				"Tak\xBF".."e,\18 NIE PR\xD3".."BUJ ZMIENIA\xC6 NAZWY\16, wi\xEA".."cej detali na nast\xEApnej stroni\xEA.",
				"\n* Zadaniem \20Szeryfa\16 jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale czasami Szeryf mo\xBF".."e zabi\xE6 \19Niewinn\xB9 \19osob\xEA\16 przez przypadek.",
				"Je\x9Cli to si\xEA stanie \20Szeryf\16 stanie si\xEA cywilem i inna \19Niewinna \19osoba\16 po cichu przejmie jego rol\xEA. Nast\xEApnym razem jak strzelisz w kogo\x9C jako \20Szeryf\16 pomy\x9Cl kogo zabijasz!",
				"\n* Kiedy \21Morderca\16 zabije \20Szeryfa\16 i zostan\xB9 \xBFywi \19Niewinni\16 Szeryf upu\x9C".."ci \20Szmaragd Szeryfa\16 obok jego cia\xB3".."a.",
				"W przeciwie\xF1stwie do Szmaragd\xF3w Chaosu ten Szmaragd daje role\18 Bohatera\16 do \19Niewinnego\16 kt\xF3ry go pierwszy podnios\xB3. Je\x9Cli jeste\x9C \19Niewinn\xB9 \19osob\xB9\16 to twoja szansa zosta\xE6 bohaterem i uratowa\xE6 wszystkich od \21Morderc\xF3w\16!",
				"\2Bohater\16 nie r\xF3BFni si\xEA za bardzo od \20Szeryfa\16 opr\xF3".."cz kilku detali jak kiedy\18 Bohater\16 zabija \19Niewinnego\16 jego rola nie jest oddawana i obydwoje gin\xB9. Bohater nie upu\x9C".."ci \20Szmaragdu \20Szeryfa\16 przy jego \x9Cmierci.",
				"\n* Zale\xBFnie od ilosci graczy, mo\xBF".."e by\xE6 wi\xEA".."cej ni\xBF jeden \21Morderc\xF3w\16 i \20Szeryfx\xF3w\16 po\x9Cr\xF3".."d graczy w grze. Na przyk\xB3".."ad, gdy jest wi\xEA".."cej ni\xBf 7 graczy to\26 Dru\xBFyny\16 \21Morderc\xF3w\16 i \20Szeryf\xF3w\16 b\xEA".."d\xB9 zformowane.",
				"\26Wsp\xF3\xB3nicy\16 mog\xB9 czatowa\xE6 z dru\xBFyn\xB9 za pomoc\xB9 komendy \23SAYTEAM\16 (przycisk SAYTEAM b\xEA".."dzie tak samo dziala\xB3 jak normalny czat).",
				"Je\x9Cli jeden \26wsp\xF3lnik\16 strzeli drugiego to dostanie wiadomo\x9CE6 \xBF".."eby nie strzelal do wspx\xF3B3nika. Pami\xEAtaj \xBF".."e inni mog\xB9 zobaczy\xE6 twoj\xB9 'przyjazn\xB9' rozmow\xEA i dowiedzie\xE6 si\xEA kim jeste\x9C!"
			},{
				"\23Rzeczy kt\xF3rych nie wolno \23robi\xE6 \23w \23Tajemnicy \23Morderstw\16\n",
				"Zasada numer 1 ka\xBF".."dej gry:\18 B\xB9".."d\x9F \18mi\xB3y \18i \18si\xEA \18baw!\16 Opr\xF3".."cz tego...",
				"* Wypowiedzenie swojej \26Roli\16 sprawi \xBF".."e gra nie b\xEA".."dzie ju\xBF \'Tajemnic\xB9\', mo\xBF".."esz wypowiedzie\xE6 role kogo\x9C innego jak wiesz ale nigdy swojej.",
				"* Nie b\xB9".."d\x9F nie mi\xB3y dla innych graczy, \xBF".."arty s\xB9 dozwolone ale tylko w przyjaznej atmosferze. Nikt ci nie b\xEA".."dzie ufa\xB3 jak b\xEA".."dziesz ci\xB9gle oskarza\xB3 innych bez powodu.",
				"* Bycie AFK to zbrodnia wojenna. Je\x9Cli b\xEA".."dziesz si\xEA nie ruszal przez dluzszy czas zostaniesz wykopany (tylko je\x9Cli \xBFyjesz).",
				"* Nie zmieniaj swojej nazwy p\xF3ki jeste\x9C Martwy(a) - gra jest bardzo \x9C".."cis\xB3".."a i\21 wyrzuci\16 ci z gry je\xBF".."eli to zrobisz. Po prostu zaczekaj na ekran zako\xF1".."czenia rundy \xBF".."eby zn\xF3w bezpiecznie zmienia\xE6 imi\xEA.",
				"Z\xB3".."amanie tych zasad mo\xBF".."e spowodowa\xE6 \xBF".."e zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie \xB3".."ama\xE6 i gra\xE6 fer."
			},{
				"\23Przydatne porady\16\n",
				"Zebrali\x9Cmy kilka porad kt\xF3rzy mog\xB9 przyda\xE6 ci w twojej grze w TM:",
				"\n* Je\xBF".."eli zdolno\x9C".."ci postaci s\xB9 wy\xB3B9".."czone administratorem, zaci\x9Cnij \2SPIN\16 \xBF".."eby skrada\xE6 si\xEA ukradkiem i nie zostawia\xE6 za sob\xB9 \x9Clad\xF3w;",
				"\n* Kiedy podniesiesz \20Szmaragd \20Szeryfa\16 b\xEA".."dziesz mie\xE6 dost\xEAp do ka\xBF".."dej broni i ring\xF3w, kt\xF3rzy zebrale\x9C uprzednio;",
				"\n* Mo\xBFna dowiedzie\xE6 si\xEA kim jest tw\xF3j \26kolega\16 z dru\xBFyny bez wykorzystania broni, po prostu wy\x9Cli powiadomienie za pomoc\xB9 komendy \23SAYTEAM\16 w konsoli i zaczekaj a\xBF p\xF3ki na ni\xB9 kto\x9C odpowie z twojej dru\xBFyny.;",
				"\n* Mo\xBF".."esz zosta\xE6 zraniony przez przeszkody takie jak lawa, kolce i ogie\xF1 \xBF".."eby dosta\xE6 effekt niezwyci\xEAzo\x9C".."ci na 3 sekundy;",
				"\n* Spr\xF3".."buj znale\x9FE6 miejsce dla kryj\xF3wke na mapie. Czasami, pomaga to pozby\xE6 si\xEA niechcianej publiczno\x9C".."ci;",
				"\n* Je\xBF".."eli twoja rola przestanie by\xE6 tajemnic\xB9, mo\xBF".."esz zmieni\xE6 swoje imi\xEA i zmieni\xE6 sw\xF3j kolor postaci. \18Pami\xEAtaj, \18\xBF".."e \18zmiana \18imienia \18b\xEA".."dzie \18widoczna \18w \18czacie\16;",
				"\n* Przycisk\23 FIRENORMAL\16 pozwala wykorzystywa\xE6 N\xF3BF wsz\xEA".."dzie, jak masz Ringi (Niewinni nie posiadaj\xB9 No\xBF".."a). Tak\xBF".."e, N\xF3BF nie robi dzwi\xEAk\xF3w ataku je\xBF".."eli skradzasz si\xEA."
			}
		},["MMLANG"]={
			"Twoj aktualnie uzywany jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
			"Personalny jezyk zostal ustawiony na\x82 Polski"
		},["ROLE_GET"]={
			"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
			"Jestes \x84Szeryfem\x80!\x84 Wyeliminuj wszystkich Mordercow\x80. Jesli zabijesz Niewinnego, stracisz role.",
			"Jestes \x83Niewinny\x80! Kryj sie i pomoz w dochodzeniu."
		},["NEWROLE_GET"]={
			"\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
			"\x87Swiat sprawil cie nowym \x84Szeryfem\x87! To teraz twoja robota\x84 wyeliminowac wszystkich Mordercow\x87!",
			"\x87Wszyscy obroncy odeszli ale swiat sprawil cie nowym\x82 Bohaterem\x87! To twoja szansa uratowac dzien!",
			"\x87Wyeliminowales jednego z \x85Morderc\x87! Zostales awansowany na\x82 Bohatera\x87!"
		},["TEAMMATE_HIT"]={
			"Ten gracz jest twoim wspolnikiem, natepnym razem nie probuj zabiac ich ponownie",
			"Twoj wspolnik cie zaatakowal, nie probuj sie mscic"
		},["MURD_KILLED"]={
			"\x85Morderca\x87",
			"\x80zostal wyeliminowany!"
		},["SHERI_KILLED"]={
			"\x84Szeryf\x87",
			"\x80zostal zamordowany!",
			"Znajdz zgubiony \x84Szmaragd Szeryfa\x80!"
		},["HERO_KILLED"]={
			"\x82".."Bohater\x87",
			"\x80zostal zamordowany!"
		},
		["DIED_HAZARD"]="zginal(ela) w nieszczesnym wypadku",
		["SHREML_PICK"]="Ktos podniosl \x84Szmaragd Szeryfa\x80...",
		["KILL_PUNISHMENT_PM"]={
			"\x87Zamordowales \x83Niewinnego\x87! Nie jestes juz \x84Szeryfem\x87!",
			"\x82".."Bohaterowie nie sa po to, zeby zabijac \x83Niewinnych\x87. Masz za to kare smierci.",
			"\x87O nie! Zamordowales \x84Szeryfa\x87! Masz za to kare smierci!",
			"\x87Zabiles takiego samego \x83Niewinnego\x87 gracza jak i ty! Masz za to kare smierci!",
			"\x87O nie! Zamordowales\x82 Bohatera\x87! Masz za to kare smierci!"
		},["INNO_HURT"]={
			"\x84Szeryfie\x80 zamordowales niewinnego! Ktos z \x83Niewinnych\x80 musi dokonczyc robote!",
			"\x82".."Bohater\x80 jest skurwielem, zabil spokojnego \x83Niewinnego\x80. Teraz obydwoje nie zyja. Wstyd dla bohatera"
		},["ONE_LEFT"]={
			"Jeden z \x85Mordercow\x80 wyszedl!",
			"Jeden z \x84Szeryfow\x80 wyszedl!",
			"Jeden z\x82 Bohaterow\x80 zostawil nas!"
		},["LAST_LEFT"]={
			"Ostatni \x85Mordercow\x80 wyszedl!",
			"Ostatni \x84Szeryfow\x80 wyszedl!",
			"Ostatni\x82 Bohaterow\x80 wyszedl!"
		},["REPLACE_LEFT"]={
			"\x85Morderca\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
			"\x84Szeryf\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
			"\x82".."Bohater\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!"
		},["ENDROUND"]={
			"Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
			"Wszyscy Mordercy zostali wyeliminowani,\x83 Cywile\x80 wygrywaja!",
			"\x85Mordercy\x80 wygrywaja, poniewaz \x84Szeryf\x80 zamordowal ostatniego Niewinnego!",
			"\x82".."Bohater\x80 wybral do zabicia ostatniego Niewinnego. \x85Moredrcy\x80 Wygrywaja!",
			"Wszyscy Szeryfi i Bohaterzy zginely, \x85Mordercy\x80 wygrywaja!"
		},["BMP_VICTIMS"]={
			"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1F",
			"II\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1F",
			"II\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\x1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F"
		},["BMP_SUSPECTS"]={
			"\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFIII\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIII\xFFII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\x1F",
			"IIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFFF\xFFIII\x1FFF\xFFIIIIII\x1FFFIIIIIIII\x1FFF\xFF1FIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1F",
			"II\x1F1F\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1F1FII\x1FFFII\x1FIIIII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1F",
			"II\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FIIII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"II\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1FIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
			"II\x1FFF\xFFFF\xFFFF\x1FIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFF1FII\x1FFFIIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFFII\x1F",
			"\x1F1F\x1FFF\xFFFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F"
		},["BMP_TIME"]={
			"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFF\xFFIIII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
			"\xFFII\x1FFF\x1F1F\x1FFF\xFFFFIIII\x1FFFIIIIII\x1FFF\x1FIII\x1F",
			"II\x1FFF\xFFFF\xFFFF\xFFIIII\x1F1F\xFFIIIIII\x1FFF\xFF1FIII\x1F",
			"II\x1FFFII\x1FFFIIII\x1F1F\xFFFFII\x1F1FII\x1FFF\xFFFF\x1FIII\x1F",
			"II\x1FFFII\x1FFFIII\x1F1F\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1F",
			"IIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1F",
			"\x1FIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1F\xFF\x1FIIII\x1F\x1F",
			"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1F",
			"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1F",
			"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFII\x1F",
			"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1F\xFFII\x1FFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F"
		},["HUD_ROLES"]={
			"MORDERCA",
			"SZERYF",
			"BOHATER",
			"NIEWINNY",
			"MARTWY"
		},
		["HUD_TEAMMATES"]="Cz\xB3onkowie dru\xBFyny",
		["HUD_KILLBY"]="Zabity przez",
		["HUD_STUPID"]="tw\xF3j idiotyzm",
		["HUD_SCORESTAB"]={
			"Je\x9Cli ten tryb jest ci nowy u\xBFyj",
			"komendy \23MMHELP\16 w Konsoli dla pomocy",
			"i \23MMLANG\16 dla zmiany j\xEAzyka tutaj",
			"",
			"",
			"\2Baw si\xEA dobrze ;)"
		},["HUD_ROLESALIVE"]={
			"Morderc\xF3w",
			"Szeryf\xF3w",
			"Niewinnych"
		},["HUD_DEAD"]={
			"Jeste\x9C\31 martwy(a)",
			"Nie mozesz si\xEA odnawia\xE6 lub gada\xE6 do \xBFywych"
		},["HUD_MIDJOIN"]={
			"Pan(i) dolaczy\xB3(a) si\xEA \20w \x9Crodku rundy\16, prosze poczeka\xE6 na now\xB9 rund\xEA \xBF".."eby zagra\xE6.",
			"Podczas oczekiwania prosimy o zapoznanie si\xEA z regulami gry w poleceniu konsoli \23MMHELP\16"
		},["HUD_ALONE"]={
			"\20".."2 graczy\16 jest wymaganych do gry,",
			"prosz\xEA poczeka\xE6 na \20jeszcze jednego\16 gracza",
			"dla startu"
		},["HUD_SNEAKING"]="Skradzamy si\xEA...",
		["HUD_SHOWDOWN"]="Pojedynek losu!",
		["HUD_MINIGAME"]={
			["PRESS"] = "Naci\x9Cnij\18 CUSTOM3\16, aby", --must contain MM escape color codes
			["LEAVE"]="opu\x9C".."ci\xE6 gr\xEA",
			["CANCEL"]="anulowa\xE6",
			["SPECTATE"]="ogl\xB9".."da\xE6",
			["DUEL"]="za pojedynkiem w minigrz\xEA",
			["REQUEST"]="zagra\xE6 w \23PONG\16 z przeciwnikiem", --must contain MM escape color codes
			["START"]="zagra\xE6 w \23SONIC RUN", --must contain MM escape color codes
			["ACCEPT"]="zaakceptowa\xE6 zaproszenie w \23PONG\16!", --must contain MM escape color codes
			["WAIT"]="Czekamy na odpowied\x9F przeciwnika...",
			["SPECTATING"]="Ogl\xB9".."damy za pojedynkiem...",
			["BORED"]="Nudzisz si\xEA?",
			["PONGBALL"]="Jako widz mo\xBF".."esz zmienia\xE6 kierunek pilki"
		},["HUD_YOU"]="TY",
		["HUD_WINNERS"]="Wygrani:",
		["HUD_WON"]="zwyci\xEABFyl(a)!",
		["HUD_WIN"]={
			"REMIS!",
			"\21M\xD3RDERCY",
			"\19CYWILE"
		},["HUD_PAST"]="PRZESZLO\x8CC6",
		["HUD_FUTURE"]="PRZYSZLO\x8CC6"
	},["RU"]={
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Arnie37, Sonic1983, LeonardoTheMutant",
		["NONASCII"]=true, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
		["MM"]="\xD2E0\xE9ED\xE0 \xD3E1\xE8E9\xF1F2\xE2E0",
		["CHARSET"]="1251C",
		["MMHELP_CMD"]={
			"\23JUMP\16/\23SPIN\16 - \xEFF0\xEEEA\xF0F3\xF2EA\xE0 \xF1F2\xF0E0\xEDE8\xF6FB, \23Next\16/\23Prev Weapon\16 - \xF1EC\xE5ED\xE8F2\xFC \xF1F2\xF0E0\xEDE8\xF6F3",
			"\23FIRE\16 - \xEFEE\xEAE8\xEDF3\xF2FC \xFDF2\xEE \xECE5\xEDFE"
		},["MMHELP"]={
			{
				"\23\xC4EE\xE1F0\xEE \xEFEE\xE6E0\xEBEE\xE2E0\xF2FC \xE2 \xD2E0\xE9ED\xF3 \xD3E1\xE8E9\xF1F2\xE2E0!\16",
				"\23\xC8ED\xF2E5\xF0EF\xF0E5\xF2E0\xF6E8\xFE \xEFEE\xEFF3\xEBFF\xF0ED\xEEE9 \xE8E3\xF0FB \xE2 SRB2!\16\n",
				"\xD6E5\xEBFC \xE8E3\xF0FB - \xEDE0\xE9F2\xE8 \xE8 \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \21\xD3E1\xE8E9\xF6\16 \xE4EE \xF2EE\xE3EE, \xEAE0\xEA \xEEED\xE8 \xF3E1\xFCFE\xF2 \19\xEEF1\xF2E0\xEBFC\xEDFB\xF5\16. \xDDF2\xEEF2 \xF0E5\xE6E8\xEC \xEFEE\xE4EE\xE1E5\xED \xF0E5\xE6E8\xECF3 \xCCC0\xD2D7, \xF2E0\xEA \xF7F2\xEE \xE7E4\xE5F1\xFC \xC2E0\xEC \xEFEE\xF2F0\xE5E1\xF3FE\xF2F1\xFF \xEDE0\xE2FB\xEAE8 \xF1F2\xF0E5\xEBFC\xE1FB \xE8 \xEFEE\xEFE0\xE4E0\xEDE8\xFF.",
				"\xD1ED\xE0F7\xE0EB\xE0, \xEFE5\xF0E5\xE4 \xF2E5\xEC, \xEAE0\xEA \xE8E3\xF0E0\xF2FC, \xC2E0\xEC \xEDE0\xE4EE \xE8E7\xF3F7\xE8F2\xFC \xEFE0\xF0EE\xF7EA\xF3 \xE0E7\xEEE2...",
				"\n\xC2 \xF1E0\xECEE\xEC \xEDE0\xF7E0\xEB\xE5 \xEAE0\xE6E4\xEEE3\xEE \xF0E0\xF3ED\xE4E0, \xC2E0\xEC \xE2FB\xEFE0\xE4E5\xF2 \27\xD0EE\xEBFC\16, \xEEEF\xF0E5\xE4E5\xEBFF\xFEF9\xE0FF \xC2E0\xF8E8 \xE7E0\xE4E0\xEDE8\xFF \xE2EE \xE2F0\xE5EC\xFF \xE8E3\xF0FB. \xC2EE\xF2 \xE2F1\xE5 3 \xE2EE\xE7EC\xEEE6\xEDFB\xE5 \xD0EE\xEBE8, \xEAEE\xF2EE\xF0FB\xE5 \xECEE\xE6ED\xEE \xEFEE\xEBF3\xF7E8\xF2FC \xEDE0 \xF1F2\xE0F0\xF2E5:",
				"* \21\xD3E1\xE8E9\xF6E0\16 - \xEFF0\xE5F1\xF2F3\xEFED\xE8EA \xE2EE \xEFEB\xEEF2\xE8. \xC8EC \xEDF3\xE6ED\xEE \xE2F1\xE5F5 \xF3E1\xE8F2\xFC, \xEDEE \xE2 \xE0F0\xF1E5\xEDE0\xEBE5 \xF3 \xEDE8\xF5 \xF2EE\xEBFC\xEAEE \xCDEE\xE6 \xE8 \xCAF0\xE0F1\xEDFB\xE5 \xCAEE\xEBFC\xF6E0;",
				"* \20\xD8E5\xF0E8\xF4\16 - \xECE5\xF1F2\xEDE0\xFF \xEFEE\xEBE8\xF6E8\xFF. \xC8F5 \xE7E0\xE4E0\xF7E0 \xE7E0\xEAEB\xFEF7\xE0E5\xF2F1\xFF \xE2 \xEDE0\xF5EE\xE6E4\xE5ED\xE8E8 \xE8 \xF3F1\xF2F0\xE0ED\xE5ED\xE8E8 \xE2F1\xE5F5 \xD3E1\xE8E9\xF6. \xD8E5\xF0E8\xF4FB \xECEE\xE3F3\xF2 \xE8F1\xEFEE\xEBFC\xE7EE\xE2E0\xF2FC \xE2F1\xE5 \xCAEE\xEBFC\xF6E0-\xD0F3\xE6FC\xFF, \xE4EE\xF1F2\xF3EF\xEDFB\xE5 \xEDE0 \xEBEE\xEAE0\xF6E8\xE8;",
				"* \19\xCDE5\xE2E8\xEDED\xFBE9\16 - \xE1E5\xE7EE\xE1E8\xE4ED\xFBE9 \xE6E8\xF2E5\xEBFC, \xE8EC \xEDE0\xE4EE \xE8E7\xE1E5\xE3E0\xF2FC \xE3E8\xE1E5\xEBE8, \xEDEE \xEEED\xE8 \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xEFEE\xECEE\xF7FC \xF0E0\xF1EA\xF0FB\xF2FC \21\xD3E1\xE8E9\xF6F3\16.",
				"\n\xDDF2\xEE \xE1FB\xEBE8 \xE2F1\xE5 \xE1E0\xE7EE\xE2FB\xE5 \xE7ED\xE0ED\xE8FF, \xF2F0\xE5E1\xF3E5\xECFB\xE5 \xE4EB\xFF \xEFEE\xEDE8\xECE0\xEDE8\xFF \xE8E3\xF0FB. \xD0E5\xEAEE\xECE5\xEDE4\xF3E5\xEC \xEFF0\xEEF7\xE8F2\xE0F2\xFC \xFDF2\xF3 \xF1EF\xF0E0\xE2EA\xF3 \xE4EE \xEAEE\xEDF6\xE0 \xE4EB\xFF \xE1EE\xEBFC\xF8E5\xE3EE \xEFEE\xEDE8\xECE0\xEDE8\xFF \xE8E3\xF0EE\xE2FB\xF5 \xECE5\xF5E0\xEDE8\xEA \xE8 \xECED\xEEE3\xEE \xF7E5\xE3EE \xE8ED\xF2E5\xF0E5\xF1F2\xEDEE\xE3EE."
			},{
				"\23\xCEE1 \xE8E3\xF0EE\xE2FB\xF5 \xF1E8\xF2F3\xE0F6\xE8FF\xF5 \xE8 \xE3E5\xE9EC\xEFEB\xE5E5\16\n",
				"\xCAE0\xEA \xE1FB\xEBEE \xF0E0\xF1F1\xEAE0\xE7E0\xEDEE \xF0E0\xEDE5\xE5 \xE2 \xE0E7\xE0F5, \xF6E5\xEBFC \20\xD8E5\xF0E8\xF4EE\xE2\16 - \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \21\xD3E1\xE8E9\xF6\16, \xEDEE \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xE1FB\xF2FC \xE2EE\xE7EC\xEEE6\xEDFB\xECE8 \xF1EB\xE5E4\xF3FE\xF9E8\xE5 \xF1E8\xF2F3\xE0F6\xE8E8:",
				"\n* \xC5F1\xEBE8 \xE2 \xC2E0\xF1 \xEFEE\xEFE0\xE4E5\xF2 \xEAEE\xEBFC\xF6EE \xE8E3\xF0EE\xEAE0, \xC2FB \xF1F2\xE0ED\xE5F2\xE5 \31\xCCB8\xF0F2\xE2FB\xEC\16. \xD2E0\xEAE8\xEC \xE8E3\xF0EE\xEAE0\xEC \xE1EB\xEEEA\xE8F0\xEEE2\xE0ED\xEE \xE2EE\xE7F0\xEEE6\xE4E5\xEDE8\xE5 \xE8 \xE2EE\xE7EC\xEEE6\xEDEE\xF1F2\xFC \xEFE8\xF1E0\xF2FC \xEFF0\xE8E2\xE0F2\xEDEE \xE2 \xF7E0\xF2 \xF2E5\xEC, \xEAF2\xEE \xE5F9\xB8 \xE6E8\xE2EE\xE9. \xC8F5 \xF1EE\xEEE1\xF9E5\xEDE8\xFF \xE1F3\xE4F3\xF2 \xE2E8\xE4ED\xFB \xF2EE\xEBFC\xEAEE \xF2E0\xEAE8\xEC \xE6E5 \31\xCCE5\xF0F2\xE2E5\xF6E0\xEC\16.",
				"\xC5F9\xB8, \18\xCDC5 \xCFDB\xD2C0\xC9D2\xC5D1\xDC \xD1CC\xC5CD\xC8D2\xDC \xD1C2\xCEA8 \xC8CC\xDF \xC8C3\xD0CE\xCAC0 \18\xC2CE \18\xC2D0\xC5CC\xDF \18\xC8C3\xD0DB!\16 \xCFEE\xE4F0\xEEE1\xEDE5\xE5 \xEEE1 \xFDF2\xEEEC \xEDE0 \xF1EB\xE5E4\xF3FE\xF9E5\xE9 \xF1F2\xF0E0\xEDE8\xF6E5.",
				"\n* \xC7E0\xE4E0\xF7E0 \20\xD8E5\xF0E8\xF4E0\16 - \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \21\xD3E1\xE8E9\xF6\16 \xE2EE\xEAF0\xF3E3, \xEDEE \xEEED\xE8 \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xEFEE \xF1EB\xF3F7\xE0E9\xEDEE\xF1F2\xE8 \xEFF0\xE8F1\xF2F0\xE5EB\xE8F2\xFC \19\xCDE5\xE2E8\xEDED\xEEE3\xEE\16.",
				"\xC5F1\xEBE8 \xF2E0\xEAEE\xE5 \xEFF0\xEEE8\xE7EE\xE9E4\xB8F2, \20\xD8E5\xF0E8\xF4\16 \xF1F2\xE0ED\xE5F2 \19\xCDE5\xE2E8\xEDED\xFBEC\16, \xE0 \xF1EB\xF3F7\xE0E9\xEDEE\xECF3 \19\xCDE5\xE2E8\xEDED\xEEEC\xF3\16 \xF0E5\xE7EA\xEE \xEFE5\xF0E5\xE4E0\xF1F2\xF1FF \xE5E3\xEE \xF0EE\xEBFC. \xC2 \xF1EB\xE5E4\xF3FE\xF9E8\xE9 \xF0E0\xE7, \xE1F3\xE4F3\xF7E8 \20\xD8E5\xF0E8\xF4EE\xEC\16, \xE4F3\xECE0\xE9F2\xE5 \xE4E2\xE0E6\xE4FB \xEFE5\xF0E5\xE4 \xEDE0\xE6E0\xF2E8\xE5EC \xEAF3\xF0EA\xE0!",
				"\n* \xCAEE\xE3E4\xE0 \21\xD3E1\xE8E9\xF6E0\16 \xF3E1\xFCB8\xF2 \20\xD8E5\xF0E8\xF4E0\16, \xEDEE \xE2 \xE8E3\xF0E5 \xE5F9\xB8 \xE5F1\xF2FC \19\xCDE5\xE2E8\xEDED\xFBE5\16, \xEEEA\xEEEB\xEE \xE5E3\xEE \xF2F0\xF3EF\xE0 \xF3EF\xE0E4\xB8F2 \xE5E3\xEE \20\xC8E7\xF3EC\xF0F3\xE4\16.",
				"\xC2 \xEEF2\xEBE8\xF7E8\xE5 \xEEF2 7-\xE8 \xC8E7\xF3EC\xF0F3\xE4EE\xE2 \xD5E0\xEEF1\xE0, \xFDF2\xEEF2 \xE8E7\xF3EC\xF0F3\xE4 \xF1EF\xEEF1\xEEE1\xE5ED \xF1E4\xE5EB\xE0F2\xFC \18\xC3E5\xF0EE\xE5EC\16 \xEBFE\xE1EE\xE3EE \19\xCDE5\xE2E8\xEDED\xEEE3\xEE\16, \xEFEE\xE4EE\xE1F0\xE0E2\xF8E5\xE3EE \xE5E3\xEE. \xC5F1\xEBE8 \xC2FB \19\xCDE5\xE2E8\xEDED\xFBE9\16, \xF2EE \xFDF2\xEE \xE1F3\xE4E5\xF2 \xC2E0\xF8E8\xEC \xF8E0\xEDF1\xEEEC \xF1F2\xE0F2\xFC \18\xC3E5\xF0EE\xE5EC\16 \xE8 \xF1EF\xE0F1\xF2E8 \xE2F1\xE5F5 \xEEF2 \21\xD3E1\xE8E9\xF6\16!",
				"\xD0EE\xEBFC \18\xC3E5\xF0EE\xFF\16 \xEDE5\xF1E8\xEBFC\xEDEE \xEEF2\xEBE8\xF7E0\xE5F2\xF1FF \xEEF2 \xF0EE\xEBE8 \20\xD8E5\xF0E8\xF4E0\16 \xE7E0 \xE8F1\xEAEB\xFEF7\xE5ED\xE8E5\xEC \xEDE5\xF1EA\xEEEB\xFCEA\xE8F5 \xE4E5\xF2E0\xEBE5\xE9, \xEFEE \xF2E8\xEFF3, \xE5F1\xEBE8 \18\xC3E5\xF0EE\xE9\16 \xF3E1\xE8E2\xE0E5\xF2 \19\xCDE5\xE2E8\xEDED\xEEE3\xEE\16, \xF2EE \xE8F5 \xF0EE\xEBFC \xEDE5 \xEFE5\xF0E5\xE4E0\xB8F2\xF1FF, \xE0 \xFDF2\xE8 \xEEE1\xE0 \xEFF0\xEEF1\xF2EE \xEFEE\xECF0\xF3F2. \20\xC8E7\xF3EC\xF0F3\xE4 \20\xD8E5\xF0E8\xF4E0\16 \xEFEE\xF1EB\xE5 \xF1EC\xE5F0\xF2E8 \xE8E7 \18\xC3E5\xF0EE\xFF\16 \xEDE5 \xE2FB\xEFE0\xE4E0\xE5F2.",
				"\n* \xC2 \xE7E0\xE2E8\xF1E8\xECEE\xF1F2\xE8 \xEEF2 \xEAEE\xEB-\xE2E0 \xE8E3\xF0EE\xEAEE\xE2, \21\xD3E1\xE8E9\xF6\16 \xECEE\xE6E5\xF2 \xE1FB\xF2FC \xF1F0\xE0E7\xF3 \xEDE5\xF1EA\xEEEB\xFCEA\xEE, \xF2E0\xEA \xE6E5 \xE8 \xF1 \20\xD8E5\xF0E8\xF4E0\xECE8\16. \xCDE0\xEFF0\xE8EC\xE5F0, \xE5F1\xEBE8 \xE2 \xE8E3\xF0E5 7 \xE8EB\xE8 \xE1EE\xEBE5\xE5 \xE8E3\xF0EE\xEAEE\xE2, \xF1F4\xEEF0\xECE8\xF0F3\xFEF2\xF1FF \26\xCAEE\xECE0\xEDE4\xFB \21\xD3E1\xE8E9\xF6\16 \xE8 \20\xD8E5\xF0E8\xF4EE\xE2\16.",
				"\xCDE0\xEFE0\xF0ED\xE8EA\xE8 \xECEE\xE3F3\xF2 \xEEE1\xF9E0\xF2FC\xF1FF \xECE5\xE6E4\xF3 \xF1EE\xE1EE\xE9 \xE2 \xE8F5 \xEAEE\xECE0\xEDE4\xEDEE\xEC \xF7E0\xF2E5 \xF7E5\xF0E5\xE7 \xEAEE\xEDF1\xEEEB\xFCED\xF3FE \xEAEE\xECE0\xEDE4\xF3 \23SAYTEAM\16 (\xEFEE\xE4EC\xE5F7\xF3, \xF7F2\xEE \xEAED\xEEEF\xEAE0 \xEAEE\xECE0\xEDE4\xEDEE\xE3EE \xF7E0\xF2E0 \xE1F3\xE4E5\xF2 \xF0E0\xE1EE\xF2E0\xF2FC \xF2E0\xEA \xE6E5, \xEAE0\xEA \xEAED\xEEEF\xEAE0 \xEEE1\xFBF7\xEDEE\xE3EE \xF7E0\xF2E0).",
				"\xC5F1\xEBE8 \xEEE4\xE8ED \xCDE0\xEFE0\xF0ED\xE8EA \xEDE0\xEDE5\xF1B8\xF2 \xF3F0\xEEED \xE4F0\xF3E3\xEEEC\xF3, \xEEED\xE8 \xEEE1\xE0 \xEFEE\xEBF3\xF7E0\xF2 \xEFE5\xF0F1\xEEED\xE0EB\xFCED\xEEE5 \xEFF0\xE5E4\xF3EF\xF0E5\xE6E4\xE5ED\xE8E5, \xEAEE\xF2EE\xF0EE\xE5 \xEFF0\xEEE8\xEDF4\xEEF0\xECE8\xF0F3\xE5F2 \xE8F5 \xEEE1 \xFDF2\xEEEC. \xCFEE\xECED\xE8F2\xE5, \xF7F2\xEE \xE4F0\xF3E3\xE8E5 \xECEE\xE3F3\xF2 \xE2E8\xE4E5\xF2FC \xC2E0\xF8E8 '\xE4F0\xF3E6\xE5F1\xEAE8\xE5' \xEEF2\xEDEE\xF8E5\xEDE8\xFF \xE8 \xEFEE\xEDFF\xF2FC, \xEAF2\xEE \xC2FB!"
			},{
				"\23\xD7E5\xE3EE \xEDE5\xEBFC\xE7FF \xE4E5\xEBE0\xF2FC \xE2 \xD2E0\xE9ED\xE5 \xD3E1\xE8E9\xF1F2\xE2E0\16",
				"\xCFF0\xE0E2\xE8EB\xEE No.1 \xEBFE\xE1EE\xE9 \xE8E3\xF0FB: \18\xC1F3\xE4FC\xF2E5 \18\xE4EE\xE1F0\xFB \18\xE8 \18\xE2E5\xF1E5\xEBE8\xF2E5\xF1FC\16! \xC8 \xEDE5 \xE4E5\xEBE0\xE9F2\xE5 \xF1EB\xE5E4\xF3FE\xF9E8\xF5 \xE2E5\xF9E5\xE9...\n",
				"\n* \xC7E0\xF1EF\xEEE9\xEBE5\xF0E8\xF8FC \xF0EE\xEBFC - \xF2E2\xEEFF \xE2E8\xEDE0, \xEDE5 \xE1F3\xE4E5\xF2 \xD2E0\xE9ED\xEEFE \xE8E3\xF0E0. \xCCEE\xE6ED\xEE \xF1EA\xE0E7\xE0F2\xFC \xF7FC\xFE-\xF2EE \xF0EE\xEBFC, \xE5F1\xEBE8 \xF1E8\xEBFC\xEDEE \xF3E2\xE5F0\xE5ED\xFB \xE2 \xFDF2\xEEEC, \xEDEE \xE3EE\xE2EE\xF0E8\xF2FC \xF1E2\xEEFE - \xEDE5\xEBFC\xE7FF.",
				"\n* \xCDE5 \xEEF1\xEAEE\xF0E1\xEBFF\xE9F2\xE5 \xE4F0\xF3E3\xE8F5 \xE8E3\xF0EE\xEAEE\xE2. \xD0E0\xE7F0\xE5F8\xE5ED\xEE \xF8F3\xF2E8\xF2FC, \xEDEE \xE8F1\xEAEB\xFEF7\xE8F2\xE5EB\xFCED\xEE \xE2 \xE4F0\xF3E6\xE5F1\xEAEE\xEC \xEAEE\xEDF2\xE5EA\xF1F2\xE5. \xCDE8\xEAF2\xEE \xC2E0\xEC \xEDE5 \xE4EE\xE2E5\xF0E8\xF2F1\xFF, \xE5F1\xEBE8 \xE1F3\xE4E5\xF2E5 \xF0E0\xE7E1\xF0E0\xF1FB\xE2E0\xF2FC\xF1FF \xE6E5\xEBEE\xF7FC\xFE \xE1E5\xE7 \xEFF0\xE8F7\xE8ED.",
				"\n* \xD1F2\xEEFF\xF2FC \xE2 AFK - \xE2EE\xE5ED\xEDEE\xE5 \xEFF0\xE5F1\xF2F3\xEFEB\xE5ED\xE8E5. \xC5F1\xEBE8 \xE1F3\xE4E5\xF2E5 \xF1F2\xEEFF\xF2FC \xF1EB\xE8F8\xEAEE\xEC \xE4EE\xEBE3\xEE, \xEDE0 \xC2E0\xF1 \xF1E1\xF0EE\xF1FF\xF2F1\xFF \xE1EE\xECE1\xFB \xE8 \xF1EE\xF2F0\xF3F2 \xC2E0\xF1 \xE2 \xEFEE\xF0EE\xF8EE\xEA.",
				"\n* \xCDE5 \xECE5\xEDFF\xE9F2\xE5 \xEDE8\xEA \xE2EE \xE2F0\xE5EC\xFF \xF0E0\xF3ED\xE4E0, \xE1F3\xE4F3\xF7E8 \xECB8\xF0F2\xE2FB\xECE8. \xC8ED\xE0F7\xE5, \xC2E0\xF1 \xEAE8\xEAED\xE5F2 \xF1 \xF1E5\xF0E2\xE5F0\xE0. \xC2E0\xEC \xECEE\xE6ED\xEE \xE1F3\xE4E5\xF2 \xEFEE\xECE5\xEDFF\xF2FC \xE5E3\xEE, \xE1F3\xE4F3\xF7E8 \xE6E8\xE2FB\xEC. \xD2E0\xEAE6\xE5, \xECEE\xE6ED\xEE \xEFF0\xEEF1\xF2EE \xEFEE\xE4EE\xE6E4\xE0F2\xFC \xE4EE \xFDEA\xF0E0\xEDE0 \xF0E5\xE7F3\xEBFC\xF2E0\xF2EE\xE2, \xF7F2\xEEE1\xFB \xE1E5\xE7EE\xEFE0\xF1ED\xEE \xF1EC\xE5ED\xE8F2\xFC \xEDE8\xEA.",
				"\n\xCDE0\xF0F3\xF8E5\xEDE8\xE5 \xEEE4\xEDEE\xE3EE \xE8E7 \xFDF2\xE8F5 \xEFF0\xE0E2\xE8EB \xECEE\xE6E5\xF2 \xEAE0\xF0E0\xF2FC\xF1FF \xEAE8\xEAEE\xEC \xE8EB\xE8 \xE1E0\xEDEE\xEC \xEEF2 \xC0E4\xECE8\xEDE0! \xCFF0\xEEF1\xE8EC, \xEDE5 \xEDE0\xF0F3\xF8E0\xE9F2\xE5 \xE8F5 \xE8 \xE8E3\xF0E0\xE9F2\xE5 \xF7E5\xF1F2\xEDEE."
			},{
				"\23\xCFEE\xEBE5\xE7ED\xFBE5 \xF1EE\xE2E5\xF2FB\16\n",
				"\xCCFB \xF1EE\xE1F0\xE0EB\xE8 \xEDE5\xF1EA\xEEEB\xFCEA\xEE \xF1EE\xE2E5\xF2E8\xEAEE\xE2, \xEAEE\xF2EE\xF0FB\xE5 \xECEE\xE3F3\xF2 \xEFEE\xECEE\xF7FC \xC2E0\xEC \xEFF0\xE8 \xE8E3\xF0E5 \xE2 \xD2D3:",
				"\n* \xC5F1\xEBE8 \xF1EF\xEEF1\xEEE1\xEDEE\xF1F2\xE8 \xEFE5\xF0F1\xEEED\xE0E6\xE5E9 \xEEF2\xEAEB\xFEF7\xE5ED\xFB \xC0E4\xECE8\xEDEE\xEC, \xE7E0\xE6EC\xE8F2\xE5 \23SPIN\16, \xF7F2\xEEE1\xFB \xEDE0\xF7E0\xF2FC \xEAF0\xE0F1\xF2FC\xF1FF, \xEDE5 \xEEF1\xF2E0\xE2EB\xFFFF \xE7E0 \xF1EE\xE1EE\xE9 \xF1EB\xE5E4\xEEE2 \xE8 \xEDE5 \xF1EE\xE7E4\xE0E2\xE0FF \xF8F3\xECE0;",
				"\n* \xCAEE\xE3E4\xE0 \xC2FB \xEFEE\xE4E1\xB8F0\xE5F2\xE5 \20\xC8E7\xF3EC\xF0F3\xE4 \20\xD8E5\xF0E8\xF4E0\16, \xC2E0\xEC \xF1F2\xE0ED\xF3F2 \xE4EE\xF1F2\xF3EF\xEDFB \xE2F1\xE5 \xD0F3\xE6FC\xFF \xE8 \xEAEE\xEBFC\xF6E0, \xEAEE\xF2EE\xF0FB\xE5 \xC2FB \xEFEE\xE4EE\xE1F0\xE0EB\xE8 \xE4EE \xFDF2\xEEE3\xEE;",
				"\n* \xC2FB \xEFEE\xEBF3\xF7E0\xE5F2\xE5 3 \xF1E5\xEAF3\xEDE4\xFB \xE1E5\xF1F1\xECE5\xF0F2\xE8FF, \xE5F1\xEBE8 \xEFEE\xEFE0\xE4E0\xE5F2\xE5F1\xFC \xEDE0 \xF2E0\xEAE8\xE5 \xEFF0\xE5EF\xFFF2\xF1F2\xE2E8\xFF, \xEAE0\xEA \xEBE0\xE2E0, \xF8E8\xEFFB \xE8EB\xE8 \xEEE3\xEEED\xFC;",
				"\n* \xCFEE\xEFFB\xF2E0\xE9F2\xE5F1\xFC \xE3E4\xE5-\xEDE8\xE1F3\xE4FC \xF1EF\xF0FF\xF2E0\xF2FC\xF1FF. \xC8ED\xEEE3\xE4E0 \xFDF2\xEE \xEFEE\xECEE\xE3E0\xE5F2 \xE8E7\xE1E5\xE6E0\xF2FC \xEDE5\xEDF3\xE6ED\xEEE9 \xEFF3\xE1EB\xE8F7\xEDEE\xF1F2\xE8;",
				"\n* \xC5F1\xEBE8 \xC2E0\xF8E0 \xF0EE\xEBFC \xF0E0\xF1EA\xF0FB\xF2E0, \xC2FB \xECEE\xE6E5\xF2E5 \xEFEE\xECE5\xEDFF\xF2FC \xE8EC\xFF \xE8E3\xF0EE\xEAE0 \xE8/\xE8EB\xE8 \xEFEE\xECE5\xEDFF\xF2FC \xF6E2\xE5F2 \xF1E2\xEEE5\xE3EE \xEFE5\xF0F1\xEEED\xE0E6\xE0. \xD3F7\xF2E8\xF2E5, \xF7F2\xEE \18\xC2E0\xF8E5 \18\xEDEE\xE2EE\xE5 \18\xE8EC\xFF \18\xE1F3\xE4E5\xF2 \18\xE2E8\xE4ED\xEE \18\xE2 \18\xF7E0\xF2E5\16;",
				"\n* \xCDEE\xE6 \xEDE5 \xE1F3\xE4E5\xF2 \xE8E7\xE4E0\xE2E0\xF2FC \xE7E2\xF3EA\xE0 \xE0F2\xE0EA\xE8, \xE5F1\xEBE8 \xC2FB \xEAF0\xE0E4\xB8F2\xE5F1\xFC. \xD2E0\xEAE6\xE5, \xEAED\xEEEF\xEAE0 \23FIRENORMAL\16 \xEFEE\xE7E2\xEEEB\xFFE5\xF2 \xE2E5\xE7E4\xE5 \xE8F1\xEFEE\xEBFC\xE7EE\xE2E0\xF2FC \xCDEE\xE6, \xEFEE\xEAE0 \xC2E0\xF8E8 \xEAEE\xEBFC\xF6E0 \xEDE5 \xE7E0\xEAEE\xEDF7\xE0F2\xF1FF (\xD3 \19\xCDE5\xE2E8\xEDED\xFBF5\16 \xEDE5\xF2 \xEDEE\xE6E0)"
			}
		},["MMLANG"]={
			"Seychas u Vas stoit\x82 russkiy\x80 yazyk.\nVy mozhete smenit' yazyk, propisav v konsol' \x87MMLANG [yazyk]",
			"Vash personalniy yazyk etogo moda izmenyon na\x82 russkiy"
		},["ROLE_GET"]={
			"Vy \x85Ubiytsa\x80! \x85Ubeyte vseh!",
			"Vy \x84Sherif\x80!\x84 Ustranite vseh Ubiyts\x80. Esli Vy ubyote nevinnogo, s Vas snimut etu rol'.",
			"Vy \x83Nevinniy\x80! Priachtes' i pomogayte v rassledovanii."
		},["NEWROLE_GET"]={
			"\x87Sud'ba darovala tebe rol' \x85Ubiytsy\x87.\x85 Teper' idi, ubivay!",
			"\x87Tebe dana rol' \x84Sherifa\x87! Vperyod, \x84 ustrani ubiyts\x87, poka ne pozdno!",
			"\x87Ty byl(-a) izbran(-a) \x82Geroem\x87. Spasi zhe Nevinnyh ot Ubiyts!",
			"\x87Ty ustranil(-a) odnogo iz \x85Ubiyts\x87! Tebia povysili do \x82Geroya\x87!"
		},["TEAMMATE_HIT"]={
			"Eto Vash naparnik. Bolshe ne streliayte po svoim.",
			"Vas udaril Vash naparnik. Dazhe ne dumayte emu mstit'."
		},["MURD_KILLED"]={
			"\x85Ubiytsa\x87",
			"\x80ustranyon"
		},["SHERI_KILLED"]={
			"\x84Sherif\x87",
			"\x80".."byl ubit!",
			"Naydite yego(yo)\x84 Izumrud\x80!"
		},["HERO_KILLED"]={
			"\x82Geroy\x87",
			"\x80".."byl ubit!"
		},["DIED_HAZARD"]="popal(a), kuda ne sledovalo",
		["SHREML_PICK"]="Kto-to podobral \x84Izumrud Sherifa\x80...",
		["KILL_PUNISHMENT_PM"]={
			"\x87Ty ubil(a) \x83Nevinnogo\x87! Ty bolshe ne Sherif!",
			"\x82Geroi\x87 ne sozdany, chtob ubivat' \x83Nevinnyh\x87. Za eto budet otvetnaya smert'.",
			"\x87O net! Ty ubil(-a) \x84Sherifa\x87! Za eto budet otvetnaya smert'.",
			"\x87Ty ubil(-a) takogo zhe \x83Nevinnogo\x87 cheloveka kak i ty! Za eto budet otvetnaya smert'.",
			"\x87O net! Ty ubil(-a) \x82Geroya\x87! Za eto budet otvetnaya smert'."
		},["INNO_HURT"]={
			"\x84Sherif\x80 ubil \x83Nevinnogo\x80! Nado poruchit' delo komu-to drugomu!",
			"\x82Geroy\x80 zhostko tupanul i ubil \x83Nevinnogo\x80. I shas oni oba lezhat dohlye. Vot zhe\x82 Debil\x80"
		},["ONE_LEFT"]={
			"Odin iz \x85Ubiyts\x80 pokinul igru!",
			"Odin iz \x84Sherifov\x80 vyshel!!!",
			"Odin iz \x82Geroev\x80 predal nas (pokinul igru)!"
		},["LAST_LEFT"]={
			"Posledniy iz \x85Ubiyts\x80 pokinul igru!",
			"Posledniy iz \x84Sherifov\x80 pokinul igru!",
			"Posledniy iz \x82Geroev\x80 pokinul igru!"
		},["REPLACE_LEFT"]={
			"\x85Ubiytsa\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Nevinniy\x80!",
			"\x84Sherif\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Nevinniy\x80!",
			"\x82Geroy\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Nevinniy\x80!"
		},["ENDROUND"]={
			"Vse mertvy. \x85Ubiytsy\x80 pobedili!",
			"Vse \x85Ubiytsy\x80 ustraneny! \x83Nevinnye\x80 pobedili!",
			"\x85Ubiytsy\x80 pobedili, potomu chto \x84Sherif\x80 ubil poslednego Nevinnogo! Pozor \x84Sherifu\x80",
			"\x82Geroy\x80 ubil poslednego Nevinnogo. \x85Ubiytsy\x80 pobedili!",
			"Zashitniki \x83Nevinnyh\x80 ubity. \x85Ubiytsy\x80 pobedili!"
		},["BMP_VICTIMS"]={
			"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF",
			"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1FII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1F1FII\x1F",
			"\xFF1FIIIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"\xFFFF\x1FIIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
			"\xFFFFIIII\x1FFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFIIIII\x1FFF",
			"\xFFIIIIII\x1FFF\xFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1F1FII\x1F",
			"II\x1FII\x1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIIII\x1F",
			"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
			"\x1F1F\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F"
		},["BMP_SUSPECTS"]={
			"\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIII\xFFFFIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFFIIIII\x1FFFII\x1FFF\xFFFFIIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFFIIIIII\x1FII\x1FFF\xFFFFIIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\x1FII\x1FFF\xFFIIIIII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1FII\x1FFFIII\x1F1FIII\x1F",
			"II\x1FFFII\x1FFFIIIIII\x1FFFIIIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FII\x1FFFII\x1FFF\xFF1FII\x1F",
			"II\x1FFFII\x1FFF\x1FIIII\x1FFF\xFFII\x1F1F\x1F1FII\x1FFF\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIII\x1F1FII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F",
		},["BMP_TIME"]={
			"\xFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIII\x1F",
			"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
			"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFFII\x1F",
			"\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFF\xFFIIIII\x1F",
			"IIIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFF\xFFIIIII\x1F",
			"II\x1F1FII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\x1F",
			"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1F",
			"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F",
			"IIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F",
			"\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F",
		},["BMP_RINGS"]={
			"\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIII\x1F",
			"\xFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFIIIII\x1F1F\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
			"IIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
			"II\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFFIIIIII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFF\x1FIIII\x1F1F\xFFII\x1F1F\xFFII\x1FFFIIIII\x1F1F\xFFIIIIIII\x1FFFII\x1FFFII\x1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1FII\x1FFF\x1F1F\x1FFF\x1F1F\x1F",
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F\x1F\x1F"
		},["HUD_ROLES"]={
			"\xD3C1\xC8C9\xD6C0", --UBIJCA
			"\xD8C5\xD0C8\xD4", --SHERIF
			"\xCDC5\xC2C8\xCDCD\xDBC9", --NIEWINNYJ
			"\xC3C5\xD0CE\xC9", --GEROJ
			"\xCCC5\xD0D2\xC2C5\xD6" --MERTWEC
		},["HUD_TEAMMATES"]="\xCDE0\xEFE0\xF0ED\xE8EA\xE8", --Naparniki
		["HUD_KILLBY"]="\xD3E1\xE8F2\xFB", --Ubity
		["HUD_STUPID"]="\xE2E0\xF8E5\xE9 \xF2F3\xEFEE\xF1F2\xFCFE", --washej tupostiu
		["HUD_SCORESTAB"]={
			"\xC5F1\xEBE8 \xC2FB \xEDEE\xE2E8\xF7B8\xEA \xE2 \xFDF2\xEEEC \xF0E5\xE6E8\xECE5, \xEFF0\xEEEF\xE8F8\xE8F2\xE5",
			"\xE2 \xEAEE\xEDF1\xEEEB\xE8 \xEAEE\xECE0\xEDE4\xF3 \23MMHELP\16 \xE4EB\xFF",
			"\xEEE7\xEDE0\xEAEE\xECEB\xE5ED\xE8FF \xE8 \23MMLANG\16 \xE4EB\xFF \xF1EC\xE5ED\xFB",
			"\xFFE7\xFBEA\xE0 \xECEE\xE4E0",
			"",
			"",
			"\18\xD3E4\xE0F7\xEDEE\xE9 \xC2E0\xEC \xE8E3\xF0FB! ;)"
		},["HUD_ROLESALIVE"]={
			"\xD3E1\xE8E9\xF6", --Ubijc
			"\xD8E5\xF0E8\xF4EE\xE2", --Sherifow
			"\xCDE5\xE2E8\xEDED\xFBF5" --Niewinnych
		},["HUD_DEAD"]={
			"\xC2FB \31\xECE5\xF0F2\xE2FB", --Wy mertwy
			"\xC2FB \xEDE5 \xECEE\xE6E5\xF2E5 \xE2EE\xE7F0\xEEE6\xE4E0\xF2F1\xFF \xE8 \xEFE8\xF1E0\xF2FC \xF2E5\xEC,",
			"\xEAF2\xEE \xE5F9\xE5 \xE6E8\xE2"
		},["HUD_MIDJOIN"]={
			"\xC2FB \xEFF0\xE8F1\xEEE5\xE4E8\xEDE8\xEBE8\xF1FC \xEDE0 \xF1E5\xF0E5\xE4E8\xEDE5 \xF0E0\xF3ED\xE4E0. \xCFEE\xE6E0\xEBF3\xE9F1\xF2E0, \20\xEFEE\xE4EE\xE6E4\xE8F2\xE5 \xE4EE \xE5E3\xEE \xEEEA\xEEED\xF7E0\xEDE8\xFF\16.",
			"\xCFEE\xEAE0 \xC2FB \xE6E4\xB8F2\xE5, \xEFEE\xE6E0\xEBF3\xE9F1\xF2E0, \xEFF0\xEEF7\xF2E8\xF2E5 \xEFF0\xE0E2\xE8EB\xE0 \xE8E3\xF0FB, \xE2E2\xE5E4\xFF \xE2 \xEAEE\xEDF1\xEEEB\xFC \xEAEE\xECE0\xEDE4\xF3 \23MMHELP\16"
		},["HUD_ALONE"]={
			"\xC4EB\xFF \xEDE0\xF7E0\xEBE0 \xE8E3\xF0FB \xF2F0\xE5E1\xF3E5\xF2F1\xFF \xECE8\xEDE8\xECF3\xEC\20 2 \xE8E3\xF0EE\xEAE0\16.",
			"\xCFEE\xE6E0\xEBF3\xE9F1\xF2E0, \xEFEE\xE4EE\xE6E4\xE8F2\xE5 \20\xE5F9\xB8 \xEEE4\xEDEE\xE3EE \xE8E3\xF0EE\xEAE0\16."
		},["HUD_SNEAKING"]="\xCFEE\xE4EA\xF0E0\xE4FB\xE2E0\xEDE8\xE5...",
		["HUD_SHOWDOWN"]="\xCFEE\xE5E4\xE8ED\xEEEA \xF1F3\xE4FC\xE1FB!",
		["HUD_MINIGAME"]={
			["PRESS"]="\xCDE0\xE6EC\xE8F2\xE5 \18CUSTOM3\16, \xF7F2\xEEE1\xFB",
			["LEAVE"]="\xE2FB\xE9F2\xE8",
			["CANCEL"]="\xEEF2\xECE5\xEDE8\xF2FC",
			["SPECTATE"]="\xEDE0\xE1EB\xFEE4\xE0F2\xFCE7\xE0",
			["DUEL"]="\xE4F3\xFDEB\xFCFE \xE2 \xECE8\xEDE8\xE8E3\xF0E5",
			["REQUEST"]="\xD1FB\xE3F0\xE0F2\xFC \xE2 \23PONG\16",
			["START"]="\xE7E0\xEFF3\xF1F2\xE8F2\xFC \xECE8\xEDE8 \xE8E3\xF0F3 \23SONIC RUN",
			["ACCEPT"]="\xEFF0\xE8ED\xFFF2\xFC \xE2FB\xE7EE\xE2 \xE2 \23PONG\16!",
			["WAIT"]="\xCEE6\xE8E4\xE0ED\xE8E5 \xEEF2\xE2E5\xF2E0 \xEEEF\xEEED\xE5ED\xF2E0...",
			["SPECTATING"]="\xCDE0\xE1EB\xFEE4\xE5ED\xE8E5 \xE7E0 \xE4F3\xFDEB\xFCFE...",
			["BORED"]="\xD1EA\xF3F7\xEDEE?",
			["PONGBALL"]="\xCDE0\xE1EB\xFEE4\xE0F2\xE5EB\xE8 \xECEE\xE3F3\xF2 \xECE5\xEDFF\xF2FC \xEDE0\xEFF0\xE0E2\xEBE5\xEDE8\xE5 \xECFF\xF7E0",
		},["HUD_YOU"]="\xC2DB",
		["HUD_WINNERS"]="\xCFEE\xE1E5\xE4E8\xF2E5\xEBE8:",
		["HUD_WON"]="\xEFEE\xE1E5\xE4E8\xEB!",
		["HUD_WIN"]={
			"\xCDC8\xD7DC\xDF!",
			"\21\xECE8\xF0ED\xFBE5",
			"\19\xD6DB\xC2C8\xCBDC\xCDDB\xC5"
		},["HUD_PAST"]="\xCFD0\xCED8\xCBCE\xC5",
		["HUD_FUTURE"]="\xC1D3\xC4D3\xD9C5\xC5"
	},["TR"]={ --Turkish by Mobillia
		["VERSION"]="1.0-ALPHA", 
		["AUTHOR"]="Mobillia", 
		["MM"]="Murder Mystery", 
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			"Kayd\xFDrmak \xFDE7\xFDn \23JUMP\16/\23SPIN\16 kullan\xFDn, sayfalar aras\xFD ge\xE7i\xFE yapmak \xFDE7\xFDn \23Next\16/\23Prev Weapon\16 kullan\xFDn",
			"HELP'den ayr\xFDlmak i\xE7in \23FIRE\16'a bas\xFDn"
		},["MMHELP"]={
			{
				"\23Murder Mystery'e ho\xFEgeldiniz!",
				"\23Pop\xFCler \23\xE7ok oyunculu oyunun \23SRB2 yorumu!\16\n",
				"Oyunun amac\xFD, di\xF0".."er herkesi\16 \xF6ld\xFCrmeden\19 \xF6nce t\xFCm \21Katiller\16'i bulup ortadan kald\xFDrmakt\xFDr. Bu oyun t\xFCr\xFC daha \xE7ok MATCH'a benzer, bu nedenle bu oyun t\xFCr\xFC i\xE7in ni\xFE".."an alma ve at\xFDFE becerilerinize ihtiyac\xFDn\xFDz olacak.",
				"Oynamaya ba\xFElamadan \xF6nce baz\xFD temel bilgileri \xF6F0renmeniz gerekiyor...",
				"\nHer t\xFCr\xFC".."n ba\xFE".."\xFD".."nda, oyun s\xFD".."ras\xFD".."ndaki g\xF6revinizin ne oldu\xF0".."unu tan\xFD".."mlayan bir \26Rol\16 alacaks\xFD".."n\xFD".."z. \xDD".."\xFE".."te alabilece\xF0".."iniz 3 olas\xFD \26Roller\16:",
				" * \21Katil\16 - Ger\xE7".."ek bir su\xE7".."ludur. Herkesi \xF6".."ld\xFC".."rmek zorundalar, ancak sadece B\xFD".."\xE7".."ak ve K\xFD".."rmizi Y\xFC".."z\xFC".."klerle donat\xFD".."lm\xFD".."\xFE".."lard\xFD".."r;",
				" * \20\xDE".."erif\16  - G\xF6".."revleri, \21Katil(ler)\16'i bulmak ve ortadan kald\xFD".."rmakt\xFD".."r. \xDE".."erifler haritada bulunan her silah y\xFC".."z\xFC".."klerini kullanabilir;",
				" * \19Masum\16 - Tamamen silahs\xFD".."z siviller, \xF6".."ld\xFC".."r\xFC".."lmekten ka\xE7".."\xFD".."nmalar\xFD".." gerekir ama ayn\xFD".." zamanda \21Katil\16'i bulmaya da yard\xFD".."mc\xFD".." olmalar\xFD".." gerekir.",
				"\nOynamaya ba\xFE".."lamak i\xE7".."in gereken t\xFC".."m temel bilgiler budur, daha fazla bilgi i\xE7in bu k\xFDlavuzu sonuna kadar okuyun"
			},{
				"\23Oynan\xFDFE durumlar\xFD hakk\xFD".."nda\16\n",
				"Temel bilgilerde daha \xF6".."nce a\xE7".."\xFD".."kland\xFD".."\xF0".."\xFD".." gibi, \xDE".."eriflerin amac\xFD".." t\xFC".."m \21Katil(ler)\16'i ortadan kald\xFD".."rmakt\xFD".."r, ancak farkl\xFD".." oyun durumlar\xFD".." ortaya \xE7".."\xFD".."kabilir:",
				"\n* E\xF0".."er \xD6".."ld\xFC".."r\xFC".."l\xFC".."rseniz,\31 \xD6".."l\xFC".."\16 durumuna girersiniz. Bu durumdaki oyuncular yeniden do\xF0".."amaz veya hala hayatta olan oyuncularla k\xFC".."resel olarak konu\xFE".."amaz, mesajlar\xFD".." yaln\xFD".."zca di\xF0".."er\31 \xF6".."l\xFC".."\16 oyuncular taraf\xFD".."ndan g\xF6".."r\xFC".."lebilir.",
				"\31 \xD6".."l\xFC".."\16 iken hala hayatta olan oyuncularla konu\xFE".."amazs\xFD".."n ve /PM yapamazs\xFD".."n (\"sayto\" komutu ile).",
				"Ayr\xFD".."ca\18 \2KEND\xDD".."N\xDD".."Z\xDD".." \2YEN\xDD".."DEN \2ADLANDIRMAYA \2\xC7".."ALI\xDE".."MAYIN\16, bununla ilgili daha fazla ayr\xFD".."nt\xFD".." di\xF0".."er sayfada.",
				"\n* \20\xDE".."erif'in \16 g\xF6".."revi, etraftaki t\xFC".."m \21Katiller\16'i ortadan kald\xFD".."rmakt\xFD".."r, ancak kazara bir \19Masum\16'u vurmalar\xFD".." m\xFC".."mk\xFC".."nd\xFC".."r.",
				"E\xF0".."er bu ger\xE7".."ekle\xFE".."irse, \20\xDE".."erif\16 bir \19Masum\16'a d\xF6".."n\xFC".."\xFE".."ecek ve rastgele bir \19Masum\16 sinsice rol\xFC".."n\xFC".." \xFC".."stlenecektir. Bir dahaki sefere birini \20\xDE".."erif\16 olarak vurmak istedi\xF0".."inizde, o teti\xF0".."i \xE7".."ekmeden \xF6".."nce iki kez d\xFC".."\xFE".."\xFC".."n\xFC".."n!",
				"\n* Bir \21Katil\16, bir \20\xDE".."erif\16'i \xF6".."ld\xFC".."r\xFC".."rse ve hala \19Masum\16 hayatta kal\xFD".."rsa, \xDE".."erif \20\xDE".."erif'in Z\xFC".."mr\xFC".."t\xFC".."\16'n\xFC cesedinin yan\xFD".."na b\xFD".."rakacakt\xFD".."r.",
				"7 Kaos Z\xFC".."mr\xFC".."t\xFC".."'nun aksine, bu z\xFC".."mr\xFC".."t \18Kahraman\16 rol\xFC".."n\xFC".." onu alan herhangi bir \19Masum\16'a atayacak. \19Masumlar\16'dan biriyseniz, bu bir Kahraman olma ve herkesi \21Katil(ler)\16'den kurtarma \xFE".."ans\xFD".."n\xFD".."z!",
				"\18Kahraman\16 rol\xFC"..", \20\xDE".."erif\16'den baz\xFD".." detaylar d\xFD".."\xFE".."\xFD".."nda farkl\xFD".." de\xF0".."ildir, \xF6".."rne\xF0".."in \18Kahraman\16 bir \19Masum\16'u \xF6".."ld\xFC".."rd\xFC".."\xF0".."\xFC".."nde, rol\xFC".." payla\xFE".."\xFD".."lmaz ve her ikisi de \xF6".."l\xFC".."r. Bir Kahraman \xF6".."l\xFC".."m\xFC".."nde \20\xDE".."erif'in Z\xFC".."mr\xFC".."t\xFC".."\16 d\xFC".."\xFE".."meyecektir.",
				"\n* Oyuncu say\xFD".."s\xFD".."na ba\xF0".."l\xFD".." olarak, turdaki oyuncular aras\xFD".."nda birden fazla \21Katil\16 ve \20\xFE".."erif\16 olabilir. \xD6".."rne\xF0".."in, 7 ve daha fazla oyuncudan ba\xFE".."layarak, \21Katiller\19 ve \20\xDE".."erifler\16'den \26Tak\xFD".."mlar\16 olu\xFE".."turulacakt\xFD".."r.",
				"\26Tak\xFD".."m arkada\xFE".."lar\xFD\16, \23SAYTEAM\16 konsol komutuyla tak\xFD".."m sohbetlerinde birbirleriyle sohbet edebilir (SAYTEAM sohbet d\xFC".."\xF0".."mesinin normal sohbetle ayn\xFD".." \xFE".."ekilde \xE7".."al\xFD".."\xFE".."aca\xF0".."\xFD".."n\xFD".." unutmay\xFD".."n).",
				"E\xF0".."er bir \26Tak\xFD".."m arkada\xFE".."\xFD".."\16 ba\xFE".."ka bir tak\xFD".."m arkada\xFE".."\xFD".."na vurursa, her ikisi de birbirlerini tan\xFD".."malar\xFD".."n\xFD".." sa\xF0".."layacak ki\xFE".."iselle\xFE".."tirilmi\xFE".." bir uyar\xFD".." al\xFD".."r. Ba\xFE".."kalar\xFD".."n\xFD".."n 'arkada\xFE".."\xE7".."a' etkile\xFE".."iminizi g\xF6".."rebilece\xF0".."ini ve kim oldu\xF0".."unuzu anlayabilece\xF0".."ini unutmay\xFD".."n!"
			},{
				"Murder \23Mystery\16'de yap\xFD".."lmas\xFD k\xF6".."t\xFC".." olan \23\xFE".."eyler\16\n",
				"Herhangi bir oyunun 1 numaral\xFD".." kural\xFD"..": \1Nazik \1olun \1ve \1e\xF0".."lenin!\16 Bunun d\xFD".."\xFE".."\xFD".."nda...",
				"\n* \26Rol\16'\xFC".."n kendini \xFE".."\xFD".."martmas\xFD oyunu bir 'gizem' yapmaz, e\xF0".."er eminseniz ba\xFE".."kas\xFD".."n\xFD".."n rol\xFC".."n\xFC".." s\xF6".."yleyebilirsiniz, ancak kendinizinkini asla s\xF6".."ylemeyin.",
				"\n* Di\xF0".."er oyunculara hakaret etmeyin, \xFE".."akalara izin verilir, ancak yaln\xFD".."zca arkada\xFE".."\xE7".."a bir ruh hali i\xE7".."inde. Her oyuncuyu sebepsiz yere su\xE7".."larsan\xFD".."z kimse size g\xFC".."venmez.",
				"\n* AFK olmak bir sava\xFE".." su\xE7".."udur. Bombalar at\xFD".."lacak ve \xE7".."ok uzun s\xFC".."re hareketsiz kal\xFD".."rsan\xFD".."z varl\xFD".."\xF0".."\xFD".."n\xFD".."z sona erecektir.",
				"\n* \xD6".."l\xFC".."yken bir tur s\xFD".."ras\xFD".."nda kendinizi yeniden adland\xFD".."rmay\xFD".."n, bunu yapmak sizi sunucudan atacakt\xFD".."r. Hayattaysan\xFD".."z yeniden adland\xFD".."rabilirsiniz. Aran\xFD".."n g\xFC".."venli bir \xFE".."ekilde yeniden adland\xFD".."r\xFD".."lmas\xFD".."n\xFD".." bekleyin.",
				"\nBu kurallardan birini ihlal etmek, oyundan at\xFD".."lma veya baz\xFD".." durumlarda Y\xF6".."netici taraf\xFD".."ndan yasaklanma ile sonu\xE7".."lanabilir! L\xFC".."tfen onlar\xFD".." k\xFD".."rmay\xFD".."n ve adil oynay\xFD".."n."
			},{
				"\23Faydal\xFD ipu\xE7lar\xFD\16\n",
				"MM'deki oyununuz s\xFDras\xFDnda size yard\xFDmc\xFD olabilecek baz\xFD ipu\xE7lar\xFD toplad\xFDk:",
				"\n* Karakter yetenekleri y\xF6netici taraf\xFDndan devre d\xFDFE\xFD b\xFDrak\xFDl\xFDrsa, iz birakmadan veya g\xFCr\xFClt\xFC yapmadan gizlice dola\xFEmak i\xE7in \23SPIN\16 tu\xFEuna ba\xFEFDn;",
				"\n* \20\xDE".."erif'in \20Z\xFCmr\xFCt\xFC\16'n\xFC ald\xFDF0\xFDn\xFDzda, \xF6nceden toplad\xFDF0\xFDn\xFDz t\xFCm silahlara ve y\xFCz\xFCklere eri\xFE".."ebileceksiniz;",
				"\n* \23SAYTEAM\16 komutunu kullanarak \26tak\xFDm arkada\xFEFD\16'\xFDn\xFDz\xFDn kim oldu\xF0unu bulmak, onlar\xFD vurmaktan ka\xE7FDnman\xFDz\xFD ve yanl\xFDFEl\xFDkla rol\xFCn\xFCz\xFC ortaya \xE7FDkarman\xFDz\xFD sa\xF0layaca\xF0FD i\xE7in yard\xFDmc\xFD olacakt\xFDr;",
				"\n* 3 saniyeli\xF0ine \xF6l\xFCms\xFCzl\xFCk kazanmak i\xE7in lav, dikenler ve ate\xFE gibi engellerden zarar alabilirsiniz;",
				"\n* Haritada saklanacak bir yer aramaya \xE7".."al\xFDFE\xFDn. Bazen istenmeyen tan\xFDt\xFDmlardan kurtulmaya yard\xFDmc\xFD olur;",
				"\n* Rol\xFCn\xFCz s\xFDzd\xFDr\xFDl\xFDrsa, kendinizi yeniden adland\xFDrabilir ve/veya ten rengini de\xF0i\xFEtirebilirsiniz. \1Yeniden \1adland\xFDrman\xFDz\xFDn \1sohbette \1g\xF6sterilece\xF0ini \1unutmay\xFDn\0;",
				"\n* Gizlice girerseniz b\xFDE7".."ak sald\xFDr\xFD sesi \xE7FDkarmaz. Ayr\xFD".."ca,\18 FIRENORMAL\16 tu\xFEu, y\xFCz\xFCkleriniz oldu\xF0u s\xFCrece B\xFDE7".."a\xF0FD her yerde kullanman\xFDza izin verir (Masumlar\xFDn b\xFDE7".."a\xF0FD yoktur)"
			}
		},["MMLANG"]={ -- Bundan sonra harfler Türkçe olarak çıkmıyor, Hüdapar çeviri diyeni gotten
			"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola \x87MMLANG [dil] \x80komutunu yazarak degistirebilirsiniz", -- cCc
			"Murder Mystery icin kisisel dil \x82Turkce\x80 olarak ayarlanmistir" -- cCc
		},["ROLE_GET"]={
			"Sen \x85Katil\x80'sin! \x85Herkesi oldur!", 
			"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.", 
			"Sen bir \x83Masum\x80'sun! Saklan ve sorusturmaya yardim et." 
		},["NEWROLE_GET"]={
			"\x87Hayat rastgele karar verdi \x85Katil\x87.\x85 Simdi git herkesi oldur!",
			"Evren\x87 seni bir \x84Serif\x87 yapti! Git ve\x84 tum Katilleri\x87 ortadan kaldir!", 
			"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!",
			"\x87\x85Katillerden\x87 birini ortadan kaldirdiniz! \x82Kahramanliga\x87 terfi edildin!"
		},["TEAMMATE_HIT"]={
			"Bu oyuncu senin takim arkadasin. Lutfen bir dahaki sefere takim arkadaslariniza vurmayin.",
			"Bir takim arkadasiniz size vurdu. Ondan intikam almayi planlamayin."
		},["MURD_KILLED"]={
			"\x85Katil\x87",
			"\x80olduruldu"
		},["SHERI_KILLED"]={
			"\x84Serif\x87",
			"\x80olduruldu!",
			"Onun\x84 Zumrut\x80'unu bulun!"
		},["HERO_KILLED"]={
			"\x82Kahraman\x87",
			"\x80olduruldu!" 
		},["DIED_HAZARD"]="bir kazada oldu",
		["SHREML_PICK"]="Birisi \x84Serif'in Zumrutu\x80'nu aldi...",
		["KILL_PUNISHMENT_PM"]={
			"Bir\x87 \x83Masum\x87'u oldurdun! Kovuldun. (Artik bir Serif degilsin)",
			"\x82Kahramanlar\x87, \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin idam cezasi aldiniz.",
			"\x87Oh hayir! Bir \x84Serif\x87'i oldurdun!!! Bunun icin olum cezasi aldin",
			"\x87Senin gibi \x83Masum\x87 bir oyuncuyu oldurdun! Bunun icin olum cezasi aldin",
			"\x87Oh hayir! Bir \x82Kahraman\x87'i oldurdun! Bunun icin olum cezasi aldin"
		},["INNO_HURT"]={
			"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
			"\x82Kahraman\x87, Masum'u oldurerek kotu adam olmaya karar verdi. Şimdi ikisi de olu yatiyor. Boyle bir kahramana yaziklar olsun"
		},["ONE_LEFT"]={
			"\x85Katillerden\x80 biri kaldi!",
			"\x84Seriflerden\x80 biri kaldi!!!",
			"\x82Kahramanlardan\x80 biri bizi terk etti!"
		},["LAST_LEFT"]={
			"Son bir \x85Katil\x80 kaldi!",
			"Son bir \x84Serif\x80 kaldi!",
			"Son bir \x82Kahraman\x80 kaldi!"
		},["REPLACE_LEFT"]={
			"\x85Katil\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"\x84Serif\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"Bir \x82Kahraman\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!"
		},["ENDROUND"]={
			"Herkes oldu. \x85Katiller\x80 kazandi!",
			"Tum \x85Katiller\x80 olduruldu! \x83 Masumlar\x80 kazandi!",
			"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84Serif\x80'e yaziklar olsun",
			"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
			"\x83Masumlarin savunuculari\x80 oldu. \x85Katiller\x80 kazandi!"
		},["BMP_VICTIMS"]={
					"\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1FFF\xFFIIIII\x1F",
					"\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
					"\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
					"\xFFIIII\xFFIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F\x1F\xFFII\x1F\xFFII\x1F\xFFIIII\xFFIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
					"\xFFIIIIIIIII\x1F\xFFIIIIII\x1F\xFF\x1FIII\x1F\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIII\x1F",
					"IIIIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\x1FIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIII\x1F",
					"II\x1FIII\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1FIII\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
					"II\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
					"II\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
					"II\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\x1FIIII\x1F\x1F\xFF\x1FIIII\x1F\x1F\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
					"\x1F1F\x1FFF\xFFFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F"
			},["BMP_SUSPECTS_INFO"]={yoff=2},
			["BMP_SUSPECTS"]={
					"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1F",
					"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F",
					"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
					"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
					"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
					"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFF1FIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1F1F\x1FIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFFFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
					"II\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
					"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
					"\x1FIIII\x1FFF\xFF1FIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
					"\xFF1F\x1FI\x1FFF\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F",
					"\xFFFF\xFF1F"
			},["BMP_TIME"]={
					"\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F",
					"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
					"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFFII\x1F\x1F\x1F",
					"\xFFIII\x1F\x1F\x1F\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
					"\xFF\x1FIII\x1F\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F",
					"\xFF\x1FIII\x1F\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F",
					"\xFF\xFF\x1FIII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFFII\x1F",
					"II\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
					"IIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
					"\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1F",
					"\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F"
			},["BMP_RINGS_INFO"]={yoff=2},
			["BMP_RINGS"]={
					"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1F",
					"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F",
					"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
					"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
					"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
					"\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFF1FIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
					"\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
					"\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
					"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
					"IIIII\x1F1F\xFF1FIIII\x1F1F\xFFIIIIII\x1FFF\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
					"\x1F1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F"
		},["HUD_ROLES"]={
			"KAT\xDDL",
			"\xDE".."ER\xDD".."F",
			"MASUM",
			"KAHRAMAN",
			"\xD6L\xDC"
		},["HUD_TEAMMATES"]="Tak\xFDm arkada\xFElar\xFD",
		["HUD_KILLBY"]="\xD6lmenin sebebi:",
		["HUD_STUPID"]="senin aptall\xFDF0\xFDn",
		["HUD_SCORESTAB"]={
			"Oyun t\xFCr\xFCnde yeniyseniz konsola",
			"\23MMHELP\16 yaz\xFDn.",
			"Buradaki dili de\xF0i\xFEtirmek i\xE7in",
			"\23MMLANG\16 komutunu kullan\xFDn",
			"",
			"",
			"\2\xDDyi e\xF0lenceler!"
		},["HUD_ROLESALIVE"]={
			"Katiller",
			"\xDE".."erifler",
			"Masumlar"
		},["HUD_DEAD"]={
			"\31\xD6ld\xFCn",
			"Yeninden do\xF0".."amaz veya",
			"\xF6lmemi\xFE insanlar ile konu\xFE".."amazs\xFDn"
		},["HUD_MIDJOIN"]={
			"\20Tur ortas\xFDnda\16 kat\xFDld\xFDn\xFDz, l\xFCtfen bu turun bitmesini bekleyin.",
			"Beklerken l\xFCtfen \23MMHELP\16 konsol komutundaki oyun kurallar\xFDn\xFD okuyunuz."
		},["HUD_ALONE"]={
			"Oyunun ba\xFElamas\xFD i\xE7in en az \20".."2 oyuncu\16",
			"gereklidir, L\xFCtfen \20bir oyuncunun\16 daha",
			"gelmesini bekleyin"
		},["HUD_SNEAKING"]="Sinsice...",
		["HUD_SHOWDOWN"]="Hesapla\xFEma d\xFC".."ellosu!",
		["HUD_MINIGAME"]={
			["PRESS"]="\18 CUSTOM3\16'e bas ve",
			["LEAVE"]="ayr\xFDl",
			["CANCEL"]="iptal",
			["SPECTATE"]="seyret",
			["DUEL"]="bir mini oyun d\xFC".."ellosu",
			["REQUEST"]="bir \23PONG\16 oyunu talep edin",
			["START"]="bir \23\"SONIC RUN\"\16 oyunu ba\xFElat",
			["ACCEPT"]="\23PONG\16 meydan okumas\xFDn\xFD kabul et!",
			["WAIT"]="Rakibin kabul etmesi bekleniyor...",
			["SPECTATING"]="Bir d\xFC".."ello izleniyor...",
			["BORED"]="S\xFDkl\xFDnd\xFDn m\xFD?",
			["PONGBALL"]="Seyirciler topun y\xF6n\xFCn\xFC de\xF0i\xFEtirebilir"
		},["HUD_YOU"]="SEN",
		["HUD_WINNERS"]="Kazananlar:",
		["HUD_WON"]="kazand\xFD!",
		["HUD_WIN"]={
			"BERABERE!",
			"\21KAT\xDDLLER",
			"\19MASUMLAR"
		},["HUD_PAST"]="GE\xC7M\xDD\xDE",
		["HUD_FUTURE"]="GELECEK"
	},["UA"]={ -- Ukrainian by LeonardoTheMutant
		--text made entirely from HEX characters is harder to maintain than you think, especially when you come back to edit it
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="LeonardoTheMutant",
		["CHARSET"]="1251C",
		["NONASCII"]=true, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
		["MM"]="\xD2E0\xBAEC\xEDE8\xF6FF \xC2E1\xE8E2\xF1F2\xE2E0", --Tajemnycia Wbywstwa
		["MMHELP_CMD"]={
			"\xCDE0\xF2E8\xF1ED\xB3F2\xFC \23JUMP\16/\23SPIN\16 \xE4EB\xFF \xEFF0\xEEEA\xF0F3\xF7F3\xE2E0\xEDED\xFF, \23Next\16/\23Prev Weapon\16 \xE4EB\xFF \xE7EC\xB3ED\xE8 \xF1F2\xEEF0\xB3ED\xEAE8",
			"\23FIRE\16 - \xEFEE\xEAE8\xEDF3\xF2E8 \xF6E5 \xECE5\xEDFE"
		},["MMHELP"]={
			{
				"\23\xCBE0\xF1EA\xEEE2\xE0 \xEFF0\xEEF1\xE8EC\xEE \xE4EE \xD2E0\xBAEC\xEDE8\xF6B3 \xC2E1\xE8E2\xF1F2\xE2E0!\16\n",
				"\xD6B3\xEBFC \xF6B3\xBABF \xE3F0\xE8 \xE4F3\xE6E5 \xEFF0\xEEF1\xF2E0: \xE7F0\xEEE7\xF3EC\xB3F2\xE8 \xF5F2\xEE \xE7 \xE3F0\xE0E2\xF6B3\xE2 \xBA \xC2E1\xE8E2\xF6E5\xFE \xB3 \xE5EB\xB3EC\xB3ED\xF3E2\xE0F2\xE8 \xF6FC\xEEE3\xEE \xE3F0\xE0E2\xF6FF, \xEFEE\xEAE8 \xEDE5 \xF1F2\xE0EB\xEE \xE7E0\xEFB3\xE7ED\xEE. \xC2E0\xF2F0\xEE \xF0EE\xE7F3\xECB3\xF2E8, \xF9EE \xF6E5\xE9 \xB3E3\xF0EE\xE2E8\xE9 \xF0E5\xE6E8\xEC \xE4F3\xE6E5 \xEFEE\xE4B3\xE1ED\xE8E9 \xE4EE \xF0E5\xE6E8\xECF3 \xCCC0\xD2D7, \xF2EE\xECF3 \xEEEA\xF0B3\xEC \xE3EE\xF1F2\xF0EE\xE3EE \xF0EE\xE7F3\xECF3 \xF2F3\xF2 \xEFEE\xF2F0\xB3E1\xEDB3 \xEDE0\xE2E8\xF7EA\xE8 \xEFF0\xE8F6\xB3EB\xFEE2\xE0ED\xEDFF \xB3 \xF8E2\xE8E4\xEAE0 \xF0E5\xE0EA\xF6B3\xFF.",
				"\n\xD3 \xF6B3\xE9 \xE3F0\xB3 \xF2E0\xEAEE\xE6 \xECEE\xE6ED\xE0 \xEEF2\xF0E8\xECE0\xF2E8 \xEEE4\xEDF3 \xE7 \xE4E5\xEAB3\xEBFC\xEAEE\xF5 \xF0EE\xEBE5\xE9 \xEDE0 \xEFEE\xF7E0\xF2EA\xF3 \xEAEE\xE6ED\xEEE3\xEE \xF0E0\xF3ED\xE4F3:",
				"\n * \21\xC2E1\xE8E2\xF6FF\16 - \xEEE4\xE8ED \xE7 \xE3EE\xEBEE\xE2ED\xE8F5 \xEFE5\xF0F1\xEEED\xE0E6\xB3E2 \xE3F0\xE8. \xC3F0\xE0E2\xE5F6\xFC \xE7 \xF6B3\xBAFE \xF0EE\xEBEB\xFE \xECF3\xF1E8\xF2FC \xE2E1\xE8F2\xE8 \xE0E1\xF1EE\xEBFE\xF2ED\xEE \xEAEE\xE6ED\xEEE3\xEE \xE0E1\xEE \xE7ED\xE8F9\xE8F2\xE8 \xE2F1\xB3 \xECEE\xE6EB\xE8E2\xEEF1\xF2B3 \xEFEE\xE2F1\xF2E0\xEDED\xFF \xD8E5\xF0E8\xF4B3\xE2;",
				"\n * \20\xD8E5\xF0E8\xF4\16 - \xE4F3\xE6E5 \xE2E0\xE6EB\xE8E2\xE8E9 \xEFE5\xF0F1\xEEED\xE0E6. \xD8E5\xF0E8\xF4E8 \xECF3\xF1FF\xF2FC \xE7ED\xE0E9\xF2E8 \xB3 \xE7\xE0F5\xE8F1\xF2E8\xF2E8 \xEDE5\xE2E8\xEDED\xE8F5 \xE2B3\xE4 \xE3E5\xEDEE\xF6E8\xE4F3 \xE2E1\xE8E2\xF6FC \xE2E8\xEAEE\xF0E8\xF1F2\xEEE2\xF3FE\xF7B3 \xE2F1\xB3 \xECEE\xE6EB\xE8E2\xB3 \xECE5\xF2EE\xE4E8 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xFF. \xDFEA\xF9EE \xE2EE\xEDE8 \xEFEE\xECE8\xEBFF\xF2F1\xFF \xE7 \xE2E1\xE8E2\xF6E5\xFE \xB3 \xE2E1'\xFEF2\xFC \xEDE5\xE2E8\xEDED\xEEE3\xEE \xE3F0\xE0E2\xF6FF \xBFF5 \xEEF4\xB3F6\xB3E0\xEBFC\xEDEE \xEBB3\xEAE2\xB3E4\xF3FE\xF2FC \xE2B3\xE4 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDFF;",
				"\n * \19\xCDE5\xE2E8\xEDED\xE8E9(-\xE0)\16 - \xF6E8\xE2B3\xEBFC\xEDE0 \xEEF1\xEEE1\xE0. \xD2E0\xEAE8\xEC \xE3F0\xE0E2\xF6FF\xEC \xFFEA\xEDE0\xE9F8\xE2E8\xE4F8\xE5 \xEFEE\xF2F0\xB3E1\xEDEE \xF1F5\xEEE2\xE0F2\xE8F1\xFF \xE2B3\xE4 \xC2E1\xE8E2\xF6FC, \xE0 \xE2E6\xE5 \xEFEE\xF2B3\xEC \xECEE\xE6F3\xF2FC \xE4EE\xEFEE\xECEE\xE3F2\xE8 \xD8E5\xF0E8\xF4E0\xEC \xE7 \xF0EE\xF1EB\xB3E4\xF3E2\xE0ED\xEDFF\xEC;",
				"\n\xD9E5 \xEEE4\xEDE0 \xE2E0\xE6EB\xE8E2\xE0 \xE4E5\xF2E0\xEBFC\16 - \xEFEE\xEFE0\xE4E0\xEDED\xFF \xEAB3\xEBFC\xF6FF \xE2 \xE3F0\xE0E2\xF6FF \xBA \xECEE\xECE5\xEDF2\xE0EB\xFCED\xEEFE \31\xF1EC\xE5F0\xF2F2\xFE\16 \xE1E5\xE7 \xECEE\xE6EB\xE8E2\xEEF1\xF2B3 \xE2B3\xE4ED\xEEE2\xEBE5\xEDED\xFF, \xF2EE\xECF3 \xEEE1\xE5F0\xB3E3\xE0ED\xEDFF \xF1E2\xEEE3\xEE \xE6E8\xF2F2\xFF \xF2F3\xF2 \xBA \xE4F3\xE6E5 \xE2E0\xE6EB\xE8E8\xEC.",
				"\xD6E5 \xF3F1\xFF \xB3ED\xF4EE\xF0EC\xE0F6\xB3FF \xEFEE\xF2F0\xB3E1\xEDE0 \xE4EB\xFF \xF0EE\xE7F3\xECB3\xEDED\xFF \xEEF1\xEDEE\xE2 \xE3F0\xE8. \xC4EB\xFF \xEFEE\xE3EB\xE8E1\xEBE5\xEDEE\xE3EE \xE2E8\xE2F7\xE5ED\xEDFF \xE0F1\xEFE5\xEAF2\xB3E2 \xB3 \xEFF0\xE0E2\xE8EB \xEFF0\xEEF1\xE8EC\xEE \xEFF0\xEEF7\xE8F2\xE0F2\xE8 \xF6E5\xE9 \xEFEE\xECB3\xF7ED\xE8EA \xE4EE \xEAB3\xEDF6\xFF."
			},{
				"\23\xC4E5\xF2E0\xEBFC\xEDB3\xF8E5 \xEFF0\xEE \xB3E3\xF0EE\xE2E8\xE9 \xEFF0\xEEF6\xE5F1\16",
				"\n* \xCAEE\xEBE8 \xE2 \xE3F0\xE0E2\xF6FF \xEFEE\xEFE0\xE4E0\xBA \xEAB3\xEBFC\xF6E5 \xF1F3\xEFF0\xEEF2\xE8E2\xEDE8\xEAE0 \xE2B3\xED \xECE8\xF2F2\xBAE2\xEE \xF1F2\xE0BA \31\xECE5\xF0F2\xE2E8\xEC\16. \xC3F0\xE0E2\xE5F6\xFC \xF3 \xF6FC\xEEEC\xF3 \xF1F2\xE0ED\xB3 \xEDE5 \xECEE\xE6E5 \xE2B3\xE4F0\xEEE4\xE6F3\xE2E0\xF2E8\xF1FF \xF2E0 \xE3EE\xE2EE\xF0E8\xF2E8 \xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2.",
				"\xD1EF\xB3EB\xEAF3\xE2E0\xEDED\xFF \xECEE\xE6EB\xE8E2\xE5 \xF2B3\xEBFC\xEAE8 \xE7 \xB3ED\xF8E8\xECE8 \xECE5\xF0F2\xE2E8\xECE8 \xE3F0\xE0E2\xF6FF\xECE8. \xCFE5\xF0F1\xEEED\xE0EB\xFCED\xB3 \xEFEE\xE2B3\xE4EE\xECEB\xE5ED\xEDFF \xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2 \xF2E5\xE6 \xEDE5 \xBA \xEDE5\xECEE\xE6EB\xE8E2\xE8EC\xE8.",
				"\18\xCDC5 \xCDC0\xCCC0\xC3C0\xC9D2\xC5D1\xDF \xC7CC\xB2CD\xC8D2\xC8 \xD1C2\xCEAA \xB2'\xCCDF \xC3D0\xC0C2\xD6DF \18\xD3 \18\xCCC5\xD0D2\xC2CE\xCCD3 \18\xD1D2\xC0CD\xB2!\16",
				"\n* \20\xD8E5\xF0E8\xF4E8\16 \xECEE\xE6F3\xF2FC \xECEE\xECE8\xEBE8\xF2E8\xF1FF \xF3 \xF1E2\xEEBA\xECF3 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xB3 \xB3 \xE2E1\xE8F2\xE8 \19\xEDE5\xE2E8\xEDED\xF3 \19\xEEF1\xEEE1\xF3\16 - \xE0EB\xE5 \xF6E5 \xEDE5 \xEEE7\xEDE0\xF7E0\xBA \xEAB3\xEDE5\xF6FC \xE3F0\xE8. \xC2E8\xEDF3\xE2E0\xF2E5\xF2FC \xE7E3\xF3E1\xE8F2\xFC \xF1E2\xEEFE \xEFEE\xF1E0\xE4F3 \xF8E5\xF0E8\xF4E0, \xEDE0\xF2EE\xECB3\xF1F2\xFC \xB3ED\xF8E0, \19\xE2E8\xEFE0\xE4EA\xEEE2\xE0\16, \xEDE5\xE2E8\xEDED\xE0 \xEEF1\xEEE1\xE0 \xEEF2\xF0E8\xECE0\xBA \xBFBF.",
				"\xC2E0\xF0F2\xEE \xE7E0\xE2E6\xE4E8 \xEFEE\xE4F3\xECE0\xF2E8 \xF2F0\xE8F7\xB3 \xEFE5\xF0F8 \xEDB3\xE6 \xE2E8 \xE7F0\xEEE1\xE8F2\xE5 \xE2E8\xF1ED\xEEE2\xEAE8, \xE1EE \xEDE5\xEFF0\xE0E2\xE8EB\xFCED\xE5 \xF0B3\xF8E5\xEDED\xFF \xECEE\xE6E5 \xE4EE\xE2E5\xF1F2\xE8 \xE4EE \xEAE0\xF2E0\xF1F2\xF0EE\xF4E8!",
				"\n* \xC2 \xEFF0\xE8EF\xE0E4\xEAF3 \xE2E1\xE8E2\xF1F2\xE2E0 \20\xF8E5\xF0E8\xF4E0\16 \xEDE5\xE2E8\xEDED\xB3 \xECEE\xE6F3\xF2FC \xE7ED\xE0E9\xF2E8 \20\xD1EC\xE0F0\xE0E3\xE4 \20\xD8E5\xF0E8\xF4E0\16 \xE1B3\xEBFF \xE9EE\xE3EE \xF2F0\xF3EF\xE0. \xCDE0 \xE2B3\xE4EC\xB3ED\xF3 \xE2B3\xE4 \xD1EC\xE0F0\xE0E3\xE4B3\xE2 \xD5E0\xEEF1\xF3, \xF6E5\xE9 \xF1EC\xE0F0\xE0E3\xE4 \xE4E0\xBA \xF0EE\xEBFC \18\xC3E5\xF0EE\xFF\16 \xEFE5\xF0F8\xEEEC\xF3 \xF5F2\xEE \xEFB3\xE4E1\xE5F0\xE5 \xE9EE\xE3EE.",
				"\18\xC3E5\xF0EE\xE9\16 \xE2B3\xE4F0\xB3E7\xEDFF\xBAF2\xFCF1\xFF \xE2B3\xE4 \xF0EE\xEBB3 \20\xD8E5\xF0E8\xF4E0\16 \xF2E8\xEC, \xF9EE \xEFF0\xE8 \xE7E0\xE3E8\xE1E5\xEBB3 \18\xC3E5\xF0EE\xE9\16 \xEDE5 \xE7E0\xEBE8\xF8E0\xBA \xEFB3\xF1EB\xFF \xF1E5\xE1E5 \xD1EC\xE0F0\xE0E3\xE4. \xD2E0\xEAEE\xE6 \xFFEA\xF9EE \18\xC3E5\xF0EE\xE9\16 \xE2E1'\xBA \19\xEDE5\xE2E8\xEDED\xEEE3\xEE\16 \xE3F0\xE0E2\xF6FF \xF2EE \xEEE1\xEEBA \xE7E0\xE3E8\xEDF3\xF2FC.",
				"\n* \xC3F0\xE0E2\xF6B3\xE2 \xE7 \xF0EE\xEBFF\xECE8 \21\xC2E1\xE8E2\xF6FC\16 \xF2E0 \20\xD8E5\xF0E8\xF4B3\xE2\16 \xECEE\xE6E5 \xE1F3\xF2E8 \xE4E5\xEAB3\xEBFC\xEAE0, \xE2 \xE7E0\xEBE5\xE6ED\xEEF1\xF2B3 \xE2B3\xE4 \xEAB3\xEBFC\xEAEE\xF1F2\xB3 \xEBFE\xE4E5\xE9 \xEEED\xEBE0\xE9ED. \xC3F0\xE0E2\xF6B3 \xFFEA\xB3 \xECE0\xFEF2\xFC \xEEE4\xEDF3 \xB3 \xF2F3 \xF1E0\xECF3 \xF0EE\xEBFC \xF3F2\xE2EE\xF0FE\xFEF2\xFC \8\xEAEE\xECE0\xEDE4\xF3\16 (\19\xEDE5\xE2E8\xEDED\xB3\16 \xEDE5 \xE2E2\xE0E6\xE0FE\xF2FC\xF1FF \xE7E0 \xEAEE\xECE0\xEDE4\xF3).",
				"\8\xCDE0\xEFE0\xF0ED\xE8EA\xE8 \xEFEE \xEAEE\xECE0\xEDE4\xB3\16 \xECEE\xE6F3\xF2FC \xF1EF\xB3EB\xEAF3\xE2E0\xF2E8\xF1FF \xECB3\xE6 \xF1EE\xE1EE\xFE \xE7E0 \xE4EE\xEFEE\xECEE\xE3EE\xFE \xCAEE\xECE0\xEDE4\xEDEE\xE3EE \xD7E0\xF2F3 \xFFEA\xE8E9 \xE4EE\xF1F2\xF3EF\xEDE8\xE9 \xF7E5\xF0E5\xE7 \xEAEE\xEDF1\xEEEB\xFCED\xF3 \xEAEE\xECE0\xEDE4\xF3 \23SAYTEAM\16."
			},{
				"\23\xCFEE\xE3E0\xEDB3 \xF0E5\xF7B3 \xE2 \xD2C2\16",
				"\n* \xC2E8\xEAE0\xE7F3\xE2E0\xEDED\xFF \xF1E2\xEEBA\xBF \xF0EE\xEBB3 - \xF0F3\xE9ED\xE0F6\xB3FF \xD2E0\xBAEC\xEDE8\xF6B3 \xF3 \"\xD2E0\xBAEC\xEDE8\xF6B3 \xC2E1\xE8E2\xF1F2\xE2E0\". \xD0EE\xE7EA\xE0E7\xF3E2\xE0F2\xE8 \xEFF0\xEE \xF1E2\xEEFE \xF0EE\xEBFC \xF3F1\xB3EC \xB3ED\xF8E8\xEC \xF1F3\xE2EE\xF0EE \xE7E0\xE1EE\xF0EE\xEDE5\xEDEE. \xCCEE\xE6ED\xE0 \xEBE8\xF8E5 \xE3EE\xE2EE\xF0E8\xF2E8 \xEFF0\xEE \xF0EE\xEBB3 \xB3ED\xF8E8\xF5 \xE3F0\xE0E2\xF6B3\xE2 \xEAEE\xEBE8 \xE9E4\xE5F2\xFCF1\xFF \xEFF0\xEE \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xFF;",
				"\n* \xCDE5 \xEDE0\xE1F0\xE8E4\xE0E9\xF2E5 \xB3ED\xF8E8\xEC \xE3F0\xE0E2\xF6FF\xEC \xF2E0 \"\xEDE5 \xF1F3\xE4B3\xF2FC \xEFEE \xEEE1\xEAEB\xE0E4\xE8ED\xF6B3\". \xCDB3\xF5F2\xEE \xEDE5 \xE1F3\xE4E5 \xE2E0\xEC \xE2B3\xF0E8\xF2E8 \xEAEE\xEBE8 \xE2E8 \xE1F3\xE4E5\xF2E5 \xE7E2\xE8ED\xF3E2\xE0F7\xF3E2\xE0F2\xE8 \xF3F1\xB3F5 \xF3 \xE2E1\xE8E2\xF1F2\xE2B3 \xF2E0/\xE0E1\xEE \xEEE1\xF0E0\xE6E0\xF2E8;",
				"\n* \xC1E5\xE7E0\xEAF2\xE8E2\xEDB3\xF1F2\xFC (AFK) \xE4F3\xE6E5 \xF1E8\xEBFC\xEDEE \xE2EF\xEBE8\xE2E0\xBA \xEDE0 \xEFEE\xE4B3\xBF \xE3F0\xE8. \xC2 \xE4E5\xFFEA\xE8F5 \xE2E8\xEFE0\xE4EA\xE0F5 \xE1E5\xE7E0\xEAF2\xE8E2\xEDB3\xF1F2\xFC \xEDE0\xE2B3\xF2FC \xEAE0\xF0E0\xBAF2\xFCF1\xFF \xE2E8\xE6E5\xEDE5\xEDED\xFFEC \xE7 \xE3F0\xE8;",
				"\n* \xC7EC\xB3ED\xE0 \xB3EC\xE5ED\xB3 \xE3F0\xE0E2\xF6FF \xF3 \xECE5\xF0F2\xE2EE\xECF3 \xF1F2\xE0ED\xB3 \xE2E2\xE0E6\xE0BA\xF2FC\xF1FF \xF7B3\xF2EE\xEC \xB3 \xEAE0\xF0E0\xBAF2\xFCF1\xFF \xE2E8\xE6E5\xEDE5\xEDED\xFFEC \xE7 \xE3F0\xE8 (\xE1EE \xECEE\xE6ED\xE0 \xEFE5\xF0E5\xE4E0\xF2E8 \xB3ED\xF4EE\xF0EC\xE0F6\xB3FE \xE6E8\xE2E8\xEC \xE3F0\xE0E2\xF6FF\xEC). \xC0E1\xE8 \xE1E5\xE7EF\xE5F7\xEDEE \xE7EC\xB3ED\xE8F2\xE8 \xB3EC'\xFF \xE2E0\xF0F2\xEE \xF1EF\xE5F0\xF8F3 \xE2E8\xE9F2\xE8 \xE7 \xE3F0\xE8, \xE7EC\xB3ED\xE8F2\xE8 \xB3EC'\xFF, \xE0 \xE2E6\xE5 \xEFEE\xF2B3\xEC \xE7ED\xEEE2\xF3 \xE7E0\xE9F2\xE8 \xF3 \xE3F0\xF3.",
				"\n\22\xCFEE\xF0F3\xF8E5\xEDED\xFF \xEEE4\xEDEE\xE3EE \xE7 \xF6FC\xEEE3\xEE \xEFF0\xE0E2\xE8EB \xEFF0\xE8E7\xE2EE\xE4E8\xF2FC \xE4EE \xE2E8\xE6E5\xEDE5\xEDED\xFF (kick) \xE0E1\xEE \22\xE1E0\xEDF3 \xE2B3\xE4 \xC0E4\xECB3\xEDB3\xF1F2\xF0E0\xF2EE\xF0B3\xE2 \xE3F0\xE8. \xC1F3\xE4FC \xEBE0\xF1EA\xE0, \xE3F0\xE0E9\xF2E5 \xF7E5\xF1ED\xEE \xB3 \xEDE5 \xF0F3\xE9ED\xF3E9\xF2E5 \xB3ED\xF8E8\xEC \"\xF2E0\xBAEC\xEDE8\xF6B3\" \xE3F0\xE8!"
			},{
				"\23\xD1EF\xE8F1\xEEEA \xEFEE\xF0E0\xE4\16\n",
				"\xCCE8 \xE7B3\xE1F0\xE0EB\xE8 \xF2F3\xF2 \xE4EB\xFF \xE2E0\xF1 \xE4E5\xEAB3\xEBFC\xEAE0 \xEFEE\xF0E0\xE4 \xFFEA\xB3 \xECEE\xE6F3\xF2FC \xE4EE\xEFEE\xECEE\xE3F2\xE8 \xE2E0\xEC \xF3 \xE2E0\xF8EE\xECF3 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xB3:",
				"\n* \xC2 \xE7E0\xEBE5\xE6ED\xEEF1\xF2B3 \xE2B3\xE4 \xEFE0\xF0E0\xECE5\xF2F0\xB3E2 \xE3F0\xE8 \xE2E8\xF1F2\xE0E2\xEBE5\xEDB3 \xC0E4\xECB3\xEDB3\xF1F2\xF0E0\xF2EE\xF0EE\xEC \xECEE\xE6ED\xE0 \xE7E0\xF2E8\xF1ED\xF3F2\xE8 \xEAEB\xE0E2\xB3F8\xF3 \23SPIN\16 \xE4EB\xFF \xEFB3\xE4EA\xF0E0\xE4E0\xEDED\xFF. \xCFB3\xE4EA\xF0E0\xE4E0\xEDED\xFF \xE4EE\xE7E2\xEEEB\xFFBA \xE2E0\xEC \xF5EE\xE4E8\xF2E8 \xEDE0\xE2EA\xEEEB\xEE \xE1E5\xE7 \xF8F3\xECF3 \xF2E0 \xF1EB\xB3E4\xB3E2 (\xE0 \xF2E0\xEAEE\xE6 \xB3ED\xF8B3 \xF2E8\xF5B3 \xF0E5\xF7B3);",
				"\n* \19\xCDE5\xE2E8\xEDED\xE8EC \xE3F0\xE0E2\xF6FF\xEC\16 \xECEE\xE6ED\xE0 \xEDE0\xEFE5\xF0E5\xE4 \xE7E1\xE8F0\xE0F2\xE8 \xE7E1\xF0EE\xFE \xF2E0 \xEAB3\xEBFC\xF6FF \xE0E1\xE8 \xEFEE\xF2B3\xEC, \xEAEE\xEBE8 \xEEF2\xF0E8\xECE0\xBA \xF0EE\xEBFC \20\xD8E5\xF0E8\xF4E0\16 \xE0E1\xEE \xE4B3\xF1F2\xE0ED\xE5 \20\xF1EC\xE0F0\xE0E3\xE4\16, \xECB3\xE3 \xE7 \xE2EF\xE5E2\xEDE5\xEDB3\xF1F2\xFE \xE9F2\xE8 \xF3 \xE1B3\xE9;",
				"\n* \xDFEA\xF9EE \xE2E0\xF1 \xE2E8\xEAF0\xE8EB\xE8 \xE2E8 \xE7E0\xE2E6\xE4E8 \xECEE\xE6E5\xF2E5 \xE7EC\xB3ED\xE8F2\xE8 \xEAEE\xEBB3\xF0 \xF1E2\xEEE3\xEE \xEFE5\xF0F1\xEEED\xE0E6\xF3 \xE0E1\xE8 \xE2E0\xF1 \xE2E0\xE6F7\xE5 \xE1F3\xEBEE \xE2EF\xB3E7\xEDE0\xF2E8;",
				"\n* \xCAEB\xE0E2\xB3F8\xE0 \23FIRENORMAL\16 \xE0EA\xF2E8\xE2F3\xBA \22\xEDB3\xE6\16 \xEAEE\xEBE8 \xE2E8 \xECE0\xBAF2\xE5 \xE4EB\xFF \xEDFC\xEEE3\xEE \xEAB3\xEBFC\xF6FF (\19\xCDE5\xE2E8\xEDED\xB3\16 \xEDE5 \xECE0\xFEF2\xFC \22\xEDEE\xE6E0\16). \xDFEA\xF9EE \xE2E8 \xEFB3\xE4EA\xF0E0\xE4E0\xBAF2\xE5F1\xFC \xF2EE \22\xEDB3\xE6\16 \xEDE5 \xF0EE\xE1E8\xF2FC \xE7E2\xF3EA\xB3E2 \xE0F2\xE0EA\xE8 \xF3E7\xE0E3\xE0EB\xB3."
			}
		},["MMLANG"]={
			"Potochna mowa w TW wstanowlena na \x82Ukrains'ku\x80\nWy mozhete zminyty jiji za dopomogoju komandy \x87MMLANG [mowa]",
			"\x82Ukrains'ka\x80 wstanowlena jak washa personal'na mowa w TW"
		},["ROLE_GET"]={
			"Wy \x85Wbywcia\x80! \x85Wbyjte usih.",
			"Wy \x84Sheryf\x80!\x84 Eliminujte usih Wbywc'\x80. Dumajte kogo wbywajete, bo ryzykujete swojeju rolliu.",
			"Wy \x83Newynnyj\x80! Zachowajtesia i dopomozhit' Sheryfu znajty Wbywc'."
		},["NEWROLE_GET"]={
			"\x87Zhytia zrobylo was \x85Wbywceju\x87, \x85teper idit' i wbyjte usih.",
			"\x87Wseswit zrobyw was nowym \x84Sheryfem\x87! Wam potribno \x84 eliminuwaty wsih Wbywc'\x87!",
			"\x87Usi zahystnyky pokynuly nas, ale Wseswit wybraw was nowym \x82Gerojem\x87! Ce wash shans wriatuwaty den'!",
			"\x87Wy wbyly odnogo z \x85Wbywc'\x87! Was pidwyshyly do \x82Geroja\x87!"
		},["TEAMMATE_HIT"]={
			"Wy zachepyly osobu z washoji komandy, ne namagajtesia wbyty jiji znow.",
			"Was zachepyla osoba z washoji komandy. Ne robit' pomsty dla neji."
		},["MURD_KILLED"]={
			"\x85Wbywcia\x87",
			"\x80".."eliminowanyj!"
		},["SHERI_KILLED"]={
			"\x84Sheryf\x87",
			"\x80wbytyj!",
			"Znajdit' zagublenyj \x84Smaragd Sheryfa\x80!"
		},["HERO_KILLED"]={
			"\x82Geroj\x87",
			"\x80wbytyj!"
		},["DIED_HAZARD"]="zagynuw(la) u neschasnomu wypadku",
		["SHREML_PICK"]="Htos' uziaw \x84Smaragd Sheryfa\x80...",
		["KILL_PUNISHMENT_PM"]={
			"\x87Wy wbyly \x83Newynnogo\x87! Was zwil'neno! (Ty bil'she ne Sheryf)",
			"\x82Geroji\x87 ne majut' prawa wbywaty \x83Newynnych\x87! Was zasudzheno na smert' za wash zlochyn!",
			"\x87O ni! Wy wbyly \x84Sheryfa\x87! Was zasudzheno na smert' za wash zlochyn!",
			"\x87Wy wbyly takuzh \x83Newynnu\x87 osobu jak i Wy sami! Was zasudzheno na smert' za wash zlochyn!",
			"\x87O ni! Wy wbyly \82Geroja\x87! Was zasudzheno na smert' za wash zlochyn!"
		},["INNO_HURT"]={
			"\x84Sheryf\x80 wbyw Newynnu osobu! Komus' z\x83 Cywil'nych\x80 dowedet'sia zakinchyty jogo robotu!",
			"\x82Geroj\x80 wbyw myrnu \x83newynnu osobu\x80. Teper dwoje lezhat' mertwi. Sorom geroju"
		},["ONE_LEFT"]={
			"Odyn z \x85Wbywc'\x80 pokynuw gru!",
			"Odyn z \x84Sheryfiw\x80 pokynuw gru!",
			"Odyn z \x82Gerojiw\x80 pokynuw nas!"
		},["LAST_LEFT"]={
			"Ostannij \x85Wbywcia\x80 pokynuw gru!",
			"Ostannij \x84Sheryf\x80 pokynuw gru!",
			"Ostannij \x82Geroj\x80 pokynuw gru!"
		},["REPLACE_LEFT"]={
			"\x85Wbywcia\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!",
			"\x84Sheryf\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!",
			"\x82Geroj\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!"
		},["ENDROUND"]={
			"Wsi mertwi, \x85Wbywci\x80 wygraly!",
			"Wsi Wbywci eliminowani,\x83 Cywil'ni\x80 wygraly!",
			"\x85Wbywci\x80 wygraly bo \x84Sheryf\x80 wbyw ostanniogo Newynnogo!",
			"\x82Geroj\x80 wbyw ostanniogo Newynnogo. \x85Wbywci\x80 wygraly!",
			"Wsi Sheryfy ta Geroji mertwi, \x85Wbywci\x80 wygraly!"
		},["BMP_VICTIMS"]={
			"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1F",
			"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"\xFFII\x1FII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1F1FII\x1F",
			"\xFF1FIIIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"\xFFFF\x1FIIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
			"\xFFFFIIII\x1FFF\xFFFFIIIIII\x1F\xFFIIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFIIIII\x1FFF",
			"\xFFIIIIII\x1FFF\xFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1F1FII\x1F",
			"II\x1FII\x1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
			"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIIII\x1F",
			"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
			"\x1F1F\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F"
		},["BMP_SUSPECTS"]={
			"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFFIII\xFFFFIII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FIIIII\x1FFF\xFFFFIIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIII\x1FFF\xFFFFIIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F\x1FII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFIIIII\x1FII\x1FFF\xFFIIIIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIII\x1FFFII\x1FFFIII\x1F1FIII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFFIIIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFF1FII\x1F",
			"II\x1FFFII\x1FFF\xFFII\x1FFFII\x1F1F\x1F1FII\x1FFF\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F\xFFFF\xFFFF\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F"
		},["BMP_TIME"]={
			"II\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
			"II\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
			"II\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1F",
			"\x1FIIII\x1FFFIIIIII\x1FFFII\x1F",
			"\xFF1F\x1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1F",
			"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
			"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1F",
			"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFF\x1FIIII\x1F",
			"\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F"
		},["BMP_RINGS"]={
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F\xFFII\x1FFF\xFFII\x1F1FII\x1F",
			"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F\xFFII\x1FFF\xFFII\x1FFFII\x1F",
			"\xFFIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFFIIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIIII\x1F",
			"IIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIIIII\x1F",
			"II\x1F1FII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1F",
			"II\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFII\x1FFFII\x1F",
			"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFIIIII\x1FFF\xFFIIIIIII\x1FFFII\x1FFFII\x1F",
			"\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1FII\x1FFF\x1F1F\x1FFF\x1F1F\x1F",
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1F"
		},["HUD_ROLES"]={
			"\xC2C1\xC8C2\xD6DF", --WBYWCIA
			"\xD8C5\xD0C8\xD4", --SHERYF
			"\xCDC5\xC2C8\xCDCD\xC0 \xCED1\xCEC1\xC0", --NEWYNNA OSOBA
			"\xC3C5\xD0CE\xC9", --HEROJ
			"\xCCC5\xD0D2\xC2C8\xC9" --MERTWYJ
		},["HUD_TEAMMATES"]="\xCDE0\xEFE0\xF0ED\xE8EA\xE8", --naparnyky
		["HUD_KILLBY"]="\xC2E8 \xE2E1\xE8F2\xB3", --wy wbyti
		["HUD_STUPID"]="\xC2E0\xF8E8\xEC \xB3E4\xB3EE\xF2E8\xE7EC\xE5EC", --washym idiotyzmem
		["HUD_SCORESTAB"]={
			"\xDFEA\xF9EE \xE2E8 \xE3F0\xE0BA\xF2E5 \xE2 \xEFE5\xF0F8\xE8E9 \xF0E0\xE7 \xF3 \xF6FE \xE3F0\xF3", --Jaksho wy grajete w pershyj raz u ciu gru
            "\xE2E8\xEAEE\xF0E8\xF1F2\xE0E9\xF2E5 \xEAEE\xECE0\xEDE4\xF3 \23MMHELP\16 \xF3 \xEAEE\xEDF1\xEEEB\xB3", --wykorystajte komandu MMHELP w konsoli
			"\xE4EB\xFF \xB3ED\xF4EE\xF0EC\xE0F6\xB3BF \xF2E0 \xEFF0\xE0E2\xE8EB", --dlia informaciji ta prawyl
			"",
			"\xCAEE\xECE0\xEDE4\xE0 \23MMLANG\16 \xE7EC\xB3ED\xFEBA \xECEE\xE2F3 \xB3ED\xF2E5\xF0F4\xE5E9\xF1F3",
            "",
            "",
			"\18\xD3E4\xE0F7\xB3  ;)" --Udachi
		},["HUD_ROLESALIVE"]={
			"\xC2E1\xE8E2\xF6FC", --Wbywc'
			"\xD8E5\xF0E8\xF4B3\xE2", --Sheryfiw
			"\xCDE5\xE2E8\xEDED\xE8F5" --Newynnych
		},["HUD_DEAD"]={
			"\xC2E8 \31\xECE5\xF0F2\xE2B3", --Wy metrwi,
			"\xC2E8 \xEDE5 \xECEE\xE6E5\xF2E5 \xE2B3\xE4F0\xEEE4\xE6F3\xE2E0\xF2E8\xF1FF \xF2E0 \xE3EE\xE2EE\xF0E8\xF2E8", --Ne mozhete widrodzhuwatysia ta goworyty
			"\xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2" --do zhywych grawciw
		},["HUD_MIDJOIN"]={
			"\xC2E8 \xEFF0\xE8BA\xE4ED\xE0EB\xE8F1\xFF \20\xEFEE\xF1E5\xF0E5\xE4 \xF0E0\xF3ED\xE4F3\16, \xE1F3\xE4FC \xEBE0\xF1EA\xE0, \xE7E0\xF7E5\xEAE0\xE9F2\xE5 \xEDE0\xF1F2\xF3EF\xEDEE\xE3EE \xE0E1\xE8 \xE7E0\xE3F0\xE0F2\xE8.", --wy pryjednalysia posered raundu, bud' laska, zachekajte nastupnogo aby zagraty
			"\xCFEE\xEAE8 \xC2E8 \xF7E5\xEAE0\xBAF2\xE5, \xE1F3\xE4FC \xEBE0\xF1EA\xE0, \xEFF0\xEEF7\xE8F2\xE0E9\xF2E5 \xEFF0\xE0E2\xE8EB\xE0 \xE3F0\xE8 \xE2 \xEAEE\xEDF1\xEEEB\xFCED\xB3E9 \xEAEE\xECE0\xEDE4\xB3 \23MMHELP\16"
		},["HUD_ALONE"]={
            "\xC4EB\xFF \xF1F2\xE0F0\xF2F3 \xE3F0\xE8 \xEFEE\xF2F0\xB3E1\xEDEE\20 2-\xBA \xE3F0\xE0E2\xF6B3\xE2\16,", --Dl'a startu gry potrebujetsia 2-je grawciw,
            "\xE1F3\xE4FC \xEBE0\xF1EA\xE02C \xE7E0\xF7E5\xEAE0\xE9F2\xE5 \xEDE0\20 \xF9E5 \xEEE4\xEDEE\xE3EE", --bud' laska zachekajte na she odnogo,
            "\xE0E1\xE8 \xEFEE\xF7E0\xF2E8" --aby pochaty
		},["HUD_SNEAKING"]="\xCAF0\xE0E4\xE5EC\xEEF1\xFF...", --Krademosia
		["HUD_SHOWDOWN"]="\xC2E8\xF0B3\xF8E0\xEBFC\xEDE0 \xE4F3\xE5EB\xFC!", --Wyrishal'na duel'!
		["HUD_MINIGAME"]={
			["PRESS"]="\xCDE0\xF2E8\xF1ED\xB3F2\xFC\18 CUSTOM3\16 \xE0E1\xE8", --Natysnit' CUSTOM3 aby
			["LEAVE"]="\xE2E8\xE9F2\xE8", --wyjty
			["CANCEL"]="\xF1EA\xE0F1\xF3E2\xE0F2\xE8", --skasuwaty
			["SPECTATE"]="\xEDE0\xE3EB\xFFE4\xE0F2\xE8", --nagliadaty
			["DUEL"]="\xE7E0 \xE4F3\xE5EB\xFCED\xEEFE \xECB3\xEDB3\xE3F0\xEEFE", --za duel'noju minigroju
			["REQUEST"]="\xE7B3\xE3F0\xE0F2\xE8 \xF3 \23PONG", --zigraty u PONG
			["START"]="\xE7B3\xE3F0\xE0F2\xE8 \xF3 \23SONIC RUN", --zigraty u SONIC RUN
			["ACCEPT"]="\xEFF0\xE8E9\xEDFF\xF2E8 \xE2E8\xEAEB\xE8EA \xF3 \23PONG\16!", --pryjniaty wyklyk u PONG!
			["WAIT"]="\xD7E5\xEAE0\xBAEC\xEE \xEDE0 \xE2B3\xE4EF\xEEE2\xB3F2\xFC \xEFF0\xEEF2\xE8E2\xEDE8\xEAE0...", --Czekajemo na widpowid' protywnyka...
			["SPECTATING"]="\xCDE0\xE3EB\xFFE4\xFFBA\xECEE \xE7E0 \xE3F0\xEEFE...", --Nagliadajemo za groju...
			["BORED"]="\xCDF3\xE4ED\xEE?", --nudno?
			["PONGBALL"]="\xC3EB\xFFE4\xE0F7\xB3 \xECEE\xE6F3\xF2FC \xE7EC\xB3ED\xFEE2\xE0F2\xE8 \xEAE5\xF0F3\xEDEE\xEA \xEC'\xFFF7\xE0" --Gliadachi mozhut' zminiuwaty kerunok m'jacha
		},["HUD_YOU"]="\xD2C8", --TY
		["HUD_WINNERS"]="\xC2E8\xE3F0\xE0EB\xE8:", --Wygraly
		["HUD_WON"]="\xE2E8\xE3F0\xE0E2(\xEBE0)!", --Wygraw(la)!
		["HUD_WIN"]={
			"\xCDB2\xD7C8\xDF!", --NICHYJA!
			"\21\xC2C1\xC8C2\xD6B2", --WBYWCI
			"\19\xD6C8\xC2B2\xCBDC\xCDB2" --CYWIL'NI
		},["HUD_PAST"]="\xCCC8\xCDD3\xCBC5", --MYNULE
		["HUD_FUTURE"]="\xCCC0\xC9C1\xD3D2\xCDAA" --MAJBUTN'E
	},
}
