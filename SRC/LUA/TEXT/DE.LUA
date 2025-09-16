-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- GERMAN
-- Made by LeonardoTheMutant

-- DISCLAMER:
-- Ich kann Deutsch sprechen, aber meine Kenntnisse dieser Sprache sind nicht perfekt
-- Ich musste mich die meiste Zeit auf die Übersetzungstools verlassen, daher entschuldige ich mich für den schlechten Text.

MM.AddLang("DE", {
	["VERSION"] = "1.3",
	["AUTHOR"] = "LeonardoTheMutant",
	["CON_MMLANG"] = {
		"Deine aktuell verwendete Sprache ist\x82 Deutsch\x80.\nDu kannst es mit dem Befehl \x87MMLANG [sprache]\x80 andern.",
		"Die Sprache fur Murder Mystery ist auf Deutsch eingestellt."
	},
	["CHAT_ROLEGET_PM"] = {
		"Du bist der \x85Morder\x80. \x85Tote sie alle.",
		"Du bist der \x84Sheriff\x80!\x84 Beseitige alle Morder\x80. Tote die\x83 falsche Person\x80, und die Rolle gehort dir nicht mehr.",
		"Du bist ein \x83Zivilist\x80! Versteck dich und hilf bei den Ermittlungen."
	},
	["CHAT_NEWROLEGET_PM"] = {
		"\x87".."Das Leben hat zufallig entschieden, dass du ein \x85Morder\x87 sein wirst. \x85Jetzt geh und tote alle!",
		"\x87".."Das Universum hat dich zum \x84Sheriff\x87 ernannt! Geh und\x84 eliminier alle Morder\x87!",
		"\x87".."Es wurde beschlossen, dass du ein x\82Held\x87 sein wirst. Rette alle vor den Mordern!",
		"\x87".."Du hast einen der \x85Morder\x87 ausgeschaltet! Du hast dir die Ehre eines \x82Helden\x87 verdient!"
	},
	["CHAT_TEAMMATEHIT_PM"] = {
		"Vorsicht! Das ist dein Teamkollege. Vermeide das nachste mal Friendly Fire!",
		"Ein Teamkollege hat dich versehentlich getroffen. Rache ist NICHT empfehlenswert!"
	},
	["CHAT_MURDKILLED"] = {
		"\x85Morder",
		"wurde eliminiert!",
	},
	["CHAT_SHERIKILLED"] = {
		"\x84Sheriff",
		"wurde ermordet!",
		"Finden Sie ihren \x84Smaragd\x80!"
	},
	["CHAT_HEROKILLED"] = {
		"\x82Held",
		"wurde ermordet!",
	},
	["CHAT_DIEDHAZARD"] = "ist gestorben. Traurig.",
	["CHAT_SHREMDPICKUP"] = "Jemand hat den \x84Smaragd des Sheriffs\x80 an sich genommen...",
	["CHAT_KILLPUNISHMENT_PM"] = {
		"\x87".."Du hast haben einen \x83Zivilisten\x87 ermordet.! Du bist gefeuert worden. (Du bist nicht mehr Sheriff)",
		"\x82Helden\x87 sollen keine \x83Zivilisten\x87 toten! Du wurdest wegen Kriegsverbrechen \x85hingerichtet\x87.",
		"\x87Oh nein! Du hast einen \x84Sheriff\x87 emordet!!! Du wurdest dafur \x85hingerichtet\x87...",
		"\x87".."Du hast einen \x83Zivilisten\x87 ermordet, genau wie dich selbst! Du wurdest fur dein Verbrechen \x85hingerichtet\x87.",
		"\x87Oh nein! Du hast einen \x82Helden\x87 ermordet! Dafur wurdest du \x85hingerichtet\x87."
	},
	["CHAT_INNOHURT"] = {
		"Der \x84Sheriff\x80 hat einen \x83Zivilisten\x80 ermordet! Jemand anderes sollte die Arbeit zu Ende bringen!",
		"Durch die Totung des \x83Zivilisten\x80 wurde der \x82Held\x80 zum\x85 Bosewicht\x80 und bezahlte dafur den Preis."
	},
	["CHAT_ONEQUIT"] = {
		"Einer der \x85Morder\x80 hat verlassen!",
		"Einer der \x84Sheriffs\x80 het verlassen!",
		"Einer der \x82Helden\x80 hat verlassen!!!"
	},
	["CHAT_LASTQUIT"] = {
		"Der letzte \x85Morder\x80 hat verlassen!",
		"Der letzte \x85Sheriff\x80 hat verlassen!",
		"Der letzte \x82Held\x80 hat alle im Stich gelassen!"
	},
	["CHAT_REPLACEQUIT"] = {
		"Der \x85Morder\x80 ist geflohen! Ein zufalliger \x83Zivilist\x80 wird ihre Rolle ubernehmen!",
		"Der \x84Sheriff\x80 ist geflohen! Ein zufalliger \x83Zivilist\x80 wird ihre Rolle ubernehmen!",
		"Der \x82Held\x80 ist geflohen! Ein zufalliger \x83Zivilist\x80 wird ihre Rolle ubernehmen!"
	},
	["CHAT_ENDROUND"] = {
		"Alle sind tot. Die \x85Morder\x80 gewinnen!",
		"Alle \x85Morder\x80 wurden getotet! Die\x83 Zivilisten\x80 gewinnen!",
		"Die \x85Morder\x80 gewinnen, weil der \x84Sheriff\x80 den letzten Zivilisten ermordet hat! Schande uber den \x84Sheriff\x80...",
		"Die \x85Morder\x80 gewinnen, weil der \x82Held\x80 sich entschieden hat, den letzten Zivilisten zu toten. Schande uber einen solchen \x82Helden\x80...",
		"Die Verteidiger der \x83Zivilisten\x80 sind tot. Die \x85Morder\x80 gewinnen!"
	},
	["BMP_VICTIMS"] = {data={
		"\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIII\31",
		"II\x1FFFII\x1FFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIII\31",
		"II\x1FFFII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFFII\31",
		"\xFFIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFFII\31",
		"\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\31"
	}},
	["BMP_SUSPECTS"] = {yoff=2,data={
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFII\x1FFFII\31",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FFFII\x1F1F\x1F1F\31",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FII\x1FFFII\31",
		"\x1FIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFF1FII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFF\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\x1FIIII\x1F1F\xFFIIIIII\31",
		"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1F1F\31"
	}},
	["BMP_TIME"] = {data={
		"\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\31",
		"\xFF1F\x1F1FIII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\x1F1FII\x1F1F\31",
		"\xFFFF\xFFIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\31",
		"\xFFFFIII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFFIII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFFII\31",
		"III\x1FFF\xFFFF\xFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFFII\31",
		"II\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFFII\31",
		"\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\31"
	}},
	["BMP_RINGS"] = {data={
		"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\31",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFIIIIII\31",
		"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFFII\x1F1F\x1F1F\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F1F\31"
	}},
	["HUD_MM"] = "Murder Mystery",
	["HUD_SUSPECTS"] = "Verdächtige",
	["HUD_VICTIMS"] = "Opfer",
	["HUD_TEAMMATES"] = "Teamkollegen",
	["HUD_ROLES"] = {
		"MÖRDER",
		"SHERIFF",
		"ZIVILIST",
		"HELD",
		"TOT"
	},
	["HUD_KILLEDBY"] = {
		"Getötet von",
		"Justiz",
		"die Falle"
	},
	["HUD_SCORESTAB"] = {
		"Wenn du neu in diesem Spielmodus bist,",
		"verwende den Befehl \1\x87MMHELP\4 in der Konsole,",
		"um Hilfe zu erhalten.",
		"",
		"",
		"\1\x82Viel Spaß!"
	},
	["HUD_ROLETARGET"] = {
		"Sich einfügen, Vertrauen aufbauen,\ndann zuschlagen.",
		"Finde und eliminiere alle Mörder.\nTöte keine Zivilisten!",
		"Versteck dich und schütze dich.\nHilf bei den Ermittlungen, wenn möglich.",
		"Du hast die Chance, alle Mörder zu stoppen.\nGeh und rette die Lage, aber sei vorsichtig!"
	},
	["HUD_ROLESALIVE"] = {
		"Mörder",
		"Sheriffs",
		"Zivilisten"
	},
	["HUD_DEAD"] = {
		"Du bist \1\x8Ftot\4.",
		"Du kannst nicht wiederbelebt",
		"werden oder mit Personen sprechen",
		"die noch am Leben sind."
	},
	["HUD_MIDJOIN"] = {
		"Du bist \1\x84mitten im Spiel\4 eingestiegen, bitte warte bis zum Ende dieser Runde.",
		"Während du wartest, lies bitte die Spielregeln im \1\x87MMHELP\4-Konsolenbefehl!"
	},
	["HUD_ALONE"] = {
		"\1\x84".."2 Spieler\4 sind für das Spiel erforderlich,",
		"Bitte warten Sie, bis\1\x84 ein weiterer Spieler\4",
		"das Spiel startet."
	},
	["HUD_SNEAKING"] = "Schleichen...",
	["HUD_SHOWDOWN"] = "Showdown Duell!",
	["HUD_MINIGAME"] = {
		["PRESS"] = "Drücke\1\x82 CUSTOM3\4 zum",
		["LEAVE"] = "verlassen",
		["CANCEL"] = "abzubrechen",
		["SPECTATE"] = "zuschauen",
		["DUEL"] = "ein Minispiel-Duell",
		["REQUEST"] = "ein \1\x87PONG-Minispiel\4 anfordern!",
		["START"] = "ein \1\x87\"SONIC RUN\"\4 Minispiel starten!",
		["ACCEPT"] = "die \1\x87PONG\4 Herausforderung annehmen!",
		["WAIT"] = "Warten darauf, dass der Rivale akzeptiert...",
		["SPECTATING"] = "Ein Duell beobachten...",
		["BORED"] = "Langweilst du dich?",
		["GOAL"]="Tor!"
	},
	["HUD_YOU"] = "DU",
	["HUD_WINNERS"] = "Gewinner:",
	["HUD_WIN"] = {
		"UNENTSCHIEDEN!",
		"\1\x85MÖRDER",
		"\1\x83ZIVILISTEN"
	},
	["HUD_PAST"] = "VERGANGEN",
	["HUD_FUTURE"] = "ZUKUNFT",
	["HUD_MMHELP_UI"] = {
		"Verwenden Sie \1\x87JUMP\4/\1\x87SPIN\4 zum Scrollen und \1\x87Next\4/\1\x87Prev Weapon\4 zum Wechseln der Seiten",
		"Drücke\1\x87 CUSTOM1\4, um die Hilfe zu verlassen"
	}, 
	["HUD_MMHELP"] = {
		{
			"\1\x87Willkommen bei \1\x85Murder Mystery\1\x87!",
			"\1\x87".."Eine SRB2-interpretation des beliebten mehrspieler spiel!\n",
			"Das Ziel des Spiels ist es, alle \1\x85Mörder\4 zu finden und zu eliminieren, bevor sie\1\x83 alle anderen\4 töten können. Dieser Spielmodus ähnelt dem MATCH-Modus, daher benötigen Sie präzise Ziel- und Schießfähigkeiten, um zu gewinnen!",
			"\nZunächst gehen wir die Grundlagen durch, damit Sie sofort loslegen und spielen können...",
			"\nHier sind die möglichen \1\x8BRollen\4, die du übernehmen könntest:",
			" * \1\x85Mörder\4 - Ein tödlicher Verbrecher. Seine Aufgabe ist es, alle zu eliminieren.",
			" * \1\x84Sheriff\4 - mit der Aufgabe betraut, die \1\x85Mörder\4 zu finden und zu eliminieren",
			" * \1\x83Zivilist\4 - Muss vermeiden, getötet zu werden, und bei der Identifizierung des \1\x85Mörders\4 helfen. Je nach Spielkonfiguration können sie einen \1\x85Roten Ring\4 erhalten, um sich zu verteidigen, indem sie 100 Ringe (oder 50 Ringe für bestimmte Skins) sammeln.",
			"\nDas sind die wichtigsten Informationen, die du brauchst, um mit dem Spielen zu beginnen. Für weitere Details lies bitte dieses Handbuch bis zum Ende durch."
		},
		{
			"\1\x87Über die Spielsituationen\4\n",
			"Wie in den Grundlagen erwähnt, besteht das Ziel des Spiels darin, alle \1\x85Mörder\4 zu eliminieren, aber während des Spiels können verschiedene Szenarien auftreten:",
			"\n* Wenn du stirbst, gelangst du in den Zustand \1\x8FTot\4. Spieler in diesem Zustand können nicht wiederbelebt werden und nicht global mit Spielern kommunizieren, die noch am Leben sind. Ihre Nachrichten sind nur für andere \1\x8FTote\4 Spieler sichtbar.",
			"Du kannst nicht mit noch lebenden Spielern chatten oder ihnen persönliche Nachrichten senden, während du \1\x8Ftot\4 bist.",
			"Wenn Sie durch Gefahren auf der Karte wie Brecher, Stürze in Gruben oder Ertrinken im Wasser sterben, sind Sie für den Rest der Runde ebenfalls \1\x8Ftot\4.",
			"\1\x82Versuchen Sie außerdem NICHT, sich selbst umzubenennen, während Sie tot sind\4. Weitere Details hierzu finden Sie auf der nächsten Seite.",
			"\n* Die Aufgabe des \1\x84Sheriffs\4 besteht darin, die \1\x85Mörder\4 zu eliminieren, aber achten Sie darauf, nicht versehentlich einen \1\x85Zivilisten\4 zu erschießen.",
			"Wenn ein \1\x84Sheriff\4 einen \1\x83Zivilisten\4 erschießt, verliert er seine \1\x8BRolle\4 und wird selbst zum \1\x83Zivilisten\4. Ein \1\x83zufällig ausgewählter Zivilist\4 übernimmt dann stillschweigend die \1\x8BRolle\4 des \1\x84Sheriffs\4. Überleg dir gut, bevor du den Abzug drückst!",
			"\n* Wenn ein \1\x85Mörder\4 einen \1\x84Sheriff\4 tötet, während noch \1\x85Zivilisten\4 am Leben sind, fällt der \1\x84Smaragd des Sheriffs\4 in der Nähe der Leiche zu Boden.",
			"Wenn ein \1\x83Zivilist\4 den \1\x84Smaragd des Sheriffs\4 aufhebt, wird er zum \1\x82Helden\4. \1\x82Helden\4 sind ähnlich wie \1\x84Sheriffs\4, weisen jedoch einige Unterschiede auf:",
			"  - Wenn ein \1\x82Held\4 einen\1\x83 Zivilisten\4 tötet, sterben beide, und ihre \1\x8Brolle\4 wird nicht neu zugewiesen;",
			"  - \1\x82Helden\4 lassen beim Tod nicht den \1\x84Smaragd des Sheriffs\4 fallen.",
			"\n* In Runden mit einer höheren Anzahl von Spielern kann es mehrere \1\x85Mörder\4 und \1\x84Sheriffs\4 geben. Für diese Runden werden \1\x8ATeams\4 aus \1\x85Mördern\4 und \1\x84Sheriffs\4 gebildet.",
			"Teammitglieder können über den Befehl \1\x87SAYTEAM\4 in der Konsole kommunizieren (die Schaltfläche SAYTEAM funktioniert genauso wie die normale Chat-Schaltfläche) oder indem sie eine Nachricht mit dem Symbol \1\x88%\4 beginnen, wodurch die Nachricht automatisch an die Teammitglieder gesendet wird.",
			"Wenn du versehentlich einen \1\x8Ateamkollegen\4 angreifst, erhalten beide Spieler eine personalisierte Warnung. Sei vorsichtig - solche Teaminteraktionen können deine \1\x8Brolle\4 anderen offenbaren!"
		},
		{
			"\1\x87".."Dinge, die man vermeiden sollte in \1\x85Murder Mystery\4\n",
			"Regel Nr. 1: \1\x82Sei freundlich und hab Spaß!\4 Hier sind einige zusätzliche Richtlinien:",
			"\n* Verrate niemals deine \1\x8BRolle\4, auch nicht im Scherz. Du kannst zwar die \1\x8Brolle\4 eines anderen verraten, wenn du dir sicher bist, aber gib niemals deine eigene preis.",
			"\n* Vermeide es, andere Spieler zu beleidigen. Freundschaftliches Geplänkel ist in Ordnung, aber ständige Anschuldigungen oder feindseliges Verhalten führen dazu, dass andere dir misstrauen.",
			"\n* Geh nicht AFK (Away From Keyboard). Wenn du zu lange stillstehst, wirst du aus dem Spiel entfernt.",
			"\n* Benennt euch während einer Runde nicht um, wenn ihr \1\x8Ftot\4 seid. Andernfalls werdet ihr vom Server gekickt. Wenn ihr \1\x8Ftot\4 seid, wartet bis zum Ende der Runde, um euch sicher umzubenennen.",
			"\n* Vermeide es, in der Nähe des \1\x84Smaragds des Sheriffs\4 zu campen, wenn du ein \1\x85Mörder\4 bist. Wenn du dich 30 Sekunden lang in der Nähe des Smaragds aufhältst, wirst du aus dem Spiel geworfen.",
			"\nEin Verstoß gegen diese Regeln kann zu einem Ausschluss oder in schweren Fällen zu einer Sperre durch den Administrator führen. Spiel fair und hab Spaß!"
		},
		{
			"\1\x87Nützliche Tipps\4\n",
			"Hier sind einige Tipps, die Ihnen helfen, bei \1\x87Murder Mystery\4 erfolgreich zu sein:",
			"\n* Wenn die Charakterfähigkeiten vom Administrator deaktiviert wurden, drücke \1\x87SPIN\4, um dich lautlos und spurlos zu bewegen.",
			"\n* Wenn du den \1\x84Smaragd des Sheriffs\4 aufhebst, erhältst du Zugriff auf alle Waffen und Ringe, die du zuvor gesammelt hast.",
			"\n* Verwende den Befehl \1\x87SAYTEAM\4, um dich mit deinen \1\x8ATeamkollegen\4 abzustimmen und Friendly Fire zu vermeiden. Wenn du eine Nachricht mit \1\x88%\4 beginnst, wird sie automatisch an deine Teammitglieder gesendet.",
			"\n* Erleide Schaden durch Hindernisse wie Lava, Stacheln oder Feuer, um für kurze Zeit (3 Sekunden) unbesiegbar zu werden.",
			"\n* Finde Verstecke auf der Karte, um nicht entdeckt zu werden. Manchmal ist es besser, sich außer Sichtweite aufzuhalten.",
			"\n* Wenn deine Rolle bekannt wird, ändere deinen Namen und/oder deine Hautfarbe.\1\x82 Beachte, dass dein neuer Name im Chat angezeigt wird.\4",
			"\n* Verwende die Taste\1\x87 FIRENORMAL\4, um das \1\x86Messer\4 überall einzusetzen, solange du Ringe hast. Wenn du dich mit einem \1\x86Messer\4 anschleichst, ist dein Angriff geräuschlos."
		}
	}
})
