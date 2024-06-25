-- SRB2 MURDER MYSTERY language file template
-- THIS FILE MUST BE LOADED AFTER THE MAIN MM .PK3
--
-- You can use this file as a template to add your own language to MM,
-- Please read everything carefully and your custom language will work fine
--
-- NOTES BEFORE TRANSLATING:
-- You can apply color to the text strings in SRB2. Coloring is possible with ESCAPE COLOR CODES. They look like "\x##",
-- where ## is the HEXADECIMAL value. But you can do decimal values instead of hexadecimal
-- I will explain everything with the HEX color codes
--
-- Escape Color Codes will paint the string FROM where they are TO the end of the string (or the other color code).
-- Sounds strange? Well, you'll get it better with this example:
--
-- "\x85Hello \x83world!"
--
-- HELLO will appear in red color and WORLD! will appear in green. Still don't understand it?
-- https://wiki.srb2.org/wiki/Lua explains SRB2 text coloring much better.
-- 
-- Here's another cool trick to make several lines in one string. Place the "\n" symbol inside your string where you would
-- normally press ENTER in the text editor.
-- EXAMPLE: "A string\nof text" will make your string look like:
--
--   A string
--   of text
--
-- Get it? That's great, now you can begin translating!
--
-- TROUBLESHOOTING:
--
-- "escape sequence wrong size (2 or 4 digits) near '" warning on load
--     If you get this error when trying to load your language file it means that some of your text is not interpreted
--     correctly. Go to the line where the error occurs and look carefully in places where you have placed the escape color
--     codes in the text.
--     For example when you write something like "\x85Dictionary" and you want it red the game thinks that "\x85D" is an
--     escape color code and try to interpret it. To prevent this error you can format the string like "\x85".."Dictionary"
--     (.. in LUA is a string concatenation operator) or if it's in the middle of the text you can fix the error by simply
--     shifting the SPACE symbol.
--     If your text looks like this: "A wonderful \x85Dictionary"
--     Make it like this instead: "A wonderful\x85 Dictionary"
--     This should fix the problem.
--     Remember! A, B, C, D, E, F letters and 0-9 digits can be interpreted as a color code - be careful with them!

