-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- POLISH
-- Made by LeonardoTheMutant

MM.AddLang("PL", {
    ["VERSION"]="1.1",
	["AUTHOR"]="LeonardoTheMutant",
	["CHARSET"]="1250C", --Windows1250
	["MM"]="Tajemnica Morderstw",
	["MMHELP_CMD"]={
		"Dla scrollingu wci\x9Cnij klawisz\xEA \23JUMP\16/\23SPIN\16, \xBF".."eby zmieni\xE6".."c stron\xEA wci\x9Cnij \23NEXT\16/\23PREV WEAPON\xF1\16",
		"\23CUSTOM1\16 - wyj\x9C\xE6 z menu pomocy"
	},
    ["MMHELP"]={
		{
			"\23Witaj w \21Tajemnicy Morderstw\23!",
			"\23Interpretacji popularnej gry multiplayer w SRB2!\16\n",
			"Celem gry jest znalezienie i wyeliminowanie wszystkich \21Morderc\xF3w\16 zanim zabij\xB9 \19wszystkich innych\16. Ten typ gry jest podobny do MATCH, wi\xEA".."c musisz umie\xE6 dobrze strzela\xE6 i celowa\xE6 si\xeA.",
			"B\xEA".."dziesz potrzebowa\xE6 kilku podstaw....",
			"\nNa pocz\xB9tku ka\xBF".."dej rundy dostaniesz \27role\16 kt\xF3ra dyktuje co masz robi\xE6 w grze. To s\xB9 3 mozliwe \27role\16 kt\xF3re mo\xBF".."esz dosta\xE6:",
			" * \21Morderca\16 - Prawdziwy kryminalista - ma zabi\xE6 wszystkich.",
			" * \20Szeryf\16   - Jego zadaniem jest znalezienie i wyeliminowanie \21Morderc\xF3w\16.",
			" * \19Cywil\16 - Kompletnie bezbronny cywil, musi nie zosta\xE6 zabity i pom\xF3".."c w znalezieniu \21Mordercy\16. W zale\xBFno\x9C".."ci od ustawie\xF1 gry, \19Cywili\16 mog\xB9 posiada\xE6 Czerwony Ring dla samoobrony je\xBF".."eli b\xEA".."d\xB9 posiada\xE6 100 i wi\xEA".."cej ring\xF3w (dla niekt\xF3rych postaci starczy 50 ring\xF3w).",
			"\nTo jest cala niezb\xEA".."dna informacja do gry, je\x9Cli nadal czego\x9C nie wiesz lub chcesz dowiedzie\xE6 si\xEA wi\xEA".."cej zach\xEA".."camy do przeczytania tego podr\xEA".."cznika do ko\xF1".."ca"
		},
        {
			"\23O sytuacjach w grze\16\n",
			"Jak wyja\x9Cniono wcze\x9Cniej, ce\xB3".."em gry jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale r\xF3BFne sytuacje mog\xB9 zasta\xE6:",
			"\n* Je\x9Cli umrzesz - staniesz si\xEA \31Martwym\16. Gracze w tym stanie nie mog\xB9 si\xEA odnawia\xE6 a tak\xBF".."e rozmawia\xE6 w globalnym czacie, twoje wiadomo\x9C".."ci s\xB9 widoczne tylko dla innych \31Martwych\16 graczy.",
			"Nie mo\xBF".."esz te\xBF u\xBFywa\xE6 \23SAYTO\16 lub PW do osoby kt\xF3ra jest \xBFywa.",
			"\x8Cmier\xE6 od takich zagro\xBF".."e\xF1 jak rozdrabiarka, przepa\x9CE6 lub utoni\xEA".."cie w wodzie tak samo zrobi\xB9 ci\xEA \31Martwym\16 do ko\xF1".."ca rundy.",
			"Wa\xBFne! - \18NIE \18PR\xD3".."BUJ \18ZMIENIA\xC6 \18SWEGO \18IMIENIA \18GRACZA \18P\xD3KI \18JESTE\x8C \31MARTWY!\16 Wi\xEA".."cej opisu o tym jest na nast\xEApnej stronie.",
			"\n* Obowi\xB9zkiem \20Szeryfa\16 jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale trzeba by\xE6 bardzo ostro\xBFnym \xBF".."eby przypadkiem nie zabi\xE6 \19Cywilnn\xB9 osob\xEA\16.",
			"Je\x9Cli \20Szeryf\16 zabije \19Cywilnego\16 gracza to stanie si\xEA cywilem i inny \19Cywil\16 po cichu przejmie jego \27rol\xEA\16. Jak b\xEA".."dziesz strzela\xE6 jako \20Szeryf\16 pomy\x9Cl dwukrotnie kogo zabijasz!",
			"\n* Kiedy \21Morderca\16 zabije \20Szeryfa\16 i zostan\xB9 \xBFywi \19Cywili\16 wtedy \20Szeryf\16 upu\x9C".."ci \20Szmaragd Szeryfa\16 obok jego cia\xB3".."a.",
			"W przeciwie\xF1stwie do Szmaragd\xF3w Chaosu, ten Szmaragd daje \27role \18Bohatera\16 do \19Cywila\16 kt\xF3ry go pierwszy podni\xF3s\xB3. \18Bohaterzy\16 s\xB9 podobni do \20Szeryf\xF3w\16 ale maj\xB9 pewne r\xF3BFnice:",
			"  - Je\x9Cli \18Bohater\16 zabija \19Cywilnego\16 to oboje umieraj\xB9 i ich \27role\16 nie s\xB9 ponownie pzydzielane;",
			"  - \18Bohaterzy\16 nie upuszczaj\xB9 jakiegokolwiek Szmaragdu przy \x9Cmierci.",
			"\n* Zale\xBFnie od ilosci graczy, mo\xBF".."e by\xE6 wi\xEA".."cej ni\xBF jeden \21Morderc\xF3w\16 i \20Szeryf\xF3w\16 w\x9Cr\xF3".."d graczy w grze. Wtedy tworz\xB9 si\xEA \26dru\xBFyny\16 \21Morderc\xF3w\16 i \20Szeryf\xF3w\16.",
			"\26Wsp\xF3B3nicy\16 mog\xB9 komunikowa\xE6 ze sob\xB9 w dru\xBFyn\xB9 za pomoc\xB9 polecenia \23SAYTEAM\16 (przycisk SAYTEAM b\xEA".."dzie dziala\xB3 tak samo jak normalny czat) albo zacz\xB9E6 swoje powiadomnienie ze znaku \24%\16 kt\xF3ry spowoduje wys\xB3".."anie wiadomo\x9C".."ci do czatu dru\xBFyny.",
			"Je\x9Cli jeden \26wsp\xF3lnik\16 strzeli drugiego to dostanie wiadomo\x9CE6 \xBF".."eby nie strzelal do wsp\xF3B3nika. Pami\xEAtaj \xBF".."e inni mog\xB9 zobaczy\xE6 wasz\xB9 interakcje i dowiedzie\xE6 si\xEA kim jeste\x9C".."cie!"
		},
        {
			"\23Rzeczy kt\xF3rych nale\xBFy unika\xE6 \23w \21Tajemnicy \21Morderstw\16\n",
			"Zasada numer 1 ka\xBF".."dej gry:\18 B\xB9".."d\x9F \18mi\xB3y \18i \18si\xEA \18baw!\16 Opr\xF3".."cz tego...",
			"* Nie ujawniaj swojej roli innym, nawet dla \xBF".."artu. Wypowiedzenie swojej \27Roli\16 sprawi \xBF".."e gra nie b\xEA".."dzie ju\xBF \'Tajemnic\xB9\'. Mo\xBF".."esz wypowiedzie\xE6 \27role\16 kogo\x9C innego jak jeste\x9C pewny, ale nigdy swojej.",
			"* Unikaj obra\xBF".."ania innych graczy. Przyjazne \xBF".."arty s\xB9 w porz\xB9".."dku, ale ci\xB9g\xB3".."e oskar\xBF".."enia lub wrogie zachowanie sprawi\xB9, \xBF".."e inni przestan\xB9 ci ufa\xE6.",
			"* Nie odchod\x9F od klawiatury (AFK). Je\x9Cli nie b\xEA".."dziesz si\xEA ruszal przez dluzszy czas zostaniesz wygnany z gry (tylko je\x9Cli \xBFyjesz).",
			"* Nie zmieniaj swego imienia gracza p\xF3ki jeste\x9C Martwy(a) - gra jest bardzo \x9C".."cis\xB3".."a i\21 wyrzuci\16 ci z gry je\xBF".."eli to zrobisz. Po prostu zaczekaj na ekran zako\xF1".."czenia rundy \xBF".."eby zn\xF3w bezpiecznie zmienia\xE6 imi\xEA.",
			"* Unikaj obozowania w pobli\xBFu Szmaragdu Szeryfa, je\x9Cli jeste\x9C Morderc\xB9. Stanie w pobliżu Szmaragdu przez 30 sekund spowoduje wyrzucenie z gry.",
			"Z\xB3".."amanie tych zasad mo\xBF".."e spowodowa\xE6 \xBF".."e zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie \xB3".."ama\xE6 i gra\xE6 fer."
		},
        {
			"\23Przydatne porady\16\n",
			"Zebrali\x9Cmy kilka porad kt\xF3rzy mog\xB9 przyda\xE6 ci w twojej grze w \21TM\16:",
			"\n* Je\xBF".."eli zdolno\x9C".."ci postaci s\xB9 wy\xB3B9".."czone administratorem, zaci\x9Cnij \23SPIN\16 \xBF".."eby skrada\xE6 si\xEA ukradkiem i nie zostawia\xE6 za sob\xB9 \x9Clad\xF3w.",
			"\n* Kiedy podniesiesz \20Szmaragd \20Szeryfa\16 b\xEA".."dziesz mie\xE6 dost\xEAp do ka\xBF".."dej broni i ring\xF3w, kt\xF3rzy zebrale\x9C uprzednio.",
			"\n* U\xBFyj polecenia \23SAYTEAM\16, aby koordynowa\xE6 dzia\xB3".."ania z cz\xB3onkami dru\xBFyny i unikn\xB9E6 strza\xB3u od sojusznika. Rozpocz\xEA".."cie wiadomo\x9C".."ci od symbola \24%\16 spowoduje \xBF".."e wiadomo\x9CE6 b\xEA".."dzie automatycznie wyslana do cz\xB3onk\xF3w dru\xBFyny.",
			"\n* Mo\xBF".."esz zosta\xE6 zraniony przez przeszkody takie jak lawa, kolce i ogie\xF1 \xBF".."eby dosta\xE6 effekt niezwyci\xEAzo\x9C".."ci na 3 sekundy.",
			"\n* Spr\xF3".."buj znale\x9FE6 miejsce dla kryj\xF3wke na mapie. Czasami, pomaga to pozby\xE6 si\xEA niechcianej publiczno\x9C".."ci.",
			"\n* Je\xBF".."eli twoja \27rola\16 przestanie by\xE6 tajemnic\xB9, mo\xBF".."esz zmieni\xE6 swoje imi\xEA i zmieni\xE6 sw\xF3j kolor postaci. \18Pami\xEAtaj \18\xBF".."e \18zmiana \18imienia \18b\xEA".."dzie \18widoczna \18w \18czacie\16.",
			"\n* Przycisk\23 FIRENORMAL\16 pozwala wykorzystywa\xE6 N\xF3BF wsz\xEA".."dzie, jak masz Ringi. Tak\xBF".."e, N\xF3BF nie robi dzwi\xEAk\xF3w ataku je\xBF".."eli skradzasz si\xEA."
		}
	},
    ["MMLANG"]={
		"Twoj aktualnie uzywany jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
		"Personalny jezyk zostal ustawiony na\x82 Polski"
	},
    ["ROLE_GET"]={
		"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
		"Jestes \x84Szeryfem\x80!\x84 Wyeliminuj wszystkich Mordercow\x80. Jesli zabijesz Ciwila, stracisz role.",
		"Jestes\x83 Cywilem\x80! Kryj sie i pomoz w dochodzeniu."
	},
    ["NEWROLE_GET"]={
		"\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
		"\x87Swiat sprawil cie nowym \x84Szeryfem\x87! To teraz twoja robota\x84 wyeliminowac wszystkich Mordercow\x87!",
		"\x87Wszyscy obroncy odeszli ale swiat sprawil cie nowym\x82 Bohaterem\x87! To twoja szansa uratowac dzien!",
		"\x87Wyeliminowales jednego z \x85Morderc\x87! Zostales awansowany na\x82 Bohatera\x87!"
	},
    ["TEAMMATE_HIT"]={
		"Ten gracz jest twoim wspolnikiem, natepnym razem nie probuj zabiac ich ponownie",
		"Twoj wspolnik cie zaatakowal, nie probuj sie mscic"
	},
    ["MURD_KILLED"]={
		"\x85Morderca\x87",
		"\x80zostal wyeliminowany!"
	},
    ["SHERI_KILLED"]={
		"\x84Szeryf\x87",
		"\x80zostal zamordowany!",
		"Znajdz zgubiony \x84Szmaragd Szeryfa\x80!"
	},
    ["HERO_KILLED"]={
		"\x82".."Bohater\x87",
		"\x80zostal zamordowany!"
	},
	["DIED_HAZARD"]="zginal(ela) w nieszczesnym wypadku",
	["SHREMD_PICK"]="Ktos podniosl \x84Szmaragd Szeryfa\x80...",
	["KILL_PUNISHMENT_PM"]={
		"\x87Zamordowales\x83 Cywilnego\x87! Nie jestes juz \x84Szeryfem\x87!",
		"\x82".."Bohaterowie nie sa po to, zeby zabijac\x83 Cywilow\x87! Masz za to kare smierci.",
		"\x87O nie! Zamordowales \x84Szeryfa\x87! Masz za to kare smierci!",
		"\x87Zabiles takiego samego\x83 Cywilnego\x87 gracza jak i ty! Masz za to kare smierci!",
		"\x87O nie! Zamordowales\x82 Bohatera\x87! Masz za to kare smierci!"
	},
    ["INNO_HURT"]={
		"\x84Szeryfie\x80 zamordowales Cywila! Ktos z\x83 Cywilow\x80 musi dokonczyc robote!",
		"\x82".."Bohater\x80 jest skurwielem, zabil spokojnego\x83 Cywila\x80. Teraz obydwoje nie zyja. Wstyd dla bohatera"
	},
    ["ONE_QUIT"]={
		"Jeden z \x85Mordercow\x80 wyszedl!",
		"Jeden z \x84Szeryfow\x80 wyszedl!",
		"Jeden z\x82 Bohaterow\x80 zostawil nas!"
	},
    ["LAST_QUIT"]={
		"Ostatni \x85Mordercow\x80 wyszedl!",
		"Ostatni \x84Szeryfow\x80 wyszedl!",
		"Ostatni\x82 Bohaterow\x80 wyszedl!"
	},
    ["REPLACE_QUIT"]={
		"\x85Morderca\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!",
		"\x84Szeryf\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!",
		"\x82".."Bohater\x80 wyszedl! Jeden z\x83 Cywilow\x80 zdobyl jego role!"
	},
    ["ENDROUND"]={
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
    ["HUD_ROLES"]={
		"MORDERCA",
		"SZERYF",
		"CYWIL",
		"BOHATER",
		"MARTWY"
	},
	["HUD_SUSPECTS"]="Podejrzani",
	["HUD_VICTIMS"]="Ofiary",
	["HUD_TEAMMATES"]="Cz\xB3onkowie dru\xBFyny",
	["HUD_KILLBY"]="Zabity przez",
	["HUD_STUPID"]="tw\xF3j idiotyzm",
	["HUD_SCORESTAB"]={
		"Je\x9Cli ten tryb jest ci nowy u\xBFyj",
		"komendy \23MMHELP\16 w Konsoli dla pomocy",
		"i \23MMLANG\16 dla zmiany j\xEAzyka tutaj",
		"",
		"",
		"\2Baw si\xEA dobrze ;)"
	},
	["HUD_ROLETARGET"] = {
		"Zamorduj wszystkich.",
		"Wyeliminuj wszystkich Morderc\xF3w.\nNie zabijaj Ciwil\xF3w!",
		"Kryj si\xEA i pom\xF3BF w dochodzeniu,\nkiedy jest to mo\xBFliwe.",
		"Masz szans\xEA powstrzyma\xE6 wszystkich\nMorderc\xF3w. Ruszaj i uratuj dzie\xF1,\nale b\xB9".."d\x9F ostro\xBFny!"
	},
    ["HUD_ROLESALIVE"]={
		"Morderc\xF3w",
		"Szeryf\xF3w",
		"Cywil\xF3w"
	},
    ["HUD_DEAD"]={
		"Jeste\x9C\31 martwy(a)",
		"Nie mozesz si\xEA odnawia\xE6 lub gada\xE6 do \xBFywych"
	},
    ["HUD_MIDJOIN"]={
		"Pan(i) dolaczy\xB3(a) si\xEA \20w \x9Crodku rundy\16, prosze poczeka\xE6 na now\xB9 rund\xEA \xBF".."eby zagra\xE6.",
		"Podczas oczekiwania prosimy o zapoznanie si\xEA z regulami gry w poleceniu konsoli \23MMHELP\16"
	},
    ["HUD_ALONE"]={
		"\20".."2 graczy\16 jest wymaganych do gry,",
		"prosz\xEA poczeka\xE6 na \20jeszcze jednego\16 gracza",
		"dla startu"
	},
    ["HUD_SNEAKING"]="Skradzamy si\xEA...",
	["HUD_SHOWDOWN"]="Pojedynek losu!",
	["HUD_MINIGAME"]={
		["PRESS"] = "Naci\x9Cnij\18 CUSTOM3\16, aby", --must contain MM escape color codes
		["LEAVE"]="opu\x9C".."ci\xE6 gr\xEA",
		["CANCEL"]="anulowa\xE6",
		["SPECTATE"]="ogl\xB9".."da\xE6",
		["DUEL"]="za pojedynkiem w minigrz\xEA",
		["REQUEST"]="zagra\xE6 w \23PONG\16 z przeciwnikiem", --must contain MM escape color codes
		["START"]="zagra\xE6 w \23SONIC RUN", --must contain MM escape color codes
		["ACCEPT"]="zaakceptowa\xE6 zaproszenie w \23PONG\16!", --must contain MM escape color codes
		["WAIT"]="Czekamy na odpowied\x9F przeciwnika...",
		["SPECTATING"]="Ogl\xB9".."damy za pojedynkiem...",
		["BORED"]="Nudzisz si\xEA?",
		["GOAL"]="Gol!"
	},
    ["HUD_YOU"]="TY",
	["HUD_WINNERS"]="Wygrani:",
	["HUD_WIN"]={
		"REMIS!",
		"\21M\xD3RDERCY",
		"\19CYWILE"
	},
    ["HUD_PAST"]="PRZESZLO\x8CC6",
	["HUD_FUTURE"]="PRZYSZLO\x8CC6"
})