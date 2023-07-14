if MurderMystery error("Murder Mystery gametype is already loaded") end
rawset(_G, "MurderMystery", {})
MurderMystery.version="8.0-BETA"
MurderMystery.devbuild="dev14072023"
MurderMystery.releasedate="Not released yet"
MurderMystery.text={ --Nearly all text used in the add-on with the translations
	["EN"]={ -- English
		--GAME.LUA
		--"You got the role"
		["RM_get"]="You're the \x85Murderer\x80! \x85Murder everyone.",
		["RS_get"]="You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. If you kill an Innocent, you lose.",
		["RI_get"]="You're an \x83Innocent\x80! Hide and help the sheriff find the murderer.",
		-- setRandomPlayerAs()
		["NewMurderer"]="\x87Life made a \x85Murderer\x87 from you, \x85now go kill everyone.",
		["NewSheriff"]="\x87The Universe made you the new \x84Sheriff\x87! It's now your job to\x84 eliminate all Murderers\x87!",
		-- Murderer hit/killed
		["HitMTeammate_atacker"]="\x85Hey, this guy is your teammate, don't try to kill him again",
		["HitMTeammate_victim"]="\x85Your teammate hit you, don't get mad on him",
		["MurdersWin"]="Everyone are murdered, \x85Murderers\x80 win!",
		["MurdererKilled_str"]="\x85Murderer\x87 ",
		["MurdererKilled_end"]="\x80 was eliminated!",
		-- Sheriff hit/killed
		["HitSTeammate_atacker"]="\x84Hey, this guy is your teammate, don't try to kill him again",
		["HitSTeammate_victim"]="\x84Your teammate hit you, don't get mad on him",
		["SheriffsWin"]="All murderers eliminated, \x84Sheriffs\x80 & all \x83Innocents\x80 win!",
		["SheriffKilled_str"]="\x84Sheriff\x87 ",
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
		-- "You can't become spectator" & "Enough players joined"
		["TeamSwitch"]="You can't just become\x8F dead\x80 to spectate!",
		["PlrsJoined"]="\x84".."3 players joined!\x80 The \x87Murder Mystery\x80 game will start on the next round!",
		--CHAT.LUA
		["MsgNotSent"]="is alive, message not sent",
		["MsgDelay"]="You're sending too much messages, please wait",
		--HUD.LUA (Role names and labels)
		["RM_HUD"]="MURDERER",
		["RS_HUD"]="SHERIFF",
		["RI_HUD"]="INNOCENT",
		["DD_HUD"]="DEAD",
		["TeamLeft_HUD"]="Teammates alive: ",
		["MATCH_HUD"]="MATCH DUEL MODE",
		["KILLBY_HUD"]="Killed by ",
		--COMMAND.LUA (MMLANG part)
		["CurrentLang"]="Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]\x80\nAvailable languages: EN (this lang), ES, PL, PT, UA",
		["LangSet"]="Personal language for Murder Mystery is set to\x82 English"
	},["ES"]={ -- Spanish by SlainLBS & Jesus.B
		["RM_get"]="Eres el\x85 Asesino\x80!\x85 Acaba con todos.",
		["RS_get"]="Eres el\x84 Comisario\x80!\x84 Elimina al Asesino.\x80 Si matas al Inocente, pierdes.",
		["RI_get"]="Eres un \x83Inocente\x80! Escondete y ayuda al Comisario a encontrar el Asesino. ",
		["NewMurderer"]="\x87La Vida te hizo un\x85 Asesino\x87,\x85 ahora ve a matar a todos.",
		["NewSheriff"]="\x87".."El Universo the ha hecho el nuevo\x84 Comisario\x87! Ahora tu trabajo es\x84 eliminar a todos los asesinos\x87!",
		["HitMTeammate_atacker"]="\x85Oye, este tipo es tu aliado, no vuelvas a intentar matarlo",
		["HitMTeammate_victim"]="\x85Tu aliado te golpeo, no te enojes con el",
		["MurdersWin"]="Todos estan asesinados, los\x85 Asesinos\x80 ganan!",
		["MurdererKilled_str"]="\x85".."El Asesino\x87 ",
		["MurdererKilled_end"]="\x80 fue eliminado!",
		["HitSTeammate_atacker"]="\x84Oye, este tipo es tu aliado, no vuelvas a intentar matarlo",
		["HitSTeammate_victim"]="\x84Tu aliado te golpeo, no te enojes con el",
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
		["PlrsJoined"]="\x84".."3 jugadores se unieron!\x80 la partida de \x87Misterio De Asesinato\x80 empezara la siguiente ronda!",
		["MsgNotSent"]="esta vivo, el mensaje no ha sido enviado",
		["MsgDelay"]="Estas enviando demasiados mensajes, porfavor espera",
		["RM_HUD"]="ASESINO",
		["RS_HUD"]="COMISARIO",
		["RI_HUD"]="INOCENTE",
		["DD_HUD"]="MUERTO",
		["TeamLeft_HUD"]="Aliados vivos: ",
		["MATCH_HUD"]="MODO DUELO",
		["KILLBY_HUD"]="Asesinado por ",
		["CurrentLang"]="Tu idioma actual en uso es el\x82 Espanol\x80\nLo puedes cambiar con \x87MMLANG [idioma]\x80\nIdiomas disponibles: EN, ES (este idioma), PL, PT, UA",
		["LangSet"]="El Idioma personal para Misterio De Asesinato ha sido cambiado a\x82 Espanol"
	},["PL"]={ -- Polish by sopix
        ["RM_get"]="Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
        ["RS_get"]="Jestes \x84Szeryfem\x80! \x84Wyeliminuj wszystkich Morderc\x80. Jesli zabijesz Niewinnego, przegrywasz",
        ["RI_get"]="Jestes \x83Niewinnym\x80! Schowaj sie i pomoz Szeryfowi znalezc Morderce.",
		["NewMurderer"]="\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
		["NewSheriff"]="\x87Wszechswiat mianowal cie nowym \x84Szeryfem\x87! To teraz twoja robota aby\x84 wyeliminowac wszystkich Mordercow\x87!",
		["HitMTeammate_atacker"]="\x85Hej, ten ktos jest w twojej drużynie, nie próbuj go ponownie zabic",
		["HitMTeammate_victim"]="\x85Ktos z twojej druzyny cie strzelil, nie badz zly na niego",
		["MurdersWin"]="Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
		["MurdererKilled_str"]="\x85Morderca\x87 ",
		["MurdererKilled_end"]="\x80 zostal wyeliminowany!",
		["HitSTeammate_atacker"]="\x84Hej, ten ktos jest w twojej druzynie, nie probuj go ponownie zabic",
		["HitSTeammate_victim"]="\x84Ktos z twojej druzyny cie strzelil, nie badz zly",
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
		["PlrsJoined"]="\x84".."3 graczy dolaczylo\x80 do \x87Tajemnicy Morderstw\x80, gra sie zacznie w nastepnej rundzie!",
		["MsgNotSent"]="jest zywy, wiadomosc nie zostala wyslana",
		["MsgDelay"]="Wysylasz za duzo wiadomosci, prosze poczekac",
		["RM_HUD"]="MORDERCA",
        ["RS_HUD"]="SZERYF",
        ["RI_HUD"]="NIEWINNY",
        ["DD_HUD"]="MARTWY",
        ["TeamLeft_HUD"]="Zywi w druzynie: ",
		["MATCH_HUD"]="TRYB DUEL MATCH",
		["KILLBY_HUD"]="Zabity przez ",
		["CurrentLang"]="\x82Polski\x80 ustanowiony jako twoj jezyk w Tajemnicy Morderstw\nMozesz zmienic go za pomocy \x87MMLANG [jezyk]\x80\nDostepne jezyki: EN, ES, PL (ten jezyk), PT, UA",
		["LangSet"]="Personalny jezyk dla Tajemnicy Morderstw ustanowiony na \x82Polski"
	},["PT"]={ --Portugesse (Brazilian) by King Jonas
		["RM_get"]="Voce e o \x85 Assassino\x80! \x85 Assassine todos.",
		["RS_get"]="Voce e o \x84Xerife\x80!\x84 Elimine todos os Assassinos\x80. Se voce matar um Inocente, voce perde.",
		["RI_get"]="Voce e um \x83Inocente\x80! Esconda-se e ajude o Xerife a encontrar o assassino.",
		["NewMurderer"]="\x87O Universo fez de voce um\x85 Assasino, agora va matar todo mundo",
		["NewSheriff"]="\x87O Universo fez de voce o novo \x84Xerife\x87! Agora e seu trabalho\x84 eliminar todos os Assassinos\x87!",
		["HitMTeammate_atacker"]="\x85".."Ei, esse cara e seu companheiro de equipe, nao tente mata-lo novamente",
		["HitMTeammate_victim"]="\x85Seu companheiro de equipe acertou voce, nao fique bravo com ele",
		["MurdersWin"]="Todos foram assassinados, Os\x85 Assasinos\x80 venceram!",
		["MurdererKilled_str"]="O\x85 Assasino\x87 ",
		["MurdererKilled_end"]="\x80 foi eliminado!",
		["HitSTeammate_atacker"]="\x84".."Ei, esse cara e seu companheiro de equipe, nao tente mata-lo novamente",
		["HitSTeammate_victim"]="\x84Seu companheiro de equipe acertou voce, nao fique bravo com ele",
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
		["PlrsJoined"]="\x84".."3 jogadores se juntaram!\x80 O jogo \x87Murder Mystery\x80 comecara na proxima rodada!",
		["MsgNotSent"]="esta vivo, mensagem nao enviada",
		["MsgDelay"]="Voce esta enviando muitas mensagens, aguarde",
		["RM_HUD"]="ASSASINO",
		["RS_HUD"]="XERIFE",
		["RI_HUD"]="INOCENTE",
		["DD_HUD"]="MORTO",
		["TeamLeft_HUD"]="Companheiros de equipe vivos: ",
		["MATCH_HUD"]="MODO DE DUELO DE PARTIDA",
		["KILLBY_HUD"]="Morto por ",
		["CurrentLang"]="Seu idioma atual em uso e\x82 Portugues\x80\nVoce pode altera-lo com \x87MMLANG [idioma]\x80\nIdiomas disponiveis: EN, ES, PL, PT (este idioma), UA",
		["LangSet"]="O idioma pessoal para Murder Mystery foi definido para\x82 Portugues"
	},["UA"]={ -- Ukrainian by LeonardoTheMutant (since SRB2 supports only ASCI and not cyrilic this whole lang text is "Jee Jee" instead of "GG")
		["RM_get"]="Ty \x85wbywcia\x80! \x85Zamorduj usih.",
		["RS_get"]="Ty \x84Sheryf\x80!\x84 Likwiduj usih wbywc'\x80. Jaksho zab'jesh Newynnogo ty prograjesh.",
		["RI_get"]="Ty \x83Newynnyj\x80! Showajsia i dopomozhy Sheryfowi znajty Wbywciu.",
		["NewMurderer"]="\x87Zhyttia zrobylo \x85Wbywciu\x87 z tebe, \x85teper pidy i wbyj usih.",
		["NewSheriff"]="\x87Wsesvit zrobyw tebe nowym \x84Sheryfom\x87! Teper ce twoja robota \x84wyeliminuwaty usih wbywc\x87!",
		["HitMTeammate_atacker"]="\x85Gej, ce twij naparnyk, ne namagajsia wbyty jogo znow",
		["HitMTeammate_victim"] ="\x85Twij naparnyk zachepyw tebe, ne zlys na niogo",
		["MurdersWin"]="Usi mertwi, \x85Wbywci\x80 wygraly!",
		["MurdererKilled_str"]="\x85Wbywcia\x87 ",
		["MurdererKilled_end"]="\x80 buw likwidowanyj!",
		["HitSTeammate_atacker"]="\x84Gej, ce twij naparnyk, ne namagajsia wbyty jogo znow",
		["HitSTeammate_victim"]="\x84Twij naparnyk zachepyw tebe, ne zlys na niogo",
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
		["RM_HUD"]="WBYWCIA",
		["RS_HUD"]="SHERYF",
		["RI_HUD"]="NEWYNNYJ",
		["DD_HUD"]="MERTWYJ",
		["TeamLeft_HUD"]="Naparnykiw w zhywych: ",
		["MATCH_HUD"]="REZHYM MATCH DUEL",
		["KILLBY_HUD"]="Wbytyj grawcem ",
		["CurrentLang"]="\x82Ukrainska\x80 wstanowlena jak twoja mowa w Tajemnyci Wbywstw\nMozhesh zminyty jiji za dopomogoju \x87MMLANG [mowa]\x80\nDostupni mowy: EN, ES, PL, PT, UA (ca mowa)",
		["LangSet"]="Personalna mowa dla Tajemnyci Wbywstw wstanowlena na \x82Ukrainsku"
	}
}

