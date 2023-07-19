if MurderMystery error("Murder Mystery gametype is already loaded") end
rawset(_G, "MurderMystery", {
	version="8.0-BETA",
	devbuild=nil,
	releasedate="July 19 2023",
	text={ --Nearly all text used in the add-on with the translations
		["EN"]={ -- English
			["VERSION"]="8.0-BETA", --to check if content is for older version
			["AUTHOR"]="LeonardoTheMutant",
			--Language constants for HUD.LUA
			["DEADSTRNUM"]=2, --how much lines of "You're dead", this is to index DEADx that is defined below
			["MIDJOINSTRNUM"]=1, --lines of "Joined mid-round" for MIDJOINx
			["ALONESTRNUM"]=2, --lines of "Wait for one more plr" for ALONEx
			["SCORESSTRNUM"]=3, --lines of SCORES TAB for SCORESx_HUD
			["MM"]="Murder Mystery",
			--GAME.LUA
			--"You got the role"
			["R1_GET"]="You're the \x85Murderer\x80! \x85Murder everyone.",
			["R2_GET"]="You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. If you kill an Innocent, you lose.",
			["R3_GET"]="You're an \x83Innocent\x80! Hide and help the sheriff find the murderer.",
			-- setRandomPlayerAs()
			["NewMurderer"]="\x87Life made a \x85Murderer\x87 from you, \x85now go kill everyone.",
			["NewSheriff"]="\x87The Universe made you the new \x84Sheriff\x87! It's now your job to\x84 eliminate all Murderers\x87!",
			-- Teammates hit
			["HitTeammate_atacker"]="\x85Hey, this guy is your teammate, don't try to kill him again",
			["HitTeammate_victim"]="\x85Your teammate hit you, don't get mad on him",
			-- Murderer hit/killed
			["MurdersWin"]="Everyone are murdered, \x85Murderers\x80 win!",
			["MurdererKilled_str"]="\x85Murderer\x87 ", --must contain SPACE at the end
			["MurdererKilled_end"]="\x80 was eliminated!",
			-- Sheriff hit/killed
			["SheriffsWin"]="All murderers eliminated, \x84Sheriffs\x80 & all \x83Innocents\x80 win!",
			["SheriffKilled_str"]="\x84Sheriff\x87 ", --must contain SPACE at the end
			["SheriffKilled_end"]="\x80 was murdered! \x83Innocents\x80 can pick up his Emerald to finish the job!",
			["SheriffKilledNoDrop_end"]="\x80 was murdered!",
			["SheriffDropPicked"]="Some Innocent picked up \x84Sheriff's Emerald\x80...",
			-- Innocent hurt/left
			["SheriffKillInnoPM"]="\x87You murdered the \x83Innocent\x87! You are no longer a \x84Sheriff\x87!",
			["SheriffKillInno"]="\x84Sheriff\x80 murdered the Innocent! Someone other from \x83Innocents\x80 will have to finish his job!",
			["MurdersWinNoInnos"]="\x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent!",
			["LastInnoLeft"]="Last \x83Innocent\x80 left!",
			-- Murderer left
			["LastMurdLeft"]="Last \x85Murderer\x80 left!",
			["MurdLeftReplace"]="\x85Murderer\x80 left! Someone from \x83Innocents\x80 took his role!",
			["OneMurdLeft"]="One of the \x85Murderers\x80 left!",
			-- Sheriff left
			["LastSheriffLeft"]="Last \x84Sheriff\x80 left!",
			["SheriffLeftReplace"]="\x84Sheriff\x80 left! Someone from \x83Innocents\x80 took his role!",
			["OneSheriffLeft"]="One of the \x84Sheriffs\x80 left!",
			-- "You can't become spectator"
			["TeamSwitch"]="You can't just become\x8F dead\x80 to spectate!",
			--CHAT.LUA
			["MsgNotSent"]="is alive, message not sent",
			["MsgDelay"]="You're sending too much messages, please wait",
			--HUD.LUA
			["R1_HUD"]="\x85MURDERER", --must contain escape color code
			["R2_HUD"]="\x84SHERIFF", --must contain escape color code
			["R3_HUD"]="\x83INNOCENT", --must contain escape color code
			["DD_HUD"]="\x8F".."DEAD", --must contain escape color code
			["TeamLeft_HUD"]="Teammates alive: ",
			["KILLBY_HUD"]="Killed by ",
			["SCORES1_HUD"]="No scores here! Counters below may help",
			["SCORES2_HUD"]="If you're new to the gametype\nuse \x87MMHELP\x80 in the Console",
			["SCORES3_HUD"]="\n\x82Have Fun ;)",
			["SCORESR1_HUD"]="\x85Murderers alive: ", --must contain escape color code AND space at the end
			["SCORESR2_HUD"]="\x84Sheriffs alive: ", --must contain escape color code AND space at the end
			["SCORESR3_HUD"]="\x83Innocents alive: ", --must contain escape color code AND space at the end
			["DEAD1"]="You are\x8F dead",
			["DEAD2"]="You can't respawn or talk to alives",
			["MIDJOIN1"]="You joined \x84mid-round\x80, wait for the new round to play",
			["ALONE1"]="\x84".."2 players\x80 are requiered for the game,",
			["ALONE2"]="please wait for \x84one more\x80 player to start",
			["WINNERS_HUD"]="Winners: ", --must contain SPACE at the end
			["WIN0_HUD"]="TIE!",
			["WIN1_HUD"]="\x85MURDERERS", --must contain escape color code
			["WIN2_HUD"]="\x84SHERIFFS\x80 & \x83INNOCENTS", --must contain escape color code
			--COMMAND.LUA (MMLANG part)
			["CurrentLang"]="Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]",
			["LangSet"]="Personal language for Murder Mystery is set to\x82 English"
		},["ES"]={ -- Spanish by SlainLBS & Jesus.B
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="SlainLBS, Jesus.B",
			["DEADSTRNUM"]=2,
			["MIDJOINSTRNUM"]=1,
			["ALONESTRNUM"]=2,
			["SCORESSTRNUM"]=3,
			["MM"]="Misterio De Asesinato",
			["R1_GET"]="Eres el\x85 Asesino\x80!\x85 Acaba con todos.",
			["R2_GET"]="Eres el\x84 Comisario\x80!\x84 Elimina al Asesino.\x80 Si matas al Inocente, pierdes.",
			["R3_GET"]="Eres un \x83Inocente\x80! Escondete y ayuda al Comisario a encontrar el Asesino. ",
			["NewMurderer"]="\x87La Vida te hizo un\x85 Asesino\x87,\x85 ahora ve a matar a todos.",
			["NewSheriff"]="\x87".."El Universo the ha hecho el nuevo\x84 Comisario\x87! Ahora tu trabajo es\x84 eliminar a todos los asesinos\x87!",
			["HitTeammate_atacker"]="\x85Oye, este tipo es tu aliado, no vuelvas a intentar matarlo",
			["HitTeammate_victim"]="\x85Tu aliado te golpeo, no te enojes con el",
			["MurdersWin"]="Todos estan asesinados, los\x85 Asesinos\x80 ganan!",
			["MurdererKilled_str"]="\x85".."El Asesino\x87 ",
			["MurdererKilled_end"]="\x80 fue eliminado!",
			["SheriffsWin"]="Todos los asesinos han sido eliminados, Los\x84 Comisarios\x80 y todos los \x83Inocentes\x80 ganan!",
			["SheriffKilled_str"]="\x84".."El Comisario\x87 ",
			["SheriffKilled_end"]="\x80 fue asesinado! los \x83Inocentes\x80 pueden tomar su esmeralda para terminar el trabajo!",
			["SheriffKilledNoDrop_end"]="\x80 fue asesinado!",
			["SheriffDropPicked"]="Algun inocente tomo la\x84 Esmeralda Del Comisario\x80...",
			["SheriffKillInnoPM"]="\x87Mataste al \x83Inocente\x87! Ya no eres un\x84 Comisario\x87!",
			["SheriffKillInno"]="El\x84 Comisario\x80 mato al Inocente! Alguien mas de los \x83Inocentes\x80 tendra que terminar su trabajo!",
			["MurdersWinNoInnos"]="Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 mato al ultimo Inocente!",
			["LastMurdLeft"]="Queda el ultimo\x85 Asesino",
			["MurdLeftReplace"]="El\x85 Asesino\x80 se fue! Alguien de los \x83Inocentes\x80 tomo su rol!",
			["OneMurdLeft"]="Uno de los\x85 Asesinos\x80 se fue!",
			["LastSheriffLeft"]="Queda el ultimo\x84 Comisario",
			["SheriffLeftReplace"]="El\x84 Comisario\x80 se fue! Alguien de los \x83Inocentes\x80 tomo su rol!",
			["OneSheriffLeft"]="Uno de los\x84 Comisarios\x80 se fue!",
			["TeamSwitch"]="No puedes solo convertirte en\x8F muerto\x80 para espectar!",
			["MsgNotSent"]="Esta vivo, el mensaje no ha sido enviado",
			["MsgDelay"]="Estas enviando demasiados mensajes, porfavor espera",
			["R1_HUD"]="\x85".."ASESINO",
			["R2_HUD"]="\x84".."COMISARIO",
			["R3_HUD"]="\x83INOCENTE",
			["DD_HUD"]="\x8FMUERTO",
			["TeamLeft_HUD"]="Aliados vivos: ",
			["KILLBY_HUD"]="Asesinado por ",
			["DEAD1"]="Estas\x8F muerto",
			["DEAD2"]="No puedes reaparecer o hablarle a los vivos",
			["SCORES1_HUD"]="No hay puntaje aqui! Los contadores\ndebajo pueden ayudarte",
			["SCORES2_HUD"]="\nSi eres nuevo al tipo de juego\nusa \x87MMHELP\x80 en la Consola",
			["SCORES3_HUD"]="\n\n\x82".."Diviertete ;)",
			["SCORESR1_HUD"]="\x85".."Asesinos vivos: ",
			["SCORESR2_HUD"]="\x84".."Comisarios vivos: ",
			["SCORESR3_HUD"]="\x83Inocentes vivos: ",
			["MIDJOIN1"]="Te uniste en \x84la mitad de la partida\x80, espera para jugar una nueva ronda",
			["ALONE1"]="\x84".."2 jugadores\x80 son requeridos para el juego,",
			["ALONE2"]="porfavor espera \x84un jugador mas\x80 para empezar",
			["WIN0_HUD"]="EMPATE!",
			["WIN1_HUD"]="\x85".."ASESINOS",
			["WIN2_HUD"]="\x84".."COMISARIOS\x80 & \x83INOCENTES",
			["CurrentLang"]="Tu idioma actual en uso es el\x82 Espanol\x80\nLo puedes cambiar con \x87MMLANG [idioma]",
			["LangSet"]="El Idioma personal para Misterio De Asesinato ha sido cambiado a\x82 Espanol"
		},["PL"]={ -- Polish by sopix
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="sopix",
			["DEADSTRNUM"]=3,
			["MIDJOINSTRNUM"]=1,
			["ALONESTRNUM"]=2,
			["SCORESSTRNUM"]=3,
			["MM"]="Tajemnica Mordercy",
			["R1_GET"]="Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
			["R2_GET"]="Jestes \x84Szeryfem\x80! \x84Wyeliminuj wszystkich Morderc\x80. Jesli zabijesz Niewinnego, przegrywasz",
			["R3_GET"]="Jestes \x83Niewinnym\x80! Schowaj sie i pomoz Szeryfowi znalezc Morderce.",
			["NewMurderer"]="\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
			["NewSheriff"]="\x87Wszechswiat mianowal cie nowym \x84Szeryfem\x87! To teraz twoja robota aby\x84 wyeliminowac wszystkich Mordercow\x87!",
			["HitTeammate_atacker"]="\x85Hej, ten ktos jest w twojej drużynie, nie próbuj go ponownie zabic",
			["HitTeammate_victim"]="\x85Ktos z twojej druzyny cie strzelil, nie badz zly na niego",
			["MurdersWin"]="Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
			["MurdererKilled_str"]="\x85Morderca\x87 ",
			["MurdererKilled_end"]="\x80 zostal wyeliminowany!",
			["SheriffsWin"]="Wszyscy mordercy wyeliminowani, \x84Szeryfi\x80 & wszyscy \x83Niewinni\x80 wygrywaja!",
			["SheriffKilled_str"]="\x84Szeryf\x87 ",
			["SheriffKilled_end"]="\x80 zostal zamordowany! \x83Niewinni\x80 moga podniesc jego emerald i dokonczyc robote!",
			["SheriffKilledNoDrop_end"]="\x80 zostal zamordowany!",
			["SheriffDropPicked"]="Jakis niewinny podniosl \x84Szmaragd Szeryfa\x80...",
			["SheriffKillInnoPM"]="\x87Zamordowales \x83Niewinnego\x87! Juz nie jestes \x84Szeryfem\x87!",
			["SheriffKillInno"]="\x84Szeryf\x80 zamordowal Niewinnego! Ktos z innych \x83Niewinnych\x80 musi dokonczyc robote!",
			["MurdersWinNoInnos"]="\x85Mordercy\x80 wygrywaja ponieważ \x84Szeryf\x80 zamordowal ostatniego Niewinnego!",
			["LastInnoLeft"]="Ostatni \x83Niewinny\x80 wyszedl!",
			["LastMurdLeft"]="Ostatni \x85Morderca\x80 wyszedl!",
			["MurdLeftReplace"]="\x85Morderca\x80 wyszedl! Ktos z \x83Niewinnych\x80 ma jego role!",
			["OneMurdLeft"]="Jeden z \x85Mordercow\x80 wyszedl!",
			["LastSheriffLeft"]="Ostatni \x84Szeryf\x80 wyszedl!",
			["SheriffLeftReplace"]="\x84Szeryf\x80 wyszedl! Ktos z \x83Niewinnych\x80 ma jego role!",
			["OneSheriffLeft"]="Jeden z \x84Szeryfow\x80 wyszedl!",
			["TeamSwitch"]="Nie mozesz poprostu zostac \x8FMartwym\x80!",
			["MsgNotSent"]="jest zywy, wiadomosc nie zostala wyslana",
			["MsgDelay"]="Wysylasz za duzo wiadomosci, prosze poczekac",
			["R1_HUD"]="\x85MORDERCA",
			["R2_HUD"]="\x84SZERYF",
			["R3_HUD"]="\x83NIEWINNY",
			["DD_HUD"]="\x8FMARTWY",
			["TeamLeft_HUD"]="Zywi w druzynie: ",
			["KILLBY_HUD"]="Zabity przez ",
			["SCORES1_HUD"]="Tutaj nie ma punktow! Liczniki na dole\nmoga pomoc",
			["SCORES2_HUD"]="\nJesli jestes nowy w tym trybie\nuzyj \x87MMHELP\x80 w Konsoli",
			["SCORES3_HUD"]="\n\n\x82".."Baw sie dobrze ;)",
			["SCORESR1_HUD"]="\x85Zywi Mordercy: ",
			["SCORESR2_HUD"]="\x84Zywi Szeryfi: ",
			["SCORESR3_HUD"]="\x83Zywi Niewinni: ",
			["DEAD1"]="Jestes\x8F martwy",
			["DEAD2"]="Nie mozesz powrocic do zycia",
			["DEAD3"]="albo gadac do zywych",
			["MIDJOIN1"]="Dolaczyles/as w \x84srodku rundy\x80, poczekaj na nastepna runde zeby grac",
			["ALONE1"]="Potrzeba\x84 2 graczy\x80 do gry",
			["ALONE2"]="Zaczekaj prosze na \x84jeszcze jednego\x80 gracza",
			["WINNERS_HUD"]="Wygrali: ",
			["WIN0_HUD"]="REMIS!",
			["WIN1_HUD"]="\x85MORDERCY",
			["WIN2_HUD"]="\x84SZERYFI\x80 & \x83NIEWINNI",
			["CurrentLang"]="\x82Polski\x80 ustanowiony jako twoj jezyk w Tajemnicy Morderstw\nMozesz zmienic go za pomocy \x87MMLANG [jezyk]",
			["LangSet"]="Personalny jezyk dla Tajemnicy Morderstw ustanowiony na \x82Polski"
		},["PT"]={ --Portugesse (Brazilian) by King Jonas
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="King Jonas",
			["DEADSTRNUM"]=2,
			["MIDJOINSTRNUM"]=2,
			["ALONESTRNUM"]=3,
			["SCORESSTRNUM"]=3,
			["MM"]="Murder Mystery",
			["R1_GET"]="Voce e o \x85 Assassino\x80! \x85 Assassine todos.",
			["R2_GET"]="Voce e o \x84Xerife\x80!\x84 Elimine todos os Assassinos\x80. Se voce matar um Inocente, voce perde.",
			["R3_GET"]="Voce e um \x83Inocente\x80! Esconda-se e ajude o Xerife a encontrar o assassino.",
			["NewMurderer"]="\x87O Universo fez de voce um\x85 Assasino, agora va matar todo mundo",
			["NewSheriff"]="\x87O Universo fez de voce o novo \x84Xerife\x87! Agora e seu trabalho\x84 eliminar todos os Assassinos\x87!",
			["HitTeammate_atacker"]="\x85".."Ei, esse cara e seu companheiro de equipe, nao tente mata-lo novamente",
			["HitTeammate_victim"]="\x85Seu companheiro de equipe acertou voce, nao fique bravo com ele",
			["MurdersWin"]="Todos foram assassinados, Os\x85 Assasinos\x80 venceram!",
			["MurdererKilled_str"]="O\x85 Assasino\x87 ",
			["MurdererKilled_end"]="\x80 foi eliminado!",
			["SheriffsWin"]="Todos os assassinos foram eliminados, \x80Os \x84Xerifes\x80 e todos os \x83Inocentes\x80 venceram!",
			["SheriffKilled_str"]="O \x84Xerife\x87 ",
			["SheriffKilled_end"]="\x80 foi assasinado! \x80Os \x83Inocentes\x80 podem pegar sua Esmeralda para terminar o trabalho!",
			["SheriffKilledNoDrop_end"]=" foi assasinado!",
			["SheriffDropPicked"]="Algum Inocente pegou \x84 A Esmeralda do Xerife\x80.",
			["SheriffKillInnoPM"]="\x87Voce assassinou o \x83Inocente\x87! Voce nao e mais um \x84Xerife\x87!",
			["SheriffKillInno"]="O\x84 Xerife\x80 assassinou o Inocente! Outra pessoa \x83Inocente\x80 tera que terminar seu trabalho!",
			["MurdersWinNoInnos"]="Os\x85 Assasinos\x80 venceram porque \x80o \x84Xerife\x80 assassinou o Ultimo inocente!",
			["LastInnoLeft"]="O ultimo \x83 Inocente\x80 saiu!",
			["LastMurdLeft"]="O ultimo\x85 Assasino\x80 saiu!",
			["MurdLeftReplace"]="\x80O \X85 Assasino\x80 saiu! Alguem de \x83Inocente\x80 assumiu o papel dele!",
			["OneMurdLeft"]="Um dos \x85 Assasinos\x80 saiu!",
			["LastSheriffLeft"]="O ultimo \x84Xerife\x80 saiu!",
			["SheriffLeftReplace"]="O \x84Xerife\x80 saiu! Alguem de \x83Inocente\x80 assumiu seu papel!",
			["OneSheriffLeft"]="Um dos \x84Xerifes\x80 saiu!",
			["TeamSwitch"]="Voce nao pode simplesmente ficar\x8F morto\x80 para entrar no modo espectador!",
			["MsgNotSent"]="esta vivo, mensagem nao enviada",
			["MsgDelay"]="Voce esta enviando muitas mensagens, aguarde",
			["R1_HUD"]="\x85".."ASSASINO",
			["R2_HUD"]="\x84XERIFE",
			["R3_HUD"]="\x83INOCENTE",
			["DD_HUD"]="\x8FMORTO",
			["TeamLeft_HUD"]="Companheiros de equipe vivos: ",
			["KILLBY_HUD"]="Morto por ",
			["SCORES1_HUD"]="Nenhuma pontuacao aqui! Os contadores\nabaixo podem ajudar",
			["SCORES2_HUD"]="\nSe voce e novo nesse tipo de jogo escreva\n\x87MMHELP\x80 no Console",
			["SCORES3_HUD"]="\n\n\x82".."Divirta-se ;)",
			["SCORESR1_HUD"]="\x85".."Assasinos vivos: ",
			["SCORESR2_HUD"]="\x84Xerifes vivos: ",
			["SCORESR3_HUD"]="\x83Inocentes vivos: ",
			["DEAD1"]="Voce esta\x8F morto",
			["DEAD2"]="Voce nao pode reviver ou falar com vivos",
			["MIDJOIN1"]="Voce entrou em uma \x84rodada intermediaria\x80, aguarde a nova",
			["MIDJOIN2"]="rodada para jogar",
			["ALONE1"]="Precisa-se de\x84 2 jogadores \x80para",
			["ALONE2"]="o jogo comecar,",
			["ALONE3"]="aguarde \x84mais um\x80 jogador para iniciar",
			["WINNERS_HUD"]="Vencedores: ",
			["WIN0_HUD"]="EMPATE!",
			["WIN1_HUD"]="\x85".."ASSASINOS",
			["WIN2_HUD"]="\x84XERIFES\x80 e \x83INOCENTES",
			["CurrentLang"]="Seu idioma atual em uso e\x82 Portugues\x80\nVoce pode altera-lo com \x87MMLANG [idioma]",
			["LangSet"]="O idioma pessoal para Murder Mystery foi definido para\x82 Portugues"
		},["UA"]={ -- Ukrainian by LeonardoTheMutant (since SRB2 supports only ASCI and not cyrilic this whole lang text is "Jee Jee" instead of "GG")
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="LeonardoTheMutant",
			["DEADSTRNUM"]=3,
			["MIDJOINSTRNUM"]=1,
			["ALONESTRNUM"]=2,
			["SCORESSTRNUM"]=4,
			["MM"]="Tajemnycia Wbywstwa",
			["R1_GET"]="Ty \x85wbywcia\x80! \x85Zamorduj usih.",
			["R2_GET"]="Ty \x84Sheryf\x80!\x84 Likwiduj usih wbywc'\x80. Jaksho zab'jesh Newynnogo ty prograjesh.",
			["R3_GET"]="Ty \x83Newynnyj\x80! Showajsia i dopomozhy Sheryfowi znajty Wbywciu.",
			["NewMurderer"]="\x87Zhyttia zrobylo \x85Wbywciu\x87 z tebe, \x85teper pidy i wbyj usih.",
			["NewSheriff"]="\x87Wsesvit zrobyw tebe nowym \x84Sheryfom\x87! Teper ce twoja robota \x84wyeliminuwaty usih wbywc\x87!",
			["HitTeammate_atacker"]="\x85Gej, ce twij naparnyk, ne namagajsia wbyty jogo znow",
			["HitTeammate_victim"] ="\x85Twij naparnyk zachepyw tebe, ne zlys na niogo",
			["MurdersWin"]="Usi mertwi, \x85Wbywci\x80 wygraly!",
			["MurdererKilled_str"]="\x85Wbywcia\x87 ",
			["MurdererKilled_end"]="\x80 buw likwidowanyj!",
			["SheriffsWin"]="Wsi Wbywci buly eliminowani, \x84Sheryfy\x80 i wsi \x83Newynni\x80 wygraly!",
			["SheriffKilled_str"]="\x84Sheryf\x87 ",
			["SheriffKilled_end"]="\x80 buw wbytyj! \x83Newynni\x80 mozhut' wziaty jogo Smaragd shob zabraty jogo rol'!",
			["SheriffKilledNoDrop_end"]="\x80 buw wbytyj!",
			["SheriffDropPicked"]="Htos z Newynnych wziaw \x84Smaragd Sheryfa\x80...",
			["SheriffKillInnoPM"]="\x87Ty wbyw \x83Newynnogo\x87! Ty bilshe ne \x84Sheryff\x87!",
			["SheriffKillInno"]="\x84Sheryff\x80 wbyw Newynnogo! Komus z \x83Newynnych\x80 potribno zakinchyty jogo robotu!",
			["MurdersWinNoInnos"]="\x85Wbywci\x80 wygraly bo \x84Sheryff\x80 wbyw ostanniogo Newynnogo!",
			["LastInnoLeft"]="Ostannij \x83Newynnyj\x80 pokynuw gru!",
			["LastMurdLeft"]="Ostannij \x85Wbywcia\x80 pokynuw gru!",
			["MurdLeftReplace"]="\x85Wbywcia\x80 pokynuw gru! Htos z \x83Newynnych\x80 wziaw jogo rol!",
			["OneMurdLeft"]="Odyn z \x85Wbywc\x80 pokynuw gru!",
			["LastSheriffLeft"]="Ostannij \x84Sheryff\x80 pokynuw gru!",
			["SheriffLeftReplace"]="\x84Sheryff\x80 pokynuw gru! Htos z \x83Newynnych\x80 wziaw jogo rol!",
			["OneSheriffLeft"]="Odyn z \x84Sheryffiw\x80 pokynuw gru!",
			["TeamSwitch"]="Ne mozhna prosto tak staty \x8FMetrwym\x80!",
			["PlrsJoined"]="\x84".."3 grawci pryjednalysia! \x87Tajemnycia Wbywstwa\x80 pochnetsia na nastupnomu raundi!",
			["MsgNotSent"]="she zhywyj, powidomlennia ne widislano",
			["MsgDelay"]="Ty pyshesh zabagato powidomlen', bud' laska zachekaj",
			["R1_HUD"]="\x85WBYWCIA",
			["R2_HUD"]="\x84SHERYF",
			["R3_HUD"]="\x83NEWYNNYJ",
			["DD_HUD"]="\x8FMERTWYJ",
			["TeamLeft_HUD"]="Naparnykiw w zhywych: ",
			["KILLBY_HUD"]="Wbytyj grawcem ",
			["SCORES1_HUD"]="Tablyci ochok tut nema, ale lichylnyki\nunyzu mozhut dopomogty",
			["SCORES2_HUD"]="\nJaksho ty nowachok u cij gri\nwykorystaj \x87MMHELP\x80 w Konsoli",
			["SCORES3_HUD"]="\n\n\x82Udachi ;)",
			["SCORES4_HUD"]="\n\nP.S. Duzhe klasno jaksho ty use ce\nmozhesh prochytaty!",
			["SCORESR1_HUD"]="\x85Wbywc w zhywych: ",
			["SCORESR2_HUD"]="\x84Sheryfiw w zhywych: ",
			["SCORESR3_HUD"]="\x83Newynnych w zhywych: ",
			["DEAD1"]="Ty\x8F mertwyj",
			["DEAD2"]="Ne mozhesh widrodzhuwatysia",
			["DEAD3"]="abo goworyty do zhywyh",
			["MIDJOIN1"]="Ty pryjednawsia \x84posered raundu\x80, pochekaj nowogo raundu shob zagraty",
			["ALONE1"]="Potribno \x84".."2 grawcia\x80 dla gry,",
			["ALONE2"]="zachekaj na \x84she odnogo\x80 grawcia aby pochaty",
			["WINNERS_HUD"]="Wygraly: ",
			["WIN0_HUD"]="NICHYJA!",
			["WIN1_HUD"]="\x85WBYWCI",
			["WIN2_HUD"]="\x84SHERYFY\x80 ta \x83NEWYNNI",
			["CurrentLang"]="\x82Ukrainska\x80 wstanowlena jak twoja mowa w Tajemnyci Wbywstw\nMozhesh zminyty jiji za dopomogoju \x87MMLANG [mowa]",
			["LangSet"]="Personalna mowa dla Tajemnyci Wbywstw wstanowlena na \x82Ukrainsku"
		}
	},
	CharStats={
		default={
			ability=CA_NONE,
			ability2=CA_NONE,
			actionspd=40*FU,
			charflags=0,
			mindash=3*FU,
			maxdash=30*FU
		}
	}
})

