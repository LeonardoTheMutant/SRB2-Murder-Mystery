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

local language_data = { --Language must be a table variable, you can name the variable as you like.
	["VERSION"] = "1.1", --to check if lang content is not OUTDATED
	["AUTHOR"] = "SRB2MM community", --who made this language file
	["MM"] = "Murder Mystery", --name of the gametype, this string supports MM format

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

	["CHARSET"] = "STCFN", --"Standart Console Font", can be found in srb2.pk3

	["NONASCII"] = false, --set this to true if your language is not Latin-based. This only marks the language with * in the MMLANG language list

	--The following sections contain strings that allow your language's native letters to display.
	--These strings also use "Murder Mystery string format", which means that vanilla color codes WILL NOT WORK HERE.

	--Color codes in "MM string format" are ranged from 0 to 15 (ASCII) and do not support translucency

	--For more details read /SRC/DOCS/MM_HUD_Library.md
	["MMHELP_CMD"] = {
		"Use \23JUMP\16/\23SPIN\16 to scroll, \23Next\16/\23Prev Weapon\16 to switch pages",
		"Press \23CUSTOM1\16 to leave HELP"
	},
	["MMHELP"] = { --MMHELP command
        --Every table here acts as a different page
        { --MAIN
            "\23Welcome to \21Murder Mystery\23!",
            "\23The SRB2 interpretation of the \23popular \23multiplayer \23game!\16\n",
            "The goal of the game is to find and eliminate all the \21Murderers\16 before they can kill \19everyone else\16. This gametype is similar to MATCH, so you will need sharp aiming and shooting skills to win!",
            "\nFirst, let's go over the basics so you can jump in and start playing...",
            "\nAt the beginning of each round, you will be assigned a \27role\16, which determines your task during the game. Here are the possible \27roles\16 you might receive:",
            " * \21Murderer\16 - A deadly criminal. Their job is to eliminate everyone.",
            " * \20Sheriff\16 - Tasked with finding and eliminating the \21Murderer(s)\16.",
            " * \19Civilian\16 - Must avoid being killed and assist in identifying the \21Murderer\16. Depending on the game setup, they can obtain a \21Red Ring\16 to defend themselves by collecting 100 rings (or 50 rings for certain skins).",
            "\nThat is the essential information you need to start playing. For more details, read through this manual to the end",
			"\nUse the \23MMLANG\16 command to change the language of the HUD interface and this manual to your preferred language."
        },
        --GAME
        {
            "\23".."About the gameplay situations\16\n",
            "As mentioned in the basics, the game's goal is to eliminate all \21Murderers\16, but different scenarios can occur during gameplay:",
            "\n* If you die, you will enter the \31Dead\16 state. Players in this state cannot respawn or communicate globally with players who are still alive. Their messages are visible only to other \31Dead\16 players.",
            "You cannot chat with or PM living players while you are \31Dead\16.",
			"Dying from map hazards such as crushers, falling into pits, or drowning in water will also make you \31Dead\16 for the rest of the round.",
            "Also, \18DO \18NOT \18TRY \18TO \18RENAME \18YOURSELF \18WHILE \31DEAD\16. More details about this are on the next page.",
            "\n* The \20Sheriff's\16 job is to eliminate the \21Murderers\16, but be careful not to shoot a \19Civilian\16 by mistake.",
            "If a \20Sheriff\16 shoots a \19Civilian\16, they will lose their \27role\16 and become a \19Civilian\16. A random \19Civilian\16 will then silently take on the \20Sheriff's\16 \27role\16. Think before you pull the trigger!",
            "\n* If a \21Murderer\16 kills a \20Sheriff\16 while there are still \19Civilians\16 alive, the \20Sheriff's Emerald\16 will drop near their corpse.",
            "When a \19Civilian\16 picks up the \20Sheriff's Emerald\16, they become a \18Hero\16. \18Heroes\16 are similar to \20Sheriffs\16 but come with some differences:",
            "  - If a \18Hero\16 kills a \19Civilian\16, both die, and their \27role\16 is not reassigned;",
            "  - \18Heroes\16 do not drop the \20Sheriff's Emerald\16 upon death.",
            "\n* In rounds with higher player counts, there may be multiple \21Murderers\16 and \20Sheriffs\16. \26Teams\16 of \21Murderers\16 and \20Sheriffs\16 are formed for these rounds.",
            "\26Teammates\16 can communicate using the \23SAYTEAM\16 command in the console (SAYTEAM button works as same as the regular chat button) or by starting a message with the \24%\16 symbol, which automatically sends the message to team members.",
            "If you accidentally attack a \26teammate\16, both players will receive a personalized warning. Be careful - such team interactions may reveal your \27role\16 to others!"
        },
        --BAD
        {
            "\23Things to avoid in \21Murder Mystery\16\n",
            "Rule No. 1: \18Be kind and \18have fun!\16 Here are some additional guidelines:",
            "\n* Do not spoil your \27Role\16, even as a joke. While you can call out someone else's \27role\16 if you are sure, never reveal your own.",
            "\n* Avoid insulting other players. Friendly banter is fine, but constant accusations or hostile behavior will make others distrust you.",
            "\n* Do not go AFK (Away From Keyboard). If you stand still too long, a bomb will be dropped on you, and you will be removed from the game.",
            "\n* Do not rename yourself during a round if you are \31Dead\16. Doing so will result in being kicked from the server. If \31Dead\16, wait until the intermission to rename safely.",
            "\n* Avoid camping around the \20Sheriff's Emerald\16 if you are a \21Murderer\16. Standing near the emerald for 30 seconds will result in being kicked from the game.",
            "\nBreaking these rules may result in a kick or, in severe cases, a ban from the Admin. Play fairly and have fun!"
        },
        --TIPS
        {
            "\23Useful tips\16\n",
            "Here are some tips to help you succeed in \21Murder Mystery\16:",
            "\n* If character abilities are disabled by the admin, press \23SPIN\16 to sneak silently without leaving traces or making noise.",
            "\n* Picking up the \20Sheriff's Emerald\16 grants you access to all the weapons and rings you previously collected.",
            "\n* Use the \23SAYTEAM\16 command to coordinate with your \26teammates\16 and avoid friendly fire. Starting a message with \24%\16 will automatically send it to your team members.",
            "\n* Take damage from obstacles like lava, spikes, or fire to gain a brief 3-second invincibility.",
            "\n* Find hiding spots on the map to avoid detection. Sometimes it is better to stay out of sight.",
            "\n* If your role is leaked, rename yourself and/or change your skin color. \18Keep in mind that your rename will appear in chat.\16",
            "\n* Use the \23FIRENORMAL\16 button to wield the \22Knife\16 anywhere, as long as you have rings. Sneaking while using a \22Knife\16 ensures your attack is silent.",
            "\n* Use the \23MMLANG\16 command to change the language of the HUD interface to your preferred language."
        }
    },

	--
	--console/chat messages, these messages can support only ASCII (English-only) characters. Color is made with Vanilla Color Escape Codes
	--

	--MMLANG command
	["MMLANG"] = {
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]\x80 command", --when typed MMHELP with no argument
		"Personal language for Murder Mystery is set to\x82 English" --when typed MMHELP with language argument (it sets the new language)
	},
	
	-- "You got the role" personal messages
	["ROLE_GET"] = {
		"You are the \x85Murderer\x80! \x85Murder everyone!", --Murderer
		"You are the \x84Sheriff\x80!\x84 Eliminate all the Murderers\x80. If you kill a\x83 Civilian\x80, you will be stripped of your role.", --Sheriff
		"You are a\x83 Civilian\x80! Hide and help with the investigation." --Civilian
	},

	-- Randomly selected civilian has a new role
	["NEWROLE_GET"] = {
		"\x87Life randomly decided you will be a \x85Murderer\x87.\x85 Now go kill everyone!",
		"\x87The Universe has made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!",
		"\x87It was decided that you will be a \x82Hero\x87. Save everyone from the Murderers!",
		"\x87You have eliminated one of the \x85Murderers\x87! You were promoted to \x82Hero\x87!"
	},

	-- Teammate hit
	["TEAMMATE_HIT"] = {
		"This player is your teammate. Please do not hit your teammates next time.",
		"A teammate hit you. Please do not take your revenge on them."
	},

	-- Murderer killed
	["MURD_KILLED"] = {
		"\x85Murderer\x87", --beginning of the string
		"\x80got eliminated", --ending
	},

	-- Sheriff killed
	["SHERI_KILLED"] = {
		"\x84Sheriff\x87", --beginning
		"\x80got murdered!", --ending
		"Find their\x84 Emerald\x80!" --additional ending if Sheriff's Emerald is dropped
	},

	--Hero killed
	["HERO_KILLED"] = {
		"\x82Hero\x87",
		"\x80got murdered!",
	},

	--player was crushed, has drown or fell into a pit
	["DIED_HAZARD"] = "has died in an accident",

	--Sheriff's Emerald pickup global notification
	["SHREMD_PICK"] = "Someone picked up the \x84Sheriff's Emerald\x80...",

	--Player has killed someone it did not have to
	["KILL_PUNISHMENT_PM"] = {
		"\x87You murdered a\x83 Civilian\x87! You got fired. (You are no longer a Sheriff)", --Sheriff killed Civilian
		"\x82Heroes\x87 are not meant to kill\x83 Civilians\x87! You got the death penalty for that.", --Hero killed Civilian
		"\x87Oh no! You murdered a \x84Sheriff\x87!!! You got the death penalty for that", --Civilian killed Sheriff
		"\x87You murdered a\x83 Civilian\x87 player just like you! You got the death penalty for that", --Civilian killed Civilian
		"\x87Oh no! You murdered a \x82Hero\x87! You got the death penalty for that" --Civilian killed Hero
	},

	-- Civilian hurt by Sheriff/Hero personal messages
	["INNO_HURT"] = {
		"The \x84Sheriff\x80 murdered a\x83 Civilian\x80! Someone else should finish the job!", --Sheriff
		"The \x82Hero\x80 decided to become a villian by killing the\x83 Civilian\x80. Now both are lying dead. Shame on such\x82 Hero\x80" --Hero
	},

	-- "One of the [role]s left!"
	["ONE_QUIT"] = {
		"One of the \x85Murderers\x80 left!", --Murderer
		"One of the \x84Sheriffs\x80 left!!!", --Sheriff
		"One of the \x82Heroes\x80 has abandoned us!" --Hero
	},

	-- "Last [role] left!"
	["LAST_QUIT"] = {
		"The last \x85Murderer\x80 has left!", --Murderer
		"The last \x84Sheriff\x80 has left!", --Sheriff
		"The last \x82Hero\x80 has left!" --Hero
	},

	-- "[role] left, replaced him"
	["REPLACE_QUIT"] = {
		"The \x85Murderer\x80 left! Some random\x83 Civilian\x80 will take their role!", --Murderer
		"The \x84Sheriff\x80 left! Some random\x83 Civilian\x80 will take their role!", --Sheriff
		"A \x82Hero\x80 left! Some random\x83 Civilian\x80 will take their role!" --Hero
	},

	-- Win texts
	["ENDROUND"] = {
		"Everyone is dead. The \x85Murderers\x80 win!", --Murderers win
		"All of the \x85Murderers\x80 were killed! The\x83 Civilians\x80 win!", --Sheriffs / Heros win
		"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Civilian! Shame on the \x84Sheriff\x80", --Sheriff killed the last Civilian
		"The \x82Hero\x80 chose to kill the last Civilian. The \x85Murderers\x80 win!", --Hero killed the last Civilian
		"The Defenders of the\x83 Civilians\x80 are dead. The \x85Murderers\x80 win!" --All sheriffs and Heroes are dead
	},

	--HUD.LUA

	-- Bitmap patches
	-- DO NOT EDIT THESE UNLESS YOU UNDERSTAND WHAT YOU ARE DOING
	["BMP_VICTIMS_INFO"] = {
		xoff = 0, --X offset
		yoff = 0  --Y offset
	},
	["BMP_VICTIMS"] = {
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
	["BMP_SUSPECTS_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_SUSPECTS"] = {
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
	["BMP_TIME_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_TIME"] = {
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
	["BMP_RINGS_INFO"] = {
		xoff = 0,
		yoff = 0
	},
	["BMP_RINGS"] = {
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
	["HUD_ROLES"] = {
		"MURDERER", --Murderer
		"SHERIFF", --Sheriff
		"CIVILIAN", --Civilian
		"HERO", --Hero
		"DEAD" --Dead
	},
	["HUD_SUSPECTS"] = "Suspects",
	["HUD_VICTIMS"] = "Victims",
	["HUD_TEAMMATES"] = "Teammates",
	["HUD_KILLBY"] = "Killed by",
	["HUD_STUPID"] = "your stupidity",

	-- Scores TAB screen
	["HUD_SCORESTAB"] = {
		"If you are new to the gametype use \23MMHELP\16 ",
		"command in the Console for help and",
		"\23MMLANG\16 to change the language here",
		"",
		"",
		"\18Have Fun!"
	},

	-- Role target/goal (a short description of the role) on TAB screen
	["HUD_ROLETARGET"] = {
		"Murder everyone.", --Murderer
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
		"You are\31 dead",
		"You can not respawn or talk to",
		"people who are not dead."
	},

	-- Centered text when you joined
	["HUD_MIDJOIN"] = {
		"You joined \20mid-game\16, please wait for this round to finish.",
		"While you are waiting, please read the game rules in the \23MMHELP\16 console command"
	},

	-- Centered text when you are alone
	["HUD_ALONE"] = {
		"\20".."2 players\16 are required for the game,",
		"Please wait for \20one more\16 player to start"
	},

	--Sneaking
	["HUD_SNEAKING"] = "Sneaking...",

	-- "Showdown duel!"
	["HUD_SHOWDOWN"] = "Showdown duel!",

	--minigame stuff
	["HUD_MINIGAME"] = {
		["PRESS"] = "Press\18 CUSTOM3\16 to", --must contain MM escape color codes
		["LEAVE"] = "leave",
		["CANCEL"] = "cancel",
		["SPECTATE"] = "spectate",
		["DUEL"] = "a minigame duel",
		["REQUEST"] = "request a \23PONG\16 minigame", --must contain MM escape color codes
		["START"] = "start a \23\"SONIC RUN\"\16 minigame", --must contain MM escape color codes
		["ACCEPT"] = "accept the \23PONG\16 challenge!", --must contain MM escape color codes
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
		"\21MURDERERS", --must contain MM escape color code
		"\19CIVILIANS" --must contain MM escape color code
	},
	
	-- Time Travel stuff
	["HUD_PAST"] = "PAST",
	["HUD_FUTURE"] = "FUTURE"
}

--finally import your language to the MM
-- There is already a function to add the language in the game
-- It has 2 arguments to pass
-- First argument is the language index string, it is usually 2 or 3 letters long and ALWAYS UPPERCASE
--  Do not make it like "MyLanguage" - use "MYLANG" or "ML" instead (or the official international index of your language)
-- Second argument is the Table Variable of the language itself
MM.AddLang("EN", language_data)
--if everything is done correctly you will receive no errors when loading this file and in the gameplay process
--
--If this language is going to be posted on the SRB2 Message Board please rename this file to something like:
-- MM_LANG_[full_lang_name]_v[MM_version].lua

--Thank you for your efforts to make the game more accessible!
