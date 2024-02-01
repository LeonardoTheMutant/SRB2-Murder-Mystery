-- SRB2 MURDER MYSTERY language file template
-- THIS FILE MUST BE LOADED AFTER THE MAIN MM .PK3
--
-- You can use this file as a template to add your own language to MM,
-- Please read everything carefully and your custom language will work fine
--
-- NOTES BEFORE TRANSLATING:
-- You can apply color to the text strings in SRB2. Coloring is possible with ESCAPE COLOR CODES. They look like "\x##",
-- where ## is the HEXADECIMAL value. But you can you decimal value instead of hexadecimals
-- I will explain everthing with the HEX color codes
--
-- Escape Color Codes will paint the string FROM where they are TO the end of the string (or the other color code).
-- Sounds strange? Well you'll get it better with this example:
--
-- "\x85Hello \x83world!"
--
-- HELLO will appear in red color and WORLD! will appear in green. Still don't understand it? https://wiki.srb2.org/wiki/Lua
-- explains text coloring much better.
-- 
-- Here's another cool trick to make several lines in one string. Place the "\n" symbol inside your string where you would
-- normally press ENTER in the text editor.
-- EXAMPLE: "A string\nof text" will make your string look like:
--
--   A string
--   of text
--
-- Get it? That's great, now you can actully begin translating!
--
-- TROUBLESHOOTING:
--
-- "escape sequence wrong size (2 or 4 digits) near '" warning on load
--     If you get this error when trying to load your language file it means that some of your text is not interpreted
--     correctly. Go to the line where error occurs and look carefully in places where you have placed the escape color
--     codes in the text.
--     For example when you write something like "\x85Dictionary" and you want it red the game thinks that "\x85D" is an
--     escape color code and tries to interpret it. To prevent this error you can format the string like "\x85".."Dicionary"
--     (.. in LUA is a string concatenation operator) or if it's in the middle of the text you can fix the error by simply
--     shifting the SPACE symbol.
--     If your text looks like this: "A wonderful \x85Dictionary"
--     Make it like this instead: "A wonderful\x85 Dictionary"
--     This should fix the problem.
--     Remember! A, B, C, D, E, F letters and 0-9 digits can be interpreted as a color code - be careful with them!

