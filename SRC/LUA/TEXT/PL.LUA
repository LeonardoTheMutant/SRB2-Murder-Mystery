-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- POLISH
-- Made by LeonardoTheMutant

MM.AddLang("PL", {
	["LANGUAGE"]="Polski",
	["VERSION"]="1.3",
	["AUTHOR"]="LeonardoTheMutant",
	["CHAT_ROLE_MURDERER"]={
		["ROLEGET_PM"]="Jesteś ^5Mordercą^0! ^5Zamorduj wszystkich.",
		["NEWROLEGET_PM"]="^7Życie zrobilo z ciebie ^5Morderce^7, ^5teraz idz wszystkich zabić.",
		["KILLED"]={
			"Morderca",
			"został wyeliminowany!"
		},
		["ONEQUIT"]="Jeden z ^5Morderców^0 wyszedł z gry!",
		["LESTQUIT"]="Ostatni ^5Morderca^0 wyszedł z gry!",
		["REPLACEQUIT"]="^5Morderca^0 wyszedł z gry! Jeden z ^3Cywilów^0 zdobył jego rolę!"
	},
	["CHAT_ROLE_SHERIFF"]={
		["ROLEGET_PM"]="Jesteś ^4Szeryfem^0! ^4Wyeliminuj wszystkich Morderców^0. Jeśli zabijesz Ciwila, stracisz role.",
		["NEWROLEGET_PM"]="^7Świat sprawił cię nowym ^4Szeryfem^7! To teraz twoja robota ^4wyeliminować wszystkich Morderców^7!",
		["KILLED"]={
			"Szeryf",
			"został zamordowany!",
			"Znajdź zgubiony ^4Szmaragd Szeryfa^0!"
		},
		["ONEQUIT"]="Jeden z ^4Szeryfów^0 wyszedł z gry!",
		["LASTQUIT"]="Ostatni ^4Szeryf^0 wyszedł z gry!",
		["REPLACEQUIT"]="^4Szeryf^0 wyszedł z gry! Jeden z ^3Cywilów^0 zdobył jego rolę!",
	},
	["CHAT_ROLE_CIVILIAN"]={
		["ROLEGET_PM"]="Jesteś ^3Cywilem^0! ^3Kryj się i pomóż w dochodzeniu^0."
	},
	["CHAT_ROLE_HERO"]={
		["NEWROLEGET_PM"]="^7Wszyscy obroncy odeszli ale swiat sprawil cie nowym^2 Bohaterem^7! To twoja szansa uratowac dzien!",
		["RANKUP_PM"]="^7Wyeliminowales jednego z ^5Morderc^7! Zostales awansowany na^2 Bohatera^7!",
		["KILLED"]={
			"Bohater",
			"został zamordowany!"
		},
		["ONEQUIT"]="Jeden z ^2Bohaterów^0 zostawił nas!",
		["LASTQUIT"]="Ostatni ^2Bohater^0 wyszedł z gry!",
		["REPLACEQUIT"]="^2Bohater^0 wyszedł z gry! Jeden z ^3Cywilów^0 zdobył jego rolę!"
	},
	["CHAT_ROLE_JESTER"]={
		["ROLEGET_PM"]="Jesteś ^1Błaznem^0! Przekonaj wszystkich że jesteś ^5Mordercą^0. ^1Musisz umrzeć od dobrych ludzi^0."
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Ten gracz jest twoim wspólnikiem, natepnym razem nie próbuj zabiać ich ponownie",
		"Twój wspólnik cię zaatakował, nie próbuj się mścić"
	},
	["CHAT_DIEDHAZARD"]="zginał(eła) w nieszczesnym wypadku.",
	["CHAT_SHREMDPICKUP"]="Ktoś podniosł ^4Szmaragd Szeryfa^0...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"^7Zamordowaleś ^3Cywilnego^7! Nie jesteś już ^4Szeryfem^7!",
		"^2Bohaterowie nie są po to, żeby zabijać ^3Cywilów^7! Masz za to karę śmierci.",
		"^7O nie! Zamordowaleś ^4Szeryfa^7! Masz za to karę śmierci!",
		"^7Zabileś takiego samego ^3Cywilnego^7 gracza jak i ty! Masz za to karę śmierci!",
		"^7O nie! Zamordowaleś ^2Bohatera^7! Masz za to karę śmierci!"
	},
	["CHAT_INNOHURT"]={
		"^4Szeryfie^0, zamordowaleś Cywila! Ktoś z ^3Cywłów^0 musi dokonczyć robotę!",
		"^2Bohater^0 zabił ^3Cywilnego^0 gracza. Teraz obydwoje nie zyją. Wstyd dla bohatera"
	},
	["CHAT_ENDROUND"]={
		"Wszyscy zostali zamordowani, ^5Mordercy^0 wygrywają!",
		"Wszyscy Mordercy zostali wyeliminowani, ^3Cywile^0 wygrywają!",
		"^5Mordercy^0 wygrywają, ponieważ ^4Szeryf^0 zamordował ostatniego ^3Cywila^0!",
		"^2Bohater^0 wybrał do zabicia ostatniego ^3Cywila^0. ^5Moredrcy^0 wygrywają!",
		"Wszyscy Szeryfi i Bohaterzy zgineły, ^5Mordercy^0 wygrywają!"
	},
	["HUD_MM"]="Tajemnica Morderstwa",
	["HUD_ROLES"]={
		["MURDERER"]="MORDERCA",
		["SHERIFF"]="SZERYF",
		["CIVILIAN"]="CYWIL",
		["HERO"]="BOHATER",
		["JESTER"]="BŁAZEN",
		["DEAD"]="MARTWY"
	},
	["HUD_SUSPECTS"]="Podejrzani",
	["HUD_VICTIMS"]="Ofiary",
	["HUD_TEAMMATES"]="Członkowie drużyny",
	["HUD_KILLEDBY"] = {
		"Zabity przez",
		"sprawiedliwość",
		"pułapkę na mapie"
	},
	["HUD_SCORESTAB"]="Jeśli ten tryb jest ci nowy użyj komendy ^7MMHELP^0 w Konsoli dla pomocy i ^7MMLANG^0 dla zmiany języka tutaj\n\n^2Baw się dobrze ;)",
	["HUD_ROLETARGET"] = {
		["MURDERER"]="Zamorduj wszystkich.",
		["SHERIFF"]="Wyeliminuj wszystkich Morderców. Nie zabijaj Ciwilów!",
		["CIVILIAN"]="Kryj się i pomóż w dochodzeniu, kiedy jest to możliwe.",
		["HERO"]="Masz szansę powstrzymać wszystkich Morderców. Ruszaj i uratuj dzień, ale bądź ostrożny!",
		["JESTER"]="Przekonaj wszystkich że jesteś złą osobą. Ty nikomu nie zaszkodzisz, jeśli nie masz Bohatera"
	},
	["HUD_ROLESALIVE"]={
		"Morderców",
		"Szeryfów",
		"Cywilów"
	},
	["HUD_DEAD"]="Jesteś ^Fmartwy(a)\nNie mozesz się odnawiać lub gadać do żywych",
	["HUD_MIDJOIN"]="Pan(i) dolaczył(a) się ^4w środku rundy^0, prosze poczekać na nową rundę żeby zagrać.\nPodczas oczekiwania prosimy o zapoznanie się z regulami gry w poleceniu konsoli ^7MMHELP^0",
	["HUD_ALONE"]="^42 graczy^0 jest wymaganych do gry,\nprosze poczekać na ^4jeszcze jednego^0 gracza dla startu",
	["HUD_SNEAKING"]="Skradzamy się...",
	["HUD_SHOWDOWN"]="Pojedynek!",
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
		["TIE"]="REMIS!",
		["BAD"]="^5MÓRDERCY",
		["GOOD"]="^3CYWILE",
		["JESTER"]="^1BŁAZEN"
	},
	["HUD_PAST"]="PRZESZLOŚĆ",
	["HUD_FUTURE"]="PRZYSZLOŚĆ",
	["HUD_MMHELP_UI"]={
		"^7UP^0/^7DOWN^0 - scrolling strony, ^7LEFT^0/^7RIGHT^0 - zmiana strony",
		"Jakakolwiek klawisza ^7CUSTOM^0 - wyjść z menu pomocy"
	},
	["HUD_MMHELP"]={
		{
			"^7Witaj w Tajemnicy Morderstw!",
			"Interpretacji popularnej gry multiplayer w SRB2!^0\n",
			"Celem gry jest znalezienie i wyeliminowanie wszystkich ^5Morderców^0 zanim zabiją ^3wszystkich innych^0. Ten typ gry jest podobny do MATCH, więc musisz umieć dobrze strzelać i celować się.",
			"Będziesz potrzebować kilku podstaw....",
			"\nNa początku każdej rundy dostaniesz ^Brole^0 która dyktuje co masz robić w grze. To są 3 mozliwe ^Brole^0 które możesz dostać:",
			" * ^5Morderca^0 - Prawdziwy kryminalista - ma zabić wszystkich.",
			" * ^4Szeryf^0 - Jego zadaniem jest znalezienie i wyeliminowanie ^5Morderców^0.",
			" * ^3Cywil^0 - Kompletnie bezbronny cywil, musi nie zostać zabity i pomóc w znalezieniu ^5Mordercy^0. W zależności od ustawień gry, ^3Cywili^0 mogą posiadać Czerwony Ring dla samoobrony jeżeli będą posiadać 100 i więcej ringów (dla niektórych postaci starczy 50 ringów).",
			"\nTo jest cala niezbędna informacja do gry, jeśli nadal czegoś nie wiesz lub chcesz dowiedzieć się więcej zachęcamy do przeczytania tego podręcznika do końca"
		},
		{
			"^7O sytuacjach w grze^0\n",
			"Jak wyjaśniono wcześniej, cełem gry jest wyeliminowanie wszystkich ^5Morderców^0, ale różne sytuacje mogą zastać:",
			"\n* Jeśli umrzesz - staniesz się ^FMartwym^0. Gracze w tym stanie nie mogą się odnawiać a także rozmawiać w globalnym czacie, twoje wiadomości są widoczne tylko dla innych ^FMartwych^0 graczy.",
			"Nie możesz też używać ^7SAYTO^0 lub ^8/pm^0 do osoby która jest żywa.",
			"Śmierć od takich zagrożeń jak rozdrabiarka, przepaśE6 lub utonięcie w wodzie tak samo zrobią cię ^FMartwym^0 do końca rundy.",
			"Ważne! - ^2NIE PRÓBUJ ZMIENIAĆ SWEGO IMIENIA GRACZA PÓKI JESTEŚ ^FMARTWY!^0 Więcej opisu o tym jest na następnej stronie.",
			"\n* Obowiązkiem ^4Szeryfa^0 jest wyeliminowanie wszystkich ^5Morderców^0, ale trzeba być bardzo ostrożnym żeby przypadkiem nie zabić ^3Cywilnną osobę^0.",
			"Jeśli ^4Szeryf^0 zabije ^3Cywilnego^0 gracza to stanie się cywilem i inny ^3Cywil^0 po cichu przejmie jego ^Brolę^0. Jak będziesz strzelać jako ^4Szeryf^0 pomyśl dwukrotnie kogo zabijasz!",
			"\n* Kiedy ^5Morderca^0 zabije ^4Szeryfa^0 i zostaną żywi ^3Cywili^0 wtedy ^4Szeryf^0 upuści ^4Szmaragd Szeryfa^0 obok jego ciała.",
			"W przeciwieństwie do Szmaragdów Chaosu, ten Szmaragd daje ^Brole^2 Bohatera^0 do^3 Cywila^0 który go pierwszy podniósł. ^2Bohaterzy^0 są podobni do ^4Szeryfów^0 ale mają pewne różnice:",
			" - Jeśli ^2Bohater^0 zabije ^3Cywilnego^0 to oboje umrą, a ich ^Brole^0 nie będą pzydzielone innym;",
			" - ^2Bohaterzy^0 nie upuszczają jakiegokolwiek Szmaragdu przy śmierci.",
			"\n* Zależnie od ilosci graczy, może być więcej niż jeden ^5Morderców^0 i ^4Szeryfów^0 wśród graczy w grze. Wtedy tworzą się^A drużyny^0 ^5Morderców^0 i ^4Szeryfów^0.",
			"^AWspółnicy^0 mogą komunikować ze sobą w drużyną za pomocą polecenia ^7SAYTEAM^0 albo korzystając z czatu drużynowego (przycisk '^8y^0' na klawiaturze).",
			"Jeśli jeden ^Awspólnik^0 strzeli drugiego to dostanie wiadomość żeby nie strzelal do współnika. Pamiętaj że inni mogą zobaczyć waszą interakcje i dowiedzieć się kim jesteście!"
		},
		{
			"^7Rzeczy których należy unikać w Tajemnicy Morderstw^0\n",
			"Zasada numer 1 każdej gry: ^2Bądź miły i się baw!^0 Oprócz tego...",
			"* Nie ujawniaj swojej roli innym, nawet dla żartu. Wypowiedzenie swojej ^BRoli^0 sprawi że gra nie będzie już \'Tajemnicą\'. Możesz wypowiedzieć ^Brole^0 kogoś innego jak jesteś pewny, ale nigdy swojej.",
			"* Unikaj obrażania innych graczy. Przyjazne żarty są w porządku, ale ciągłe oskarżenia lub wrogie zachowanie sprawią, że inni przestaną ci ufać.",
			"* Nie odchodź od klawiatury (^8AFK^0). Jeśli nie będziesz się ruszal przez dluzszy czas zostaniesz wygnany z gry (tylko jeśli żyjesz).",
			"* Nie zmieniaj swego imienia gracza póki jesteś Martwy(a) - gra jest bardzo ścisła i ^5wyrzuci^0 ci z gry jeżeli to zrobisz. Po prostu zaczekaj na ekran zakończenia rundy żeby znów bezpiecznie zmieniać imię.",
			"* Unikaj obozowania w pobliżu Szmaragdu Szeryfa, jeśli jesteś Mordercą. Stanie w pobliżu Szmaragdu przez 30 sekund spowoduje wyrzucenie z gry.",
			"Złamanie tych zasad może spowodować że zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie łamać i grać fer."
		},
		{
			"^7Przydatne porady^0\n",
			"Zebraliśmy kilka porad którzy mogą przydać ci w twojej grze:",
			"\n* Jeżeli zdolności postaci są wyłączone administratorem, zaciśnij ^7SPIN^0 żeby skradać się ukradkiem i nie zostawiać za sobą śladów.",
			"\n* Kiedy podniesiesz ^4Szmaragd Szeryfa^0 będziesz mieć dostęp do każdej broni i ringów, którzy zebraleś uprzednio.",
			"\n* Używaj Czatu Drużynowego, aby koordynować działania z ^Aczłonkami drużyny^0 i uniknąć strzału od sojusznika.",
			"\n* Możesz zostać zraniony przez przeszkody takie jak lawa, kolce i ogień żeby dostać effekt niezwycięzości na 3 sekundy.",
			"\n* Spróbuj znaleźć miejsce dla kryjówke na mapie. Czasami, pomaga to pozbyć się niechcianej publiczności.",
			"\n* Jeżeli twoja ^Brola^0 przestanie być tajemnicą, możesz zmienić swoje imię i zmienić swój kolor postaci. ^2Pamiętaj że zmiana imienia będzie widoczna w czacie^0.",
			"\n* Przycisk ^7FIRENORMAL^0 pozwala wykorzystywać Nóż wszędzie, jak masz Ringi. Także, Nóż nie robi dzwięków ataku jeżeli skradzasz się."
		}
	},
	["IMG_VICTIMS"]={palette={{73, 31}},image={
		"  00001  0000001 001  00001  000001",
		" 0000001 0000001 001 0000001 0000001",
		" 0011001 0011111 001 0011001 0011001",
		" 001 001 001     001 001 001 001 001",
		" 001 001 0000001 001 0000001 000001",
		"001 001 0000001 001 0000001 000001",
		"001 001 0011111 001 0011001 0011001",
		"001 001 001     001 001 001 001 001",
		"0000001 001     001 001 001 001 001",
		"100001  001     001 001 001 001 001",
		" 1111   111     111 111 111 111 111"
	}},
	["IMG_SUSPECTS"]={palette={{73, 31}},image={
		" 000001   00001  000001  0000001     001 000001  0000001  00001  001   001 001 001  00001  001 001",
		" 0000001 0000001 0000001 0000001     001 0000001 0000001 0000001 001   001 001 001 0000001 001 001",
		" 0011001 0011001 0011001 0011111     001 0011001 1111001 0011001 000   001 001 001 0011001 001 001",
		" 001 001 001 001 001 001 001         001 001 001    0001 001 001 0000  001 001 001 001 001 001 001",
		" 0000001 001 001 001 001 0000001     001 0000001   0001  0000001 00000 001 0000001 001 111 0000001",
		"0000011 001 001 001 001 0000001     001 000001    0001  0000001 000000001  100001 001     0000001",
		"00111   001 001 001 001 0011111 001 001 001 001  0001   0011001 001000001   11001 001 001 0011001",
		"001     001 001 001 001 001     001 001 001 001 0001    001 001 001100001     001 001 001 001 001",
		"001     0000001 0000001 0000001 0000001 001 001 0000001 001 001 001 10001 0000001 0000001 001 001",
		"001     100001  000001  0000001 100001  001 001 0000001 001 001 001  1001 000001  100001  001 001",
		"111      1111   11111   1111111  1111   111 111 1111111 111 111 111   111 11111    1111   111 111"
	}},
	["IMG_TIME"]={palette={{73, 31},{37, 31}},image={
		"  00001  0000001  00001   00001",
		" 0000001 0000001  00001  0000001",
		" 0011001 1111001 0011001 0011001",
		" 001 001    0001 001 001 000111",
		" 001 111   00001 0000001 10001",
		"001      000011 0000001  10001",
		"001 001 000011  0011001   10001",
		"001 001 00011   001 001 0011001",
		"0000001 0000001 001 001 0000001",
		"100001  0000001 001 001 1000011",
		" 1111   1111111 111 111  1111"
	}},
	["IMG_RINGS"]={palette={{73, 31},{37, 31}},image={
		" 000001   001  001   001  00001  001",
		" 0000001  001  001   001 0000001 001",
		" 0011001  001  000   001 0011001 001",
		" 001 001  001  0000  001 001 001 001",
		" 0000011  001  00000 001 001 111 001",
		"000001   001  001000001 0010001 001",
		"001 001  001  001100001 0010001 001",
		"001 001  001  001 10001 001 001 001",
		"001 001  001  001  1001 0000001 001",
		"001 001  001  001   001  00001  001",
		"111 111  111  111   111  1111   111"
	}}
})
