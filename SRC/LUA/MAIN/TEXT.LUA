--TEXT.LUA
--Text by MM_DEV translators
--
--All text strings used in the mod

MM.text={
    ["EN"]={ -- English
		["VERSION"]="10.1-BETA", --to check if lang content is not OUTDATED
		["AUTHOR"]="MM_DEV community",
		["MM"]="Murder Mystery",
		["MMHELP_CMD"]={
			["CONTENTS"]={ --Table of Contents
				"\x8ATable of contents:",
				"\x87MMHELP GAME\x80 - More about the game and gameplay situations;",
				"\x87MMHELP BAD\x80  - List of things that are forbidden to do in MM;",
				"\x87MMHELP CHAT\x80 - List of sound emojis that you can use in the chat;",
				"\x87MMHELP TIPS\x80 - A small collection for you;";
				"\x87MMHELP INFO\x80 - Technical information and \"What's new\";",
				"\n\x87MMLANG\x80      - Change the language of the content appearing in MM"
			},
			["NOTFOUND"]={ --"page not found"
				"Page",
				"doesn't exist. Please indroduce yourself to the Table of Contents:"
			}
		},
		["MMHELP"]={ --MMHELP command
			["MAIN"]={ --When no page specified
				"\x87Welcome to Murder Mystery!",
				"\x87The SRB2 interpretation of the popular multiplayer game!",
				"The game's goal is to find and eliminate all the \x85Murderers\x80 before they kill\x83 everyone else\x80. This gametype is more like MATCH so you will need your aiming and shooting skills for this gametype.",
				"You need to learn some basics first before you can start playing...",
				"\nAt the beginning of each round you will recieve a \x8BRole\x80 which defines what your task is during the game. Here are all 3 possible \x8BRoles\x80 you might get:",
				" * \x85Murderer\x80 - A true criminal. They have to kill everyone, but they are equipped only with Knife and Red Rings",
				" * \x84Sheriff\x80  - Their task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
				" * \x83Innocent\x80 - Completely armless civilian, they must avoid being killed but also can help to find the \x85Murderer\x80.",
				"\nThat's all basic information required to start playing, for more information, you can use these commands:"
			},["GAME"]={
				"\x87".."About the gameplay situations",
				"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \x85Murderer(s)\x80, but different gameplay situations may occur:",
				"\n* If you get killed, you'll enter the\x8F Dead\x80 state. Players with this state cannot respawn or talk globaly to players that are still alive, their messages are visible only to other\x8F Dead\x80 players.",
				"You can't talk to/PM players who are still alive while you're\x8F Dead\x80.",
				"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this are in \x87MMHELP BAD\x80.",
				"\n* The \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but it is possible for them to shoot an \x83Innocent\x80 on accident.",
				"If this occurs, the \x84Sheriff\x80 will turn into an \x83Innocent\x80 and a random \x83Innocent\x80 will sliently take his role. Next time you want to shoot somebody as a \x84Sheriff\x80 think twice before pulling that trigger!",
				"\n* When a \x85Murderer\x80 kills a \x84Sheriff\x80 and there are still \x83Innocents\x80 alive, the Sheriff will drop the \x84Sheriff's Emerald\x80 near their corpse.",
				"Unlike the 7 Chaos Emeralds, this emerald will assign the \x82Hero\x80 role to any \x83Innocent\x80 that picks it up. If you're one of the \x83Innocents\x80, it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
				"The \x82Hero\x80 role doesn't really differ from the \x84Sheriff\x80 except some details such as when the \x82Hero\x80 kills an \x83Innocent\x80 their role isn't shared and both just die. A Hero will not drop a \x84Sheriff's Emerald\x80 on their death.",
				"\n* Depending on the player count, there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 amongst the players in the round. For example, starting from 7 players and more, \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
				"\x8BTeammates\x80 can chat with each other in their team chat with the \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
				"If one \x8Bteammate\x80 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
			},["BAD"]={
				"\x87Things that are bad to do in Murder Mystery",
				"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
				"* Self-spoiling of the \x8BRole\x80 will not make the game a \'Mystery\', you can tell some else's role if you are sure of it, but never tell your own.",
				"* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you will accuse every player for no reason.",
				"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
				"* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename if you are alive. Just wait for the intermission to rename safely.",
				"Breaking one of these rules may result in a kick or in some cases, a ban from the Admin! Please do not break them and play fairly."
			},["CHAT"]={
				"\x87How to use Sound Emojis",
				"When a player sends a message that contains specific words/phrases, a sound will be played.",
				"For example, when you send a message containing \"bruh\", everyone will hear the \"BRUH\" sound",
				"Here is the full list of the Sound Emojis and how to activate each of them:"
			},["TIPS"]={
				"\x87Useful tips",
				"We've collected some tips that can help you during your game in MM:",
				"\n* If character abilities are disabled by admin, press \x82SPIN\x80 to sneak around stealthily without leaving traces or making noise;",
				"\n* When you pick up the \x84Sherrif's Emerald\x80, you will have access to all the weapons and rings you collected beforehand;",
				"\n* Finding out who your \x8Bteammate\x80 is by using the \x87SAYTEAM\x80 command would help as it would make you avoid shooting them and accidently making you reveal your role;",
				"\n* You can get hurt by obstacles like lava, spikes and fire to gain invincibility for 3 seconds;",
				"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
				"\n* If your role gets leaked, you can rename yourself and/or change skincolor. \x81Keep in mind your rename will be shown in chat;",
				"\n*\x82 FIRENORMAL\x80 button allows to use Knife anywhere as long as you have rings (Innocents do not have a knife). Also, Knife does not produce an attack sound if you sneak."
			}
		},
		--GAME.LUA
		-- "You got the role"
		["ROLE_GET"]={
			"You're the \x85Murderer\x80! \x85Murder everyone!",
			"You're the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. If you kill an innocent, you'll be stripped of your role.",
			"You're an \x83Innocent\x80! Hide and help the with the investigation."
		},
		-- SetRandomPlayerAs()
		["NEWROLE_GET"]={
			"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!",
			"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!",
			"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!"
		},
		-- Teammate hit
		["TEAMMATE_HIT"]={
			"This player is your teammate. Don't hit your teammates next time as you don't want them to take their revenge on you.",
			"A teammate hit you. Don't plan to take your revenge on them."
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
			"\x82Heroes\x87 aren't meant to kill \x83Innocents\x87. You got the death penalty for that."
		},
		["INNO_HURT"]={
			"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!",
			"The \x82Hero\x80 is a dumbass, they killed an \x83Innocent\x80. Now both are lying dead. Shame on that \x82 Dumbass\x80"
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
		--CHAT.LUA
		["CHAT"]={
			"is alive, message not sent",
			"You're sending too many messages, please wait",
			"You can't just\x8F die\x80 to spectate!"
		},
		--HUD.LUA
		-- Bitmap patches
		["BMP_PALIVE"]={
			"\xFFIIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\II\x1F\xFF\xFFIIIIII\x1F",
			"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\x1F",
			"\xFFIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F",
			"II\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIIIII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFF\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},
		["BMP_TIME"]={
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\xFFII\x1F\x1F\x1F\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\xFFIIII\x1F\xFFII\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIIIIII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIII\x1FII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},
		["BMP_RINGS"]={
			"\xFFIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIII\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F",
			"\xFFIIIII\x1F\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\xFFII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFFIII\x1F",
			"IIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\x1FII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F"
		},
		-- Role names
		["ROLES_HUD"]={
			"MURDERER",
			"SHERIFF",
			"INNOCENT",
			"HERO",
			"DEAD"
		},
		["ROLES_HUD_SHORT"]={ --used for 8-32 players intermission screen
			"MURD",
			"SHERI",
			"INNO",
			"HERO",
			"DEAD"
		},
		["TEAMALIVE_HUD"]="Teammates alive:",
		["KILLBY_HUD"]="Killed by",
		["STUPID"]="your stupidity",
		-- Scores TAB screen
		["HUD_SCORESTAB"]={
			"No scores here! But the counters below",
			"may help you in the investigation!",
			"",
			"If you're new to the gametype",
			"use \7MMHELP\0 in the Console",
			"",
			"Use \7MMLANG\0 command to change",
			"the language in this gametype",
			"",
			"",
			"\2Have Fun!"
		},
		-- Scores TAB screen role conters
		["HUD_ROLESALIVE"]={
			"Murderers alive:",
			"Sheriffs alive:",
			"Innocents alive:"
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
			"please wait for \4one more\0 player to start"
		},
		-- "Showdown duel!"
		["HUD_SHOWDOWN"]="Showdown duel!",
		--minigame stuff
		["MINIGAME_PRESS"]="Press\2 CUSTOM3\0 to", --must contain MM escape color codes
		["MINIGAME_LEAVE"]="leave",
		["MINIGAME_CANCEL"]="cancel",
		["MINIGAME_SPECT"]="spectate",
		["MINIGAME_DUEL"]="a minigame duel",
		["MINIGAME_REQ"]="request a \7PONG\0 game", --must contain MM escape color codes
		["MINIGAME_ACCEPT"]="accept the \7PONG\0 challenge!", --must contain MM escape color codes
		["MINIGAME_WAIT"]="Waiting for the rival to accept...",
		["MINIGAME_SPECTN"]="Spectating a duel...",
		["YOU_HUD"]="YOU",
		-- Winner stuff
		["WINNERS_HUD"]="Winners:",
		["WON_HUD"]="won!",
		["WINS_HUD"]="Wins",
		["WIN_HUD"]={
			"TIE!",
			"\5MURDERERS", --must contain MM escape color code
			"\3CIVILIANS" --must contain MM escape color code
		},
		--CCMD.LUA (MMLANG command)
		["MMLANG"]={
			"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]",
			"Personal language for Murder Mystery is set to\x82 English"
		}
	},["ES"]={ --Spanish by SlainLBS & Jesus.B
		["VERSION"]="10.1-BETA",
		["AUTHOR"]="Jesus.B",
		["MM"]="Murder Mystery",
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			["CONTENTS"]={
				"\x8ATabla de contenidos:",
				"\x87MMHELP GAME\x80 - Mas sobre el juego y situaciones de gameplay;",
				"\x87MMHELP BAD\x80  - Lista de cosas prohibidas en MM;",
				"\x87MMHELP CHAT\x80 - Lista de emojis de sonido que puedes usar en el chat;",
				"\x87MMHELP TIPS\x80 - Una pequena coleccion para ti;";
				"\x87MMHELP INFO\x80 - Informacion tecnica y \"Que hay de nuevo\";",
				"\n\x87MMLANG\x80      - Cambia el idioma del contenido que aparece en MM"
			},
			["NOTFOUND"]={
				"La pagina",
				"no existe. Porfavor introducete a la Tabla de Contenidos:"
			}
		},["MMHELP"]={
			["MAIN"]={
				"\x87 Bienvenido a Murder Mystery!",
				"\x87La interpretacion en SRB2 del popular juego multijugador!",
				"El objetivo del juego es encontrar y eliminar a todos los\x85 Asesinos\x80 antes de que maten a\x83 todos los demas\x80. Este modo de juego es tipo MATCH por lo que nesecitaras de tus habilidades de apuntar y disparar para este modo de juego.",
				"Pero necesitaras aprender lo basico antes de empezar a jugar...",
				"\nAl inicio de cada ronda recibiras un \x8BRol\x80 que define cual es tu tarea en la partida. Aqui estan los 3 posibles \x8BRoles\x80 que puedes conseguir:",
				" *\x85 Asesino\x80 - Un verdadero criminal. Tiene que matar a todos, pero solo esta equipado con un Cuchillo y Anillos Rojos",
				" *\x84 Comisario\x80  - Su tarea es encontrar y eliminar a el/los\x85 Asesino(s)\x80. Los Comisarios pueden usar cada Anillo Arma disponible en el mapa;",
				" * \x83Inocente\x80 - Civil completamente sin armas, deben evitar ser asesinados pero tambien deben ayudar en la busqueda del\x85 Asesino\x80.",
				"\nEsa es toda la informacion basica requerida para empezar a jugar, para mas informacion, puedes usar estos comandos:"
			},["GAME"]={
				"\x87".."Sobre las situaciones de gameplay",
				"Como se explico anteriormente en lo basico, el objetivo de los comisarios es eliminar a todos los\x85 Asesinos\x80, pero diferentes situaciones de gameplay pueden ocurrir:",
				"\n* Si te matan, entraras en el estado de\x8F Muerto\x80. Los jugadores en este estado no pueden reaparecer o hablarle globalmente a jugadores que siguen vivos, sus mensajes solo seran visibles para otros jugadores\x8F Muertos\x80.",
				"No puedes enviar mensajes/mensajes directos a jugadores que siguen vivos mientras estas\x8F Muerto\x80.",
				"Tambien\x82 NO INTENTES RENOMBRARTE\x80, mas detalles sobre esto en \x87MMHELP BAD\x80.",
				"\n* La tarea del\x84 Comisario\x80 es eliminar a todos los\ x85Asesinos\x80 sueltos, pero es posible que dispare a un \x83Inocente\x80 por accidente.",
				"Si esto ocurre, el\x84 Comisario\x80 se volvera un \x83Inocente\x80 y otro \x83Inocente\x80 al azar tomara su rol. La proxima vez que le quieras disparar a alguien como\x84 Comisario\x80 piensa 2 veces antes de apretar el gatillo!",
				"\n* Cuando un\x85 Asesino\x80 mata a un\x84 Comisario\x80 y todavia hay \x83Inocentes\x80 vivos, el Comisario dejara caer la\x84 Esmeralda del Comisario\x80 cerca de su cadaver.",
				"A diferencia de las 7 Esmeraldas del Caos, esta esmeralda asignara el rol de \x82Heroe\x80 a cualquier \x83Inocente\x80 que la recoja. Si eres uno de los \x83Inocentes\x80, es tu oportunidad de ser un Heroe y salvar a todos de el/los\x85 Asesino(s)\x80!",
				"El rol de \x82Heroe\x80 no es muy diferente de el de\x84 Comisario\x80 excepto por algunos detalles, como cuando el \x82Heroe\x80 mata a un \x83Inocente\x80 su rol no se transmite a alguien mas y ambos solo se mueren. Un Heroe no dejara una\x84 Esmeralda del Comisario\x80 cuando muera.",
				"\n* Dependiendo en la cantidad de jugadores, puede haber mas de un\x85 Asesino\x80 y\x84 Comisario\x80 entre los jugadores en la ronda. Por ejemplo, empezando desde 7 jugadores o mas,\x8B Equipos\x80 de\x85 Asesinos\x80 y\x84 Comisarios\x80 se formaran.",
				"Los\x8B Aliados\x80 pueden chatear entre si en su chat de equipo con el comando de consola \x87SAYTEAM\x80 (notar que el boton de chat de SAYTEAM funcionara igual que el chat normal).",
				"Si un\x8B aliado\x80 golpea a otro aliado, ambos conseguiran una advertencia personalizada que hara que se reconozcan. Recuerda que otros pueden ver tu interaccion 'amistosa' y darse cuenta de quien eres!"
			},["BAD"]={
				"\x87 Cosas malas de hacer en Murder Mystery",
				"La regla No.1 de cualquier juego:\x82 Se amable y diviertete!\x80 Ademas de esto...",
				"* Las autorevelaciones de los \x8BRoles\x80 no hara el juego un \'Misterio\', puedes decir el rol de alguien mas si estas seguro de ello, pero nunca digas el tuyo.",
				"* No insultes otros jugadores, las bromas o chistes son permitidos, pero solo en un animo amigable. Nadie te creera si acusaras a cualquier jugador sin razon.",
				"* Estar AFK es un crimen de guerra. Bombas caeran y dejaras de existir si te quedas quieto por mucho tiempo.",
				"* No te renombres durante una ronda estando muerto, hacer esto te expulsara del servidor. Puedes renombrarte si estas vivo. Solo espera la intermission para renombrarte de manera segura.",
				"Romper una de estas reglas puede resultar en una expulsion, o en algunos casos un ban por el Admin! Porfavor no las rompas y juega justamente."
			},["CHAT"]={
				"\x87 Como usar Emojis de Sonido",
				"Cuando un jugador envia un mensaje que tenga palabras/frases especificas, se reproducira un sonido.",
				"Por ejemplo, cuando envias un mensaje que tenga la palabra \"bruh\", todos escucharan el sonido de \"BRUH\"",
				"Aqui hay una lista completa de los Emojis de Sonido y como activar cualquiera de ellos:"
			},["TIPS"]={
				"\x87 Consejos utiles",
				"Hemos coleccionado algunos consejos que te puedan ayudar durante tu partida de MM:",
				"\n* Si las habilidades de personajes son desactivadas por un admin, presiona \x82SPIN\x80 para escabullirte sigilosamente sin dejar rastros o hacer ruido;",
				"\n* Cuando recojas la\x84 Esmeralda del comisario\x80, tendras acceso a todas las armas y anillos que recolectaste de antemano;",
				"\n* Averiguar quien es tu\x8B aliado\x80 usando el comando \x87SAYTEAM\x80 ayudaria a evitar dispararlos y accidentalmente revelar tu rol;",
				"\n* Puedes ser lastimado por obstaculos como lava, pinchos y fuego para tener invencibilidad por 3 segundos;",
				"\n* Intenta buscar un escondite en un mapa. Aveces ayuda para deshacerse de publicidad no deseada;",
				"\n* Si se revela tu rol, puedes renombrarte y/o cambiar tu skincolor. \x81Ten en cuenta que tu renombre se mostrara en el chat;",
				"\n* El cuchillo no produce un sonido de ataque mientras te escabullas. Y tambien, el boton\x82 FIRENORMAL\x80 te permite usar tu cuchillo donde sea siempre y tengas anillos (Los Inocentes no tienen cuchillos)"
			}
		},["ROLE_GET"]={
			"Eres el\x85 Asesino\x80! \x85Mata a todos!",
			"Eres el\x84 Comisario\x80!\x84 Elimina a todos los asesinos\x80. Si matas a un inocente, se te removera tu rol.",
			"Eres un \x83Inocente\x80! Escondete y ayuda con la investigacion."
		},["NEWROLE_GET"]={
			"\x87La vida aleatoriamente decidio que seras un\x85 Asesino\x87.\x85 Ahora ve a matar a todos!",
			"\x87 El universo te hizo un\x84 Comisario\x87! Ve y\x84 elimina a todos los Asesinos\x87!",
			"\x87Se decidio que seras un \x82Heroe\x87. Salva a todos de los Asesinos!"
		},["TEAMMATE_HIT"]={
			"Este jugador es tu aliado. No golpees a tus aliados la proxima vez si no quieres que se venguen de ti.",
			"Un aliado te golpeo. No planees tu venganza en el."
		},["MURD_KILLED"]={
			"El\x85 Asesino\x87",
			"\x80 fue eliminado"
		},["SHERI_KILLED"]={
			"El\x84 Comisario\x87",
			"\x80 fue asesinado! Enncuentra su\x84 Esmeralda\x80!",
			"\x80 fue asesinado!"
		},["HERO_KILLED"]={
			"El \x82Heroe\x87",
			"\x80 fue asesinado!"
		},["SHREML_PICK"]="Alguien agarro la\x84 Esmeralda Del Comisario\x80...",
		["INNO_HURT_PM"]={
			"\x87Mataste a un \x83Inocente\x87! Has sido despedido. (Ya no eres un Comisario)",
			"Los \x82Heroes\x87 no estan destinados a matar \x83Inocentes\x87. Conseguiste pena de muerte por eso."
		},["INNO_HURT"]={
			"El\x84 Comisario\x80 mato a un \x83Inocente\x80! Alguien mas deberia terminar el trabajo!",
			"El \x82Heroe\x80 es un tonto, mato a un \x83Inocente\x80. Ahora ambos estan tirados sin vida. Que verguenza\x82 Tonto\x80"
		},["ONE_LEFT"]={
			"Uno de los\x85 Asesinos\x80 se fue!",
			"Uno de los\x84 Comisarios\x80 se fue!!!",
			"Uno de los \x82Heroes\x80 nos abandono!"
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
			"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 mato al ultimo Inocente! Que verguenza para el\x84 Comisario\x80",
			"El \x82Heroe\x80 escogio matar al ultimo Inocente. Los\x85 Asesinos\x80 ganan!",
			"Los Defensores de los\x83 Inocentes\x80 estan muertos. Los\x85 Asesinos\x80 ganan!"
		},["CHAT"]={
			"esta vivo, el mensaje no ha sido enviado",
			"Estas enviando muchos mensajes, porfavor espera",
			"No puedes solamente\x8F morir\x80 para espectar!"
		},["BMP_PEOPLE"]={
			"\xFFIIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"\xFFIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"II\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_ALIVE"]={
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\x1F",
			"IIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F",
			"II\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_TIME"]={
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\xFFII\x1F\x1F\x1F\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\xFFIIII\x1F\xFFII\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIIIIII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIII\x1FII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIII\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F",
			"\xFFIIIII\x1F\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\xFFII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFFIII\x1F",
			"IIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\x1FII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F"
		},["ROLES_HUD"]={
			"ASESINO",
			"COMISARIO",
			"INOCENTE",
			"HEROE",
			"MUERTO"
		},["ROLES_HUD_SHORT"]={
			"ASES",
			"COMI",
			"INOC",
			"HERO",
			"MRTO"
		},["TEAMALIVE_HUD"]="Aliados vivos:",
		["KILLBY_HUD"]="Asesinado por",
		["STUPID"]="tu estupidez",
		["HUD_SCORESTAB"]={
			"No hay puntaje aqui! Pero los contadores",
			"de abajo pueden ayudarte en la",
			"investigacion!",
			"",
			"Si eres nuevo al modo de juego",
			"usa \7MMHELP\0 en la Consola",
			"",
			"Utilice el comando \7MMLANG\0 para cambiar",
			"el idioma en este tipo de juego",
			"",
			"",
			"\2Diviertete!"
		},["HUD_ROLESALIVE"]={
			"Asesinos vivos:",
			"Comisarios vivos:",
			"Inocentes vivos:"
		},["HUD_DEAD"]={
			"Estas\15 muerto",
			"No puedes reaparecer o hablarle",
			"a gente que no esta muerta."
		},["HUD_MIDJOIN"]={
			"Te metiste en \4media partida\0, porfavor espera a que la ronda termine."
		},["HUD_ALONE"]={
			"\4".."2 jugadores\0 son requieridos para",
			" la partida, porfavor espera un jugador",
			"\4mas\0 para empezar"
		},["HUD_SHOWDOWN"]="Showdown duel!",
		["YOU_HUD"]="TU",
		["WINNERS_HUD"]="Ganadores:",
		["WON_HUD"]="ganaron!",
		["WINS_HUD"]="Ganan",
		["WIN_HUD"]={
			"EMPATE!",
			"\5ASESINOS",
			"\3CIVILES"
		},["MMLANG"]={
			"El idioma que estas usando actualmente es\x82 Espanol\x80\nPuedes cambiarlo con \x87MMLANG [idioma]",
			"Tu idioma personal de Murder Mystery ha sido cambiado a\x82 Espanol"
		}
	},["PL"]={ -- Polish by sopix
		["VERSION"]="10.1-BETA",
		["AUTHOR"]="sopix & LeonardoTheMutant",
		["CHARSET"]="1250C",
		["MM"]="Tajemnica Morderstw",
		["MMHELP_CMD"]={
			["CONTENTS"]={ --Table of Contents
				"\x8ASpis tresci:",
				"\x87MMHELP GAME\x80 - Wiecej o grze i gameplay;",
				"\x87MMHELP BAD\x80  - Lista rzeczy, ktore sa zabronione w TM;",
				"\x87MMHELP CHAT\x80 - Lista Dzwiekowych Emotikonow ktore mozhna wykorzystowac w czacie;",
				"\x87MMHELP TIPS\x80 - Mala kolekjca porad dla ciebie;";
				"\x87MMHELP INFO\x80 - Informacja techniczna i \"Co nowego\";",
				"\n\x87MMLANG\x80      - Zmienic jezyk kontentu w TM"
			},
			["NOTFOUND"]={ --"page not found"
				"Strona",
				"nie istnieje. Prosze zapoznac sie ze spisem tresci:"
			}
		},
		["MMHELP"]={
			["MAIN"]={
				"\x87        Witaj w Tajemnicy Morderstw!\nInterpretacji popularnej gry multiplayer w SRB2",
				"\nCelem gry jest znalezienie i wyeliminowanie wszystkich \x85Mordercow\x80 zanim zabija\x83 wszystkich\x80. Ten typ gry jest jak MATCH wiec musisz potrafic strzelac.",
				"Bedziesz potrzebowac kilku podstaw....",
				"\nNa poczatku kazdej rundy dostaniesz \x8BRole\x80 ktora dyktuje co masz robic w grze. To sa 3 mozliwe \x8BRole\x80 ktore mozesz dostac:",
				" * \x85Morderca\x80 - prawdziwy kryminalista. Ma zabic wszystkich, ale posiada tylko Noz ta Czerwone Ringi;",
				" * \x84Szeryf\x80  - Jego zadaniem jest znalezienie i wyeliminowanie \x85Mordercow\x80. Szeryfi moga uzywac wszystkich typow pierscieni;",
				" * \x83Niewinny\x80 - kompletnie bezbronny cywil, musi nie zostac zabity i pomoc w znalezieniu \x85Mordercy\x80.",
				"\nTo cala podstawa do gry, jesli nadal czegos nie wiesz lub chcesz dowiedziec sie wiecej, uzyj tych komend:"
			},["GAME"]={
				"\x87O sytuacjach w grze",
				"Jak wyjasniono wczesniej, celem jest wyeliminowanie wszystkich \x85Mordercow\x80, ale rozne sytuacje moga zastac:",
				"\n* Jesli ktos cie zastrzeli to staniesz sie\x8F Martwy\x80. Gracze w tym stanie nie moga sie odnowic ani gadac na globalnym czacie, twoje wiadomosci sa tylko widoczne dla innych\x8F martwych\x80 graczy.",
				"Nie mozesz uzyc \x87SAYTO\x80 lub PW do osoby ktora jest zywa jako\x8F MARTWY\x80.",
				"Takze,\x82 NIE PROBUJ ZMIENIAC NAZWY\x80, wiecej detali w \x87MMHELP BAD\x80.",
				"\n* Zadaniem \x84Szeryfa\x80 jest wyeliminowanie wszystkich \x85Mordercow\x80, ale czasami szeryf moze zabic jednego \x83Niewinnego\x80 przez przypadek.",
				"Jesli to sie stanie \x84Szeryf\x80 stanie sie cywilem i inny \x83Niewinny\x80 po cichu przejmie jego role. Nastepnym razem jak strzelisz w kogos jako \x84Szeryf\x80 pomysl kogo zabijasz!",
				"\n* Kiedy \x85Morderca\x80 zabije \x84Szeryfa\x80 i zostana zywi \x83Niewinni\x80 szeryf upusci \x84Szmaragd Szeryfa\x80 obok jego ciala.",
				"W przeciwienstwie do Szmaragdow Chaosu ten szmaragd daje role\x82 Bohatera\x80 do \x83Niewinnego\x80 ktory go pierwszy podniosl. Jesli jestes \x83Niewinnym\x80 to twoja szansa zostac bohaterem i uratowac wszystkich od \x85Mordercow\x80!",
				"\x82".."Bohater\x80 nie rozni sie za bardzo od \x84Szeryfa\x80 oprocz kilku detali jak kiedy\x82 Bohater\x80 zabija \x83Niewinnego\x80 jego rola nie jest oddawana i obydwoje gina. Bohater nie upusci \x84Szmaragdu Szeryfa\x80 przy jego smierci.",
				"\n* Zaleznie od ilosci graczy, moze byc wiecej niz jeden \x85Mordercow\x80 i \x84Szeryfow\x80 posrod graczy w grze. Na przyklad, gdy jest wiecej niz 7 graczy to\x8B Druzyny\x80 \x85Mordercow\x80 i \x84Szeryfow\x80 beda zformowane.",
				"\x8BWspolnicy\x80 moga czatowac z druzyna za pomoca komendy \x87SAYTEAM\x80 (przycisk SAYTEAM bedzie tak samo dzialal jak normalny czat).",
				"Jesli jeden \x8Bwspolnik\x80 strzeli drugiego to dostanie wiadomosc zeby nie strzelal do wspolnika. Pamietaj ze inni moga zobaczyc twoja 'przyjazna' rozmowe i dowiedziec sie kim jestes!",
				"\nJesli chcesz zrozumiec wiecej przeczytaj:",
				"\x87MMHELP BAD\x80 - Rzeczy ktorych nie powinno sie robic w TM",
				"\x87MMHELP CHAT\x80 - Co to sa Dzwieki i jak ich uzyc"
			},["BAD"]={
				"\x87Rzeczy ktorych nie wolno robic w Tajemnicy Morderstw",
				"Zasada numer 1 kazdej gry:\x82 Badz mily i sie baw!\x80 Oprocz tego...",
				"* Wypowiedzenie swojej \x8BRoli\x80 sprawi ze gra nie bedzie juz \'Tajemnica\', mozesz wypowiedziec role kogos innego jak wiesz ale nigdy swojej.",
				"* Nie badz nie mily dla innych graczy, zarty sa dozwolone ale tylko w przyjaznej atmosferze. Nikt ci nie bedzie ufal jak bedziesz ciagle oskarzal innych bez powodu.",
				"* Bycie AFK to zbrodnia wojenna. Jesli bedziesz sie nie ruszal przez dluzszy czas zostaniesz wykopany (tylko jesli zyjesz).",
				"* Nie zmieniaj swojej nazwy poki jestes Martwy(a) - gra jest bardzo scisla i\x85 wyrzuci\x80 ci z gry jezeli to zrobisz. Po prostu zaczekaj na ekran zakonczenia rundy zeby znow bezpiecznie zmieniac imie.",
				"Zlamanie tych zasad moze spowodowac ze zostaniesz wykopany a czasami zbanowany przez Admina, prosimy ich nie lamac i grac fer.",
				"\nWiecej stron pomocy ktore mozesz chciec przeczytac w konsoli:",
				"\x87MMHELP GAME\x80 - O sytuacjach w grze",
				"\x87MMHELP CHAT\x80 - Lista dzwiekow i jak ich uzyc"
			},["CHAT"]={
				"\x87Jak uzyc dzwiekow\x80",
				"Jesli gracz wysle wiadomosc zawierajaca specjalne slowa lub frazy to zagra specjalny dzwiek.",
				"w skrocie jesli wyslesz wiadomosc \"bruh\" wszyscy uslysza dzwiek BRUH",
				"To jest lista dzwiekow i jak je aktywowac:"
			},["TIPS"]={
				"\x87Przydatne porady",
				"Zebralismy kilka porad ktorzy moga przydac ci w twojej grze w TM:",
				"\n* Jezeli zdolnosci postaci sa wylaczone adminem, zacisnij \x82SPIN\x80 zeby skradac sie ukradkiem i nie zostawiac za soba sladow;",
				"\n* Kiedy podniesiesz \x84Szmaragd Szeryfa\x80 bedziesz miec dostep do kazdej broni i ringow, ktorzy zebrales uprzednio;",
				"\n* Mozna dowiedziec sie kim jest twoj \x8Bkolega\x80 z druzyny bez wykorzystania broni, po prostu wysli powiadomlenie za pomoca komendy \x87SAYTEAM\x80 w konsoli i zaczekaj az poki na nia ktos odpowie z twojej druzyny. Pomoze ci to nie ujawnic roli wszystkim;",
				"\n* Mozesz zostac zraniony przez przeszkody takie jak lawa, kolce i ogien zeby dostac effekt niezwyciezosci na 3 sekundy;",
				"\n* Sproboj znalezc miejsce dla kryjowke na mapie. Czasami, pomaga to pozbyc sie niechcianej publicznosci;",
				"\n* Jezeli twoja rola przestanie byc tajemnica, mozhesz zmienic swoje imie i/lub zmienic swoj kolor postaci. \x81Pamietaj, ze zmiana imieni bedzie widoczna w czacie;",
				"\n* Przycisk\x82 FIRENORMAL\x80 pozwala wykorzystywac Noz wszedzie, jak masz Ringi (Niewinni nie posiadaja Noza). Takze, Noz nie robi dzwiekow ataku jezeli skradzasz sie."
			}
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
		},["CHAT"]={
			"zyje, wiadomosc nie wyslana",
			"Wysylasz za duzo wiadomosci, prosze poczekac",
			"Nie mozesz poprostu stac sie\x8F martwym\x80 do ogladania!"
		},["BMP_PALIVE"]={
			"\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F",
			"\xFF\x1F\x1F\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"\xFF\xFF\xFF\xFFIII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"\xFF\xFF\xFFIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFIIII\x1F\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\x1FIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"IIII\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F",
			"III\x1F\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"IIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F",
			"IIIIII\x1F\xFFIIIII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFFII\x1FIII\x1F\xFF\x1FIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1FI\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F"
		},["BMP_TIME"]={
			"\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F",
			"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\x1F\x1F\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFFIII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F",
			"\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFFIIII\x1F\xFFIIIIII\x1F\xFF\x1FIII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFF\xFFIIII\x1F\x1F\xFFIIIIII\x1F\xFF\xFF\x1FIII\x1F",
			"II\x1F\xFFII\x1F\xFFIIII\x1F\x1F\xFF\xFFII\x1F\x1FII\x1F\xFF\xFF\xFF\x1FIII\x1F",
			"II\x1F\xFFII\x1F\xFFIII\x1F\x1F\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F",
			"IIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F",
			"\x1FIIII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFF\x1FIIII\x1F\x1F",
			"\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIII\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"\xFFIIIII\x1F\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\xFFII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFFII\x1F",
			"IIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIIIII\x1F\xFFII\x1FIII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FIIII\x1F\xFFII\x1FIII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\x1FII\x1F\xFFIIIIII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F"
		},["ROLES_HUD"]={
			"MORDERCA",
			"SZERYF",
			"NIEWINNY",
			"BOHATER",
			"MARTWY"
		},["ROLES_HUD_SHORT"]={
			"MORD.",
			"SZER.",
			"NIEW.",
			"BOH.",
			"MARTW."
		},
		["TEAMALIVE_HUD"]="Wspo\xB3nicy \xBFywi:",
		["KILLBY_HUD"]="Zabity przez",
		["STUPID"]="tw\xF3j idiotyzm",
		["HUD_SCORESTAB"]={
			"Tutaj nie ma wynik\xF3w, ale liczniki na",
			"dol\xEA mog\xB9 pom\xF3".."c w dochodzeniu!",
			"",
			"Je\x9Cli ten tryb jest ci nowy u\xBFyj",
			"\7MMHELP\0 w Konsoli dla pomocy",
			"",
			"Wykonaj polecenie \7MMLANG\0 \xBF".."eby",
			"zmieni\xE6 j\xEAzyk w \1TM",
			"",
			"\2Baw si\xEA dobrze ;)"
		},["HUD_ROLESALIVE"]={
			"Mordercy \xBFywi:",
			"Szeryfi \xBFywi:",
			"Niewinni \xBFywi:"
		},["HUD_DEAD"]={
			"Jeste\x9C\15 martwy(a)",
			"Nie mozesz si\xEA odnawia\xE6 lub gada\xE6 do \xBFywych"
		},["HUD_MIDJOIN"]={
			"Pan(i) dolaczy\xB3(a) \4w \x9Crodku rundy\0, prosze poczeka\xE6 na now\xB9 rund\xEA \xBF".."eby zagra\xE6"
		},["HUD_ALONE"]={
			"\4".."2 graczy\0 jest wymaganych do gry,",
			"prosz\xEA poczeka\xE6 na \4jeszcze jednego\0 gracza",
			"dla startu"
		},["HUD_SHOWDOWN"]="Showdown duel!",
		["YOU_HUD"]="TY",
		["WINNERS_HUD"]="Wygrani:",
		["WON_HUD"]="zwyci\xEA\xBFyl(a)!",
		["WINS_HUD"]="Wygrano",
		["WIN_HUD"]={
			"REMIS!",
			"\5M\xD3RDERCY",
			"\3CYWILE"
		},["MMLANG"]={
			"Twoj aktualnie uzywany jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
			"Personalny jezyk zostal ustawiony na\x82 Polski"
		}
	},["TR"]={ --Turkish by Mobillia
		["VERSION"]="10.1-BETA",
		["AUTHOR"]="Mobillia",
		["MM"]="Murder Mystery",
		["CHARSET"]="1254C",
		["MMHELP_CMD"]={
			["CONTENTS"]={
				"\x8AOyun icerikleri:",
				"\x87MMHELP GAME\x80 - Oyun ve oynanis durumlari hakkinda daha fazla bilgi;",
				"\x87MMHELP BAD\x80  - MM'de yapilmasi yasak olan seylerin listesi;",
				"\x87MMHELP CHAT\x80 - Sohbette kullanabileceginiz Ses Emojilerinin listesi;",
				"\x87MMHELP TIPS\x80 - Sizin icin kucuk bir koleksiyon;";
				"\x87MMHELP INFO\x80 - Teknik bilgiler ve \"Yenilikler\";",
				"\n\x87MMLANG\x80      - MM'de gorunen icerigin dilini degistirme"
			},
			["NOTFOUND"]={
				"sayfa",
				"Yok. Lutfen kendinizi Icindekiler Tablosuna tanitin:"
			}
		},["MMHELP"]={
			["MAIN"]={
				"\x87Murder Mystery'e hosgeldiniz!",
				"\x87Populer cok oyunculu oyunun SRB2 cevirisi!",
				"Oyunun amaci, diger herkesi oldurmeden once tum \x85Katiller\x80'i bulup ortadan kaldirmaktir. Bu oyun turu daha cok MATCH'a benzer, bu nedenle bu oyun turu icin nisan alma ve atis becerilerinize ihtiyaciniz olacak.",
				"Oynamaya baslamadan once bazi temel bilgileri ogrenmeniz gerekiyor...",
				"\nHer turun basinda, oyun sirasindaki gorevinizin ne oldugunu tanimlayan bir \x8BRol\x80 alacaksiniz. Iste alabileceginiz 3 olasi \x8BRoller\x80:",
				" * \x85Katil\x80 - Gercek bir suclu. Herkesi oldurmek zorundalar, ancak sadece Bicak ve Kirmizi Yuzuklerle donatilmislardir",
				" * \x84Serif\x80  - Gorevleri, \x85Katil(ler)\x80i bulmak ve ortadan kaldirmaktir. Serifler haritada bulunan her silah yuzuklerini kullanabilir;",
				" * \x83Masum\x80 - Tamamen silahsiz siviller, oldurulmekten kacinmalari gerekir ama ayni zamanda \x85Katil\x80'i bulmaya da yardimci olmalari gerekir.",
				"\nOynamaya baslamak icin gereken tum temel bilgiler bu kadar, daha fazla bilgi icin su komutlari kullanabilirsiniz:"
			},["GAME"]={
				"\x87".."Oynanis durumlari hakkinda",
				"Temel bilgilerde daha once aciklandigi gibi, seriflerin amaci tum \x85Katil(ler)\x80i ortadan kaldirmaktir, ancak farkli oyun durumlari ortaya cikabilir:",
				"\n* Oldurulurseniz, \x8F Olu\x80 durumuna girersiniz. Bu durumdaki oyuncular yeniden dogamaz veya hala hayatta olan oyuncularla kuresel olarak konusamaz, mesajlari yalnizca diger \x8F olu\x80 oyuncular tarafindan gorulebilir.",
				"\x8F Olu\x80 iken hala hayatta olan oyuncularla konusamazsin/PM yapamazsin.",
				"Ayrica\x82 KENDINIZI YENIDEN ADLANDIRMAYA CALISMAYIN\x80, bununla ilgili daha fazla ayrinti \x87MMHELP BAD\x80'de.",
				"\n* \x84Serif'in \x80 gorevi, etraftaki tum \x85Katilleri\x80'i ortadan kaldirmaktir, ancak kazara bir \x83Masum\x80'u vurmalari mumkundur.",
				"Bu gerceklesirse, \x84Serif\x80 bir \x83Masum\x80'a donusecek ve rastgele bir \x83Masum\x80 sinsice rolunu ustlenecektir. Bir dahaki sefere birini \x84serif\x80 olarak vurmak istediginizde, o tetigi cekmeden once iki kez dusunun!",
				"\n* Bir \x85Katil\x80, bir \x84Serif\x80'i oldururse ve hala \x83Masum\x80 hayatta kalirsa, serif \x84serif'in Zumrutu\x80'i cesedinin yanina birakacaktir.",
				"7 Kaos Zumrutu'nun aksine, bu zumrut \x82Kahraman\x80 rolunu onu alan herhangi bir \x83Masum\x80'a atayacak. \x83Masumlar\x80'dan biriyseniz, bu bir Kahraman olma ve herkesi \x85Katil(ler)\x80'den kurtarma sansiniz!",
				"\x82Kahraman\x80 rolu, \x84Serif\x80'den bazi detaylar disinda farkli degildir, ornegin \x82Kahraman\x80 bir \x83Masum\x80 oldurdugunde, rolu paylasilmaz ve her ikisi de olur Bir Kahraman olumunde \x84serif'in Zumrutu\x80 dusmeyecektir",
				"\n* Oyuncu sayisina bagli olarak, turdaki oyuncular arasinda birden fazla \x85Katil\x80 ve \x84serif\x80 olabilir. Ornegin, 7 ve daha fazla oyuncudan baslayarak, \x85Katiller\x80 ve \x84Serifler\x80'den \x8BTakimlar\x80 olusturulacaktir.",
				"\x8BTakim arkadaslari\x80, \x87SAYTEAM\x80 konsol komutuyla takim sohbetlerinde birbirleriyle sohbet edebilir (SAYTEAM sohbet dugmesinin normal sohbetle ayni sekilde calisacagini unutmayin).",
				"Bir \x8BTakim arkadasi\x80 baska bir takim arkadasina vurursa, her ikisi de birbirlerini tanimalarini saglayacak kisisellestirilmis bir uyari alir. Baskalarinin 'arkadasca' etkilesiminizi gorebilecegini ve kim oldugunuzu anlayabilecegini unutmayin!"
			},["BAD"]={
				"\x87Murder Mystery'de yapilmasi kotu olan seyler",
				"Herhangi bir oyunun 1 numarali kurali:\x82 Nazik olun ve eglenin!\x80 Bunun disinda...",
				"* \x8BRol\x80un kendini simartmasi oyunu bir 'gizem' yapmaz, eger eminseniz baskasinin rolunu soyleyebilirsiniz, ancak kendinizinkini asla soylemeyin.",
				"* Diger oyunculara hakaret etmeyin, sakalara izin verilir, ancak yalnizca arkadasca bir ruh hali icinde. Her oyuncuyu sebepsiz yere suclarsaniz kimse size guvenmez.",
				"* AFK olmak bir savas sucudur. Bombalar atilacak ve cok uzun sure hareketsiz kalirsaniz sunucudan otomatik olarak cikarsiniz.",
				"* Oluyken bir tur sirasinda kendinizi yeniden adlandirmayin, bunu yapmak sizi sunucudan atacaktir. Hayattaysaniz yeniden adlandirabilirsiniz. Aranin guvenli bir sekilde yeniden adlandirilmasini bekleyin.",
				"Bu kurallardan birini ihlal etmek, oyundan atilma veya bazi durumlarda Yonetici tarafindan yasaklanma ile sonuclanabilir! Lutfen onlari kirmayin ve adil oynayin."
			},["CHAT"]={
				"\x87Ses Emojisi nasil kullanilir?",
				"Bir oyuncu belirli kelimeleri/cumleleri iceren bir mesaj gonderdiginde, bir ses calinacaktir.",
				"Ornegin, \"bruh\" iceren bir mesaj gonderdiginizde, herkes \"BRUH\" sesini duyacaktir",
				"Iste Ses Emojilerinin tam listesi ve her birinin nasil etkinlestirilecegi:"
			},["TIPS"]={
				"\x87Faydali ipuclari",
				"MM'deki oyununuz sirasinda size yardimci olabilecek bazi ipuclari topladik:",
				"\n* Karakter yetenekleri yonetici tarafindan devre disi birakilirsa, iz birakmadan veya gurultu yapmadan gizlice dolasmak icin \x82SPIN\x80 tusuna basin;",
				"\n* \x84Serif'in Zumrutu\x80'nu aldiginizda, onceden topladiginiz tum silahlara ve yuzuklere erisebileceksiniz;",
				"\n* \x87SAYTEAM\x80 komutunu kullanarak \x8BTakim\x80'inizin kim oldugunu bulmak, onlari vurmaktan kacinmanizi ve yanlislikla rolunuzu ortaya cikarmanizi saglayacagi icin yardimci olacaktir;",
				"\n* 3 saniyeligine yenilmezlik kazanmak icin lav, sivri uclar ve ates gibi engellerden zarar alabilirsiniz;",
				"\n* Haritada saklanacak bir yer aramaya calisin. Bazen istenmeyen tanitimlardan kurtulmaya yardimci olur;",
				"\n* Rolunuz sizdirilirsa, kendinizi yeniden adlandirabilir ve/veya ten rengini degistirebilirsiniz. \x81Yeniden adlandirmanizin sohbette gosterilecegini unutmayin;",
				"\n* Gizlice girerseniz bicak saldiri sesi cikarmaz. Ayrica,\x82 FIRENORMAL\x80 dugmesi, yuzukleriniz oldugu surece Bicagi her yerde kullanmaniza izin verir (Masumlarin bicagi yoktur)"
			}
		},["ROLE_GET"]={
			"Sen \x85Katilsin\x80! \x85Herkesi oldur!",
			"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.",
			"Sen bir \x83Masum\x80'sun! saklan ve sorusturmaya yardim et."
		},["NEWROLE_GET"]={
			"\x87Hayat rastgele karar verdi \x85Katil\x87.\x85 simdi git herkesi oldur!",
    	    "\x87Senin rolun \x84Serif\x87! Git ve\x84 tum Katilleri ortadan kaldir\x87!",
			"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!"
		},["TEAMMATE_HIT"]={
			"Bu oyuncu senin takim arkadasin. sizden intikam almalarini istemediginiz icin bir dahaki sefere takim arkadaslariniza vurmayin.",
			"Bir takim arkadasiniz size vurdu. Ondan intikam almayi planlamayin."
		},["MURD_KILLED"]={
			"\x85Katil\x87",
			"\x80olduruldu"
		},["SHERI_KILLED"]={
			"\x84serif\x87",
			"\x80olduruldu! Onun\x84 Zumrut\x80'unu bulun!",
			"\x80olduruldu!"
		},["HERO_KILLED"]={
			"\x82Kahraman\x87",
			"\x80olduruldu!"
		},["SHREML_PICK"]="Birisi \x84Serif'in Zumrut\x80'unu aldi...",
		["INNO_HURT_PM"]={
			"\x87Sen ldurdun bir \x83Masum\x87! Kovuldun. (Artik bir serif degilsin)",
			"\x82Kahramanlar\x87, \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin olum cezasi aldiniz."
		},["INNO_HURT"]={
			"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
			"\x82Kahraman\x80 bir aptal, bir \x83Masum\x80'u oldurdu. simdi ikisi de olu yatiyor. Yaziklar olsun \x82 Aptal\x80"
		},["ONE_LEFT"]={
			"\x85Katillerden biri\x80 cikti!",
			"\x84seriflerden biri\x80 cikti!!!",
			"\x82Kahramanlardan biri\x80 bizi terk etti!"
		},["LAST_LEFT"]={
			"son \x85Katil\x80 cikti!",
			"son \x84Serif\x80 cikti!",
			"son \x82Kahraman\x80 cikti!"
		},["REPLACE_LEFT"]={
			"\x85Katil\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"\x84serif\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
			"Bir \x82Kahraman\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!"
		},["ENDROUND"]={
			"Herkes oldu. \x85Katiller\x80 kazandi!",
			"Tum \x85Katiller\x80 olduruldu! \x83 Siviller\x80 kazandi!",
			"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84serif\x80'e yaziklar olsun",
			"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
			"\x83 Masumlarin savunuculari\x80 oldu. \x85Katiller\x80 kazandi!"
		},["CHAT"]={
			"Canli, mesaj gonderilmedi",
			"Cok fazla mesaj gonderiyorsun, lutfen bekle",
			"Izleyici moduna gecmek icin \x8F ol\x80!"
		},["BMP_PEOPLE"]={
			"\xFFIIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"\xFFIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"II\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_ALIVE"]={
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\x1F",
			"IIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F",
			"II\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_TIME"]={
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\xFFII\x1F\x1F\x1F\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\xFFIIII\x1F\xFFII\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIIIIII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIII\x1FII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIII\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F",
			"\xFFIIIII\x1F\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\xFFII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFFIII\x1F",
			"IIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\x1FII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F"
		},["ROLES_HUD"]={
			"KATIL",
			"\xDE".."ERIF",
			"MASUM",
			"KAHRAMAN",
			"\xD6L\xDC"
		},["ROLES_HUD_SHORT"]={
			"KATI",
			"\xDE".."ERI",
			"MASU",
			"KAHR",
			"\xD6L\xDC"
		},["TEAMALIVE_HUD"]="Takim arkada\xFElari hayatta:",
		["KILLBY_HUD"]="Tarafindan \xF6ld\xFCr\xFCld\xFC",
		["STUPID"]="senin aptall\xFD\xF0\xFDn",
		["HUD_SCORESTAB"]={
			"Burada puan yok! Ama alttaki saya\xE7lar",
			"soru\xFEturmada size yardimci olabilir!",
			"",
			"Oyun turunde yeniyseniz konsola",
			"\7MMHELP\0 yazin.",
			"",
			"Oyun i\xE7".."eri\xF0inin dilini de\xF0i\xFEtirmek i\xE7in",
			"konsola \7MMLANG [dil]\0 yazin.",
			"",
			"\2Iyi e\xF0lenceler!"
		},["HUD_ROLESALIVE"]={
			"Katiller yasiyor:",
			"\xDE".."erifler yasiyor:",
			"Masumlar yasiyor:"
		},["HUD_DEAD"]={
			"\15Oldun!",
			"Yeniden do\xF0".."amaz veya konu\xFE".."amazsin",
			"olmemis insanlar."
		},["HUD_MIDJOIN"]={
			"\4tur ortasinda\0 katildiniz, l\xfCtfen bu turun bitmesini bekleyin."
		},["HUD_ALONE"]={
			"Oyunun ba\xFElamasi i\xE7in en az \4".."2 oyuncu",
			"gereklidir, Lutfen \4bir ki\xFEinin\0 daha",
			"gelmesini bekleyin"
		},["HUD_SHOWDOWN"]="Showdown duel!",
		["YOU_HUD"]="SEN",
		["WINNERS_HUD"]="Kazananlar:",
		["WON_HUD"]="kazandi!",
		["WINS_HUD"]="Kazandi",
		["WIN_HUD"]={
			"BERABERE!",
			"\5KATILLER",
			"\3SIVILLER"
		},["MMLANG"]={
			"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola sunu yazarak degistirebilirsiniz: \x87MMLANG [dil]",
			"Murder Mystery icin kisisel dil \x82Turkce olarak ayarlanmistir"
		}
	},["UA"]={ -- Ukrainian
		["VERSION"]="10.1-BETA",
		["AUTHOR"]="LeonardoTheMutant",
		["CHARSET"]="1251C",
		["NONASCII"]=true, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
		["MM"]="\xD2\xE0\xBA\xEC\xED\xE8\xF6\xFF \xC2\xE1\xE8\xE2\xF1\xF2\xE2\xE0", --Tajemnycia Wbywstwa
		["MMHELP_CMD"]={
			["CONTENTS"]={
				"\x8AZmist:", --zmist
				"\x87MMHELP GAME\x80 - Bil'she pro gameplay ta igrowi sytuaciji;",
				"\x87MMHELP BAD\x80  - Spysok zaboronenyh rechej w TW;",
				"\x87MMHELP CHAT\x80 - Spysok Zwukowych Emoji kotri mozhna wykorystaty w chati;",
				"\x87MMHELP TIPS\x80 - Mala kolekcija porad dlia tebe;";
				"\x87MMHELP INFO\x80 - Technichna informacija ta \"Sho nowogo\".",
				"\n\x87MMLANG\x80      - Zminuty mowu kontentu w TW"
			},["NOTFOUND"]={
				"Storinka",
				"ne isnuje. Bud' Laska oznajomtesia zi zmistom:"
			}
		},["MMHELP"]={
			/*
			["MAIN"]={
				"\7\xC2\xB3\xF2\xE0\xBA\xEC\xEE \xE2 \xD2\xE0\xBA\xEC\xED\xE8\xF6\xB3 \xC2\xE1\xE8\xE2\xF1\xF2\xE2\xE0!",
				"\7\xB2\xED\xF2\xE5\xF0\xEF\xF0\xE5\xF2\xE0\xF6\xB3\xFF \xEF\xEE\xEF\xF3\xEB\xFF\xF0\xED\xEE\xBF \xE1\xE0\xE3\xE0\xF2\xEE\xEA\xEE\xF0\xE8\xF1\xF2\xEA\xF3\xE2\xE0\xF6\xFC\xEA\xEE\xBF \xE3\xF0\xE8 \xE2 SRB2",
				"\xD6\xB3\xEB\xFC \xE3\xF0\xE8 \xEF\xEE\xEB\xFF\xE3\xFF\xBA \xF3 \xE7\xED\xE0\xF5\xEE\xE4\xE6\xE5\xED\xED\xB3 \xB3 \xE5\xEB\xB3\xEC\xB3\xED\xE0\xF6\xB3\xBF \xF3\xF1\xB3\xF5 \5\xE2\xE1\xE8\xE2\xF6\xFC\0 \xEF\xEE\xEA\xE8 \xE2\xEE\xED\xE8 \xED\xE5 \xE2\xE1\xE8\xEB\xE8 \3\xF3\xF1\xB3\xF5 \xB3\xED\xF8\xE8\xF5\0. \xD6\xFF \xE3\xF0\xE0 \xEF\xEE\xE4\xB3\xE1\xED\xE0 \xE4\xEE \xF0\xE5\xE6\xE8\xEC\xF3 MATCH \xF2\xEE\xEC\xF3 \xE2\xE0\xEC \xE7\xED\xE0\xE4\xEE\xE1\xEB\xFF\xF2\xFC\xF1\xFF \xE2\xE0\xF8\xB3 \xE2\xEC\xB3\xED\xED\xFF \xEF\xF0\xE8\xF6\xB3\xEB\xFE\xE2\xE0\xED\xED\xFF \xB3 \xF1\xF2\xF0\xB3\xEB\xFC\xE1\xE8.",
				"\xC0\xEB\xE5 \xF1\xEF\xE5\xF0\xF8\xF3 \xE2\xE0\xEC \xF2\xF0\xE5\xE1\xE0 \xEF\xEE\xFF\xF1\xED\xE8\xF2\xE8 \xE1\xE0\xE7\xEE\xE2\xB3 \xF0\xE5\xF7\xB3 \xEF\xE5\xF0\xF8 \xED\xB3\xE6 \xE2\xE8 \xEF\xEE\xF7\xED\xE5\xF2\xE5 \xE3\xF0\xE0\xF2\xE8...",
				"\n\xCD\xE0 \xEF\xEE\xF7\xE0\xF2\xEA\xF3 \xEA\xEE\xE6\xED\xEE\xE3\xEE \xF0\xE0\xF3\xED\xE4\xF3 \xE2\xE0\xEC \xE2\xE8\xE4\xE0\xE4\xF3\xF2\xFC \11\xF0\xEE\xEB\xFC\0 \xEA\xEE\xF2\xF0\xE0 \xE2\xE8\xE7\xED\xE0\xF7\xE0\xF2\xE8\xEC\xE5 \xF9\xEE \xE2\xE8 \xE1\xF3\xE4\xE5\xF2\xE5 \xF0\xEE\xE1\xE8\xF2\xE8 \xED\xE0\xEF\xF0\xEE\xF2\xFF\xE7\xB3 \xE3\xF0\xB3. \xCE\xF1\xFC \xF3\xF1\xB3 3 \xEC\xEE\xE6\xEB\xE8\xE2\xB3 \11\xF0\xEE\xEB\xB3\0 \xFF\xEA\xB3 \xEC\xEE\xE6\xED\xE0 \xEE\xF2\xF0\xE8\xEC\xE0\xF2\xE8 \xEF\xF0\xE8 \xF1\xF2\xE0\xF0\xF2\xB3:",
				" * \5\xC2\xE1\xE8\xE2\xF6\xFF\0 - \xB3\xEA\xEE\xED\xE0 \xEA\xF0\xE8\xEC\xB3\xED\xE0\xEB\xF3. \xCE\xF1\xEE\xE1\xE0\xEC\x20\xE7 \xF6\xB3\xBA\xFE \xF0\xEE\xEB\xEB\xFE \xEF\xEE\xF2\xF0\xB3\xE1\xED\xEE \xE2\xE1\xE8\xF2\xE8 \xEA\xEE\xE6\xED\xEE\xE3\xEE \xE3\xF0\xE0\xE2\xF6\xFF. \xC3\xF0\xE0\xE2\xF6\xB3 \xE7 \xF6\xB3\xBA\xFE \xF0\xEE\xEB\xEB\xFE \xEC\xEE\xE6\xF3\xF2\xFC \xE2\xE8\xEA\xEE\xF0\xE8\xF1\xF2\xEE\xE2\xF3\xE2\xE0\xF2\xE8 \xF2\xB3\xEB\xFC\xEA\xE8 \7\xD7\xE5\xF0\xE2\xEE\xED\xB3 \xEA\xB3\xEB\xFC\xF6\xFF\0 \xE4\xEB\xFF \xF1\xF2\xF0\xB3\xEB\xFC\xE1\xE8;",
				" * \4\xD8\xE5\xF0\xE8\xF4\0 - \xD6\xB3\xEB\xFC \xEF\xEE\xEB\xB3\xF6\xB3\xBF \xF3 \xF6\xB3\xE9 \xE3\xF0\xE8 \xEF\xEE\xEB\xFF\xE3\xFF\xBA \xED\xE0 \4\xE7 \xED\xE0\xF5\xEE\xE4\xE6\xE5\xED\xED\xB3 \xB3 \xE5\xEB\xB3\xEC\xB3\xED\xE0\xF6\xB3\xBF\0 \xF3\xF1\xB3\xF5 \5\xE2\xE1\xE8\xE2\xF6\xFC\0. \xD8\xE5\xF0\xE8\xF4\xE0\xEC \xE4\xEE\xF1\xF2\xF3\xEF\xED\xB3 \xEA\xEE\xE6\xED\xB3 \xF2\xE8\xEF\xE8 \xE7\xE1\xF0\xEE\xBF \xE4\xEE\xF1\xF2\xF3\xEF\xED\xB3 \xED\xE0 \xEB\xEE\xEA\xE0\xF6\xB3\xBF;",
				" * \3\xCD\xE5\xE2\xE8\xED\xED\xE0 \xEE\xF1\xEE\xE1\xE0\0 - \xD6\xE8 \xEB\xFE\xE4\xFF\xEC \xF2\xF0\xE5\xE1\xE0 \xEE\xF1\xF2\xE5\xF0\xB3\xE3\xE0\xF2\xE8\xF1\xFF \xEA\xEE\xED\xF2\xE0\xEA\xF2\xF3 \xE7 \xE2\xE1\xE8\xE2\xF6\xFF\xEC\xE8 \xB3 \xE7\xE0\xEB\xE8\xF8\xE0\xF2\xE8\xF1\xFF \xE6\xE8\xE2\xE8\xEC\xE8.",
				"\n\xD6\xE5 \xF3\xF1\xFF \xE1\xE0\xE7\xEE\xE2\xE0 \xB3\xED\xF4\xEE\xF0\xEC\xE0\xF6\xB3\xFF \xEF\xEE\xF2\xF0\xB3\xE1\xED\xE0 \xE0\xE1\xE8\x20\xEF\xEE\xF7\xE0\xF2\xE8 \xE3\xF0\xE0\xF2\xE8\x2E \xDF\xEA\xF9\xEE \xE2\xE8 \xF9\xE5 \xF7\xEE\xE3\xEE\xF1\xFC \xED\xE5 \xF0\xEE\xE7\xF3\xEC\xB3\xBA\xF2\xE5 \xE0\xE1\xEE \xF5\xEE\xF7\xE5\xF2\xE5 \xE7\xED\xE0\xF2\xE8 \xE1\xB3\xEB\xFC\xF8\xE5\x2C \xF2\xEE \xEF\xF0\xEE\xEF\xEE\xED\xF3\xBA\xEC\xEE \xE2\xE0\xEC \xEF\xF0\xEE\xF7\xE8\xF2\xE0\xF2\xE8 \xF6\xE5\xE9 \xEC\xE0\xED\xF3\xE0\xEB \xE4\xEE \xEA\xB3\xED\xF6\xFF"
			*/
			["MAIN"]={
				"\x87Witajemo w Tajemnyci Wbywstwa!",
				"\x87Inteprytaciji populiarnoji bagatokorystuwac'koji gry w SRB2",
				"Cil' gry poliagaje u znahodzhenni i eliminaciji usih \x85Wbywc'\x80 poky wony ne wbyly \x83inshyh grawciw\x80. Cia gra podibna do rezhymu MATCH tomu wam znadobliatsia washi wminnia pryciliuwannia i stril'by.",
				"Ale spershu wam treba pojasnyty dejaki bazowi rechi persh nizh wy pochnete graty...",
				"\nNa pochatku kozhnogo raundu wam wydadut' \x8BRol'\x80 kotra wyznachatyme shio wy budete robyty naptotiazi gry, os' usi try mozhlywi \x8Broli\x80 kotri mozhna otrymaty na starti:",
				" * \x85Wbywcia\x80 - Ikona kryminalu. Osobam z cijeju rolliu potribno wbyty kozhnogo grawcia, takozh wony mozhut' wykorystowuwaty til'ky Niz ta Cherwoni kil'cia dlia stril'by;",
				" * \x84Sheryf\x80 - Cil' policiji u cij gri poliagaje na \x84znahodzhenni i eliminaciji usih Wbywc'\x80. Sheryfam dostupna usia zbroja jaka je na lokaciji;",
				" * \x83Newynna osoba\x80 - Cym grawciam treba osterigatysia kontaktu z Wbywciamy i zalyshatysia zhywymy.",
				"\nCe usia bazowa informacia potribna aby pochaty graty. Jaksho wy she chogos' ne rozumijete abo hochete znaty bil'she, to proponujemo wam prochytaty cej manual do kin'cia"
			},["GAME"]={
				"\x87Pro gameplay ta igrowi sytuaciji",
				"Jak skazano ranishe na pochatku cil' gry - eliminuwaty usih \x85Wbywc'\x80, ale pid chas gry mozhut' wynyknuty rizni sytuaciji:",
				"\n* Jaksho u was htos' popade kil'cem wy stanete \x8FMertwym\x80. Grawci w ciomu stani ne mozhut' widrodzhuwatysia ta goworyty do zhywych grawciw, jih powidomlennia mozhut' bachyty til'ky inshi \x8FMertwi\x80 grawci.",
				"Wy ne mozhete goworyty abo nadsylaty prywatni powidomlenia poky wy \x8FMertwi\x80.",
				"Uwaga: \x82NE NAMAGAJTESIA ZMINYTY SWOJE IM'JA GRAWCIA\x80, detal'nishe pro ce opysano w \x87MMHELP BAD\x80.",
				"\n* Zadacha \x84Sheryfa\x80 poliagaje na eliminaciji usih \x85Wbywc'\x80, ale inodi Sheryf mozhe wypadkowo wbyty \x83Newynnych\x80.",
				"Koly ce stajet'sia \x84Sheryf\x80 peretworyt'sia na cywilnogo i wypadkowa \x83Newynna osoba\x80 otrymaje ciu rol'. Nastupnogo razu jak nadumajete striliaty w kogos' podumajte kogo wy zbyrajetesia wbywaty jak \x84Sheryf\x80!",
				"\n* Koly \x85Wbywcia\x80 wbywaje \x84Sheryfa\x80 gynuchyj zachystnyk mozhe zalyshyty swij \x84Smaragd Sheryfa\x80 bilia swogo trupa.",
				"Na widminu wid 7-my Haos Smaragdiw cej smaragd daje rol' \x82Geroja\x80 kozhnij \x83Newynnij osobi\x80 jaka persha znajde ta pidbere jogo. Jaksho wy odna z \x83Newynnych osoib\x80 to ce wash shans staty Gerojem i wriatuwaty usih wid \x85Wbywc'\x80!",
				"Rol' \x82Geroja\x80 ne duzhe widrizniajet'sia wid \x84Sheryfa\x80 krim kil'koh detalej jak, napryklad, koly \x82Geroj\x80 wbywaje \x83Newynnu osobu\x80 nijaka rol' ne peredajet'sia inshym i oboje prosto gynut'. Takozh \x82Geroj\x80 ne zalyshaje \x84Smaragd Sheryfa\x80 pry swojij smerti.",
				"\n* Dywliachys' na kilkist' grawciw online u raundi mozhut' zjawliatysia bilshe nizh odna \x85Wbywcia\x80 ta \x84Sheryf\x80. Napryklad, pochynajuchy wid 7 grawciw ta bil'she fromujut'sia \x8BKomandy\x85 Wbywc'\x80 ta \x84Sheryfiw\x80.",
				"\x8BNaparnyky\x80 mozhut' westy peregowory odyn z odnym u swojemu Komandnomu Chati wukorystowujuchy konsol'nu komandu \x87SAYTEAM\x80 (zauwazhte sho knopka dla chatu SAYTEAM aktywuje zwychnyj chat).",
				"Jaksho odyn z \x8Bnaparnykiw\x80 nashkodyt' inshomu oboje otrymajut' personalizowane poperedzhennia jake \'poznajomyt'\' jich dwoch. Pamiatajte sho inshi mozhut' pobachyty washu 'druzhniu' sutychku ta zrozumity hto wy nasprawdi!"
			},["BAD"]={
				"\x87Rechi jaki zaboroneni w Tajemnyci Wbywstwa",
				"Prawylo No.1 kozhnoji gry:\x82 Bud' wwichlywyj ta nasolodzhyjsia groju!\x80 Okrim ciogo...",
				"\n* Gra ne stanowyt'sia \'tajemnychoju\' koly wy wsim opowidajete pro swoju \x8BRol'\x80. Wy mozhete rozkazaty usim pro roli inshyh, ale nikoly ne powidomliajte pro swoju.",
				"* Ne znushajtesia z inshyh grawciw. Zharty dozwoleno, ale w dobromu gumori. Nihto wam ne bude wiryty jaksho budete zwynuwachuwaty usih, napryklad, Wbywceju.",
				"* Buty neaktywnyhm ce wojennyj zlochyn. Koly grawci dowgyj chas neaktywni gra wyganiaje jich (til'ky jaksho wony zhywi).",
				"* Ne zminiujte swogo imeni grawcia POKY WY MERTWI - gra serjozna na cej wypadok i\x85 automatychno wyzhene\x80 was z gry jaksho wy ce zrobyte. Prosto zachekajte na ekran zakinczennia raundu aby bezpechno zminity im'ja.",
				"\nIgnoruwannia odnogo z cyh prawyl mozhe rezul'tuwaty kick abo w dejakyh wypadkah nawit' ban wid admina serweru. Bud' laska ne ignorujte prawyla i grajte chesno."
			},["CHAT"]={
				"\x87Jak wykorystowuwaty Zwukowi Emodzhi",
				"Koly grawec' nadsylaje powidomlennnia kotre mistyt' u sobi jakis' special'ni slowa-kluchi abo frazy usi pochujut' Zwukowe Emodzhi razom z tym powidomlenniam.",
				"W osnownomy, koly wy nadishlete \"bruh\" u chat usi pochujut' BRUH razom iz washym powidomlenniam",
				"Os' pownyj spysok Zwukowych Emodzhi ta jak jich aktywuwaty:\n"
			},["TIPS"]={ --work in progress
				"\x87Igrowi porady",
				"My zibraly dla was kil'ka porad jaki mozhut' wam staty u prygodi:",
				"\n* Jaksho special'ni mozhlywosti personazhiw wymkneno natysnit' \x82SPIN\x80 aby tyho krastysia i ne zalyshaty pisl'a sebe slidiw ta zwukiw;",
				"\n* Koly wy pidberete \x84Smaragd Sheryfa\x80, wam stanut' dostupni usi typy zbroji, jaku wy zazdalegit' zibraly;",
				"\n* Swoich naparnykiw u komandi mozhna legko znajty za dopomogoju komandy \x87SAYTEAM\x80, ce mozhe duzhe dopomogty wam, oskil'ky wy unyknajete strilianyny i wypadkowogo wykryttia washoji roli;",
				"\n* Mozhna natrapyty na taki pereshkody jak: lawa, shypy ta wogon' aby otrymaty neujazwymist' na 3 sekundy;",
				"\n* Sprobujte znajty sobi misce dl'a showanky u kozhnomu riwni. Chasamy wono dopomagaje ukrytysia wid zajwoji uwagy;",
				"\n* Jaksho washa rol' wykryta mozhna zminyty swoje im'ja ta/abo zminyty kolir personazhu. \x81Pamijatajte sh'o zmina imeni bude wydna u chati.",
				"\n* Knopka\x82 FIRENORMAL\x80 dozwoliaje wykorystowuwaty Niz usiudy, jaksho wy majete kil'cia (Newynni ne majut' Nozha). Takozh, Nizh nie robyt' zwukiw ataky jaksho wy kradetesia."
			}
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
		},
		["SHREML_PICK"]="Htos' uziaw \x84Smaragd Sheryfa\x80...",
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
		},["CHAT"]={
			"sh'e zyje, powidomlennia ne nadislano",
			"Ty nadsylajesz zabagato powidomlen', bud' laska zachekaj",
			"Ne mozhna prosto tak \x8Fpomerty\x80 shob dywytysia za groju!"
		},["BMP_PEOPLE"]={
			"\xFFIIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"\xFFIIIII\x1F\xFFIIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIII\x1F",
			"II\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_ALIVE"]={
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFF\xFFIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\x1F",
			"IIIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIIII\x1F",
			"II\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\x1F\x1F\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFIIIIII\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_TIME"]={
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"IIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\xFFII\x1F\x1F\x1F\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\xFFIIII\x1F\xFFII\x1F",
			"\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIIIIII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIII\x1FII\x1F\xFFIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\x1F\x1F\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
			"\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F"
		},["BMP_RINGS"]={
			"\xFFIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF",
			"\xFFIIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"\xFFII\x1F\x1FII\x1F\xFF\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
			"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIII\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F",
			"\xFFIIIII\x1F\x1F\xFF\xFFII\x1F\xFF\xFFIIIII\xFFII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFFIII\x1F",
			"IIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FIIII\x1F\xFFII\x1FIII\x1F\xFF\xFF\xFF\xFFIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\x1FII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
			"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\x1F",
			"\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F"
		},["ROLES_HUD"]={
			"\xC2\xC1\xC8\xC2\xD6\xDF", --WBYWCIA
			"\xD8\xC5\xD0\xC8\xD4", --SHERYF
			"\xCD\xC5\xC2\xC8\xCD\xCD\xC0 \xCE\xD1\xCE\xC1\xC0", --NEWYNNA OSOBA
			"\xC3\xC5\xD0\xCE\xC9", --HEROJ
			"\xCC\xC5\xD0\xD2\xC2\xC8\xC9" --MERTWYJ
		},["ROLES_HUD_SHORT"]={
			"\xC2\xC1\xC8\xC2.", --WBYW.
			"\xD8\xC5\xD0\xC8\xD4", --SHERYF
			"\xCD\xC5\xC2.", --NEW.
			"\xC3\xC5\xD0\xCE\xC9", --GEROJ
			"\xCC\xC5\xD0\xD2\xC2." --MERTW.
		},["TEAMALIVE_HUD"]="\xCD\xE0\xEF\xE0\xF0\xED\xE8\xEA\xB3\xE2 \xE2 \xE6\xE8\xE2\xE8\xF5:", --naparnykiw w zhywyh
		["KILLBY_HUD"]="\xC2\xE8 \xE2\xE1\xE8\xF2\xB3", --wy wbyti
		["STUPID"]="\xC2\xE0\xF8\xE8\xEC \xB3\xE4\xB3\xEE\xF2\xE8\xE7\xEC\xE5\xEC", --washym idiotyzmem
		["HUD_SCORESTAB"]={
			"\xCE\xF7\xEE\xEA \xF2\xF3\xF2 \xED\xE5\xEC\xE0, \xE0\xEB\xE5 \xEB\xB3\xF7\xE8\xEB\xFC\xED\xE8\xEA\xE8 \xF3\xED\xE8\xE7\xF3", --Ochok tut nema, ale lichyl'nyky unyzu
            "\xEC\xEE\xE6\xF3\xF2\xFC \xE4\xEE\xEF\xEE\xEC\xEE\xE3\xF2\xE8 \xF3 \xF0\xEE\xF1\xEB\xB3\xE4\xF3\xE2\xE0\xED\xED\xB3!", --mozhut' dopomogty w rosliduwanni!
            "",
			"\xDF\xEA\xF9\xEE \xE2\xE8 \xE3\xF0\xE0\xBA\xF2\xE5 \xEF\xE5\xF0\xF8\xE8\xE9 \xF0\xE0\xE7 \xF3 \xF6\xFE \xE3\xF0\xF3", --Jaksho wy grajete pershyj raz u ciu gru
            "\xE2\xE8\xEA\xEE\xF0\xE8\xF1\xF2\xE0\xE9\xF2\xE5 \7MMHELP\0 \xF3 \xEA\xEE\xED\xF1\xEE\xEB\xB3", --wykorystajte MMHELP w konsoli
			"\xE4\xEB\xFF \xB3\xED\xF4\xEE\xF0\xEC\xE0\xF6\xB3\xBF \xF2\xE0 \xEF\xF0\xE0\xE2\xE8\xEB",
			"",
			"\xC2\xE8\xEA\xEE\xED\xE0\xE9\xF2\xE5 \xEA\xEE\xEC\xE0\xED\xE4\xF3 \7MMLANG\0 \xE0\xE1\xE8 \xE7\xEC\xB3\xED\xE8\xF2\xE8", --Wykonajte komandu MMLANG aby zminyty
			"\xEC\xEE\xE2\xF3 \xF3 \xF6\xFC\xEE\xEC\xF3 \xB3\xE3\xF0\xEE\xE2\xEE\xEC\xF3 \xF0\xE5\xE6\xE8\xEC\xB3", --mowu u ciomu igrowomu rezhymi
            "",
            "",
			"\2\xD3\xE4\xE0\xF7\xB3  ;)" --Udachi
		},["HUD_ROLESALIVE"]={
			"\xC2\xE1\xE8\xE2\xF6\xFC \xE2 \xE6\xE8\xE2\xE8\xF5:", --Wbywc' w zhywych
			"\xD8\xE5\xF0\xE8\xF4\xB3\xE2 \xE2 \xE6\xE8\xE2\xE8\xF5:", --Sheryfiw w zhywych
			"\xCD\xE5\xE2\xE8\xED\xED\xE8\xF5 \xE2 \xE6\xE8\xE2\xE8\xF5:" --Newynnych w zhywych
		},["HUD_DEAD"]={
			"\xC2\xE8 \15\xEC\xE5\xF0\xF2\xE2\xB3", --Wy metrwi,
			"\xC2\xE8 \xED\xE5 \xEC\xEE\xE6\xE5\xF2\xE5 \xE2\xB3\xE4\xF0\xEE\xE4\xE6\xF3\xE2\xE0\xF2\xE8\xF1\xFF \xF2\xE0 \xE3\xEE\xE2\xEE\xF0\xE8\xF2\xE8", --Ne mozhete widrodzhuwatysia ta goworyty
			"\xE4\xEE \xE6\xE8\xE2\xE8\xF5 \xE3\xF0\xE0\xE2\xF6\xB3\xE2" --do zhywych grawciw
		},["HUD_MIDJOIN"]={
			"\xC2\xE8 \xEF\xF0\xE8\xBA\xE4\xED\xE0\xEB\xE8\xF1\xFF \4\xEF\xEE\xF1\xE5\xF0\xE5\xE4 \xF0\xE0\xF3\xED\xE4\xF3\0, \xE1\xF3\xE4\xFC \xEB\xE0\xF1\xEA\xE0, \xE7\xE0\xF7\xE5\xEA\xE0\xE9\xF2\xE5 \xED\xE0\xF1\xF2\xF3\xEF\xED\xEE\xE3\xEE", --wy pryjednalysia posered raundu, bud' laska, zachekajte nastupnogo
			"\xE0\xE1\xE8 \xE7\xE0\xE3\xF0\xE0\xF2\xE8" --aby zagraty
		},["HUD_ALONE"]={
            "\xC4\xEB\xFF \xF1\xF2\xE0\xF0\xF2\xF3 \xE3\xF0\xE8 \xEF\xEE\xF2\xF0\xB3\xE1\xED\xEE\4 2-\xBA \xE3\xF0\xE0\xE2\xF6\xB3\xE2\0,", --Dl'a startu gry potrebujetsia 2-je grawciw,
            "\xE1\xF3\xE4\xFC \xEB\xE0\xF1\xEA\xE0\x2C \xE7\xE0\xF7\xE5\xEA\xE0\xE9\xF2\xE5 \xED\xE0\4 \xF9\xE5 \xEE\xE4\xED\xEE\xE3\xEE", --bud' laska zachekajte na she odnogo,
            "\xE0\xE1\xE8 \xEF\xEE\xF7\xE0\xF2\xE8" --aby pochaty
		},["HUD_SHOWDOWN"]="\xC2\xE8\xF0\xB3\xF8\xE0\xEB\xFC\xED\xE0 \xE4\xF3\xE5\xEB\xFC!", --Wyrishal'na duel'!
		["MINIGAME_PRESS"]="\xCD\xE0\xF2\xE8\xF1\xED\xB3\xF2\xFC\2 CUSTOM3\0 \xE0\xE1\xE8", --Natysnit' CUSTOM3 aby
		["MINIGAME_LEAVE"]="\xE2\xE8\xE9\xF2\xE8", --wyjty
		["MINIGAME_CANCEL"]="\xF1\xEA\xE0\xF1\xF3\xE2\xE0\xF2\xE8", --skasuwaty
		["MINIGAME_SPECT"]="\xED\xE0\xE3\xEB\xFF\xE4\xE0\xF2\xE8", --nagliadaty
		["MINIGAME_DUEL"]="\xE7\xE0 \xE4\xF3\xE5\xEB\xFC\xED\xEE\xFE \xEC\xB3\xED\xB3\xE3\xF0\xEE\xFE", --za duel'noju minigroju
		["MINIGAME_REQ"]="\xE7\xB3\xE3\xF0\xE0\xF2\xE8 \xF3 \7PONG", --zigraty u PONG
		["MINIGAME_ACCEPT"]="\xEF\xF0\xE8\xE9\xED\xFF\xF2\xE8 \xE2\xE8\xEA\xEB\xE8\xEA \xF3 \7PONG\0!", --pryjniaty wyklyk u PONG!
		["MINIGAME_WAIT"]="\xD7\xE5\xEA\xE0\xBA\xEC\xEE \xED\xE0 \xE2\xB3\xE4\xEF\xEE\xE2\xB3\xF2\xFC \xEF\xF0\xEE\xF2\xE8\xE2\xED\xE8\xEA\xE0...", --Czekajemo na widpowid' protywnyka...
		["MINIGAME_SPECTN"]="\xCD\xE0\xE3\xEB\xFF\xE4\xFF\xBA\xEC\xEE \xE7\xE0 \xE3\xF0\xEE\xFE...", --Nagliadajemo za groju...
		["YOU_HUD"]="\xD2\xC8", --TY
		["WINNERS_HUD"]="\xC2\xE8\xE3\xF0\xE0\xEB\xE8:", --Wygraly:
		["WON_HUD"]="\xE2\xE8\xE3\xF0\xE0\xE2(\xEB\xE0)!", --Wygraw(la)!
		["WINS_HUD"]="\xCF\xE5\xF0\xE5\xEC\xEE\xE3", --Peremog
		["WIN_HUD"]={
			"\xCD\xB2\xD7\xC8\xDF!", --NICHYJA!
			"\5\xC2\xC1\xC8\xC2\xD6\xB2", --WBYWCI
			"\3\xD6\xC8\xC2\xB2\xCB\xDC\xCD\xB2" --CYWIL'NI
		},["MMLANG"]={
			"Potochna mowa w TW wstanowlena na \x82Ukrains'ku\x80\nWy mozhete zminyty jiji za dopomogoju komandy \x87MMLANG [mowa]",
			"\x82Ukrains'ka\x80 wstanowlena jak washa personal'na mowa w TW"
		}
	},
	--Russian, hard to convert to Latin letters
	/*
	["RU"]={
		["VERSION"]="8.2-BETA",
		["AUTHOR"]="LeonardoTheMutant",
		["CHARSET"]="1251C",
		["NONASCII"]=true,
		["MM"]="\xD2\xE0\xE9\xED\xE0 \xF3\xE1\xE8\xE9\xF1\xF2\xE2\xE0", --Tajna ubijstwa
		["MMHELP_CMD"]={
			["CONTENTS"]={ --Table of Contents
				"\x8ASoderzhanie:",
				"\x87MMHELP GAME\x80 - Pro gameplay i igrowyje situacyji;",
				"\x87MMHELP BAD\x80  - Spisok plohih weshej w TU;",
				"\x87MMHELP CHAT\x80 - Spisok Zwykowyh Emoji i kak imi pol'zowatsa;",
				"\x87MMHELP INFO\x80 - Tehnicheskaja informacja i \"Chto nowogo\";",
				"\n\x87MMLANG\x80      - Izmenit' jazyk contenta w TU"
			},
			["NOTFOUND"]={ --"page not found"
				"Stranica",
				"nie sushestwujet. Pozhalujsta oznakomtes' s soderzhaniem:"
			}
		},
		["MMHELP"]={ --MMHELP command
			["MAIN"]={ --When no page specified
				"\x87        Dobro pozhalowat' w Tajnu Ubijstwa!\nSRB2 interpretacyja popularnoj multiplejernoj igry!",
				"\nThe game's goal is to find and eliminate all the \x85Murderers\x80 before they kill\x83 everyone else\x80. This gametype is more like MATCH so you'll your need your aiming and shooting skills for this game.",
				"You'll need to learn some basics first before you start playing....",
				"\nAt the beginning of each round you will recieve a \x8BRole\x80 that defines what your task is during the game. Here are all 3 possible \x8BRoles\x80 you might get:",
				" * \x85Murderer\x80 - A True Criminal. They have to kill everyone, but they're not allowed to pick up any weapon rings.",
				" * \x84Sheriff\x80  - Their task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
				" * \x83Innocent\x80 - Completely armless civilian, they must avoid being killed but also can help to find the \x85Murderer\x80.",
				"\nThat's all basic information required to start playing, for more information, you can use these commands:"
			},["GAME"]={
				"\x87".."About the gameplay situations",
				"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \x85Murderer(s)\x80, but different gameplay situations may occur:",
				"\n* If you get killed, you'll enter the \x8F Dead\x80 state. Players with this state cannot respawn or talk globaly to players that are still alive, their messages are visible only to other\x8F Dead\x80 players.",
				"You can't \x87talk to\x80/PM players who are still alive while you're\x8F Dead\x80.",
				"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this is in \x87MMHELP BAD\x80.",
				"\n* The \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but it is possible for them to shoot an \x83Innocent\x80 on accident.",
				"If this occurs, the \x84Sheriff\x80 will turn into an \x83Innocent\x80 and a random \x83Innocent\x80 will sliently take his role. Next time you want to shoot somebody as a \x84Sheriff\x80 think twice before pulling that trigger!",
				"\n* When a \x85Murderer\x80 kills a \x84Sheriff\x80 and there are still \x83Innocents\x80 alive, the Sheriff will drop the \x84Sheriff's Emerald\x80 near their corpse.",
				"Unlike the 7 Chaos Emeralds, this emerald will assign the \x82Hero\x80 role to any \x83Innocent\x80 that picks it up. If you're one of the \x83Innocents\x80, it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
				"The \x82Hero\x80 role doesn't really differ from the \x84Sheriff\x80 except some details such as when the \x82Hero\x80 kills an \x83Innocent\x80 their role isn't shared and both just die. A Hero will not drop a \x84Sheriff's Emerald\x80 on their death.",
				"\n* Depending on the player count, there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 amongst the players in the round. For example, starting from 7 players and more, \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
				"\x8BTeammates\x80 can chat with each other in their team chat with the \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
				"If one \x8Bteammate\x80 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
			},["BAD"]={
				"\x87Things that are bad to do in Murder Mystery",
				"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
				"* Self-spoiling of the \x8BRole\x80 will not make the game a \'Mystery\', you can tell some else's role if you are sure of it, but never tell your own.",
				"* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you will accuse every player for no reason.",
				"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
				"* Do not rename yourself during a round. The game will close your SRB2 window. This made to prevent cheating. Just wait for the intermission to rename safely.",
				"Breaking one of these rules may result in a kick or in some cases, a ban from the Admin! Please do not break them and play fairly."
			},["CHAT"]={
				"\x87How to use Sound Emojis",
				"When a player sends a message that contains specific words/phrases, a sound will be played.",
				"For example, when you send a message containing \"bruh\", everyone will hear the \"BRUH\" sound",
				"Here is the full list of the Sound Emojis and how to activate each of them:\n"
			},["TIPS"]={
				"\x87Useful tips",
				"We've collected some tips that can help you during your game in MM",
				"\n* If character abilities are disabled, press \x82SPIN\x80 to sneak around stealthily without leaving traces or making noise;",
				"\n* When you pick up the \x84Sherrif's Emerald\x80, you will have access to all the weapons and rings you collected beforehand;",
				"\n* Finding out who your\8B teammate\x80 is by using the \x87SAYTEAM\x80 command would help as it would make you avoid shooting them and accidently making you reveal your role;",
				"\n* You can get hurt by obstacles like lava, spikes and fire to gain invincibility for 3 seconds;",
				"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
				"\n* If your role gets leaked, you can rename yourself and change skincolor. \x81Keep in mind your rename will be shown in chat."
			}
		},["ROLE_GET"]={
			"Ty \x85Ubijca\x80! \x85Ubej wseh!",
			"Ty \x84Sherif\x80!\x84 Nejtralizuj wseh Ubijc\x80. Jesli ub'jesh Niewinnogo ty pot'eriajesh rol'.",
			"Ty \x83Newinnyj(a)\x80! Spiachsia i pomogi s rasledowaniem."
		},["NEWROLE_GET"]={
			"\x87Zhyzn' reshyla sdelat' tebia \x85Ubijcej\x87.\x85 Teper' idi i ubej wseh!",
			"\x87Wselennaja sdelala tebia \x84Sherifom\x87! Idi i\x84 nejtraliziruj wseh Ubijc\x87!",
			"\x87".."Bylo resheno chto ty snanesh \x82Gerojem\x87. Spasi wseh ot ubijc!"
		},["TEAMMATE_HIT"]={
			"Nie wredi swoim naparnikam(cam). Ty nie hochesh choby oni mstili tebe.",
			"Naparnik(ca) zacepil(a) tebia. Nie planiruj mesti w storonu etogo igroka."
		},["MURD_KILLED"]={
			"\x85Ubijca\x87",
			"\x80nejtralizirowan(a)!"
		},["SHERI_KILLED"]={
			"\x84Sherif\x87",
			"\x80ubit(a)! Najdite\x84 Izumrud\x80!",
			"\x80ubit(a)!"
		},["HERO_KILLED"]={
			"\x82Geroj\x87",
			"\x80ubit(a)!"
		},["SHREML_PICK"]="Kto-to podnial \x84Izumrud Sherifa\x80...",
		["INNO_HURT_PM"]={
			"\x87Ty ubil(a) \x83Niewinnogo\x87! Tebia uwoleno. (Ty bol'she nie Sherif)",
			"\x82Geroji\x87 nie dolzhny ubiwat' \x83Niewinnych\x87. Ty poluchil(a) smertel'noje nakazanie za twoj postupok."
		},["INNO_HURT"]={
			"\x84Sherif\x80 ubil(a) \x83Niewinnogo\x80! Kto-to dolzhen zakon'chit' robotu Sherifa!",
			"\x82Geroj\x80 idiot, on(a) ubil(a) \x83Niewinnogo\x80. Teper' oba mertwy. Pozor na takogo\x82 Idiota\x80"
		},["ONE_LEFT"]={
			"Odin iz igrokow s rol'ju \x85Ubijca\x80 pokinul(a) igru!",
			"Odin iz igrokow s rol'ju \x84Sherif\x80 pokinul(a) igru!!!",
			"Odin iz igrokow s rol'ju \x82Geroj\x80 pokinul(a) nas!"
		},["LAST_LEFT"]={
			"Poslednij igrok s rol'ju \x85Ubijca\x80 pokinul(a) igru!",
			"Poslednij igrok s rol'ju \x84Sherif\x80 pokinul(a) igru!",
			"Poslednij igrok s rol'ju \x82Geroj\x80 pokinul(a)!"
		},["REPLACE_LEFT"]={
			"\x85Ubijca\x80 pokinul(a) igru! Kto-to iz \x83Niewinnyh\x80 woz'met etu rol'!",
			"\x84Sherif\x80 pokinul(a)! Kto-to iz \x83Niewinnyh\x80 woz'met etu rol'!",
			"\x82Geroj\x80 pokinul! Kto-to iz \x83Niewinnyh\x80 woz'met etu rol'!!"
		},["ENDROUND"]={
			"Wse mertwy. \x85Ubijcy\x80 wyigrali!",
			"Wse \x85Ubijcy\x80 byli nejtralizirowany!\x83 Cywil'nyje\x80 wyigrali!",
			"\x85Ubijcy\x80 wyigrali potomuchto \x84Sherif\x80 ubil(a) poslednego Newinnogo! Styd \x84Sherifu\x80",
			"\x82Geroj\x80 wybral temnuju storonu i ubil poslednego Newinnogo. \x85Ubijcy\x80 wyigrali!",
			"Wse zashitniki\x83 Newinnych\x80 pogibli. \x85Ubijcy\x80 wyigrali!"
		},["CHAT"]={
			"esh'e nie mertw(a), soobshenie nie otprawleno",
			"Ty shlesh slishkom mnogo soobshenij, pozhalujsta podozhdi",
			"Nie mozhna prosto tak\x8F umeret'\x80 i stat' spektatorom!"
		},["ROLES_HUD"]={
			"\xD3\xC1\xC8\xC9\xD6\xC0", --UBIJCA
			"\xD8\xC5\xD0\xC8\xD4", --SHERIF
			"\xCD\xC5\xC2\xC8\xCD\xCD\xDB\xC9", --NIEWINNYJ
			"\xC3\xC5\xD0\xCE\xC9", --GEROJ
			"\xCC\xC5\xD0\xD2\xC2(\xE0)" --MERTW(A)
		},["ROLES_HUD_SHORT"]={
			"\xD3\xC1.", --UB
			"\xD8\xC5\xD0.", --SHER
			"\xCD\xC5\xC2.", --NEW
			"\xC3\xC5\xD0\xCE\xC9", --GEROJ
			"\xCC\xC5\xD0\xD2\xC2(\xE0)" --MERTW(A)
		},["TEAMALIVE_HUD"]="\xCD\xE0\xEF\xE0\xF0\xED\xE8\xEA\xEE\xE2 \xE2 \xE6\xFB\xE2\xFB\xF5:",
		["KILLBY_HUD"]="\xD3\xE1\xE8\xF2(\xE0)",
		["STUPID"]="\xF2\xE2\xEE\xE8\xEC \xE8\xE4\xE8\xEE\xF2\xE8\xE7\xEC\xEE\xEC",
		["HUD_SCORESTAB"]={
			"\xCE\xF7\xEA\xEE\xE2 \xF2\xF3\xF2 \xED\xE5\xF2\x21 \xC2\xEC\xE5\xF1\xF2\xEE \xFD\xF2\xEE\xE3\xEE \xF2\xF3\xF2 \xE5\xF1\xF2\xFC \xF1\xF7\xB8\xF2\xF7\xE8\xEA\xE8",
			"",
			"\xC5\xF1\xEB\xE8 \xF2\xFB \xED\xEE\xE2\xE8\xF7\xEE\xEA \xE2 \xFD\xF2\xEE\xE9 \xE8\xE3\xF0\xE5 \xE2\xEE\xF1\xEF\xEE\xEB\xFC\xE7\xF3\xE9\xF1\xFF \xEA\xEE\xEC\xEC\xE0\xED\xE4\xEE\xE9",
			"\7MMHELP\0 \xE2 \xEA\xEE\xED\xF1\xEE\xEB\xE8",
			"",
			"\2\xD3\xE4\xE0\xF7\xE8!"
		},["HUD_ROLESALIVE"]={
			"\xD3\xE1\xE8\xE9\xF6 \xE2 \xE6\xFB\xE2\xFB\xF5:",
			"\xD8\xE5\xF0\xE8\xF4\xEE\xE2 \xE2 \xE6\xFB\xE2\xFB\xF5:",
			"\xCD\xE5\xE2\xE8\xED\xED\xFB\xF5 \xE2 \xE6\xFB\xE2\xFB\xF5:"
		},["HUD_DEAD"]={
			"\xC2\xFB \15\xEC\xE5\xF0\xF2\xE2\xFB",
			"\xC2\xFB \xED\xE5 \xEC\xEE\xE6\xE5\xF2\xE5 \xE2\xEE\xE7\xF0\xEE\xE6\xE4\xE0\xF2\xF1\xFF \xE8\xEB\xE8",
			"\xE3\xEE\xE2\xEE\xF0\xE8\xF2\xFC \xEA \xE6\xFB\xE2\xFB\xEC \xE8\xE3\xF0\xEE\xEA\xE0\xEC"
		},["HUD_MIDJOIN"]={
			"\xC2\xFB \xEF\xF0\xE8\xF1\xEE\xE5\xE4\xE8\xED\xE8\xEB\xE8\xF1\xFC \4\xE2 \xF1\xE5\xF0\xE5\xE4\xE8\xED\xE5 \xF0\xE0\xF3\xED\xE4\xE0\0, \xEF\xEE\xE6\xE0\xEB\xF3\xE9\xF1\xF2\xE0 \xEF\xEE\xE4\xEE\xE6\xE4\xE8\xF2\xE5 \xE5\xE3\xEE \xEE\xEA\xEE\xED\xF7\xE0\xED\xE8\xFF"
		},["HUD_ALONE"]={
			"\xC4\xEB\xFF \xED\xE0\xF7\xE0\xEB\xE0 \xE8\xE3\xF0\xFB \xF2\xF0\xE5\xE1\xF3\xE5\xF2\xF1\xFF\4 2-\xE5\x20\xE8\xE3\xF0\xEE\xEA\xEE\xE2\0,",
			"\xEF\xEE\xE6\xE0\xEB\xF3\xE9\xF1\xF2\xE0 \xEF\xEE\xE4\xEE\xE6\xE4\xE8\xF2\xE5 \xED\xE0 \4\xE5\xF9\xE5 \xEE\xE4\xED\xEE\xE3\xEE"
		},["YOU_HUD"]="\xD2\xDB",
		["WINNERS_HUD"]="\xC2\xFB\xE8\xE3\xF0\xE0\xEB\xE8:",
		["WON_HUD"]="\xE2\xFB\xE8\xE3\xF0\xE0\xEB(\xE0)!",
		["WINS_HUD"]="\xCF\xEE\xE1\xE5\xE4",
		["WIN_HUD"]={
			"\xC2\xFB\xE8\xE3\xF0\xE0\xEB!",
			"\5\xD3\xC1\xC8\xC9\xD6\xDB",
			"\3\xD6\xDB\xC2\xC8\xCB\xDC\xCD\xDB\xC5"
		},["MMLANG"]={
			"Wash tekushij personal'nyj jazyk w ispol'zowanii eto \x82 Russkij\x80\nWy mozhete pomieniat' jeog z pomoshiu kommandy \x87MMLANG [language]",
			"Personal'nyj jazyk dla Tajny Ubijstwa izmenen na\x82 Russkij"
		}
	}
	*/
}
