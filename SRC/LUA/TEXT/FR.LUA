-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- FRENCH
-- Made by Troplucky

MM.AddLang("FR", {
	["VERSION"]="1.3",
	["AUTHOR"]="Troplucky",
	["CHAT_MMLANG"]={
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
		"\x85Murtrier",
		"est eliminer"
	},
	["CHAT_SHERIKILLED"]={
		"\x84Sheriff",
		"a ete assassiner!",
		"Trouver leur\x84 Emeraulde\x80!"
	},
	["CHAT_HEROKILLED"]={
		"\x82Hero",
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
	["BMP_VICTIMS"]={data={
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF",
		"\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFFFIII\x1F1F\x1F1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFIII\x1FFF\xFF",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFF",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFIII\x1FFF",
		"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF",
		"\x1FIIII\x1FFF\xFFII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF",
		"\xFF1FII\x1FFF\xFFFFII\x1FFF\x1FIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\x1FIIII\x1F1F\xFF",
		"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1FFF\xFF"
	}},
	["BMP_SUSPECTS"]={data={
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
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\31"
	}},
	["BMP_TIME"]={data={
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
	}},
	["BMP_RINGS"]={data={
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
	}},
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
	["HUD_SCORESTAB"]={
		"Si vous êtes nouveau au mode utiliser ",
		"la commande \1\x87MMHELP\4 dans la Console et",
		"\1\x87MMLANG\4 pour changer la langue ici",
		"",
		"",
		"\1\x82".."Amusez-Vous!!"
	},
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
	["HUD_DEAD"]={
		"Vous êtes\1\x8F mort",
		"Vous ne pouvez ni réapparaitre, ni parler",
		"au personnes en vie."
	},
	["HUD_MIDJOIN"]={
		"Vous avez rejoins en \1\x84pleine partie\4, attendez que le round ce finisse..."
	},
	["HUD_ALONE"]={
		"\1\x84".."2 joueurs\4 sont requis pour commencer,",
		"attendez pour \1\x84Un\4 joueur de plus",
		"pour commencer"
	},
	["HUD_SNEAKING"]="En Discret...",
	["HUD_SHOWDOWN"]="Duel Final!",
	["HUD_MINIGAME"]={
		["PRESS"]="Appuyer sur\1\x82 CUSTOM3\4 pour",
		["LEAVE"]="quitter",
		["CANCEL"]="annulez",
		["SPECTATE"]="Regarder",
		["DUEL"]="un minijeux duel",
		["REQUEST"]="demander une partie de \1\x87PONG\4",
		["START"]="démarrer une partie de \1\x87\"SONIC RUN\"\4",
		["ACCEPT"]="accepter le duel de \1\x87PONG\4!",
		["WAIT"]="En attente que le rival accepte...",
		["SPECTATING"]="En train de regarder un duel...",
		["BORED"]="Ennuyez?",
		["GOAL"]="But!"
	},
	["HUD_YOU"]="VOUS",
	["HUD_WINNERS"]="Gagnants:",
	["HUD_WIN"]={
		"MATCH NUL!",
		"\1\x85MEURTRIERS",
		"\1\x83".."CIVILS"
	},
	["HUD_PAST"]="PASSÉ",
	["HUD_FUTURE"]="AVENIR",
	["HUD_MMHELP_UI"]={
		"Utiliser \1\x87JUMP\4/\1\x87SPIN\4 pour faire défiler, \1\x87Next\4/\1\x87Prev Weapon\4 pour changer de pages",
		"Appuyer sur\1\x87 CUSTOM1\4 pour quitter l'aide"
	},
	["HUD_MMHELP"]={
		{
			"\1\x87".."Bienvenue dans Murder Mystery!",
			"\1\x87L'interprétation de SRB2 du jeu multijoueur populaire!\4\n",
			"Le but du jeu est de trouver et éliminer tout les \1\x85Meurtriers\4 avant qu'ils tue\1\x83 tout les autres \4. Ce mode de jeux est similaire à MATCH donc vous aurez besoins de vos talents de tirs et précision.",
			"Vous devez apprendres quelques bases avant de jouer...",
			"\nAu début de chaque round cous recevrez un \1\x8BRole\4 qui définira votre tâche dans cette partie . Voici les tout 3 \1\x8BRoles\4 que vous pouvez avoir:",
			" * \1\x85Meurtrier \4 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
			" * \1\x84Sheriff\4  - leur tâche est de trouver et tuer le/les \1\x85Meurtrier(s)\4. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
			" * \1\x83Innocent\4 - Complètement sans armes, ils doivent éviter de mourir mais peuvent aider a trouver le \1\x85Meurtrier\4.",
			"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel."
		},
		{
			"\1\x87Par-apport aux gameplay\4\n",
			"Expliquer plus-tôt dans les bases, le but des Sheriffs est d'éliminer tout les \1\x85Meurtriers\4, mais des situations de gameplay differentes peuvent arrivé:",
			"\n* Si vous mourez, vous entrerez l'état \1\x8FMort\4 , Les joueurs dans cet état ne peuvent pas réapparaître ni parler aux joueurs en vie, uniquement pas les autres joueurs Mort.",
			"Vous pouvez pas parler via /PM avec les \1\x8FMort\4.",
			"aussi \1\x82N'ESSAYER PAS DE CHANGER DE NOM\4, plus de détails sur la prochaine page.",
			"\n* la tâche du \1\x84Sheriff\4 est d'éliminer tout les \1\x85Meurtriers \4 alentours, mais ils peuvent accidentellement tirer sur un \1\x83Innocent\4.",
			"Si cela arrive, le \1\x84Sheriff\4 deviendra \1\x83Innocent\4 et un \1\x83Innocent\4 aléatoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que \1\x84Sheriff\4 rfléchissez deux fois avant de tirer!",
			"\n* Quand un \1\x85Meurtrier \4 tue un \1\x84Sheriff\4 et qu'il restent des \1\x83Innocents\4 en vie, le Sheriff va lâcher là \1\x84Sheriff's Emerald\4 vers leur corps.",
			"contraire aux 7 Chaos Emeralds, cette émeraude va donner le rôle \1\x82Héro\4 à  \1\x83l'Innocent\4 qui là ramasse. Si vous êtes un \1\x83l'Innocent\4, c'est votre chance d'être un Héro et de sauver les gens des \1\x85Meurtriers\4!",
			"Le rôle du \1\x82Héro\4 rôle ne change pas du \1\x84Sheriff\4 excepté quelques détails tel que quand le \1\x82Héro\4 tue un \1\x83Innocent\4 sont rôle ne se partagera pas et les deux mourront. un Héro ne lâchera pas une \1\x84Sheriff's Emerald\4 à sa mort.",
			"\n* Basé sur le nombre de joueurs, il-est possible d'avoir plus d'un \1\x85Meurtrier\4 et \1\x84Sheriff\4 parmis les joueurs dans le round. par exemple, à partir de 7 joueurs ou plus,\1\x8B Des équipes\4 de \1\x85Meurtriers\4 et \1\x84Sheriffs\4 seront faites.",
			"\1\x8BLes alliés\4 peuvent parler en utilisant la commande de console \1\x87SAYTEAM\4 (A noté que la touche sayteam fonctionne comme la touche say).",
			"Si un\1\x8B Allié\4 en attaque un autre, les deux recevron un message personnel qui sert de rappel. N'oublier pas que votre interaction \"amicale\" peut révéler quit vous êtes!"
		},
		{
			"\1\x87".."Chosesà pas faire dans Murder Mystery\4\n",
			"Règle No.1 pour tout les jeux: \1\x81Soyer gentil et amusez-vous!\4 A-part ça...",
			"\n* Révéler son \1\x8BRole\4 ruine le \'Mystère\' (même en blague), Vous pouvez révéler le role d'une personne mais pas le votre.",
			"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous croîre si vous accuser a tord constamment.",
			"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
			"\n* Ne changer pas de nom quand vous êtes mort, vous allez vous faire kick automatiquement du server. Changer de nom est acceptable si vous êtes en vie. Attender juste que la partie se finisse pour être sûr.",
			"\nNe pas respecter ces règle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
		},
		{
			"\1\x87".."Conseils\4\n",
			"Voici des conseils collecter pour MM:",
			"\n* Si les capacitées des personnages est désactiver par les administrateurs, appuyer sur \1\x82SPIN\4 pour vous déplacer de façon silencieuse;",
			"\n* Quand vous ramasser une \1\x84Sherrif Emerald\4, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
			"\n* Trouver vos\1\x8B alliés\4 avec la commande \1\x87SAYTEAM\4 permettera de savoir qui est dans votre équipe sans prendre de risque;",
			"\n* Prendres des dégats de tout sauf un \1\x84Sherrif\4 ou un \1\x85Meurtrier\4 vous donne 3 secondes d'invincibilité;",
			"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicités pas voulu en moins;",
			"\n* Si votres role est révéler, Vous pouvez changer de nom/couleur. \1\x81Les changement de nom sont exposé\4;",
			"\n*La touche\1\x82 FIRENORMAL\4 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
		}
	}
})
