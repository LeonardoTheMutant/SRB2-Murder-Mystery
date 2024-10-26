-- Language file template for the LeonardoTheMutant's Murder Mystery gametype
-- THIS FILE MUST BE LOADED AFTER THE LTM_MM.PK3
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
			"\nAt the beginning of each round you will get a \27Role\16 which defines what your task is during the game. Here are all 3 possible \27Roles\16 you might get:",
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
			"Also\18 DO \18NOT \18TRY \18TO \18RENAME \18YOURSELF\16, more details on this are on the next page.",
			"\n* The \20Sheriff's\16 task is to eliminate all the \21Murderers\16 around, but they can accidentally shoot an \19Innocent\16.",
			"If this occurs, the \20Sheriff\16 will turn into an \19Innocent\16 and a random \19Innocent\16 will silently take his role. Next time you want to shoot somebody as a \20Sheriff\16 think twice before pulling that trigger!",
			"\n* When a \21Murderer\16 kills a \20Sheriff\16 and there are still \19Innocents\16 alive, the Sheriff will drop the \20Sheriff's Emerald\16 near their corpse.",
			"Unlike the 7 Chaos Emeralds, this emerald will assign the \18Hero\16 role to any \19Innocent\16 that picks it up. If you're one of the \19Innocents\16, it's your chance to be a Hero and save everyone from the \21Murderer(s)\16!",
			"The \18Hero\16 role does not differ from the \20Sheriff\16 except for some details such as when the \18Hero\16 kills an \19Innocent\16 their role isn't shared and both just die. A Hero will not drop a \20Sheriff's \20Emerald\16 on their death.",
			"\n* Depending on the player count, there can be more than one \21Murderer\16 and \20Sheriff\16 amongst the players in the round. For example, starting from 7 players and more, \27Teams\16 of \21Murderers\16 and \20Sheriffs\16 will be formed.",
			"\27Teammates\16 can chat with each other in their team chat with the \23SAYTEAM\16 console command (note that SAYTEAM chat button will work as same as regular chat).",
			"If one \27teammate\16 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
		},
		--BAD
		{
			"\23Things that are bad to do in Murder \23Mystery\16\n",
			"Rule No.1 of any game: \18Be kind and \18have \18fun!\16 Other than this...",
			"\n* Self-spoiling of the \27Role\16 will not make the game a \'Mystery\' (even if you are joking), you can tell someone else's role if you are sure of it, but never tell your own.",
			"\n* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you accuse every player for no reason.",
			"\n* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
			"\n* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename yourself if you are alive. Just wait for the intermission to rename safely.",
			"\nBreaking one of these rules may result in a kick or sometimes, a ban from the Admin! Please do not break them and play fairly."
		},
		--TIPS
		{
			"\23Useful tips\16\n",
			"We've collected some tips that can help you during your game in MM:",
			"\n* If character abilities are disabled by admin, press \18SPIN\16 to sneak around quietly without leaving traces or making noise;",
			"\n* When you pick up the \20Sherrif's \20Emerald\16, you will have access to all the weapons and rings you collected beforehand;",
			"\n* Finding out who your \27teammate\16 is by using the \23SAYTEAM\16 command would help as it would make you avoid shooting them and accidentally making you reveal your role;",
			"\n* You can get hurt by obstacles like lava, spikes, fire to gain invincibility for 3 seconds;",
			"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
			"\n* If your role gets leaked, you can rename yourself and/or change the skin color. \18Keep \18in \18mind \18that \18your \18rename \18will \18be \18shown \18in \18chat\16;",
			"\n*\18FIRENORMAL\16 button allows you to use the Knife anywhere as long as you have rings (Innocents do not have a knife). Also, a Knife does not produce an attack sound if you sneak."
		}
	},

	--
	--console/chat messages, these messages can support only ASCII (English-only) characters. Color is made with Vanilla Color Escape Codes
	--

	--MMLANG command
	["MMLANG"]={
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]\x80 command", --when typed MMHELP with no argument
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

	--player was crushed, has drown or fell into a pit
	["DIED_HAZARD"]="has died in an accident",

	--Sheriff's Emerald pickup global notification
	["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",

	--Player has killed someone it did not have to
	["KILL_PUNISHMENT_PM"]={
		"\x87You murdered an \x83Innocent\x87! You got fired. (You're no longer a Sheriff)", --Sheriff killed Innocent
		"\x82Heroes\x87 are not meant to kill \x83Innocents\x87. You got the death penalty for that.", --Hero killed Innocent
		"\x87Oh no! You murdered a \x84Sheriff\x87!!! You got the death penalty for that", --Innocent killed Sheriff
		"\x87You murdered an \x83Innocent\x87 player just like you! You got the death penalty for that", --Innocent killed Innocent
		"\x87Oh no! You murdered a \x82Hero\x87! You got the death penalty for that" --Innocent killed Hero
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
		"INNOCENT", --Innocent
		"HERO", --Hero
		"DEAD" --Dead
	},
	["HUD_TEAMMATES"]="Teammates"
	["HUD_KILLBY"]="Killed by",
	["HUD_STUPID"]="your stupidity",

	-- Scores TAB screen
	["HUD_SCORESTAB"]={
		"If you're new to the gametype use \23MMHELP\16 ",
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

	--Sneaking
	["HUD_SNEAKING"]="Sneaking...",

	-- "Showdown duel!"
	["HUD_SHOWDOWN"]="Showdown duel!",

	--minigame stuff
	["HUD_MINIGAME"]={
		["PRESS"]="Press\18 CUSTOM3\16 to", --must contain MM escape color codes
		["LEAVE"]="leave",
		["CANCEL"]="cancel",
		["SPECTATE"]="spectate",
		["DUEL"]="a minigame duel",
		["REQUEST"]="request a \23PONG\16 minigame", --must contain MM escape color codes
		["START"]="start a \23\"SONIC RUN\"\16 minigame", --must contain MM escape color codes
		["ACCEPT"]="accept the \23PONG\16 challenge!", --must contain MM escape color codes
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
		"\21MURDERERS", --must contain MM escape color code
		"\19CIVILIANS" --must contain MM escape color code
	},
	
	-- Time Travel stuff
	["HUD_PAST"]="PAST",
	["HUD_FUTURE"]="FUTURE"
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
-- MM_LANG_[full_lang_name]_v[MM_version].lua


--Thank you for your efforts to make the game more accessible!
