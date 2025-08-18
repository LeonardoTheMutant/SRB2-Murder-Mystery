-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- POLISH
-- Made by LeonardoTheMutant

MM.AddLang("PL", {
	["VERSION"]="1.3",
	["AUTHOR"]="LeonardoTheMutant",
	["CHAT_MMLANG"]={
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
	["BMP_VICTIMS"]={
		"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1F",
		"II\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1F",
		"II\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\x1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F"
	},
	["BMP_SUSPECTS"]={
		"\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFIII\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIII\xFFII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\x1F",
		"IIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFFF\xFFFFII\x1FFFIIIII\x1FFF\xFFFF\xFFIII\x1FFF\xFFIIIIII\x1FFFIIIIIIII\x1FFF\xFF1FIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1F",
		"II\x1F1F\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1F1FII\x1FFFII\x1FIIIII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1F",
		"II\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FIIII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"II\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1FIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"II\x1FFF\xFFFF\xFFFF\x1FIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFF1FII\x1FFFIIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFFII\x1F",
		"\x1F1F\x1FFF\xFFFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F"
	},
	["BMP_TIME"]={
		"\xFFFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFF\xFFIIII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1F",
		"\xFFII\x1F1FII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
		"\xFFII\x1FFF\x1F1F\x1FFF\xFFFFIIII\x1FFFIIIIII\x1FFF\x1FIII\x1F",
		"II\x1FFF\xFFFF\xFFFF\xFFIIII\x1F1F\xFFIIIIII\x1FFF\xFF1FIII\x1F",
		"II\x1FFFII\x1FFFIIII\x1F1F\xFFFFII\x1F1FII\x1FFF\xFFFF\x1FIII\x1F",
		"II\x1FFFII\x1FFFIII\x1F1F\xFFFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1F",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1F",
		"\x1FIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1F\xFF\x1FIIII\x1F\x1F",
		"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F"
	},
	["BMP_RINGS"]={
		"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1F",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1F",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFII\x1F",
		"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFFII\x1F",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFFII\x1F",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1F\xFFII\x1FFFII\x1FFFII\x1F",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFII\x1F",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFII\x1F",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F"
	},
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
		"komendy \1\x87MMHELP\4 w Konsoli dla pomocy",
		"i \1\x87MMLANG\4 dla zmiany języka tutaj",
		"",
		"",
		"\1\x82".."Baw się dobrze ;)"
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
		"Jesteś\1\x8F martwy(a)",
		"Nie mozesz się odnawiać lub gadać do żywych"
	},
	["HUD_MIDJOIN"]={
		"Pan(i) dolaczył(a) się \1\x84w środku rundy\4, prosze poczekać na nową rundę żeby zagrać.",
		"Podczas oczekiwania prosimy o zapoznanie się z regulami gry w poleceniu konsoli \1\x87MMHELP\4"
	},
	["HUD_ALONE"]={
		"\1\x84".."2 graczy\4 jest wymaganych do gry,",
		"proszę poczekać na \1\x84jeszcze jednego\4 gracza",
		"dla startu"
	},
	["HUD_SNEAKING"]="Skradzamy się...",
	["HUD_SHOWDOWN"]="Pojedynek losu!",
	["HUD_MINIGAME"]={
		["PRESS"] = "Naciśnij\1\x82 CUSTOM3\4, aby", --must contain MM escape color codes
		["LEAVE"]="opuścić grę",
		["CANCEL"]="anulować",
		["SPECTATE"]="oglądać",
		["DUEL"]="za pojedynkiem w minigrzę",
		["REQUEST"]="zagrać w \1\x87PONG\4 z przeciwnikiem", --must contain MM escape color codes
		["START"]="zagrać w \1\x87SONIC RUN", --must contain MM escape color codes
		["ACCEPT"]="zaakceptować zaproszenie w \1\x87PONG\4!", --must contain MM escape color codes
		["WAIT"]="Czekamy na odpowiedź przeciwnika...",
		["SPECTATING"]="Oglądamy za pojedynkiem...",
		["BORED"]="Nudzisz się?",
		["GOAL"]="Gol!"
	},
	["HUD_YOU"]="TY",
	["HUD_WINNERS"]="Wygrani:",
	["HUD_WIN"]={
		"REMIS!",
		"\1\x85MÓRDERCY",
		"\1\x83".."CYWILE"
	},
	["HUD_PAST"]="PRZESZLOŚĆ",
	["HUD_FUTURE"]="PRZYSZLOŚĆ",
	["HUD_MMHELP_UI"]={
		"Dla scrollingu wciśnij klawiszę \1\x87JUMP\4/\1\x87SPIN\4, żeby zmienić stronę wciśnij \1\x87NEXT\4/\1\x87PREV WEAPONń\4",
		"\1\x87".."CUSTOM1\4 - wyjść z menu pomocy"
	},
	["HUD_MMHELP"]={
		{
			"\1\x87Witaj w \1\x85Tajemnicy Morderstw\1\x87!",
			"\1\x87Interpretacji popularnej gry multiplayer w SRB2!\4\n",
			"Celem gry jest znalezienie i wyeliminowanie wszystkich \1\x85Morderców\4 zanim zabiją \1\x83wszystkich innych\4. Ten typ gry jest podobny do MATCH, więc musisz umieć dobrze strzelać i celować się.",
			"Będziesz potrzebować kilku podstaw....",
			"\nNa początku każdej rundy dostaniesz \1\x8Brole\4 która dyktuje co masz robić w grze. To są 3 mozliwe \1\x8Brole\4 które możesz dostać:",
			" * \1\x85Morderca\4 - Prawdziwy kryminalista - ma zabić wszystkich.",
			" * \1\x84Szeryf\4   - Jego zadaniem jest znalezienie i wyeliminowanie \1\x85Morderców\4.",
			" *\1\x83 Cywil\4 - Kompletnie bezbronny cywil, musi nie zostać zabity i pomóc w znalezieniu \1\x85Mordercy\4. W zależności od ustawień gry,\1\x83 Cywili\4 mogą posiadać Czerwony Ring dla samoobrony jeżeli będą posiadać 100 i więcej ringów (dla niektórych postaci starczy 50 ringów).",
			"\nTo jest cala niezbędna informacja do gry, jeśli nadal czegoś nie wiesz lub chcesz dowiedzieć się więcej zachęcamy do przeczytania tego podręcznika do końca"
		},
		{
			"\1\x87O sytuacjach w grze\4\n",
			"Jak wyjaśniono wcześniej, cełem gry jest wyeliminowanie wszystkich \1\x85Morderców\4, ale róBFne sytuacje mogą zastać:",
			"\n* Jeśli umrzesz - staniesz się \1\x8FMartwym\4. Gracze w tym stanie nie mogą się odnawiać a także rozmawiać w globalnym czacie, twoje wiadomości są widoczne tylko dla innych \1\x8FMartwych\4 graczy.",
			"Nie możesz też używać \1\x87SAYTO\4 lub PW do osoby która jest żywa.",
			"Śmierć od takich zagrożeń jak rozdrabiarka, przepaśE6 lub utonięcie w wodzie tak samo zrobią cię \1\x8FMartwym\4 do końca rundy.",
			"Ważne! - \1\x82NIE PRÓBUJ ZMIENIAĆ SWEGO IMIENIA GRACZA PÓKI JESTEŚ \1\x8FMARTWY!\4 Więcej opisu o tym jest na następnej stronie.",
			"\n* Obowiązkiem \1\x84Szeryfa\4 jest wyeliminowanie wszystkich \1\x85Morderców\4, ale trzeba być bardzo ostrożnym żeby przypadkiem nie zabić\1\x83 Cywilnną osobę\4.",
			"Jeśli \1\x84Szeryf\4 zabije\1\x83 Cywilnego\4 gracza to stanie się cywilem i inny\1\x83 Cywil\4 po cichu przejmie jego \1\x8Brolę\4. Jak będziesz strzelać jako \1\x84Szeryf\4 pomyśl dwukrotnie kogo zabijasz!",
			"\n* Kiedy \1\x85Morderca\4 zabije \1\x84Szeryfa\4 i zostaną żywi\1\x83 Cywili\4 wtedy \1\x84Szeryf\4 upuści \1\x84Szmaragd Szeryfa\4 obok jego ciała.",
			"W przeciwieństwie do Szmaragdów Chaosu, ten Szmaragd daje \1\x8Brole\1\x82 Bohatera\4 do\1\x83 Cywila\4 który go pierwszy podniósł.\1\x82 Bohaterzy\4 są podobni do \1\x84Szeryfów\4 ale mają pewne róBFnice:",
			"  - Jeśli\1\x82 Bohater\4 zabija\1\x83 Cywilnego\4 to oboje umierają i ich \1\x8Brole\4 nie są ponownie pzydzielane;",
			"  -\1\x82 Bohaterzy\4 nie upuszczają jakiegokolwiek Szmaragdu przy śmierci.",
			"\n* Zależnie od ilosci graczy, może być więcej niż jeden \1\x85Morderców\4 i \1\x84Szeryfów\4 wśród graczy w grze. Wtedy tworzą się\1\x8A drużyny\4 \1\x85Morderców\4 i \1\x84Szeryfów\4.",
			"\1\x8AWspółnicy\4 mogą komunikować ze sobą w drużyną za pomocą polecenia \1\x87SAYTEAM\4 (przycisk SAYTEAM będzie dzialał tak samo jak normalny czat) albo zacząE6 swoje powiadomnienie ze znaku \1\x88%\4 który spowoduje wysłanie wiadomości do czatu drużyny.",
			"Jeśli jeden \1\x8Awspólnik\4 strzeli drugiego to dostanie wiadomość żeby nie strzelal do współnika. Pamiętaj że inni mogą zobaczyć waszą interakcje i dowiedzieć się kim jesteście!"
		},
		{
			"\1\x87Rzeczy których należy unikać \1\x87w \1\x85Tajemnicy \1\x85Morderstw\4\n",
			"Zasada numer 1 każdej gry:\1\x82 Bądź miły i się baw!\4 Oprócz tego...",
			"* Nie ujawniaj swojej roli innym, nawet dla żartu. Wypowiedzenie swojej \1\x8BRoli\4 sprawi że gra nie będzie już \'Tajemnicą\'. Możesz wypowiedzieć \1\x8Brole\4 kogoś innego jak jesteś pewny, ale nigdy swojej.",
			"* Unikaj obrażania innych graczy. Przyjazne żarty są w porządku, ale ciągłe oskarżenia lub wrogie zachowanie sprawią, że inni przestaną ci ufać.",
			"* Nie odchodź od klawiatury (AFK). Jeśli nie będziesz się ruszal przez dluzszy czas zostaniesz wygnany z gry (tylko jeśli żyjesz).",
			"* Nie zmieniaj swego imienia gracza póki jesteś Martwy(a) - gra jest bardzo ścisła i \1\x85wyrzuci\4 ci z gry jeżeli to zrobisz. Po prostu zaczekaj na ekran zakończenia rundy żeby znów bezpiecznie zmieniać imię.",
			"* Unikaj obozowania w pobliżu Szmaragdu Szeryfa, jeśli jesteś Mordercą. Stanie w pobliżu Szmaragdu przez 30 sekund spowoduje wyrzucenie z gry.",
			"Złamanie tych zasad może spowodować że zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie łamać i grać fer."
		},
		{
			"\1\x87Przydatne porady\4\n",
			"Zebraliśmy kilka porad którzy mogą przydać ci w twojej grze w \1\x85TM\4:",
			"\n* Jeżeli zdolności postaci są wyłączone administratorem, zaciśnij \1\x87SPIN\4 żeby skradać się ukradkiem i nie zostawiać za sobą śladów.",
			"\n* Kiedy podniesiesz \1\x84Szmaragd \1\x84Szeryfa\4 będziesz mieć dostęp do każdej broni i ringów, którzy zebraleś uprzednio.",
			"\n* Użyj polecenia \1\x87SAYTEAM\4, aby koordynować działania z członkami drużyny i uniknąE6 strzału od sojusznika. Rozpoczęcie wiadomości od symbola \1\x88%\4 spowoduje że wiadomośE6 będzie automatycznie wyslana do członków drużyny.",
			"\n* Możesz zostać zraniony przez przeszkody takie jak lawa, kolce i ogień żeby dostać effekt niezwycięzości na 3 sekundy.",
			"\n* Spróbuj znaleźE6 miejsce dla kryjówke na mapie. Czasami, pomaga to pozbyć się niechcianej publiczności.",
			"\n* Jeżeli twoja \1\x8Brola\4 przestanie być tajemnicą, możesz zmienić swoje imię i zmienić swój kolor postaci. \1\x82Pamiętaj że zmiana imienia będzie widoczna w czacie\4.",
			"\n* Przycisk\1\x87 FIRENORMAL\4 pozwala wykorzystywać NóBF wszędzie, jak masz Ringi. Także, NóBF nie robi dzwięków ataku jeżeli skradzasz się."
		}
	}
})
