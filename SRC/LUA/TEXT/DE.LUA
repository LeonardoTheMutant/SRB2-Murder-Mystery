-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- GERMAN
-- Made by LeonardoTheMutant

-- DISCLAMER:
-- Ich kann Deutsch sprechen, aber meine Kenntnisse dieser Sprache sind nicht perfekt
-- Ich musste mich die meiste Zeit auf die Übersetzungstools verlassen, daher entschuldige ich mich für den schlechten Text.

MM.AddLang("DE", {
	["LANGUAGE"]="Deutsch",
	["VERSION"]="1.3",
	["AUTHOR"]="LeonardoTheMutant",
	["CHAT_ROLEGET_PM"]={
		"Du bist der ^5Morder^0. ^5Tote sie alle.",
		"Du bist der ^4Sheriff^0!^4 Beseitige alle Morder^0. Tote die^3 falsche Person^0, und die Rolle gehort dir nicht mehr.",
		"Du bist ein ^3Zivilist^0! Versteck dich und hilf bei den Ermittlungen."
	},
	["CHAT_NEWROLEGET_PM"]={
		"^7Das Leben hat zufällig entschieden, dass du ein ^5Morder^7 sein wirst. ^5Jetzt geh und tote alle!",
		"^7Das Universum hat dich zum ^4Sheriff^7 ernannt! Geh und^4 eliminier alle Morder^7!",
		"^7Es wurde beschlossen, dass du ein ^2Held^7 sein wirst. Rette alle vor den Mordern!",
		"^7Du hast einen der ^5Morder^7 ausgeschaltet! Du hast dir die Ehre eines ^2Helden^7 verdient!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Vorsicht! Das ist dein Teamkollege. Vermeide das nächste mal Friendly Fire!",
		"Ein Teamkollege hat dich versehentlich getroffen. Rache ist NICHT empfehlenswert!"
	},
	["CHAT_MURDKILLED"]={
		"Morder",
		"wurde eliminiert!",
	},
	["CHAT_SHERIKILLED"]={
		"Sheriff",
		"wurde ermordet!",
		"Finden Sie ihren ^4Smaragd^0!"
	},
	["CHAT_HEROKILLED"]={
		"Held",
		"wurde ermordet!",
	},
	["CHAT_DIEDHAZARD"]="ist gestorben. Traurig.",
	["CHAT_SHREMDPICKUP"]="Jemand hat den ^4Smaragd des Sheriffs^0 an sich genommen...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"^7Du hast haben einen ^3Zivilisten^7 ermordet.! Du bist gefeuert worden. (Du bist nicht mehr Sheriff)",
		"^2Helden^7 sollen keine ^3Zivilisten^7 toten! Du wurdest wegen Kriegsverbrechen ^5hingerichtet^7.",
		"^7Oh nein! Du hast einen ^4Sheriff^7 emordet!!! Du wurdest dafür ^5hingerichtet^7...",
		"^7Du hast einen ^3Zivilisten^7 ermordet, genau wie dich selbst! Du wurdest für dein Verbrechen ^5hingerichtet^7.",
		"^7Oh nein! Du hast einen ^2Helden^7 ermordet! Dafür wurdest du ^5hingerichtet^7."
	},
	["CHAT_INNOHURT"]={
		"Der ^4Sheriff^0 hat einen ^3Zivilisten^0 ermordet! Jemand anderes sollte die Arbeit zu Ende bringen!",
		"Durch die Totung des ^3Zivilisten^0 wurde der ^2Held^0 zum ^5Bosewicht^0 und bezahlte dafür den Preis."
	},
	["CHAT_ONEQUIT"]={
		"Einer der ^5Morder^0 hat verlassen!",
		"Einer der ^4Sheriffs^0 het verlassen!",
		"Einer der ^2Helden^0 hat verlassen!!!"
	},
	["CHAT_LASTQUIT"]={
		"Der letzte ^5Morder^0 hat verlassen!",
		"Der letzte ^5Sheriff^0 hat verlassen!",
		"Der letzte ^2Held^0 hat alle im Stich gelassen!"
	},
	["CHAT_REPLACEQUIT"]={
		"Der ^5Morder^0 ist geflohen! Ein zufalliger ^3Zivilist^0 wird ihre Rolle ubernehmen!",
		"Der ^4Sheriff^0 ist geflohen! Ein zufalliger ^3Zivilist^0 wird ihre Rolle ubernehmen!",
		"Der ^2Held^0 ist geflohen! Ein zufalliger ^3Zivilist^0 wird ihre Rolle ubernehmen!"
	},
	["CHAT_ENDROUND"]={
		"Alle sind tot. Die ^5Morder^0 gewinnen!",
		"Alle ^5Morder^0 wurden getotet! Die^3 Zivilisten^0 gewinnen!",
		"Die ^5Morder^0 gewinnen, weil der ^4Sheriff^0 den letzten Zivilisten ermordet hat! Schande uber den ^4Sheriff^0...",
		"Die ^5Morder^0 gewinnen, weil der ^2Held^0 sich entschieden hat, den letzten Zivilisten zu toten. Schande uber einen solchen ^2Helden^0...",
		"Die Verteidiger der ^3Zivilisten^0 sind tot. Die ^5Morder^0 gewinnen!"
	},
	["HUD_MM"]="Murder Mystery",
	["HUD_SUSPECTS"]="Verdächtige",
	["HUD_VICTIMS"]="Opfer",
	["HUD_TEAMMATES"]="Teamkollegen",
	["HUD_ROLES"]={
		"MÖRDER",
		"SHERIFF",
		"ZIVILIST",
		"HELD",
		"TOT"
	},
	["HUD_KILLEDBY"]={
		"Getötet von",
		"Justiz",
		"die Falle"
	},
	["HUD_SCORESTAB"]="Wenn du neu in diesem Spielmodus bist, verwende den Befehl ^7MMHELP^0 in der Konsole, um Hilfe zu erhalten.\n\n^2Viel Spaß!",
	["HUD_ROLETARGET"]={
		"Sich einfügen, Vertrauen aufbauen, dann zuschlagen.",
		"Finde und eliminiere alle Mörder. Töte keine Zivilisten!",
		"Versteck dich und schütze dich. Hilf bei den Ermittlungen, wenn möglich.",
		"Du hast die Chance, alle Mörder zu stoppen. Geh und rette die Lage!"
	},
	["HUD_ROLESALIVE"]={
		"Mörder",
		"Sheriffs",
		"Zivilisten"
	},
	["HUD_DEAD"]="Du bist ^Ftot^0.\nDu kannst nicht wiederbelebt werden oder mit Personen sprechen die noch am Leben sind.",
	["HUD_MIDJOIN"]="Du bist ^4mitten im Spiel^0 eingestiegen, bitte warte bis zum Ende dieser Runde. Während du wartest, lies bitte die Spielregeln im ^7MMHELP^0-Konsolenbefehl!",
	["HUD_ALONE"]="^42 Spieler^0 sind für das Spiel erforderlich,\nBitte warten Sie, bis^4 ein weiterer Spieler^0 das Spiel startet.",
	["HUD_SNEAKING"]="Schleichen...",
	["HUD_SHOWDOWN"]="Showdown Duell!",
	["HUD_MINIGAME"]={
		["PRESS"]="Drücke ^2CUSTOM3^0 zum",
		["LEAVE"]="verlassen",
		["CANCEL"]="abzubrechen",
		["SPECTATE"]="zuschauen",
		["DUEL"]="ein Minispiel-Duell",
		["REQUEST"]="ein ^7PONG-Minispiel^0 anfordern!",
		["START"]="ein ^7\"SONIC RUN\"^0 Minispiel starten!",
		["ACCEPT"]="die ^7PONG^0 Herausforderung annehmen!",
		["WAIT"]="Warten darauf, dass der Rivale akzeptiert...",
		["SPECTATING"]="Ein Duell beobachten...",
		["BORED"]="Langweilst du dich?",
		["GOAL"]="Tor!"
	},
	["HUD_YOU"]="DU",
	["HUD_WINNERS"]="Gewinner:",
	["HUD_WIN"]={
		"UNENTSCHIEDEN!",
		"^5MÖRDER",
		"^3ZIVILISTEN"
	},
	["HUD_PAST"]="VERGANGEN",
	["HUD_FUTURE"]="ZUKUNFT",
	["HUD_MMHELP_UI"]={
		"Verwenden Sie ^7UP^0/^7DOWN^0 zum Scrollen und ^7LEFT^0/^7RIGHT^0 zum Wechseln der Seiten",
		"Drücke ^7CUSTOM^0, um die Hilfe zu verlassen"
	}, 
	["HUD_MMHELP"]={
		{
			"^7Willkommen bei Murder Mystery!",
			"Eine SRB2-interpretation des beliebten mehrspieler spiel!\n",
			"Das Ziel des Spiels ist es, alle ^5Mörder^0 zu finden und zu eliminieren, bevor sie^3 alle anderen^0 töten können. Dieser Spielmodus ähnelt dem MATCH-Modus, daher benötigen Sie präzise Ziel- und Schießfähigkeiten, um zu gewinnen!",
			"\nZunächst gehen wir die Grundlagen durch, damit Sie sofort loslegen und spielen können...",
			"\nHier sind die möglichen ^BRollen^0, die du übernehmen könntest:",
			" * ^5Mörder^0 - Ein tödlicher Verbrecher. Seine Aufgabe ist es, alle zu eliminieren.",
			" * ^4Sheriff^0 - mit der Aufgabe betraut, die ^5Mörder^0 zu finden und zu eliminieren",
			" * ^3Zivilist^0 - Muss vermeiden, getötet zu werden, und bei der Identifizierung des ^5Mörders^0 helfen. Je nach Spielkonfiguration können sie einen ^5Roten Ring^0 erhalten, um sich zu verteidigen, indem sie 100 Ringe (oder 50 Ringe für bestimmte Skins) sammeln.",
			"\nDas sind die wichtigsten Informationen, die du brauchst, um mit dem Spielen zu beginnen. Für weitere Details lies bitte dieses Handbuch bis zum Ende durch."
		},
		{
			"^7Über die Spielsituationen^0\n",
			"Wie in den Grundlagen erwähnt, besteht das Ziel des Spiels darin, alle ^5Mörder^0 zu eliminieren, aber während des Spiels können verschiedene Szenarien auftreten:",
			"\n* Wenn du stirbst, gelangst du in den Zustand ^FTot^0. Spieler in diesem Zustand können nicht wiederbelebt werden und nicht global mit Spielern kommunizieren, die noch am Leben sind. Ihre Nachrichten sind nur für andere ^FTote^0 Spieler sichtbar.",
			"Du kannst nicht mit noch lebenden Spielern chatten oder ihnen persönliche Nachrichten senden, während du ^Ftot^0 bist.",
			"Wenn Sie durch Gefahren auf der Karte wie Brecher, Stürze in Gruben oder Ertrinken im Wasser sterben, sind Sie für den Rest der Runde ebenfalls ^Ftot^0.",
			"^2Versuchen Sie außerdem NICHT, sich selbst umzubenennen, während Sie tot sind^0. Weitere Details hierzu finden Sie auf der nächsten Seite.",
			"\n* Die Aufgabe des ^4Sheriffs^0 besteht darin, die ^5Mörder^0 zu eliminieren, aber achten Sie darauf, nicht versehentlich einen ^5Zivilisten^0 zu erschießen.",
			"Wenn ein ^4Sheriff^0 einen ^3Zivilisten^0 erschießt, verliert er seine ^BRolle^0 und wird selbst zum ^3Zivilisten^0. Ein ^3zufällig ausgewählter Zivilist^0 übernimmt dann stillschweigend die ^BRolle^0 des ^4Sheriffs^0. Überleg dir gut, bevor du den Abzug drückst!",
			"\n* Wenn ein ^5Mörder^0 einen ^4Sheriff^0 tötet, während noch ^5Zivilisten^0 am Leben sind, fällt der ^4Smaragd des Sheriffs^0 in der Nähe der Leiche zu Boden.",
			"Wenn ein ^3Zivilist^0 den ^4Smaragd des Sheriffs^0 aufhebt, wird er zum ^2Helden^0. ^2Helden^0 sind ähnlich wie ^4Sheriffs^0, weisen jedoch einige Unterschiede auf:",
			" - Wenn ein ^2Held^0 einen^3 Zivilisten^0 tötet, sterben beide, und ihre ^Brolle^0 wird nicht neu zugewiesen;",
			" - ^2Helden^0 lassen beim Tod nicht den ^4Smaragd des Sheriffs^0 fallen.",
			"\n* In Runden mit einer höheren Anzahl von Spielern kann es mehrere ^5Mörder^0 und ^4Sheriffs^0 geben. Für diese Runden werden ^ATeams^0 aus ^5Mördern^0 und ^4Sheriffs^0 gebildet.",
			"Teammitglieder können über den Befehl ^7SAYTEAM^0 in der Konsole oder über den Team-Chat (Taste ^8'z'^0 auf der Tastatur)  .",
			"Wenn du versehentlich einen ^Ateamkollegen^0 angreifst, erhalten beide Spieler eine personalisierte Warnung. Sei vorsichtig - solche Teaminteraktionen können deine ^Brolle^0 anderen offenbaren!"
		},
		{
			"^7".."Dinge, die man vermeiden sollte in ^5Murder Mystery^0\n",
			"Regel Nr. 1: ^2Sei freundlich und hab Spaß!^0 Hier sind einige zusätzliche Richtlinien:",
			"\n* Verrate niemals deine ^BRolle^0, auch nicht im Scherz. Du kannst zwar die ^Brolle^0 eines anderen verraten, wenn du dir sicher bist, aber gib niemals deine eigene preis.",
			"\n* Vermeide es, andere Spieler zu beleidigen. Freundschaftliches Geplänkel ist in Ordnung, aber ständige Anschuldigungen oder feindseliges Verhalten führen dazu, dass andere dir misstrauen.",
			"\n* Geh nicht ^8AFK^0 (^8Away From Keyboard^0). Wenn du zu lange stillstehst, wirst du aus dem Spiel entfernt.",
			"\n* Benennt euch während einer Runde nicht um, wenn ihr ^Ftot^0 seid. Andernfalls werdet ihr vom Server gekickt. Wenn ihr ^Ftot^0 seid, wartet bis zum Ende der Runde, um euch sicher umzubenennen.",
			"\n* Vermeide es, in der Nähe des ^4Smaragds des Sheriffs^0 zu campen, wenn du ein ^5Mörder^0 bist. Wenn du dich 30 Sekunden lang in der Nähe des Smaragds aufhältst, wirst du aus dem Spiel geworfen.",
			"\nEin Verstoß gegen diese Regeln kann zu einem Ausschluss oder in schweren Fällen zu einer Sperre durch den Administrator führen. Spiel fair und hab Spaß!"
		},
		{
			"^7Nützliche Tipps^0\n",
			"Hier sind einige Tipps, die Ihnen helfen, bei ^7Murder Mystery^0 erfolgreich zu sein:",
			"\n* Wenn die Charakterfähigkeiten vom Administrator deaktiviert wurden, drücke ^7SPIN^0, um dich lautlos und spurlos zu bewegen.",
			"\n* Wenn du den ^4Smaragd des Sheriffs^0 aufhebst, erhältst du Zugriff auf alle Waffen und Ringe, die du zuvor gesammelt hast.",
			"\n* Nutze den Team-Chat, um Aktionen mit deinen ^ATeamkollegen^0 zu koordinieren und Friendly Fire zu vermeiden.",
			"\n* Erleide Schaden durch Hindernisse wie Lava, Stacheln oder Feuer, um für kurze Zeit (3 Sekunden) unbesiegbar zu werden.",
			"\n* Finde Verstecke auf der Karte, um nicht entdeckt zu werden. Manchmal ist es besser, sich außer Sichtweite aufzuhalten.",
			"\n* Wenn deine Rolle bekannt wird, ändere deinen Namen und/oder deine Hautfarbe.^2 Beachte, dass dein neuer Name im Chat angezeigt wird.^0",
			"\n* Verwende die Taste^7 FIRENORMAL^0, um das ^6Messer^0 überall einzusetzen, solange du Ringe hast. Wenn du dich mit einem ^6Messer^0 anschleichst, ist dein Angriff geräuschlos."
		}
	},
	["BMP_VICTIMS"]={data={
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
	["BMP_SUSPECTS"]={yoff=2,data={
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
	["BMP_TIME"]={data={
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
	["BMP_RINGS"]={data={
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
	}}
})