MurderMystery.CharStats={
	default={
		ability=CA_NONE,
		ability2=CA_NONE,
		actionspd=40*FU,
		charflags=0,
		mindash=3*FU,
		maxdash=30*FU
	}
};
--globaly used functions in MM
MurderMystery.AddCharStat = function(skin, tb)
	if not skin error("Invalid skin.") end
	if not tb error("Invalid table.") end
	if type(skin) ~= "string" error("Skin must be string.") end
	if type(tb) ~= "table" error("tb must phrase as a table.") end
	MurderMystery.CharStats[skin]=tb;
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

print("\x87MURDER MYSTERY v"..MurderMystery.version)
print("\x83".."Beginning of the \x87Murder Mystery\x83 loading...")

freeslot('tol_mm','SFX__MMDTH', 'SFX_MMDTH2', 'SFX_DAMFLL','MT_SHREML', 'MT_MMSTEP', 'S_MMSTEP', 'SPR_STEPA0',
'SFX_EMJ00', 'SFX_EMJ01', 'SFX_EMJ02', 'SFX_EMJ03', 'SFX_EMJ04', 'SFX_EMJ05', 'SFX_EMJ06', 'SFX_EMJ07', 'SFX_EMJ08', 'SFX_EMJ09',
'SFX_EMJ0A', 'SFX_EMJ0B', 'SFX_EMJ0C', 'SFX_EMJ0D', 'SFX_EMJ0E', 'SFX_EMJ0F', 'SFX_EMJ10', 'SFX_EMJ11')
G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MM,
	rules = GTR_SPECTATORS|GTR_TIMELIMIT|GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_NOSPECTATORSPAWN,
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
	frame=FF_SEMIBRIGHT|A,
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
sfxinfo[sfx__mmdth].caption="You are killed"
sfxinfo[sfx_mmdth2].caption="You are killed"
--for MAPK5 (Dam Zone)
sfxinfo[sfx_damfll].caption="Falling from the Dam..."
--Chat sound emojis
sfxinfo[sfx_emj00].caption="skull"
sfxinfo[sfx_emj01].caption="chuckle"
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
sfxinfo[sfx_emj11].caption="HEHEHE HAW"

--stability code
addHook("ThinkFrame", do
	if gametype!=GT_MURDERMYSTERY return end
	for p in players.iterate
		if p==server
			if CV_FindVar('rejointimeout').value!=0 --REJOINTIMEOUT kills Murder Mystery. Why? You have to wait X minutes for game to finally triger player quit! SRB2 2.2.11 disabled changing this CVAR from LUA. What a stupid decision
				COM_BufInsertText(server, "MAP M0 -GAMETYPE MATCH")
				chatprint("\x81Your server has \x87REJOINTIMEOUT\x81 enabled. Please turn it \"off\" (or 0) to make Murder Mystery start working. You will continue seeing this message if you won't make REJOINTIMEOUT 0")
			end
			if CV_FindVar('timelimit').value==0 CV_Set(CV_FindVar('timelimit'), 5) end --if someone will think that TIMELIMIT is a joke
		else return end
	end
end)