local language={ --Language must be a table variable, you can name the variable as you like.
	["VERSION"]="1.0-ALPHA", --to check if lang content is not OUTDATED
	["AUTHOR"]="SRB2 MM_DEV community", --who wrote this localization file
	["MM"]="Murder Mystery", --name of the gametype, this string supports MM format

	--This one is really important if you want to make your 
	--language's native letters to appear in the game
	--
	--This is the prefix of the font graphics to use (ex. "STCFN065" is a graphic for "A"), in this English example there is no need to use this parameter at all,
	--but if your language uses other character sets you have to add those character graphics into the game. This parameter expects the 5-letter prefix of your graphic file name.
	--If your graphic file name is something like "FONTL097" your prefix is "FONTL"
	--
	--Murder Mystery has some character sets pre-bundled, use one for your language or create a custom one:
	-- "1250C" - "Windows1250", Central & Eastern European Latin-based languages
	-- "1251C" - "Windows1251", Cyrillic-based languages
	-- "1254C" - "Windows1254", Turkish, and most Western European languages

	["CHARSET"]="STCFN", --"Standart Console Font", can be found in srb2.pk3

	["NONASCII"]=false, --set this to true if your language is not Latin-based. This only marks the language with * in MMLANG language list

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
			"\nAt the beginning of each round you will get a \11Role\0 which defines what your task is during the game. Here are all 3 possible \11Roles\0 you might get:",
			" * \5Murderer\0 - A true criminal. They have to kill everyone, but they are equipped only with Knives and Red Rings;",
			" * \4Sheriff\0  - Their task is to find and eliminate the \5Murderer(s)\0. Sheriffs may use every Weapon Ring available on the map;",
			" * \3Innocent\0 - Completely armless civilian, they must avoid being killed but also can help to find the \5Murderer\0.",
			"\nThat is all basic information required to start playing, for more information, read this manual to the end."
		},
		--GAME
		{
			"\7".."About the gameplay situations\0\n",
			"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \5Murderer(s)\0, but different gameplay situations may occur:",
			"\n* If you get killed, you'll enter the\15 Dead\0 stat Players with this state cannot respawn or talk globally to players that are still alive, their messages are visible only to other\x8F Dead\x80 players.",
			"You can't talk to/PM players who are still alive while you are\15 Dead\0.",
			"Also\2 DO \2NOT \2TRY \2TO \2RENAME \2YOURSELF\0, more details on this are on the next page.",
			"\n* The \4Sheriff's\0 task is to eliminate all the \5Murderers\0 around, but they can accidentally shoot an \3Innocent\0.",
			"If this occurs, the \4Sheriff\0 will turn into an \3Innocent\0 and a random \3Innocent\0 will silently take his role. Next time you want to shoot somebody as a \4Sheriff\0 think twice before pulling that trigger!",
			"\n* When a \5Murderer\0 kills a \4Sheriff\0 and there are still \3Innocents\0 alive, the Sheriff will drop the \4Sheriff's Emerald\0 near their corpse.",
			"Unlike the 7 Chaos Emeralds, this emerald will assign the \2Hero\0 role to any \3Innocent\0 that picks it up. If you're one of the \3Innocents\0, it's your chance to be a Hero and save everyone from the \5Murderer(s)\0!",
			"The \2Hero\0 role does not differ from the \4Sheriff\0 except for some details such as when the \2Hero\0 kills an \3Innocent\0 their role isn't shared and both just die. A Hero will not drop a \4Sheriff's \4Emerald\0 on their death.",
			"\n* Depending on the player count, there can be more than one \5Murderer\0 and \4Sheriff\0 amongst the players in the round. For example, starting from 7 players and more, \11Teams\0 of \5Murderers\0 and \4Sheriffs\0 will be formed.",
			"\11Teammates\0 can chat with each other in their team chat with the \7SAYTEAM\0 console command (note that SAYTEAM chat button will work as same as regular chat).",
			"If one \11teammate\0 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
		},
		--BAD
		{
			"\7Things that are bad to do in Murder \7Mystery\0\n",
			"Rule No.1 of any game: \1Be kind and \1have \1fun!\0 Other than this...",
			"\n* Self-spoiling of the \11Role\0 will not make the game a \'Mystery\' (even if you are joking), you can tell someone else's role if you are sure of it, but never tell your own.",
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
			"\n* Finding out who your \11teammate\0 is by using the \7SAYTEAM\0 command would help as it would make you avoid shooting them and accidentally making you reveal your role;",
			"\n* You can get hurt by obstacles like lava, spikes, fire to gain invincibility for 3 seconds;",
			"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
			"\n* If your role gets leaked, you can rename yourself and/or change the skin color. \1Keep \1in \1mind \1that \1your \1rename \1will \1be \1shown \1in \1chat\0;",
			"\n*\2 FIRENORMAL\0 button allows you to use the Knife anywhere as long as you have rings (Innocents do not have a knife). Also, a Knife does not produce an attack sound if you sneak."
		}
	},

	--
	--console/chat messages, these messages can support only ASCII (English-only) characters. Color is made with Vanilla Color Escape Codes
	--

	--MMLANG command
	["MMLANG"]={
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language] command", --when typed MMHELP with no argument
		"Personal language for Murder Mystery is set to\x82 English" --when typed MMHELP with language argument (it sets the new language)
	}
	-- "You got the role" personal messages
	["ROLE_GET"]={
		"You're the \x85Murderer\x80! \x85Murder everyone!", --Murderer
		"You're the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. If you kill an innocent, you'll be stripped of your role.", --Sheriff
		"You're an \x83Innocent\x80! Hide and help with the investigation." --Innocent
	},
	-- Randomly selected innocent has a new role
	["NEWROLE_GET"]={
		"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!", --Murderer
		"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!", --Sheriff
		"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!" --Hero
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
	--Hero killed
	["HERO_KILLED"]={
		"\x82Hero\x87", --beginning
		"\x80got murdered!" --ending
	},
	--Sheriff's Emerald pickup global notification
	["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
	-- Innocent hurt by Sheriff/Hero personal messages
	["INNO_HURT_PM"]={
		"\x87You murdered an \x83Innocent\x87! You got fired. (You're no longer a Sheriff)", --Sheriff
		"\x82Heroes\x87 are not meant to kill \x83Innocents\x87. You got the death penalty for that." --Hero
	},
	-- Innocent hurt by Sheriff/Hero personal messages
	["INNO_HURT"]={
		"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!", --Sheriff
		"The \x82Hero\x80 decided to become a villian by killing the \x83Innocent\x80. Now both are lying dead. Shame on such\x82 Hero\x80" --Hero
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

	--HUD.LUA

	-- Bitmap patches
	-- DO NOT EDIT THESE UNLESS YOU UNDERSTAND WHAT YOU ARE DOING
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
		"\xFFFF\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F",
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
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F",
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
	--MM string formatted HUD section
	--
	--The following section contains strings that allow your language's native letters to display.
	--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.

	-- Role names
	["HUD_ROLES"]={
		"MURDERER", --Murderer
		"SHERIFF", --Sheriff
		"HERO", --Hero
		"INNOCENT", --Innocent
		"DEAD" --Dead
	},
	["HUD_TEAMMATES"]="Teammates"
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
		["PRESS"]="Press\2 CUSTOM3\0 to", --must contain MM escape color codes
		["LEAVE"]="leave",
		["CANCEL"]="cancel",
		["SPECTATE"]="spectate",
		["DUEL"]="a minigame duel",
		["REQUEST"]="request a \7PONG\0 minigame", --must contain MM escape color codes
		["START"]="start a \7\"SONIC RUN\"\0 minigame", --must contain MM escape color codes
		["ACCEPT"]="accept the \7PONG\0 challenge!", --must contain MM escape color codes
		["WAIT"]="Waiting for the rival to accept...",
		["SPECTATING"]="Spectating a duel...",
		["BORED"]="Bored?",
		["PONGBALL"]="Spectators can change the ball's direction"
	},
	["HUD_YOU"]="YOU",

	-- Winner stuff
	["HUD_WINNERS"]="Winners:",
	["HUD_WIN"]={
		"TIE!",
		"\5MURDERERS", --must contain MM escape color code
		"\3CIVILIANS" --must contain MM escape color code
	},
}
--finally import your language to the MM
-- There is already a function to add the language in the game
-- It has 2 arguments to pass
-- First argument is the language index string, it is usually 2 or 3 letters long and ALWAYS UPPERCASE
--  Do not make it like "MyLanguage" - use "MYLANG" or "ML" instead (or the official international index of your language)
-- Second argument is the Table Variable of the language itself
MM.AddLang("MYLANG", language)
--if everything is done correctly you will receive no errors when loading this file and in the gameplay process
--
--If this language is going to be posted on the SRB2 Message Board please rename this file to something like:
-- MML_[full_lang_name]_v[MM_version].lua


--Thank you for your efforts to make the game more accessible!
