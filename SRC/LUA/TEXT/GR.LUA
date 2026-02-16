-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- GREEK
-- Made by tedbasher

MM.AddLang("GR", {
	["LANGUAGE"]="Greek",
	["VERSION"]="1.3_OLD",
	["AUTHOR"]="tedbasher",
	["CHAT_ROLE_MURDERER"]={
		["ROLEGET_PM"]="Είσαι ο ^5Δολοφόνος^0. ^5Σκότωσε τους όλους.",
		["NEWROLEGET_PM"]="^7Η ζωή τυχαία διάλεξε να γίνεις ^5Δολοφόνος^7. ^5Τώρα τράβα σκότωσε τους όλους.",
		["KILLED"]={
			"Ο Δολοφόνος",
			"μόλις πέθανε!"
		},
		["ONEQUIT"]="Ένας απ' τους ^5Δολοφόνους^0 βγήκε!",
		["LASTQUIT"]="Ο τελευταίος ^5Δολοφόνος^0 βγήκε!",
		["REPLACEQUIT"]="Ο ^5Δολοφόνος^0 βγήκε! Ένας τυχαίος ^3Πολίτης^0 θα πάρει τον ρόλο του!"
	},
	["CHAT_ROLE_SHERIFF"]={
		["ROLEGET_PM"]="Είσαι ο ^4Σερίφης^0! ^4΄Σκότωσε όλους τους Δολοφόνους^0. Τόλμα να σκότωσεις το ^3λάθος άτομο^0, και χάνεις τον ρόλο σου.",
		["NEWROLEGET_PM"]="^7Το σύμπαν σε έκανε ^4Σερίφη^7! Τώρα τράβα ^4σκότωσε τους Δολοφόνους^7!",
		["KILLED"]={
			"Ο Σερίφης",
			"μόλις πέθανε!",
			"Βρές το ^4Σμαράγδι^0 του!"
		},
		["ONEQUIT"]="Ένας από τους ^4Σερίφηδες^0 βγήκε!!!",
		["LASTQUIT"]="Ο τελευταίος ^4Σερίφης^0 βγήκε!",
		["REPLACEQUIT"]="Ο ^4Σερίφης^0 βγήκε! Ένας τυχαίος ^3Πολίτης^0 θα πάρει τον ρόλο του"
	},
	["CHAT_ROLE_CIVILIAN"]={
		["ROLEGET_PM"]="Είσαι ένας ^3Πολίτης^0! Κρύψου και βοήθα με την έρευνα."
	},
	["CHAT_ROLE_HERO"]={
		["NEWROLEGET_PM"]="^7Αποφασίσθηκε πως θα είσαι ένας ^2Ήρωας^7. Σώσε τους πάντες από τους Δολοφόνους!",
		["RANKUP_PM"]="^7Σκότωσες έναν ^5Δολοφόνο^7! Κέρδισες την τιμή του ^2Ήρωα^7!",
		["KILLED"]={
			"Ο Ήρωας",
			"μόλις πέθανε!"
		},
		["ONEQUIT"]="Ένας από τους ^2Ήρωες^0 βγήκε!",
		["LASTQUIT"]="Ο τελευταίος ^2Ήρωας^0 μας παράτησε όλους!",
		["REPLACEQUIT"]="Ένας ^2Ήρωας^0 βγήκε! Ένας τυχαίος ^3Πολίτης^0 θα πάρει τον ρόλο του"
	},
	["CHAT_ROLE_JESTER"]={
		["ROLEGET_PM"]="Είσαι ο ^1Γελωτοποιός^0. Κοροίδεψε όλους πως είσαι ένας ^5Δολοφόνος^0"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Πρόσεχε!! Είναι συμπαίκτης σου. Μην πυροβολάς όπου βρείς.",
		"Ένας συμπαίκτης καταλάθος σε πέτυχε. ΔΕΝ συνιστάται η εκδίκηση."
	},
	["CHAT_DIEDHAZARD"]="πέθανε σε ατύχημα. Κρίμα.",
	["CHAT_SHREMDPICKUP"]="Κάποιος πήρε το ^4Σμαράγδι του Σερίφη^0...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"^7Σκότωσες έναν ^3Πολίτη^7! Απολύεσαι. (Δεν είσαι πια Σερίφης)",
		"^7Οι ^2Ήρωες^7 δεν έχουν σκόπο την δολοφονία των ^3Πολίτων^7! ^5Εκτελέστικες^7 για το πολεμικό εγκλήμα σου.",
		"^7Ωχ όχι! Δολοφόνισες έναν ^4Σερίφη^7!!! ^5Εκτελέστικες^7 για αυτό.",
		"^7Σκότωσες έναν ^3Πολίτη^7 σαν κι εσλενα!!  ^5Εκτελέστικες^7 για το έγκλημα σου.",
		"^7Ωχ όχι! Δολοφόνισες έναν ^2Ήρωα^7!!! ^5Εκτελέστικες^7 για αυτό."
	},
	["CHAT_CIVILIANHURT"]={
		"Ένας ^4Σερίφης^0 σκότωσε έναν ^3Πολίτη^0! Κάποιος άλλος ας τελείωσει την δουλεία.",
		"Σκοτώντας έναν ^3Πολίτη^0, ο ^2Ήρωας^0 έγινε ο ^5κακός^0 και πλήρωσε την τιμή."
	},
	["CHAT_ENDROUND"]={
		"Όλοι έχουν πεθάνει. Οι ^5Δολοφόνοι^0 νίκησαν!",
		"Όλοι οι ^5Δολοφόνοι^0 σκοτώθηκαν! Οι ^3Πολίτες^0 νίκησαν!",
		"Οι ^5Δολοφόνοι^0 νίκησαν επειδή ο ^4Σερίφης^0 δολοφόνησε τον τελευταίο ^3Πολίτη^0 Ντρόπια στον ^4Σερίφη^0...",
		"Οι ^5Δολοφόνοι^0 νίκησαν επειδή ο ^2Ήρωας^0 διάλεξε να σκοτώσει τον τελευταίο Πολίτη. Ντρόπια στον ^2Ηρώα^0...",
		"Οι Προστάτες των ^3Πολίτων^0 πέθαναν. Οι ^5Δολοφόνοι^0 νίκησαν!",
		"Ο ^1Γελωτοποιός^0 σκοτώθηκε από Τους Καλούς. Κακό το χαρτοπαίγνιο παιδία."
	},
	["HUD_MM"]="Murder Mystery",
	["HUD_SUSPECTS"]="Ύποπτοι",
	["HUD_VICTIMS"]="Θύματα",
	["HUD_TEAMMATES"]="Συμπάικτες",
	["HUD_ROLES"]={
		["MURDERER"]="ΔΟΛΟΦΟΝΟΣ",
		["SHERIFF"]="ΣΕΡΙΦΗΣ",
		["CIVILIAN"]="ΠΟΛΙΤΗΣ",
		["HERO"]="ΗΡΩΑΣ",
		["JESTER"]="ΓΕΛΩΤΟΠΟΙΟΣ",
		["DEAD"]="ΝΕΚΡΟΣ"
	},
	["HUD_KILLEDBY"]={
		"Δολοφονημένος από τον/η ",
		"δικαοσύνη",
		"τον σχεδιασμό της πίστας"
	},
	["HUD_SCORESTAB"]="Έαν είσαι καινούργιος στο παιχνίδι, χρησιμοποίησε την εντολή ^7MMHELP^0 για βοήθεια και ^7MMLANG^0 να άλλαξεις την Γλώσσα.\n\n^Καλή διασκέδαση!",
	["HUD_ROLETARGET"]={
		["MURDERER"]="Εναρμονίσου, χτίσε πίστη, και τότε σκότωσε.",
		["SHERIFF"]="Βρες και σκότωσε όλους τους Δολοφόνους, μα όχι τους Πολίτες!",
		["CIVILIAN"]="Κρύψου και προστατέψου. Βοήθησε την ερεύνα όσο μπορείς.",
		["HERO"]="Έχεις την ευκαιρία να σταματήσεις όλους τους Δολοφόνους. Προσεκτικά, τράβα βοήθα!",
		["JESTER"]="Κάνε όλους να πιστέψουν πως Είσαι Ο Κακός. Τα Weapon Rings σου δεν πληγώνουν κανέναν, χώρις το Σμαράγδι"
	},
	["HUD_ROLESALIVE"]={
		"Δολοφόνοι",
		"Σερίφηδες",
		"Πολίτες"
	},
	["HUD_DEAD"]="Είσαι ^Fνεκρός^0.\nΔεν μπορείς να ξανά μπεις η να μιλήσες με ζώντανα άτομα.",
	["HUD_MIDJOIN"]="Μπήκες ^4εν-ώρα-γύρου^0, περίμενε ώστε να τελειώσει ο γύρος.\nΌσο περιμένεις, μπορείς να διαβάσεις τους κανόνες με την εντολή ^7MMHELP^0",
	["HUD_ALONE"]="^0Το παιχνίδι χρειάζεται ^42 παίκτες^0,\nΠεριμένε για ^4έναν ακομή^0 παικτή ώστε να αρχίσει το παιχνίδι.",
	["HUD_SNEAKING"]="Περπατώντας αργά και σιγά...",
	["HUD_SHOWDOWN"]="Μονομαχία Αναμέτρησης!",
	["HUD_MINIGAME"]={
		["PRESS"]="Πάτα ^2CUSTOM3^0 για",
		["LEAVE"]="να βγείς",
		["CANCEL"]="ακύρωση",
		["SPECTATE"]="να παρακολουθήσεις",
		["DUEL"]="μια minigame μονομαχία",
		["REQUEST"]="να ζητήσεις ένα minigame ^7PONG^0!",
		["START"]="να αρχίσεις ένα minigame ^7\"SONIC RUN\"^0!",
		["ACCEPT"]="δεκτείς την πρόκληση ^7PONG^0!",
		["WAIT"]="Περιμένοντας τον Αντίπαλο να δεχτεί...",
		["SPECTATING"]="Παρακολουθώντας μια μονομαχία...",
		["BORED"]="Βαριέσαι?",
		["GOAL"]="Γκολ!"
	},
	["HUD_YOU"]="ΕΣΥ",
	["HUD_WINNERS"]="Νικητές:",
	["HUD_WIN"]={
		["TIE"]="ΙΣΟΠΑΛΙΑ!",
		["BAD"]="^5ΔΟΛΟΦΟΝΟΙ",
		["GOOD"]="^3ΠΟΛΙΤΕΣ",
		["JESTER"]="^1ΓΕΛΩΤΟΠΟΙΟΣ"
	},
	["HUD_PAST"]="ΠΑΡΕΛΘΟΝ",
	["HUD_FUTURE"]="ΜΕΛΟΝ",
	["HUD_MMHELP_UI"]={
		"Use ^7UP^0/^7DOWN^0 to scroll, ^7LEFT^0/^7RIGHT^0 to switch pages",
		"Press any ^7CUSTOM^0 button to leave HELP"
	},
	["HUD_MMHELP"]={
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
	["IMG_VICTIMS"] = {palette={{73,31},{37,31}},image={
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
	}},
	["IMG_SUSPECTS"] = {palette={{73,31},{37,31}},image={
		" 00001  001 001  00001  000001  0000001  00001  0000001  00001",
		"0000001 001 001 0000001 0000001 0000001 0000001 0000001 0000001",
		"0011001 001 001 0011001 0011001 0011111 0011001 1100111 0011001",
		"000111  001 001 000111  001 001 001     001 001   001   000111",
		"10001   001 001 10001   0000001 0000001 001 111   001   10001",
		" 10001  001 001  10001  0000011 0000001 001       001    10001",
		"  10001 001 001   10001 00111   0011111 001 001   001     10001",
		"001 001 001 001 0011001 001     001     001 001   001   0011001",
		"0000001 0000001 0000001 001     0000001 0000001   001   0000001",
		"100001  100001  100001  001     0000001 100001    001   100001",
		" 1111    1111    1111   111     1111111  1111     111    1111"
	}},
	["IMG_TIME"] = {palette={{73,31},{37,31}},image = {
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
	}},
	["IMG_RINGS"]={palette={{73,31},{37,31}},image={
		"000001   001  001   001  00001   00001",
		"0000001  001  001   001 0000001 0000001",
		"0011001  001  000   001 0011001 0011001",
		"001 001  001  0000  001 001 001 000111",
		"0000011  001  00000 001 001 111 10001",
		"000001   001  001000001 0010001  10001",
		"001 001  001  001100001 0010001   10001",
		"001 001  001  001 10001 001 001 0011001",
		"001 001  001  001  1001 0000001 0000001",
		"001 001  001  001   001  00001   00001",
		"111 111  111  111   111  1111    1111"
	}}
})
