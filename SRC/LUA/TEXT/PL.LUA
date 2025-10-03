-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- POLISH
-- Made by LeonardoTheMutant

MM.AddLang("PL", {
	["VERSION"]="1.3",
	["AUTHOR"]="LeonardoTheMutant",
	["CON_MMLANG"]={
		"Twoj aktualnie uzywany jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
		"Personalny jezyk zostal ustawiony na\x82 Polski"
	},
	["CHAT_ROLEGET_PM"]={
		"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
		"Jestes \x84Szeryfem\x80!\x84 Wyeliminuj wszystkich Mordercow\x80. Jesli zabijesz Ciwila, stracisz role.",
		"Jestes\x83 Cywilem\x80! Kryj sie i pomoz w dochodzeniu."
	},
	["CHAT_NEWROLEGET_PM"]={
		"\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
		"\x87Swiat sprawil cie nowym \x84Szeryfem\x87! To teraz twoja robota\x84 wyeliminowac wszystkich Mordercow\x87!",
		"\x87Wszyscy obroncy odeszli ale swiat sprawil cie nowym\x82 Bohaterem\x87! To twoja szansa uratowac dzien!",
		"\x87Wyeliminowales jednego z \x85Morderc\x87! Zostales awansowany na\x82 Bohatera\x87!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Ten gracz jest twoim wspolnikiem, natepnym razem nie probuj zabiac ich ponownie",
		"Twoj wspolnik cie zaatakowal, nie probuj sie mscic"
	},
	["CHAT_MURDKILLED"]={
		"\x85Morderca",
		"zostal wyeliminowany!"
	},
	["CHAT_SHERIKILLED"]={
		"\x84Szeryf",
		"zostal zamordowany!",
		"Znajdz zgubiony \x84Szmaragd Szeryfa\x80!"
	},
	["CHAT_HEROKILLED"]={
		"\x82".."Bohater",
		"zostal zamordowany!"
	},
	["CHAT_DIEDHAZARD"]="zginal(ela) w nieszczesnym wypadku.",
	["CHAT_SHREMDPICKUP"]="Ktos podniosl \x84Szmaragd Szeryfa\x80...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"\x87Zamordowales\x83 Cywilnego\x87! Nie jestes juz \x84Szeryfem\x87!",
		"\x82".."Bohaterowie nie sa po to, zeby zabijac\x83 Cywilow\x87! Masz za to kare smierci.",
		"\x87O nie! Zamordowales \x84Szeryfa\x87! Masz za to kare smierci!",
		"\x87Zabiles takiego samego\x83 Cywilnego\x87 gracza jak i ty! Masz za to kare smierci!",
		"\x87O nie! Zamordowales\x82 Bohatera\x87! Masz za to kare smierci!"
	},
	["CHAT_INNOHURT"]={
		"\x84Szeryfie\x80 zamordowales Cywila! Ktos z\x83 Cywilow\x80 musi dokonczyc robote!",
		"\x82".."Bohater\x80 jest skurwielem, zabil spokojnego\x83 Cywila\x80. Teraz obydwoje nie zyja. Wstyd dla bohatera"
	},
	["CHAT_ONEQUIT"]={
		"Jeden z \x85Mordercow\x80 wyszedl!",
		"Jeden z \x84Szeryfow\x80 wyszedl!",
		"Jeden z\x82 Bohaterow\x80 zostawil nas!"
	},
	["CHAT_LASTQUIT"]={
		"Ostatni \x85Mordercow\x80 wyszedl!",
		"Ostatni \x84Szeryfow\x80 wyszedl!",
		"Ostatni\x82 Bohaterow\x80 wyszedl!"
	},
	["CHAT_REPLACEQUIT"]={
		"\x85Morderca\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!",
		"\x84Szeryf\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!",
		"\x82".."Bohater\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!"
	},
	["CHAT_ENDROUND"]={
		"Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
		"Wszyscy Mordercy zostali wyeliminowani,\x83 Cywile\x80 wygrywaja!",
		"\x85Mordercy\x80 wygrywaja, poniewaz \x84Szeryf\x80 zamordowal ostatniego\x83 Cywila\x80!",
		"\x82".."Bohater\x80 wybral do zabicia ostatniego\x83 Cywila\x80. \x85Moredrcy\x80 Wygrywaja!",
		"Wszyscy Szeryfi i Bohaterzy zginely, \x85Mordercy\x80 wygrywaja!"
	},
	["BMP_VICTIMS"]={data={
		"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\31",
		"II\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\31",
		"II\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\x1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\31"
	}},
	["BMP_SUSPECTS"]={data={
		"\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFIII\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIII\xFFII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\31",
		"IIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFFF\xFFIII\x1FFF\xFFIIIIII\x1FFFIIIIIIII\x1FFF\xFF1FIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\31",
		"II\x1F1F\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1F1FII\x1FFFII\x1FIIIII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\31",
		"II\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FIIII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1FIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"II\x1FFF\xFFFF\xFFFF\x1FIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFF1FII\x1FFFIIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFFII\31",
		"\x1F1F\x1FFF\xFFFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\31"
	}},
	["BMP_TIME"]={data={
		"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFF\xFFIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\31",
		"\xFFII\x1FFF\x1F1F\x1FFF\xFFFFIIII\x1FFFIIIIII\x1FFF\x1FIII\31",
		"II\x1FFF\xFFFF\xFFFF\xFFIIII\x1F1F\xFFIIIIII\x1FFF\xFF1FIII\31",
		"II\x1FFFII\x1FFFIIII\x1F1F\xFFFFII\x1F1FII\x1FFF\xFFFF\x1FIII\31",
		"II\x1FFFII\x1FFFIII\x1F1F\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FII\31",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\31",
		"\x1FIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\x1FIIII\x1F1F",
		"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\31"
	}},
	["BMP_RINGS"]={data={
		"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\31",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\31",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFII\31",
		"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\31"
	}},
	["HUD_MM"]="Tajemnica Morderstw",
	["HUD_ROLES"]={
		"MORDERCA",
		"SZERYF",
		"CYWIL",
		"BOHATER",
		"MARTWY"
	},
	["HUD_SUSPECTS"]="Podejrzani",
	["HUD_VICTIMS"]="Ofiary",
	["HUD_TEAMMATES"]="Członkowie drużyny",
	["HUD_KILLEDBY"] = {
		"Zabity przez",
		"sprawiedliwość",
		"pułapkę na mapie"
	},
	["HUD_SCORESTAB"]={
		"Jeśli ten tryb jest ci nowy użyj",
		"komendy ^7MMHELP^0 w Konsoli dla pomocy",
		"i ^7MMLANG^0 dla zmiany języka tutaj",
		"",
		"",
		"^2".."Baw się dobrze ;)"
	},
	["HUD_ROLETARGET"] = {
		"Zamorduj wszystkich.",
		"Wyeliminuj wszystkich Morderców.\nNie zabijaj Ciwilów!",
		"Kryj się i pomóż w dochodzeniu,\nkiedy jest to możliwe.",
		"Masz szansę powstrzymać wszystkich\nMorderców. Ruszaj i uratuj dzień,\nale bądź ostrożny!"
	},
	["HUD_ROLESALIVE"]={
		"Morderców",
		"Szeryfów",
		"Cywilów"
	},
	["HUD_DEAD"]={
		"Jesteś^F martwy(a)",
		"Nie mozesz się odnawiać lub gadać do żywych"
	},
	["HUD_MIDJOIN"]={
		"Pan(i) dolaczył(a) się ^4w środku rundy^0, prosze poczekać na nową rundę żeby zagrać.",
		"Podczas oczekiwania prosimy o zapoznanie się z regulami gry w poleceniu konsoli ^7MMHELP^0"
	},
	["HUD_ALONE"]={
		"^4".."2 graczy^0 jest wymaganych do gry,",
		"proszę poczekać na ^4jeszcze jednego^0 gracza",
		"dla startu"
	},
	["HUD_SNEAKING"]="Skradzamy się...",
	["HUD_SHOWDOWN"]="Pojedynek losu!",
	["HUD_MINIGAME"]={
		["PRESS"] = "Naciśnij^2 CUSTOM3^0, aby", --must contain MM escape color codes
		["LEAVE"]="opuścić grę",
		["CANCEL"]="anulować",
		["SPECTATE"]="oglądać",
		["DUEL"]="za pojedynkiem w minigrzę",
		["REQUEST"]="zagrać w ^7PONG^0 z przeciwnikiem", --must contain MM escape color codes
		["START"]="zagrać w ^7SONIC RUN", --must contain MM escape color codes
		["ACCEPT"]="zaakceptować zaproszenie w ^7PONG^0!", --must contain MM escape color codes
		["WAIT"]="Czekamy na odpowiedź przeciwnika...",
		["SPECTATING"]="Oglądamy za pojedynkiem...",
		["BORED"]="Nudzisz się?",
		["GOAL"]="Gol!"
	},
	["HUD_YOU"]="TY",
	["HUD_WINNERS"]="Wygrani:",
	["HUD_WIN"]={
		"REMIS!",
		"^5MÓRDERCY",
		"^3".."CYWILE"
	},
	["HUD_PAST"]="PRZESZLOŚĆ",
	["HUD_FUTURE"]="PRZYSZLOŚĆ",
	["HUD_MMHELP_UI"]={
		"^7JUMP^0/^7SPIN^0 - scrolling strony, ^7NEXT^0/^7PREV WEAPONń^0 - zmiana strony",
		"^7".."CUSTOM1^0 - wyjść z menu pomocy"
	},
	["HUD_MMHELP"]={
		{
			"^7Witaj w ^5Tajemnicy Morderstw^7!",
			"^7Interpretacji popularnej gry multiplayer w SRB2!^0\n",
			"Celem gry jest znalezienie i wyeliminowanie wszystkich ^5Morderców^0 zanim zabiją ^3wszystkich innych^0. Ten typ gry jest podobny do MATCH, więc musisz umieć dobrze strzelać i celować się.",
			"Będziesz potrzebować kilku podstaw....",
			"\nNa początku każdej rundy dostaniesz ^Brole^0 która dyktuje co masz robić w grze. To są 3 mozliwe ^Brole^0 które możesz dostać:",
			" * ^5Morderca^0 - Prawdziwy kryminalista - ma zabić wszystkich.",
			" * ^4Szeryf^0   - Jego zadaniem jest znalezienie i wyeliminowanie ^5Morderców^0.",
			" *^3 Cywil^0 - Kompletnie bezbronny cywil, musi nie zostać zabity i pomóc w znalezieniu ^5Mordercy^0. W zależności od ustawień gry,^3 Cywili^0 mogą posiadać Czerwony Ring dla samoobrony jeżeli będą posiadać 100 i więcej ringów (dla niektórych postaci starczy 50 ringów).",
			"\nTo jest cala niezbędna informacja do gry, jeśli nadal czegoś nie wiesz lub chcesz dowiedzieć się więcej zachęcamy do przeczytania tego podręcznika do końca"
		},
		{
			"^7O sytuacjach w grze^0\n",
			"Jak wyjaśniono wcześniej, cełem gry jest wyeliminowanie wszystkich ^5Morderców^0, ale róBFne sytuacje mogą zastać:",
			"\n* Jeśli umrzesz - staniesz się ^FMartwym^0. Gracze w tym stanie nie mogą się odnawiać a także rozmawiać w globalnym czacie, twoje wiadomości są widoczne tylko dla innych ^FMartwych^0 graczy.",
			"Nie możesz też używać ^7SAYTO^0 lub PW do osoby która jest żywa.",
			"Śmierć od takich zagrożeń jak rozdrabiarka, przepaśE6 lub utonięcie w wodzie tak samo zrobią cię ^FMartwym^0 do końca rundy.",
			"Ważne! - ^2NIE PRÓBUJ ZMIENIAĆ SWEGO IMIENIA GRACZA PÓKI JESTEŚ ^FMARTWY!^0 Więcej opisu o tym jest na następnej stronie.",
			"\n* Obowiązkiem ^4Szeryfa^0 jest wyeliminowanie wszystkich ^5Morderców^0, ale trzeba być bardzo ostrożnym żeby przypadkiem nie zabić^3 Cywilnną osobę^0.",
			"Jeśli ^4Szeryf^0 zabije^3 Cywilnego^0 gracza to stanie się cywilem i inny^3 Cywil^0 po cichu przejmie jego ^Brolę^0. Jak będziesz strzelać jako ^4Szeryf^0 pomyśl dwukrotnie kogo zabijasz!",
			"\n* Kiedy ^5Morderca^0 zabije ^4Szeryfa^0 i zostaną żywi^3 Cywili^0 wtedy ^4Szeryf^0 upuści ^4Szmaragd Szeryfa^0 obok jego ciała.",
			"W przeciwieństwie do Szmaragdów Chaosu, ten Szmaragd daje ^Brole^2 Bohatera^0 do^3 Cywila^0 który go pierwszy podniósł.^2 Bohaterzy^0 są podobni do ^4Szeryfów^0 ale mają pewne róBFnice:",
			"  - Jeśli^2 Bohater^0 zabija^3 Cywilnego^0 to oboje umierają i ich ^Brole^0 nie są ponownie pzydzielane;",
			"  -^2 Bohaterzy^0 nie upuszczają jakiegokolwiek Szmaragdu przy śmierci.",
			"\n* Zależnie od ilosci graczy, może być więcej niż jeden ^5Morderców^0 i ^4Szeryfów^0 wśród graczy w grze. Wtedy tworzą się^A drużyny^0 ^5Morderców^0 i ^4Szeryfów^0.",
			"^AWspółnicy^0 mogą komunikować ze sobą w drużyną za pomocą polecenia ^7SAYTEAM^0 (przycisk SAYTEAM będzie dzialał tak samo jak normalny czat) albo zacząE6 swoje powiadomnienie ze znaku ^8%^0 który spowoduje wysłanie wiadomości do czatu drużyny.",
			"Jeśli jeden ^Awspólnik^0 strzeli drugiego to dostanie wiadomość żeby nie strzelal do współnika. Pamiętaj że inni mogą zobaczyć waszą interakcje i dowiedzieć się kim jesteście!"
		},
		{
			"^7Rzeczy których należy unikać ^7w ^5Tajemnicy ^5Morderstw^0\n",
			"Zasada numer 1 każdej gry:^2 Bądź miły i się baw!^0 Oprócz tego...",
			"* Nie ujawniaj swojej roli innym, nawet dla żartu. Wypowiedzenie swojej ^BRoli^0 sprawi że gra nie będzie już \'Tajemnicą\'. Możesz wypowiedzieć ^Brole^0 kogoś innego jak jesteś pewny, ale nigdy swojej.",
			"* Unikaj obrażania innych graczy. Przyjazne żarty są w porządku, ale ciągłe oskarżenia lub wrogie zachowanie sprawią, że inni przestaną ci ufać.",
			"* Nie odchodź od klawiatury (AFK). Jeśli nie będziesz się ruszal przez dluzszy czas zostaniesz wygnany z gry (tylko jeśli żyjesz).",
			"* Nie zmieniaj swego imienia gracza póki jesteś Martwy(a) - gra jest bardzo ścisła i ^5wyrzuci^0 ci z gry jeżeli to zrobisz. Po prostu zaczekaj na ekran zakończenia rundy żeby znów bezpiecznie zmieniać imię.",
			"* Unikaj obozowania w pobliżu Szmaragdu Szeryfa, jeśli jesteś Mordercą. Stanie w pobliżu Szmaragdu przez 30 sekund spowoduje wyrzucenie z gry.",
			"Złamanie tych zasad może spowodować że zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie łamać i grać fer."
		},
		{
			"^7Przydatne porady^0\n",
			"Zebraliśmy kilka porad którzy mogą przydać ci w twojej grze w ^5TM^0:",
			"\n* Jeżeli zdolności postaci są wyłączone administratorem, zaciśnij ^7SPIN^0 żeby skradać się ukradkiem i nie zostawiać za sobą śladów.",
			"\n* Kiedy podniesiesz ^4Szmaragd ^4Szeryfa^0 będziesz mieć dostęp do każdej broni i ringów, którzy zebraleś uprzednio.",
			"\n* Użyj polecenia ^7SAYTEAM^0, aby koordynować działania z członkami drużyny i uniknąE6 strzału od sojusznika. Rozpoczęcie wiadomości od symbola ^8%^0 spowoduje że wiadomośE6 będzie automatycznie wyslana do członków drużyny.",
			"\n* Możesz zostać zraniony przez przeszkody takie jak lawa, kolce i ogień żeby dostać effekt niezwycięzości na 3 sekundy.",
			"\n* Spróbuj znaleźE6 miejsce dla kryjówke na mapie. Czasami, pomaga to pozbyć się niechcianej publiczności.",
			"\n* Jeżeli twoja ^Brola^0 przestanie być tajemnicą, możesz zmienić swoje imię i zmienić swój kolor postaci. ^2Pamiętaj że zmiana imienia będzie widoczna w czacie^0.",
			"\n* Przycisk^7 FIRENORMAL^0 pozwala wykorzystywać NóBF wszędzie, jak masz Ringi. Także, NóBF nie robi dzwięków ataku jeżeli skradzasz się."
		}
	}
})
