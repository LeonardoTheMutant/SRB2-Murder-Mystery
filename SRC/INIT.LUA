if MM or MurderMystery
	error("Murder Mystery v"..MM.version or MurderMystery.version.." is already loaded, only one version of MM can be present")
	return
end
rawset(_G, "MM", {
	version="8.2-BETA", --string, VERSION NUMBER
	devbuild="GITHUB", --string, meant to be a devbuild number. If set to nil it disables all debug functionality in MM
	releasedate="not released yet", --string, meant to contain the day of release
	text={ --All text and messages used in the add-on with the translations
		["EN"]={ -- English
			["VERSION"]="8.1-BETA", --to check if lang content is not OUTDATED
			["AUTHOR"]="LeonardoTheMutant",
			["MM"]="Murder Mystery",
			["MMHELP"]={ --MMHELP command
				["MAIN"]={ --When no page specified
					"\x87        Welcome to the Murder Mystery!\nThe SRB2 interpretation of the popular multiplayer game",
					"\nThe game's goal is to find and eliminate all the \x85Murderers\x80 before they kill\x83 everyone else\x80. This gametype is more like MATCH so you'll your need your aiming and shooting skills for this game.",
					"You'll need some basics first to start playing....",
					"\nAt the beginning of each round you will recieve a \x8BRole\x80 that defines what are you going to do during the game. Here are all 3 possible \x8BRoles\x80 you might get:",
					" * \x85Murderer\x80 - true criminal. They have to kill everyone, but they're not allowed to pick up any weapon rings.",
					" * \x84Sheriff\x80  - their task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
					" * \x83Innocent\x80 - completely armless civilian, they must avoid being killed but also can help to find the \x85Murderer\x80.",
					"\nThat's all basic information requiered to start playing, for more information, you can use these commands:",
					"\x87MMHELP GAME\x80 - More about the game and gameplay situations;",
					"\x87MMHELP BAD\x80  - List of things that are forbidden to do in MM;",
					"\x87MMHELP CHAT\x80 - List of sound emojis that you can use in the chat;",
					"\x87MMHELP INFO\x80 - Technical information and \"What's new\";",
					"\x87MMLANG\x80      - Change the language of the content appearing in MM"
				},["GAME"]={
					"\x87".."About the gameplay situations",
					"As explained earlier in the basics the goal is to eliminate the \x85Murderer(s)\x80, but different gameplay situations may occur:",
					"\n* If you get killed, you'll enter the \x8F Dead\x80 state. Players with this state cannot respawn and talk globaly to players that are still alive, their messages are visible only to the other\x8F Dead\x80 players.",
					"You can't \x87SAYTO\x80/PM player who is still alive while you're\x8F Dead\x80.",
					"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this is in \x87MMHELP BAD\x80.",
					"\n* The \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but it is possible for them to shoot an \x83Innocent\x80 on accident.",
					"If this happens \x84Sheriff\x80 will turn into \x83Innocent\x80 and random \x83Innocent\x80 will sliently take his role. Next time you want to shoot somebody as \x84Sheriff\x80 think who you are going to kill!",
					"\n* When a \x85Murderer\x80 kills a \x84Sheriff\x80 and there are still \x83Innocents\x80 alive, the Sheriff will drop the \x84Sheriff's Emerald\x80 near their corpse.",
					"Unlike the 7 Chaos Emeralds, this emerald will assign the \x82Hero\x80 role to any \x83Innocent\x80 that picks it up. If you're one of the \x83Innocents\x80 it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
					"The \x82Hero\x80 role doesn't really differ from the \x84Sheriff\x80 except some details such as when the \x82Hero\x80 kills an \x83Innocent\x80 their role isn't shared and both just die. A Hero also will not drop a \x84Sheriff's Emerald\x80 on their death.",
					"\n* Depending on the players online count there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 among the players in the round. For example starting from 7 players and more \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
					"\x8BTeammates\x80 can chat with each other in their team chat with \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
					"If one \x8Bteammate\x80 will hit anoter both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!",
					"\nFor even more information, check out:",
					"\x87MMHELP BAD\x80  - Things you shouldn't do in MM game",
					"\x87MMHELP CHAT\x80 - What are Sound Emojis and how to use them"
				},["BAD"]={
					"\x87Things that are bad to do in Murder Mystery",
					"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
					"* Self-spoiling of the \x8BRole\x80 will not make the game \'Mystery\', you can tell someone other's role if you definetly know who he is but never tell your own.",
					"* Do not insult other players, jokes are allowed but in friendly mood. No one will trust you if you are will accuse every player with no reason.",
					"* Being AFK is a war crime. Bombs will be dropped and you will cease to exist if you stand still for too long.",
					"* Do not rename yourself during a round. The game will close your SRB2 window. This made to prevent cheating. Just wait for the intermission to rename safely.",
					"Breaking one of these rules may result a kick or in some cases ban from the Admin, please do not break them and play fairly.",
					"\nMore help pages that you might want to read at your console:",
					"\x87MMHELP GAME\x80 - About gameplay situations",
					"\x87MMHELP CHAT\x80 - List of Sound Emojis and their usage"
				},["CHAT"]={
					"\x87How to use Sound Emojis\x80",
					"When a player sends a message that contains specific words/phrases, a sound will be played.",
					"Basically when you send the \"bruh\" message and everyone will hear the BRUH sound",
					"Here is the full list of Sound Emojis and how to activate each of them:\n",
					"  \x88Keyword\x80       | \x89Sound",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | Fart sound",
					"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:         | Anime-like \"WOW!\"",
					"  hehe          | DOOMGUY chuckle",
					"  \\:|           | Vine boom (Rock-eyebrow)",
					"  bruh          | bruh",
					"  /:|           | Vine boom (Rock-eyebrow)",
					"  AMONGUS       | \"*AMONG US*\"",
					"  AMONG US      | \"*AMONG US*\"",
					"  sus           | SUS",
					"  oh no         | Knuckles' \'OH NO\'",
					"  AGHH          | Eggman's \'AGHHHH!\'",
					"  AHH           | Eggman's \'AGHHHH!\'",
					"  AHA           | Eggman's \'AHA!\'",
					"  NO WAY        | Eggman's \'NO WAY!\'",
					"  NOPE          | Nope.",
					"  GET OVER HERE | \"GET OVER HERE!\"",
					"  NOO           | \"NOOOOOOoooooo...\"",
					"  HELP          | Tyler1's \"HELP!\"",
					"  HEHEHE HA     | Clash Royal King's laugh",
					"  HEHE BOI      | \"Hehe boi...\"",
					" ---------------+-----------------------------",
					"More help:",
					"\x87MMHELP GAME\x80 - More about the game and gameplay situations",
					"\x87MMHELP BAD\x80  - Things that are forbidden to do in MM"
				}
			},
			--GAME.LUA
			-- "You got the role"
			["ROLE_GET"]={
				"You're the \x85Murderer\x80! \x85Murder everyone.",
				"You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. Be careful before killing, or you risk your role.",
				"You're an \x83Innocent\x80! Hide and help the with the investigation."
			},
			-- SetRandomPlayerAs()
			["NEWROLE_GET"]={
				"\x87Life randomly decided you shall be \x85Murderer\x87.\x85 Now go kill everyone.",
				"\x87Universe made you a \x84Sheriff\x87! Go and\x84 eliminate all Murderers\x87!",
				"\x87It was decided that you will become a \x82Hero\x87. Save everyone from the Murderers!"
			},
			-- Teammate hit
			["TEAMMATE_HIT"]={
				"Don't hit teammates. You don't wanna get a revenge on you.",
				"Teammate hit you. Don't plan to do a revenge on your teammate."
			},
			-- Murderer killed
			["MURD_KILLED"]={
				"\x85Murderer\x87", --beginning of the string
				"\x80got eliminated" --ending
			},
			-- Sheriff killed
			["SHERI_KILLED"]={
				"\x84Sheriff\x87",
				"\x80got murdered! Find their\x84 Emerald\x80!", --ending 1
				"\x80got murdered!" --ending 2 (no drop)
			},
			["HERO_KILLED"]={
				"\x82Hero\x87",
				"\x80got murdered!"
			},
			["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
			-- Innocent hurt by Sheriff
			["INNO_HURT_PM"]={
				"\x87You murdered an \x83Innocent\x87! How could you?!?!? (You're no longer a Sheriff)",
				"\x82Heroes\x87 aren't meant to kill \x83Innocents\x87. You have to be executed for your war crime"
			},
			["INNO_HURT"]={
				"\x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!",
				"\x82Hero\x80 is dumbass, they killed an \x83Innocent\x80. Now both are lying dead. Shame on\x82 Dumbass\x80"
			},
			-- "One of the [role]s left!"
			["ONE_LEFT"]={
				"One of the \x85Murderers\x80 left!",
				"One of the \x84Sheriffs\x80 left!!!",
				"One of the \x82Heros\x80 left us!"
			},
			-- "Last [role] left!"
			["LAST_LEFT"]={
				"Last \x85Murderer\x80 left!",
				"Last \x84Sheriff\x80 left!",
				--"Last \x83Innocent\x80 left!", --I believe this is unused now
				"Last \x82Hero\x80 left!"
			},
			-- "[role] left, replaced him"
			["REPLACE_LEFT"]={
				"\x85Murderer\x80 left! Some \x83Innocent\x80 took their role!",
				"\x84Sheriff\x80 left! Some \x83Innocent\x80 took their role!",
				"\x82Hero\x80 left! Some \x83Innocent\x80 took their role!"
			},
			-- Win texts
			["ENDROUND"]={
				"Everyone is dead. The \x85Murderers\x80 win!",
				"All of the \x85Murderers\x80 got killed! The\x83 Civilians\x80 win!",
				"The \x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent! Shame on \x84Sheriff\x80",
				"The \x82Hero\x80 chose to kill the last Innocent. The \x85Murderers\x80 Win!",
				"The Defenders of the\x83 Innocents\x80 are dead. The \x85Murderers\x80 win!"
			},
			--CHAT.LUA
			["CHAT"]={
				"is alive, message not sent",
				"You're sending too many messages, please wait",
				"You can't just \x8F die\x80 to spectate!"
			},
			--HUD.LUA
			-- Role names
			["ROLES_HUD"]={
				"MURDERER",
				"SHERIFF",
				"INNOCENT",
				"HERO",
				"DEAD"
			},
			["TEAMALIVE_HUD"]="Teammates alive:",
			["KILLBY_HUD"]="Killed by",
			["STUPID"]="your stupidity",
			-- Scores TAB screen
			["HUD_SCORESTAB"]={
				"No scores here! Counters below may help",
				"If you're new to the gametype\nuse \x87MMHELP\x80 in the Console",
				"\n\x82Have Fun ;)"
			},
			-- Scores TAB screen role conters
			["HUD_ROLESALIVE"]={
				"Murderers alive:",
				"Sheriffs alive:",
				"Innocents alive:"
			},
			-- Centered text when you're dead
			["HUD_DEAD"]={
				"You are\x8F dead",
				"You can't respawn or talk to alives"
			},
			-- Centered text when you joined
			["HUD_MIDJOIN"]={
				"You joined \x84mid-round\x80, please wait for the round to finish."
			},
			-- Centered text when you are alone
			["HUD_ALONE"]={
				"\x84".."2 players\x80 are requiered for the game,",
				"please wait for \x84one more\x80 player to start"
			},
			-- Winner stuff
			["WINNERS_HUD"]="Winners:",
			["WIN_HUD"]={
				"TIE!",
				"\x85MURDERERS", --must contain escape color code
				"\x83".."CIVILIANS" --must contain escape color code
			},
			--CCMD.LUA (MMLANG command)
			["MMLANG"]={
				"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]",
				"Personal language for Murder Mystery is set to\x82 English"
			}
		},["ES"]={ --Spanish by SlainLBS & Jesus.B
			["VERSION"]="8.1-BETA",
			["AUTHOR"]="Jesus.B",
			["MM"]="Murder Mystery",
			["MMHELP"]={
				["MAIN"]={
					"\x87        Bienvenido Al Misterio De Asesinato!\nLa interpretacion en SRB2 del juego multijugador popular",
					"\nEl objetivo del juego es encontrar y eliminar a todos los\x85 Asesinos\x80 antes de que maten a\x83 todos los demas\x80. Este modo de juego es algo como MATCH asi que nesecitaras tus habilidades de apuntar y disparar para este juego.",
					"Nesecitaras lo basico primero para empezar a jugar....",
					"\nAl inicio de cada ronda recibiras un \x8BRol\x80 que define lo que haras en la partida. Aqui estan todos los 3 \x8BRoles\x80 posibles que puedas conseguir:",
					" *\x85 Asesino\x80 - el verdadero criminal. Tiene que matar a todos, pero esta limitado a solo disparar Anillos Rojos (Normales) y Infinitos;",
					" *\x84 Comisario\x80  - su tarea es encontrar y eliminar al/a los\x85 Asesino(s)\x80. Los comisarios pueden usar cada Arma De Anillo disponible en el mapa;",
					" *\x83 Inocente\x80 - civil completamente desarmado, debe evitar ser asesinado pero tambien puede ayudar a encontrar al\x85 Asesino\x80.",
					"\nEsa es toda la informacion basica requerida para empezar a jugar, si te perdiste de algo o quieres saber mas usa estos comandos en la consola:",
					"\x87MMHELP GAME\x80 - Mas sobre el juego y situaciones de gameplay;",
					"\x87MMHELP BAD\x80  - Lista de cosas prohibidas de hacer en MA;",
					"\x87MMHELP CHAT\x80 - Lista de emojis de sonido que puedes usar en el chat;",
					"\x87MMHELP INFO\x80 - Informacion tecnica y \"Que hay de nuevo\".",
					"\nTambien puedes usar \x87MMLANG\x80 para cambiar el idioma dentro de MA"
				},["GAME"]={
					"\x87Sobre las situaciones de gameplay",
					"Como se explico anteriormente en lo basico el objetivo es eliminar al/a los\x85 Asesino(s)\x80, pero diferentes situaciones de gameplay pueden ocurrir:",
					"\n* Si alguien te mato con su anillo te conviertes en\x8F Muerto\x80. Los jugadores en este estado no pueden reaparecer y hablarles globalmente a los jugadores que sigan vivos, sus mensajes solo seran visibles para otros jugadores\x8F muertos\x80.",
					"Tampoco puedes usar \x87SAYTO\x80 o mandarle un MP a alguien vivo estando\x8F MUERTO\x80.",
					"Tambien\x82 NO INTENTES RENOMBRARTE\x80, mas detalles sobre esto en \x87MMHELP BAD\x80.",
					"\n* la tarea del\x84 Comisario\x80 es eliminar a todos los\x85 Asesinos\x80 por ahi, pero aveces el Comisario puede matar al\x83 Inocente\x80 por accidente.",
					"Si esto pasa el\x84 Comisario\x80 se convertira en un civil y algun\x83 Inocente\x80 aleatorio tomara su rol silenciosamente. La proxima vez que quieras dispararle a alguien como\x84 Comisario\x80 piensa bien a quien mataras!",
					"\n* Cuando un\x84 Asesino\x80 mata a un\x84 Comisario\x80 y todavia hay\x83 Inocentes\x80 vivos el Comisario dejara caer la\x84 Esmeralda Del Comisario\x80 cerca de su cadaver.",
					"Distinta a las Emeraldas Del Caos esta esmeralda le dara el rol de\x82 Heroe\x80 al\x83 Inocente\x80 que la tome primero. Si eres uno de los\x83 Inocentes\x80 es tu oportunidad de ser un Heroe y salvar a todos del/de los\x85 Asesino(s)\x80!",
					"el rol de\x82 Heroe\x80 no es realmente diferente del de\x84 Comisario\x80 excepto algunos detalles como cuando el\x82 Heroe\x80 mata a un\x83 Inocente\x80 su rol no es compartido y ambos mueren. el Heroe tampoco dejara caer la\x84 Esmeralda Del Comisario\x80 al morir.",
					"\n* Dependiendo de la cantidad de jugadores en linea puede haber mas de un\x85 Asesino\x80 y\x84 Comisario\x80 entre los jugadores en la ronda. Por ejemplo empezando con 7 jugadores y mas\x8B Equipos\x80 de\x85 Asesinos\x80 y\x84 Comisarios\x80 seran formados.",
					"los\x8B Aliados\x80 pueden hablar entre si en su chat de equipo con el comando de consola \x87SAYTEAM\x80 (nota que el boton de chat SAYTEAM funcionara igual que el chat normal).",
					"Si los\x8B aliados\x80 se golpean entre si conseguiran una advertencia personalizada que se los recordadara. recuerda que otros pueden ver tu interaccion 'amistosa' y darte quenta de quien eres!",
					"\nSi estas interesado en entender mas puedes leer:",
					"\x87MMHELP BAD\x80 - Cosas que no deberias hacer en el juego MA",
					"\x87MMHELP CAHT\x80 - Que son emojis de sonido y como usarlos"
				},["BAD"]={
					"\x87 Cosas malas para Misterio de Asesinato",
					"Regla No.1 de cualquier juego:\x82 Se amable y diviertete!\x80 Aparte de eso...",
					"* Decir el\x8B Rol\x80 no hara el juego un \'Misterio\', puedes contar el rol de alguien mas si definitivamente sabes quien es pero nunca digas el tuyo.",
					"* No insultar otros jugadores, se permiten las bromas pero solo en una actitud amigable. Nadie te creera si tu acusas cualquier jugador sin razon.",
					"* Estar AFK es un crimen de guerra. Si estas inactivo por mucho tiempo el juego te expulsara (solo si estas vivo).",
					"* No te renombres EN PLENA PARTIDA - El juego es estricto sobre esto y tu SRB2 se\x85 auto-cerrara\x80 si intentas hacer esto. Si nececitas renombrarte espera a la pantalla de intermision para hacerlo.",
					"Romper alguna de estas reglas puede resultar en una expulsion o en algunos casos un ban por el Admin, porfavor no las rompas y juega justamente.",
					"\nMas paginas de ayuda que quieras leer en tu consola:",
					"\x87MMHELP GAME\x80 - Sobre situaciones de gameplay",
					"\x87MMHELP CHAT\x80 - Lista de Emojis De Sonido y su uso"
				},["CHAT"]={
					"\x87 Como usar Emojis De Sonido\x80",
					"Cuando un jugador envia un mensaje y contiene algunas palabras o frases especiales un Emoji De Sonido especifico se reproducira con el mensaje.",
					"Basicamente cuando envias el mensaje \"bruh\" todos escucharan el sonido de BRUH",
					"Aqui esta la lista completa de emojis de sonido y como activar cada uno de ellos:\n",
					"  \x88 Palabra\x80       | \x89 Sonido",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | Sonido de pedo",
					"  :omg:         | \"OOHhhh por Diossssssss...\"",
					"  :wow:         | \"WOW! como anime\"",
					"  hehe          | risita de DOOMGUY",
					"  \\:|          | Vine boom (Ceja de la roca)",
					"  bruh          | bruh",
					"  /:|           | Vine boom (Ceja de la roca)",
					"  AMONGUS       | \"*AMONG US*\"",
					"  AMONG US      | \"*AMONG US*\"",
					"  sus           | SUS",
					"  oh no         | \'OH NO\' de Knuckles",
					"  AGHH          | \'AGHHHH!\' de Eggman",
					"  AHH           | \'AGHHHH!\' de Eggman",
					"  AHA           | \'AHA!\' de Eggman",
					"  NO WAY        | \'NO PUEDE SER!\' de Eggman",
					"  NOPE          | Nope.",
					"  GET OVER HERE | \"VEN AQUI!\"",
					"  NOO           | \"NOOOOOOoooooo...\"",
					"  HELP          | \"AYUDA! de Tyler1\"",
					"  HEHEHE HA     | La risa del rey de Clash Royale",
					"  HEHE BOI      | \"Hehe boi...\"",
					" ---------------+-----------------------------",
					"Mas ayuda:",
					"\x87MMHELP GAME\x80 - Mas sobre el juego y situaciones de gameplay",
					"\x87MMHELP BAD\x80  - Cosas prohibidas en MA"
				}
			},
			
			["ROLE_GET"]={
				"Eres el\x85 Asesino\x80! \x85Mata a todos.",
				"Eres el\x84 Comisario\x80!\x84 Elimina a todos los Asesinos\x80. Si matas un Inocente, pierdes.",
				"Eres un\x83 Inocente\x80! Escondete y ayuda al comisario a encontrar al asesino."
			},["NEWROLE_GET"]={
				"\x87La vida te hizo un\x85 Asesino\x87,\x85 Ahora ve a matar a todos.",
				"\x87".."El Universo te hizo el nuevo\x84 Comisario\x87! Ahora tu trabajo es\x84 eliminar a todos los Asesinos\x87!",
				"\x87Todos los defensores se fueron pero el Universo te selecciono como un nuevo\x82 Heroe\x87! Es tu oportunidad de salvar el dia!"
			},["TEAMMATE_HIT"]={
				"Hey, este chico es tu aliado, no vuelvas a intentar matarlo",
				"Tu aliado te golpeo, no intentes vengarte de el"
			},["MURD_KILLED"]={
				"El\x85 Asesino\x87",
				"\x80ha sido eliminado!"
			},["SHERI_KILLED"]={
				"El\x84 Comisario\x87",
				"\x80ha sido asesinado! Los Inocentes pueden tomar su\x84 Esmeralda\x80!",
				"\x80ha sido asesinado!"
			},["HERO_KILLED"]={
				"El\x82 Heroe\x87",
				"\x80ha sido asesinado!"
			},["SHREML_PICK"]="Alguien tomo la\x84 Esmeralda Del Comisario\x80...",
			["INNO_HURT_PM"]={
				"\x87Mataste al\x83 Inocente\x87! Ya no eres un\x84 Comisario\x87!",
				"\x87".."Eres incluso peor que el mismisimo\x85 Asesino\x80! Como pudiste matar al civil?!?!\x85 MUERE POR ESO!!!"
			},["INNO_HURT"]={
				"El\x84 Comisario\x80 mato al Inocente! Algun otro\x83 Inocente\x80 tendra que terminar su trabajo!",
				"El\x82 Heroe\x80 es un hijo de puta, mato a un\x83 Inocente\x80 pacifico. Ahora ambos estan muertos. Que verguenza"
			},["ONE_LEFT"]={
				"Uno de los\x85 Asesinos\x80 se fue!",
				"Uno de los\x84 Comisarios\x80 se fue!",
				"Uno de los\x82 Heroes\x80 se fue!"
			},["LAST_LEFT"]={
				"El ultimo\x85 Asesino\x80 se fue!",
				"El ultimo\x84 Comisario\x80 se fue!",
				"El ultimo\x83 Inocente\x80 se fue!",
				"El ultimo\x82 Heroe\x80 se fue!"
			},["REPLACE_LEFT"]={
				"El\x85 Asesino\x80 se fue! Algun\x83 Inocente\x80 tomo su rol!",
				"El\x84 Comisario\x80 se fue! Algun\x83 Inocente\x80 tomo su rol!",
				"El\x82 Heroe\x80 se fue! Algun\x83 Inocente\x80 tomo su rol!"
			},["ENDROUND"]={
				"Todos fueron asesinados, Los\x85 Asesinos\x80 ganan!",
				"Todos los asesinos fueron eliminados, Los\x83 Civiles\x80 ganan!",
				"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 mato al ultimo Inocente!",
				"El\x82 Heroe\x80 eligio matar al ultimo Inocente. Los\x85 Asesinos\x80 Ganan!",
				"Todos los Comisarios Y Heroes estan muertos, Los\x85 Asesinos\x80 ganan!"
			},["CHAT"]={
				"esta vivo, el mensaje no fue enviado",
				"Estas enviando muchos mensajes, porfavor espera",
				"No puedes solo convertirte en\x8F muerto\x80 para espectar!"
			},["ROLES_HUD"]={
				"ASESINO",
				"COMISARIO",
				"INOCENTE",
				"HEROE",
				"MUERTO"
			},["TEAMALIVE_HUD"]="Aliados vivos:",
			["KILLBY_HUD"]="Asesinado por",
			["HUD_SCORESTAB"]={
				"No hay puntaje aqui! Los contadores de\nabajo pueden ayudar.",
				"\nSi eres nuevo al modo de juego usa\n\x87MMHELP\x80 en la Consola",
				"\n\n\x82\nDiviertete ;)"
			},["HUD_ROLESALIVE"]={
				"Asesinos vivos:",
				"Comisarios vivos:",
				"Inocentes vivos:"
			},["HUD_DEAD"]={
				"Estas\x8F muerto",
				"No puedes reaparecer o hablarle a los vivos"
			},["HUD_MIDJOIN"]={
				"Te uniste en\x84 plena ronda\x80, porfavor espera a que inicie la nueva ronda"
			},["HUD_ALONE"]={
				"\x84".."2 jugadores\x80 son requeridos para la partida,",
				"porfavor espera\x84 un jugador mas\x80 para empezar"
			},["WINNERS_HUD"]="Ganadores:",
			["WIN_HUD"]={
				"EMPATE!",
				"\x85".."ASESINOS",
				"\x83".."CIVILES"
			},
			["MMLANG"]={
				"Tu idioma actual en uso es\x82 Espanol\x80\nPuedes cambiarlo con \x87MMLANG [idioma]",
				"El idioma personal para Misterio De Asesinato fue cambiado a\x82 Espanol"
			}
		},["PL"]={ -- Polish by sopix
			["VERSION"]="8.1-BETA",
			["AUTHOR"]="sopix",
			["MM"]="Tajemnica Morderstw",
			["MMHELP"]={
				["MAIN"]={
					"\x87        Witaj w Tajemnicy Morderstw!\nInterpretacji popularnej gry multiplayer w SRB2",
					"\nCelem gry jest znalezienie i wyeliminowanie wszystkich \x85Mordercow\x80 zanim zabija\x83 wszystkich\x80. Ten typ gry jest jak MATCH wiec musisz potrafic strzelac.",
					"Bedziesz potrzebowac kilku podstaw....",
					"\nNa poczatku kazdej rundy dostaniesz \x8BRole\x80 ktora dyktuje co masz robic w grze. To sa 3 mozliwe \x8BRole\x80 ktore mozesz dostac:",
					" * \x85Morderca\x80 - prawdziwy kryminalista. Ma zabic wszystkich, Ale moze tylko strzelac czerwonymi (Normalnymi) i Nieskonczonymi Pierscieniami;",
					" * \x84Szeryf\x80  - Jego zadaniem jest znalezienie i wyeliminowanie \x85Mordercow\x80. Szeryfi moga uzywac wszystkich typow pierscieni;",
					" * \x83Niewinny\x80 - kompletnie bezbronny cywil, musi nie zostac zabity i pomoc w znalezieniu \x85Mordercy\x80.",
					"\nTo cala podstawa do gry, jesli nadal czegos nie wiesz lub chcesz dowiedziec sie wiecej, uzyj tych komend:",
					"\x87MMHELP GAME\x80 - Wiecej o grze i sytuacjach;",
					"\x87MMHELP BAD\x80  - Lista nie dozwolonych rzeczy w TM;",
					"\x87MMHELP CHAT\x80 - Lista dzwiekow ktore mozna uczyc w czacie;",
					"\x87MMHELP INFO\x80 - Techniczne informacje i \"Co nowego\".",
					"\nMozesz tez uzyc \x87MMLANG\x80 zeby zmienic jezyk TM"
				},["GAME"]={
					"\x87O sytuacjach w grze",
					"Jak wyjasniono wczesniej, celem jest wyeliminowanie wszystkich \x85Mordercow\x80, ale rozne sytuacje moga zastac:",
					"\n* Jesli ktos cie zastrzeli to staniesz sie\x8F Martwy\x80. Gracze w tym stanie nie moga sie odnowic ani gadac na globalnym czacie, twoje wiadomosci sa tylko widoczne dla innych\x8F martwych\x80 graczy.",
					"Nie mozesz uzyc \x87SAYTO\x80 lub PW do osoby ktora jest zywa jako\x8F MARTWY\x80.",
					"Takze,\x82 NIE PROBUJ ZMIENIAC NAZWY\x80, wiecej detali w \x87MMHELP BAD\x80.",
					"\n* Zadaniem \x84Szeryfa\x80 jest wyeliminowanie wszystkich \x85Mordercow\x80, ale czasami szeryf moze zabic jednego \x83Niewinnego\x80 przez przypadek.",
					"Jesli to sie stanie \x84Szeryf\x80 stanie sie cywilem i inny \x83Niewinny\x80 po cichu przejmie jego role. Nastepnym razem jak strzelisz w kogos jako \x84Szeryf\x80 pomysl kogo zabijasz!",
					"\n* Kiedy \x85Morderca\x80 zabije \x84Szeryfa\x80 i zostana zywi \x83Niewinni\x80 szeryf upusci \x84Szmaragd Szeryfa\x80 obok jego ciala.",
					"W przeciwienstwie do Szmaragdow Chaosu ten szmaragd daje role\x82 Bohatera\x80 do \x83Niewinnego\x80 ktory go pierwszy podniosl. Jesli jestes \x83Niewinnym\x80 to twoja szansa zostac bohaterem i uratowac wszystkich od \x85Mordercow\x80!",
					"\x82".."Bohater\x80 nie rozni sie za bardzo od \x84Szeryfa\x80 oprocz kilku detali jak kiedy\x82 Bohater\x80 zabija \x83Niewinnego\x80 jego rola nie jest oddawana i obydwoje gina. Bohater nie upusci \x84Szmaragdu Szeryfa\x80 przy jego smierci.",
					"\n* Zaleznie od ilosci graczy, moze byc wiecej niz jeden \x85Mordercow\x80 i \x84Szeryfow\x80 posrod graczy w grze. Na przyklad, gdy jest wiecej niz 7 graczy to\x8B Druzyny\x80 \x85Mordercow\x80 i \x84Szeryfow\x80 beda zformowane.",
					"\x8BWspolnicy\x80 moga czatowac z druzyna za pomoca komendy \x87SAYTEAM\x80 (przycisk SAYTEAM bedzie tak samo dzialal jak normalny czat).",
					"Jesli jeden \x8Bwspolnik\x80 strzeli drugiego to dostanie wiadomosc zeby nie strzelal do wspolnika. Pamietaj ze inni moga zobaczyc twoja 'przyjazna' rozmowe i dowiedziec sie kim jestes!",
					"\nJesli chcesz zrozumiec wiecej przeczytaj:",
					"\x87MMHELP BAD\x80 - Rzeczy ktorych nie powinno sie robic w TM",
					"\x87MMHELP CHAT\x80 - Co to sa Dzwieki i jak ich uzyc"
				},["BAD"]={
					"\x87Rzeczy ktorych nie wolno robic w Tajemnicy Morderstw",
					"Zasada numer 1 kazdej gry:\x82 Badz mily i sie baw!\x80 Oprocz tego...",
					"* Wypowiedzenie swojej \x8BRoli\x80 sprawi ze gra nie bedzie juz \'Tajemnica\', mozesz wypowiedziec role kogos innego jak wiesz ale nigdy swojej.",
					"* Nie badz nie mily dla innych graczy, zarty sa dozwolone ale tylko w przyjaznej atmosferze. Nikt ci nie bedzie ufal jak bedziesz ciagle oskarzal innych bez powodu.",
					"* Bycie AFK to zbrodnia wojenna. Jesli bedziesz sie nie ruszal przez dluzszy czas zostaniesz wykopany (tylko jesli zyjesz).",
					"* Nie zmieniaj nazwy W SRODKU GRY - gra jest bardzo scisla i\x85 wylaczy\x80 twoja gre jesli to zrobisz. Jesli musisz zmienic nazwe to poczekaj na przerywnik.",
					"Zlamanie tych zasad moze spowodowac ze zostaniesz wykopany a czasami zbanowany przez Admina, prosimy ich nie lamac i grac fer.",
					"\nWiecej stron pomocy ktore mozesz chciec przeczytac w konsoli:",
					"\x87MMHELP GAME\x80 - O sytuacjach w grze",
					"\x87MMHELP CHAT\x80 - Lista dzwiekow i jak ich uzyc"
				},["CHAT"]={
					"\x87Jak uzyc dzwiekow\x80",
					"Jesli gracz wysle wiadomosc zawierajaca specjalne slowa lub frazy to zagra specjalny dzwiek.",
					"w skrocie jesli wyslesz wiadomosc \"bruh\" wszyscy uslysza dzwiek BRUH",
					"To jest lista dzwiekow i jak je aktywowac:\n",
					"  \x88Keyword\x80       | \x89Sound",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | dzwiek pierdu",
					"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:         | animowe \"WOW!\"",
					"  hehe          | smiech DOOMGUYa",
					"  \\:|           | Vine boom (brew-Rocka)",
					"  bruh          | bruh",
					"  /:|           | Vine boom (brew-Rocka)",
					"  AMONGUS       | \"*AMONG US*\"",
					"  AMONG US      | \"*AMONG US*\"",
					"  sus           | SUS",
					"  oh no         | \'OH NO\' knucklesa",
					"  AGHH          | \'AGHHHH!\' Eggmana",
					"  AHH           | \'AGHHHH!\' Eggmana",
					"  AHA           | \'AHA!\' Eggmana",
					"  NO WAY        | \'NO WAY!\' Eggmana",
					"  NOPE          | Nope.",
					"  GET OVER HERE | \"GET OVER HERE!\"",
					"  NOO           | \"NOOOOOOoooooo...\"",
					"  HELP          | \"HELP!\" Tylera1",
					"  HEHEHE HA     | Smiech krola z Clash Royale",
					"  HEHE BOI      | \"Hehe boi...\"",
					" ---------------+-----------------------------",
					"Wiecej pomocy:",
					"\x87MMHELP GAME\x80 - Wiecej o grze i sytuacjach",
					"\x87MMHELP BAD\x80  - Rzeczy ktorych nie wolno robic w TM"
				}
			},["ROLE_GET"]={
				"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
				"Jestes \x84Szeryfem\x80!\x84 Wyeliminuj wszystkich Mordercow\x80. Jesli zabijesz Niewinnego, przegrasz.",
				"Jestes \x83Niewinny\x80! Kryj sie i pomoz Szeryfowi znalezc Morderce."
			},["NEWROLE_GET"]={
				"\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
				"\x87Swiat sprawil cie nowym \x84Szeryfem\x87! To teraz twoja robota\x84 wyeliminowac wszystkich Mordercow\x87!",
				"\x87Wszyscy obroncy odeszli ale swiat sprawil cie nowym\x82 Bohaterem\x87! To twoja szansa uratowac dzien!"
			},["TEAMMATE_HIT"]={
				"Hey, ta osoba to twoj wspolnik, nie probuj go znowu zabijac",
				"Twoj wspolnik cie zaatakowal, nie probuj sie mscic"
			},["MURD_KILLED"]={
				"\x85Morderca\x87",
				"\x80zostal wyeliminowany!"
			},["SHERI_KILLED"]={
				"\x84Szeryf\x87",
				"\x80zostal zamordowany! Niewinni moga podniesc jego\x84 Szmaragd\x80!",
				"\x80zostal zamordowany!"
			},["HERO_KILLED"]={
				"\x82".."Bohater\x87",
				"\x80zostal zamordowany!"
			},["SHREML_PICK"]="Ktos podniosl \x84Szmaragd Szeryfa\x80...",
			["INNO_HURT_PM"]={
				"\x87Zamordowales \x83Niewinnego\x87! Nie jestes juz \x84Szeryfem\x87!",
				"\x87Jestes gorszy niz najgorszy \x85Morderca\x87! Jak mogles zabic tego cywila?!?!\x85 GIN ZA TO!!!"
			},["INNO_HURT"]={
				"\x84Szeryfie\x80 zamordowales niewinnego! Ktos z \x83Niewinnych\x80 musi dokonczyc robote!",
				"\x82".."Bohater\x80 jest skurwielem, zabil spokojnego \x83Niewinnego\x80. Teraz obydwoje nie zyja. Wstyd dla bohatera"
			},["ONE_LEFT"]={
				"Jeden z \x85Mordercow\x80 wyszedl!",
				"Jeden z \x84Szeryfow\x80 wyszedl!",
				"Jeden z\x82 Bohaterow\x80 wyszedl!"
			},["LAST_LEFT"]={
				"Ostatni \x85Mordercow\x80 wyszedl!",
				"Ostatni \x84Szeryfow\x80 wyszedl!",
				"Ostatni \x83Niewinnych\x80 wyszedl!",
				"Ostatni\x82 Bohaterow\x80 wyszedl!"
			},["REPLACE_LEFT"]={
				"\x85Morderca\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
				"\x84Szeryf\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!",
				"\x82".."Bohater\x80 wyszedl! Jeden z \x83Niewinnych\x80 zdobyl jego role!"
			},["ENDROUND"]={
				"Wszyscy zostali zamordowni, \x85Mordercy\x80 wygrywaja!",
				"Wszyscy Mordercy zostali wyeliminowani,\x83 Cywile\x80 wygrywaja!",
				"\x85Mordercy\x80 wygrywaja poniewaz \x84Szeryf\x80 zamordowal ostatniego Niewinnego!",
				"\x82".."Bohater\x80 wybral do zabicia ostatniego Niewinnego. \x85Moredrcy\x80 Wygrywaja!",
				"Wszyscy Szeryfi i Bohaterzy nie zyja, \x85Mordercy\x80 wygrywaja!"
			},["CHAT"]={
				"zyje, wiadomosc nie wyslana",
				"Wysylasz za duzo wiadomosci, prosze poczekac",
				"Nie mozesz poprostu stac sie\x8F martwym\x80 do ogladania!"
			},["ROLES_HUD"]={
				"MORDERCA",
				"SZERYF",
				"NIEWINNY",
				"BOHATER",
				"MARTWY"
			},["TEAMALIVE_HUD"]="Wspolnicy zywi:",
			["KILLBY_HUD"]="Zabity przez",
			["STUPID"]="twoj idiotyzm",
			["HUD_SCORESTAB"]={
				"Tutaj nie ma wynikow! Liczniki na dole\nmoga pomoc",
				"\nJesli jestes nowy w tym trybie uzyj\n\x87MMHELP\x80 w Konsoli",
				"\n\n\x82\nBaw sie dobrze ;)"
			},["HUD_ROLESALIVE"]={
				"Mordercy zywi:",
				"Szeryfi zywi:",
				"Niewinni zywi:"
			},["HUD_DEAD"]={
				"Jestes\x8F martwy",
				"Nie mozesz sie odnawiac lub gadac do zywych"
			},["HUD_MIDJOIN"]={
				"Dolaczyles \x84w srodku rundy\x80, poczekaj na nowa runde zeby zagrac"
			},["HUD_ALONE"]={
				"\x84".."2 graczy\x80 jest wymaganych do gry,",
				"prosze poczekac na \x84jednego\x80 gracza do startu"
			},["WINNERS_HUD"]="Wygrani:",
			["WIN_HUD"]={
				"REMIS!",
				"\x85MORDERCY",
				"\x83".."CYWILE"
			},["MMLANG"]={
				"Twoj jezyk to\x82 Polski\x80\nMozesz go zmienic za pomoca \x87MMLANG [jezyk]",
				"Personalny jezyk zostal ustawiony na\x82 Polski"
			}
		},["PT"]={ --Portugesse (Brazilian) by King Jonas
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="King Jonas",
			["MM"]="Murder Mystery",
			["MMHELP"]={
				["MAIN"]={
					"\x87    	Bem vindo ao Murder Mystery!\nA versao do SRB2 do famoso jogo",
					"\nO objetivo e encontrar e\x84 eliminar\x80 todos os\x85 Assasinos\x80 antes que eles matem\x83 todos os outros\x80. Este tipo de jogo e baseado em MATCH, entao voce precisara de habilidades para atirar.",
					"Mas voce tem que saber sobre o basico primeiro:",
					"\nVoce recebera um \x8BPapel\x80 no inicio de cada nova rodada, aqui esteo todos os 3 \x8BPapeis\x80 possiveis que voce pode obter:",
					" *\x85 Assasino\x80 - ele tem que matar todo mundo, mas ele esta limitado a atirar apenas Red (Normal) e Infinite Rings;",
					" * \x84Xerife\x80  - sua tarefa e encontrar e eliminar o \x85 Assasinos\x80, os xerifes podem usar todos os aneis de armas disponiveis;",
					" * \x83Inocente\x80 - completamente sem armas, ele deve evitar ser morto, mas tambem ajudar o\x84 Xerife\x80 a encontrar o\x85 Assassino\x80.",
					"\nEssas sao todas as informacoes basicas necessarias para comecar a jogar, se voce ainda sentir falta de algo ou quiser saber mais, use esses comandos do console:",
					"\x87MMHELP GAME\x80 - Mais sobre o jogo e as situacoes do jogo;",
					"\x87MMHELP BAD\x80  - Coisas que sao ruins de se fazer e como o jogo e punitivo para elas;",
					"\x87MMHELP CHAT\x80 - Lista de emojis sonoros que voce pode usar no chat;",
					"\x87MMHELP INFO\x80 - Informacoes tecnicas sobre a versao e \"O que ha de novo\".",
					"\nVoce tambem pode querer usar \x87MMLANG\x80 para alterar o idioma dentro do MM"
				},["GAME"]={
					"\x87Sobre situacoes de jogo",
					"Como explicado anteriormente no basico, o objetivo e eliminar o Assassino, mas durante o jogo podem ocorrer diferentes situacoes:",
					"\n* Se alguem atirou em voce com o anel dele, voce se torna\x8F Morto\x80",
					"\x8F".."Jogadores mortos\x80 nao podem reviver e falar com jogadores que estao vivos, suas mensagens sao visiveis apenas para os outros jogadores\x8F mortos\x80",
					"Fazer \x87SAYTO\x80 no console ou PMing o jogador que esta vivo enquanto voce está morto e impossivel",
					"Tambem\x82 NAO TENTE RENOMEAR-SE\x80, mais detalhes sobre isso em \x87MMHELP BAD\x80.",
					"\n* \x80 A tarefa do\x84Xerife\x80 e eliminar todos os \x85 Assasinos\x80, mas as vezes \x84 Ele\x80 pode matar o \x83Inocente\x80.",
					"Se isso acontecer, o\x84Xerife\x80 perdera seu papel e outro \x83Inocente\x80 o assumira. Portanto, pense bem em quem voce atirara como xerife!",
					"\n* Geralmente ha um\x85 Assasino\x80 e um \x84Xerife\x80 entre os jogadores, mas esses numeros podem mudar se mais jogadores estiverem online.\nComecando com 7 jogadores, mais \x8BTimes\x80 de\x85 Assasinos\x80 e \x84Xerifes\x80 serao formados.",
					"\x8B Companheiros de equipe\x80 podem conversar uns com os outros em seu bate-papo de equipe com o comando do console \x87SAYTEAM\x80 (observe que o comando SAYTEAM funcionara da mesma forma que o bate-papo normal).",
					"Se um\x8B companheiro de equipe\x80 acertar o outro, ambos receberao uma notificacao para nao acertarem um no outro novamente. Lembre-se de que os outros podem ver sua luta de 'amizade' e perceber quem voce e!",
					"\nSe voce estiver interessado em entender melhor, pode ler:",
					"\x87MMHELP BAD\x80 - Coisas que voce nao deve fazer no jogo MM"
				},["BAD"]={
					"\x87 Coisas ruins de se fazer no MM",
					"Regra No.1 em qualquer jogo:\x82 Seja gentil e divirta-se!\x80 Fora isso...",
					"* A autodestruicao do \x8B Papel\x80 nao tornara o jogo \'Misterioso\', voce pode dizer o papel de outra pessoa se souber quem ele e, mas nunca diga o seu.",
					"* Nao insulte outros jogadores, piadas sao permitidas, mas de bom humor.",
					"* Estar AFK e um crime de guerra. Se voce ficar inativo por 2 minutos, o jogo ira te kickar (somente se voce estiver vivo).",
					"* Nao renomeie a si mesmo ENQUANTO ESTA NO JOGO MM - o jogo e rigoroso sobre isso e ira\x85 fechar automaticamente\x80 seu SRB2 se tentar fazer isso. Se voce precisar renomear, aguarde a tela de intervalo.",
					"Quebrar uma dessas regras pode resultar em um kick ou ate banimento, por favor, nao as quebre e jogue de forma justa.",
					"\nMais paginas de ajuda que voce pode querer ler em seu console:",
					"\x87MMHELP GAME\x80 - Sobre situacoes de jogo"
				},["CHAT"]={
					"\x87 Como usar emojis sonoros\x80",
					"Quando o jogador envia uma mensagem e ela contem algumas palavras/frases especiais, um Emoji de Som especificado sera reproduzido com a mensagem.",
					"Basicamente, quando voce digita \"bruh\" em uma mensagem, um som de BRUH sera reproduzido quando voce o enviar",
					"Aqui esta a lista de Sound Emojis e como ativar cada um deles:\n",
					"  \x88Palavra-chave\x80 | \x89Som",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | Fart sound",
					"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:         | Anime-like \"WOW!\"",
					"  hehe          | DOOMGUY chuckle",
					"  \\:|           | Vine boom (Rock-eyebrow)",
					"  bruh          | bruh",
					"  /:|           | Vine boom (Rock-eyebrow)",
					"  AMONGUS       | \"*AMONG US*\"",
					"  AMONG US      | \"*AMONG US*\"",
					"  sus           | SUS",
					"  oh no         | Knuckles' \'OH NO\'",
					"  AGHH          | Eggman's \'AGHHHH!\'",
					"  AHH           | Eggman's \'AGHHHH!\'",
					"  AHA           | Eggman's \'AHA!\'",
					"  NO WAY        | Eggman's \'NO WAY!\'",
					"  NOPE          | Nope.",
					"  GET OVER HERE | \"GET OVER HERE!\"",
					"  NOO           | \"NOOOOOOoooooo...\"",
					"  HELP          | Tyler1's \"HELP!\"",
					"  HEHEHE HA     | Clash Royal King's laugh",
					"  HEHE BOI      | \"Hehe boi...\"",
					" ---------------+-----------------------------",
					"Mais ajuda:",
					"\x87MMHELP GAME\x80 - Mais sobre o jogo e as situacoes do jogo",
					"\x87MMHELP BAD\x80  - Coisas que sao ruins de se fazer e como o jogo as esta punindo"
				}
			},["ROLE_GET"]={
				"Voce e o \x85 Assassino\x80! \x85 Assassine todos.",
				"Voce e o \x84Xerife\x80!\x84 Elimine todos os Assassinos\x80. Se voce matar um Inocente, voce perde.",
				"Voce e um \x83Inocente\x80! Esconda-se e ajude o Xerife a encontrar o assassino."
			},["NEWROLE_GET"]={
				"\x87O Universo fez de voce um\x85 Assasino, agora va matar todo mundo",
				"\x87O Universo fez de voce o novo \x84Xerife\x87! Agora e seu trabalho\x84 eliminar todos os Assassinos\x87!"
			},["TEAMMATE_HIT"]={
				"Ei, esse cara e seu companheiro de equipe, nao tente mata-lo novamente",
				"Seu companheiro de equipe acertou voce, nao fique bravo com ele"
			},["MURD_KILLED"]={
				"O\x85 Assasino\x87",
				"\x80".."foi eliminado!"
			},["SHERI_KILLED"]={
				"O \x84Xerife\x87",
				"\x80".."foi assasinado! \x80Os \x83Inocentes\x80 podem pegar sua Esmeralda para terminar o trabalho!",
				"\x80".."foi assasinado!"
			},["SHREML_PICK"]="Algum Inocente pegou \x84 A Esmeralda do Xerife\x80.",
			["INNO_HURT_PM"]="\x87Voce assassinou o \x83Inocente\x87! Voce nao e mais um \x84Xerife\x87!",
			["INNO_HURT"]="O\x84 Xerife\x80 assassinou o Inocente! Outra pessoa \x83Inocente\x80 tera que terminar seu trabalho!",
			["ONE_LEFT"]={
				"Um dos \x85 Assasinos\x80 saiu!",
				"Um dos \x84Xerifes\x80 saiu!"
			},["LAST_LEFT"]={
				"O ultimo\x85 Assasino\x80 saiu!",
				"O ultimo \x84Xerife\x80 saiu!",
				"O ultimo \x83Inocente\x80 saiu!"
			},["REPLACE_LEFT"]={
				"\x80O \x85 Assasino\x80 saiu! Alguem de \x83Inocente\x80 assumiu o papel dele!",
				"O \x84Xerife\x80 saiu! Alguem de \x83Inocente\x80 assumiu seu papel!"
			},["ROLE_WIN"]={
				"Todos foram assassinados, Os\x85 Assasinos\x80 venceram!",
				"Todos os assassinos foram eliminados, \x80Os \x84Xerifes\x80 e todos os \x83Inocentes\x80 venceram!",
				"Os\x85 Assasinos\x80 venceram porque \x80o \x84Xerife\x80 assassinou o Ultimo inocente!"
			},["CHAT"]={
				"esta vivo, mensagem nao enviada",
				"Voce esta enviando muitas mensagens, aguarde",
				"Voce nao pode simplesmente ficar\x8F morto\x80 para entrar no modo espectador!"
			},["ROLES_HUD"]={
				"\x85".."ASSASINO",
				"\x84XERIFE",
				"\x83INOCENTE",
				"\x8FMORTO"
			},["TEAMALIVE_HUD"]="Companheiros de equipe vivos:",
			["KILLBY_HUD"]="Morto por",
			["HUD_SCORESTAB"]={
				"Nenhuma pontuacao aqui! Os contadores\nabaixo podem ajudar",
				"\nSe voce e novo nesse tipo de jogo escreva\n\x87MMHELP\x80 no Console",
				"\n\n\x82".."Divirta-se ;)"
			},["HUD_ROLESALIVE"]={
				"\x85".."Assasinos vivos: ",
				"\x84Xerifes vivos: ",
				"\x83Inocentes vivos: "			
			},["HUD_DEAD"]={
				"Voce esta\x8F morto",
				"Voce nao pode reviver ou falar com vivos"
			},["HUD_MIDJOIN"]={
				"Voce entrou em uma \x84rodada intermediaria\x80, aguarde a nova",
				"rodada para jogar"
			},["HUD_ALONE"]={
				"Precisa-se de\x84 2 jogadores \x80para",
				"o jogo comecar,",
				"aguarde \x84mais um\x80 jogador para iniciar"
			},["WINNERS_HUD"]="Vencedores:",
			["WIN_HUD"]={
				"EMPATE!",
				"\x85".."ASSASINOS",
				"\x84XERIFES\x80 e \x83INOCENTES"
			},["MMLANG"]={
				"Seu idioma atual em uso e\x82 Portugues\x80\nVoce pode altera-lo com \x87MMLANG [idioma]",
				"O idioma pessoal para Murder Mystery foi definido para\x82 Portugues"
			}
		},["UA"]={ -- Ukrainian
			["VERSION"]="8.1-BETA",
			["AUTHOR"]="LeonardoTheMutant",
			["NONASCII"]=true, --special flag to show that language isn't Latin based and is trying to simulate its letters with English (ASCII) ones
			["MM"]="Tajemnycia Wbywstwa",
			["MMHELP"]={
				["MAIN"]={
					"\x87        Laskawo prosymo do Tajemnyci Wbywstwa!\nInterprytacia populiarnoji multyplejernoji gry w SRB2",
					"\nCil' gry poliagaje u znahodzhenni i eliminaciji usih \x85Wbywc'\x80 poky wony ne wbyly \x85usih inshyh\x80. Cia gra podibna do MATCH tomu tobi znadobliatsia twoji wminnia pryciliuwatysia i striliaty.",
					"Spershu tobi treba pojasnyty bazowi znannia persh nizh pochaty graty....",
					"\nNa pochatku kozhnogo raundu tobi wydadut' \x8BRol'\x80 kotra wyznachaje sho ty budesh robyty naprotiazi gry. Os' usi 3 mozhlywi \x8BRoli\x80 jaki mozhna otrymaty:",
					" * \x85Wbywcia\x80  - real'nyj cryminal. Jomu treba wbyty kozhnogo, ale mozhe robyty ce til'ky Cherwonymy (Normal'nymy) ta \'Neskinchennymy\' Kil'ciamy;",
					" * \x84Sheryf\x80   - jogo zadacha znajty i eliminuwaty \x85Wbywc'\x80. Sheryfy mozhut' wykorystowuwaty kozhnu zbroju jaka je dostupna na lokaciji;",
					" * \x83Newynnyj\x80 - cilkom bezbrojnyj cywil'nyj, win musyt' unykaty smert' ale takozh mozhe dopomogty znajty \x85Wbywc'\x80.",
					"\nCe usia bazowa informacia shob pochaty graty, jaksho she chogos' ne rozumijesh abo hochesh znaty bil'she wykorystaj ci konsol'ni komandy:",
					"\x87MMHELP GAME\x80 - Bil'she pro gameplay ta igrowi sytuaciji;",
					"\x87MMHELP BAD\x80  - Spysok zaboronenyh rechej w TW;",
					"\x87MMHELP CHAT\x80 - Spysok Zwukowych Emoji kotri mozhna wykorystaty w chati;",
					"\x87MMHELP INFO\x80 - Technichna informacija ta \"Sho nowogo\".",
					"\nMozhlywo tobi zahochet'sia wykorystaty \x87MMLANG\x80 aby zminyty mowu w TW"
				},["GAME"]={
					"\x87Pro gameplay ta igrowi sytuaciji",
					"Jak skazano ranishe na pochatku cil' gry eliminuwaty \x85Wbywc'\x80, ale mozhut' wynyknuty rizni igrowi sytuaciji:",
					"\n* Jaksho w tebe htos' wystrilyt' kil'cem ty stanesh \x8FMertwym\x80. Grawci z cym stanom ne mozhut' widrodzhuwatysia ta goworyty global'no do grawciw jaki wse she zhywi, jih powidomlennia mozhut' bachyty til'ky inshi \x8FMertwi\x80 grawci.",
					"Ne mozhna takozh wykorystowuwaty \x87SAYTO\x80 abo nadsylaty prywatni powidomlennia do grawciw sho wse she zhywi jaksho ty \x8FMertwyj\x80.",
					"Uwaga: \x82NE NAMAGAJSIA ZMINYTY SWOJE IM'JA GRAWCIA\x80, detal'nishe pro ce opysano w \x87MMHELP BAD\x80.",
					"\n* Zadacha \x84Sheryfa\x80 eliminuwaty usih \x85Wbywc'\x80, ale inodi Sheryf mozhe wypadkowo wbyty \x83Newynnogo\x80.",
					"Koly ce stajet'sia \x84Sheryf\x80 peretworyt'sia na cywilnogo i wypadkowyj \x83Newynnyj\x80 otrymaje jogo rol'. Nastupnogo razy jak nadumajesh striliaty w kogos' podumaj kogo ty zbyrajeshsia wbywaty jak \x84Sheryf\x80!",
					"\n* W wypadkah koly \x85Wbywcia\x80 wbywaje \x84Sheryfa\x80 ta she je zhywi \x83Newynni\x80 gynuchyj Sheryf zalyshyt' swij \x84Smaragd Sheryfa\x80 bilia jogo trupa.",
					"Na widminu wid Chaos Smaragdiw cej smaragd daje rol' \x82Geroja\x80 kozhnomu \x83Newynnomu\x80 hto pershyj znajde ta pidbere jogo. Jaksho ty odyn z \x83Newynnych\x80 ce twij shans staty Gerojem i wriatuwaty usih wid \x85Wbywc'\x80!",
					"Rol' \x82Geroja\x80 ne duzhe widrizniajet'sia wid \x84Sheryfa\x80 krim kil'koh detalej jak, napryklad, koly \x82Geroj\x80 wbywaje \x83Newynnogo\x80 jogo rol' ne peredajet'sia inshomu i oboje prosto gynut'. Takozh Geroj ne zalyshaje \x84Smaragd Sheryfa\x80 koly win pomyraje.",
					"\n* Dywliachys' na kilkist' grawciw online bilshe nizh odyn \x85Wbywcia\x80 ta \x84Sheryf\x80 mozhut' zjawliatysia sered grawciw u raundi. Napryklad, pochynajuchy wid 7 grawciw ta bil'she fromujut'sia \x8BKomandy\x85 Wbywc'\x80 ta \x84Sheryfiw\x80.",
					"\x8BNaparnyky\x80 mozhut' westy peregowory odyn z odnym u swojemu Komandnomu Chati wukorystowujuchy komandu \x87SAYTEAM\x80 u konsoli (zauwazh sho knopka dla chatu SAYTEAM aktywuje zwychnyj chat).",
					"Jaksho odyn \x8Bnaparnyk\x80 nashkodyt' inshomu oboje otrymajut' personalizowane poperedzhennia jake \'poznajomyt'\' jich dwoch. Pamiataj sho inshi takozh mozhut' bachyty washu 'druzhniu' sutychku ta zrozumity hto wy nasprawdi!",
					"\nJak ty zacikawlenyj u podal'shomu rozuminni gry mozhesh takozh prochytaty:",
					"\x87MMHELP BAD\x80  - Rechi kotrych ne treba robyty w TW",
					"\x87MMHELP CAHT\x80 - Sho take Zwukowi Emoji ta jak jih wykorystowuwaty"
				},["BAD"]={
					"\x87Rechi jaki zaboroneni w Tajemnyci Wbywstwa",
					"Prawylo No.1 kozhnoji gry:\x82 Bud' wwichlywyj ta nasolodzhyjsia!\x80 Okrim ciogo...",
					"* Gra ne stanowyt'sia \'Tajemnychoju\' koly usi nawkolo znajut' twoju \x8BRol'\x80. Mozhesh rozkazaty inshym pro jih roli jaksho napewno znajesh hto wony taki, ale nikoly ne powidomliaj pro swoju.",
					"* Ne znushajsia z inshyh grawciw. Zharty dozwoleno, ale w pryjemnomu sensi. Nihto tobi ne powiryt' jaksho budesh usih zwynuwachuwaty.",
					"* Buty neaktywnyhm ce wojennyj zlochyn. Koly grawci dowgyj chas neaktywni gra wyganiaje jich (til'ky jaksho wony zhywi).",
					"* Ne zminiuj swojo imeni grawcia PIDCHAS GRY - gra serjozna na cej wypadok i\x85 automatychno zakryje\x80 twoje wikno SRB2 pry sprobi zrobyty ce. Koly je potreba u zminah imeni tobi treba zachekaty na ekran rezul'tatiw shob todi mozhna bulo bezpechno zminyty im'ja.",
					"Ignoruwannia odnogo z cyh prawyl mozhe rezul'tuwaty kick abo w dejakyh wypadkah nawit' ban wid Admina, bud' laska ne ignoruj prawyla i graj chesno.",
					"\nBil'she storinok dopomogy jaki ty mozhlywo zahochesh prochytaty u konsoli:",
					"\x87MMHELP GAME\x80 - Pro gameplay",
					"\x87MMHELP CHAT\x80 - Spysok Zwukowyh Emoji u gri"
				},["CHAT"]={
					"\x87Jak wykorystowuwaty Zwukowi Emoji\x80",
					"Koly grawec' nadsylaje powidomlennnia kotre mistyt' u sobi jakes' special'ne slowo-kluch abo frazy usi pochujut' Zwukowe Emoji razom z tym powidomlenniam.",
					"Koroche koly ty nadishlesh \"bruh\" u chat wsi pochujut' BRUH",
					"Os' pownyj spysok Zwukowych Emoji ta jak jich aktywuwaty:\n",
					"  \x88Kluchowe slowo\x80       | \x89Zwuk",
					" ----------------------+-----------------------------",
					"  :skull:              | \"Bad to the Bones\"",
					"  :fart:               | Zwuk ponosu",
					"  :omg:                | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:                | Anime \"WOW!\"",
					"  hehe                 | Smih DOOMGUY'ja",
					"  \\:|                  | Vine boom (Rock-eyebrow)",
					"  bruh                 | bruh",
					"  /:|                  | Vine boom (Rock-eyebrow)",
					"  AMONGUS              | \"*AMONG US*\"",
					"  AMONG US             | \"*AMONG US*\"",
					"  sus                  | SUS",
					"  oh no                | \'OH NO\' Knuckles'a",
					"  AGHH                 | \'AGHHHH!\' Eggmana",
					"  AHH                  | \'AGHHHH!\' Eggmana",
					"  AHA                  | \'AHA!\' Eggmana",
					"  NO WAY               | \'NO WAY!\' Eggmana",
					"  NOPE                 | Nope.",
					"  GET OVER HERE        | \"GET OVER HERE!\"",
					"  NOO                  | \"NOOOOOOoooooo...\"",
					"  HELP                 | Tyler1's \"HELP!\"",
					"  HEHEHE HA            | Smih Korolia Clash Royal",
					"  HEHE BOI             | \"Hehe boi...\"",
					" ----------------------+-----------------------------",
					"Bilshe dopomogy:",
					"\x87MMHELP GAME\x80 - Bil'she pro gameplay i igrowi sytuaciji",
					"\x87MMHELP BAD\x80  - Pro rechi sho zaboroneni w TW"
				}
			},["ROLE_GET"]={
				"Ty \x85Wbywcia\x80! \x85Wbyj usih.",
				"Ty \x84Sheryf\x80!\x84 Eliminuj usih Wbywc'\x80. Prograjesh jaksho wb'jesh newynnogo.",
				"Ty \x83Newynnyj\x80! Zachowajsia i dopomozhy Sheryfu znajty Wbywc'."
			},["NEWROLE_GET"]={
				"\x87Zhytia zrobylo z tebe \x85Wbywciu\x87, \x85teper idy i wbyj usih.",
				"\x87Wseswit zrobyw tebe nowym \x84Sheryfem\x87! Tobi potribno \x84 eliminuwaty wsih Wbywc'\x87!",
				"\x87Usi zahystnyky pokynuly nas, ale Wseswit wybraw tebe nowym \x82Gerojem\x87! Ce twij shans wriatuwaty den'!"
			},["TEAMMATE_HIT"]={
				"Hey, cia persona ce twij naparnyk, ne namagajsia wbyty jogo znow",
				"Twij naparnyk zachepyw tebe, ne zlys' na niogo"
			},["MURD_KILLED"]={
				"\x85Wbywcia\x87",
				"\x80".."eliminowanyj!"
			},["SHERI_KILLED"]={
				"\x84Sheryf\x87",
				"\x80wbytyj! Newynni mozhut' uziaty jogo \x84Smaragd\x80!",
				"\x80wbytyj!"
			},["HERO_KILLED"]={
				"\x82Geroj\x87",
				"\x80wbytyj!"
			},["SHREML_PICK"]="Htos' uziaw \x84Smaragd Sheryfa\x80...",
			["INNO_HURT_PM"]={
				"\x87Ty wbyw \x83Newynnogo\x87! Ty bil'she ne \x84Sheryf\x87!",
				"\x87Ty she girshyj najgirshogo \x85Wbywci\x87! Ja ty mig wbyty Cywilnogo?!?!\x85 POMRY ZA CE!!!"
			},["INNO_HURT"]={
				"\x84Sheryf\x80 wbyw Newynnogo! Komus' z \x83Newynnych\x80 dowedet'sia zakinchyty jogo robotu!",
				"\x82Geroj\x80 pownyj degenerat, win wbyw myrnogo \x83Newynnogo\x80. Teper dwoje lezhat' mertwi. Sorom geroju"
			},["ONE_LEFT"]={
				"Odyn z \x85Wbywc'\x80 pokynuw gru!",
				"Odyn z \x84Sheryfiw\x80 pokynuw gru!",
				"Odyn z \x82Gerojiw\x80 pokynuw gru!"
			},["LAST_LEFT"]={
				"Ostannij \x85Wbywcia\x80 pokynuw gru!",
				"Ostannij \x84Sheryf\x80 pokynuw gru!",
				"Ostannij \x83Newynnyj\x80 pokynuw gru!",
				"Ostannij \x82Geroj\x80 pokynuw gru!"
			},["REPLACE_LEFT"]={
				"\x85Wbywcia\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!",
				"\x84Sheryf\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!",
				"\x82Geroj\x80 pokynuw gru! Htos' z \x83Newynnych\x80 uziaw jogo rol'!"
			},["ENDROUND"]={
				"Wsi mertwi, \x85Wbywci\x80 wygraly!",
				"Wsi Wbywci eliminowani,\x83 Cywil'ni\x80 wygraly!",
				"\x85Wbywci\x80 wygraly bo \x84Sheryf\x80 wbyw ostanniogo Newynnogo!",
				"\x82Geroj\x80 wybraw wbyty ostanniogo Newynnogo. \x85Wbywci\x80 wygraly!",
				"Wsi Sheryfy ta Geroji mertwi, \x85Wbywci\x80 wygraly!"
			},["CHAT"]={
				"she zhywyj, powidomlennia ne widislano",
				"Ty nadsylajesh zabagato powidomlen', bud' laska zachekaj",
				"Ne mozhna prosto tak staty \x8FMertwym\x80!"
			},["ROLES_HUD"]={
				"WBYWCIA",
				"SHERYF",
				"NEWYNNYJ",
				"GEROJ",
				"MERTWYJ"
			},["TEAMALIVE_HUD"]="Naparnykiw w zhywych:",
			["KILLBY_HUD"]="Wbytyj",
			["STUPID"]="twoim idiotyzmem",
			["HUD_SCORESTAB"]={
				"Ochok tut nema! Natomist' je lichyl'nyky\nunyzu",
				"\nJaksho ty nowachok w ciomu igrowomu\nrezhymi wykorystaj \x87MMHELP\x80 w konsoli",
				"\n\n\x82Udachi ;)",
				"\n\nP.S.: Klasno jaksho ty wse ce mozhesh\nprochytaty!"
			},["HUD_ROLESALIVE"]={
				"Wbywc' w zhywych:",
				"Sheryfiw w zhywych:",
				"Newynnych w zhywych:"
			},["HUD_DEAD"]={
				"Ty\x8F Mertwyj",
				"Ne mozhesh widrodzhuwatysia ta goworyty",
				"do zhywych grawciw"
			},["HUD_MIDJOIN"]={
				"Ty pryjednawsia \x84posered raundu\x80,",
				"Bud' laska zachekaj nastupnogo shob zagraty"
			},["HUD_ALONE"]={
				"Dla gry potrebujet's'a\x84 2 grawci\x80,",
				"bud' laska zachekaj na \x84she odnogo",
				"aby pochaty"
			},["WINNERS_HUD"]="Wygraly:",
			["WIN_HUD"]={
				"NICHYJA!",
				"\x85WBYWCI",
				"\x83".."CYWIL'NI"
			},["MMLANG"]={
				"Potochna mowa w TW \x82Ukrains'ka\x80\nTy mozhesh zminyty jiji za dopomogoju comandy \x87MMLANG [language]",
				"\x82Ukrains'ka\x80 wstanowlena jak personalna mowa w TW"
			}
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
	},
	RoleColor={
		"\x85", --Murderer
		"\x84", --Sheriff
		"\x83", --Innocent
		"\x82", --Hero
		"\x8F" --Dead
	},
	winner=0, --for intermission, netsynced
	timelimit=5, --for timelimit in TIME.LUA, netsynced
})

rawset(_G, "MurderMystery", MM) --for backwards compatibility

--Roles constants
rawset(_G, "ROLE_NONE", 0)
rawset(_G, "ROLE_MURDERER", 1)
rawset(_G, "ROLE_SHERIFF", 2)
rawset(_G, "ROLE_INNOCENT", 3)
rawset(_G, "ROLE_HERO", 4)

--Customization API
MM.AddCharStat = function(skin, tb)
	if (not skin) error("Invalid skin.") end
	if (not tb) error("Invalid table.") end
	if type(skin)~="string" error("Skin must be string.") end
	if type(tb)~="table" error("tb must phrase as a table.") end
	MM.CharStats[skin]=tb;
end
MM.AddLang = function(langID,langTbl)
	if (not langID) error("Invalid Language Index") end
	if (not langTbl) error("Invalid Language Table.") end
	if type(langID)~="string" error("Language ID should be string and contain 2-3 characters long") end
	if type(langTbl)~="table" error("Language Talbe shoulb be table.") end
	for l in pairs(MM.text)
		if l==langID
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MM.text[langID:upper()]=langTbl
	print("\x83Succesfuly added \x82"..langID.." \x83(by "..tostring(MM.text[langID:upper()]["AUTHOR"])..") lang as a MM language.")
	if MM.text[langID:upper()]["VERSION"]~=MM.version print("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MM.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MM.version) end
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
CV_RegisterVar{name="mmspam", defaultvalue=1, flags=4, PossibleValue={MIN=0,MAX=60}}
CV_RegisterVar{name="mmafk",defaultvalue=2,PossibleValue={MIN=0,MAX=10},flags=4}
CV_RegisterVar{name="mmsemj",defaultvalue="On",PossibleValue=CV_OnOff,flags=4}

--
--MM init
--
print("\x87MURDER MYSTERY v"..MM.version)
print("\x83".."Beginning of the \x87Murder Mystery\x83 loading...")

freeslot('tol_mm','SFX_MMDTH1', 'SFX_MMDTH2', 'SFX_MMDTH3', 'SFX_NGGYU', 'SFX_DAMFLL', 'MT_SHREML', 'MT_MMSTEP', 'S_MMSTEP', 'SPR_STEPA0')
freeslot('SFX_EMJ00', 'SFX_EMJ01', 'SFX_EMJ02', 'SFX_EMJ03', 'SFX_EMJ04', 'SFX_EMJ05', 'SFX_EMJ06', 'SFX_EMJ07', 'SFX_EMJ08', 'SFX_EMJ09', 'SFX_EMJ0A', 'SFX_EMJ0B', 'SFX_EMJ0C', 'SFX_EMJ0D', 'SFX_EMJ0E', 'SFX_EMJ0F',
'SFX_EMJ10', 'SFX_EMJ11', 'SFX_EMJ12', 'SFX_EMJ13', 'SFX_EMJ14', 'SFX_EMJ15')
G_AddGametype({
	name = "Murder Mystery",
	identifier = "murdermystery",
	typeoflevel = TOL_MM,
	rules = GTR_SPECTATORS|GTR_DEATHMATCHSTARTS|GTR_RINGSLINGER|GTR_FIRSTPERSON|GTR_NOSPECTATORSPAWN|GTR_SPAWNINVUL,
	intermissiontype = int_match,
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
	spawnhealth=1,
	radius=FU,
	height=FU,
	reactiontime=8,
	speed=FU,
	flags=512
}
sfxinfo[sfx_mmdth1].caption="Killed"
sfxinfo[sfx_mmdth2].caption="Good Night"
sfxinfo[sfx_mmdth3].caption="Killed"
sfxinfo[sfx_nggyu].caption="Never gonna give you up..."
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
sfxinfo[sfx_emj13].caption="PINGAS"
sfxinfo[sfx_emj14].caption="PAIN"
sfxinfo[sfx_emj15].caption="huh?"

dofile("MAIN/FUNCTIONS.LUA")
dofile("MAIN/GAME.LUA")
dofile("MAIN/TIME.LUA")
dofile("MAIN/HUD.LUA")
dofile("MAIN/CHAT.LUA")
dofile("MAIN/CCMD.LUA")
dofile("MAIN/ABILITIES.LUA")
dofile("MAIN/NOCHEAT.LUA")

dofile("MISC/ASSETS.LUA")

print("\x83Murder Mystery loaded succesfuly, please note that this is WORK IN PROGRESS GAMETYPE and everything you see in this version can be completely changed in the future!\n\x85Please DO NOT TALK or POST ABOUT this gametype on any Message Board or forum, we would like to keep this in Mystery until release =)\n\x81If you're the server host \x81open this .PK3 (as a regular .ZIP) and look for \x82READ_BEFORE_HOSTING.txt\x81 file inside of it for imporant warnings and recommended server setup\x88\nThank you")
--
--end of init
--

addHook("NetVars", function(net)
	MM.text = net($)
	MM.CharStats = net($)
	MM.winner = net($)
	MM.timelimit = net($)
end)

--stability code
addHook("ThinkFrame", do
	if gametype!=GT_MURDERMYSTERY return end
	if CV_FindVar('rejointimeout').value!=0 --REJOINTIMEOUT kills Murder Mystery. Why? You have to wait X minutes for game to finally triger player quit! SRB2 2.2.11 disabled changing this CVAR from LUA. What a stupid decision
		CONS_Printf(server, "ADMIN, DISABLE THE \x87REJOINTIMEOUT\x80, MM DOESN'T WORK PROPERLY WITH THIS CVAR")
	end
end)