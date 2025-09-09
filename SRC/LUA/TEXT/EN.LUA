-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- ENGLISH
-- Made by SRB2MM community
--
-- LTM's MM REQUIRES THE ENGLISH VERSION OF THE TEXT TO BOOT AND RUN, DO NOT DISABLE OR REMOVE THIS FILE
--
--
-- You can use this file as a template to make your own language/translation for LTM's MM
-- In case of external language file, THE FILE MUST BE LOADED AFTER THE LTM_MM.PK3
-- Please read everything carefully if you want your custom language to work fine
--
-- NOTES BEFORE YOU START:
-- You can apply color to the text strings in SRB2. Coloring is possible with ESCAPE COLOR CODES. They look like "\x##",
-- where ## is the HEXADECIMAL value. But you can do decimal values instead of hexadecimal
-- I will explain everything with the HEX color codes
--
-- Escape Color Codes will paint the string FROM where they are TO the end of the string (or the other color code).
-- Sounds strange? Well, you'll get it better with this example:
--
-- "\x85HThis part of the string will apear in Red \x83and this one in Green! \x80However this part will be White"
--
-- Still don't understand it? https://wiki.srb2.org/wiki/Lua explains SRB2 text coloring much better.
--
-- Here's another cool trick to make several lines in one string. Place the "\n" symbol inside your string where you would
-- normally press ENTER in the text editor.
-- EXAMPLE: "A string\nof text" will make your string look like:
--
--   A string
--   of text
--
-- Several words about HUD strings:
-- All strings which have the "HUD_" prefix are UTF-8 compatible. This means you can directly type the text in them and
-- the custom Unicode renderer in MM will render those strings. There is a slight difference on how you should apply
-- the color codes to these strings - before placing the code you have to place \1 before it. This symbol tells
-- the renderer to interpret the next byte as the color code. Place the symbol \4 anywhere to clear/reset the text
-- formatting. Here is the example of the HUD string:
--
--   "\1\x85This part of the HUD string will appear in RED \1\x83and this one in Green! \4This text will appear white"
--
-- Get it? That's great, now you can begin translating!
--
--
--
-- TROUBLESHOOTING:
--
-- "escape sequence wrong size (2 or 4 digits) near ..." warning on load
--     If you get this error when trying to load your language file it means that some of your text is not interpreted
--     correctly by the game. Go to the line where the error occurs and look carefully in places where you have placed
--     the escape color codes in the text.
--     For example, if you write something like "\x85Dictionary" and you want it red the game thinks that "\x85D" is an
--     escape color code and tries to interpret it. In reality, "\x85D" is an invalid code and the game will show an error.
--     To prevent this, you can format the string like "\x85".."Dictionary" (.. in LUA is a string concatenation operator)
--     or if it's in the middle of the text you can fix the error by simply shifting the SPACE symbol.
--     If your text looks like this: "A wonderful \x85Dictionary"
--     Make it like this instead: "A wonderful\x85 Dictionary"
--     This should fix the problem.
--     Remember! A, B, C, D, E, F letters and 0-9 digits can be interpreted as a color code - be careful with them!
--
-- Symbols like � or gibberish stuff appear in the HUD lines and/or MMHELP text
--     There might be several reasons for this problem. One of them is that you placed symbols in your text, but there
--     are no font graphics for those symbols. You have to contact our team and kindly ask us to make them for you in
--     the next MM update.
--     Another possible reason is that you placed the color codes incorrectly. Please check your color codes in the text.
--     If you are unsure how they should work, look at this English text example at any time.
--     As a last speculation, your text may contain unreadable symbols that the renderer cannot decode. Make sure you saved
--     your Language File in UTF-8 encoding. If that does not help, try typing the problematic text again, but with the UTF-8 encoding.
--
-- For any other questions please visit https://leonardothemutant.github.io/SRB2-Murder-Mystery to contact us


