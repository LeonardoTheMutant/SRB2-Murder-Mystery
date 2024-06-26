--TEXT.LUA
--Text by MM_DEV translators
--
--All text strings used in the mod

MM.text={
    ["EN"]={ -- English
		["VERSION"]="1.0-ALPHA", --to check if lang content is not OUTDATED
		["AUTHOR"]="SRB2 MM_DEV community",
		["MM"]="Murder Mystery",

		--The following sections contain strings that allow your language's native letters to display.
		--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.
		--Color codes in "MM string format" are ranged from 0 to 15 (ASCII) and do not support translucency
		--For more details read /SRC/DOCS/MM_String_Format.md
		["MMHELP_CMD"]={
			"Use \7JUMP\0/\7SPIN\0 to scroll, \7Next\0/\7Prev Weapon\0 to switch pages",
			"Press \7FIRE\0 to leave HELP"
		},
		["MMHELP"]={ --MMHELP command
			{ --MAIN
				"\7Welcome to Murder Mystery!",
				"\7The SRB2 interpretation of the \7popular \7multiplayer \7game!\0\n",
				"The game's goal is to find and eliminate all the \5Murderers\0 before they kill\3 everyone else\0. This gametype is more like MATCH so you will need your aiming and shooting skills for this gametype.",
				"You need to learn some basics first before you can start playing...",
				"\nAt the beginning of each round you will get a \10Role\0 which defines what your task is during the game. Here are all 3 possible \10Roles\0 you might get:",
				" * \5Murderer\0 - A true criminal. They have to kill everyone, but they are equipped only with Knives and Red Rings;",
				" * \4Sheriff\0  - Their task is to find and eliminate the \5Murderer(s)\0. Sheriffs may use every Weapon Ring available on the map;",
				" * \3Innocent\0 - Completely armless civilian, they must avoid being killed but also can help to find the \5Murderer\0.",
				"\nThat is all basic information required to start playing, for more information, read this manual to the end."
			},
			--GAME
			{
				"\7".."About the gameplay situations\0\n",
				"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \5Murderer(s)\0, but different gameplay situations may occur:",
				"\n* If you get killed, you'll enter the\15 Dead\0 stat Players with this state cannot respawn or talk globally to players that are still alive, their messages are visible only to other\15 Dead\0 players.",
				"You can't talk to/PM players who are still alive while you are\15 Dead\0.",
				"Also\2 DO \2NOT \2TRY \2TO \2RENAME \2YOURSELF\0, more details on this are on the next page.",
				"\n* The \4Sheriff's\0 task is to eliminate all the \5Murderers\0 around, but they can accidentally shoot an \3Innocent\0.",
				"If this occurs, the \4Sheriff\0 will turn into an \3Innocent\0 and a random \3Innocent\0 will silently take his role. Next time you want to shoot somebody as a \4Sheriff\0 think twice before pulling that trigger!",
				"\n* When a \5Murderer\0 kills a \4Sheriff\0 and there are still \3Innocents\0 alive, the Sheriff will drop the \4Sheriff's Emerald\0 near their corpse.",
				"Unlike the 7 Chaos Emeralds, this emerald will assign the \2Hero\0 role to any \3Innocent\0 that picks it up. If you're one of the \3Innocents\0, it's your chance to be a Hero and save everyone from the \5Murderer(s)\0!",
				"The \2Hero\0 role does not differ from the \4Sheriff\0 except for some details such as when the \2Hero\0 kills an \3Innocent\0 their role isn't shared and both just die. A Hero will not drop a \4Sheriff's \4Emerald\0 on their death.",
				"\n* Depending on the player count, there can be more than one \5Murderer\0 and \4Sheriff\0 amongst the players in the round. For example, starting from 7 players and more, \10Teams\0 of \5Murderers\0 and \4Sheriffs\0 will be formed.",
				"\10Teammates\0 can chat with each other in their team chat with the \7SAYTEAM\0 console command (note that SAYTEAM chat button will work as same as regular chat).",
				"If one \10teammate\0 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
			},
			--BAD
			{
				"\7Things that are bad to do in Murder \7Mystery\0\n",
				"Rule No.1 of any game: \1Be kind and \1have \1fun!\0 Other than this...",
				"\n* Self-spoiling of the \10Role\0 will not make the game a \'Mystery\' (even if you are joking), you can tell someone else's role if you are sure of it, but never tell your own.",
				"\n* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you accuse every player for no reason.",
				"\n* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
				"\n* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename yourself if you are alive. Just wait for the intermission to rename safely.",
				"\nBreaking one of these rules may result in a kick or sometimes, a ban from the Admin! Please do not break them and play fairly."
			},
			--TIPS
			{
				"\7Useful tips\0\n",
				"We've collected some tips that can help you during your game in MM:",
				"\n* If character abilities are disabled by admin, press \2SPIN\0 to sneak around quietly without leaving traces or making noise;",
				"\n* When you pick up the \4Sherrif's \4Emerald\0, you will have access to all the weapons and rings you collected beforehand;",
				"\n* Finding out who your \10teammate\0 is by using the \7SAYTEAM\0 command would help as it would make you avoid shooting them and accidentally making you reveal your role;",
				"\n* You can get hurt by obstacles like lava, spikes, fire to gain invincibility for 3 seconds;",
				"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
				"\n* If your role gets leaked, you can rename yourself and/or change the skin color. \1Keep \1in \1mind \1that \1your \1rename \1will \1be \1shown \1in \1chat\0;",
				"\n*\2 FIRENORMAL\0 button allows you to use the Knife anywhere as long as you have rings (Innocents do not have a knife). Also, a Knife does not produce an attack sound if you sneak."
			}
		},

		--
		-- Console/Chat messages (vanilla formatted)
		--

		--MMLANG command
		["MMLANG"]={
			"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language] command",
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
			"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!"
		},
		-- Teammate hit
		["TEAMMATE_HIT"]={
			"This player is your teammate. Please do not hit your teammates next time.",
			"A teammate hit you. Please don't take your revenge on them."
		},
		-- Murderer killed
		["MURD_KILLED"]={
			"\x85Murderer\x87", --beginning of the string
			"\x80got eliminated" --ending
		},
		-- Sheriff killed
		["SHERI_KILLED"]={
			"\x84Sheriff\x87",
			"\x80got murdered! Find their\x84 Emerald\x80!", --ending 1
			"\x80got murdered!" --ending 2 (no drop)
		},
		["HERO_KILLED"]={
			"\x82Hero\x87",
			"\x80got murdered!"
		},
		["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
		-- Innocent hurt by Sheriff
		["INNO_HURT_PM"]={
			"\x87You murdered an \x83Innocent\x87! You got fired. (You're no longer a Sheriff)",
			"\x82Heroes\x87 are not meant to kill \x83Innocents\x87. You got the death penalty for that."
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
			"If you're new to the gametype use \7MMHELP\0 ",
			"command in the Console for help and",
			"\7MMLANG\0 to change the language here",
			"",
			"",
			"\2Have Fun!"
		},
		-- Scores TAB screen role counters
		["HUD_ROLESALIVE"]={
			"Murderers",
			"Sheriffs",
			"Innocents"
		},
		-- Centered text when you're dead
		["HUD_DEAD"]={
			"You are\15 dead",
			"You can't respawn or talk to",
			"people who aren't dead."
		},
		-- Centered text when you joined
		["HUD_MIDJOIN"]={
			"You joined \4mid-game\0, please wait for this round to finish."
		},
		-- Centered text when you are alone
		["HUD_ALONE"]={
			"\4".."2 players\0 are required for the game,",
			"Please wait for \4one more\0 player to start"
		},
		["HUD_SNEAKING"]="Sneaking...", --Sneaking
		["HUD_SHOWDOWN"]="Showdown duel!", -- "Showdown duel!"
		--minigame stuff
		["HUD_MINIGAME"]={
			["PRESS"] = "Press\2 CUSTOM3\0 to", --must contain MM escape color codes
			["LEAVE"]="leave",
			["CANCEL"]="cancel",
			["SPECTATE"]="spectate",
			["DUEL"]="a minigame duel",
			["REQUEST"]="request a \7PONG\0 minigame", --must contain MM escape color codes
			["START"]="start a \7SONIC RUN\0 minigame", --must contain MM escape color codes
			["ACCEPT"]="accept the \7PONG\0 challenge!", --must contain MM escape color codes
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
			"\5MURDERERS", --must contain MM escape color code
			"\3CIVILIANS" --must contain MM escape color code
		},
		["HUD_PAST"]="PAST",
		["HUD_FUTURE"]="FUTURE"
	},["FR"]={ --French by Troplucky
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Troplucky",
		["MM"]="Murder Mystery",
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			"Utiliser \7JUMP\0/\7SPIN\0 pour faire d\xE9".."filer, \7Next\0/\7Prev Weapon\0 pour changer de pages",
			"Appuyer sur \7FIRE\0 pour quitter l'aide"
		},["MMHELP"]={
			{
				"\7Bienvenue dans Murder Mystery!",
				"\7L'interpr\xE9tation de SRB2 du \7jeu \7multijoueur \7populaire!\0\n",
				"Le but du jeu est de trouver et \xE9liminer tout les \5Meurtriers\0 avant qu'ils tue\3 tout les autres \0. Ce mode de jeux est similaire \xE0 MATCH donc vous aurez besoins de vos talents de tirs et pr\xE9".."cision.",
				"Vous devez apprendres quelques bases avant de jouer...",
				"\nAu d\xE9".."but de chaque round cous recevrez un \11Role\0 qui d\xE9".."finira votre t\xE2".."che dans cette partie . Voici les tout 3 \11Roles\0 que vous pouvez avoir:",
				" * \5Meurtrier \0 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
				" * \4Sheriff\0  - leur t\xE2".."che est de trouver et tuer le/les \5Meurtrier(s)\0. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
				" * \3Innocent\0 - Complètement sans armes, ils doivent \xE9viter de mourir mais peuvent aider a trouver le \5Meurtrier\0.",
				"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel."
			},{
				"\7".."par-apport  aux gameplay\0\n",
				"Expliquer plus-t\xF4t dans les bases, le but des Sheriffs est d'\xE9liminer tout les \5Meurtriers\0, mais des situations de gameplay differentes peuvent arriv\xE9:",
				"\n* Si vous mourez, vous entrerez l'\xE9tat\15 Mort\0 , Les joueurs dans cet \xE9tat ne peuvent pas r\xE9".."appara\xEEtre ni parler aux joueurs en vie, uniquement pas les autres joueurs Mort.",
				"Vous pouvez pas parler via /PM avec les \15 Mort\0.",
				"aussi\2 N'ESSAYER \2PAS \2DE \2CHANGER \2DE \2NOM\0, plus de d\xE9tails sur la prochaine page.",
				"\n* la t\xE2".."che du \4Sheriff\0 est d'\xE9liminer tout les \5Meurtriers \0 alentours, mais ils peuvent accidentellement tirer sur un \3Innocent\0.",
				"Si cela arrive, le \4Sheriff\0 deviendra \3Innocent\0 et un \3Innocent\0 al\xE9".."atoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que \4Sheriff\0 r".."fl\xE9".."chissez deux fois avant de tirer!",
				"\n* Quand un \5Meurtrier \0 tue un \4Sheriff\0 et qu'il restent des \3Innocents\0 en vie, le Sheriff va l\xE2".."cher l\xE0 \4Sheriff's Emerald\0 vers leur corps.",
				"contraire aux 7 Chaos Emeralds, cette \xE9meraude va donner le r\xF4le \2H\xE9ro\0 \xE0  \3l'Innocent\0 qui l\xE0 ramasse. Si vous \xEAtes un \3l'Innocent\0, c'est votre chance d'\xEAtre un H\xE9ro et de sauver les gens des \5Meurtriers\0!",
				"Le r\xF4le du \2H\xE9ro\0 r\xF4le ne change pas du \4Sheriff\0 except\xE9 quelques d\xE9tails tel que quand le \2H\xE9ro\0 tue un \3Innocent\0 sont r\xF4le ne se partagera pas et les deux mourront. un H\xE9ro ne l\xE2".."chera pas une \4Sheriff's \4Emerald\0 \xE0 sa mort.",
				"\n* Bas\xE9 sur le nombre de joueurs, il-est possible d'avoir plus d'un \5Meurtrier\0 et \4Sheriff\0 parmis les joueurs dans le round. par exemple, \xE0 partir de 7 joueurs ou plus, \11Des \xE9quipes\0 de \5Meurtriers\0 et \4Sheriffs\0 seront faites.",
				"\11Les alli\xE9s\0 peuvent parler en utilisant la commande de console \7SAYTEAM\0 (A not\xE9 que la touche sayteam fonctionne comme la touche say).",
				"Si un \11Alli\xE9\0 en attaque un autre, les deux recevron un message personnel qui sert de rappel. N'oublier pas que votre interaction \"amicale\" peut r\xE9v\xE9ler quit vous \xEAtes!"
			},{
				"\7Choses \xE0 pas faire dans Murder \7Mystery\0\n",
				"R\xE8gle No.1 pour tout les jeux: \1Soyer gentil et \1amusez-vous!\0 A-part \xE7".."a...",
				"\n* R\xE9v\xE9ler son \11Role\0 ruine le \'Myst\xE8re\' (m\xEAme en blague), Vous pouvez r\xE9v\xE9ler le role d'une personne mais pas le votre.",
				"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous cro\xEEre si vous accuser a tord constamment.",
				"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
				"\n* Ne changer pas de nom quand vous \xEAtes mort, vous allez vous faire kick automatiquement du server. Changer de nom est acceptable si vous \xEAtes en vie. Attender juste que la partie se finisse pour \xEAtre s\xFBr.",
				"\nNe pas respecter ces r\xE8gle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
			},{
				"\7Conseils\0\n",
				"Voici des conseils collecter pour MM:",
				"\n* Si les capacit\xE9".."es des personnages est d\xE9sactiver par les administrateurs, appuyer sur \2SPIN\0 pour vous d\xE9placer de fa\xE7on silencieuse;",
				"\n* Quand vous ramasser une \4Sherrif \4Emerald\0, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
				"\n* Trouver vos \11alli\xE9s\0 avec la commande \7SAYTEAM\0 permettera de savoir qui est dans votre \xE9quipe sans prendre de risque;",
				"\n* Prendres des d\xE9gats de tout sauf un \4Sherrif\0 ou un \5Meurtrier\0 vous donne 3 secondes d'invincibilit\xE9;",
				"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicit\xE9s pas voulu en moins;",
				"\n* Si votres role est r\xE9v\xE9ler, Vous pouvez changer de nom/couleur. \1Les \1changement \1de \1nom \1sont \1expos\xE9\0;",
				"\n*La touche \2 FIRENORMAL\0 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
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
			"\x80".."a ete assassiner! Trouver leur\x84 Emeraulde\x80!",
			"\x80".."a ete assassiner!"
		},["HERO_KILLED"]={
			"\x82Hero\x87",
			"\x80".."a ete assassiner!"
		},["SHREML_PICK"]="Quelqu'un a pris la \x84Sheriff's Emerald\x80...",
		["INNO_HURT_PM"]={
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
			"la commande \7MMHELP\0 dans la Console et",
			"\7MMLANG\0 pour changer la langue ici",
			"",
			"",
			"\2Amusez-Vous!!"
		},["HUD_ROLESALIVE"]={
			"Meurtriers",
			"Sheriffs",
			"Innocents"
		},["HUD_DEAD"]={
			"Vous \xEAtes\15 mort",
			"Vous ne pouvez ni r\xE9".."apparaitre, ni parler",
			"au personnes en vie."
		},["HUD_MIDJOIN"]={
			"Vous avez rejoins en \4pleine partie\0, attendez que le round ce finisse..."
		},["HUD_ALONE"]={
			"\4".."2 joueurs\0 sont requis pour commencer,",
			"attendez pour \4Un\0 joueur de plus",
			"pour commencer"
		},["HUD_SNEAKING"]="En Discret...",
		["HUD_SHOWDOWN"]="Duel Final!",
		["HUD_MINIGAME"]={
			["PRESS"]="Appuyear sur\2 CUSTOM3\0 pour",
			["LEAVE"]="quitter",
			["CANCEL"]="annulez",
			["SPECTATE"]="Regarder",
			["DUEL"]="un minijeux duel",
			["REQUEST"]="demander une partie de \7PONG\0",
			["START"]="d\xE9marrer une partie de \7\"SONIC RUN\"\0",
			["ACCEPT"]="accepter le duel de \7PONG\0!",
			["WAIT"]="En attente que le rival accepte...",
			["SPECTATING"]="En train de regarder un duel...",
			["BORED"]="Ennuyez?",
			["PONGBALL"]="Les Spectateurs peuvent changer la direction de la balle."
		},["HUD_YOU"]="VOUS",
		["HUD_WINNERS"]="GAGNANTS:",
		["HUD_WIN"]={
			"MATCH NUL!",
			"\5MEURTRIERS",
			"\3CIVILS"
		},
	},["PL"]={ -- Polish by sopix
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="sopix & LeonardoTheMutant",
		["CHARSET"]="1250C",
		["MM"]="Tajemnica Morderstw",
		["MMHELP_CMD"]={
			"Dla scrollingu wci\x9Cnij klawisz\xEA \7JUMP\0/\7SPIN\0, \xBF".."eby zmieni\xE6".."c stron\xEA wci\x9Cnij \7Nast.\0/\7Poprz. bro\xF1\0",
			"\7ESC\0 - wyj\x9C\xE6 z menu pomocy"
		},
		["MMHELP"]={
			{
				"\7Witaj w Tajemnicy Morderstw!\n\7Interpretacji popularnej gry multiplayer w SRB2!\0\n",
				"Celem gry jest znalezienie i wyeliminowanie wszystkich \5Morderc\xF3w\0 zanim zabij\xB9\3 wszystkich\0. Ten typ gry jest jak MATCH wi\xEA".."c musisz potrafi\xE6 strzela\xE6.",
				"B\xEA".."dziesz potrzebowa\xE6 kilku podstaw....",
				"\nNa pocz\xB9tku ka\xBF".."dej rundy dostaniesz \10Role\0 kt\xF3ra dyktuje co masz robi\xE6 w grze. To s\xB9 3 mozliwe \10Role\0 kt\xF3re mo\xBF".."esz dosta\xE6:",
				" * \5Morderca\0 - Prawdziwy kryminalista. Ma zabi\xE6 wszystkich, ale posiada tylko N\xF3BF ta Czerwone Ringi;",
				" * \4Szeryf\0   - Jego zadaniem jest znalezienie i wyeliminowanie \5Morderc\xF3w\0. Szeryfi mog\xB9 u\xBFywa\xE6 wszystkich typ\xF3w pier\x9C".."cieni;",
				" * \3Niewinny\0 - Kompletnie bezbronny cywil, musi nie zosta\xE6 zabity i pom\xF3".."c w znalezieniu \5Mordercy\0.",
				"\nTo cala podstawa do gry, je\x9Cli nadal czego\x9C nie wiesz lub chcesz dowiedzie\xE6 si\xEA wi\xEA".."cej przeczytaj ten podr\xEA".."cznik do ko\xF1".."ca"
			},{
				"\7O sytuacjach w grze\0\n",
				"Jak wyja\x9Cniono wcze\x9Cniej, ce\xB3".."em jest wyeliminowanie wszystkich \5Morderc\xF3w\0, ale r\xF3BFne sytuacje mog\xB9 zasta\xE6:",
				"\n* Je\x9Cli kto\x9C ci\xEA zastrzeli to staniesz si\xEA\15 Martwy\0. Gracze w tym stanie nie mog\xB9 si\xEA odnowi\xE6 ani gada\xE6 na globalnym czacie, twoje wiadomo\x9C".."ci s\xB9 tylko widoczne dla innych\x15 martwych\0 graczy.",
				"Nie mo\xBF".."esz u\xBFy\xE6 \7SAYTO\0 lub PW do osoby kt\xF3ra jest \xBFywa jako\15 MARTWY\0.",
				"Tak\xBF".."e,\2 NIE PR\xD3".."BUJ ZMIENIA\xC6 NAZWY\0, wi\xEA".."cej detali na nast\xEApnej stroni\xEA.",
				"\n* Zadaniem \4Szeryfa\0 jest wyeliminowanie wszystkich \5Morderc\xF3w\0, ale czasami Szeryf mo\xBF".."e zabi\xE6 \3Niewinn\xB9 \3osob\xEA\0 przez przypadek.",
				"Je\x9Cli to si\xEA stanie \4Szeryf\0 stanie si\xEA cywilem i inna \3Niewinna \3osoba\0 po cichu przejmie jego rol\xEA. Nast\xEApnym razem jak strzelisz w kogo\x9C jako \4Szeryf\0 pomy\x9Cl kogo zabijasz!",
				"\n* Kiedy \5Morderca\0 zabije \4Szeryfa\0 i zostan\xB9 \xBFywi \3Niewinni\0 Szeryf upu\x9C".."ci \4Szmaragd Szeryfa\0 obok jego cia\xB3".."a.",
				"W przeciwie\xF1stwie do Szmaragd\xF3w Chaosu ten Szmaragd daje role\2 Bohatera\0 do \3Niewinnego\0 kt\xF3ry go pierwszy podnios\xB3. Je\x9Cli jeste\x9C \3Niewinn\xB9 \3osob\xB9\0 to twoja szansa zosta\xE6 bohaterem i uratowa\xE6 wszystkich od \5Morderc\xF3w\0!",
				"\2Bohater\0 nie r\xF3BFni si\xEA za bardzo od \4Szeryfa\0 opr\xF3".."cz kilku detali jak kiedy\2 Bohater\0 zabija \3Niewinnego\0 jego rola nie jest oddawana i obydwoje gin\xB9. Bohater nie upu\x9C".."ci \4Szmaragdu \4Szeryfa\0 przy jego \x9Cmierci.",
				"\n* Zale\xBFnie od ilosci graczy, mo\xBF".."e by\xE6 wi\xEA".."cej ni\xBF jeden \5Morderc\xF3w\0 i \4Szeryfx\xF3w\0 po\x9Cr\xF3".."d graczy w grze. Na przyk\xB3".."ad, gdy jest wi\xEA".."cej ni\xBf 7 graczy to\10 Dru\xBFyny\0 \5Morderc\xF3w\0 i \4Szeryf\xF3w\0 b\xEA".."d\xB9 zformowane.",
				"\10Wsp\xF3\xB3nicy\0 mog\xB9 czatowa\xE6 z dru\xBFyn\xB9 za pomoc\xB9 komendy \7SAYTEAM\0 (przycisk SAYTEAM b\xEA".."dzie tak samo dziala\xB3 jak normalny czat).",
				"Je\x9Cli jeden \10wsp\xF3lnik\0 strzeli drugiego to dostanie wiadomo\x9CE6 \xBF".."eby nie strzelal do wspx\xF3B3nika. Pami\xEAtaj \xBF".."e inni mog\xB9 zobaczy\xE6 twoj\xB9 'przyjazn\xB9' rozmow\xEA i dowiedzie\xE6 si\xEA kim jeste\x9C!"
			},{
				"\7Rzeczy kt\xF3rych nie wolno \7robi\xE6 \7w \7Tajemnicy \7Morderstw\0\n",
				"Zasada numer 1 ka\xBF".."dej gry:\1 B\xB9".."d\x9F \1mi\xB3y \1i \1si\xEA \1baw!\0 Opr\xF3".."cz tego...",
				"* Wypowiedzenie swojej \10Roli\0 sprawi \xBF".."e gra nie b\xEA".."dzie ju\xBF \'Tajemnic\xB9\', mo\xBF".."esz wypowiedzie\xE6 role kogo\x9C innego jak wiesz ale nigdy swojej.",
				"* Nie b\xB9".."d\x9F nie mi\xB3y dla innych graczy, \xBF".."arty s\xB9 dozwolone ale tylko w przyjaznej atmosferze. Nikt ci nie b\xEA".."dzie ufa\xB3 jak b\xEA".."dziesz ci\xB9gle oskarza\xB3 innych bez powodu.",
				"* Bycie AFK to zbrodnia wojenna. Je\x9Cli b\xEA".."dziesz si\xEA nie ruszal przez dluzszy czas zostaniesz wykopany (tylko je\x9Cli \xBFyjesz).",
				"* Nie zmieniaj swojej nazwy p\xF3ki jeste\x9C Martwy(a) - gra jest bardzo \x9C".."cis\xB3".."a i\5 wyrzuci\0 ci z gry je\xBF".."eli to zrobisz. Po prostu zaczekaj na ekran zako\xF1".."czenia rundy \xBF".."eby zn\xF3w bezpiecznie zmienia\xE6 imi\xEA.",
				"Z\xB3".."amanie tych zasad mo\xBF".."e spowodowa\xE6 \xBF".."e zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie \xB3".."ama\xE6 i gra\xE6 fer."
			},{
				"\7Przydatne porady\0\n",
				"Zebrali\x9Cmy kilka porad kt\xF3rzy mog\xB9 przyda\xE6 ci w twojej grze w TM:",
				"\n* Je\xBF".."eli zdolno\x9C".."ci postaci s\xB9 wy\xB3B9".."czone administratorem, zaci\x9Cnij \2SPIN\0 \xBF".."eby skrada\xE6 si\xEA ukradkiem i nie zostawia\xE6 za sob\xB9 \x9Clad\xF3w;",
				"\n* Kiedy podniesiesz \4Szmaragd \4Szeryfa\0 b\xEA".."dziesz mie\xE6 dost\xEAp do ka\xBF".."dej broni i ring\xF3w, kt\xF3rzy zebrale\x9C uprzednio;",
				"\n* Mo\xBFna dowiedzie\xE6 si\xEA kim jest tw\xF3j \10kolega\0 z dru\xBFyny bez wykorzystania broni, po prostu wy\x9Cli powiadomienie za pomoc\xB9 komendy \7SAYTEAM\0 w konsoli i zaczekaj a\xBF p\xF3ki na ni\xB9 kto\x9C odpowie z twojej dru\xBFyny.;",
				"\n* Mo\xBF".."esz zosta\xE6 zraniony przez przeszkody takie jak lawa, kolce i ogie\xF1 \xBF".."eby dosta\xE6 effekt niezwyci\xEAzo\x9C".."ci na 3 sekundy;",
				"\n* Spr\xF3".."buj znale\x9FE6 miejsce dla kryj\xF3wke na mapie. Czasami, pomaga to pozby\xE6 si\xEA niechcianej publiczno\x9C".."ci;",
				"\n* Je\xBF".."eli twoja rola przestanie by\xE6 tajemnic\xB9, mo\xBF".."esz zmieni\xE6 swoje imi\xEA i zmieni\xE6 sw\xF3j kolor postaci. \1Pami\xEAtaj, \1\xBF".."e \1zmiana \1imienia \1b\xEA".."dzie \1widoczna \1w \1czacie\0;",
				"\n* Przycisk\2 FIRENORMAL\0 pozwala wykorzystywa\xE6 N\xF3BF wsz\xEA".."dzie, jak masz Ringi (Niewinni nie posiadaj\xB9 No\xBF".."a). Tak\xBF".."e, N\xF3BF nie robi dzwi\xEAk\xF3w ataku je\xBF".."eli skradzasz si\xEA."
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
			"\x87Wszyscy obroncy odeszli ale swiat sprawil cie nowym\x82 Bohaterem\x87! To twoja szansa uratowac dzien!"
		},["TEAMMATE_HIT"]={
			"Ten gracz jest twoim wspolnikiem, natepnym razem nie probuj zabiac ich ponownie",
			"Twoj wspolnik cie zaatakowal, nie probuj sie mscic"
		},["MURD_KILLED"]={
			"\x85Morderca\x87",
			"\x80zostal wyeliminowany!"
		},["SHERI_KILLED"]={
			"\x84Szeryf\x87",
			"\x80zostal zamordowany! Znajdz zgubiony \x84Szmaragd Szeryfa\x80!",
			"\x80zostal zamordowany!"
		},["HERO_KILLED"]={
			"\x82".."Bohater\x87",
			"\x80zostal zamordowany!"
		},
		["SHREML_PICK"]="Ktos podniosl \x84Szmaragd Szeryfa\x80...",
		["INNO_HURT_PM"]={
			"\x87Zamordowales \x83Niewinnego\x87! Nie jestes juz \x84Szeryfem\x87!",
			"\x82".."Bohaterowie nie sa po to, zeby zabijac \x83Niewinnych\x87. Masz za to kare smierci."
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
			"komendy \7MMHELP\0 w Konsoli dla pomocy",
			"i \7MMLANG\0 dla zmiany j\xEAzyka tutaj",
			"",
			"",
			"\2Baw si\xEA dobrze ;)"
		},["HUD_ROLESALIVE"]={
			"Morderc\xF3w",
			"Szeryf\xF3w",
			"Niewinnych"
		},["HUD_DEAD"]={
			"Jeste\x9C\15 martwy(a)",
			"Nie mozesz si\xEA odnawia\xE6 lub gada\xE6 do \xBFywych"
		},["HUD_MIDJOIN"]={
			"Pan(i) dolaczy\xB3(a) si\xEA \4w \x9Crodku rundy\0, prosze poczeka\xE6 na now\xB9 rund\xEA \xBF".."eby zagra\xE6"
		},["HUD_ALONE"]={
			"\4".."2 graczy\0 jest wymaganych do gry,",
			"prosz\xEA poczeka\xE6 na \4jeszcze jednego\0 gracza",
			"dla startu"
		},["HUD_SNEAKING"]="Skradzamy si\xEA...",
		["HUD_SHOWDOWN"]="Pojedynek losu!",
		["HUD_MINIGAME"]={
			["PRESS"] = "Naci\x9Cnij\2 CUSTOM3\0, aby", --must contain MM escape color codes
			["LEAVE"]="opu\x9C".."ci\xE6 gr\xEA",
			["CANCEL"]="anulowa\xE6",
			["SPECTATE"]="ogl\xB9".."da\xE6",
			["DUEL"]="za pojedynkiem w minigrz\xEA",
			["REQUEST"]="zagra\xE6 w \7PONG\0 z przeciwnikiem", --must contain MM escape color codes
			["START"]="zagra\xE6 w \7SONIC RUN", --must contain MM escape color codes
			["ACCEPT"]="zaakceptowa\xE6 zaproszenie w \7PONG\0!", --must contain MM escape color codes
			["WAIT"]="Czekamy na odpowied\x9F przeciwnika...",
			["SPECTATING"]="Ogl\xB9".."damy za pojedynkiem...",
			["BORED"]="Nudzisz si\xEA?",
			["PONGBALL"]="Jako widz mo\xBF".."esz zmienia\xE6 kierunek pilki"
		},["HUD_YOU"]="TY",
		["HUD_WINNERS"]="Wygrani:",
		["HUD_WON"]="zwyci\xEABFyl(a)!",
		["HUD_WIN"]={
			"REMIS!",
			"\5M\xD3RDERCY",
			"\3CYWILE"
		},
		["HUD_PAST"]="PRZESZLO\x8CC6",
		["HUD_FUTURE"]="PRZYSZLO\x8CC6"
	},["RU"]={
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Arnie37, Sonic1983, LeonardoTheMutant",
		["NONASCII"]=true,
		["MM"]="\xD2E0\xE9ED\xE0 \xD3E1\xE8E9\xF1F2\xE2E0",
		["CHARSET"]="1251C",
		["MMHELP_CMD"]={
			"\7JUMP\0/\7SPIN\0 - \xEFF0\xEEEA\xF0F3\xF2EA\xE0 \xF1F2\xF0E0\xEDE8\xF6FB, \7Next\0/\7Prev Weapon\0 - \xF1EC\xE5ED\xE8F2\xFC \xF1F2\xF0E0\xEDE8\xF6F3",
			"\7FIRE\0 - \xEFEE\xEAE8\xEDF3\xF2FC \xFDF2\xEE \xECE5\xEDFE"
		},["MMHELP"]={
			{
				"\7\xC4EE\xE1F0\xEE \xEFEE\xE6E0\xEBEE\xE2E0\xF2FC \xE2 \xD2E0\xE9ED\xF3 \xD3E1\xE8E9\xF1F2\xE2E0!\0",
				"\7\xC8ED\xF2E5\xF0EF\xF0E5\xF2E0\xF6E8\xFE \xEFEE\xEFF3\xEBFF\xF0ED\xEEE9 \xE8E3\xF0FB \xE2 SRB2!\0\n",
				"\xD6E5\xEBFC \xE8E3\xF0FB - \xEDE0\xE9F2\xE8 \xE8 \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \5\xD3E1\xE8E9\xF6\0 \xE4EE \xF2EE\xE3EE, \xEAE0\xEA \xEEED\xE8 \xF3E1\xFCFE\xF2 \3\xEEF1\xF2E0\xEBFC\xEDFB\xF5\0. \xDDF2\xEEF2 \xF0E5\xE6E8\xEC \xEFEE\xE4EE\xE1E5\xED \xF0E5\xE6E8\xECF3 \xCCC0\xD2D7, \xF2E0\xEA \xF7F2\xEE \xE7E4\xE5F1\xFC \xC2E0\xEC \xEFEE\xF2F0\xE5E1\xF3FE\xF2F1\xFF \xEDE0\xE2FB\xEAE8 \xF1F2\xF0E5\xEBFC\xE1FB \xE8 \xEFEE\xEFE0\xE4E0\xEDE8\xFF.",
				"\xD1ED\xE0F7\xE0EB\xE0, \xEFE5\xF0E5\xE4 \xF2E5\xEC, \xEAE0\xEA \xE8E3\xF0E0\xF2FC, \xC2E0\xEC \xEDE0\xE4EE \xE8E7\xF3F7\xE8F2\xFC \xEFE0\xF0EE\xF7EA\xF3 \xE0E7\xEEE2...",
				"\n\xC2 \xF1E0\xECEE\xEC \xEDE0\xF7E0\xEB\xE5 \xEAE0\xE6E4\xEEE3\xEE \xF0E0\xF3ED\xE4E0, \xC2E0\xEC \xE2FB\xEFE0\xE4E5\xF2 \11\xD0EE\xEBFC\0, \xEEEF\xF0E5\xE4E5\xEBFF\xFEF9\xE0FF \xC2E0\xF8E8 \xE7E0\xE4E0\xEDE8\xFF \xE2EE \xE2F0\xE5EC\xFF \xE8E3\xF0FB. \xC2EE\xF2 \xE2F1\xE5 3 \xE2EE\xE7EC\xEEE6\xEDFB\xE5 \xD0EE\xEBE8, \xEAEE\xF2EE\xF0FB\xE5 \xECEE\xE6ED\xEE \xEFEE\xEBF3\xF7E8\xF2FC \xEDE0 \xF1F2\xE0F0\xF2E5:",
				"* \5\xD3E1\xE8E9\xF6E0\0 - \xEFF0\xE5F1\xF2F3\xEFED\xE8EA \xE2EE \xEFEB\xEEF2\xE8. \xC8EC \xEDF3\xE6ED\xEE \xE2F1\xE5F5 \xF3E1\xE8F2\xFC, \xEDEE \xE2 \xE0F0\xF1E5\xEDE0\xEBE5 \xF3 \xEDE8\xF5 \xF2EE\xEBFC\xEAEE \xCDEE\xE6 \xE8 \xCAF0\xE0F1\xEDFB\xE5 \xCAEE\xEBFC\xF6E0;",
				"* \4\xD8E5\xF0E8\xF4\0 - \xECE5\xF1F2\xEDE0\xFF \xEFEE\xEBE8\xF6E8\xFF. \xC8F5 \xE7E0\xE4E0\xF7E0 \xE7E0\xEAEB\xFEF7\xE0E5\xF2F1\xFF \xE2 \xEDE0\xF5EE\xE6E4\xE5ED\xE8E8 \xE8 \xF3F1\xF2F0\xE0ED\xE5ED\xE8E8 \xE2F1\xE5F5 \xD3E1\xE8E9\xF6. \xD8E5\xF0E8\xF4FB \xECEE\xE3F3\xF2 \xE8F1\xEFEE\xEBFC\xE7EE\xE2E0\xF2FC \xE2F1\xE5 \xCAEE\xEBFC\xF6E0-\xD0F3\xE6FC\xFF, \xE4EE\xF1F2\xF3EF\xEDFB\xE5 \xEDE0 \xEBEE\xEAE0\xF6E8\xE8;",
				"* \3\xCDE5\xE2E8\xEDED\xFBE9\0 - \xE1E5\xE7EE\xE1E8\xE4ED\xFBE9 \xE6E8\xF2E5\xEBFC, \xE8EC \xEDE0\xE4EE \xE8E7\xE1E5\xE3E0\xF2FC \xE3E8\xE1E5\xEBE8, \xEDEE \xEEED\xE8 \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xEFEE\xECEE\xF7FC \xF0E0\xF1EA\xF0FB\xF2FC \5\xD3E1\xE8E9\xF6F3\0.",
				"\n\xDDF2\xEE \xE1FB\xEBE8 \xE2F1\xE5 \xE1E0\xE7EE\xE2FB\xE5 \xE7ED\xE0ED\xE8FF, \xF2F0\xE5E1\xF3E5\xECFB\xE5 \xE4EB\xFF \xEFEE\xEDE8\xECE0\xEDE8\xFF \xE8E3\xF0FB. \xD0E5\xEAEE\xECE5\xEDE4\xF3E5\xEC \xEFF0\xEEF7\xE8F2\xE0F2\xFC \xFDF2\xF3 \xF1EF\xF0E0\xE2EA\xF3 \xE4EE \xEAEE\xEDF6\xE0 \xE4EB\xFF \xE1EE\xEBFC\xF8E5\xE3EE \xEFEE\xEDE8\xECE0\xEDE8\xFF \xE8E3\xF0EE\xE2FB\xF5 \xECE5\xF5E0\xEDE8\xEA \xE8 \xECED\xEEE3\xEE \xF7E5\xE3EE \xE8ED\xF2E5\xF0E5\xF1F2\xEDEE\xE3EE."
			},{
				"\7\xCEE1 \xE8E3\xF0EE\xE2FB\xF5 \xF1E8\xF2F3\xE0F6\xE8FF\xF5 \xE8 \xE3E5\xE9EC\xEFEB\xE5E5\0\n",
				"\xCAE0\xEA \xE1FB\xEBEE \xF0E0\xF1F1\xEAE0\xE7E0\xEDEE \xF0E0\xEDE5\xE5 \xE2 \xE0E7\xE0F5, \xF6E5\xEBFC \4\xD8E5\xF0E8\xF4EE\xE2\0 - \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \5\xD3E1\xE8E9\xF6\0, \xEDEE \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xE1FB\xF2FC \xE2EE\xE7EC\xEEE6\xEDFB\xECE8 \xF1EB\xE5E4\xF3FE\xF9E8\xE5 \xF1E8\xF2F3\xE0F6\xE8E8:",
				"\n* \xC5F1\xEBE8 \xE2 \xC2E0\xF1 \xEFEE\xEFE0\xE4E5\xF2 \xEAEE\xEBFC\xF6EE \xE8E3\xF0EE\xEAE0, \xC2FB \xF1F2\xE0ED\xE5F2\xE5 \15\xCCB8\xF0F2\xE2FB\xEC\0. \xD2E0\xEAE8\xEC \xE8E3\xF0EE\xEAE0\xEC \xE1EB\xEEEA\xE8F0\xEEE2\xE0ED\xEE \xE2EE\xE7F0\xEEE6\xE4E5\xEDE8\xE5 \xE8 \xE2EE\xE7EC\xEEE6\xEDEE\xF1F2\xFC \xEFE8\xF1E0\xF2FC \xEFF0\xE8E2\xE0F2\xEDEE \xE2 \xF7E0\xF2 \xF2E5\xEC, \xEAF2\xEE \xE5F9\xB8 \xE6E8\xE2EE\xE9. \xC8F5 \xF1EE\xEEE1\xF9E5\xEDE8\xFF \xE1F3\xE4F3\xF2 \xE2E8\xE4ED\xFB \xF2EE\xEBFC\xEAEE \xF2E0\xEAE8\xEC \xE6E5 \15\xCCE5\xF0F2\xE2E5\xF6E0\xEC\0.",
				"\xC5F9\xB8, \2\xCDC5 \xCFDB\xD2C0\xC9D2\xC5D1\xDC \xD1CC\xC5CD\xC8D2\xDC \xD1C2\xCEA8 \xC8CC\xDF \xC8C3\xD0CE\xCAC0 \2\xC2CE \2\xC2D0\xC5CC\xDF \2\xC8C3\xD0DB!\0 \xCFEE\xE4F0\xEEE1\xEDE5\xE5 \xEEE1 \xFDF2\xEEEC \xEDE0 \xF1EB\xE5E4\xF3FE\xF9E5\xE9 \xF1F2\xF0E0\xEDE8\xF6E5.",
				"\n* \xC7E0\xE4E0\xF7E0 \4\xD8E5\xF0E8\xF4E0\0 - \xF3F1\xF2F0\xE0ED\xE8F2\xFC \xE2F1\xE5F5 \5\xD3E1\xE8E9\xF6\0 \xE2EE\xEAF0\xF3E3, \xEDEE \xEEED\xE8 \xF2E0\xEAE6\xE5 \xECEE\xE3F3\xF2 \xEFEE \xF1EB\xF3F7\xE0E9\xEDEE\xF1F2\xE8 \xEFF0\xE8F1\xF2F0\xE5EB\xE8F2\xFC \3\xCDE5\xE2E8\xEDED\xEEE3\xEE\0.",
				"\xC5F1\xEBE8 \xF2E0\xEAEE\xE5 \xEFF0\xEEE8\xE7EE\xE9E4\xB8F2, \4\xD8E5\xF0E8\xF4\0 \xF1F2\xE0ED\xE5F2 \3\xCDE5\xE2E8\xEDED\xFBEC\0, \xE0 \xF1EB\xF3F7\xE0E9\xEDEE\xECF3 \3\xCDE5\xE2E8\xEDED\xEEEC\xF3\0 \xF0E5\xE7EA\xEE \xEFE5\xF0E5\xE4E0\xF1F2\xF1FF \xE5E3\xEE \xF0EE\xEBFC. \xC2 \xF1EB\xE5E4\xF3FE\xF9E8\xE9 \xF0E0\xE7, \xE1F3\xE4F3\xF7E8 \4\xD8E5\xF0E8\xF4EE\xEC\0, \xE4F3\xECE0\xE9F2\xE5 \xE4E2\xE0E6\xE4FB \xEFE5\xF0E5\xE4 \xEDE0\xE6E0\xF2E8\xE5EC \xEAF3\xF0EA\xE0!",
				"\n* \xCAEE\xE3E4\xE0 \5\xD3E1\xE8E9\xF6E0\0 \xF3E1\xFCB8\xF2 \4\xD8E5\xF0E8\xF4E0\0, \xEDEE \xE2 \xE8E3\xF0E5 \xE5F9\xB8 \xE5F1\xF2FC \3\xCDE5\xE2E8\xEDED\xFBE5\0, \xEEEA\xEEEB\xEE \xE5E3\xEE \xF2F0\xF3EF\xE0 \xF3EF\xE0E4\xB8F2 \xE5E3\xEE \4\xC8E7\xF3EC\xF0F3\xE4\0.",
				"\xC2 \xEEF2\xEBE8\xF7E8\xE5 \xEEF2 7-\xE8 \xC8E7\xF3EC\xF0F3\xE4EE\xE2 \xD5E0\xEEF1\xE0, \xFDF2\xEEF2 \xE8E7\xF3EC\xF0F3\xE4 \xF1EF\xEEF1\xEEE1\xE5ED \xF1E4\xE5EB\xE0F2\xFC \2\xC3E5\xF0EE\xE5EC\0 \xEBFE\xE1EE\xE3EE \3\xCDE5\xE2E8\xEDED\xEEE3\xEE\0, \xEFEE\xE4EE\xE1F0\xE0E2\xF8E5\xE3EE \xE5E3\xEE. \xC5F1\xEBE8 \xC2FB \3\xCDE5\xE2E8\xEDED\xFBE9\0, \xF2EE \xFDF2\xEE \xE1F3\xE4E5\xF2 \xC2E0\xF8E8\xEC \xF8E0\xEDF1\xEEEC \xF1F2\xE0F2\xFC \2\xC3E5\xF0EE\xE5EC\0 \xE8 \xF1EF\xE0F1\xF2E8 \xE2F1\xE5F5 \xEEF2 \5\xD3E1\xE8E9\xF6\0!",
				"\xD0EE\xEBFC \2\xC3E5\xF0EE\xFF\0 \xEDE5\xF1E8\xEBFC\xEDEE \xEEF2\xEBE8\xF7E0\xE5F2\xF1FF \xEEF2 \xF0EE\xEBE8 \4\xD8E5\xF0E8\xF4E0\0 \xE7E0 \xE8F1\xEAEB\xFEF7\xE5ED\xE8E5\xEC \xEDE5\xF1EA\xEEEB\xFCEA\xE8F5 \xE4E5\xF2E0\xEBE5\xE9, \xEFEE \xF2E8\xEFF3, \xE5F1\xEBE8 \2\xC3E5\xF0EE\xE9\0 \xF3E1\xE8E2\xE0E5\xF2 \3\xCDE5\xE2E8\xEDED\xEEE3\xEE\0, \xF2EE \xE8F5 \xF0EE\xEBFC \xEDE5 \xEFE5\xF0E5\xE4E0\xB8F2\xF1FF, \xE0 \xFDF2\xE8 \xEEE1\xE0 \xEFF0\xEEF1\xF2EE \xEFEE\xECF0\xF3F2. \4\xC8E7\xF3EC\xF0F3\xE4 \4\xD8E5\xF0E8\xF4E0\0 \xEFEE\xF1EB\xE5 \xF1EC\xE5F0\xF2E8 \xE8E7 \2\xC3E5\xF0EE\xFF\0 \xEDE5 \xE2FB\xEFE0\xE4E0\xE5F2.",
				"\n* \xC2 \xE7E0\xE2E8\xF1E8\xECEE\xF1F2\xE8 \xEEF2 \xEAEE\xEB-\xE2E0 \xE8E3\xF0EE\xEAEE\xE2, \5\xD3E1\xE8E9\xF6\0 \xECEE\xE6E5\xF2 \xE1FB\xF2FC \xF1F0\xE0E7\xF3 \xEDE5\xF1EA\xEEEB\xFCEA\xEE, \xF2E0\xEA \xE6E5 \xE8 \xF1 \4\xD8E5\xF0E8\xF4E0\xECE8\0. \xCDE0\xEFF0\xE8EC\xE5F0, \xE5F1\xEBE8 \xE2 \xE8E3\xF0E5 7 \xE8EB\xE8 \xE1EE\xEBE5\xE5 \xE8E3\xF0EE\xEAEE\xE2, \xF1F4\xEEF0\xECE8\xF0F3\xFEF2\xF1FF \10\xCAEE\xECE0\xEDE4\xFB \5\xD3E1\xE8E9\xF6\0 \xE8 \4\xD8E5\xF0E8\xF4EE\xE2\0.",
				"\xCDE0\xEFE0\xF0ED\xE8EA\xE8 \xECEE\xE3F3\xF2 \xEEE1\xF9E0\xF2FC\xF1FF \xECE5\xE6E4\xF3 \xF1EE\xE1EE\xE9 \xE2 \xE8F5 \xEAEE\xECE0\xEDE4\xEDEE\xEC \xF7E0\xF2E5 \xF7E5\xF0E5\xE7 \xEAEE\xEDF1\xEEEB\xFCED\xF3FE \xEAEE\xECE0\xEDE4\xF3 \7SAYTEAM\0 (\xEFEE\xE4EC\xE5F7\xF3, \xF7F2\xEE \xEAED\xEEEF\xEAE0 \xEAEE\xECE0\xEDE4\xEDEE\xE3EE \xF7E0\xF2E0 \xE1F3\xE4E5\xF2 \xF0E0\xE1EE\xF2E0\xF2FC \xF2E0\xEA \xE6E5, \xEAE0\xEA \xEAED\xEEEF\xEAE0 \xEEE1\xFBF7\xEDEE\xE3EE \xF7E0\xF2E0).",
				"\xC5F1\xEBE8 \xEEE4\xE8ED \xCDE0\xEFE0\xF0ED\xE8EA \xEDE0\xEDE5\xF1B8\xF2 \xF3F0\xEEED \xE4F0\xF3E3\xEEEC\xF3, \xEEED\xE8 \xEEE1\xE0 \xEFEE\xEBF3\xF7E0\xF2 \xEFE5\xF0F1\xEEED\xE0EB\xFCED\xEEE5 \xEFF0\xE5E4\xF3EF\xF0E5\xE6E4\xE5ED\xE8E5, \xEAEE\xF2EE\xF0EE\xE5 \xEFF0\xEEE8\xEDF4\xEEF0\xECE8\xF0F3\xE5F2 \xE8F5 \xEEE1 \xFDF2\xEEEC. \xCFEE\xECED\xE8F2\xE5, \xF7F2\xEE \xE4F0\xF3E3\xE8E5 \xECEE\xE3F3\xF2 \xE2E8\xE4E5\xF2FC \xC2E0\xF8E8 '\xE4F0\xF3E6\xE5F1\xEAE8\xE5' \xEEF2\xEDEE\xF8E5\xEDE8\xFF \xE8 \xEFEE\xEDFF\xF2FC, \xEAF2\xEE \xC2FB!"
			},{
				"\7\xD7E5\xE3EE \xEDE5\xEBFC\xE7FF \xE4E5\xEBE0\xF2FC \xE2 \xD2E0\xE9ED\xE5 \xD3E1\xE8E9\xF1F2\xE2E0\0",
				"\xCFF0\xE0E2\xE8EB\xEE No.1 \xEBFE\xE1EE\xE9 \xE8E3\xF0FB: \1\xC1F3\xE4FC\xF2E5 \xE4EE\xE1F0\xFB \xE8 \1\xE2E5\xF1E5\xEBE8\xF2E5\xF1FC\0! \xC8 \xEDE5 \xE4E5\xEBE0\xE9F2\xE5 \xF1EB\xE5E4\xF3FE\xF9E8\xF5 \xE2E5\xF9E5\xE9...\n",
				"\n* \xC7E0\xF1EF\xEEE9\xEBE5\xF0E8\xF8FC \xF0EE\xEBFC - \xF2E2\xEEFF \xE2E8\xEDE0, \xEDE5 \xE1F3\xE4E5\xF2 \xD2E0\xE9ED\xEEFE \xE8E3\xF0E0. \xCCEE\xE6ED\xEE \xF1EA\xE0E7\xE0F2\xFC \xF7FC\xFE-\xF2EE \xF0EE\xEBFC, \xE5F1\xEBE8 \xF1E8\xEBFC\xEDEE \xF3E2\xE5F0\xE5ED\xFB \xE2 \xFDF2\xEEEC, \xEDEE \xE3EE\xE2EE\xF0E8\xF2FC \xF1E2\xEEFE - \xEDE5\xEBFC\xE7FF.",
				"\n* \xCDE5 \xEEF1\xEAEE\xF0E1\xEBFF\xE9F2\xE5 \xE4F0\xF3E3\xE8F5 \xE8E3\xF0EE\xEAEE\xE2. \xD0E0\xE7F0\xE5F8\xE5ED\xEE \xF8F3\xF2E8\xF2FC, \xEDEE \xE8F1\xEAEB\xFEF7\xE8F2\xE5EB\xFCED\xEE \xE2 \xE4F0\xF3E6\xE5F1\xEAEE\xEC \xEAEE\xEDF2\xE5EA\xF1F2\xE5. \xCDE8\xEAF2\xEE \xC2E0\xEC \xEDE5 \xE4EE\xE2E5\xF0E8\xF2F1\xFF, \xE5F1\xEBE8 \xE1F3\xE4E5\xF2E5 \xF0E0\xE7E1\xF0E0\xF1FB\xE2E0\xF2FC\xF1FF \xE6E5\xEBEE\xF7FC\xFE \xE1E5\xE7 \xEFF0\xE8F7\xE8ED.",
				"\n* \xD1F2\xEEFF\xF2FC \xE2 AFK - \xE2EE\xE5ED\xEDEE\xE5 \xEFF0\xE5F1\xF2F3\xEFEB\xE5ED\xE8E5. \xC5F1\xEBE8 \xE1F3\xE4E5\xF2E5 \xF1F2\xEEFF\xF2FC \xF1EB\xE8F8\xEAEE\xEC \xE4EE\xEBE3\xEE, \xEDE0 \xC2E0\xF1 \xF1E1\xF0EE\xF1FF\xF2F1\xFF \xE1EE\xECE1\xFB \xE8 \xF1EE\xF2F0\xF3F2 \xC2E0\xF1 \xE2 \xEFEE\xF0EE\xF8EE\xEA.",
				"\n* \xCDE5 \xECE5\xEDFF\xE9F2\xE5 \xEDE8\xEA \xE2EE \xE2F0\xE5EC\xFF \xF0E0\xF3ED\xE4E0, \xE1F3\xE4F3\xF7E8 \xECB8\xF0F2\xE2FB\xECE8. \xC8ED\xE0F7\xE5, \xC2E0\xF1 \xEAE8\xEAED\xE5F2 \xF1 \xF1E5\xF0E2\xE5F0\xE0. \xC2E0\xEC \xECEE\xE6ED\xEE \xE1F3\xE4E5\xF2 \xEFEE\xECE5\xEDFF\xF2FC \xE5E3\xEE, \xE1F3\xE4F3\xF7E8 \xE6E8\xE2FB\xEC. \xD2E0\xEAE6\xE5, \xECEE\xE6ED\xEE \xEFF0\xEEF1\xF2EE \xEFEE\xE4EE\xE6E4\xE0F2\xFC \xE4EE \xFDEA\xF0E0\xEDE0 \xF0E5\xE7F3\xEBFC\xF2E0\xF2EE\xE2, \xF7F2\xEEE1\xFB \xE1E5\xE7EE\xEFE0\xF1ED\xEE \xF1EC\xE5ED\xE8F2\xFC \xEDE8\xEA.",
				"\n\xCDE0\xF0F3\xF8E5\xEDE8\xE5 \xEEE4\xEDEE\xE3EE \xE8E7 \xFDF2\xE8F5 \xEFF0\xE0E2\xE8EB \xECEE\xE6E5\xF2 \xEAE0\xF0E0\xF2FC\xF1FF \xEAE8\xEAEE\xEC \xE8EB\xE8 \xE1E0\xEDEE\xEC \xEEF2 \xC0E4\xECE8\xEDE0! \xCFF0\xEEF1\xE8EC, \xEDE5 \xEDE0\xF0F3\xF8E0\xE9F2\xE5 \xE8F5 \xE8 \xE8E3\xF0E0\xE9F2\xE5 \xF7E5\xF1F2\xEDEE."
			},{
				"\7\xCFEE\xEBE5\xE7ED\xFBE5 \xF1EE\xE2E5\xF2FB\0\n",
				"\xCCFB \xF1EE\xE1F0\xE0EB\xE8 \xEDE5\xF1EA\xEEEB\xFCEA\xEE \xF1EE\xE2E5\xF2E8\xEAEE\xE2, \xEAEE\xF2EE\xF0FB\xE5 \xECEE\xE3F3\xF2 \xEFEE\xECEE\xF7FC \xC2E0\xEC \xEFF0\xE8 \xE8E3\xF0E5 \xE2 \xD2D3:",
				"\n* \xC5F1\xEBE8 \xF1EF\xEEF1\xEEE1\xEDEE\xF1F2\xE8 \xEFE5\xF0F1\xEEED\xE0E6\xE5E9 \xEEF2\xEAEB\xFEF7\xE5ED\xFB \xC0E4\xECE8\xEDEE\xEC, \xE7E0\xE6EC\xE8F2\xE5 \7SPIN\0, \xF7F2\xEEE1\xFB \xEDE0\xF7E0\xF2FC \xEAF0\xE0F1\xF2FC\xF1FF, \xEDE5 \xEEF1\xF2E0\xE2EB\xFFFF \xE7E0 \xF1EE\xE1EE\xE9 \xF1EB\xE5E4\xEEE2 \xE8 \xEDE5 \xF1EE\xE7E4\xE0E2\xE0FF \xF8F3\xECE0;",
				"\n* \xCAEE\xE3E4\xE0 \xC2FB \xEFEE\xE4E1\xB8F0\xE5F2\xE5 \4\xC8E7\xF3EC\xF0F3\xE4 \4\xD8E5\xF0E8\xF4E0\0, \xC2E0\xEC \xF1F2\xE0ED\xF3F2 \xE4EE\xF1F2\xF3EF\xEDFB \xE2F1\xE5 \xD0F3\xE6FC\xFF \xE8 \xEAEE\xEBFC\xF6E0, \xEAEE\xF2EE\xF0FB\xE5 \xC2FB \xEFEE\xE4EE\xE1F0\xE0EB\xE8 \xE4EE \xFDF2\xEEE3\xEE;",
				"\n* \xC2FB \xEFEE\xEBF3\xF7E0\xE5F2\xE5 3 \xF1E5\xEAF3\xEDE4\xFB \xE1E5\xF1F1\xECE5\xF0F2\xE8FF, \xE5F1\xEBE8 \xEFEE\xEFE0\xE4E0\xE5F2\xE5F1\xFC \xEDE0 \xF2E0\xEAE8\xE5 \xEFF0\xE5EF\xFFF2\xF1F2\xE2E8\xFF, \xEAE0\xEA \xEBE0\xE2E0, \xF8E8\xEFFB \xE8EB\xE8 \xEEE3\xEEED\xFC;",
				"\n* \xCFEE\xEFFB\xF2E0\xE9F2\xE5F1\xFC \xE3E4\xE5-\xEDE8\xE1F3\xE4FC \xF1EF\xF0FF\xF2E0\xF2FC\xF1FF. \xC8ED\xEEE3\xE4E0 \xFDF2\xEE \xEFEE\xECEE\xE3E0\xE5F2 \xE8E7\xE1E5\xE6E0\xF2FC \xEDE5\xEDF3\xE6ED\xEEE9 \xEFF3\xE1EB\xE8F7\xEDEE\xF1F2\xE8;",
				"\n* \xC5F1\xEBE8 \xC2E0\xF8E0 \xF0EE\xEBFC \xF0E0\xF1EA\xF0FB\xF2E0, \xC2FB \xECEE\xE6E5\xF2E5 \xEFEE\xECE5\xEDFF\xF2FC \xE8EC\xFF \xE8E3\xF0EE\xEAE0 \xE8/\xE8EB\xE8 \xEFEE\xECE5\xEDFF\xF2FC \xF6E2\xE5F2 \xF1E2\xEEE5\xE3EE \xEFE5\xF0F1\xEEED\xE0E6\xE0. \xD3F7\xF2E8\xF2E5, \xF7F2\xEE \1\xC2E0\xF8E5 \1\xEDEE\xE2EE\xE5 \1\xE8EC\xFF \1\xE1F3\xE4E5\xF2 \1\xE2E8\xE4ED\xEE \1\xE2 \1\xF7E0\xF2E5\0;",
				"\n* \xCDEE\xE6 \xEDE5 \xE1F3\xE4E5\xF2 \xE8E7\xE4E0\xE2E0\xF2FC \xE7E2\xF3EA\xE0 \xE0F2\xE0EA\xE8, \xE5F1\xEBE8 \xC2FB \xEAF0\xE0E4\xB8F2\xE5F1\xFC. \xD2E0\xEAE6\xE5, \xEAED\xEEEF\xEAE0 \7FIRENORMAL\0 \xEFEE\xE7E2\xEEEB\xFFE5\xF2 \xE2E5\xE7E4\xE5 \xE8F1\xEFEE\xEBFC\xE7EE\xE2E0\xF2FC \xCDEE\xE6, \xEFEE\xEAE0 \xC2E0\xF8E8 \xEAEE\xEBFC\xF6E0 \xEDE5 \xE7E0\xEAEE\xEDF7\xE0F2\xF1FF (\xD3 \3\xCDE5\xE2E8\xEDED\xFBF5\0 \xEDE5\xF2 \xEDEE\xE6E0)"
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
			"\x87Ty byl(-a) izbran(-a) \x82Geroem\x87. Spasi zhe Nevinnyh ot Ubiyts!"
		},["TEAMMATE_HIT"]={
			"Eto Vash naparnik. Bolshe ne streliayte po svoim.",
			"Vas udaril Vash naparnik. Dazhe ne dumayte emu mstit'."
		},["MURD_KILLED"]={
			"\x85Ubiytsa\x87",
			"\x80ustranyon"
		},["SHERI_KILLED"]={
			"\x84Sherif\x87",
			"\x80".."byl ubit! Naydite yego(yo)\x84 Izumrud\x80!",
			"\x80".."byl ubit!"
		},["HERO_KILLED"]={
			"\x82Geroy\x87",
			"\x80".."byl ubit!"
		},
		["SHREML_PICK"]="Kto-to podobral \x84Izumrud Sherifa\x80...",
		["INNO_HURT_PM"]={
			"\x87Ty ubil(-a) \x83Nevinnogo\x87! Uvolen(-a)! (Ty bolshe ne Sherif)",
			"\x82Geroi\x87 ne sozdany, chtob ubivat' \x83Nevinnyh\x87. Za eto budet otvetnaya smert'."
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
		["HUD_STUPID"]="\xD3E1\xE8F2\xFB \xF2F3\xEFEE\xF1F2\xFCFE", --Washej tupostiu
		["HUD_SCORESTAB"]={
			"\xC5F1\xEBE8 \xC2FB \xEDEE\xE2E8\xF7B8\xEA \xE2 \xFDF2\xEEEC \xF0E5\xE6E8\xECE5, \xEFF0\xEEEF\xE8F8\xE8F2\xE5",
			"\xE2 \xEAEE\xEDF1\xEEEB\xE8 \xEAEE\xECE0\xEDE4\xF3 \7MMHELP\0 \xE4EB\xFF",
			"\xEEE7\xEDE0\xEAEE\xECEB\xE5ED\xE8FF \xE8 \7MMLANG\0 \xE4EB\xFF \xF1EC\xE5ED\xFB",
			"\xFFE7\xFBEA\xE0 \xECEE\xE4E0",
			"",
			"",
			"\2\xD3E4\xE0F7\xEDEE\xE9 \xC2E0\xEC \xE8E3\xF0FB! ;)"
		},["HUD_ROLESALIVE"]={
			"\xD3E1\xE8E9\xF6", --Ubijc
			"\xD8E5\xF0E8\xF4EE\xE2", --Sherifow
			"\xCDE5\xE2E8\xEDED\xFBF5" --Niewinnych
		},["HUD_DEAD"]={
			"\xC2FB \15\xECE5\xF0F2\xE2FB", --Wy mertwy
			"\xC2FB \xEDE5 \xECEE\xE6E5\xF2E5 \xE2EE\xE7F0\xEEE6\xE4E0\xF2F1\xFF \xE8 \xEFE8\xF1E0\xF2FC \xF2E5\xEC,",
			"\xEAF2\xEE \xE5F9\xE5 \xE6E8\xE2"
		},["HUD_MIDJOIN"]={
			"\xC2FB \xEFF0\xE8F1\xEEE5\xE4E8\xEDE8\xEBE8\xF1FC \xEDE0 \xF1E5\xF0E5\xE4E8\xEDE5 \xF0E0\xF3ED\xE4E0. \xCFEE\xE6E0\xEBF3\xE9F1\xF2E0, \4\xEFEE\xE4EE\xE6E4\xE8F2\xE5 \xE4EE \xE5E3\xEE \xEEEA\xEEED\xF7E0\xEDE8\xFF\0",
		},["HUD_ALONE"]={
			"\xC4EB\xFF \xEDE0\xF7E0\xEBE0 \xE8E3\xF0FB \xF2F0\xE5E1\xF3E5\xF2F1\xFF \xECE8\xEDE8\xECF3\xEC\4 2 \xE8E3\xF0EE\xEAE0\0.",
			"\xCFEE\xE6E0\xEBF3\xE9F1\xF2E0, \xEFEE\xE4EE\xE6E4\xE8F2\xE5 \4\xE5F9\xB8 \xEEE4\xEDEE\xE3EE \xE8E3\xF0EE\xEAE0\0."
		},
		["HUD_SNEAKING"]="\xCFEE\xE4EA\xF0E0\xE4FB\xE2E0\xEDE8\xE5...",
		["HUD_SHOWDOWN"]="\xCFEE\xE5E4\xE8ED\xEEEA \xF1F3\xE4FC\xE1FB!",
		["HUD_MINIGAME"]={
			["PRESS"]="\xCDE0\xE6EC\xE8F2\xE5 \2CUSTOM3\0, \xF7F2\xEEE1\xFB",
			["LEAVE"]="\xE2FB\xE9F2\xE8",
			["CANCEL"]="\xEEF2\xECE5\xEDE8\xF2FC",
			["SPECTATE"]="\xEDE0\xE1EB\xFEE4\xE0F2\xFCE7\xE0",
			["DUEL"]="\xE4F3\xFDEB\xFCFE \xE2 \xECE8\xEDE8\xE8E3\xF0E5",
			["REQUEST"]="\xD1FB\xE3F0\xE0F2\xFC \xE2 \7PONG\0",
			["START"]="\xE7E0\xEFF3\xF1F2\xE8F2\xFC \xECE8\xEDE8 \xE8E3\xF0F3 \7SONIC RUN",
			["ACCEPT"]="\xEFF0\xE8ED\xFFF2\xFC \xE2FB\xE7EE\xE2 \xE2 \7PONG\0!",
			["WAIT"]="\xCEE6\xE8E4\xE0ED\xE8E5 \xEEF2\xE2E5\xF2E0 \xEEEF\xEEED\xE5ED\xF2E0...",
			["SPECTATING"]="\xCDE0\xE1EB\xFEE4\xE5ED\xE8E5 \xE7E0 \xE4F3\xFDEB\xFCFE...",
			["BORED"]="\xD1EA\xF3F7\xEDEE?",
			["PONGBALL"]="\xCDE0\xE1EB\xFEE4\xE0F2\xE5EB\xE8 \xECEE\xE3F3\xF2 \xECE5\xEDFF\xF2FC \xEDE0\xEFF0\xE0E2\xEBE5\xEDE8\xE5 \xECFF\xF7E0",
		},["HUD_YOU"]="\xC2DB",
		["HUD_WINNERS"]="\xCFEE\xE1E5\xE4E8\xF2E5\xEBE8:",
		["HUD_WON"]="\xEFEE\xE1E5\xE4E8\xEB!",
		["HUD_WIN"]={
			"\xCDC8\xD7DC\xDF!",
			"\5\xECE8\xF0ED\xFBE5",
			"\3\xD6DB\xC2C8\xCBDC\xCDDB\xC5"
		},["HUD_PAST"]="\xCFD0\xCED8\xCBCE\xC5",
		["HUD_FUTURE"]="\xC1D3\xC4D3\xD9C5\xC5"
	},["TR"]={ --Turkish by Mobillia
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="Mobillia",
		["MM"]="Murder Mystery",
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			"Kayd\xFDrmak \xFDE7\xFDn \7JUMP\0/\7SPIN\0 kullan\xFDn, sayfalar aras\xFD ge\xE7i\xFE yapmak \xFDE7\xFDn \7Next\0/\7Prev Weapon\0 kullan\xFDn",
			"HELP'den ayr\xFDlmak i\xE7in \7FIRE\0'a bas\xFDn"
		},["MMHELP"]={
			{
				"\7Murder Mystery'e ho\xFEgeldiniz!",
				"\7Pop\xFCler \xE7ok oyunculu oyunun SRB2 \7yorumu!\n",
				"Oyunun amac\xFD, di\xF0".."er herkesi\0 \xF6ld\xFC".."rmeden\3 \xF6nce t\xFCm \5Katiller\0'i bulup ortadan kald\xFDrmakt\xFDr. Bu oyun t\xFCr\xFC daha \xE7ok MATCH'a benzer, bu nedenle bu oyun t\xFCr\xFC i\xE7in ni\xFE".."an alma ve at\xFDFE becerilerinize ihtiyac\xFDn\xFDz olacak.",
				"Oynamaya ba\xFElamadan \xF6nce baz\xFD temel bilgileri \xF6\xF0renmeniz gerekiyor...",
				"\nHer t\xFCr\xFCn ba\xFEFDnda, oyun s\xFDras\xFDndaki g\xF6revinizin ne oldu\xF0unu tan\xFDmlayan bir \11Rol\0 alacaks\xFDn\xFDz. \xFEte alabilece\xF0iniz 3 ola\xFEFD \11Roller\0:",
				" * \5Katil\0 - Ger\xE7".."ek bir su\xE7lu. Herkesi \xF6ld\xFCrmek zorundalar, ancak sadece B\xFDE7".."ak ve K\xFDrmizi Y\xFCz\xFCklerle donat\xFDlm\xFDFElard\xFDr",
				" * \4\xDE".."erif\0  - G\xF6revleri, \5Katil(ler)\0'i bulmak ve ortadan kald\xFDrmakt\xFDr. \xDE".."erifler haritada bulunan her silah y\xFCz\xFCklerini kullanabilir;",
				" * \3Masum\0 - Tamamen silahs\xFDz siviller, \xF6ld\xFCr\xFClmekten ka\xE7FDnmalar\xFD gerekir ama ayn\xFD zamanda \5Katil\0'i bulmaya da yard\xFDmc\xFD olmalar\xFD gerekir.",
				"\nOynamaya ba\xFElamak i\xE7in gereken t\xFCm temel bilgiler bu kadar, daha fazla bilgi i\xE7in \xFEu komutlar\xFD kullanabilirsiniz:"
			},{
				"\7Oynan\xFDFE durumlar\xFD hakk\xFDnda\0\n",
				"Temel bilgilerde daha \xF6nce a\xE7FDkland\xFD\xF0FD gibi, \xFE".."eriflerin amac\xFD t\xFCm \5Katil(ler)\0'i ortadan kald\xFDrmakt\xFDr, ancak farkl\xFD oyun durumlar\xFD ortaya \xE7FDkabilir:",
				"\n* \xD6ld\xFCr\xFCl\xFCrseniz, \15 \xD6l\xFC\0 durumuna girersiniz. Bu durumdaki oyuncular yeniden do\xF0".."amaz veya hala hayatta olan oyuncularla k\xFCresel olarak konu\xFE".."amaz, mesajlar\xFD yaln\xFDzca di\xE7".."er \x8F \xF6l\xFC\x80 oyuncular taraf\xFDndan g\xF6r\xFClebilir.",
				"\15 \xD6l\xFC\0 iken hala hayatta olan oyuncularla konu\xFE".."amazs\xFDn/PM yapamazs\xFDn.",
				"Ayr\xFD".."ca\2 KEND\xDDN\xDDZ\xDD\0 \2YEN\xDD".."DEN \2ADLANDIRMAYA \2CALI\xDEMAYIN\0, bununla ilgili daha fazla ayr\xFDnt\xFD \7MMHELP BAD\0'de.",
				"\n* \4\xDE".."erif'in \0 g\xF6revi, etraftaki t\xFCm \5Katiller\0'i ortadan kald\xFDrmakt\xFDr, ancak kazara bir \3Masum\0'u vurmalar\xFD m\xFCmk\xFCnd\xFCr.",
				"Bu ger\xE7".."ekle\xFEFDrse, \4\xDE".."erif\0 bir \3Masum\0'a d\xF6n\xFC\xFE".."ecek ve rastgele bir \3Masum\0 sinsice rol\xFCn\xFC \xFCstlenecektir. Bir dahaki sefere birini \4\xDE".."erif\0 olarak vurmak istediginizde, o teti\xF0i \xE7".."ekmeden \xF6nce iki kez d\xFC\xFE\xFCn\xFCn!",
				"\n* Bir \5Katil\0, bir \4\xDE".."erif\0'i \xF6ld\xFCr\xFCrse ve hala \3Masum\0 hayatta kal\xFDrsa, \xDE".."erif \4\xDE".."erif'in Z\xFCmr\xFCt\xFC\0'i cesedinin yan\xFDna b\xFDrakacakt\xFDr.",
				"7 Kaos Z\xFCmr\xFCt\xFC'nun aksine, bu z\xFCmr\xFCt \2Kahraman\0 rol\xFCn\xFC onu alan herhangi bir \3Masum\0'a atayacak. \3Masumlar\0'dan biriyseniz, bu bir Kahraman olma ve herkesi \5Katil(ler)\0'den kurtarma \xFE".."ans\xFDn\xFDz!",
				"\2Kahraman\0 rol\xFC, \4\xDE".."erif\0'den baz\xFD detaylar d\xFDFE\xFDnda farkl\xFD de\xF0ildir, \xF6rne\xF0in \2Kahraman\0 bir \3Masum\0 \xF6ld\xFCrd\xFC\xF0\xFCnde, rol\xFC payla\xFEFDlmaz ve her ikisi de \xF6l\xFCr. Bir Kahraman \xF6l\xFCm\xFCnde \4\xDE".."erif\0'in Z\xFCmr\xFCt\xFC\x80 d\xFC\xFEmeyecektir",
				"\n* Oyuncu say\xFDs\xFDna ba\xF0l\xFD olarak, turdaki oyuncular aras\xFDnda birden fazla \5Katil\0 ve \4\xFE".."erif\0 olabilir. Orne\xF0in, 7 ve daha fazla oyuncudan ba\xFElayarak, \5Katiller\0 ve \4\xDE".."erifler\0'den \11Tak\xFDmlar\0 olu\xFEturulacakt\xFDr.",
				"\11Tak\xFDm arkada\xFElar\xFD\0, \7SAYTEAM\0 konsol komutuyla tak\xFDm sohbetlerinde birbirleriyle sohbet edebilir (SAYTEAM sohbet d\xFCgmesinin normal sohbetle ayn\xFD \xFE".."ekilde \xE7".."al\xFDFE".."aca\xF0FDn\xFD unutmay\xFDn).",
				"Bir \11Tak\xFDm arkada\xFEFD\0 ba\xFEka bir tak\xFDm arkada\xFEFDna vurursa, her ikisi de birbirlerini tan\xFDmalar\xFDn\xFD sa\xF0layacak ki\xFEiselle\xFEtirilmi\xFE bir uyar\xFD al\xFDr. Ba\xFEkalar\xFDn\xFDn 'arkada\xFE\xE7".."a' etkile\xFEiminizi g\xF6rebilecegini ve kim oldu\xF0unuzu anlayabilece\xF0ini unutmay\xFDn!"
			},{
				"\7Murder Mystery'de\0 \7yap\xFDlmas\xFD k\xF6t\xFC olan \7\xFE".."eyler\0\n",
				"Herhangi bir oyunun 1 numaral\xFD kural\xFD: \1Nazik \1ol\xFCn \1ve \1e\xF0lenin!\0 Bunun d\xFDFE\xFDnda...\0\n",
				"* \11Rol\0'\xFCn kendini \xFEFDmartmasi oyunu bir 'gizem' yapmaz, e\xF0".."er eminseniz ba\xFEkas\xFDn\xFDn rol\xFCn\xFC s\xF6yleyebilirsiniz, ancak kendinizinkini asla s\xF6ylemeyin.\n",
				"* Di\xF0".."er oyunculara hakaret etmeyin, \xFE".."akalara izin verilir, ancak yaln\xFDzca arkada\xFE\xE7".."a bir ruh hali i\xE7inde. Her oyuncuyu sebepsiz yere su\xE7larsan\xFDz kimse size g\xFCvenmez.\n",
				"* AFK olmak bir sava\xFE su\xE7udur. Bombalar at\xFDlacak ve \xE7ok uzun s\xFCre hareketsiz kal\xFDrsan\xFDz sunucudan otomatik olarak \xE7FDkars\xFDn\xFDz.\n",
				"* Ol\xFCyken bir tur s\xFDras\xFDnda kendinizi yeniden adland\xFDrmay\xFDn, bunu yapmak sizi sunucudan atacakt\xFDr. Hayattaysan\xFDz yeniden adland\xFDrabilirsiniz. Aran\xFDn g\xFCvenli bir \xFE".."ekilde yeniden adland\xFDr\xFDlmas\xFDn\xFD bekleyin.\n",
				"Bu kurallardan birini ihlal etmek, oyundan at\xFDlma veya baz\xFD durumlarda Y\xF6netici taraf\xFDndan yasaklanma ile sonu\xE7lanabilir! L\xFCtfen onlar\xFD k\xFDrmay\xFDn ve adil oynay\xFDn."
			},{
				"\7Faydal\xFD ipu\xE7lar\xFD\0\n",
				"MM'deki oyununuz s\xFDrasinda size yard\xFDmc\xFD olabilecek baz\xFD ipu\xE7lar\xFD toplad\xFDk:",
				"\n* Karakter yetenekleri y\xF6netici taraf\xFDndan devre d\xFDFE\xFD b\xFDrak\xFDl\xFDrsa, iz birakmadan veya g\xFCr\xFClt\xFC yapmadan gizlice dola\xFEmak i\xE7in \2SPIN\0 tu\xFEuna ba\xFEFDn;",
				"\n* \4\xDE".."erif'in Z\xFCmr\xFCt\xFC\0'n\xFC ald\xFD\xF0FDn\xFDzda, \xF6nceden toplad\xFD\xF0FDn\xFDz t\xFCm silahlara ve y\xFCz\xFCklere eri\xFE".."ebileceksiniz;",
				"\n* \7SAYTEAM\0 komutunu kullanarak \11Tak\xFDm\0'\xFDn\xFDz\xFDn kim oldu\xF0unu bulmak, onlar\xFD vurmaktan ka\xE7FDnman\xFDz\xFD ve yanl\xFDFEl\xFDkla rol\xFCn\xFCz\xFC ortaya \xE7FDkarman\xFDz\xFD sa\xF0layaca\xF0FD i\xE7in yard\xFDmc\xFD olacakt\xFDr;",
				"\n* 3 saniyeli\xF0ine yenilmezlik kazanmak i\xE7in lav, sivri u\xE7lar ve ate\xFE gibi engellerden zarar alabilirsiniz;",
				"\n* Haritada saklanacak bir yer aramaya \xE7".."al\xFDFE\xFDn. Bazen istenmeyen tan\xFDt\xFDmlardan kurtulmaya yard\xFDmc\xFD olur;",
				"\n* Rol\xFCn\xFCz s\xFDzd\xFDr\xFDl\xFDrsa, kendinizi yeniden adland\xFDrabilir ve/veya ten rengini de\xF0i\xFEtirebilirsiniz. \1Yeniden \1adland\xFDrman\xFDz\xFDn \1sohbette \1g\xF6sterilece\xF0ini \1unutmay\xFDn\0;",
				"\n* Gizlice girerseniz b\xFDE7".."ak sald\xFDr\xFD sesi \xE7FDkarmaz. Ayr\xFD".."ca,\2 FIRENORMAL\0 d\xFC\xF0mesi, y\xFCz\xFCkleriniz oldu\xF0u s\xFCrece B\xFDE7".."a\xF0FD her yerde kullanman\xFDza izin verir (Masumlar\xFDn b\xFDE7".."a\xF0FD yoktur)"
			}
		},["MMLANG"]={
			"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola sunu yazarak degistirebilirsiniz: \x87MMLANG [dil]",
			"Murder Mystery icin kisisel dil \x82Turkce olarak ayarlanmistir"
		},["ROLE_GET"]={
			"Sen \x85Katilsin\x80! \x85Herkesi oldur!",
			"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.",
			"Sen bir \x83Masum\x80'sun! Saklan ve sorusturmaya yardim et."
		},["NEWROLE_GET"]={
			"\x87Hayat rastgele karar verdi \x85Katil\x87.\x85 Simdi git herkesi oldur!",
			"\x87Senin rolun \x84Serif\x87! Git ve\x84 tum Katilleri ortadan kaldir\x87!",
			"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!"
		},["TEAMMATE_HIT"]={
			"Bu oyuncu senin takim arkadasin. Sizden intikam almalarini istemediginiz icin bir dahaki sefere takim arkadaslariniza vurmayin.",
			"Bir takim arkadasiniz size vurdu. Ondan intikam almayi planlamayin."
		},["MURD_KILLED"]={
			"\x85Katil\x87",
			"\x80olduruldu"
		},["SHERI_KILLED"]={
			"\x84Serif\x87",
			"\x80olduruldu! Onun\x84 Zumrut\x80'unu bulun!",
			"\x80olduruldu!"
		},["HERO_KILLED"]={
			"\x82Kahraman\x87",
			"\x80olduruldu!"
		},["SHREML_PICK"]="Birisi \x84Serif'in Zumrut\x80'unu aldi...",
		["INNO_HURT_PM"]={
			"\x87Sen oldurdun bir \x83Masum\x87! Kovuldun. (Artik bir serif degilsin)",
			"\x82Kahramanlar\x87, \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin olum cezasi aldiniz."
		},["INNO_HURT"]={
			"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
			"\x82Kahraman\x80 , bir \x83Masum\x80'u oldurdu. Simdi ikisi de olu yatiyor. \x82Yaziklar olsun\x80"
		},["ONE_LEFT"]={
			"\x85Katillerden biri\x80 cikti!",
			"\x84Seriflerden biri\x80 cikti!!!",
			"\x82Kahramanlardan biri\x80 bizi terk etti!"
		},["LAST_LEFT"]={
			"Son \x85Katil\x80 cikti!",
			"Son \x84Serif\x80 cikti!",
			"Son \x82Kahraman\x80 cikti!"
		},["REPLACE_LEFT"]={
			"\x85Katil\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"\x84Serif\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"Bir \x82Kahraman\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!"
		},["ENDROUND"]={
			"Herkes oldu. \x85Katiller\x80 kazandi!",
			"Tum \x85Katiller\x80 olduruldu! \x83 Siviller\x80 kazandi!",
			"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84Serif\x80'e yaziklar olsun",
			"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
			"\x83 Masumlarin savunuculari\x80 oldu. \x85Katiller\x80 kazandi!"
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
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1F",
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F",
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
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1F",
			"\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F",
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
		["HUD_KILLBY"]="Taraf\xFDndan \xF6ld\xFCr\xFCld\xFC",
		["HUD_STUPID"]="senin aptall\xFD\xF0FDn",
		["HUD_SCORESTAB"]={
			"Burada puan yok! Ama alttaki saya\xE7lar",
			"soru\xFEturmada size yard\xFDmc\xFD olabilir!",
			"",
			"Oyun t\xFCr\xFCnde yeniyseniz konsola",
			"\7MMHELP\0 yaz\xFDn.",
			"",
			"",
			"\2\xDDyi e\xF0lenceler!"
		},["HUD_ROLESALIVE"]={
			"Katiller",
			"\xDE".."erifler",
			"Masumlar"
		},["HUD_DEAD"]={
			"\15\xD6ld\xFCn",
			"Yeninden do\xF0".."amaz veya konu\xFE".."amazs\xFD".."n",
			"\xF6lmemi\xFE insanlar ile"
		},["HUD_MIDJOIN"]={
			"\4tur ortas\xFDnda\0 kat\xFDld\xFDn\xFDz, l\xFCtfen bu turun bitmesini bekleyin."
		},["HUD_ALONE"]={
			"Oyunun ba\xFElamas\xFD i\xE7in en az \4".."2 oyuncu",
			"gereklidir, L\xFCtfen \4bir ki\xFEinin\0 daha",
			"gelmesini bekleyin"
		},["HUD_SNEAKING"]="Sinsice...",
		["HUD_SHOWDOWN"]="Hesapla\xFEma d\xFC".."ellosu!",
		["HUD_MINIGAME"]={
			["PRESS"]="\2 CUSTOM3\0'e bas ve",
			["LEAVE"]="ayr\xFDl",
			["CANCEL"]="iptal",
			["SPECTATE"]="seyret",
			["DUEL"]="bir mini oyun d\xFC".."ellosu",
			["REQUEST"]="bir \7PONG\0 oyunu talep edin",
			["START"]="bir \7\"SONIC RUN\"\0 oyunu ba\xFElat",
			["ACCEPT"]="\7PONG\0 meydan okumas\xFDn\xFD kabul et!",
			["WAIT"]="Rakibin kabul etmesi bekleniyor...",
			["SPECTATING"]="Bir d\xFC".."ello izleniyor...",
			["BORED"]="S\xFDkl\xFDnd\xFDn m\xFD?",
			["PONGBALL"]="Seyirciler topun y\xF6n\xFCn\xFC de\xF0i\xFEtirebilir"
		},["HUD_YOU"]="SEN",
		["HUD_WINNERS"]="Kazananlar:",
		["HUD_WON"]="Kazand\xFD!",
		["HUD_WIN"]={
			"BERABERE!",
			"\5KAT\xDDLLER",
			"\3MASUMLAR"
		}
	},["UA"]={ -- Ukrainian by LeonardoTheMutant
		--text made entirely from HEX characters is harder to maintain than you think, especially when you come back to edit it
		["VERSION"]="1.0-ALPHA",
		["AUTHOR"]="LeonardoTheMutant",
		["CHARSET"]="1251C",
		["NONASCII"]=true, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
		["MM"]="\xD2E0\xBAEC\xEDE8\xF6FF \xC2E1\xE8E2\xF1F2\xE2E0", --Tajemnycia Wbywstwa
		["MMHELP_CMD"]={
			"\xCDE0\xF2E8\xF1ED\xB3F2\xFC \7JUMP\0/\7SPIN\0 \xE4EB\xFF \xEFF0\xEEEA\xF0F3\xF7F3\xE2E0\xEDED\xFF, \7Next\0/\7Prev Weapon\0 \xE4EB\xFF \xE7EC\xB3ED\xE8 \xF1F2\xEEF0\xB3ED\xEAE8",
			"\7FIRE\0 - \xEFEE\xEAE8\xEDF3\xF2E8 \xF6E5 \xECE5\xEDFE"
		},["MMHELP"]={
			{
				"\7\xCBE0\xF1EA\xEEE2\xE0 \xEFF0\xEEF1\xE8EC\xEE \xE4EE \xD2E0\xBAEC\xEDE8\xF6B3 \xC2E1\xE8E2\xF1F2\xE2E0!\0\n",
				"\xD6B3\xEBFC \xF6B3\xBABF \xE3F0\xE8 \xE4F3\xE6E5 \xEFF0\xEEF1\xF2E0: \xE7F0\xEEE7\xF3EC\xB3F2\xE8 \xF5F2\xEE \xE7 \xE3F0\xE0E2\xF6B3\xE2 \xBA \xC2E1\xE8E2\xF6E5\xFE \xB3 \xE5EB\xB3EC\xB3ED\xF3E2\xE0F2\xE8 \xF6FC\xEEE3\xEE \xE3F0\xE0E2\xF6FF, \xEFEE\xEAE8 \xEDE5 \xF1F2\xE0EB\xEE \xE7E0\xEFB3\xE7ED\xEE. \xC2E0\xF2F0\xEE \xF0EE\xE7F3\xECB3\xF2E8, \xF9EE \xF6E5\xE9 \xB3E3\xF0EE\xE2E8\xE9 \xF0E5\xE6E8\xEC \xE4F3\xE6E5 \xEFEE\xE4B3\xE1ED\xE8E9 \xE4EE \xF0E5\xE6E8\xECF3 \xCCC0\xD2D7, \xF2EE\xECF3 \xEEEA\xF0B3\xEC \xE3EE\xF1F2\xF0EE\xE3EE \xF0EE\xE7F3\xECF3 \xF2F3\xF2 \xEFEE\xF2F0\xB3E1\xEDB3 \xEDE0\xE2E8\xF7EA\xE8 \xEFF0\xE8F6\xB3EB\xFEE2\xE0ED\xEDFF \xB3 \xF8E2\xE8E4\xEAE0 \xF0E5\xE0EA\xF6B3\xFF.",
				"\n\xD3 \xF6B3\xE9 \xE3F0\xB3 \xF2E0\xEAEE\xE6 \xECEE\xE6ED\xE0 \xEEF2\xF0E8\xECE0\xF2E8 \xEEE4\xEDF3 \xE7 \xE4E5\xEAB3\xEBFC\xEAEE\xF5 \xF0EE\xEBE5\xE9 \xEDE0 \xEFEE\xF7E0\xF2EA\xF3 \xEAEE\xE6ED\xEEE3\xEE \xF0E0\xF3ED\xE4F3:",
				"\n * \5\xC2E1\xE8E2\xF6FF\0 - \xEEE4\xE8ED \xE7 \xE3EE\xEBEE\xE2ED\xE8F5 \xEFE5\xF0F1\xEEED\xE0E6\xB3E2 \xE3F0\xE8. \xC3F0\xE0E2\xE5F6\xFC \xE7 \xF6B3\xBAFE \xF0EE\xEBEB\xFE \xECF3\xF1E8\xF2FC \xE2E1\xE8F2\xE8 \xE0E1\xF1EE\xEBFE\xF2ED\xEE \xEAEE\xE6ED\xEEE3\xEE \xE0E1\xEE \xE7ED\xE8F9\xE8F2\xE8 \xE2F1\xB3 \xECEE\xE6EB\xE8E2\xEEF1\xF2B3 \xEFEE\xE2F1\xF2E0\xEDED\xFF \xD8E5\xF0E8\xF4B3\xE2;",
				"\n * \4\xD8E5\xF0E8\xF4\0 - \xE4F3\xE6E5 \xE2E0\xE6EB\xE8E2\xE8E9 \xEFE5\xF0F1\xEEED\xE0E6. \xD8E5\xF0E8\xF4E8 \xECF3\xF1FF\xF2FC \xE7ED\xE0E9\xF2E8 \xB3 \xE7\xE0F5\xE8F1\xF2E8\xF2E8 \xEDE5\xE2E8\xEDED\xE8F5 \xE2B3\xE4 \xE3E5\xEDEE\xF6E8\xE4F3 \xE2E1\xE8E2\xF6FC \xE2E8\xEAEE\xF0E8\xF1F2\xEEE2\xF3FE\xF7B3 \xE2F1\xB3 \xECEE\xE6EB\xE8E2\xB3 \xECE5\xF2EE\xE4E8 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xFF. \xDFEA\xF9EE \xE2EE\xEDE8 \xEFEE\xECE8\xEBFF\xF2F1\xFF \xE7 \xE2E1\xE8E2\xF6E5\xFE \xB3 \xE2E1'\xFEF2\xFC \xEDE5\xE2E8\xEDED\xEEE3\xEE \xE3F0\xE0E2\xF6FF \xBFF5 \xEEF4\xB3F6\xB3E0\xEBFC\xEDEE \xEBB3\xEAE2\xB3E4\xF3FE\xF2FC \xE2B3\xE4 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDFF;",
				"\n * \3\xCDE5\xE2E8\xEDED\xE8E9(-\xE0)\0 - \xF6E8\xE2B3\xEBFC\xEDE0 \xEEF1\xEEE1\xE0. \xD2E0\xEAE8\xEC \xE3F0\xE0E2\xF6FF\xEC \xFFEA\xEDE0\xE9F8\xE2E8\xE4F8\xE5 \xEFEE\xF2F0\xB3E1\xEDEE \xF1F5\xEEE2\xE0F2\xE8F1\xFF \xE2B3\xE4 \xC2E1\xE8E2\xF6FC, \xE0 \xE2E6\xE5 \xEFEE\xF2B3\xEC \xECEE\xE6F3\xF2FC \xE4EE\xEFEE\xECEE\xE3F2\xE8 \xD8E5\xF0E8\xF4E0\xEC \xE7 \xF0EE\xF1EB\xB3E4\xF3E2\xE0ED\xEDFF\xEC;",
				"\n\1\xD9E5 \xEEE4\xEDE0 \xE2E0\xE6EB\xE8E2\xE0 \xE4E5\xF2E0\xEBFC\0 - \xEFEE\xEFE0\xE4E0\xEDED\xFF \xEAB3\xEBFC\xF6FF \xE2 \xE3F0\xE0E2\xF6FF \xBA \xECEE\xECE5\xEDF2\xE0EB\xFCED\xEEFE \15\xF1EC\xE5F0\xF2F2\xFE\0 \xE1E5\xE7 \xECEE\xE6EB\xE8E2\xEEF1\xF2B3 \xE2B3\xE4ED\xEEE2\xEBE5\xEDED\xFF, \xF2EE\xECF3 \xEEE1\xE5F0\xB3E3\xE0ED\xEDFF \xF1E2\xEEE3\xEE \xE6E8\xF2F2\xFF \xF2F3\xF2 \xBA \xE4F3\xE6E5 \xE2E0\xE6EB\xE8E8\xEC.",
				"\xD6E5 \xF3F1\xFF \xB3ED\xF4EE\xF0EC\xE0F6\xB3FF \xEFEE\xF2F0\xB3E1\xEDE0 \xE4EB\xFF \xF0EE\xE7F3\xECB3\xEDED\xFF \xEEF1\xEDEE\xE2 \xE3F0\xE8. \xC4EB\xFF \xEFEE\xE3EB\xE8E1\xEBE5\xEDEE\xE3EE \xE2E8\xE2F7\xE5ED\xEDFF \xE0F1\xEFE5\xEAF2\xB3E2 \xB3 \xEFF0\xE0E2\xE8EB \xEFF0\xEEF1\xE8EC\xEE \xEFF0\xEEF7\xE8F2\xE0F2\xE8 \xF6E5\xE9 \xEFEE\xECB3\xF7ED\xE8EA \xE4EE \xEAB3\xEDF6\xFF."
			},{
				"\7\xC4E5\xF2E0\xEBFC\xEDB3\xF8E5 \xEFF0\xEE \xB3E3\xF0EE\xE2E8\xE9 \xEFF0\xEEF6\xE5F1\0",
				"\n* \xCAEE\xEBE8 \xE2 \xE3F0\xE0E2\xF6FF \xEFEE\xEFE0\xE4E0\xBA \xEAB3\xEBFC\xF6E5 \xF1F3\xEFF0\xEEF2\xE8E2\xEDE8\xEAE0 \xE2B3\xED \xECE8\xF2F2\xBAE2\xEE \xF1F2\xE0BA \15\xECE5\xF0F2\xE2E8\xEC\0. \xC3F0\xE0E2\xE5F6\xFC \xF3 \xF6FC\xEEEC\xF3 \xF1F2\xE0ED\xB3 \xEDE5 \xECEE\xE6E5 \xE2B3\xE4F0\xEEE4\xE6F3\xE2E0\xF2E8\xF1FF \xF2E0 \xE3EE\xE2EE\xF0E8\xF2E8 \xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2.",
				"\xD1EF\xB3EB\xEAF3\xE2E0\xEDED\xFF \xECEE\xE6EB\xE8E2\xE5 \xF2B3\xEBFC\xEAE8 \xE7 \xB3ED\xF8E8\xECE8 \xECE5\xF0F2\xE2E8\xECE8 \xE3F0\xE0E2\xF6FF\xECE8. \xCFE5\xF0F1\xEEED\xE0EB\xFCED\xB3 \xEFEE\xE2B3\xE4EE\xECEB\xE5ED\xEDFF \xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2 \xF2E5\xE6 \xEDE5 \xBA \xEDE5\xECEE\xE6EB\xE8E2\xE8EC\xE8.",
				"\2\xCDC5 \xCDC0\xCCC0\xC3C0\xC9D2\xC5D1\xDF \xC7CC\xB2CD\xC8D2\xC8 \xD1C2\xCEAA \xB2'\xCCDF \xC3D0\xC0C2\xD6DF \2\xD3 \2\xCCC5\xD0D2\xC2CE\xCCD3 \2\xD1D2\xC0CD\xB2!\0",
				"\n* \4\xD8E5\xF0E8\xF4E8\0 \xECEE\xE6F3\xF2FC \xECEE\xECE8\xEBE8\xF2E8\xF1FF \xF3 \xF1E2\xEEBA\xECF3 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xB3 \xB3 \xE2E1\xE8F2\xE8 \3\xEDE5\xE2E8\xEDED\xF3 \3\xEEF1\xEEE1\xF3\0 - \xE0EB\xE5 \xF6E5 \xEDE5 \xEEE7\xEDE0\xF7E0\xBA \xEAB3\xEDE5\xF6FC \xE3F0\xE8. \xC2E8\xEDF3\xE2E0\xF2E5\xF2FC \xE7E3\xF3E1\xE8F2\xFC \xF1E2\xEEFE \xEFEE\xF1E0\xE4F3 \xF8E5\xF0E8\xF4E0, \xEDE0\xF2EE\xECB3\xF1F2\xFC \xB3ED\xF8E0, \3\xE2E8\xEFE0\xE4EA\xEEE2\xE0\0, \xEDE5\xE2E8\xEDED\xE0 \xEEF1\xEEE1\xE0 \xEEF2\xF0E8\xECE0\xBA \xBFBF.",
				"\xC2E0\xF0F2\xEE \xE7E0\xE2E6\xE4E8 \xEFEE\xE4F3\xECE0\xF2E8 \xF2F0\xE8F7\xB3 \xEFE5\xF0F8 \xEDB3\xE6 \xE2E8 \xE7F0\xEEE1\xE8F2\xE5 \xE2E8\xF1ED\xEEE2\xEAE8, \xE1EE \xEDE5\xEFF0\xE0E2\xE8EB\xFCED\xE5 \xF0B3\xF8E5\xEDED\xFF \xECEE\xE6E5 \xE4EE\xE2E5\xF1F2\xE8 \xE4EE \xEAE0\xF2E0\xF1F2\xF0EE\xF4E8!",
				"\n* \xC2 \xEFF0\xE8EF\xE0E4\xEAF3 \xE2E1\xE8E2\xF1F2\xE2E0 \4\xF8E5\xF0E8\xF4E0\0 \xEDE5\xE2E8\xEDED\xB3 \xECEE\xE6F3\xF2FC \xE7ED\xE0E9\xF2E8 \4\xD1EC\xE0F0\xE0E3\xE4 \4\xD8E5\xF0E8\xF4E0\0 \xE1B3\xEBFF \xE9EE\xE3EE \xF2F0\xF3EF\xE0. \xCDE0 \xE2B3\xE4EC\xB3ED\xF3 \xE2B3\xE4 \xD1EC\xE0F0\xE0E3\xE4B3\xE2 \xD5E0\xEEF1\xF3, \xF6E5\xE9 \xF1EC\xE0F0\xE0E3\xE4 \xE4E0\xBA \xF0EE\xEBFC \2\xC3E5\xF0EE\xFF\0 \xEFE5\xF0F8\xEEEC\xF3 \xF5F2\xEE \xEFB3\xE4E1\xE5F0\xE5 \xE9EE\xE3EE.",
				"\2\xC3E5\xF0EE\xE9\0 \xE2B3\xE4F0\xB3E7\xEDFF\xBAF2\xFCF1\xFF \xE2B3\xE4 \xF0EE\xEBB3 \4\xD8E5\xF0E8\xF4E0\0 \xF2E8\xEC, \xF9EE \xEFF0\xE8 \xE7E0\xE3E8\xE1E5\xEBB3 \2\xC3E5\xF0EE\xE9\0 \xEDE5 \xE7E0\xEBE8\xF8E0\xBA \xEFB3\xF1EB\xFF \xF1E5\xE1E5 \xD1EC\xE0F0\xE0E3\xE4. \xD2E0\xEAEE\xE6 \xFFEA\xF9EE \2\xC3E5\xF0EE\xE9\0 \xE2E1'\xBA \3\xEDE5\xE2E8\xEDED\xEEE3\xEE\0 \xE3F0\xE0E2\xF6FF \xF2EE \xEEE1\xEEBA \xE7E0\xE3E8\xEDF3\xF2FC.",
				"\n* \xC3F0\xE0E2\xF6B3\xE2 \xE7 \xF0EE\xEBFF\xECE8 \5\xC2E1\xE8E2\xF6FC\0 \xF2E0 \4\xD8E5\xF0E8\xF4B3\xE2\0 \xECEE\xE6E5 \xE1F3\xF2E8 \xE4E5\xEAB3\xEBFC\xEAE0, \xE2 \xE7E0\xEBE5\xE6ED\xEEF1\xF2B3 \xE2B3\xE4 \xEAB3\xEBFC\xEAEE\xF1F2\xB3 \xEBFE\xE4E5\xE9 \xEEED\xEBE0\xE9ED. \xC3F0\xE0E2\xF6B3 \xFFEA\xB3 \xECE0\xFEF2\xFC \xEEE4\xEDF3 \xB3 \xF2F3 \xF1E0\xECF3 \xF0EE\xEBFC \xF3F2\xE2EE\xF0FE\xFEF2\xFC \8\xEAEE\xECE0\xEDE4\xF3\0 (\3\xEDE5\xE2E8\xEDED\xB3\0 \xEDE5 \xE2E2\xE0E6\xE0FE\xF2FC\xF1FF \xE7E0 \xEAEE\xECE0\xEDE4\xF3).",
				"\8\xCDE0\xEFE0\xF0ED\xE8EA\xE8 \xEFEE \xEAEE\xECE0\xEDE4\xB3\0 \xECEE\xE6F3\xF2FC \xF1EF\xB3EB\xEAF3\xE2E0\xF2E8\xF1FF \xECB3\xE6 \xF1EE\xE1EE\xFE \xE7E0 \xE4EE\xEFEE\xECEE\xE3EE\xFE \xCAEE\xECE0\xEDE4\xEDEE\xE3EE \xD7E0\xF2F3 \xFFEA\xE8E9 \xE4EE\xF1F2\xF3EF\xEDE8\xE9 \xF7E5\xF0E5\xE7 \xEAEE\xEDF1\xEEEB\xFCED\xF3 \xEAEE\xECE0\xEDE4\xF3 \7SAYTEAM\0."
			},{
				"\7\xCFEE\xE3E0\xEDB3 \xF0E5\xF7B3 \xE2 \xD2C2\0",
				"\n* \xC2E8\xEAE0\xE7F3\xE2E0\xEDED\xFF \xF1E2\xEEBA\xBF \xF0EE\xEBB3 - \xF0F3\xE9ED\xE0F6\xB3FF \xD2E0\xBAEC\xEDE8\xF6B3 \xF3 \"\xD2E0\xBAEC\xEDE8\xF6B3 \xC2E1\xE8E2\xF1F2\xE2E0\". \xD0EE\xE7EA\xE0E7\xF3E2\xE0F2\xE8 \xEFF0\xEE \xF1E2\xEEFE \xF0EE\xEBFC \xF3F1\xB3EC \xB3ED\xF8E8\xEC \xF1F3\xE2EE\xF0EE \xE7E0\xE1EE\xF0EE\xEDE5\xEDEE. \xCCEE\xE6ED\xE0 \xEBE8\xF8E5 \xE3EE\xE2EE\xF0E8\xF2E8 \xEFF0\xEE \xF0EE\xEBB3 \xB3ED\xF8E8\xF5 \xE3F0\xE0E2\xF6B3\xE2 \xEAEE\xEBE8 \xE9E4\xE5F2\xFCF1\xFF \xEFF0\xEE \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xFF;",
				"\n* \xCDE5 \xEDE0\xE1F0\xE8E4\xE0E9\xF2E5 \xB3ED\xF8E8\xEC \xE3F0\xE0E2\xF6FF\xEC \xF2E0 \"\xEDE5 \xF1F3\xE4B3\xF2FC \xEFEE \xEEE1\xEAEB\xE0E4\xE8ED\xF6B3\". \xCDB3\xF5F2\xEE \xEDE5 \xE1F3\xE4E5 \xE2E0\xEC \xE2B3\xF0E8\xF2E8 \xEAEE\xEBE8 \xE2E8 \xE1F3\xE4E5\xF2E5 \xE7E2\xE8ED\xF3E2\xE0F7\xF3E2\xE0F2\xE8 \xF3F1\xB3F5 \xF3 \xE2E1\xE8E2\xF1F2\xE2B3 \xF2E0/\xE0E1\xEE \xEEE1\xF0E0\xE6E0\xF2E8;",
				"\n* \xC1E5\xE7E0\xEAF2\xE8E2\xEDB3\xF1F2\xFC (AFK) \xE4F3\xE6E5 \xF1E8\xEBFC\xEDEE \xE2EF\xEBE8\xE2E0\xBA \xEDE0 \xEFEE\xE4B3\xBF \xE3F0\xE8. \xC2 \xE4E5\xFFEA\xE8F5 \xE2E8\xEFE0\xE4EA\xE0F5 \xE1E5\xE7E0\xEAF2\xE8E2\xEDB3\xF1F2\xFC \xEDE0\xE2B3\xF2FC \xEAE0\xF0E0\xBAF2\xFCF1\xFF \xE2E8\xE6E5\xEDE5\xEDED\xFFEC \xE7 \xE3F0\xE8;",
				"\n* \xC7EC\xB3ED\xE0 \xB3EC\xE5ED\xB3 \xE3F0\xE0E2\xF6FF \xF3 \xECE5\xF0F2\xE2EE\xECF3 \xF1F2\xE0ED\xB3 \xE2E2\xE0E6\xE0BA\xF2FC\xF1FF \xF7B3\xF2EE\xEC \xB3 \xEAE0\xF0E0\xBAF2\xFCF1\xFF \xE2E8\xE6E5\xEDE5\xEDED\xFFEC \xE7 \xE3F0\xE8 (\xE1EE \xECEE\xE6ED\xE0 \xEFE5\xF0E5\xE4E0\xF2E8 \xB3ED\xF4EE\xF0EC\xE0F6\xB3FE \xE6E8\xE2E8\xEC \xE3F0\xE0E2\xF6FF\xEC). \xC0E1\xE8 \xE1E5\xE7EF\xE5F7\xEDEE \xE7EC\xB3ED\xE8F2\xE8 \xB3EC'\xFF \xE2E0\xF0F2\xEE \xF1EF\xE5F0\xF8F3 \xE2E8\xE9F2\xE8 \xE7 \xE3F0\xE8, \xE7EC\xB3ED\xE8F2\xE8 \xB3EC'\xFF, \xE0 \xE2E6\xE5 \xEFEE\xF2B3\xEC \xE7ED\xEEE2\xF3 \xE7E0\xE9F2\xE8 \xF3 \xE3F0\xF3.",
				"\n\6\xCFEE\xF0F3\xF8E5\xEDED\xFF \xEEE4\xEDEE\xE3EE \xE7 \xF6FC\xEEE3\xEE \xEFF0\xE0E2\xE8EB \xEFF0\xE8E7\xE2EE\xE4E8\xF2FC \xE4EE \xE2E8\xE6E5\xEDE5\xEDED\xFF (kick) \xE0E1\xEE \6\xE1E0\xEDF3 \xE2B3\xE4 \xC0E4\xECB3\xEDB3\xF1F2\xF0E0\xF2EE\xF0B3\xE2 \xE3F0\xE8. \xC1F3\xE4FC \xEBE0\xF1EA\xE0, \xE3F0\xE0E9\xF2E5 \xF7E5\xF1ED\xEE \xB3 \xEDE5 \xF0F3\xE9ED\xF3E9\xF2E5 \xB3ED\xF8E8\xEC \"\xF2E0\xBAEC\xEDE8\xF6B3\" \xE3F0\xE8!"
			},{
				"\7\xD1EF\xE8F1\xEEEA \xEFEE\xF0E0\xE4\0\n",
				"\xCCE8 \xE7B3\xE1F0\xE0EB\xE8 \xF2F3\xF2 \xE4EB\xFF \xE2E0\xF1 \xE4E5\xEAB3\xEBFC\xEAE0 \xEFEE\xF0E0\xE4 \xFFEA\xB3 \xECEE\xE6F3\xF2FC \xE4EE\xEFEE\xECEE\xE3F2\xE8 \xE2E0\xEC \xF3 \xE2E0\xF8EE\xECF3 \xF0EE\xE7F1\xEBB3\xE4F3\xE2E0\xEDED\xB3:",
				"\n* \xC2 \xE7E0\xEBE5\xE6ED\xEEF1\xF2B3 \xE2B3\xE4 \xEFE0\xF0E0\xECE5\xF2F0\xB3E2 \xE3F0\xE8 \xE2E8\xF1F2\xE0E2\xEBE5\xEDB3 \xC0E4\xECB3\xEDB3\xF1F2\xF0E0\xF2EE\xF0EE\xEC \xECEE\xE6ED\xE0 \xE7E0\xF2E8\xF1ED\xF3F2\xE8 \xEAEB\xE0E2\xB3F8\xF3 \7SPIN\0 \xE4EB\xFF \xEFB3\xE4EA\xF0E0\xE4E0\xEDED\xFF. \xCFB3\xE4EA\xF0E0\xE4E0\xEDED\xFF \xE4EE\xE7E2\xEEEB\xFFBA \xE2E0\xEC \xF5EE\xE4E8\xF2E8 \xEDE0\xE2EA\xEEEB\xEE \xE1E5\xE7 \xF8F3\xECF3 \xF2E0 \xF1EB\xB3E4\xB3E2 (\xE0 \xF2E0\xEAEE\xE6 \xB3ED\xF8B3 \xF2E8\xF5B3 \xF0E5\xF7B3);",
				"\n* \3\xCDE5\xE2E8\xEDED\xE8EC \xE3F0\xE0E2\xF6FF\xEC\0 \xECEE\xE6ED\xE0 \xEDE0\xEFE5\xF0E5\xE4 \xE7E1\xE8F0\xE0F2\xE8 \xE7E1\xF0EE\xFE \xF2E0 \xEAB3\xEBFC\xF6FF \xE0E1\xE8 \xEFEE\xF2B3\xEC, \xEAEE\xEBE8 \xEEF2\xF0E8\xECE0\xBA \xF0EE\xEBFC \4\xD8E5\xF0E8\xF4E0\0 \xE0E1\xEE \xE4B3\xF1F2\xE0ED\xE5 \4\xF1EC\xE0F0\xE0E3\xE4\0, \xECB3\xE3 \xE7 \xE2EF\xE5E2\xEDE5\xEDB3\xF1F2\xFE \xE9F2\xE8 \xF3 \xE1B3\xE9;",
				"\n* \xDFEA\xF9EE \xE2E0\xF1 \xE2E8\xEAF0\xE8EB\xE8 \xE2E8 \xE7E0\xE2E6\xE4E8 \xECEE\xE6E5\xF2E5 \xE7EC\xB3ED\xE8F2\xE8 \xEAEE\xEBB3\xF0 \xF1E2\xEEE3\xEE \xEFE5\xF0F1\xEEED\xE0E6\xF3 \xE0E1\xE8 \xE2E0\xF1 \xE2E0\xE6F7\xE5 \xE1F3\xEBEE \xE2EF\xB3E7\xEDE0\xF2E8;",
				"\n* \xCAEB\xE0E2\xB3F8\xE0 \7FIRENORMAL\0 \xE0EA\xF2E8\xE2F3\xBA \6\xEDB3\xE6\0 \xEAEE\xEBE8 \xE2E8 \xECE0\xBAF2\xE5 \xE4EB\xFF \xEDFC\xEEE3\xEE \xEAB3\xEBFC\xF6FF (\3\xCDE5\xE2E8\xEDED\xB3\0 \xEDE5 \xECE0\xFEF2\xFC \6\xEDEE\xE6E0\0). \xDFEA\xF9EE \xE2E8 \xEFB3\xE4EA\xF0E0\xE4E0\xBAF2\xE5F1\xFC \xF2EE \6\xEDB3\xE6\0 \xEDE5 \xF0EE\xE1E8\xF2FC \xE7E2\xF3EA\xB3E2 \xE0F2\xE0EA\xE8 \xF3E7\xE0E3\xE0EB\xB3."
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
			"\x87Usi zahystnyky pokynuly nas, ale Wseswit wybraw was nowym \x82Gerojem\x87! Ce wash shans wriatuwaty den'!"
		},["TEAMMATE_HIT"]={
			"Wy zachepyly osobu z washoji komandy, ne namagajtesia wbyty jiji znow.",
			"Was zachepyla osoba z washoji komandy. Ne robit' pomsty dla neji."
		},["MURD_KILLED"]={
			"\x85Wbywcia\x87",
			"\x80".."eliminowanyj!"
		},["SHERI_KILLED"]={
			"\x84Sheryf\x87",
			"\x80wbytyj! Znajdit' zagublenyj \x84Smaragd Sheryfa\x80!",
			"\x80wbytyj!"
		},["HERO_KILLED"]={
			"\x82Geroj\x87",
			"\x80wbytyj!"
		},["SHREML_PICK"]="Htos' uziaw \x84Smaragd Sheryfa\x80...",
		["INNO_HURT_PM"]={
			"\x87Wy wbyly \x83Newynnogo\x87! Was zwil'neno! (Ty bil'she ne Sheryf)",
			"\x82Geroji\x87 ne majut' prawa wbywaty \x83Newynnych\x87! Was zasudzheno na \x8Fsmert'\x80 za wash zlochyn!"
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
            "\xE2E8\xEAEE\xF0E8\xF1F2\xE0E9\xF2E5 \xEAEE\xECE0\xEDE4\xF3 \7MMHELP\0 \xF3 \xEAEE\xEDF1\xEEEB\xB3", --wykorystajte komandu MMHELP w konsoli
			"\xE4EB\xFF \xB3ED\xF4EE\xF0EC\xE0F6\xB3BF \xF2E0 \xEFF0\xE0E2\xE8EB", --dlia informaciji ta prawyl
			"",
			"\xCAEE\xECE0\xEDE4\xE0 \7MMLANG\0 \xE7EC\xB3ED\xFEBA \xECEE\xE2F3 \xB3ED\xF2E5\xF0F4\xE5E9\xF1F3",
            "",
            "",
			"\2\xD3E4\xE0F7\xB3  ;)" --Udachi
		},["HUD_ROLESALIVE"]={
			"\xC2E1\xE8E2\xF6FC", --Wbywc'
			"\xD8E5\xF0E8\xF4B3\xE2", --Sheryfiw
			"\xCDE5\xE2E8\xEDED\xE8F5" --Newynnych
		},["HUD_DEAD"]={
			"\xC2E8 \15\xECE5\xF0F2\xE2B3", --Wy metrwi,
			"\xC2E8 \xEDE5 \xECEE\xE6E5\xF2E5 \xE2B3\xE4F0\xEEE4\xE6F3\xE2E0\xF2E8\xF1FF \xF2E0 \xE3EE\xE2EE\xF0E8\xF2E8", --Ne mozhete widrodzhuwatysia ta goworyty
			"\xE4EE \xE6E8\xE2E8\xF5 \xE3F0\xE0E2\xF6B3\xE2" --do zhywych grawciw
		},["HUD_MIDJOIN"]={
			"\xC2E8 \xEFF0\xE8BA\xE4ED\xE0EB\xE8F1\xFF \4\xEFEE\xF1E5\xF0E5\xE4 \xF0E0\xF3ED\xE4F3\0, \xE1F3\xE4FC \xEBE0\xF1EA\xE0, \xE7E0\xF7E5\xEAE0\xE9F2\xE5 \xEDE0\xF1F2\xF3EF\xEDEE\xE3EE", --wy pryjednalysia posered raundu, bud' laska, zachekajte nastupnogo
			"\xE0E1\xE8 \xE7E0\xE3F0\xE0F2\xE8" --aby zagraty
		},["HUD_ALONE"]={
            "\xC4EB\xFF \xF1F2\xE0F0\xF2F3 \xE3F0\xE8 \xEFEE\xF2F0\xB3E1\xEDEE\4 2-\xBA \xE3F0\xE0E2\xF6B3\xE2\0,", --Dl'a startu gry potrebujetsia 2-je grawciw,
            "\xE1F3\xE4FC \xEBE0\xF1EA\xE02C \xE7E0\xF7E5\xEAE0\xE9F2\xE5 \xEDE0\4 \xF9E5 \xEEE4\xEDEE\xE3EE", --bud' laska zachekajte na she odnogo,
            "\xE0E1\xE8 \xEFEE\xF7E0\xF2E8" --aby pochaty
		},["HUD_SNEAKING"]="\xCAF0\xE0E4\xE5EC\xEEF1\xFF...", --Krademosia
		["HUD_SHOWDOWN"]="\xC2E8\xF0B3\xF8E0\xEBFC\xEDE0 \xE4F3\xE5EB\xFC!", --Wyrishal'na duel'!
		["HUD_MINIGAME"]={
			["PRESS"]="\xCDE0\xF2E8\xF1ED\xB3F2\xFC\2 CUSTOM3\0 \xE0E1\xE8", --Natysnit' CUSTOM3 aby
			["LEAVE"]="\xE2E8\xE9F2\xE8", --wyjty
			["CANCEL"]="\xF1EA\xE0F1\xF3E2\xE0F2\xE8", --skasuwaty
			["SPECTATE"]="\xEDE0\xE3EB\xFFE4\xE0F2\xE8", --nagliadaty
			["DUEL"]="\xE7E0 \xE4F3\xE5EB\xFCED\xEEFE \xECB3\xEDB3\xE3F0\xEEFE", --za duel'noju minigroju
			["REQUEST"]="\xE7B3\xE3F0\xE0F2\xE8 \xF3 \7PONG", --zigraty u PONG
			["START"]="\xE7B3\xE3F0\xE0F2\xE8 \xF3 \7SONIC RUN", --zigraty u SONIC RUN
			["ACCEPT"]="\xEFF0\xE8E9\xEDFF\xF2E8 \xE2E8\xEAEB\xE8EA \xF3 \7PONG\0!", --pryjniaty wyklyk u PONG!
			["WAIT"]="\xD7E5\xEAE0\xBAEC\xEE \xEDE0 \xE2B3\xE4EF\xEEE2\xB3F2\xFC \xEFF0\xEEF2\xE8E2\xEDE8\xEAE0...", --Czekajemo na widpowid' protywnyka...
			["SPECTATING"]="\xCDE0\xE3EB\xFFE4\xFFBA\xECEE \xE7E0 \xE3F0\xEEFE...", --Nagliadajemo za groju...
			["BORED"]="\xCDF3\xE4ED\xEE?", --nudno?
			["PONGBALL"]="\xC3EB\xFFE4\xE0F7\xB3 \xECEE\xE6F3\xF2FC \xE7EC\xB3ED\xFEE2\xE0F2\xE8 \xEAE5\xF0F3\xEDEE\xEA \xEC'\xFFF7\xE0" --Gliadachi mozhut' zminiuwaty kerunok m'jacha
		},["HUD_YOU"]="\xD2C8", --TY
		["HUD_WINNERS"]="\xC2E8\xE3F0\xE0EB\xE8:", --Wygraly
		["HUD_WON"]="\xE2E8\xE3F0\xE0E2(\xEBE0)!", --Wygraw(la)!
		["HUD_WIN"]={
			"\xCDB2\xD7C8\xDF!", --NICHYJA!
			"\5\xC2C1\xC8C2\xD6B2", --WBYWCI
			"\3\xD6C8\xC2B2\xCBDC\xCDB2" --CYWIL'NI
		},["HUD_PAST"]="\xCCC8\xCDD3\xCBC5",
		["HUD_FUTURE"]="\xCCC0\xC9C1\xD3D2\xCDAA"
	},
}
