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
-- Several words about HUD and CHAT strings:
-- All strings which have the "HUD_" or "CHAT_" prefix are UTF-8 compatible. This means you can directly type the text
-- in them and the custom Unicode renderer in MM will render those strings. There is a slight difference on how you
-- should apply the color codes to these strings - color information is stored in Caret Codes. The format of the
-- Caret Code looks like "^#", where # is the single hexadecimal digit that tells what color to use. The color values
-- themself are based on vanilla SRB2 codes, so it should be easy for you to adopt, if you already know how to use the
-- Vanilla Color Codes. If not, visit https://wiki.srb2.org/wiki/Lua to see the color codes.
-- Anyways, here is the example of the HUD string:
--
--   "^5This part of the HUD/CHAT string will appear in RED ^3and this one in Green! ^0This text will appear white"
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
	["LANGUAGE"] = "English", --Full name of the language
	["VERSION"] = "1.3", --Language File Version, must be identicall to the base MM add-on version number you are writing for, otherwise the lang will appear as OUTDATED
	["AUTHOR"] = "SRB2MM community", --who made this language file



	--
	-- CHAT SECTION
	--
	-- These messages are UTF-8 compatible, meaning you can insert non-English characters in those strings and MM will display them
	-- Note that only characters from U+0016 to U+FFFF will work in MM
	-- Please also note that some characters from this range may not be implemented in MM and lack font graphics (you should contact our team for help with this)
	--
	-- Text color codes are little different here than vanilla ones and work as following:
	-- Instead of placing "\x80", you should put "^0" (Caret Code). The format is "^#" where # is the color value in HEX
	-- So for example, "^2" stands for Yellow and "^5" for Red.

	--Murderer role text
	["CHAT_ROLE_MURDERER"] = {
		["ROLEGET_PM"] = "You are the ^5Murderer^0. ^5Murder them all.", --"You got role" on round start
		["NEWROLEGET_PM"] = "^7Life randomly decided you will be a ^5Murderer^7. ^5Now go kill everyone!", --PM message when a Murderer player left and you got his role
		["KILLED"] = { --"Murderer got killed" announcement
			"Murderer", --beginning of the string
			"got eliminated!" --ending
		},
		["ONEQUIT"] = "One of the ^5Murderers^0 left!", --"One of the Murderer players left the game" annoucement
		["LASTQUIT"] = "The last ^5Murderer^0 has left!", --"The last Murderer has left the game" annoucement
		["REPLACEQUIT"] = "The ^5Murderer^0 left! Some random ^3Civilian^0 will take their role!" --"Murderer player left the game and someone else got the role" annoucement
	},

	--Sheriff role text
	["CHAT_ROLE_SHERIFF"] = {
		["ROLEGET_PM"] = "You are the ^4Sheriff^0! ^4Eliminate all the Murderers^0. Kill the ^3wrong person^0, and the role is no longer yours.", --"You got role" on round start
		["NEWROLEGET_PM"] = "^7The Universe has made you a ^4Sheriff^7! Go and ^4eliminate all Murderers^7!", --PM message when a Sheriff player left and you got his role
		["KILLED"] = { --"Sheriff got killed" announcement
			"Sheriff", --beginning
			"got murdered!", --ending
			"Find their ^4Emerald^0!" --additional ending if Sheriff's Emerald is dropped
		},
		["ONEQUIT"] = "One of the ^4Sheriffs^0 left!!!", --"One of the Sheriffs players left the game" annoucement
		["LASTQUIT"] = "The last ^4Sheriff^0 has left!", --"The last Sheriff has left the game" annoucement
		["REPLACEQUIT"] = "The ^4Sheriff^0 left! Some random ^3Civilian^0 will take their role!" --"Sheriff player left the game and someone else got the role" annoucement
	},

	--Civilian role text
	["CHAT_ROLE_CIVILIAN"] = {
		["ROLEGET_PM"] = "You are a ^3Civilian^0! Hide and help with the investigation." --PM message when a Hero player left and you got his role
	},

	--Hero role text
	["CHAT_ROLE_HERO"] = {
		["NEWROLEGET_PM"] = "^7It was decided that you will be a ^2Hero^7. Save everyone from the Murderers!", --PM message when a Hero player left and you got his role
		["RANKUP_PM"] = "^7You've eliminated one of the ^5Murderers^7! You've earned the honor of ^2Hero^7!", --PM message congratulating Civilian player killing a Murderer
		["KILLED"] = { --"Hero got killed" announcement
			"Hero", --beginning
			"got murdered!" --ending
		},
		["ONEQUIT"] = "One of the ^2Heroes^0 has left!", --"One of the Heroes players left the game" annoucement
		["LASTQUIT"] = "The last ^2Hero^0 has abandoned everyone!", --"The last Hero has left the game" annoucement
		["REPLACEQUIT"] = "A ^2Hero^0 left! Some random ^3Civilian^0 will take their role!" --"Hero player left the game and someone else got the role" annoucement
	},

	--Jester role text
	["CHAT_ROLE_JESTER"] = {
		["ROLEGET_PM"] = "You are the ^1Jester^0. Make everyone believe you are the ^5Murderer^0." --"You got role" on round start
	},

	-- Teammate hit
	["CHAT_TEAMMATEHIT_PM"] = {
		"Careful! That's your teammate. Avoid friendly fire next time!",
		"A teammate accidentally hit you. Revenge is NOT recommended!"
	},

	-- Player was crushed, has drown or fell into a pit
	["CHAT_DIEDHAZARD"] = "died accidentally. Unfortunate.",

	-- Sheriff's Emerald pickup global notification
	["CHAT_SHREMDPICKUP"] = "Someone picked up the ^4Sheriff's Emerald^0...",

	-- Player has killed someone it did not have to
	["CHAT_KILLPUNISHMENT_PM"] = {
		"^7You murdered a ^3Civilian^7! You got fired. (You are no longer a Sheriff)", --Sheriff killed Civilian
		"^2Heroes^7 are not meant to kill ^3Civilians^7! You were ^5executed^7 for your war crime.", --Hero killed Civilian
		"^7Oh no! You murdered a ^4Sheriff^7!!! You were ^5executed^7 for that.", --Civilian killed Sheriff
		"^7You murdered a ^3Civilian^7 player just like you! You were ^5executed^7 for your crime.", --Civilian killed Civilian
		"^7Oh no! You murdered a ^2Hero^7! You were ^5executed^7 for that." --Civilian killed Hero
	},

	-- Civilian hurt by Sheriff/Hero personal messages
	["CHAT_CIVILIANHURT"] = {
		"The ^4Sheriff^0 murdered a ^3Civilian^0! Someone else should finish the job!", --Sheriff
		"By killing the ^3Civilian^0, the ^2Hero^0 became the ^5villain^0 and paid the price." --Hero
	},

	-- Win texts
	["CHAT_ENDROUND"] = {
		"Everyone is dead. The ^5Murderers^0 win!", --Murderers win
		"All of the ^5Murderers^0 were killed! The ^3Civilians^0 win!", --Sheriffs / Heros win
		"The ^5Murderers^0 win because ^4Sheriff^0 murdered the last Civilian! Shame on the ^4Sheriff^0...", --Sheriff killed the last Civilian
		"The ^5Murderers^0 win because the ^2Hero^0 chose to kill the last Civilian. Shame on such ^2Hero^0...", --Hero killed the last Civilian
		"The Defenders of the ^3Civilians^0 are dead. The ^5Murderers^0 win!", --All sheriffs and Heroes are dead
		"^1Jester^0 was killed by the Good Guys. Gambling is bad kids." --Jester got killed by Sheriff/Hero
	},



	--
	--HUD SECTION
	--
	--This section is also UTF-8 compatible

	-- Name of the gametype
	["HUD_MM"] = "Murder Mystery",

	["HUD_SUSPECTS"] = "Suspects",
	["HUD_VICTIMS"] = "Victims",
	["HUD_TEAMMATES"] = "Teammates",

	-- Role names
	["HUD_ROLES"] = {
		["MURDERER"] = "MURDERER",
		["SHERIFF"] = "SHERIFF",
		["CIVILIAN"] = "CIVILIAN",
		["HERO"] = "HERO",
		["JESTER"] = "JESTER",
		["DEAD"] = "DEAD"
	},

	--"Killed by" parts of text
	["HUD_KILLEDBY"] = {
		"Killed by", --"Killed by"
		"justice", --player got killed for punishment
		"the map design" --player got killed by the map hazard
	},

	-- Scores TAB screen text (appears in Singpleplayer and Cryptic mode)
	["HUD_SCORESTAB"] = "If you're new to this gametype, use the ^7MMHELP^0 command in the Console for help and ^7MMLANG^0 to change the language here.\n\n^2Have Fun!",

	-- Role target/goal (a short description of the role) on TAB screen
	["HUD_ROLETARGET"] = {
		["MURDERER"] = "Blend in, build trust, then strike.", --Murderer
		["SHERIFF"] = "Find and eliminate all Murderers. Do not kill the Civilians!", --Sheriff
		["CIVILIAN"] = "Hide and protect yourself. Help with the investigation when possible.", --Civilian
		["HERO"] = "You got a chance to stop all Murderers. Go and save the day, but be careful!", --Hero
		["JESTER"] = "Make everyone believe you are the Bad Guy. Your Weapon Rings will not hurt anyone, unless a Hero" --Jester
	},

	-- Scores TAB screen role counters
	["HUD_ROLESALIVE"] = {
		"Murderers",
		"Sheriffs",
		"Civilians"
	},

	-- Centered text when you're dead
	["HUD_DEAD"] = "You are ^Fdead^0.\nYou can't respawn or talk to people who are still alive.",

	-- Centered text when you joined in the middle of the game
	["HUD_MIDJOIN"] = "You joined ^4mid-game^0, please wait for this round to finish.\nWhile you are waiting, you can read the game rules in the ^7MMHELP^0 console command",

	-- Centered text when you are alone
	["HUD_ALONE"] = "^42 players^0 are required for the game,\nPlease wait for ^4one more^0 player to start.",

	-- Spectator related text
	["HUD_SPECTATOR"] = {
		["INFO"] = "You are currently spectating. Enter the game to join on the next round", --Centered text showing that you are a spectator
		["SWITCHING_TO"]= "Going into spectator mode next round...", --Information that you are going to switch TO spectator
		["SWITCHING_FROM"]= "Entering the game next round.." --Information that you are switing FROM spectator
	},

	-- Sneaking
	["HUD_SNEAKING"] = "Sneaking...",

	-- "Showdown duel!"
	["HUD_SHOWDOWN"] = "Showdown Duel!",

	--minigame stuff
	["HUD_MINIGAME"] = {
		["PRESS"] = "Press ^2CUSTOM3^0 to",
		["LEAVE"] = "leave",
		["CANCEL"] = "cancel",
		["SPECTATE"] = "spectate",
		["DUEL"] = "a minigame duel",
		["REQUEST"] = "request a ^7PONG^0 minigame!",
		["START"] = "start a ^7\"SONIC RUN\"^0 minigame!",
		["ACCEPT"] = "accept the ^7PONG^0 challenge!",
		["WAIT"] = "Waiting for the rival to accept...",
		["SPECTATING"] = "Spectating a duel...",
		["BORED"] = "Bored?",
		["GOAL"]="Goal!"
	},
	["HUD_YOU"] = "YOU",

	-- Winner stuff
	["HUD_WINNERS"] = "Winners:",
	["HUD_WIN"] = {
		["TIE"] = "TIE!", --Tie
		["BAD"] = "^5MURDERERS", --Bad guys (Murderers)
		["GOOD"] = "^3CIVILIANS", --Good guys (Sheriffs + Heroes + Civilians)
		["JESTER"] = "^1JESTER" --Jester
	},

	-- Time Travel stuff
	["HUD_PAST"] = "PAST",
	["HUD_FUTURE"] = "FUTURE",



	--
	-- "MMHELP" CONSOLE COMMAND SECTION
	--

	-- Additional UI text
	["HUD_MMHELP_UI"] = {
		"Use ^7UP^0/^7DOWN^0 to scroll, ^7LEFT^0/^7RIGHT^0 to switch pages",
		"Press any ^7CUSTOM^0 button to leave HELP"
	},
	-- MMHELP's text
	["HUD_MMHELP"] = {
		--Every table here acts as a different page
		{
			"^7Welcome to ^5Murder Mystery^7!\nThe SRB2 interpretation of the popular multiplayer game!^0\n",
			"The goal of the game is to find and eliminate all the ^5Murderers^0 before they can kill ^3everyone else^0. This gametype is similar to MATCH, so you will need sharp aiming and shooting skills to win!",
			"\nFirst, let's go over the basics so you can jump in and start playing...",
			"\nAt the beginning of each round, you will be assigned a ^Brole^0, which determines your task during the game. Here are the possible ^Broles^0 you might receive:",
			" * ^5Murderer^0 - A deadly criminal. Their job is to eliminate everyone.",
			" * ^4Sheriff^0 - Tasked with finding and eliminating the ^5Murderer(s)^0.",
			" * ^3Civilian^0 - Must avoid being killed and assist in identifying the ^5Murderer^0. Depending on the game setup, they can obtain a ^5Red Ring^0 to defend themselves by collecting 100 rings (or 50 rings for certain skins).",
			"\nThat is the essential information you need to start playing. For more details, read through this manual to the end",
			"\nUse the ^7MMLANG^0 command to change the language of the HUD interface and this manual to your preferred language."
		},
		{
			"^7About the gameplay situations^0\n",
			"As mentioned in the basics, the game's goal is to eliminate all ^5Murderers^0, but different scenarios can occur during gameplay:",
			"\n* If you die, you will enter the ^FDead^0 state. Players in this state cannot respawn or communicate globally with players who are still alive. Their messages are visible only to other ^FDead^0 players.",
			"You cannot chat with or send Personal Messages to still living players while you are ^FDead^0.",
			"Dying from map hazards such as crushers, falling into pits, or drowning in water will also make you ^FDead^0 for the rest of the round.",
			"Also, ^2DO NOT TRY TO RENAME YOURSELF WHILE^F DEAD^0. More details about this are on the next page.",
			"\n* The ^4Sheriff's^0 job is to eliminate the ^5Murderers^0, but be careful not to shoot a ^3Civilian^0 by mistake.",
			"If a ^4Sheriff^0 player shoots a ^3Civilian^0, that player will lose their ^Brole^0 and become a ^3Civilian^0 as a punishment. Another, randomly selected, ^3Civilian^0 player will then silently take on the ^4Sheriff's^0 ^Brole^0. Think before you pull the trigger!",
			"\n* If a ^5Murderer^0 kills a ^4Sheriff^0 while there are still ^3Civilians^0 alive, the ^4Sheriff's Emerald^0 will drop near the corpse.",
			"When a ^3Civilian^0 picks up the ^4Sheriff's Emerald^0, they become a ^2Hero^0. ^2Heroes^0 are similar to ^4Sheriffs^0 but come with some differences:",
			" - If a ^2Hero^0 kills a ^3Civilian^0, both die, and their ^Brole^0 is not reassigned;",
			" - ^2Heroes^0 do not drop the ^4Sheriff's Emerald^0 upon death.",
			"\n* In rounds with higher amount of players, there may be multiple ^5Murderers^0 and ^4Sheriffs^0. ^ATeams^0 of ^5Murderers^0 and ^4Sheriffs^0 are formed for these rounds.",
			"^ATeammates^0 can communicate using the ^7SAYTEAM^0 command in the console or by using the Team Chat (keyboard ^8'y'^0 button).",
			"If you accidentally attack a ^Ateammate^0, both players will receive a personalized warning. Be careful - such team interactions may reveal your ^Brole^0 to others!"
		},
		{
			"^7Things to avoid in Murder Mystery^0\n",
			"Rule No. 1: ^2Be kind and have fun!^0 Here are some additional guidelines:",
			"\n* Do not spoil your ^BRole^0, even as a joke. While you can call out someone else's ^Brole^0 if you are sure, never reveal your own.",
			"\n* Avoid insulting other players. Friendly banter is fine, but constant accusations or hostile behavior will make others distrust you.",
			"\n* Do not go ^8AFK^0 (^8Away From Keyboard^0). If you stand still too long, a bomb will be dropped on you, and you will be removed from the game.",
			"\n* Do not rename yourself during a round if you are ^FDead^0. Doing so will result in being kicked from the server. If you are ^FDead^0, wait until the intermission to rename safely.",
			"\n* Avoid camping around the ^4Sheriff's Emerald^0 if you are a ^5Murderer^0. Standing near the emerald for 30 seconds will result in being kicked from the game.",
			"\nBreaking these rules may result in a kick or, in severe cases, a ban from the Admin. Play fairly and have fun!"
		},
		{
			"^7Useful tips^0\n",
			"Here are some tips to help you succeed in ^7Murder Mystery^0:",
			"\n* If character abilities are disabled by the admin, press ^7SPIN^0 to sneak silently without leaving traces or making noise.",
			"\n* Picking up the ^4Sheriff's Emerald^0 grants you access to all the weapons and rings you previously collected.",
			"\n* Use the Team Chat to coordinate actions with your ^Ateammates^0 and avoid friendly fire.",
			"\n* Take damage from obstacles like lava, spikes, or fire to gain a brief 3-second invincibility.",
			"\n* Find hiding spots on the map to avoid detection. Sometimes it is better to stay out of sight.",
			"\n* If your role is leaked, rename yourself and/or change your skin color. ^2Keep in mind that your rename will appear in chat.^0",
			"\n* Use the ^7FIRENORMAL^0 button to wield the ^6Knife^0 anywhere, as long as you have rings. Sneaking while using a ^6Knife^0 ensures your attack is silent.",
			"\n* Use the ^7MMLANG^0 command to change the language of the HUD interface to your preferred language."
		}
	},



	--
	--TEXT PATCHES
	--
	--DO NOT EDIT THESE UNLESS YOU UNDERSTAND WHAT YOU ARE DOING
	["IMG_VICTIMS"] = {
		xoff = 0, --X offset
		yoff = 0, --Y offset
		palette = {
			{73, 31}, --palette #0
			{37, 31}  --palette #1
		},
		image = {
			"001 001  001   00001  0000001 001  001    001  00001",
			"001 001  001  0000001 0000001 001  001    001 0000001",
			"001 001  001  0011001 1100111 001  000   0001 0011001",
			"001 001  001  001 001   001   001  0000 00001 0001111",
			"001 001  001  001 111   001   001  0000000001 10001",
			"001 001  001  001       001   001  0010001001  10001",
			"001 001  001  001 001   001   001  001101 001   10001",
			"0000001  001  001 001   001   001  001 1  001 0011001",
			"100001   001  0000001   001   001  001    001 0000001",
			" 1001    001  100001    001   001  001    001 100001",
			"  11     111   1111     111   111  111    111  1111"
		}
	},
	["IMG_SUSPECTS"] = {
		xoff = 0, --X offset
		yoff = 0, --Y offset
		palette = {
			{73, 31}
		},
		image = {
			" 00001  001 001  00001  000001  0000001  00001  0000001  00001",
			"0000001 001 001 0000001 0000001 0000001 0000001 0000001 0000001",
			"0011001 001 001 0011001 0011001 0011111 0011001 1100111 0011001",
			"000111  001 001 000111  001 001 001     001 001   001   000111",
			"10001   001 001 10001   0000001 0000001 001 111   001   10001",
			" 10001  001 001   0001  0000011 0000001 001       001    10001",
			"  10001 001 001    0001 00111   0011111 001 001   001     10001",
			"0011001 001 001 001 001 001     001     001 001   001   0011001",
			"0000001 0000001 0000001 001     0000001 0000001   001   0000001",
			"100001  100001  100001  001     0000001 100001    001   100001",
			" 1111    1111    1111   111     1111111  1111     111    1111"
		}
	},
	["IMG_TIME"] = {
		xoff = 0,
		yoff = 0,
		palette = {
			{73, 31},
			{37, 31}
		},
		image = {
			"0000001 001  001    001 0000001",
			"0000001 001  001    001 0000001",
			"  00111 001  000   0001 0011111",
			"  001   001  0000 00001 001",
			"  001   001  0000000001 000001",
			"  001   001  0010001001 000001",
			"  001   001  001101 001 001111",
			"  001   001  001 1  001 001",
			"  001   001  001    001 0000001",
			"  001   001  001    001 0000001",
			"  111   111  111    111 1111111"
		}
	},
	["IMG_RINGS"] = {
		xoff = 0,
		yoff = 0,
		palette = {
			{73, 31},
			{37, 31}
		},
		image = {
			"000001   001  001   001  00001   00001",
			"0000001  001  001   001 0000001 0000001",
			"0011001  001  000   001 0011001 0011001",
			"001 001  001  0000  001 001 001 000111",
			"0000011  001  00000 001 001 111 10001",
			"000001   001  001000001 0010001  10001",
			"001 001  001  001100001 0010001   10001",
			"001 001  001  001 10001 0011001 0011001",
			"001 001  001  001  1001 0000001 0000001",
			"001 001  001  001   001  00001   00001",
			"111 111  111  111   111  1111    1111"
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
