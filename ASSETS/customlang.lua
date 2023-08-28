-- SRB2 MURDER MYSTERY language file asset
-- THIS FILE MUST BE LOADED AFTER MAIN MM .PK3
--
-- You can use this file as a template to add your own language to MM,
-- Please read everything carefully and your custom language will work fine
--
-- DEVELOPER NOTE:
--   As of 8.0-BETA custom language files cannot include text for MMHELP. This command will display ENGLISH text
--   as a fallback instead. I hope I can fix this in the next update.
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

local language={ --Language must be a table variable, you can name the variable as you like.
	["VERSION"]="9.0-BETA", --this line must be AS SAME AS add-on version CAPITALISED, otherwise it will be marked as OUTDATED.
	["AUTHOR"]="LeonardoTheMutant", --who made the translation file, leave it to nil if you want to be uncredited.
	["MM"]="Murder Mystery", --name of the gametype, shown on Intermission screen and SCORES TAB
	["MMHELP"]={ --Text for MMHELP command
		["MAIN"]={
			"This text is shown",
			"when no page argument is passed.",
			"You can place as many lines as you need",
			"on these pages"
		},["GAME"]={
			"Explain about game mechanics",
			"here."
		},["BAD"]={
			"Tell players about things",
			"That are bad to do in MM"
		},["CHAT"]={
			"List of Sound Emojis should be there"
		}
	},
	--GAME.LUA
	--"You got the role" messages at the beginning of the round
	["ROLE_GET"]={
		"You're the \x85Murderer\x80! \x85Murder everyone.", --for Murderer
		"You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. If you kill an Innocent, you lose.", --for Sheriff
		"You're an \x83Innocent\x80! Hide and help the sheriff find the murderer." --and for the Innocent
	},
	-- setRandomPlayerAs(), messages that are printed personaly to the 'lucky players'
	["NEWROLE_GET"]={
		"\x87Life made a \x85Murderer\x87 from you, \x85now go kill everyone.", --Player became Murderer
		"\x87The Universe made you the new \x84Sheriff\x87! It's now your job to\x84 eliminate all Murderers\x87!" --became Sheriff
	},
	-- Teammates hit, these messages are sent personally
	["TEAMMATE_HIT"]={
		"\x85Hey, this guy is your teammate, don't try to kill him again", --for Attacker
		"\x85Your teammate hit you, don't get mad on him" --for Victim
	},
	-- Murderer hit/killed
	["MURD_KILLED"]={
		"\x85Murderer\x87 ", --must contain SPACE at the end, a player name and second part are added here
		"\x80 was eliminated!" --second part
	},
	-- Sheriff hit/killed
	["SHERI_KILLED"]={
		"\x84Sheriff\x87 ", --must contain SPACE at the end, a player name and second part are added
		"\x80 was murdered! \x83Innocents\x80 can pick up his Emerald to finish the job!", --second part
		"\x80 was murdered!" --second part, except when emerald doesn't drop from Sheriff
	},
	["SHREML_PICK"]="Some Innocent picked up \x84Sheriff's Emerald\x80...", --Sheriff Emerald pickup message
	-- Innocent hurt/left
	["INNO_HURT_PM"]="\x87You murdered the \x83Innocent\x87! You are no longer a \x84Sheriff\x87!", --Personal message for awful Sheriff
	["INNO_HURT"]="\x84Sheriff\x80 murdered the Innocent! Someone other from \x83Innocents\x80 will have to finish his job!" --Global message for everyone about Sheriff's war crime
	-- "One of the [role]s left!"
	["ONE_LEFT"]={
		"One of the \x85Murderers\x80 left!", --Murd left
		"One of the \x84Sheriffs\x80 left!" --Sheri left
	},
	-- "Last [role] left!"
	["LAST_LEFT"]={
		"Last \x85Murderer\x80 left!", --Murd
		"Last \x84Sheriff\x80 left!", --Sheriff
		"Last \x83Innocent\x80 left!" --Inno
	},
	-- "[role] left, replaced him"
	["REPLACE_LEFT"]={
		"\x85Murderer\x80 left! Someone from \x83Innocents\x80 took his role!", --Murd left but a replacement found
		"\x84Sheriff\x80 left! Someone from \x83Innocents\x80 took his role!" --Sheri left but a replacement found
	},
	-- Win chat texts
	["ROLE_WIN"]={
		"Everyone are murdered, \x85Murderers\x80 win!", --Murderers win
		"All murderers eliminated, \x84Sheriffs\x80 & all \x83Innocents\x80 win!", --Sheriffs win
		"\x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent!" --Murds win thanks to Sheriff's stupidity
	},
	--CHAT.LUA warnings
	["CHAT"]={
		"is alive, message not sent", --When dead player tries to PM alive player
		"You're sending too much messages, please wait", --Chat delay msg
		"You can't just become\x8F dead\x80 to spectate!" --when try to use SPECTATE from pause menu
	},
	--HUD.LUA
	-- Role names, these are shown under RINGS on the main HUD and on Intermission
	["ROLES_HUD"]={
		"\x85MURDERER", --must contain escape color code
		"\x84SHERIFF", --must contain escape color code
		"\x83INNOCENT", --must contain escape color code
		"\x8F".."DEAD" --must contain escape color code
	},
	["TEAMALIVE_HUD"]="Teammates alive:", --Shown on the main HUD at the left-bottom corder when you have teammates
	["MATCH_HUD"]="MATCH DUEL MODE", --Shown on the main HUD at the left-bottom cornder when the game is acting like MATCH
	["KILLBY_HUD"]="Killed by" --Shown on the main HUD when player is dead, shows the name of the killer
	-- Scores TAB text, you can place as many lines as you need here
	["HUD_SCORESTAB"]={
		"No scores here! Counters below may help",
		"If you're new to the gametype\nuse \x87MMHELP\x80 in the Console", --if texts are overlapping use multiple "\n" at the beginning
		"\n\x82Have Fun ;)" --if texts are overlapping use multiple "\n" at the beginning
	},
	-- Scores TAB role counters, you can place as many lines as you need here
	["HUD_ROLESALIVE"]={
		"\x85Murderers alive: ", --must contain escape color code AND space at the end, shown on SCORES TAB
		"\x84Sheriffs alive: ", --must contain escape color code AND space at the end, shown on SCORES TAB
		"\x83Innocents alive: " --must contain escape color code AND space at the end, shown on SCORES TAB
	},
	-- Centered text when you're dead, you can place as many lines as you need here
	["HUD_DEAD"]={
		"You are\x8F dead",
		"You can't respawn or talk to alives"
	},
	-- Centered text when you joined mid-round, you can place as many lines as you need here
	["HUD_MIDJOIN"]={
		"You joined \x84mid-round\x80, wait for the new round to play"
	},
	-- Centered text when you're alone, you can place as lines as you need here
	["HUD_ALONE"]={
		"\x84".."2 players\x80 are requiered for the game,",
		"please wait for \x84one more\x80 player to start"
	},
	-- Now for the win stuff
	["WINNERS_HUD"]="Winners: ", --must contain SPACE at the end, first part of the winners text on the Intermission
	-- Different endings to the "Winners" beginning
	["WIN_HUD"]={
		"TIE!", --one of the second parts
		"\x85MURDERERS", --must contain escape color code, one of the second parts
		"\x84SHERIFFS\x80 & \x83INNOCENTS" --must contain escape color code, one of the second parts
	},
	--CCMD.LUA (MMHELP command)
	["MMLANG"]={
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]", --when MMLANG is typed with no langauge specified.
		"Personal language for Murder Mystery is set to\x82 English" --when MMLANG is typed with language
	}
}
--finally import your language to the MM
-- There is already a function to add the language in the game
-- It has 2 arguments to pass
-- First argument is the language index string, it is usually 2 or 3 letters long and ALWAYS UPPERCASE
--  Do not make it like "MyLanguage" - use "ML" instead (or the official international index of your language)
-- Second argument is the Table Variable of the language itself
MurderMystery.AddLang("ML", language)
--if everything is done correctly you will recieve no errors when loading this file and in the gameplay process