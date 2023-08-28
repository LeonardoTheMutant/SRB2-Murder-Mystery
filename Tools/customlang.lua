-- SRB2 MURDER MYSTERY language file
-- THIS FILE MUST BE LOADED AFTER MAIN MM .PK3
--
-- You can use this file as a template to add your own language to MM,
-- Please read the everything carefully for everything to work properly
--
-- DEVELOPER NOTE:
--   As of 8.0-BETA custom language files cannot include text for MMHELP. This command will display ENGLISH text
--   as a fallback instead. I hope I can fix this in the next update.
--
-- NOTES BEFORE YOU START:
-- To color the text with ESCAPE COLOR CODES you have to type "\###" OR "\x##" at any place in a string
-- ### is an INT value in the first, ## is a HEX value in the second
-- I will explain everthing with the HEX color codes
--
-- Escape Color Codes will paint the string FROM where they are TO the end of the string (or the other color code).
-- Sounds strange? Well you'll get it better with this example:
--
-- "\x85Hello \x83world!"
--
-- HELLO will appear in red color and WORLD! will appear in green. Still don't get it? Damn, go read https://wiki.srb2.org/wiki/Lua it explains much better
-- So if you get this now I will tell about another imporant Escape Character
-- I am talking about "\n" - this thing will wrap your string to another line
-- EXAMPLE:
--
-- "A string\nof text" will make your string look like:
--
--   A string
--   of text
--
-- Get it? That's great, now you can actully do the translation