local language_data = { --Language must be a table variable, you can name the variable as you like.
	["VERSION"] = "1.3", --Language File Version, must be identicall to the base MM add-on version number you are writing for, otherwise the lang will appear as OUTDATED
	["AUTHOR"] = "SRB2MM community", --who made this language file



	--
	-- CONSOLE/CHAT SECTION
	--
	-- These messages can support only ASCII (English-only) characters, color is made with Vanilla Color Escape Codes!

	-- MMLANG command
	["CHAT_MMLANG"] = {
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]\x80 command.", --when typed MMHELP with no argument
		"Personal language for Murder Mystery is set to\x82 English." --when typed MMHELP with language argument (it sets the new language)
	},

	-- "You got the role" personal messages
	["CHAT_ROLEGET_PM"] = {
		"You are the \x85Murderer. Murder them all.", --Murderer 
		"You are the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. Kill the \x83wrong person\x80, and the role no longer belongs to you.", --Sheriff
		"You are a\x83 Civilian\x80! Hide and help with the investigation." --Civilian
	},

	-- Randomly selected civilian has a new role
	["CHAT_NEWROLEGET_PM"] = {
		"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!",
		"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!",
		"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!",
		"\x87You've eliminated one of the \x85Murderers\x87! You've earned the honor of \x82Hero\x87!"
	},

	-- Teammate hit
	["CHAT_TEAMMATEHIT_PM"] = {
		"Careful! That's your teammate. Avoid friendly fire next time!",
		"A teammate accidentally hit you. Revenge is NOT recommended!"
	},

	-- Murderer killed
	["CHAT_MURDKILLED"] = {
		"\x85Murderer", --beginning of the string
		"got eliminated!", --ending
	},

	-- Sheriff killed
	["CHAT_SHERIKILLED"] = {
		"\x84Sheriff", --beginning
		"got murdered!", --ending
		"Find their\x84 Emerald\x80!" --additional ending if Sheriff's Emerald is dropped
	},

	-- Hero killed
	["CHAT_HEROKILLED"] = {
		"\x82Hero",
		"got murdered!",
	},

	-- Player was crushed, has drown or fell into a pit
	["CHAT_DIEDHAZARD"] = "died accidentally. Unfortunate.",

	-- Sheriff's Emerald pickup global notification
	["CHAT_SHREMDPICKUP"] = "Someone picked up the \x84Sheriff's Emerald\x80...",

	-- Player has killed someone it did not have to
	["CHAT_KILLPUNISHMENT_PM"] = {
		"\x87You murdered a\x83 Civilian\x87! You got fired. (You are no longer a Sheriff)", --Sheriff killed Civilian
		"\x82Heroes\x87 are not meant to kill\x83 Civilians\x87! You were\x85 executed\x87 for your war crime.", --Hero killed Civilian
		"\x87Oh no! You murdered a \x84Sheriff\x87!!! You were\x85 executed\x87 for that.", --Civilian killed Sheriff
		"\x87You murdered a\x83 Civilian\x87 player just like you! You were\x85 executed\x87 for your crime.", --Civilian killed Civilian
		"\x87Oh no! You murdered a \x82Hero\x87! You were\x85 executed\x87 for that." --Civilian killed Hero
	},

	-- Civilian hurt by Sheriff/Hero personal messages
	["CHAT_INNOHURT"] = {
		"The \x84Sheriff\x80 murdered a\x83 Civilian\x80! Someone else should finish the job!", --Sheriff
		"By killing the\x83 Civilian\x80, the \x82Hero\x80 became the \x85villain\x80 and paid the price." --Hero
	},

	-- "One of the players with role left!"
	["CHAT_ONEQUIT"] = {
		"One of the \x85Murderers\x80 left!", --Murderer
		"One of the \x84Sheriffs\x80 left!!!", --Sheriff
		"One of the \x82Heroes\x80 has left!" --Hero
	},

	-- "Last player with role left!"
	["CHAT_LASTQUIT"] = {
		"The last \x85Murderer\x80 has left!", --Murderer
		"The last \x84Sheriff\x80 has left!", --Sheriff
		"The last \x82Hero\x80 has abandoned everyone!" --Hero
	},

	-- "Player with role left, replaced him"
	["CHAT_REPLACEQUIT"] = {
		"The \x85Murderer\x80 left! Some random\x83 Civilian\x80 will take their role!", --Murderer
		"The \x84Sheriff\x80 left! Some random\x83 Civilian\x80 will take their role!", --Sheriff
		"A \x82Hero\x80 left! Some random\x83 Civilian\x80 will take their role!" --Hero
	},

	-- Win texts
	["CHAT_ENDROUND"] = {
		"Everyone is dead. The \x85Murderers\x80 win!", --Murderers win
		"All of the \x85Murderers\x80 were killed! The\x83 Civilians\x80 win!", --Sheriffs / Heros win
		"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Civilian! Shame on the \x84Sheriff\x80...", --Sheriff killed the last Civilian
		"The \x85Murderers\x80 win because the \x82Hero\x80 chose to kill the last Civilian. Shame on such \x82Hero\x80...", --Hero killed the last Civilian
		"The Defenders of the\x83 Civilians\x80 are dead. The \x85Murderers\x80 win!" --All sheriffs and Heroes are dead
	},


	--
	--BITMAP PATCHES
	--
	--DO NOT EDIT THESE UNLESS YOU UNDERSTAND WHAT YOU ARE DOING
	["BMP_VICTIMS_INFO"] = {
		xoff = 0, --X offset
		yoff = 0  --Y offset
	},
	["BMP_VICTIMS"] = {
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\31\xFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFIII\x1F1F\x1F1F",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFF\xFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFF\xFFFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFF\xFFFF\xFFIII\31",
		"IIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\31",
		"\x1FIIII\x1FFF\xFFFFII\x1FFF\xFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFF1FII\x1FFF\xFFFF\xFFII\x1FFF\xFF1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\x1FIIII\31",
		"\xFFFF\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\31",
	},
	["BMP_SUSPECTS_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_SUSPECTS"] = {
		"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\31",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFIII\x1F1F\31",
		"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFF\x1FIII\31",
		"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFF\xFFII\x1FFF\xFFFF\xFFFFIII\31",
		"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIIII\31",
		"\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\x1FIIII\31",
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\31",
	},
	["BMP_TIME_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_TIME"] = {
		"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFFFII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\31",
		"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFII\31",
		"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFFIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1F1F",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F"
	},
	["BMP_RINGS_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_RINGS"] = {
		"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\31",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\31",
		"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFIII\31",
		"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFF\xFFFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFF\xFFFF\xFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F1F",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\31"
	},


	--
	--HUD SECTION
	--
	--The following section contains strings that allow your language's native letters to display (UTF-8 compatible).
	--Text color codes are little different here than vanilla ones and work as following:
	--  \1\x[hexcode] - Set color & translucency of the text, where [hexcode] is the vanilla color code
	--  \4"           - Clear color & translucency effect (shortcut to "\1\x80")

	-- Name of the gametype
	["HUD_MM"] = "Murder Mystery",

	["HUD_SUSPECTS"] = "Suspects",
	["HUD_VICTIMS"] = "Victims",
	["HUD_TEAMMATES"] = "Teammates",

	-- Role names
	["HUD_ROLES"] = {
		"MURDERER", --Murderer
		"SHERIFF", --Sheriff
		"CIVILIAN", --Civilian
		"HERO", --Hero
		"DEAD" --Dead
	},

	--"Killed by" parts of text
	["HUD_KILLEDBY"] = {
		"Killed by", --"Killed by"
		"justice", --player got killed for punishment
		"the map design" --player got killed by the map hazard
	},

	-- Scores TAB screen
	["HUD_SCORESTAB"] = {
		"If you're new to this gametype, use the \1\x87MMHELP\4",
		"command in the Console for help and",
		"\1\x87MMLANG\4 to change the language here.",
		"",
		"",
		"\1\x82Have Fun!"
	},

	-- Role target/goal (a short description of the role) on TAB screen
	["HUD_ROLETARGET"] = {
		"Blend in, build trust, then strike.", --Murderer
		"Find and eliminate all Murderers.\nDo not kill the Civilians!", --Sheriff
		"Hide and protect yourself. Help with\nthe investigation when possible.", --Civilian
		"You got a chance to stop all Murderers.\nGo and save the day, but be careful!" --Hero
	},

	-- Scores TAB screen role counters
	["HUD_ROLESALIVE"] = {
		"Murderers",
		"Sheriffs",
		"Civilians"
	},

	-- Centered text when you're dead
	["HUD_DEAD"] = {
		"You are\1\x8F dead.",
		"You can't respawn or talk to",
		"people who are still alive."
	},

	-- Centered text when you joined in the middle of the game
	["HUD_MIDJOIN"] = {
		"You joined \1\x84mid-game\4, please wait for this round to finish.",
		"While you are waiting, please read the game rules in the \1\x87MMHELP\4 console command!"
	},

	-- Centered text when you are alone
	["HUD_ALONE"] = {
		"\1\x84".."2 players\4 are required for the game,",
		"Please wait for \1\x84one more\4 player to start."
	},

	-- Sneaking
	["HUD_SNEAKING"] = "Sneaking...",

	-- "Showdown duel!"
	["HUD_SHOWDOWN"] = "Showdown Duel!",

	--minigame stuff
	["HUD_MINIGAME"] = {
		["PRESS"] = "Press\1\x82 CUSTOM3\4 to",
		["LEAVE"] = "leave",
		["CANCEL"] = "cancel",
		["SPECTATE"] = "spectate",
		["DUEL"] = "a minigame duel",
		["REQUEST"] = "request a \1\x87PONG\4 minigame!",
		["START"] = "start a \1\x87\"SONIC RUN\"\4 minigame!",
		["ACCEPT"] = "accept the \1\x87PONG\4 challenge!",
		["WAIT"] = "Waiting for the rival to accept...",
		["SPECTATING"] = "Spectating a duel...",
		["BORED"] = "Bored?",
		["GOAL"]="Goal!"
	},
	["HUD_YOU"] = "YOU",

	-- Winner stuff
	["HUD_WINNERS"] = "Winners:",
	["HUD_WIN"] = {
		"TIE!",
		"\1\x85MURDERERS",
		"\1\x83".."CIVILIANS"
	},

	-- Time Travel stuff
	["HUD_PAST"] = "PAST",
	["HUD_FUTURE"] = "FUTURE",



	--
	-- "MMHELP" CONSOLE COMMAND SECTION
	--

	-- Additional UI text
	["HUD_MMHELP_UI"] = {
		"Use \1\x87JUMP\4/\1\x87SPIN\4 to scroll, \1\x87Next\4/\1\x87Prev Weapon\4 to switch pages",
		"Press\1\x87 CUSTOM1\4 to leave HELP"
	},
	-- MMHELP's text
	["HUD_MMHELP"] = {
		--Every table here acts as a different page
		{
			"\1\x87Welcome to \1\x85Murder Mystery\1\x87!",
			"\1\x87The SRB2 interpretation of the popular multiplayer game!\n",
			"The goal of the game is to find and eliminate all the \1\x85Murderers\4 before they can kill\1\x83 everyone else\4. This gametype is similar to MATCH, so you will need sharp aiming and shooting skills to win!",
			"\nFirst, let's go over the basics so you can jump in and start playing...",
			"\nAt the beginning of each round, you will be assigned a \1\x8Brole\4, which determines your task during the game. Here are the possible \1\x8Broles\4 you might receive:",
			" * \1\x85Murderer\4 - A deadly criminal. Their job is to eliminate everyone.",
			" * \1\x84Sheriff\4 - Tasked with finding and eliminating the \1\x85Murderer(s)\4.",
			" *\1\x83 Civilian\4 - Must avoid being killed and assist in identifying the \1\x85Murderer\4. Depending on the game setup, they can obtain a \1\x85Red Ring\4 to defend themselves by collecting 100 rings (or 50 rings for certain skins).",
			"\nThat is the essential information you need to start playing. For more details, read through this manual to the end",
			"\nUse the \1\x87MMLANG\4 command to change the language of the HUD interface and this manual to your preferred language."
		},
		{
			"\1\x87".."About the gameplay situations\4\n",
			"As mentioned in the basics, the game's goal is to eliminate all \1\x85Murderers\4, but different scenarios can occur during gameplay:",
			"\n* If you die, you will enter the\1\x8F Dead\4 state. Players in this state cannot respawn or communicate globally with players who are still alive. Their messages are visible only to other\1\x8F Dead\4 players.",
			"You cannot chat with or send Personal Messages to still living players while you are\1\x8F Dead\4.",
			"Dying from map hazards such as crushers, falling into pits, or drowning in water will also make you\1\x8F Dead\4 for the rest of the round.",
			"Also,\1\x82 DO NOT TRY TO RENAME YOURSELF WHILE\1\x8F DEAD\4. More details about this are on the next page.",
			"\n* The \1\x84Sheriff's\4 job is to eliminate the \1\x85Murderers\4, but be careful not to shoot a\1\x83 Civilian\4 by mistake.",
			"If a \1\x84Sheriff\4 player shoots a\1\x83 Civilian\4, that player will lose their \1\x8Brole\4 and become a\1\x83 Civilian\4 as a punishment. Another, randomly selected,\1\x83 Civilian\4 player will then silently take on the \1\x84Sheriff's\4 \1\x8Brole\4. Think before you pull the trigger!",
			"\n* If a \1\x85Murderer\4 kills a \1\x84Sheriff\4 while there are still\1\x83 Civilians\4 alive, the \1\x84Sheriff's Emerald\4 will drop near the corpse.",
			"When a\1\x83 Civilian\4 picks up the \1\x84Sheriff's Emerald\4, they become a \1\x82Hero\4. \1\x82Heroes\4 are similar to \1\x84Sheriffs\4 but come with some differences:",
			"  - If a \1\x82Hero\4 kills a\1\x83 Civilian\4, both die, and their \1\x8Brole\4 is not reassigned;",
			"  - \1\x82Heroes\4 do not drop the \1\x84Sheriff's Emerald\4 upon death.",
			"\n* In rounds with higher amount of players, there may be multiple \1\x85Murderers\4 and \1\x84Sheriffs\4. \1\x8ATeams\4 of \1\x85Murderers\4 and \1\x84Sheriffs\4 are formed for these rounds.",
			"\1\x8ATeammates\4 can communicate using the \1\x87SAYTEAM\4 command in the console (SAYTEAM button works as same as the regular chat button) or by starting a message with the \1\x88%\4 symbol, which automatically sends the message to team members.",
			"If you accidentally attack a \1\x8Ateammate\4, both players will receive a personalized warning. Be careful - such team interactions may reveal your \1\x8Brole\4 to others!"
		},
		{
			"\1\x87Things to avoid in \1\x85Murder Mystery\4\n",
			"Rule No. 1:\1\x82 Be kind and have fun!\4 Here are some additional guidelines:",
			"\n* Do not spoil your \1\x8BRole\4, even as a joke. While you can call out someone else's \1\x8Brole\4 if you are sure, never reveal your own.",
			"\n* Avoid insulting other players. Friendly banter is fine, but constant accusations or hostile behavior will make others distrust you.",
			"\n* Do not go AFK (Away From Keyboard). If you stand still too long, a bomb will be dropped on you, and you will be removed from the game.",
			"\n* Do not rename yourself during a round if you are\1\x8F Dead\4. Doing so will result in being kicked from the server. If you are\1\x8F Dead\4, wait until the intermission to rename safely.",
			"\n* Avoid camping around the \1\x84Sheriff's Emerald\4 if you are a \1\x85Murderer\4. Standing near the emerald for 30 seconds will result in being kicked from the game.",
			"\nBreaking these rules may result in a kick or, in severe cases, a ban from the Admin. Play fairly and have fun!"
		},
		{
			"\1\x87Useful tips\4\n",
			"Here are some tips to help you succeed in \1\x85Murder Mystery\4:",
			"\n* If character abilities are disabled by the admin, press \1\x87SPIN\4 to sneak silently without leaving traces or making noise.",
			"\n* Picking up the \1\x84Sheriff's Emerald\4 grants you access to all the weapons and rings you previously collected.",
			"\n* Use the \1\x87SAYTEAM\4 command to coordinate with your \1\x8Ateammates\4 and avoid friendly fire. Starting a message with \1\x88%\4 will automatically send it to your team members.",
			"\n* Take damage from obstacles like lava, spikes, or fire to gain a brief 3-second invincibility.",
			"\n* Find hiding spots on the map to avoid detection. Sometimes it is better to stay out of sight.",
			"\n* If your role is leaked, rename yourself and/or change your skin color. \1\x82Keep in mind that your rename will appear in chat.\4",
			"\n* Use the\1\x87 FIRENORMAL\4 button to wield the \1\x86Knife\4 anywhere, as long as you have rings. Sneaking while using a \1\x86Knife\4 ensures your attack is silent.",
			"\n* Use the \1\x87MMLANG\4 command to change the language of the HUD interface to your preferred language."
		}
	}
}

--finally import your language to the MM
--There is already a function to add the language in the game
--It has 2 arguments to pass:
-- First argument is the language index string, it is usually 2 or 3 characters long
-- Do not make it like "MyLanguage" - use "MYLANG" or "ML" instead (or the official international index of your language) for the simplicity
-- Second argument is the Table Variable of the language itself
MM.AddLang("EN", language_data)
--if everything is done correctly you will receive no errors when loading this file and in the gameplay process
--
--If this language is going to be posted on the SRB2 Message Board or any other public media please rename this file to something like:
-- MM_LANG_[full_lang_name]_[lang_index]_v[MM_version]_r[this_file_revision].lua
--
--e.g. "MM_LANG_English_EN_v1.3_r0.lua"
--You can ommit the revision number if it is the initial upload of the file

--Thank you for your efforts to make the game more accessible!
