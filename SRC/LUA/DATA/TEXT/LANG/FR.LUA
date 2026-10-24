MM.AddLang("FR", {
	["LANGUAGE"] = "Francais",
	["VERSION"] = "1.3",
	["AUTHOR"] = "SuperGuide",
	["CHAT_ROLE_MURDERER"] = {
		["ROLEGET_PM"] = "Vous etes le ^5Meurtrier^0! ^5tuer tout le monde!",
		["NEWROLEGET_PM"] = "^7La vie a decider que vous serez un ^5Meurtrier^7. ^5Maintenant tuer tout le monde!",
		["KILLED"] = {
			"Le Meurtrier",
			"est mort!"
		},
		["ONEQUIT"] = "L'un des ^5Meurtriers^0 a quitter!",
		["LASTQUIT"] = "Le dernier ^5Meurtrier^0 a quitter!",
		["REPLACEQUIT"] = "Le^5Meurtrier^0 a quitter! Un ^3Innocent^0 Aleatoire va prendre ca place!"
	},
	["CHAT_ROLE_SHERIFF"] = {
		["ROLEGET_PM"] = "Vous etes le ^4Sherif^0! ^4Eliminer tout les Meurtriers^0. Si vous tuer un innocent, vous perdrer votre role.",
		["NEWROLEGET_PM"] = "^7L'univers vous a rendu en ^4Sherif^7! Allez ^4tuer tout Meurtriers^7!",
		["KILLED"] = {
			"Un sherif",
			"est mort!",
			"Trouver son ^4Emerald^0!"
		},
		["ONEQUIT"] = "L'un des ^4Sherifs^0 a quitter!!!",
		["LASTQUIT"] = "Le dernier ^4Sherif^0 a quitter!",
		["REPLACEQUIT"] = "le ^4Sherif^0 a quitter! Un ^3Innocent^0 Aleatoire va prendre ca place!"
	},
	["CHAT_ROLE_CIVILIAN"] = {
		["ROLEGET_PM"] = "Vous etes ^3Innocent^0! Cacher vous et aider avec l'investigation."
	},
	["CHAT_ROLE_HERO"] = {
		["NEWROLEGET_PM"] = "^7Il a ete decider que vous serez un ^2Hero^7. Sauver tout le mondes des Meurtriers!",
		["RANKUP_PM"] = "^7Vous avez eliminer l'un des ^5Meurtriers^7! Vous avez recu l'honneur d'etre un ^2Hero^7!",
		["KILLED"] = {
			"Un Hero",
			"Est mort!"
		},
		["ONEQUIT"] = "L'un des ^2Heroes^0 a quitter!",
		["LASTQUIT"] = "Le dernier ^2Hero^0 a abandonner tout le monde!",
		["REPLACEQUIT"] = "Un ^2Hero^0 a quitter! Un ^3Innocent^0 Aleatoire va prendre ca place!"
	},
	["CHAT_ROLE_JESTER"] = {
		["ROLEGET_PM"] = "Vous etes le ^1Fou^0. Faite semblant d'etre un ^5Meurtrier^0."
	},
	["CHAT_TEAMMATEHIT_PM"] = {
		"Ce joueur est vous Allie. Ne l'attaquer pas une autre fois.",
		"Un Allie vous a attaquer. Ne vous venger pas sur eux."
	},
	["CHAT_DIEDHAZARD"] = "Est mort d'un accident, aie.",
	["CHAT_SHREMDPICKUP"] = "Quelqu'un a pris la ^4Sherif Emerald^0...",
	["CHAT_GOTPLUSHIE"] = "Peluche trouver!",
	["CHAT_KILLPUNISHMENT_PM"] = {
		"^7Vous avez tuer un ^3Innocent^7! vous avez ete executer pour ce crime",
		"Les ^2Heros^7 ne doivent pas tuer les ^3Innocents^7. Vous avez la penaliter de morts pour ca.",
		"^7Oh non! Tu as assassine un ^4Sherif^7!!! Tu as ete condamne a mort pour ca",
		"^7Vous avez assassine un joueur ^3Innocent^7 comme vous! Vous avez ecope de la peine de mort pour cela",
		"^7Oh non! Tu as assassine un ^2Hero^7! Tu as ecope de la peine de mort pour ca"
	},
	["CHAT_CIVILIANHURT"] = {
		"Le ^4Sheriff^0 a tuer ^3Innocent^0! Quelqu'un d'autre dois finir le travail!",
		"Le ^2Hero^0 est devenu un villain et a tuer un ^3Innocent^0. Maintenant les deux sont morts. faute a toi ^2\"Hero\"'^0"
	},
	["CHAT_ENDROUND"] = {
		"Tout le mondes est mort. Les ^5Meurtriers^0 gagnent!",
		"Tout les ^5Meurtriers^0 sont morts! Les ^3Civils^0 gagnent!",
		"Les ^5Meurtriers^0 ont gagner car le ^4Sheriff^0 a tuer le dernier Innocent ! Faute au ^4Sheriff^0...",
		"Le ^2Hero^0 a choisis de tuer le dernier Innocent. Les ^5Meurtriers^0 gagnent!",
		"Les protecteurs des ^3Innocents^0 sont morts. Les ^5Meurtriers^0 gagnent!",
		"Le ^1Fou^0 a ete tuer pas les gentils. Vous etes le 1% des parieurs gamins."
	},
	["HUD_MM"] = "Murder Mystery",
	["HUD_SUSPECTS"] = "Suspects",
	["HUD_VICTIMS"] = "Victimes",
	["HUD_TEAMMATES"] = "Alliers",
	["HUD_ROLES"] = {
		["MURDERER"] = "MEURTRIER",
		["SHERIFF"] = "SHERIF",
		["CIVILIAN"] = "INNOCENT",
		["HERO"] = "HERO",
		["JESTER"] = "FOU",
		["DEAD"] = "DEAD"
	},
	["HUD_KILLEDBY"] = {
		"a ete tuer par",
		"justice",
		"La carte"
	},
	["HUD_SCORESTAB"] = "Si vous êtes nouveau au mode utiliser la commande ^7MMHELP^0 dans la Console et ^7MMLANG^0 pour changer la langue ici\n\n^2Amusez-Vous!!",
	["HUD_ROLETARGET"] = {
		["Meurtrier"] = "Blend in, build trust, then strike.",
		["Sherif"] = "Find and eliminate all Meurtriers. Do not kill the Innocents!",
		["Innocent"] = "Hide and protect yourself. Help with the investigation when possible.",
		["HERO"] = "You got a chance to stop all Meurtriers. Go and save the day, but be careful!",
		["Fou"] = "Make everyone believe you are the Bad Guy. Your Weapon Rings will not hurt anyone, unless a Hero"
	},
	["HUD_ROLESALIVE"] = {
		"Meurtriers",
		"Sherifs",
		"Innocents"
	},
	["HUD_DEAD"] = "Vous êtes ^Fmort^0\nVous ne pouvez ni réapparaitre, ni parler au personnes en vie.",
	["HUD_MIDJOIN"] = "Vous avez rejoins en ^4pleine partie^0, attendez que le round ce finisse...",
	["HUD_ALONE"] = "^42 joueurs^0 sont requis pour commencer, attendez pour ^4Un^0 joueur de plus pour commencer",
	["HUD_CAMERA"] = {
		["TERMINAL"] = "Appuyer sur ^7CUSTOM1^0 pour regarder les cameras",
		["NOVIDEO"] = "SIGNAL MANQUANT",
		["CONTROLS"] = "JUMP OU SPIN - QUITTER\nNEXT/PREV WEAPON - CAMERAS"
	},
	["HUD_SNEAKING"] = "Accroupi...",
	["HUD_SHOWDOWN"] = "Duel Final!",
	["HUD_YOU"] = "VOUS",
	["HUD_WINNERS"] = "Gagnants:",
	["HUD_WIN"] = {
		["TIE"] = "MATCH NUL!",
		["BAD"] = "^5MeurtrierS",
		["GOOD"] = "^3InnocentS",
		["Fou"] = "^1Fou"
	},
	["HUD_SECONDS"] = "secondes",
	["HUD_INTERMISSION"] = {
		["VOTING_IN"] = "Vote dans",
		["VOTING"] = "Ou allons nous?",
		["VOTING_ENDS_IN"] = "Le vote finis dans",
		["DECISION"] = "Decision",
		["SPEEDINGOFF_TO"] = "Nous allons a",
		["WARPING_IN"] = "Nous nous teleportons",
		["SELECT"] = "Selectionner",
		["CANCEL"] = "Annuler",
		["AUTHORS"] = "Createur"
	},
	["HUD_PAST"] = "PASSER",
	["HUD_FUTURE"] = "FUTUR",
	["HUD_MMHELP_UI"] = {
		"Utiliser ^7UP^0/^7DOWN^0 pour faire défiler, ^7LEFT^0/^7RIGHT^0 pour changer de pages",
		"Appuyer sur ^7CUSTOM^0 pour quitter l'aide"
	},
	["HUD_MMHELP"] = {
		{
			"^7Bienvenue dans Murder Mystery!",
			"L'interprétation de SRB2 du jeu multijoueur populaire!^0\n",
			"Le but du jeu est de trouver et éliminer tout les ^5Meurtriers^0 avant qu'ils tue ^3tout les autres ^0. Ce mode de jeux est similaire à MATCH donc vous aurez besoins de vos talents de tirs et précision.",
			"Vous devez apprendres quelques bases avant de jouer...",
			"\nAu début de chaque round cous recevrez un ^BRole^0 qui définira votre tâche dans cette partie . Voici les tout 3 ^BRoles^0 que vous pouvez avoir:",
			" * ^5Meurtrier ^0 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
			" * ^4Sheriff^0  - leur tâche est de trouver et tuer le/les ^5Meurtrier(s)^0. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
			" * ^3Innocent^0 - Innoffencifs de base, ils doivent éviter de mourir mais peuvent aider a trouver le ^5Meurtrier^0. Ils peuvent aussi se defendre en récuperens 100 Rings pour une munition",
			" * ^1Fou^0 - Un mec drole. Seulement un joueur peut avoir ce role (ce role n'est pas present toute les manches). Le ^1Fou^0 dois faire pensers a tout le monde qu'il est un ^5Meurtrier^0 en tirant des faux 'red rings' innoffencifs. Le Fou gagne si un ^4Sherif^0, ^2Hero^0 ou meme ^3Innocent^0 le tue. Si le ^1Fou^0 Prend une ^4Sherif Emerald^0 il deviendra un ^2Hero^0 et dois faire semblant d'etre gentil.",
			"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel.",
			"\nUtiliser la commande ^7MMLANG^0 pour changer la langue du mod entier."
		},
		{
			"^7Par-apport aux gameplay^0\n",
			"Expliquer plus-tôt dans les bases, le but des Sheriffs est d'éliminer tout les ^5Meurtriers^0, mais des situations de gameplay differentes peuvent arrivé:",
			"\n* Si vous mourez, vous entrerez l'état ^FMort^0. Les joueurs dans cet etas ne peuvent pas parler au joueurs en vie, uniquement pas les autres joueurs Mort.",
			"Vous pouvez pas parler via /PM avec les ^FMort^0.",
			"Aussi ^2N'ESSAYER PAS DE CHANGER DE NOM^0, plus de détails sur la prochaine page.",
			"\n* la tâche du ^4Sheriff^0 est d'éliminer tout les ^5Meurtriers ^0 alentours, mais ils peuvent accidentellement tirer sur un ^3Innocent^0.",
			"Si cela arrive, le ^4Sheriff^0 deviendra ^3Innocent^0 et un ^3Innocent^0 aléatoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que ^4Sheriff^0 réfléchissez deux fois avant de tirer!",
			"\n* Quand un ^5Meurtrier ^0 tue un ^4Sheriff^0 et qu'il restent des ^3Innocents^0 en vie, le Sheriff va lâcher une ^4Sheriff's Emerald^0 vers leur corps.",
			"cette emeraude va donner le role^2Hero^0. Si vous êtes un ^3l'Innocent^0, c'est votre chance d'etre un hero! voici les differences :",
			" - Si un ^2Hero^0 tue un ^3Innocent^0, les deux meurts et leur ^Brole^0 n'est pas reassigner;",
			" - Les ^2Hero^0 ne lache pas de ^4Sherif Emerald^0 quand ils meurts.",
			"\n* Basé sur le nombre de joueurs, il-est possible d'avoir plus d'un ^5Meurtrier^0 et ^4Sheriff^0 parmis les joueurs dans le round. par exemple, à partir de 7 joueurs ou plus, ^BDes équipes^0 de ^5Meurtriers^0 et ^4Sheriffs^0 seront faites.",
			"^BLes alliés^0 peuvent parler en utilisant la commande de console ^7SAYTEAM^0 (A noté que la touche sayteam fonctionne comme la touche say).",
			"Vous ne pouvez pas tuer un alliez mais vous receverer une prévention tout les deux"
		},
		{
			"^7Choses à ne pas faire dans Murder Mystery^0\n",
			"Règle No.1 pour tout les jeux: ^1Soyer gentil et amusez-vous!^0 A-part ça...",
			"\n* Révéler son role n'est pas autoriser car il ruinne le mystère!",
			"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous croîre si vous accuser a tord constamment.",
			"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
			"\n* Changer de nom quand vous êtes mort vous verra expulser de la partie, faite le quand vous êtes en partie ou sur l'écran titre",
			"\nNe pas respecter ces règle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
		},
		{
			"^7Conseils^0\n",
			"Voici des conseils collecter pour MM:",
			"\n* Si un administrateur a désactiver les 'charabilities' vous pouvez appuyer sur ^2SPIN^0 pour vous accroupir et pas faire de bruits ;",
			"\n* Quand vous ramasser une ^4Sherrif Emerald^0, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
			"\n* Trouver vos ^Balliés^0 avec la commande ^7SAYTEAM^0 permettera de savoir qui est dans votre équipe sans prendre de risque;",
			"\n* Prendres des dégats de tout sauf un ^4Sherrif^0 ou un ^5Meurtrier^0 vous donne 3 secondes d'invincibilité;",
			"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicités pas voulu en moins;",
			"\n* Si votres role est révéler, Vous pouvez changer de nom/couleur. ^1Les changement de nom sont exposé^0;",
			"\n*La touche ^2FIRENORMAL^0 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
		}
	},
	["IMG_VICTIMS"] = {
		xoff = 0,
		yoff = 0,
		palette = { {73, 31}, {37, 31} },
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
		xoff = 0,
		yoff = 0,
		palette = { {73, 31} },
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
})