local language={ --Language must be a table variable, you can name the variable as you like
	["VERSION"]="8.0-BETA", --this line must be AS SAME AS add-on version CAPITALISED, otherwise it will be marked as OUTDATED and will result crashes
	["AUTHOR"]=nil, --who made the translation file (must be string), leave it to nil if you want to be uncredited
	["DEADSTRNUM"]=2, --how much lines of "You're dead", this is to index DEADx that is defined below.
	["MIDJOINSTRNUM"]=1, --lines of "Joined mid-round" for MIDJOINx
	["ALONESTRNUM"]=2, --lines of "Wait for one more plr" for ALONEx
	["SCORESSTRNUM"]=3, --lines of SCORES TAB for SCORESx_HUD
	["MM"]="Murder Mystery", --name of the gametype, shown on Intermission screen and SCORES TAB
	--GAME.LUA
	--"You got the role" messages at the beginning of the round
	["R1_GET"]="You're the \x85Murderer\x80! \x85Murder everyone.",
	["R2_GET"]="You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. If you kill an Innocent, you lose.",
	["R3_GET"]="You're an \x83Innocent\x80! Hide and help the sheriff find the murderer.",
	-- setRandomPlayerAs(), messages that are printed personaly to the 'lucky players'
	["NewMurderer"]="\x87Life made a \x85Murderer\x87 from you, \x85now go kill everyone.",
	["NewSheriff"]="\x87The Universe made you the new \x84Sheriff\x87! It's now your job to\x84 eliminate all Murderers\x87!",
	-- Teammates hit
	["HitTeammate_atacker"]="\x85Hey, this guy is your teammate, don't try to kill him again", --for Attacker if he hit a teammate
	["HitTeammate_victim"]="\x85Your teammate hit you, don't get mad on him", --for Victim who was damaged by Attacker teammate
	-- Murderer hit/killed
	["MurdersWin"]="Everyone are murdered, \x85Murderers\x80 win!", --Guess this needs no explanation
	["MurdererKilled_str"]="\x85Murderer\x87 ", --must contain SPACE at the end, a player name and second part are added here
	["MurdererKilled_end"]="\x80 was eliminated!", --second part
	-- Sheriff hit/killed
	["SheriffsWin"]="All murderers eliminated, \x84Sheriffs\x80 & all \x83Innocents\x80 win!", --no comments
	["SheriffKilled_str"]="\x84Sheriff\x87 ", --must contain SPACE at the end, a player name and second part are added
	["SheriffKilled_end"]="\x80 was murdered! \x83Innocents\x80 can pick up his Emerald to finish the job!", --second part
	["SheriffKilledNoDrop_end"]="\x80 was murdered!", --second part, except when emerald doesn't drop from Sheriff
	["SheriffDropPicked"]="Some Innocent picked up \x84Sheriff's Emerald\x80...", --Pickup message
	-- Innocent hurt/left
	["SheriffKillInnoPM"]="\x87You murdered the \x83Innocent\x87! You are no longer a \x84Sheriff\x87!", --Personal message for awful Sheriff
	["SheriffKillInno"]="\x84Sheriff\x80 murdered the Innocent! Someone other from \x83Innocents\x80 will have to finish his job!", --Global message for everyone about Sheriff's war crime
	["MurdersWinNoInnos"]="\x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent!", --sussy win moment, when Sheriff kills last Inno
	["LastInnoLeft"]="Last \x83Innocent\x80 left!", --Last Inno left
	-- Murderer left
	["LastMurdLeft"]="Last \x85Murderer\x80 left!", --Last Murd left
	["MurdLeftReplace"]="\x85Murderer\x80 left! Someone from \x83Innocents\x80 took his role!", --Murd left but a replacement found
	["OneMurdLeft"]="One of the \x85Murderers\x80 left!", --Murd left
	-- Sheriff left
	["LastSheriffLeft"]="Last \x84Sheriff\x80 left!", --Last Sheri left
	["SheriffLeftReplace"]="\x84Sheriff\x80 left! Someone from \x83Innocents\x80 took his role!", --Sheri left but a replacement found
	["OneSheriffLeft"]="One of the \x84Sheriffs\x80 left!", --Sheri left
	-- "You can't become spectator"
	["TeamSwitch"]="You can't just become\x8F dead\x80 to spectate!", --when players try to use SPECTATE from pause menu
	--CHAT.LUA
	["MsgNotSent"]="is alive, message not sent", --When dead player tries to PM alive player
	["MsgDelay"]="You're sending too much messages, please wait", --Chat delay msg
	--HUD.LUA
	["R1_HUD"]="\x85MURDERER", --must contain escape color code, this and 3 following are shown in main HUD under RINGS
	["R2_HUD"]="\x84SHERIFF", --must contain escape color code
	["R3_HUD"]="\x83INNOCENT", --must contain escape color code
	["DD_HUD"]="\x8F".."DEAD", --must contain escape color code
	["TeamLeft_HUD"]="Teammates alive: ", --Shown on main HUD at the left-bottom cornder when you have teammates
	["MATCH_HUD"]="MATCH DUEL MODE", --Shown on main HUD at the left-bottom cornder when the game is acting like MATCH
	["KILLBY_HUD"]="Killed by ", --Shown on main HUD when player is dead, shows the name of the killer
	--IMPORTANT HERE!
	-- The following __three__ lines are shown on SCORES TAB, you must set the "SCORESSTRNUM" to the number of lines used on this screen.
	-- If it is incorrect game will crash or don't draw some lines at all, in this example only 3 lines are used
	["SCORES1_HUD"]="No scores here! Counters below may help",
	["SCORES2_HUD"]="If you're new to the gametype\nuse \x87MMHELP\x80 in the Console", --if texts are overlapping use multiple "\n" at the beginning
	["SCORES3_HUD"]="\n\x82Have Fun ;)", --if texts are overlapping use multiple "\n" at the beginning
	--["SCORES4_HUD"]="" -- uncomment this if your SCORESSTRNUM is 4
	["NOPLRS_HUD"]="\x81Not enough players to start MM game,\n(at least 3 requiered) playing in\nMatch Duel Mode instead", --Shown on SCORES TAB when the game acts like MATCH
	["SCORESR1_HUD"]="\x85Murderers alive: ", --must contain escape color code AND space at the end, shown on SCORES TAB
	["SCORESR2_HUD"]="\x84Sheriffs alive: ", --must contain escape color code AND space at the end, shown on SCORES TAB
	["SCORESR3_HUD"]="\x83Innocents alive: ", --must contain escape color code AND space at the end, shown on SCORES TAB
	--IMPORTANT HERE!
	-- The following __two__ lines are shown on your screen when you're dead, you must set the "DEADSTRNUM" to the number of lines used on this screen.
	-- If it is incorrect game will crash or don't draw some lines at all, in this example only 2 lines are used
	["DEAD1"]="You are\x8F dead",
	["DEAD2"]="You can't respawn or talk to alives",
	--["DEAD3"]="" -- uncomment this if your DEADSTRNUM is 3
	--IMPORTANT HERE!
	-- The following __one__ line is shown on your screen when you have joined in MID-ROUND, you must set the "MIDJOINSTRNUM" to the number of lines used on this screen.
	-- If it is incorrect game will crash or don't draw some lines at all, in this example only 1 line is used
	["MIDJOIN1"]="You joined \x84mid-round\x80, wait for the new round to play",
	--["MIDJOIN2"]="" -- uncomment this if your MIDJOINSTRNUM is 2
	--IMPORTANT HERE!
	-- The following __two__ lines are shown on your screen when you're dead, you must set the "ALONESTRNUM" to the number of lines used on this screen.
	-- If it is incorrect game will crash or don't draw some lines at all, in this example only 2 lines are used
	["ALONE1"]="\x84".."2 players\x80 are requiered for the game,",
	["ALONE2"]="please wait for \x84one more\x80 player to start",
	--["ALONE3"]="" -- uncomment this if your ALONESTRNUM is 3
	["WINNERS_HUD"]="Winners: ", --must contain SPACE at the end, first part of the winners text on intermission
	["WIN0_HUD"]="TIE!", --one of the second parts
	["WIN1_HUD"]="\x85MURDERERS", --must contain escape color code, one of the second parts
	["WIN2_HUD"]="\x84SHERIFFS\x80 & \x83INNOCENTS", --must contain escape color code, one of the second parts
	--COMMAND.LUA (MMLANG part)
	["CurrentLang"]="Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]", --when MMLANG is typed with no langauge specified.
	["LangSet"]="Personal language for Murder Mystery is set to\x82 English" --when MMLANG is typed with language
}
--finally import your language into the MM
-- First argument is the language index, it is usually 2 or 3 letters long and UPPERCASE
--  Do not make it like "MyNativeLang" - do "MNL" instead (or official international index)
-- Second argument is the Table Variable of the language itself
MurderMystery.AddLang("EN",language)
--if everything is done correctly you will recieve no errors when loading this file and in the gameplay process
--
--I hope I made your day
--Tutorial by LeonardoTheMutant