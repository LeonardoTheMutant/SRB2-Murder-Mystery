-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- FRENCH
-- Made by Troplucky

MM.AddLang("FR", {
    ["VERSION"]="1.0",
	["AUTHOR"]="Troplucky",
	["MM"]="Murder Mystery",
	["CHARSET"]="1254C", --Windows1254 (or Windows1252)
	["MMHELP_CMD"]={
		"Utiliser \23JUMP\16/\23SPIN\16 pour faire d\xE9".."filer, \23Next\16/\23Prev Weapon\16 pour changer de pages",
		"Appuyer sur \23CUSTOM1\16 pour quitter l'aide"
	},
    ["MMHELP"]={
		{
			"\23Bienvenue dans Murder Mystery!",
			"\23L'interpr\xE9tation de SRB2 du \23jeu \23multijoueur \23populaire!\16\n",
			"Le but du jeu est de trouver et \xE9liminer tout les \21Meurtriers\16 avant qu'ils tue\19 tout les autres \16. Ce mode de jeux est similaire \xE0 MATCH donc vous aurez besoins de vos talents de tirs et pr\xE9".."cision.",
			"Vous devez apprendres quelques bases avant de jouer...",
			"\nAu d\xE9".."but de chaque round cous recevrez un \27Role\16 qui d\xE9".."finira votre t\xE2".."che dans cette partie . Voici les tout 3 \27Roles\16 que vous pouvez avoir:",
			" * \21Meurtrier \16 - Un vrai criminel. Ils doivent tuer tout le mondes, mais ont seulements des couteaux et des Red Rings;",
			" * \20Sheriff\16  - leur t\xE2".."che est de trouver et tuer le/les \21Meurtrier(s)\16. les Sheriffs peuvent utiliser toutes les armes disponibles sur la carte;",
			" * \19Innocent\16 - Complètement sans armes, ils doivent \xE9viter de mourir mais peuvent aider a trouver le \21Meurtrier\16.",
			"\nCela conclut les informations basique de ce jeu, si vous voulez and savoir plus continuer de lire ce manuel."
		},
        {
			"\23".."par-apport  aux gameplay\16\n",
			"Expliquer plus-t\xF4t dans les bases, le but des Sheriffs est d'\xE9liminer tout les \21Meurtriers\16, mais des situations de gameplay differentes peuvent arriv\xE9:",
			"\n* Si vous mourez, vous entrerez l'\xE9tat\31 Mort\16 , Les joueurs dans cet \xE9tat ne peuvent pas r\xE9".."appara\xEEtre ni parler aux joueurs en vie, uniquement pas les autres joueurs Mort.",
			"Vous pouvez pas parler via /PM avec les \31 Mort\16.",
			"aussi\18 N'ESSAYER \2PAS \2DE \2CHANGER \2DE \2NOM\16, plus de d\xE9tails sur la prochaine page.",
			"\n* la t\xE2".."che du \20Sheriff\16 est d'\xE9liminer tout les \21Meurtriers \16 alentours, mais ils peuvent accidentellement tirer sur un \19Innocent\16.",
			"Si cela arrive, le \20Sheriff\16 deviendra \19Innocent\16 et un \19Innocent\16 al\xE9".."atoire va prendre sa place . La prochaine fois que vous vouler tirer sur quelqu'un en tant que \20Sheriff\16 r".."fl\xE9".."chissez deux fois avant de tirer!",
			"\n* Quand un \21Meurtrier \16 tue un \20Sheriff\16 et qu'il restent des \19Innocents\16 en vie, le Sheriff va l\xE2".."cher l\xE0 \20Sheriff's Emerald\16 vers leur corps.",
			"contraire aux 7 Chaos Emeralds, cette \xE9meraude va donner le r\xF4le \2H\xE9ro\16 \xE0  \19l'Innocent\16 qui l\xE0 ramasse. Si vous \xEAtes un \19l'Innocent\16, c'est votre chance d'\xEAtre un H\xE9ro et de sauver les gens des \21Meurtriers\16!",
			"Le r\xF4le du \2H\xE9ro\16 r\xF4le ne change pas du \20Sheriff\16 except\xE9 quelques d\xE9tails tel que quand le \2H\xE9ro\16 tue un \19Innocent\16 sont r\xF4le ne se partagera pas et les deux mourront. un H\xE9ro ne l\xE2".."chera pas une \20Sheriff's \20Emerald\16 \xE0 sa mort.",
			"\n* Bas\xE9 sur le nombre de joueurs, il-est possible d'avoir plus d'un \21Meurtrier\16 et \20Sheriff\16 parmis les joueurs dans le round. par exemple, \xE0 partir de 7 joueurs ou plus, \27Des \xE9quipes\16 de \21Meurtriers\16 et \20Sheriffs\16 seront faites.",
			"\27Les alli\xE9s\16 peuvent parler en utilisant la commande de console \23SAYTEAM\16 (A not\xE9 que la touche sayteam fonctionne comme la touche say).",
			"Si un \27Alli\xE9\16 en attaque un autre, les deux recevron un message personnel qui sert de rappel. N'oublier pas que votre interaction \"amicale\" peut r\xE9v\xE9ler quit vous \xEAtes!"
		},
        {
			"\23Choses\xE0 pas faire dans Murder \23Mystery\16\n",
			"R\xE8gle No.1 pour tout les jeux: \1Soyer gentil et \1amusez-vous!\16 A-part \xE7".."a...",
			"\n* R\xE9v\xE9ler son \27Role\16 ruine le \'Myst\xE8re\' (m\xEAme en blague), Vous pouvez r\xE9v\xE9ler le role d'une personne mais pas le votre.",
			"\n* n'insulter pas les autres joueurs, Les blagues sont autoriser mais seulement amicalement. Personne va vous cro\xEEre si vous accuser a tord constamment.",
			"\n* Rester \"AFK\" pendant trop de temps est un crime de guerre. Des bombes vont vous prendre par surprise si vous rester sans bouger trop longtemps.",
			"\n* Ne changer pas de nom quand vous \xEAtes mort, vous allez vous faire kick automatiquement du server. Changer de nom est acceptable si vous \xEAtes en vie. Attender juste que la partie se finisse pour \xEAtre s\xFBr.",
			"\nNe pas respecter ces r\xE8gle peut vous faire recevoir un Kick automatique ou un bannissement venant d'un administrateur. Jouer fun mais avec respect!"
		},
        {
			"\23Conseils\16\n",
			"Voici des conseils collecter pour MM:",
			"\n* Si les capacit\xE9".."es des personnages est d\xE9sactiver par les administrateurs, appuyer sur \2SPIN\16 pour vous d\xE9placer de fa\xE7on silencieuse;",
			"\n* Quand vous ramasser une \20Sherrif \20Emerald\16, vous pourrez utiliser toutes les armes et rings que vous avez pris avant;",
			"\n* Trouver vos \27alli\xE9s\16 avec la commande \23SAYTEAM\16 permettera de savoir qui est dans votre \xE9quipe sans prendre de risque;",
			"\n* Prendres des d\xE9gats de tout sauf un \20Sherrif\16 ou un \21Meurtrier\16 vous donne 3 secondes d'invincibilit\xE9;",
			"\n* Chercher des zones pour vous cacher dans les cartes. Cela permet de la publicit\xE9s pas voulu en moins;",
			"\n* Si votres role est r\xE9v\xE9ler, Vous pouvez changer de nom/couleur. \1Les \1changement \1de \1nom \1sont \1expos\xE9\16;",
			"\n*La touche \18 FIRENORMAL\16 Vous permets de mettre un coup de couteaux tant que vous avez des rings, les innocents en n'on pas."
		}
	},
    ["MMLANG"]={
		"Votre langue actuel est\x82 Francais\x80\nVous pouver le changer avec la commande \x87MMLANG [langue]",
		"Votre langue choisie est actuellement\x82 Francais"
	},
    ["ROLE_GET"]={
		"Vous etes le \x85Meurtrier\x80! \x85tuer tout le monde!",
		"Vous etes le \x84Sheriff\x80!\x84 Eliminer tout les Meurtriers\x80. Si vous tuer un innocent, vous perdrer votre role.",
		"Vous etes \x83Innocent\x80! Cacher vous et aider avec l'investigation."
	},
    ["NEWROLE_GET"]={
		"\x87La vie a decider que vous serez un \x85Meurtrier\x87.\x85 Maintenant tuer tout le monde!",
		"\x87L'univers vous a transformer en \x84Sheriff\x87! Allez\x84 eliminer tout les meurtriers\x87!",
		"\x87Vous avez ete choisi comme \x82Hero\x87. Sauvez tout le monde des meurtriers!"
	},
    ["TEAMMATE_HIT"]={
		"Ce joueur est vous Allie. Ne l'attaquer pas un autre fois.",
		"Un Allie vous a attaquer. Ne vous venger pas sur eux."
	},
    ["MURD_KILLED"]={
		"\x85Murtrier\x87",
		"\x80".."est eliminer"
	},
    ["SHERI_KILLED"]={
		"\x84Sheriff\x87",
		"\x80".."a ete assassiner!",
		"Trouver leur\x84 Emeraulde\x80!"
	},
    ["HERO_KILLED"]={
		"\x82Hero\x87",
		"\x80".."a ete assassiner!"
	},
    ["DIED_HAZARD"]="est mort dans un accident",
	["SHREMD_PICK"]="Quelqu'un a pris la \x84Sheriff's Emerald\x80...",
	["KILL_PUNISHMENT_PM"]={
		"\x87Vous avez tuer un \x83Innocent\x87! ous etes virez. (Tu n'es plus Sherif)",
		"Les \x82Heros\x87 ne doivent pas tuer les \x83Innocents\x87. Vous avez la penaliter de morts pour ca."
		"\x87Oh non! Tu as assassine un \x84Sherif\x87!!! Tu as ete condamne a mort pour ca",
		"\x87Vous avez assassine un joueur\x83 Civil\x87 comme vous! Vous avez ecope de la peine de mort pour cela",
		"\x87Oh non! Tu as assassine un \x82Heros\x87! Tu as ecope de la peine de mort pour ca"
	},
    ["INNO_HURT"]={
		"Le \x84Sheriff\x80 a tuer \x83Innocent\x80! Quelqu'un d'autre dois finir le travail!",
		"Le \x82Hero\x80 est devenu un villain et a tuer un \x83Innocent\x80. Maintenant les deux sont morts. C'est t'a faute le\x82 \"Hero\"\x80"
	},
    ["ONE_QUIT"]={
		"Un des \x85Meurtriers\x80 est parti!",
		"Un des \x84Sheriffs\x80 est parti!!!",
		"Un des \x82Heros\x80 nous a abandonner!"
	},
    ["LAST_QUIT"]={
		"Le dernier \x85Meurtrier\x80 est parti!",
		"Le dernier \x84Sheriff\x80 est parti!",
		"Le dernier \x82Hero\x80 est parti!"
	},
    ["REPLACE_QUIT"]={
		"Le \x85Meurtrier\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
		"Le \x84Sheriff\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!",
		"Un \x82Hero\x80 left! Un \x83Innocent\x80 Aleatoire va prendre son role!"
	},
    ["ENDROUND"]={
		"Tout le mondes est mort. Les \x85Meurtriers\x80 gagnent!",
		"Tout les \x85Meurtriers\x80 sont morts! Les\x83 Civils\x80 gagnent!",
		"Les \x85Meurtriers\x80 ont gagner car le \x84Sheriff\x80 a tuer le dernier Innocent ! Faute au \x84Sheriff\x80",
		"Le \x82Hero\x80 a choisis de tuer le dernier Innocent. Les \x85Meurtriers\x80 gagnent!",
		"Les protecteurs des \x83Innocents\x80 sont morts. Les \x85Meurtriers\x80 gagnent!"
	},
    ["BMP_VICTIMS"]={
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF",
		"\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFFFIII\x1F1F\x1F1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFIII\x1FFF\xFF",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFF",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFIII\x1FFF",
		"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF",
		"\x1FIIII\x1FFF\xFFII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF",
		"\xFF1FII\x1FFF\xFFFFII\x1FFF\x1FIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFF\x1FIIII\x1F1F\xFF",
		"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1FFF\xFF"
	},
    ["BMP_SUSPECTS"]={
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
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
	},
    ["BMP_TIME"]={
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
    ["BMP_RINGS"]={
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
    ["HUD_ROLES"]={
		"MEURTRIER",
		"SHERIFF",
		"CIVIL",
		"HERO",
		"MORT"
	},
	["HUD_SUSPECTS"]="Suspects",
	["HUD_VICTIMS"]="Victimes",
	["HUD_TEAMMATES"]="Alli\xE9s",
	["HUD_KILLBY"]="Tuer par",
	["HUD_STUPID"]="Votre stupidit\xE9".."e",
	["HUD_SCORESTAB"]={
		"Si vous \xEAtes nouveau au mode utiliser ",
		"la commande \23MMHELP\16 dans la Console et",
		"\23MMLANG\16 pour changer la langue ici",
		"",
		"",
		"\2Amusez-Vous!!"
	},
    ["HUD_ROLESALIVE"]={
		"Meurtriers",
		"Sheriffs",
		"Civils"
	},
    ["HUD_DEAD"]={
		"Vous \xEAtes\31 mort",
		"Vous ne pouvez ni r\xE9".."apparaitre, ni parler",
		"au personnes en vie."
	},
    ["HUD_MIDJOIN"]={
		"Vous avez rejoins en \20pleine partie\16, attendez que le round ce finisse..."
	},
    ["HUD_ALONE"]={
		"\20".."2 joueurs\16 sont requis pour commencer,",
		"attendez pour \20Un\16 joueur de plus",
		"pour commencer"
	},
    ["HUD_SNEAKING"]="En Discret...",
	["HUD_SHOWDOWN"]="Duel Final!",
	["HUD_MINIGAME"]={
		["PRESS"]="Appuyer sur\18 CUSTOM3\16 pour",
		["LEAVE"]="quitter",
		["CANCEL"]="annulez",
		["SPECTATE"]="Regarder",
		["DUEL"]="un minijeux duel",
		["REQUEST"]="demander une partie de \23PONG\16",
		["START"]="d\xE9marrer une partie de \23\"SONIC RUN\"\16",
		["ACCEPT"]="accepter le duel de \23PONG\16!",
		["WAIT"]="En attente que le rival accepte...",
		["SPECTATING"]="En train de regarder un duel...",
		["BORED"]="Ennuyez?",
		["GOAL"]="But!"
	},
    ["HUD_YOU"]="VOUS",
	["HUD_WINNERS"]="Gagnants:",
	["HUD_WIN"]={
		"MATCH NUL!",
		"\21MEURTRIERS",
		"\19CIVILS"
	},
	["HUD_PAST"]="PASS\xE9",
	["HUD_FUTURE"]="AVENIR"
})