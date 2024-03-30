-- SRB2 MURDER MYSTERY language file template
-- THIS FILE MUST BE LOADED AFTER THE MAIN MM .PK3
--
-- You can use this file as a template to add your own language to MM,
-- Please read everything carefully and your custom language will work fine
--
-- NOTES BEFORE TRANSLATING:
-- You can apply color to the text strings in SRB2. Coloring is possible with ESCAPE COLOR CODES. They look like "\x##",
-- where ## is the HEXADECIMAL value. But you can you decimal value instead of hexadecimals
-- I will explain everything with the HEX color codes
--
-- Escape Color Codes will paint the string FROM where they are TO the end of the string (or the other color code).
-- Sounds strange? Well you'll get it better with this example:
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
	["VERSION"]="10.1-BETA", --to check if lang content is not OUTDATED
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
	-- "1250C" - "Windows1250", Central & Eastern European latin-based languages (unfinished, has only German & Polish support)
	-- "1251C" - "Windows1251", Cyrilic-based languages
	-- "1254C" - "Windows1254", Turkish, and most Western European languages (unfinished, has only German, Spanish & Turkish support)

	["CHARSET"]="STCFN", --"Standart Console Font", can be found in srb2.pk3

	["NONASCII"]=false, --set this to true if your language is not Latin-based. This only marks the language with * in MMLANG language list
	["MMHELP_CMD"]={
		["CONTENTS"]={ --Table of Contents
			"\x8ATable of contents:",
			"\x87MMHELP GAME\x80 - More about the game and gameplay situations;",
			"\x87MMHELP BAD\x80  - List of things that are forbidden to do in MM;",
			"\x87MMHELP CHAT\x80 - List of sound emojis that you can use in the chat;",
			"\x87MMHELP TIPS\x80 - A small collection of tips for you;";
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
			"\nAt the beginning of each round you will get a \x8BRole\x80 which defines what your task is during the game. Here are all 3 possible \x8BRoles\x80 you might get:",
			" * \x85Murderer\x80 - A true criminal. They have to kill everyone, but they are equipped only with Knives and Red Rings",
			" * \x84Sheriff\x80  - Their task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
			" * \x83Innocent\x80 - Completely armless civilian, they must avoid being killed but also can help to find the \x85Murderer\x80.",
			"\nThat's all basic information required to start playing, for more information, you can use these commands:"
		},["GAME"]={
			"\x87".."About the gameplay situations",
			"As explained earlier in the basics, the goal for the Sheriffs is to eliminate all the \x85Murderer(s)\x80, but different gameplay situations may occur:",
			"\n* If you get killed, you'll enter the\x8F Dead\x80 stat Players with this state cannot respawn or talk globally to players that are still alive, their messages are visible only to other\x8F Dead\x80 players.",
			"You can't talk to/PM players who are still alive while you are\x8F Dead\x80.",
			"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this are in \x87MMHELP BAD\x80.",
			"\n* The \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but they can accidentally shoot an \x83Innocent\x80.",
			"If this occurs, the \x84Sheriff\x80 will turn into an \x83Innocent\x80 and a random \x83Innocent\x80 will silently take his role. Next time you want to shoot somebody as a \x84Sheriff\x80 think twice before pulling that trigger!",
			"\n* When a \x85Murderer\x80 kills a \x84Sheriff\x80 and there are still \x83Innocents\x80 alive, the Sheriff will drop the \x84Sheriff's Emerald\x80 near their corpse.",
			"Unlike the 7 Chaos Emeralds, this emerald will assign the \x82Hero\x80 role to any \x83Innocent\x80 that picks it up. If you're one of the \x83Innocents\x80, it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
			"The \x82Hero\x80 role does not differ from the \x84Sheriff\x80 except for some details such as when the \x82Hero\x80 kills an \x83Innocent\x80 their role isn't shared and both just die. A Hero will not drop a \x84Sheriff's Emerald\x80 on their death.",
			"\n* Depending on the player count, there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 amongst the players in the round. For example, starting from 7 players and more, \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
			"\x8BTeammates\x80 can chat with each other in their team chat with the \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
			"If one \x8Bteammate\x80 hits another teammate, both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!"
		},["BAD"]={
			"\x87Things that are bad to do in Murder Mystery",
			"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
			"* Self-spoiling of the \x8BRole\x80 will not make the game a \'Mystery\', you can tell someone else's role if you are sure of it, but never tell your own.",
			"* Do not insult other players, jokes are allowed but only in a friendly mood. No one will trust you if you accuse every player for no reason.",
			"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
			"* Do not rename yourself during a round while you are dead, doing this will kick you from the server. You can rename yourself if you are alive. Just wait for the intermission to rename safely.",
			"Breaking one of these rules may result in a kick or sometimes, a ban from the Admin! Please do not break them and play fairly."
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
			"\n* You can get hurt by obstacles like lava, spikes, fire to gain invincibility for 3 seconds;",
			"\n* Try to look for a hiding spot in a map. Sometimes it helps to get rid of unwanted publicity;",
			"\n* If your role gets leaked, you can rename yourself and/or change skincolor. \x81Keep in mind your rename will be shown in chat;",
			"\n*\x82 FIRENORMAL\x80 button allows you to use the Knife anywhere as long as you have rings (Innocents do not have a knife). Also, a Knife does not produce an attack sound if you sneak."
		}
	},
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
	--HUD.LUA

	-- Bitmap patches
	-- DO NOT EDIT THESE UNLESS YOU UNDERSTAND WHAT YOU ARE DOING
	["BMP_VICTIMS"]={
		"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFFIIII\x1F\xFF",
		"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F",
		"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FII\x1F\xFF\x1F\x1FII\x1F\x1F\x1F\xFFII\x1F\xFF\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1FII\x1F",
		"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIII\xFFIIII\x1F\xFFIII\x1F\x1F\x1F\x1F",
		"\xFFII\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIIIIII\x1F\xFF\xFFIII\x1F\xFF\xFF",
		"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1FIII\x1FII\x1F\xFF\xFF\xFFIII\x1F\xFF\xFF",
		"II\x1F\xFFII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFF\xFF\xFF\xFFIII\x1F\xFF",
		"IIIIII\x1F\xFF\xFFII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF",
		"\x1FIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFF",
		"\xFF\x1FII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\x1FIIII\x1F\xFF\xFF",
		"\xFF\xFF\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF",
	},
	["BMP_SUSPECTS"]={
		"\xFF\xFFIIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F\xFF\xFFIIII\x1F\xFF",
		"\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
		"\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F\xFF\x1F\x1FII\x1F\x1F\x1F\xFFII\x1F\x1FII\x1F",
		"\xFFIII\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFIII\x1F\x1F\x1F",
		"\xFF\x1FIII\x1F\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\x1FIII\x1F\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\x1F\x1F\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\x1FIII\x1F",
		"\xFF\xFFIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFIII\x1F\xFF\xFFIIIII\x1F\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIII\x1F",
		"\xFF\xFF\xFFIII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1F\x1F\xFF\xFF\xFFII\x1F\x1F\x1F\x1F\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFF\xFFIII\x1F",
		"II\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFII\x1F\xFFII\x1F",
		"IIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F\xFF\xFF\xFFIIIIII\x1F",
		"\x1FIIII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFF\x1FIIII\x1F\xFF\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFF\x1FIIII\x1F\xFF\xFF\xFF\xFFII\x1F\xFF\xFF\xFF\x1FIIII\x1F",
		"\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\xFF\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\x1F",
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
	},

	--The following section contains string which allow your language's native letters to display.
	--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.

	--Color codes in "MM string format" are ranged from 0 to 15 (ASCII) and do not support transluency

	--For more details read /SRC/DOCS/MM_String_Format.md

	-- Role names
	["HUD_ROLES"]={
		"MURDERER", --Murderer
		"SHERIFF", --Sheriff
		"INNOCENT", --Innocent
		"HERO", --Hero
		"DEAD" --Dead
	},
	["HUD_ROLES_SHORT"]={ --used for 8-32 players intermission screen
		"MURD", --Murderer
		"SHERI", --Sheriff
		"INNO", --Innocent
		"HERO", --Hero
		"DEAD" --Dead
	},
	["HUD_TEAMMATES"]="Teammates"
	["HUD_KILLBY"]="Killed by",
	["HUD_STUPID"]="your stupidity",

	-- Scores TAB screen
	["HUD_SCORESTAB"]={
		"If you're new to the gametype",
		"use \7MMHELP\0 in the Console",
		"",
		"",
		"\2Have Fun!"
	},

	-- Scores TAB screen role conters
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
		"please wait for \4one more\0 player to start"
	},

	["HUD_SHOWDOWN"]="Showdown duel!", -- "Showdown duel!"

	--minigame stuff
	["HUD_MINIGAME"]={
		["PRESS"]="Press\2 CUSTOM3\0 to", --must contain MM escape color codes
		["LEAVE"]="leave",
		["CANCEL"]="cancel",
		["SPECTATE"]="spectate",
		["DUEL"]="a minigame duel",
		["REQUEST"]="request a \7PONG\0 game", --must contain MM escape color codes
		["START"]="start a \7\"SONIC RUN\"\0 game", --must contain MM escape color codes
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
	["HUD_WINS"]="Wins",
	["HUD_WIN"]={
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
--If this language is going to be posted on SRB2 Message Board please rename this file to something like:
-- MML_[full_lang_name]_v[MM_version].lua


--Thank you for your efforts to make the gamme more accesible!