--globaly used functions in MM
MurderMystery.AddCharStat = function(skin, tb)
	if not skin error("Invalid skin.") end
	if not tb error("Invalid table.") end
	if type(skin)~="string" error("Skin must be string.") end
	if type(tb)~="table" error("tb must phrase as a table.") end
	MurderMystery.CharStats[skin]=tb;
end
MurderMystery.AddLang = function(langID,langTbl)
	if not langID error("Invalid Language Index") end
	if not langTbl error("Invalid Language Table.") end
	if type(langID)~="string" error("Language ID must be 2 letters long.") end
	if type(langTbl)~="table" error("Language Talbe must phrase as a table.") end
	for l in pairs(MurderMystery.text)
		if l==langID
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MurderMystery.text[langID:upper()]=langTbl
	print("\x83Succesfuly added \x82"..langID.." \x83(by "..tostring(MurderMystery.text[langID:upper()]["AUTHOR"])..") lang as a MM language.")
	if MurderMystery.text[langID:upper()]["VERSION"]~=MurderMystery.version print("\x82WARNING:\x80 Selected language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MurderMystery.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MurderMystery.version) end
end
MurderMystery.playerCount=function()
	local plrc=0
	for p in players.iterate plrc=$1+1 end
	return plrc
end
MurderMystery.howMuchPlayersAlive=function()
	local plrs=0
	for p in players.iterate if not p.spectator plrs=$1+1 end end
	return plrs
end
MurderMystery.howMuchPlayersWithRole=function(r)
	local plrs=0
	for p in players.iterate if p.role==r plrs=$1+1 end end
	return plrs
end
--CVARs
local function VarChange(v)
	if v.name=="mmcharmode"
		if v.value print("\x87Murder Mystery:\x80 Vanilla character abbilities turned ON, but in limited form")
		else print("\x87Murder Mystery:\x80 \"Regular person\" character mode enabled (abbilities off)") end
	elseif v.name=="mmsprint"
		if v.value print("\x87Murder Mystery:\x80 Everyone now can use sprinting by holding CUSTOM1 button!")
		else print("\x87Murder Mystery:\x80 Sprinting is now disabled") end
	end
end
CV_RegisterVar{name="mmcharmode",defaultvalue="Off",PossibleValue=CV_OnOff,flags=6,func=VarChange}
CV_RegisterVar{name="mmsprint",defaultvalue="Off",PossibleValue=CV_OnOff,flags=6,func=VarChange}
CV_RegisterVar{name="mmchatdelay", defaultvalue=35, flags=4, PossibleValue=CV_Unsigned}
CV_RegisterVar{name="mmafkdelay",defaultvalue=4200,PossibleValue={MIN=0,MAX=21000},flags=4}

--The SRB2 init

print("\x87MURDER MYSTERY v"..MurderMystery.version)
print("\x83".."Beginning of the \x87Murder Mystery\x83 loading...")

freeslot('tol_mm','SFX__MMDTH', 'SFX_MMDTH2', 'SFX_DAMFLL','MT_SHREML', 'MT_MMSTEP', 'S_MMSTEP', 'SPR_STEPA0',
'SFX_EMJ00', 'SFX_EMJ01', 'SFX_EMJ02', 'SFX_EMJ03', 'SFX_EMJ04', 'SFX_EMJ05', 'SFX_EMJ06', 'SFX_EMJ07', 'SFX_EMJ08', 'SFX_EMJ09',
'SFX_EMJ0A', 'SFX_EMJ0B', 'SFX_EMJ0C', 'SFX_EMJ0D', 'SFX_EMJ0E', 'SFX_EMJ0F', 'SFX_EMJ10', 'SFX_EMJ11', 'SFX_EMJ12')
G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MM,
	rules = GTR_SPECTATORS|GTR_TIMELIMIT|GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_NOSPECTATORSPAWN|GTR_SPAWNINVUL,
	rankingtype = GT_MATCH,
	intermissiontype = int_match,
	defaulttimelimit = 5,
	headerleftcolor = 38,
	headerrightcolor = 150,
	description = "Kill everyone as Murderer or eliminate him as Sheriff! ...or be none of them and be Innocent"
})
mobjinfo[MT_SHREML]={ --Sheriff Drop Emerald
	spawnstate=S_CEMG3,
	deathstate=S_SPRK1,
	deathsound=sfx_cgot,
	spawnhealth=1000,
	radius=16*FU,
	height=32*FU,
	reactiontime=8,
	mass=16,
	speed=EMERALD3
}
states[S_MMSTEP]={
	sprite=SPR_STEPA0,
	frame=FF_SEMIBRIGHT|FF_FLOORSPRITE|A,
	tics=700,
	action=A_None,
	nextstate=S_NULL
}
mobjinfo[MT_MMSTEP]={ --footstep mark
	spawnstate=S_MMSTEP,
	deathstate=S_NULL,
	deathsound=sfx_null,
	spawnhealth=1,
	radius=FU,
	height=FU,
	reactiontime=8,
	speed=FU,
	flags=512
}
sfxinfo[sfx__mmdth].caption="Killed"
sfxinfo[sfx_mmdth2].caption="Killed"
--for MAPK5 (Dam Zone)
sfxinfo[sfx_damfll].caption="Falling from the Dam..."
--Chat sound emojis
sfxinfo[sfx_emj00].caption="skull"
sfxinfo[sfx_emj01].caption="hehe"
sfxinfo[sfx_emj02].caption="fart"
sfxinfo[sfx_emj03].caption="OOOOOhhhh myy gooodddd...."
sfxinfo[sfx_emj04].caption="bruh"
sfxinfo[sfx_emj05].caption="/:|"
sfxinfo[sfx_emj06].caption="wow"
sfxinfo[sfx_emj07].caption="AMONGUS"
sfxinfo[sfx_emj08].caption="OH NO"
sfxinfo[sfx_emj09].caption="SUS"
sfxinfo[sfx_emj0a].caption="AGGHHHHH"
sfxinfo[sfx_emj0b].caption="AHA!"
sfxinfo[sfx_emj0c].caption="NO WAY!"
sfxinfo[sfx_emj0d].caption="nope."
sfxinfo[sfx_emj0e].caption="GET OVER HERE"
sfxinfo[sfx_emj0f].caption="NOOOOOoooooo..."
sfxinfo[sfx_emj10].caption="HELP"
sfxinfo[sfx_emj11].caption="HEHEHE HA"
sfxinfo[sfx_emj12].caption="hehe boiii..."

--stability code
addHook("PlayerThink", do
	if gametype!=GT_MURDERMYSTERY return end
	if CV_FindVar('rejointimeout').value~=0 --REJOINTIMEOUT kills Murder Mystery. Why? You have to wait X minutes for game to finally triger player quit! SRB2 2.2.11 disabled changing this CVAR from LUA. What a stupid decision
		CONS_Printf(server, "ADMIN, DISABLE THE \x87REJOINTIMEOUT\x80, MM DOESN'T WORK PROPERLY WITH THIS CVAR")
	end
	if CV_FindVar('timelimit').value==0 COM_BufInsertText(server, "timelimit 5") end --if someone will think that TIMELIMIT is a joke
end)