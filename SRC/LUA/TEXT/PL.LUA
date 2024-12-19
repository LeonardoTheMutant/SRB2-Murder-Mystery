-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- POLISH
-- Made by Sopix and LeonardoTheMutant

MM.AddLang("PL", {
    ["VERSION"]="1.0-ALPHA",
	["AUTHOR"]="sopix & LeonardoTheMutant",
	["CHARSET"]="1250C", --Windows1250
	["MM"]="Tajemnica Morderstw",
	["MMHELP_CMD"]={
		"Dla scrollingu wci\x9Cnij klawisz\xEA \23JUMP\16/\23SPIN\16, \xBF".."eby zmieni\xE6".."c stron\xEA wci\x9Cnij \23NEXT\16/\23PREV WEAPON\xF1\16",
		"\23FIRE\16 - wyj\x9C\xE6 z menu pomocy"
	},
    ["MMHELP"]={
		{
			"\23Witaj w Tajemnicy Morderstw!\n\23Interpretacji popularnej gry multiplayer w SRB2!\16\n",
			"Celem gry jest znalezienie i wyeliminowanie wszystkich \21Morderc\xF3w\16 zanim zabij\xB9\19 wszystkich\16. Ten typ gry jest jak MATCH wi\xEA".."c musisz potrafi\xE6 strzela\xE6.",
			"B\xEA".."dziesz potrzebowa\xE6 kilku podstaw....",
			"\nNa pocz\xB9tku ka\xBF".."dej rundy dostaniesz \26Role\16 kt\xF3ra dyktuje co masz robi\xE6 w grze. To s\xB9 3 mozliwe \26Role\16 kt\xF3re mo\xBF".."esz dosta\xE6:",
			" * \21Morderca\16 - Prawdziwy kryminalista. Ma zabi\xE6 wszystkich, ale posiada tylko N\xF3BF ta Czerwone Ringi;",
			" * \20Szeryf\16   - Jego zadaniem jest znalezienie i wyeliminowanie \21Morderc\xF3w\16. Szeryfi mog\xB9 u\xBFywa\xE6 wszystkich typ\xF3w pier\x9C".."cieni;",
			" * \19Niewinny\16 - Kompletnie bezbronny cywil, musi nie zosta\xE6 zabity i pom\xF3".."c w znalezieniu \21Mordercy\16.",
			"\nTo cala podstawa do gry, je\x9Cli nadal czego\x9C nie wiesz lub chcesz dowiedzie\xE6 si\xEA wi\xEA".."cej przeczytaj ten podr\xEA".."cznik do ko\xF1".."ca"
		},
        {
			"\23O sytuacjach w grze\16\n",
			"Jak wyja\x9Cniono wcze\x9Cniej, ce\xB3".."em jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale r\xF3BFne sytuacje mog\xB9 zasta\xE6:",
			"\n* Je\x9Cli kto\x9C ci\xEA zastrzeli to staniesz si\xEA\31 Martwy\16. Gracze w tym stanie nie mog\xB9 si\xEA odnowi\xE6 ani gada\xE6 na globalnym czacie, twoje wiadomo\x9C".."ci s\xB9 tylko widoczne dla innych\x15 martwych\16 graczy.",
			"Nie mo\xBF".."esz u\xBFy\xE6 \23SAYTO\16 lub PW do osoby kt\xF3ra jest \xBFywa jako\31 MARTWY\16.",
			"Tak\xBF".."e,\18 NIE PR\xD3".."BUJ ZMIENIA\xC6 NAZWY\16, wi\xEA".."cej detali na nast\xEApnej stroni\xEA.",
			"\n* Zadaniem \20Szeryfa\16 jest wyeliminowanie wszystkich \21Morderc\xF3w\16, ale czasami Szeryf mo\xBF".."e zabi\xE6 \19Niewinn\xB9 \19osob\xEA\16 przez przypadek.",
			"Je\x9Cli to si\xEA stanie \20Szeryf\16 stanie si\xEA cywilem i inna \19Niewinna \19osoba\16 po cichu przejmie jego rol\xEA. Nast\xEApnym razem jak strzelisz w kogo\x9C jako \20Szeryf\16 pomy\x9Cl kogo zabijasz!",
			"\n* Kiedy \21Morderca\16 zabije \20Szeryfa\16 i zostan\xB9 \xBFywi \19Niewinni\16 Szeryf upu\x9C".."ci \20Szmaragd Szeryfa\16 obok jego cia\xB3".."a.",
			"W przeciwie\xF1stwie do Szmaragd\xF3w Chaosu ten Szmaragd daje role\18 Bohatera\16 do \19Niewinnego\16 kt\xF3ry go pierwszy podnios\xB3. Je\x9Cli jeste\x9C \19Niewinn\xB9 \19osob\xB9\16 to twoja szansa zosta\xE6 bohaterem i uratowa\xE6 wszystkich od \21Morderc\xF3w\16!",
			"\2Bohater\16 nie r\xF3BFni si\xEA za bardzo od \20Szeryfa\16 opr\xF3".."cz kilku detali jak kiedy\18 Bohater\16 zabija \19Niewinnego\16 jego rola nie jest oddawana i obydwoje gin\xB9. Bohater nie upu\x9C".."ci \20Szmaragdu \20Szeryfa\16 przy jego \x9Cmierci.",
			"\n* Zale\xBFnie od ilosci graczy, mo\xBF".."e by\xE6 wi\xEA".."cej ni\xBF jeden \21Morderc\xF3w\16 i \20Szeryfx\xF3w\16 po\x9Cr\xF3".."d graczy w grze. Na przyk\xB3".."ad, gdy jest wi\xEA".."cej ni\xBf 7 graczy to\26 Dru\xBFyny\16 \21Morderc\xF3w\16 i \20Szeryf\xF3w\16 b\xEA".."d\xB9 zformowane.",
			"\26Wsp\xF3\xB3nicy\16 mog\xB9 czatowa\xE6 z dru\xBFyn\xB9 za pomoc\xB9 komendy \23SAYTEAM\16 (przycisk SAYTEAM b\xEA".."dzie tak samo dziala\xB3 jak normalny czat).",
			"Je\x9Cli jeden \26wsp\xF3lnik\16 strzeli drugiego to dostanie wiadomo\x9CE6 \xBF".."eby nie strzelal do wspx\xF3B3nika. Pami\xEAtaj \xBF".."e inni mog\xB9 zobaczy\xE6 twoj\xB9 'przyjazn\xB9' rozmow\xEA i dowiedzie\xE6 si\xEA kim jeste\x9C!"
		},
        {
			"\23Rzeczy kt\xF3rych nie wolno \23robi\xE6 \23w \23Tajemnicy \23Morderstw\16\n",
			"Zasada numer 1 ka\xBF".."dej gry:\18 B\xB9".."d\x9F \18mi\xB3y \18i \18si\xEA \18baw!\16 Opr\xF3".."cz tego...",
			"* Wypowiedzenie swojej \26Roli\16 sprawi \xBF".."e gra nie b\xEA".."dzie ju\xBF \'Tajemnic\xB9\', mo\xBF".."esz wypowiedzie\xE6 role kogo\x9C innego jak wiesz ale nigdy swojej.",
			"* Nie b\xB9".."d\x9F nie mi\xB3y dla innych graczy, \xBF".."arty s\xB9 dozwolone ale tylko w przyjaznej atmosferze. Nikt ci nie b\xEA".."dzie ufa\xB3 jak b\xEA".."dziesz ci\xB9gle oskarza\xB3 innych bez powodu.",
			"* Bycie AFK to zbrodnia wojenna. Je\x9Cli b\xEA".."dziesz si\xEA nie ruszal przez dluzszy czas zostaniesz wykopany (tylko je\x9Cli \xBFyjesz).",
			"* Nie zmieniaj swojej nazwy p\xF3ki jeste\x9C Martwy(a) - gra jest bardzo \x9C".."cis\xB3".."a i\21 wyrzuci\16 ci z gry je\xBF".."eli to zrobisz. Po prostu zaczekaj na ekran zako\xF1".."czenia rundy \xBF".."eby zn\xF3w bezpiecznie zmienia\xE6 imi\xEA.",
			"Z\xB3".."amanie tych zasad mo\xBF".."e spowodowa\xE6 \xBF".."e zostaniesz wykopany a czasami zbanowany przez Administratora, prosimy ich nie \xB3".."ama\xE6 i gra\xE6 fer."
		},
        {
			"\23Przydatne porady\16\n",
			"Zebrali\x9Cmy kilka porad kt\xF3rzy mog\xB9 przyda\xE6 ci w twojej grze w TM:",
			"\n* Je\xBF".."eli zdolno\x9C".."ci postaci s\xB9 wy\xB3B9".."czone administratorem, zaci\x9Cnij \2SPIN\16 \xBF".."eby skrada\xE6 si\xEA ukradkiem i nie zostawia\xE6 za sob\xB9 \x9Clad\xF3w;",
			"\n* Kiedy podniesiesz \20Szmaragd \20Szeryfa\16 b\xEA".."dziesz mie\xE6 dost\xEAp do ka\xBF".."dej broni i ring\xF3w, kt\xF3rzy zebrale\x9C uprzednio;",
			"\n* Mo\xBFna dowiedzie\xE6 si\xEA kim jest tw\xF3j \26kolega\16 z dru\xBFyny bez wykorzystania broni, po prostu wy\x9Cli powiadomienie za pomoc\xB9 komendy \23SAYTEAM\16 w konsoli i zaczekaj a\xBF p\xF3ki na ni\xB9 kto\x9C odpowie z twojej dru\xBFyny.;",
			"\n* Mo\xBF".."esz zosta\xE6 zraniony przez przeszkody takie jak lawa, kolce i ogie\xF1 \xBF".."eby dosta\xE6 effekt niezwyci\xEAzo\x9C".."ci na 3 sekundy;",
			"\n* Spr\xF3".."buj znale\x9FE6 miejsce dla kryj\xF3wke na mapie. Czasami, pomaga to pozby\xE6 si\xEA niechcianej publiczno\x9C".."ci;",
			"\n* Je\xBF".."eli twoja rola przestanie by\xE6 tajemnic\xB9, mo\xBF".."esz zmieni\xE6 swoje imi\xEA i zmieni\xE6 sw\xF3j kolor postaci. \18Pami\xEAtaj, \18\xBF".."e \18zmiana \18imienia \18b\xEA".."dzie \18widoczna \18w \18czacie\16;",
			"\n* Przycisk\23 FIRENORMAL\16 pozwala wykorzystywa\xE6 N\xF3BF wsz\xEA".."dzie, jak masz Ringi (Niewinni nie posiadaj\xB9 No\xBF".."a). Tak\xBF".."e, N\xF3BF nie robi dzwi\xEAk\xF3w ataku je\xBF".."eli skradzasz si\xEA."
		}
	},
    ["MMLANG"]={
		"Twoj aktualnie uzywany jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
		"Personalny jezyk zostal ustawiony na\x82 Polski"
	},
    ["ROLE_GET"]={
		"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
		"Jestes \x84Szeryfem\x80!\x84 Wyeliminuj wszystkich Mordercow\x80. Jesli zabijesz Niewinnego, stracisz role.",
		"Jestes \x83Niewinny\x80! Kryj sie i pomoz w dochodzeniu."
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
		"\x87Zamordowales \x83Niewinnego\x87! Nie jestes juz \x84Szeryfem\x87!",
		"\x82".."Bohaterowie nie sa po to, zeby zabijac \x83Niewinnych\x87. Masz za to kare smierci.",
		"\x87O nie! Zamordowales \x84Szeryfa\x87! Masz za to kare smierci!",
		"\x87Zabiles takiego samego \x83Niewinnego\x87 gracza jak i ty! Masz za to kare smierci!",
		"\x87O nie! Zamordowales\x82 Bohatera\x87! Masz za to kare smierci!"
	},
    ["INNO_HURT"]={
		"\x84Szeryfie\x80 zamordowales niewinnego! Ktos z \x83Niewinnych\x80 musi dokonczyc robote!",
		"\x82".."Bohater\x80 jest skurwielem, zabil spokojnego \x83Niewinnego\x80. Teraz obydwoje nie zyja. Wstyd dla bohatera"
	},
    ["ONE_LEFT"]={
		"Jeden z \x85Mordercow\x80 wyszedl!",
		"Jeden z \x84Szeryfow\x80 wyszedl!",
		"Jeden z\x82 Bohaterow\x80 zostawil nas!"
	},
    ["LAST_LEFT"]={
		"Ostatni \x85Mordercow\x80 wyszedl!",
		"Ostatni \x84Szeryfow\x80 wyszedl!",
		"Ostatni\x82 Bohaterow\x80 wyszedl!"
	},
    ["REPLACE_LEFT"]={
		"\x85Morderca\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
		"\x84Szeryf\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
		"\x82".."Bohater\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!"
	},
    ["ENDROUND"]={
		"Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
		"Wszyscy Mordercy zostali wyeliminowani,\x83 Cywile\x80 wygrywaja!",
		"\x85Mordercy\x80 wygrywaja, poniewaz \x84Szeryf\x80 zamordowal ostatniego Niewinnego!",
		"\x82".."Bohater\x80 wybral do zabicia ostatniego Niewinnego. \x85Moredrcy\x80 Wygrywaja!",
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
		"BOHATER",
		"NIEWINNY",
		"MARTWY"
	},
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
    ["HUD_ROLESALIVE"]={
		"Morderc\xF3w",
		"Szeryf\xF3w",
		"Niewinnych"
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