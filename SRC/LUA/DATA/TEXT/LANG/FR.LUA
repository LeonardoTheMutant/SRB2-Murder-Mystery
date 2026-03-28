-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- FRENCH
-- Made by Troplucky

MM.AddLang("FR", {
	["LANGUAGE"]="Francais",
	["VERSION"]="1.3_OLD",
	["AUTHOR"]="Troplucky",
	["CON_MMLANG"]={
		"Votre langue actuel est\x82 Francais\x80\nVous pouver le changer avec la commande \x87MMLANG [langue]",
		"Votre langue choisie est actuellement\x82 Francais"
	},
	["CHAT_ROLEGET_PM"]={
		"Vous etes le \x85Meurtrier\x80! \x85tuer tout le monde!",
		"Vous etes le \x84Sheriff\x80!\x84 Eliminer tout les Meurtriers\x80. Si vous tuer un innocent, vous perdrer votre role.",
		"Vous etes \x83Innocent\x80! Cacher vous et aider avec l'investigation."
	},
	["CHAT_NEWROLEGET_PM"]={
		"\x87La vie a decider que vous serez un \x85Meurtrier\x87.\x85 Maintenant tuer tout le monde!",
		"\x87L'univers vous a transformer en \x84Sheriff\x87! Allez\x84 eliminer tout les meurtriers\x87!",
		"\x87Vous avez ete choisi comme \x82Hero\x87. Sauvez tout le monde des meurtriers!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Ce joueur est vous Allie. Ne l'attaquer pas un autre fois.",
		"Un Allie vous a attaquer. Ne vous venger pas sur eux."
	},
	["CHAT_MURDKILLED"]={
		"Murtrier",
		"est eliminer"
	},
	["CHAT_SHERIKILLED"]={
		"Sheriff",
		"a ete assassiner!",
		"Trouver leur\x84 Emeraulde\x80!"
	},
	["CHAT_HEROKILLED"]={
		"Hero",
		"a ete assassiner!"
	},
	["CHAT_DIEDHAZARD"]="est mort dans un accident.",
	["CHAT_SHREMDPICKUP"]="Quelqu'un a pris la \x84Sheriff's Emerald\x80...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"\x87Vous avez tuer un \x83Innocent\x87! ous etes virez. (Tu n'es plus Sherif)",
		"Les \x82Heros\x87 ne doivent pas tuer les \x83Innocents\x87. Vous avez la penaliter de morts pour ca.",
		"\x87Oh non! Tu as assassine un \x84Sherif\x87!!! Tu as ete condamne a mort pour ca",
		"\x87Vous avez assassine un joueur\x83 Civil\x87 comme vous! Vous avez ecope de la peine de mort pour cela",
		"\x87Oh non! Tu as assassine un \x82Heros\x87! Tu as ecope de la peine de mort pour ca"
	},
	["CHAT_INNOHURT"]={
		"Le \x84Sheriff\x80 a tuer \x83Innocent\x80! Quelqu'un d'autre dois finir le travail!",
		"Le \x82Hero\x80 est devenu un villain et a tuer un \x83Innocent\x80. Maintenant les deux sont morts. C'est t'a faute le\x82 \"Hero\"\x80"
	},
	["CHAT_ONEQUIT"]={
		"Un des \x85Meurtriers\x80 est parti!",
		"Un des \x84Sheriffs\x80 est parti!!!",
		"Un des \x82Heros\x80 nous a abandonner!"
	},
	["CHAT_LASTQUIT"]={
		"Le dernier \x85Meurtrier\x80 est parti!",
		"Le dernier \x84Sheriff\x80 est parti!",
		"Le dernier \x82Hero\x80 est parti!"
	},
	["CHAT_REPLACEQUIT"]={
		"Le \x85Meurtrier\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
		"Le \x84Sheriff\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
		"Un \x82Hero\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!"
	},
	["CHAT_ENDROUND"]={
		"Tout le mondes est mort. Les \x85Meurtriers\x80 gagnent!",
		"Tout les \x85Meurtriers\x80 sont morts! Les\x83 Civils\x80 gagnent!",
		"Les \x85Meurtriers\x80 ont gagner car le \x84Sheriff\x80 a tuer le dernier Innocent ! Faute au \x84Sheriff\x80",
		"Le \x82Hero\x80 a choisis de tuer le dernier Innocent. Les \x85Meurtriers\x80 gagnent!",
		"Les protecteurs des \x83Innocents\x80 sont morts. Les \x85Meurtriers\x80 gagnent!"
	},
	["HUD_MM"]="Murder Mystery",
	["HUD_ROLES"]={
		"MEURTRIER",
		"SHERIFF",
		"CIVIL",
		"HERO",
		"MORT"
	},
	["HUD_SUSPECTS"]="Suspects",
	["HUD_VICTIMS"]="Victimes",
	["HUD_TEAMMATES"]="Alliés",
	["HUD_KILLEDBY"]={
		"Tuer par",
		"la justice",
		"un piège"
	},
	["HUD_SCORESTAB"]="Si vous êtes nouveau au mode utiliser la commande ^7MMHELP^0 dans la Console et ^7MMLANG^0 pour changer la langue ici\n\n^2Amusez-Vous!!",
	["HUD_ROLETARGET"] = {
		"",
		"",
		"",
		""
	},
	["HUD_ROLESALIVE"]={
		"Meurtriers",
		"Sheriffs",
		"Civils"
	},
	["HUD_DEAD"]="Vous êtes ^Fmort^0\nVous ne pouvez ni réapparaitre, ni parler au personnes en vie.",
	["HUD_MIDJOIN"]="Vous avez rejoins en ^4pleine partie^0, attendez que le round ce finisse...",
	["HUD_ALONE"]="^42 joueurs^0 sont requis pour commencer, attendez pour ^4Un^0 joueur de plus pour commencer",
	["HUD_SNEAKING"]="En Discret...",
	["HUD_SHOWDOWN"]="Duel Final!",
	["HUD_MINIGAME"]={
		["PRESS"]="Appuyer sur^2 CUSTOM3^0 pour",
		["LEAVE"]="quitter",
		["CANCEL"]="annulez",
		["SPECTATE"]="Regarder",
		["DUEL"]="un minijeux duel",
		["REQUEST"]="demander une partie de ^7PONG^0",
		["START"]="démarrer une partie de ^7\"SONIC RUN\"^0",
		["ACCEPT"]="accepter le duel de ^7PONG^0!",
		["WAIT"]="En attente que le rival accepte...",
		["SPECTATING"]="En train de regarder un duel...",
		["BORED"]="Ennuyez?",
		["GOAL"]="But!"
	},
	["HUD_YOU"]="VOUS",
	["HUD_WINNERS"]="Gagnants:",
	["HUD_WIN"]={
		"MATCH NUL!",
		"^5MEURTRIERS",
		"^3CIVILS"
	},
	["HUD_PAST"]="PASSÉ",
	["HUD_FUTURE"]="AVENIR",
	["HUD_MMHELP_UI"]={
		"Utiliser ^7UP^0/^7DOWN^0 pour faire défiler, ^7LEFT^0/^7RIGHT^0 pour changer de pages",
		"Appuyer sur ^7CUSTOM^0 pour quitter l'aide"
	},
	["HUD_MMHELP"]={
		{
			"^7Bienvenue dans Murder Mystery!",
			"L'interprétation de SRB2 du jeu multijoueur populaire!^0\n",
			"Le but du jeu est de trouver et éliminer tout les ^5Meurtriers^0 avant qu'ils tue ^3tout les autres ^0. Ce mode de jeux est similaire à MATCH donc vous aurez besoins de vos talents de tirs et précision.",
			"Vous devez apprendres quelques bases avant de jouer...",
			"\nAu début de chaque round cous recevrez un ^BRole^0 qui définira votre tâche dans cette partie . Voici les tout 3 ^BRoles^0 que vous pouvez avoir:",
			" * ^5Meurtrier ^0 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
			" * ^4Sheriff^0  - leur tâche est de trouver et tuer le/les ^5Meurtrier(s)^0. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
			" * ^3Innocent^0 - Complètement sans armes, ils doivent éviter de mourir mais peuvent aider a trouver le ^5Meurtrier^0.",
			"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel."
		},
		{
			"^7Par-apport aux gameplay^0\n",
			"Expliquer plus-tôt dans les bases, le but des Sheriffs est d'éliminer tout les ^5Meurtriers^0, mais des situations de gameplay differentes peuvent arrivé:",
			"\n* Si vous mourez, vous entrerez l'état ^FMort^0 , Les joueurs dans cet état ne peuvent pas réapparaître ni parler aux joueurs en vie, uniquement pas les autres joueurs Mort.",
			"Vous pouvez pas parler via /PM avec les ^FMort^0.",
			"aussi ^2N'ESSAYER PAS DE CHANGER DE NOM^0, plus de détails sur la prochaine page.",
			"\n* la tâche du ^4Sheriff^0 est d'éliminer tout les ^5Meurtriers ^0 alentours, mais ils peuvent accidentellement tirer sur un ^3Innocent^0.",
			"Si cela arrive, le ^4Sheriff^0 deviendra ^3Innocent^0 et un ^3Innocent^0 aléatoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que ^4Sheriff^0 rfléchissez deux fois avant de tirer!",
			"\n* Quand un ^5Meurtrier ^0 tue un ^4Sheriff^0 et qu'il restent des ^3Innocents^0 en vie, le Sheriff va lâcher là ^4Sheriff's Emerald^0 vers leur corps.",
			"contraire aux 7 Chaos Emeralds, cette émeraude va donner le rôle ^2Héro^0 à  ^3l'Innocent^0 qui là ramasse. Si vous êtes un ^3l'Innocent^0, c'est votre chance d'être un Héro et de sauver les gens des ^5Meurtriers^0!",
			"Le rôle du ^2Héro^0 rôle ne change pas du ^4Sheriff^0 excepté quelques détails tel que quand le ^2Héro^0 tue un ^3Innocent^0 sont rôle ne se partagera pas et les deux mourront. un Héro ne lâchera pas une ^4Sheriff's Emerald^0 à sa mort.",
			"\n* Basé sur le nombre de joueurs, il-est possible d'avoir plus d'un ^5Meurtrier^0 et ^4Sheriff^0 parmis les joueurs dans le round. par exemple, à partir de 7 joueurs ou plus, ^BDes équipes^0 de ^5Meurtriers^0 et ^4Sheriffs^0 seront faites.",
			"^BLes alliés^0 peuvent parler en utilisant la commande de console ^7SAYTEAM^0 (A noté que la touche sayteam fonctionne comme la touche say).",
			"Si un ^BAllié^0 en attaque un autre, les deux recevron un message personnel qui sert de rappel. N'oublier pas que votre interaction \"amicale\" peut révéler quit vous êtes!"
		},
		{
			"^7Chosesà pas faire dans Murder Mystery^0\n",
			"Règle No.1 pour tout les jeux: ^1Soyer gentil et amusez-vous!^0 A-part ça...",
			"\n* Révéler son ^BRole^0 ruine le \'Mystère\' (même en blague), Vous pouvez révéler le role d'une personne mais pas le votre.",
			"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous croîre si vous accuser a tord constamment.",
			"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
			"\n* Ne changer pas de nom quand vous êtes mort, vous allez vous faire kick automatiquement du server. Changer de nom est acceptable si vous êtes en vie. Attender juste que la partie se finisse pour être sûr.",
			"\nNe pas respecter ces règle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
		},
		{
			"^7Conseils^0\n",
			"Voici des conseils collecter pour MM:",
			"\n* Si les capacitées des personnages est désactiver par les administrateurs, appuyer sur ^2SPIN^0 pour vous déplacer de façon silencieuse;",
			"\n* Quand vous ramasser une ^4Sherrif Emerald^0, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
			"\n* Trouver vos ^Balliés^0 avec la commande ^7SAYTEAM^0 permettera de savoir qui est dans votre équipe sans prendre de risque;",
			"\n* Prendres des dégats de tout sauf un ^4Sherrif^0 ou un ^5Meurtrier^0 vous donne 3 secondes d'invincibilité;",
			"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicités pas voulu en moins;",
			"\n* Si votres role est révéler, Vous pouvez changer de nom/couleur. ^1Les changement de nom sont exposé^0;",
			"\n*La touche ^2FIRENORMAL^0 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
		}
	},
	["IMG_VICTIMS"]={palette={{73, 31}},image={
		"001 001 001  00001  0000001 001 001    001 0000001  00001 ",
		"001 001 001 0000001 0000001 001 001    001 0000001 0000001",
		"001 001 001 0011001 1100111 001 000   0001 0011111 0011001",
		"001 001 001 001 001   001   001 0000 00001 001     0001111",
		"001 001 001 001 111   001   001 0000000001 0000001 10001  ",
		"001 001 001 001       001   001 0000000001 0000001  10001  ",
		"001 001 001 001 001   001   001 0010001001 0011111   10001 ",
		"0000001 001 001 001   001   001 001101 001 001     0011001 ",
		"100001  001 0000001   001   001 001 1  001 0000001 0000001 ",
		" 1001   001 1000011   001   001 001    001 0000001 1000011 ",
		"  11    111  11111    111   111 111    111 1111111  11111  "
	}},
	["IMG_SUSPECTS"]={palette={{73, 31}},image={
		" 00001  001 001  00001  000001  0000001  00001  0000001  00001",
		"0000001 001 001 0000001 0000001 0000001 0000001 0000001 0000001",
		"0011001 001 001 0011001 0011001 0011111 0011001 1100111 0011001",
		"000111  001 001 000111  001 001 001     001 001   001   000111",
		"10001   001 001 10001   0000001 0000001 001 111   001   10001",
		" 10001  001 001  10001  0000011 0000001 001       001    10001",
		"  10001 001 001   10001 00111   0011111 001 001   001     10001",
		"0011001 001 001 0011001 001     001     001 001   001   0011001",
		"0000001 0000001 0000001 001     0000001 0000001   001   0000001",
		"100001  100001  100001  001     0000001 100001    001   100001",
		" 1111    1111    1111   111     1111111  1111     111    1111"
	}},
	["IMG_TIME"]={palette={{73, 31},{37, 31}},image={
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
	["IMG_RINGS"]={palette={{73, 31},{37, 31}},image={
		"000001   001  001   001  00001   00001",
		"0000001  001  001   001 0000001 0000001",
		"0011001  001  000   001 0011001 0011001",
		"001 001  001  0000  001 001 001 000111",
		"0000011  001  00000 001 001 111 10001",
		"000001   001  001000001 0010001  10001",
		"001 001  001  001100001 0010001   10001",
		"001 001  001  001 10001 0011001 0011001",
		"001 001  001  001  1001 0000001 0000001",
		"001 001  001  001   001  00001   000011",
		"111 111  111  111   111  1111    1111"
	}}
})