local language={ --Language must be a table variable, you can name the variable as you like.
	["VERSION"]="10.0-BETA", --to check if lang content is not OUTDATED
	["AUTHOR"]="MM_DEV community", --who wrote this localization file
	["MM"]="Murder Mystery", --name of the gametype

	--This one is really important if you want to make your 
	--lnaguage's native latters to appear in the game
	--
	--This is the prefix of the font graphics to use (ex. "STCFN065" is a graphic for "A"), in this English example there is no need to use this parameter at all,
	--but if your language uses other character set you have to add those character graphics into the game. This parameter expects the 5-letter prefix of your graphic file name.
	--If your graphic file name is something like "FONTL097" your prefix is "FONTL"
	--
	--Murder Mystery has some character sets pre-bundled, use one for your language or create a custom one:
	-- "1250C" - "Windows1250" charset, Central & Eastern European latin-based languages (unfinished, has only Polish support)
	-- "1251C" - "Windows1251" charset, Cyrilic-based languages
	-- "1252C" - "Windows1252" charset, Roman and Germanic languages (unfinished, has only Spanish support)
	--
	["CHARSET"]="STCFN", --"Standart Console Font", can be found in srb2.pk3

	["NONASCII"]=false, --set this to true if your language is not Latin-based. This only marks the language with * in MMLANG language list
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
		},["GAME"]={ --MMHELP GAME
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
		},["BAD"]={ --MMHELP BAD
			"\x87Things that are bad to do in Murder Mystery",
			"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
			"* Self-spoiling of the \x8BRole\x80 will not make the game a \'Mystery\', you can tell some else's role if you are sure of it, but never tell your own.",
			"* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you will accuse every player for no reason.",
			"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
			"* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename if you are alive. Just wait for the intermission to rename safely.",
			"Breaking one of these rules may result in a kick or in some cases, a ban from the Admin! Please do not break them and play fairly."
		},["CHAT"]={ --MMHELP CHAT
			"\x87How to use Sound Emojis",
			"When a player sends a message that contains specific words/phrases, a sound will be played.",
			"For example, when you send a message containing \"bruh\", everyone will hear the \"BRUH\" sound",
			"Here is the full list of the Sound Emojis and how to activate each of them:"
		},["TIPS"]={ --MMHELP TIPS, you can fill it with your own tips!
			"\x87Useful tips",
			"We've collected some tips that can help you during your game in MM:",
			"\n* If character abilities are disabled by admin, press \x82SPIN\x80 to sneak around stealthily without leaving traces or making noise;",
			"\n* When you pick up the \x84Sherrif's Emerald\x80, you will have access to all the weapons and rings you collected beforehand;",
			"\n* Finding out who your \x8Bteammate\x80 is by using the \x87SAYTEAM\x80 command would help as it would make you avoid shooting them and accidently making you reveal your role;",
			"\n* You can get hurt by obstacles like lava, spikes and fire to gain invincibility for 3 seconds;",
			"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
			"\n* If your role gets leaked, you can rename yourself and/or change skincolor. \x81Keep in mind your rename will be shown in chat;",
			"\n* Knife does not produce an attack sound if you sneak. Also,\x82 FIRENORMAL\x80 button allows to use Knife anywhere as long as you have rings (Innocents do not have a knife)"
		}
	},
	-- "You got the role" personal messages
	["ROLE_GET"]={
		"You're the \x85Murderer\x80! \x85Murder everyone!", --Murderer
		"You're the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. If you kill an innocent, you'll be stripped of your role.", --Sheriff
		"You're an \x83Innocent\x80! Hide and help the with the investigation." --Hero
	},
	-- Randomly selected innocent has a new role
	["NEWROLE_GET"]={
		"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!", --Murderer
		"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!", --Sheriff
		"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!" --Hero
	},
	-- Teammate hit
	["TEAMMATE_HIT"]={
		"This player is your teammate. Don't hit your teammates next time as you don't want them to take their revenge on you.", --YOU attacked the teammate
		"A teammate hit you. Don't plan to take your revenge on them." --Teammate attacked YOU
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
	--Hero killed
	["HERO_KILLED"]={
		"\x82Hero\x87", --beginning
		"\x80got murdered!" --ending
	},
	--Sheriff's Emerald pick up global notification
	["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
	-- Innocent hurt by Sheriff/Hero personal messages
	["INNO_HURT_PM"]={
		"\x87You murdered an \x83Innocent\x87! You got fired. (You're no longer a Sheriff)", --Sheriff
		"\x82Heroes\x87 aren't meant to kill \x83Innocents\x87. You got the death penalty for that." --Hero
	},
	-- Innocent hurt by Sheriff/Hero personal messages
	["INNO_HURT"]={
		"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!", --Sheriff
		"The \x82Hero\x80 is a dumbass, they killed an \x83Innocent\x80. Now both are lying dead. Shame on that \x82 Dumbass\x80" --Hero
	},
	-- "One of the [role]s left!"
	["ONE_LEFT"]={
		"One of the \x85Murderers\x80 left!", --Murderer
		"One of the \x84Sheriffs\x80 left!!!", --Sheriff
		"One of the \x82Heroes\x80 has abandoned us!" --Hero
	},
	-- "Last [role] left!"
	["LAST_LEFT"]={
		"The last \x85Murderer\x80 has left!", --Murderer
		"The last \x84Sheriff\x80 has left!", --Sheriff
		"The last \x82Hero\x80 has left!" --Hero
	},
	-- "[role] left, replaced him"
	["REPLACE_LEFT"]={
		"The \x85Murderer\x80 left! Some random \x83Innocent\x80 will take their role!", --Murderer
		"The \x84Sheriff\x80 left! Some random \x83Innocent\x80 will take their role!", --Sheriff
		"A \x82Hero\x80 left! Some random \x83Innocent\x80 will take their role!" --Hero
	},
	-- Win texts
	["ENDROUND"]={
		"Everyone is dead. The \x85Murderers\x80 win!", --Murderers win
		"All of the \x85Murderers\x80 were killed! The\x83 Civilians\x80 win!", --Sheriffs / Heros win
		"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent! Shame on the \x84Sheriff\x80", --Sheriff killed the last Innocent
		"The \x82Hero\x80 chose to kill the last Innocent. The \x85Murderers\x80 win!", --Hero killed the last Innocent
		"The Defenders of the\x83 Innocents\x80 are dead. The \x85Murderers\x80 win!" --All sheriffs and Heroes are dead
	},
	--CHAT.LUA
	["CHAT"]={
		"is alive, message not sent", --Trying to send a PM to alive player (Dead writes to Alive)
		"You're sending too many messages, please wait", --sending too much messages in a row
		"You can't just\x8F die\x80 to spectate!" --Trying to use "Spactate" in pause menu
	},
	--HUD.LUA

	--The following section contains string which allow your language's native letters to display.
	--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.

	--Color codes in "MM string format" are ranged from 0 to 15 (ASCII) and do not support transluency

	--For more details read /SRC/DOCS/MM_String_Format.md

	-- Role names
	["ROLES_HUD"]={
		"MURDERER", --Murderer
		"SHERIFF", --Sheriff
		"INNOCENT", --Innocent
		"HERO", --Hero
		"DEAD" --Dead
	},
	["ROLES_HUD_SHORT"]={ --used for 8-32 players intermission screen
		"MURD", --Murderer
		"SHERI", --Sheriff
		"INNO", --Innocent
		"HERO", --Hero
		"DEAD" --Dead
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
	--These strings are using the vanilla format.
	["MMLANG"]={
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]",
		"Personal language for Murder Mystery is set to\x82 English"
	}
}
--finally import your language to the MM
-- There is already a function to add the language in the game
-- It has 2 arguments to pass
-- First argument is the language index string, it is usually 2 or 3 letters long and ALWAYS UPPERCASE
--  Do not make it like "MyLanguage" - use "MYLANG" or "ML" instead (or the official international index of your language)
-- Second argument is the Table Variable of the language itself
MM.AddLang("MYLANG", language)
--if everything is done correctly you will recieve no errors when loading this file and in the gameplay process
--
--If this language is going to be posted on SRB2 Message Board please rename this file like:
-- MML_[full_lang_name]_v[MM_version].lua


--Thank you for your efforts to make the gamme more accesible!