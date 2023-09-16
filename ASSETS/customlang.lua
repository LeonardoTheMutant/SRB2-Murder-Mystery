-- SRB2 MURDER MYSTERY language file asset
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
	["VERSION"]="8.1-BETA", --This string HAVE TO MATCH the version string of the main file. This checks if the language is not OUTDATED.
	["AUTHOR"]="LeonardoTheMutant", --Who made this translation, you can leave it nil to be uncredited
	["NONASCII"]=false, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
	["MM"]="Murder Mystery", --The name of the Add-On (visible on SCORES TAB and Intermission)
	["MMHELP"]={ --MMHELP command's text
		["MAIN"]={ --When no page is specified
			"\x87        Welcome to the Murder Mystery!\nThe SRB2 interpretation of the popular multiplayer game",
			"\nThe game's goal is to find and eliminate all the \x85Murderers\x80 before they kill\x83 everyone else\x80. This gametype is more like MATCH so you'll your need your aiming and shooting skills for this game.",
			"You'll need some basics first to start playing....",
			"\nAt the beginning of each round you will recieve a \x8BRole\x80 that defines what are you going to do during the game. Here are all 3 possible \x8BRoles\x80 you might get:",
			" * \x85Murderer\x80 - true criminal. They have to kill everyone, but they're not allowed to pick up any weapon rings.",
			" * \x84Sheriff\x80  - their task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
			" * \x83Innocent\x80 - completely armless civilian, they must avoid being killed but also can help to find the \x85Murderer\x80.",
			"\nThat's all basic information requiered to start playing, for more information, you can use these commands:",
			"\x87MMHELP GAME\x80 - More about the game and gameplay situations;",
			"\x87MMHELP BAD\x80  - List of things that are forbidden to do in MM;",
			"\x87MMHELP CHAT\x80 - List of sound emojis that you can use in the chat;",
			"\x87MMHELP INFO\x80 - Technical information and \"What's new\";",
			"\x87MMLANG\x80      - Change the language of the content appearing in MM"
		},["GAME"]={ --MMHELP GAME
			"\x87".."About the gameplay situations",
			"As explained earlier in the basics the goal is to eliminate the \x85Murderer(s)\x80, but different gameplay situations may occur:",
			"\n* If you get killed, you'll enter the \x8F Dead\x80 state. Players with this state cannot respawn and talk globaly to players that are still alive, their messages are visible only to the other\x8F Dead\x80 players.",
			"You can't \x87SAYTO\x80/PM player who is still alive while you're\x8F Dead\x80.",
			"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this is in \x87MMHELP BAD\x80.",
			"\n* The \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but it is possible for them to shoot an \x83Innocent\x80 on accident.",
			"If this happens \x84Sheriff\x80 will turn into \x83Innocent\x80 and random \x83Innocent\x80 will sliently take his role. Next time you want to shoot somebody as \x84Sheriff\x80 think who you are going to kill!",
			"\n* When a \x85Murderer\x80 kills a \x84Sheriff\x80 and there are still \x83Innocents\x80 alive, the Sheriff will drop the \x84Sheriff's Emerald\x80 near their corpse.",
			"Unlike the 7 Chaos Emeralds, this emerald will assign the \x82Hero\x80 role to any \x83Innocent\x80 that picks it up. If you're one of the \x83Innocents\x80 it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
			"The \x82Hero\x80 role doesn't really differ from the \x84Sheriff\x80 except some details such as when the \x82Hero\x80 kills an \x83Innocent\x80 their role isn't shared and both just die. A Hero also will not drop a \x84Sheriff's Emerald\x80 on their death.",
			"\n* Depending on the players online count there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 among the players in the round. For example starting from 7 players and more \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
			"\x8BTeammates\x80 can chat with each other in their team chat with \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
			"If one \x8Bteammate\x80 will hit anoter both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!",
			"\nFor even more information, check out:",
			"\x87MMHELP BAD\x80  - Things you shouldn't do in MM game",
			"\x87MMHELP CHAT\x80 - What are Sound Emojis and how to use them"
		},["BAD"]={ --MMHELP BAD
			"\x87Things that are bad to do in Murder Mystery",
			"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
			"* Self-spoiling of the \x8BRole\x80 will not make the game \'Mystery\', you can tell someone other's role if you definetly know who he is but never tell your own.",
			"* Do not insult other players, jokes are allowed but in friendly mood. No one will trust you if you are will accuse every player with no reason.",
			"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
			"* Do not rename yourself during a round. The game will close your SRB2 window. This made to prevent cheating. Just wait for the intermission to rename safely.",
			"Breaking one of these rules may result a kick or in some cases ban from the Admin, please do not break them and play fairly.",
			"\nMore help pages that you might want to read at your console:",
			"\x87MMHELP GAME\x80 - About gameplay situations",
			"\x87MMHELP CHAT\x80 - List of Sound Emojis and their usage"
		},["CHAT"]={ --MMHELP CHAT
			"\x87How to use Sound Emojis\x80",
			"When a player sends a message that contains specific words/phrases, a sound will be played.",
			"Basically when you send the \"bruh\" message and everyone will hear the BRUH sound",
			"Here is the full list of Sound Emojis and how to activate each of them:\n",
			"  \x88Keyword\x80       | \x89Sound",
			" ---------------+-----------------------------",
			"  :skull:       | \"Bad to the Bones\"",
			"  :fart:        | Fart sound",
			"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
			"  :wow:         | Anime-like \"WOW!\"",
			"  hehe          | DOOMGUY chuckle",
			"  \\:|           | Vine boom (Rock-eyebrow)",
			"  bruh          | bruh",
			"  /:|           | Vine boom (Rock-eyebrow)",
			"  AMONGUS       | \"*AMONG US*\"",
			"  AMONG US      | \"*AMONG US*\"",
			"  sus           | SUS",
			"  oh no         | Knuckles' \'OH NO\'",
			"  AGHH          | Eggman's \'AGHHHH!\'",
			"  AHH           | Eggman's \'AGHHHH!\'",
			"  AHA           | Eggman's \'AHA!\'",
			"  NO WAY        | Eggman's \'NO WAY!\'",
			"  NOPE          | Nope.",
			"  GET OVER HERE | \"GET OVER HERE!\"",
			"  NOO           | \"NOOOOOOoooooo...\"",
			"  HELP          | Tyler1's \"HELP!\"",
			"  HEHEHE HA     | Clash Royal King's laugh",
			"  HEHE BOI      | \"Hehe boi...\"",
			" ---------------+-----------------------------",
			"More help:",
			"\x87MMHELP GAME\x80 - More about the game and gameplay situations",
			"\x87MMHELP BAD\x80  - Things that are forbidden to do in MM"
		}
	}, --That's all for the MMHELP
	-- "You got the role" at the beginning of each round
	["ROLE_GET"]={
		"You're the \x85Murderer\x80! \x85Murder everyone.", --Murderer
		"You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. Be careful before killing, or you risk your role.", --Sheriff
		"You're an \x83Innocent\x80! Hide and help the with the investigation." --Innocent
	},
	-- Text when someone left or died in midgame and you was lucky enough to get their role
	["NEWROLE_GET"]={
		"\x87Life randomly decided you shall be \x85Murderer\x87.\x85 Go nuts!", --Murderer
		"\x87Universe felt like making you a \x84Sheriff\x87! Uh, I guess go \x84 eliminate all Murderers\x87!\x80, or, something.", --Sheriff
		"\x87I hope it's not a bug in the system that gave you the \x82Hero\x87 role, or we're all screwed." --Hero
	},
	-- Teammate hit, if you accidentaly hit your teammate both of you will get the notice
	["TEAMMATE_HIT"]={
		"Don't hit teammates. You don't wanna be THAT guy.", --for the guy who attacked
		"THAT guy (Teammate) just hit you, just ignore them, it ain't worth it." --for the victim
	},
	-- Murderer killed annouce
	["MURD_KILLED"]={
		"\x85Murderer\x87", --beginning of the string
		"\x80got eliminated" --ending
	},
	-- Sheriff killed announce
	["SHERI_KILLED"]={
		"\x84Sheriff\x87",
		"\x80got murdered! Try to find their\x84 Emerald\x80!", --ending 1 (Regular death)
		"\x80got murdered!" --ending 2 (Didn't drop the emerald)
	},
	-- Hero killed announce
	["HERO_KILLED"]={
		"\x82Hero\x87", --beginning
		"\x80got murdered!" --ending
	},
	["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...", --Global notice when Innocent picked up the Sheriff's Emerald
	-- Innocent hurt series of messages (Private messages)
	["INNO_HURT_PM"]={
		"\x87You murdered an \x83Innocent\x87! You got fired.", --When Sheriff kills Innocent
		"\x87Last I checked, \x82Heroes\x80 aren't meant to kill \x83Innocents\x80. As per policy, you must be\x85 executed" --When Hero kills Innocent
	},
	-- Innocent hurt series of messages (Global messages)
	["INNO_HURT"]={
		"\x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job.", --Sheriff killed Innocent
			"\x82Hero\x80 is dumbass, they killed an \x83Innocent\x80. Now both are lying dead. Shame on\x82 Dumbass\x80" --Hero killed Innocent, what a monster! (I dramatized here)
	},
	-- "One of the players with [role] left the game!"
	["ONE_LEFT"]={
		"One of the \x85Murderers\x80 left!", --Murderer
		"One of the \x84Sheriffs\x80 left!!!", --Sheriff
		"One of the \x82Heros\x80 left us!" --Hero
	},
	-- "Last player with [role] left the game!"
	["LAST_LEFT"]={
		"Last \x85Murderer\x80 left!", --Murderer
		"Last \x84Sheriff\x80 left!", --Sheriff
		"Last \x82Hero\x80 left!" --Hero
	},
	-- "Player with [role] left the game, some Innocent recieved his role!"
	["REPLACE_LEFT"]={
		"\x85Murderer\x80 left! Some \x83Innocent\x80 took their role!", --Murderer
		"\x84Sheriff\x80 left! Some \x83Innocent\x80 took their role!", --Sheriff
		"\x82Hero\x80 left! Some \x83Innocent\x80 took their role!" --Hero
	},
	-- Global chat end round messages
	["ENDROUND"]={
		"GGs, everyone's dead. The \x85Murderers\x80 win!", --Murderers killed everyone (regular win)
		"GG! All of the \x85Murderers\x80 got killed!,The \x83 Civilians\x80 win!", --Sheriffs, Innocents (and Heros) eliminted all Murderers (regular win)
		"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent! Shame on \x84Sheriff\x80", --Sheriff killed the last Innocent
		"The \x82Hero\x80 chose to kill the last Innocent. The \x85Murderers\x80 Win!", --Hero killed the last Innocent
		"The Defenders of the\x83 Innocents\x80 are dead. The \x85Murderers\x80 win!" --Murderers killed all Sheriffs and Heros, but not Innocents (Murderers win)
	},
	-- Special PM notifications
	["CHAT"]={
		"is alive, message not sent", --When DEAD player attempts to PM the ALIVE player (shown in console)
		"You're sending too many messages, please wait", --PM when player sends too much messages in one period (shown in console)
		"You can't just \x8F die\x80 to spectate!" --Trying to use "SPECTATE" button from pause menu (shown in chat)
	},
	-- Role names (shown on HUD)
	["ROLES_HUD"]={
		"Murderer", --Murderer
		"Sheriff", --Sheriff
		"Innocent", --Innocent
		"Hero", --Hero
		"Dead" --Dead
	},
	["TEAMALIVE_HUD"]="Teammates alive:", --Teammates alive counter shown on SCORES TAB
	["KILLBY_HUD"]="Killed by", --Visible for DEAD players to see who killed them
	["STUPID"]="your stupidity" -- :skull: (visible as "Killed by" for the Hero who killed an Innocent)
	-- Scores TAB screen text, here you can place as many lines as you need, each string is interpreted as a row
	["HUD_SCORESTAB"]={
		"No scores here! Counters below may help",
		"If you're new to the gametype\nuse \x87MMHELP\x80 in the Console",
		"\n\x82Have Fun ;)"
	},
	-- Scores TAB screen role conters
	["HUD_ROLESALIVE"]={
		"Murderers alive:", --Murderer
		"Sheriffs alive:", --Sheriff
		"Innocents alive:" --Innocent
	}, --Hero is shown as a yellow plus near the Sheriffs"
	-- Centered text when you're dead, each string is interpreted as a row
	["HUD_DEAD"]={
		"You are\x8F dead",
		"You can't respawn or talk to alives"
	},
	-- Centered text when you joined, each string is a row
	["HUD_MIDJOIN"]={
		"You joined \x84mid-round\x80, please wait for the round to finish."
	},
	-- Centered text when you are alone, each string is a row
	["HUD_ALONE"]={
		"\x84".."2 players\x80 are requiered for the game,",
		"please wait for \x84one more\x80 player to start"
	},
	-- Winner parts of text for intermission
	["WINNERS_HUD"]="Winners:", --beginning
	["WIN_HUD"]={ --different endings
		"TIE!", --Tie
		"\x85MURDERERS", --Murderers (must contain escape color code)
		"\x83".."CIVILIANS" --Sheriffs, Innocents and Heros (must contain escape color code)
	},
	--MMLANG command
	["MMLANG"]={
		"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]", --when no language is specified
		"Personal language for Murder Mystery is set to\x82 English" --when the language is specified and applied
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
--In case this language is going to be posted on SRB2 Message Board please rename this file like:
-- MML_[full_lang_name]_v[MM_version].lua