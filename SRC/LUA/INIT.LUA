if MurderMystery
	error("Murder Mystery v"..MurderMystery.version.." is already present in loaded add-ons")
	return
end
rawset(_G, "MurderMystery", {
	version="8.1-BETA",
	devbuild="GITHUB",
	releasedate="not released yet",
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
					" * \x85Murderer\x80 - true criminal. He has to kill everyone, but is limited to shoot Red (Normal) and Infinite Rings only;",
					" * \x84Sheriff\x80  - his task is to find and eliminate the \x85Murderer(s)\x80. Sheriffs may use every Weapon Ring available on the map;",
					" * \x83Innocent\x80 - completely armless civilian, he must avoid being killed but also can help to find the \x85Murderer\x80.",
					"\nThat's all basic information requiered to start playing, if you still miss something or want to know more use these console commands:",
					"\x87MMHELP GAME\x80 - More about the game and gameplay situations;",
					"\x87MMHELP BAD\x80  - List of things that are forbidden to do in MM;",
					"\x87MMHELP CHAT\x80 - List of sound emojis that you can use in the chat;",
					"\x87MMHELP INFO\x80 - Technical information and \"What's new\".",
					"\nYou might also want to use \x87MMLANG\x80 to change the Language inside MM"
				},["GAME"]={
					"\x87".."About the gameplay situations",
					"As explained earlier in the basics the goal is to eliminate the \x85Murderer(s)\x80, but different gameplay situations may occur:",
					"\n* If someone shot you down with his ring you become\x8F Dead\x80. Players with this state cannot respawn and talk globaly to players that are still alive, their messages are visible only to the other\x8F dead\x80 players.",
					"You can't \x87SAYTO\x80 or PM the player who's alive as\x8F DEAD\x80 as well.",
					"Also\x82 DO NOT TRY TO RENAME YOURSELF\x80, more details on this is in \x87MMHELP BAD\x80.",
					"\n* \x84Sheriff's\x80 task is to eliminate all the \x85Murderers\x80 around, but sometimes Sheriff can kill the \x83Innocent\x80 by an accident.",
					"If this happens \x84Sheriff\x80 will turn into civilian and random \x83Innocent\x80 will sliently take his role. Next time you want to shoot somebody as \x84Sheriff\x80 think who you are going to kill!",
					"\n* When \x84Murderer\x80 kills \x84Sheriff\x80 and there are still \x83Innocents\x80 alive Sheriff will drop the \x84Sheriff's Emerald\x80 near his courpse.",
					"Unlike Chaos Emeralds this emerald will give a \x82Hero\x80 role to any \x83Innocent\x80 who will pick it first. If you're one of the \x83Innocents\x80 it's your chance to be a Hero and save everyone from the \x85Murderer(s)\x80!",
					"\x82Hero\x80 role doesn't really differ from \x84Sheriff\x80 except some details such as when \x82Hero\x80 kills \x83Innocent\x80 his role isn't shared and both just die. Hero will not drop \x84Sheriff Emerald\x80 on his death as well.",
					"\n* Depending on the players online count there can be more than one \x85Murderer\x80 and \x84Sheriff\x80 among the players in the round. For example starting from 7 players and more \x8BTeams\x80 of \x85Murderers\x80 and \x84Sheriffs\x80 will be formed.",
					"\x8BTeammates\x80 can chat with each other in their team chat with \x87SAYTEAM\x80 console command (note that SAYTEAM chat button will work as same as regular chat).",
					"If one \x8Bteammate\x80 will hit anoter both will get a personalized warning that will make them know each other. Remember that others can see your 'friendly' interaction and realize who you are!",
					"\nIf you're interested in further understanding you can read:",
					"\x87MMHELP BAD\x80 - Things you shouldn't do in MM game",
					"\x87MMHELP CAHT\x80 - What are Sound Emojis and how to use them"
				},["BAD"]={
					"\x87Things that are bad to do in Murder Mystery",
					"Rule No.1 of any game:\x82 Be kind and have fun!\x80 Other than this...",
					"* Self-spoiling of the \x8BRole\x80 will not make the game \'Mystery\', you can tell someone other's role if you definetly know who he is but never tell your own.",
					"* Do not insult other players, jokes are allowed but in friendly mood. No one will trust you if you are will accuse every player with no reason.",
					"* Being AFK is a war crime. If you will be inactive for a long time the game will kick you (only if you're alive).",
					"* Do not rename yourself WHILE IN THE GAME - the game is strict about this and will\x85 auto-close\x80 your SRB2 if try doing this. If you need to rename wait for the Intermission screen to do it.",
					"Breaking one of these rules may result a kick or in some cases ban from the Admin, please do not break them and play fairly.",
					"\nMore help pages that you might want to read at your console:",
					"\x87MMHELP GAME\x80 - About gameplay situations",
					"\x87MMHELP CHAT\x80 - List of Sound Emojis and their usage"
				},["CHAT"]={
					"\x87How to use Sound Emojis\x80",
					"When player sends the message that contains some special words or phrases a specified Sound Emoji will play with the message.",
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
				"You're the \x84Sheriff\x80!\x84 Eliminate all Murderers\x80. If you kill an Innocent, you lose.",
				"You're an \x83Innocent\x80! Hide and help the sheriff find the murderer."
			},
			-- SetRandomPlayerAs()
			["NEWROLE_GET"]={
				"\x87Life made a \x85Murderer\x87 from you, \x85now go kill everyone.",
				"\x87The Universe made you the new \x84Sheriff\x87! It's now your job to\x84 eliminate all Murderers\x87!",
				"\x87".."All defenders left but the Universe selected you as a new \x82Hero\x87! It's your chance to save the day!"
			},
			-- Teammate hit
			["TEAMMATE_HIT"]={
				"Hey, this guy is your teammate, don't try to kill him again",
				"Your teammate hit you, don't try to get revenge on him"
			},
			-- Murderer killed
			["MURD_KILLED"]={
				"\x85Murderer\x87", --beginning of the string
				"\x80is eliminated!" --ending
			},
			-- Sheriff killed
			["SHERI_KILLED"]={
				"\x84Sheriff\x87",
				"\x80is murdered! Innocents can pick up his\x84 Emerald\x80!", --ending 1
				"\x80is murdered!" --ending 2 (no drop)
			},
			["HERO_KILLED"]={
				"\x82Hero\x87",
				"\x80is murdered!"
			},
			["SHREML_PICK"]="Someone picked up the \x84Sheriff's Emerald\x80...",
			-- Innocent hurt by Sheriff
			["INNO_HURT_PM"]={
				"\x87You murdered the \x83Innocent\x87! You are no longer a \x84Sheriff\x87!",
				"\x87You are even worse than the worst \x85Murderer\x80! How could you kill the civilan?!?!\x85 DIE FOR THAT!!!"
			},
			["INNO_HURT"]={
				"\x84Sheriff\x80 murdered the Innocent! Someone other from \x83Innocents\x80 will have to finish his job!",
				"\x82Hero\x80 is a bitch-ass motherfucker, he killed a peaceful \x83Innocent\x80. Now both are lying dead. Shame on hero"
			},
			-- "One of the [role]s left!"
			["ONE_LEFT"]={
				"One of the \x85Murderers\x80 left!",
				"One of the \x84Sheriffs\x80 left!",
				"One of the \x82Heros\x80 left!"
			},
			-- "Last [role] left!"
			["LAST_LEFT"]={
				"Last \x85Murderer\x80 left!",
				"Last \x84Sheriff\x80 left!",
				"Last \x83Innocent\x80 left!",
				"Last \x82Hero\x80 left!"
			},
			-- "[role] left, replaced him"
			["REPLACE_LEFT"]={
				"\x85Murderer\x80 left! Some \x83Innocent\x80 took his role!",
				"\x84Sheriff\x80 left! Some \x83Innocent\x80 took his role!",
				"\x82Hero\x80 left! Some \x83Innocent\x80 took his role!"
			},
			-- Win texts
			["ROLE_WIN"]={
				"Everyone are murdered, \x85Murderers\x80 win!",
				"All murderers are eliminated,\x83 Civilians\x80 win!",
				"\x85Murderers\x80 win because \x84Sheriff\x80 murdered the last Innocent!",
				"\x82Hero\x80 have chosen to kill the last Innocent. \x85Murderers\x80 Win!",
				"All Sheriffs and Heros are dead, \x85Murderers\x80 win!"
			},
			--CHAT.LUA
			["CHAT"]={
				"is alive, message not sent",
				"You're sending too much messages, please wait",
				"You can't just become\x8F dead\x80 to spectate!"
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
				"You joined \x84mid-round\x80, please wait for the new round to play"
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
				"\x84SHERIFFS\x80 & \x83INNOCENTS" --must contain escape color codes
			},
			--CCMD.LUA (MMLANG command)
			["MMLANG"]={
				"Your current language in use is\x82 English\x80\nYou can change it with \x87MMLANG [language]",
				"Personal language for Murder Mystery is set to\x82 English"
			}
		},["ES"]={ -- Spanish by SlainLBS & Jesus.B
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="SlainLBS, Jesus.B",
			["MM"]="Misterio De Asesinato",
			["MMHELP"]={
				["MAIN"]={
					"\x87	Bienvenido A Misterio De Asesinato!\nLa Interpretacion De SRB2 Sobre Juego Famoso",
					"\nEl Objectivo Es Encontrar Y\x84 Eliminar\x80 A Todos Los\x85 Asesinos\x80 Antes De Que Maten\x83 A Todos\x80. Este tipo de juego esta basado en MATCH asi que necesitaras habilidad para disparar.",
					"Pero tendras que saber lo basico primero:",
					"\nConseguiras un \x8BRol\x80 al inicio de cada nueva ronda, aqui estan todos los 3 posibles \x8BRoles\x80 que puedes conseguir:",
					" *\x85 Asesino\x80 - tiene que matar a todos, pero esta limitado a solo disparar Anillos Rojos (Normales) y Infinitos;",
					" *\x84 Comisario\x80  - su tarea es encontrar y eliminar al\x85 Asesino\x80, puede usar todos los Anillos De Armas disponibles;",
					" * \x83Inocente\x80 - completamente desarmado, debe evitar ser asesinado pero tambien debe ayudar\x84 al Comisario\x80 a encontrar\x85 al Asesino\x80.",
					"\nEsa es toda la informacion basica requerida para empezar a jugar, si todavia te perdiste de algo o quieres saber mas usa estos comandos de consola:",
					"\x87MMHELP GAME\x80 - Mas sobre el juego y situaciones en partida;",
					"\x87MMHELP BAD\x80  - Cosas malas de hacer y como el juego castiga por ellas;",
					"\x87MMHELP CHAT\x80 - List of sound emojis you can use in chat;",
					"\x87MMHELP INFO\x80 - Informacion tecnica sobre la version y Que hay de nuevo.",
					"\nTal vez quieras usar \x87MMLANG\x80 tambien para cambiar el idioma dentro de MM"
				},
				["GAME"]={
					"\x87".."Sobre situaciones de gameplay",
					"Como se explico previamente en lo basico el objetivo es eliminar al Asesino, pero durante la partida situaciones diferentes pueden ocurrir:",
					"\n* Si alguien te derriba con su aniillo en conviertes en\x8F Muerto\x80.",
					"Los jugadores\x8F".."Muertos\x80 no son capaces de reaparecer y hablarle a jugadores que esten vivos, sus mensajes solo seran visibles a otros jugadores\x8F muertos\x80.",
					"Haciendo \x87SAYTO\x80 en la consola o PMear el jugador vivo mientras estas muerto es imposible.",
					"Tambien\x82 NO INTENTES RENOMBRARTE\x80, mas detalles sobre esto en \x87MMHELP BAD\x80.",
					"\n* La tarea del\x84 Comisario\x80 es eliminar a todos los\x85 Asesinos\x80, pero aveces\x84 el\x80 puede matar al \x83Inocente\x80.",
					"Si esto pasa el\x84 Comisario\x80 perdera su rol y otro \x83Inocente\x80 lo tomara. Asi que piensa cuidadosamente a quien le disparas como Comisario!",
					"\n* Usualmente hay un\x85 Asesino\x80 y un\x84 Comisario\x80 entre los jugadores, pero esos numeros pueden cambiar si hay mas jugadores en linea.\nEmpezando con 7 jugadores y mas\x8B Equipos\x80 de\x85 Asesinos\x80 y\x84 Comisarios\x80 seran formados.",
					"Los\x8B Aliados\x80 pueden chatear entre si en su chat de equipo con el comando de consola \x87SAYTEAM\x80 (nota que el boton de SAYTEAM funcionara igual que el chat regular).",
					"Si un\x8B aliado\x80 golpea a otro ambos tendran una notificacion sobre no volverse a golpear entre si. Recuerda que otros pueden ver tu pelea de \'amistad\' y darse cuenta de quien eres!",
					"\nSi estas interesado en entender mas puedes leer:",
					"\x87MMHELP BAD\x80 - Cosas que no deberias hacer en el juego MM"
				},["BAD"]={
					"\x87".."Cosas malas de hacer en MM",
					"Regla No.1 en cada juego:\x82 Se amable y diviertete!\x80 Aparte de esto...",
					"* Advertir sobre el \x8BRol\x80 no hara el juego un\'Misterio\', puedes decir el rol de alguien mas si lo sabes pero nunca digas el tuyo",
					"* No insultar a otros jugadores, se permiten bromas pero solo en modo amistoso",
					"* Estando AFK es un crimen de guerra. Si estaras inactivo por 2 minutos el juego te sacara (solo si estas vivo)",
					"* No te renombres bajo ninguna circunstancia en MM - el juego es escricto sobre esto y tu SRB2 se \x85 auto-cerrara\x80 si intentas hacer esto. Si nesecitas renombrarte espera a la pantalla de Intermision para hacerlo.",
					"Romper una de estas reglas puede resultar en una expulsion o incluso un baneo, porfavor no las rompas y juega justamente",
					"\nMas paginas de ayuda que talvez quieras leer en tu consola:",
					"\x87MMHELP GAME\x80 - Sobre situaciones de gameplay"
				},["CHAT"]={
					"\x87".."Como usar emojis de sonido\x80",
					"Cuando un jugador envia un mensaje y contiene algunas palabras/frases especiales un emoji de sonido especifico se reproducira con el mensaje.",
					"Basicamente cuando escribes \"bruh\" en un mensaje un sonido de BRUH se reproducira cuando lo envies",
					"Aqui esta la lista de emojis de sonido y como activar cada uno de ellos:\n",
					"  \x88Keyword\x80       | \x89Sound",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | Sonido de pedo",
					"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:         | \"WOW!\" como anime",
					"  hehe          | risita del DOOMGUY",
					"  \\:|           | Vine boom (Ceja de la roca)",
					"  bruh          | bruh",
					"  /:|           | Vine boom (Ceja de la roca)",
					"  AMONGUS       | \"AMONG US\"",
					"  AMONG US      | \"AMONG US\"",
					"  on no         | Knuckles' 'OH NO'",
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
					"\nMas paginas de ayuda que talvez quieras leer en tu consola:",
					"\x87MMHELP GAME\x80 - Sobre situaciones de gameplay"
				}
			},["ROLE_GET"]={
				"Eres el\x85 Asesino\x80!\x85 Acaba con todos.",
				"Eres el\x84 Comisario\x80!\x84 Elimina al Asesino.\x80 Si matas al Inocente, pierdes.",
				"Eres un \x83Inocente\x80! Escondete y ayuda al Comisario a encontrar el Asesino. "
			},["NEWROLE_GET"]={
				"\x87La Vida te hizo un\x85 Asesino\x87,\x85 ahora ve a matar a todos.",
				"\x87".."El Universo the ha hecho el nuevo\x84 Comisario\x87! Ahora tu trabajo es\x84 eliminar a todos los asesinos\x87!"
			},["TEAMMATE_HIT"]={
				"Oye, este tipo es tu aliado, no vuelvas a intentar matarlo",
				"Tu aliado te golpeo, no te enojes con el"
			},["MURD_KILLED"]={
				"\x85".."El Asesino\x87",
				"\x80".."fue eliminado!"
			},["SHERI_KILLED"]={
				"\x84".."El Comisario\x87",
				"\x80".."fue asesinado! los \x83Inocentes\x80 pueden tomar su esmeralda para terminar el trabajo!",
				"\x80".."fue asesinado!"
			},["SHREML_PICK"]="Algun inocente tomo la\x84 Esmeralda Del Comisario\x80...",
			["INNO_HURT_PM"]="\x87Mataste al \x83Inocente\x87! Ya no eres un\x84 Comisario\x87!",
			["INNO_HURT"]="El\x84 Comisario\x80 mato al Inocente! Alguien mas de los \x83Inocentes\x80 tendra que terminar su trabajo!",
			["ONE_LEFT"]={
				"Uno de los\x85 Asesinos\x80 se fue!",
				"Uno de los\x84 Comisarios\x80 se fue!",
			},["LAST_LEFT"]={
				"Queda el ultimo\x85 Asesino!",
				"Queda el ultimo\x84 Comisario!",
				"Queda el ultimo\x83 Innocente!"
			},["REPLACE_LEFT"]={
				"El\x85 Asesino\x80 se fue! Alguien de los \x83Inocentes\x80 tomo su rol!",
				"El\x84 Comisario\x80 se fue! Alguien de los \x83Inocentes\x80 tomo su rol!",
			},["ROLE_WIN"]={
				"Todos estan asesinados, los\x85 Asesinos\x80 ganan!",
				"Todos los asesinos han sido eliminados, Los\x84 Comisarios\x80 y todos los \x83Inocentes\x80 ganan!",
				"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 mato al ultimo Inocente!",
			},["CHAT"]={
				"esta vivo, el mensaje no ha sido enviado",
				"Estas enviando demasiados mensajes, porfavor espera",
				"No puedes solo convertirte en\x8F muerto\x80 para espectar!",
			},["ROLES_HUD"]={
				"\x85".."ASESINO",
				"\x84".."COMISARIO",
				"\x83INOCENTE",
				"\x8FMUERTO"
			},["TEAMALIVE_HUD"]="Aliados vivos:",
			["KILLBY_HUD"]="Asesinado por",
			["HUD_SCORESTAB"]={
				"No hay puntaje aqui! Los contadores\ndebajo pueden ayudarte",
				"\nSi eres nuevo al tipo de juego\nusa \x87MMHELP\x80 en la Consola",
				"\n\n\x82".."Diviertete ;)"
			},["HUD_ROLESALIVE"]={
				"\x85".."Asesinos vivos:",
				"\x84".."Comisarios vivos:",
				"\x83Inocentes vivos:"
			},["HUD_DEAD"]={
				"Estas\x8F muerto",
				"No puedes reaparecer o hablarle a los vivos"
			},["HUD_MIDJOIN"]={
				"Te uniste en \x84la mitad de la partida\x80, espera para jugar una nueva ronda"
			},["HUD_ALONE"]={
				"\x84".."2 jugadores\x80 son requeridos para el juego,",
				"porfavor espera \x84un jugador mas\x80 para empezar"
			},["WINNERS_HUD"]="Ganadores:",
			["WIN_HUD"]={
				"EMPATE!",
				"\x85".."ASESINOS",
				"\x84".."COMISARIOS\x80 & \x83INOCENTES"
			},["MMLANG"]={
				"Tu idioma actual en uso es el\x82 Espanol\x80\nLo puedes cambiar con \x87MMLANG [idioma]",
				"El Idioma personal para Misterio De Asesinato ha sido cambiado a\x82 Espanol"
			}
		},["PL"]={ -- Polish by sopix
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="sopix",
			["MM"]="Tajemnica Mordercy",
			["MMHELP"]={
				["MAIN"]={
					"\x87    Witaj w Tajemnicy Morderstw!\nInterpretacji popularnej gry w SRB2",
					"\nCelem jest znalezienie i\x84 wyeliminowanie\x80 wszystkich \x85Mordercow\x80 zanim zabija\x83 wszystkich\x80. Ten typ gry jest bazowany na MATCH wiec bedziesz musial umiec strzelac.",
					"Ale najpierw musisz poznac podstawy:",
					"\nDostaniesz \x8BRole\x80 na poczatku kazdej nowej rundy, tutaj sa wszystkie 3 podstawowe \x8BRole\x80 ktore mozesz dostac:",
					" * \x85Morderca\x80 - musi wszystkich zamordowac, ale jest limitowany do uzywania tylko Czerwonych (Normalnych) i Nieskonczonych pierscieni;",
					" * \x84Szeryf\x80  - jego zadaniem jest wyeliminowanie \x85Mordercow\x80, moze uzyc kazdego Pierscienia;",
					" * \x83Niewinny\x80 - kompletnie bezbronny, musi uwazac zeby nie zostac zabity ale takze pomagac \x84Szeryfowi\x80 znalezc \x85Morderce\x80.",
					"\nTo wszystkie podstawowe informacje do gry, jesli nadal czegos nie wiesz lub chcesz sie dowiedziec wiecej uzyj tych komend:",
					"\x87MMHELP GAME\x80 - Wiecej o grze i sytuacjach w niej;",
					"\x87MMHELP BAD\x80  - Rzeczy ktore sa zle do zrobienia i jak jest sie karanym;",
					"\x87MMHELP CHAT\x80 - List of sound emojis you can use in chat;",
					"\x87MMHELP INFO\x80 - Techniczne informacje i \"Co jest nowe\".",
					"\nMozesz tez uzyc \x87MMLANG\x80 zeby zmienic jezyk TM"
				},["GAME"]={
					"\x87".."O sytuacjach w grze",
					"Jak wyjasniono wczesniej, celem jest wyeliminowanie Mordercy, ale podczas gry rozne sytuacje moga sie wydarzyc:",
					"\n* Jesli ktos cie zastrzeli pierscieniem stajesz sie\x8F Martwy\x80",
					"\x8FMartwi\x80 gracze nie moga sie respawnowac ani gadac z zywymi graczami, ich wiadomosci sa tylko widzoczne dla innych\x8F martwych\x80 graczy.",
					"Napisanie \x87SAYTO\x80 w konsoli lub prywatne napisanie do gracza gdy jestes martwy jest niemozliwe.",
					"Takze\x82 NIE PROBUJ ZMIENIAC NICKU\x80, wiecej detali w \x87MMHELP BAD\x80.",
					"\n* \x84Szeryf\x80 ma za zadanie wyeliminowac wszystkich \x85Mordercow\x80, ale czasami \x84on\x80 moze zabic \x83Niewinnego\x80.",
					"Jesli to sie stanie \x84Szeryf\x80 straci jego role i inny \x83Niewinny\x80 ja zdobedzie. Wiec mysl w kogo strzelasz jako Szeryf!",
					"\n* Normalnie jest tylko jeden \x85Morderca\x80 i jeden \x84Szeryf\x80 sposrod graczy, ale te numery moga sie zmienic jesli jest wiecej graczy online.\nZaczynajac od 7 lub wiecej graczy\x8B Druzyny\x80 \x85Mordercow\x80 i \x84Szeryfow\x80 zostana stworzone.",
					"\x8BKoledzy z druzyny\x80 moga czatowac ze swoja druzyna za pomoca komendy \x87SAYTEAM\x80 w consoli (uwaga, klawisza SAYTEAM bedzie dzialac jak normalny czat).",
					"Jesli jeden \x8Bkolega\x80 z druzyny strzeli w drugiego obydwoje dostana wiadomosc zeby w siebie nie strzelac. Pamietaj ze inni moga zobaczyc twoja \'przyjazn\' walcz i zdaj sobie sprawe kim jestes!",
					"\nJesli chcesz dowiedziec sie wiecej uzyj:",
					"\x87MMHELP BAD\x80 - Rzeczy ktorych nie powinienes robic podczas TM"
				},["BAD"]={
					"\x87Rzeczy ktore sa zle w TM",
					"Zasada nm. 1 kazdej gry:\x82 Badz mily i sie baw!\x80 Oprocz tego...",
					"* Samo zaspoilerowanie \x8BRoli\x80 sprawi ze gra nie bedzie \'Tajemnica\', mozesz powiedziec role kogos innego jesli ja znasz ale nigdy swojej.",
					"* Nie badz niemilym dla innych, zarty sa dozwolone ale tylko w przyjaznej atmosferze.",
					"* Bycie AFK to zbrodnia wojenna. Jesli bedziesz nieaktywny przez dluzszy czas gra cie wyrzuci (tylko jesli zyjesz)",
					"* Nie zmieniaj nicku podczas TM - gra jest bardzo scisla i\x85 auto-wylaczy\x80 twoje SRB2 jesli to zrobisz. Jesli musisz zmienic nick to zaczekaj na ekran rezul.",
					"Zlamanie jednej z tych zasad moze poskutkowac wyrzuceniem lub nawet banem, prosze ich nie lamac i bawic sie.",
					"\nWiecej pomocy ktore moga ci sie przydac:",
					"\x87MMHELP GAME\x80 - O sytuacjach w grze"
				},["CHAT"]={
					"\x87Jak uzywac Emoji Dzwiekow\x80",
					"Kiedy gracz wysle wiadomosc ktora zawiera specjalne slowo/fraze specyficzne Emoji Dzwieku zagra razem z wiadomoscia.",
					"Poprostu jesli napiszesz \"bruh\" w wiadomosci to dzwiek BRUH zagra kiedy ja wyslesz",
					"To jest lista Emoji Dzwieku i jak je aktywowac:\n",
					"  \x88Slowo\x80         |\x89 Dzwiek",
					" ---------------+-----------------------------",
					"  :skull:       | \"Bad to the Bones\"",
					"  :fart:        | Dzwiek pierdu",
					"  :omg:         | \"OOHhhh myyy Goooddddd...\"",
					"  :wow:         | Jak w anime \"WOW!\"",
					"  hehe          | Smiech DOOMGUYA",
					"  \\:|           | Boom z Vine (Zesa Rocka)",
					"  bruh          | bruh",
					"  /:|           | Boom z Vine (Zesa Rocka)",
					"  AMONGUS       | \"*AMONG US*\"",
					"  AMONG US      | \"*AMONG US*\"",
					"  sus           | SUS",
					"  oh no         | Knucklesa \'OH NO\'",
					"  AGHH          | Eggmana \'AGHHHH!\'",
					"  AHH           | Eggmana \'AGHHHH!\'",
					"  AHA           | Eggmana \'AHA!\'",
					"  NO WAY        | Eggmana \'NO WAY!\'",
					"  NOPE          | Nope.",
					"  GET OVER HERE | \"GET OVER HERE!\"",
					"  NOO           | \"NOOOOOOoooooo...\"",
					"  HELP          | Tyler1's \"HELP!\"",
					"  HEHEHE HA     | Clash Royal King's laugh",
					"  HEHE BOI      | \"Hehe boi...\"",
					" ---------------+-----------------------------",
					"Wiecej pomocy:",
					"\x87MMHELP BAD\x80 - Rzeczy ktorych nie powinienes robic podczas TM",
					"\x87MMHELP GAME\x80 - O sytuacjach w grze"
				}
			},["ROLE_GET"]={
				"Jestes \x85Morderca\x80! \x85Zamorduj wszystkich.",
				"Jestes \x84Szeryfem\x80! \x84Wyeliminuj wszystkich Morderc\x80. Jesli zabijesz Niewinnego, przegrywasz",
				"Jestes \x83Niewinnym\x80! Schowaj sie i pomoz Szeryfowi znalezc Morderce."
			},["NEWROLE_GET"]={
				"\x87Zycie zrobilo z ciebie \x85Morderce\x87, \x85teraz idz wszystkich zabic.",
				"\x87Wszechswiat mianowal cie nowym \x84Szeryfem\x87! To teraz twoja robota aby\x84 wyeliminowac wszystkich Mordercow\x87!"
			},["TEAMMATE_HIT"]={
				"Hej, ten ktos jest w twojej drużynie, nie próbuj go ponownie zabic",
				"Ktos z twojej druzyny cie strzelil, nie badz zly na niego"
			},["MURD_KILLED"]={
				"\x85Morderca\x87",
				"\x80zostal wyeliminowany!"
			},["SHERI_KILLED"]={
				"\x84Szeryf\x87",
				"\x80zostal zamordowany! \x83Niewinni\x80 moga podniesc jego emerald i dokonczyc robote!",
				"\x80zostal zamordowany!"
			},["SHREML_PICK"]="Jakis niewinny podniosl \x84Szmaragd Szeryfa\x80...",
			["INNO_HURT_PM"]="\x87Zamordowales \x83Niewinnego\x87! Juz nie jestes \x84Szeryfem\x87!",
			["INNO_HURT"]="\x84Szeryf\x80 zamordowal Niewinnego! Ktos z innych \x83Niewinnych\x80 musi dokonczyc robote!",
			["ONE_LEFT"]={
				"Jeden z \x85Mordercow\x80 wyszedl!",
				"Jeden z \x84Szeryfow\x80 wyszedl!"
			},["LEFT_LEFT"]={
				"Ostatni \x85Morderca\x80 wyszedl!",
				"Ostatni \x84Szeryf\x80 wyszedl!",
				"Ostatni \x83Niewinny\x80 wyszedl!"
			},["REPLACE_LEFT"]={
				"\x85Morderca\x80 wyszedl! Ktos z \x83Niewinnych\x80 ma jego role!",
				"\x84Szeryf\x80 wyszedl! Ktos z \x83Niewinnych\x80 ma jego role!"
			},["ROLE_WIN"]={
				"Wszyscy zostali zamordowani, \x85Mordercy\x80 wygrywaja!",
				"Wszyscy mordercy wyeliminowani, \x84Szeryfi\x80 & wszyscy \x83Niewinni\x80 wygrywaja!",
				"\x85Mordercy\x80 wygrywaja ponieważ \x84Szeryf\x80 zamordowal ostatniego Niewinnego!"
			},["CHAT"]={
				"jest zywy, wiadomosc nie zostala wyslana",
				"Wysylasz za duzo wiadomosci, prosze poczekac",
				"Nie mozesz poprostu zostac \x8FMartwym\x80!"
			},["ROLES_HUD"]={
				"\x85MORDERCA",
				"\x84SZERYF",
				"\x83NIEWINNY",
				"\x8FMARTWY"
			},["TEAMALIVE_HUD"]="Zywi w druzynie:",
			["KILLBY_HUD"]="Zabity przez",
			["HUD_SCORESTAB"]={
				"Tutaj nie ma punktow! Liczniki na dole\nmoga pomoc",
				"\nJesli jestes nowy w tym trybie\nuzyj \x87MMHELP\x80 w Konsoli",
				"\n\n\x82".."Baw sie dobrze ;)"
			},["HUD_ROLESALIVE"]={
				"\x85Zywi Mordercy:",
				"\x84Zywi Szeryfi:",
				"\x83Zywi Niewinni:"
			},["HUD_DEAD"]={
				"Jestes\x8F martwy",
				"Nie mozesz powrocic do zycia",
				"albo gadac do zywych"
			},["HUD_MIDJOIN"]={
				"Dolaczyles/as w \x84srodku rundy\x80, poczekaj na nastepna runde zeby grac"
			},["HUD_ALONE"]={
				"Potrzeba\x84 2 graczy\x80 do gry",
				"Zaczekaj prosze na \x84jeszcze jednego\x80 gracza"
			},["WINNERS_HUD"]="Wygrali:",
			["WIN_HUD"]={
				"REMIS!",
				"\x85MORDERCY",
				"\x84SZERYFI\x80 & \x83NIEWINNI"
			},["MMLANG"]={
				"\x82Polski\x80 ustanowiony jako twoj jezyk w Tajemnicy Morderstw\nMozesz zmienic go za pomocy \x87MMLANG [jezyk]",
				"Personalny jezyk dla Tajemnicy Morderstw ustanowiony na \x82Polski"
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
		},["UA"]={ -- Ukrainian by LeonardoTheMutant (since SRB2 supports only ASCI and not cyrilic this whole lang text is "Jee Jee" instead of "GG")
			["VERSION"]="8.0-BETA",
			["AUTHOR"]="LeonardoTheMutant",
			["MM"]="Tajemnycia Wbywstwa",
			["MMHELP"]={
				["MAIN"]={
					"\x87    Witaju w Tajemnyci Wbywstwa!\nInterpretacija popularnoji gry w SRB2",
					"\nCilliu gry je znahodzhennia i\x84 eliminacija\x80 usih \x85Wbywc\x80 dopoky wony ne wbjut' \x83usih\x80. Cej typ gry bazowanyj na MATCH tomu tobi treba wmity strilaty.",
					"Ale spochatku majesh zrozumity osnowy:",
					"\nTy otrymujesz \x8BRol\x80 na poczatku kozhnogo nowogo raundu, os' usi 3 mozhlywi \x8BRoli\x80 kotri mozhesh otrymaty:",
					" * \x85Wbywcia\x80  - win musyt' wbyty usih, ale mozhe wykorystowuwaty tilky cherwoni (Normalni) i Neskinchenni kilcia;",
					" * \x84Sheryf\x80   - jogo zawdanniam je eliminacia \x85Wbywc\x80, mozhe wykorystowuwaty usi dostupni kilcia do strilby;",
					" * \x83Newynnyj\x80 - absolutno bezbrojny, win maje unykaty swojeji smerti wid Wbywc ale takozh dopomagaty \x84Sheryfowi\x80 znajty \x85Wbywciu\x80.",
					"\nTo usia osnowna informacija potriba do gry, jaksho chogos ne znajesh abo hochesh diznatysia bilshe wykorystaj ci komandy:",
					"\x87MMHELP GAME\x80 - Bilshe pro gru i igrowi sytuacii;",
					"\x87MMHELP BAD\x80  - Rechi jakych ne treba robyty i jak za nych karajut';",
					"\x87MMHELP CHAT\x80 - Lyst zwukowyh emoji jaki mozhna wykorystaty w chati;",
					"\x87MMHELP INFO\x80 - Tehnichna informacija i \"Sho nowogo\"/",
					"\nMozesz takozh wykorystaty \x87MMLANG\x80 shob zminyty mowu w TW"
				},["GAME"]={
					"\x87".."O sytuacijach w gri",
					"Jak ukazano ranishe, cilliu gry je eliminacija Wbywc, ale pidchas gry mozhut wynyknuty rizni igrowy sytuaciji:",
					"\n* Jaksho htos zastrelyt tebe kilcem ty stajesh \x8FMertwym\x80.",
					"\x8FMertwi\x80 grawci nie mozhut widrodzhuwatysia ani rozmowliaty z zywymi grawciamy, jich powidomlennia mozhut bachyty tilky \x8Fmertwi\x80 grawci.",
					"Pysaty za dopomogy \x87SAYTO\x80 w konsoli abo prywatnych powidomlen' do zhywogo grawcia nemozhlywo jaksho ty zhywyj.",
					"Takozh\x82 NE NAMAGAJSIA ZMINITY NICKU\x80, detalnishe pro ce w \x87MMHELP BAD\x80.",
					"\n* \x84Sheryf\x80 maje elininuwaty usih \x85Wbywc\x80, ale czasamy \x84win\x80 moze wbyty \x83Newynnogo\x80.",
					"Jaksho ce stanetsia \x84Sheryf\x80 zgubyt' swoju rol i innyj \x83Newynnyj\x80 otrymaje jiji. Tozh dumaj w kogo strilajesh za Sheryfa!",
					"\n* Zazwychaj je tilky odyn \x85Wbywcia\x80 i odyn \x84Sheryf\x80 sered grawciw, ale ci cyfry mozhut' zminytysia jakso je bilshe grawciw online.\nPochynajuchy wid 7 abo bilshe grawciw formujutsia \x8BKomandy\x80 \x85Wbywc\x80 i \x84Sheryfiw\x80.",
					"\x8BNaparnyky z komandy\x80 mozhut' rozmowliaty zi swojeju komandoju za dopomogy \x87SAYTEAM\x80 w consoli (zwerny uwagu sho knopka SAYTEAM bude praciuwaty tak samo jak i normaly chat).",
					"Jaksho odyn z \x8Bnaparnykiw\x80 zachepyt' inshogo obydwa otrymajut' powidomlennia shob nadali ne strilalysia. Pamiataj sho inni tezh mozhut' bachyty washu \'pryjatelsku\' bytwu i zdogadatysia kym wy je!",
					"\nJaksho hochesh diznatysia bilshe wykorystaj:",
					"\x87MMHELP BAD\x80 - Rechi kotrych ne mozhna robyty w TW"
				},["BAD"]={
					"\x87Rechi kotrych ne mozhna robyty w TW",
					"Prawylo Nomer 1 kozhnoji gry:\x82 Bud' dobryj i nasolodzhujsia groju!\x80 Krim ciogo...",
					"* Gra ne zrobyt'sia \'Tajemnychoju\' jakso ty rozkazhesh pro swoju \x8BRol'\x80 usim. Mozhesh skazaty rol kogos inshogo jaksho znajesh napewno ale nikoly ne powidomliaj swojeji.",
					"* Nie bud' zlyj dlia inshyh, zharty dozwoleno ale tilky w druzhnij atmosferi.",
					"* Buty AFK ce wojennyj zlochyn. Jaksho budesh neaktywnyj ponad 2 hwylyny gra kick'ne tebe (tilky jaksho ty zhywyj)",
					"* Nie zminiuj nicku pidchas TW - gra je duzhe serjozna na cej wypadok i\x85 auto-zakryje\x80 twoju gru SRB2 jaksho zrobujesh ce zrobyty. Jesli musisz zmenic nick to poczekaj na ekran przerwy.",
					"Porushennia odnijeji z cyh prawyl mozhe powoduwaty KICK ta nawit BAN. Bud' Laska ne porushujte i grajte chesno.",
					"\nBilshe dopomogy kotra mozhe dopomogty:",
					"\x87MMHELP GAME\x80 - O sytuacjach u gri"
				},["CHAT"]={
					"\x87Jak wykorystowuwaty Zwukowi Emoji\x80",
					"Koly grawec' widprawliaje powidomlennia i wono maje u sobi jakijs' kluchowyj wyraz razom z powidomlenniam zagraje specefichne Zwukowe Emoji.",
					"Koroche, koly ty pyshesh \"bruh\" wsi pochujut' \"BRUH\" razom z powidomlenniam",
					"Os' pownyj lyst Zwukowych Emoji i jak ich aktywuwaty:\n",
					"  \x88Slowo-kluch\x80   | \x89Zwuk",
					" ---------------+---------------------------",
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
					" ---------------+---------------------------",
					"Bil'she dopomogy:",
					"\x87MMHELP GAME\x80 - Pro igrowi sytuacji",
					"\x87MMHELP BAD\x80  - Spysok duzhe poganych rechej kotrych ne treba robyty"
				}
			},
			["ROLE_GET"]={
				"Ty \x85wbywcia\x80! \x85Zamorduj usih.",
				"Ty \x84Sheryf\x80!\x84 Likwiduj usih wbywc'\x80. Jaksho zab'jesh Newynnogo ty prograjesh.",
				"Ty \x83Newynnyj\x80! Showajsia i dopomozhy Sheryfowi znajty Wbywciu."
			},["NEWROLE_GET"]={
				"\x87Zhyttia zrobylo \x85Wbywciu\x87 z tebe, \x85teper pidy i wbyj usih.",
				"\x87Wsesvit zrobyw tebe nowym \x84Sheryfom\x87! Teper ce twoja robota \x84wyeliminuwaty usih wbywc\x87!"
			},["TEAMMATE_HIT"]={
				"Gej, ce twij naparnyk, ne namagajsia wbyty jogo znow",
				"Twij naparnyk zachepyw tebe, ne zlys na niogo"
			},["MURD_KILLED"]={
				"\x85Wbywcia\x87",
				"\x80".."buw likwidowanyj!"
			},["SHERI_KILLED"]={
				"\x84Sheryf\x87",
				"\x80".."buw wbytyj! \x83Newynni\x80 mozhut' wziaty jogo Smaragd shob zabraty jogo rol'!",
				"\x80".."buw wbytyj!"
			},["SHREML_PICK"]="Htos z Newynnych wziaw \x84Smaragd Sheryfa\x80...",
			["INNO_HURT_PM"]="\x87Ty wbyw \x83Newynnogo\x87! Ty bilshe ne \x84Sheryff\x87!",
			["INNO_HURT"]="\x84Sheryff\x80 wbyw Newynnogo! Komus z \x83Newynnych\x80 potribno zakinchyty jogo robotu!",
			["ONE_LEFT"]={
				"Odyn z \x85Wbywc\x80 pokynuw gru!",
				"Odyn z \x84Sheryffiw\x80 pokynuw gru!"
			},["LAST_LEFT"]={
				"Ostannij \x85Wbywcia\x80 pokynuw gru!",
				"Ostannij \x84Sheryff\x80 pokynuw gru!",
				"Ostannij \x83Newynnyj\x80 pokynuw gru!"
			},["REPLACE_LEFT"]={
				"\x85Wbywcia\x80 pokynuw gru! Htos z \x83Newynnych\x80 wziaw jogo rol!",
				"\x84Sheryff\x80 pokynuw gru! Htos z \x83Newynnych\x80 wziaw jogo rol!"
			},["ROLE_WIN"]={
				"Usi mertwi, \x85Wbywci\x80 wygraly!",
				"Wsi Wbywci buly eliminowani, \x84Sheryfy\x80 i wsi \x83Newynni\x80 wygraly!",
				"\x85Wbywci\x80 wygraly bo \x84Sheryff\x80 wbyw ostanniogo Newynnogo!"
			},["CHAT"]={
				"she zhywyj, powidomlennia ne widislano",
				"Ty pyshesh zabagato powidomlen', bud' laska zachekaj",
				"Ne mozhna prosto tak staty \x8FMetrwym\x80!"
			},["ROLES_HUD"]={
				"\x85WBYWCIA",
				"\x84SHERYF",
				"\x83NEWYNNYJ",
				"\x8FMERTWYJ"
			},["TEAMALIVE_HUD"]="Naparnykiw w zhywych:",
			["KILLBY_HUD"]="Wbytyj grawcem",
			["HUD_SCORESTAB"]={
				"Tablyci ochok tut nema, ale lichylnyki\nunyzu mozhut dopomogty",
				"\nJaksho ty nowachok u cij gri\nwykorystaj \x87MMHELP\x80 w Konsoli",
				"\n\n\x82Udachi ;)",
				"\n\nP.S. Duzhe klasno jaksho ty use ce\nmozhesh prochytaty!"
			},["HUD_ROLESALIVE"]={
				"\x85Wbywc w zhywych: ",
				"\x84Sheryfiw w zhywych: ",
				"\x83Newynnych w zhywych: "
			},["HUD_DEAD"]={
				"Ty\x8F mertwyj",
				"Ne mozhesh widrodzhuwatysia",
				"abo goworyty do zhywyh"
			},["HUD_MIDJOIN"]={
				"Ty pryjednawsia \x84posered raundu\x80, pochekaj nowogo raundu shob zagraty"
			},["HUD_ALONE"]={
				"Potribno \x84".."2 grawcia\x80 dla gry,",
				"zachekaj na \x84she odnogo\x80 grawcia aby pochaty"
			},["WINNERS_HUD"]="Wygraly:",
			["WIN_HUD"]={
				"NICHYJA!",
				"\x85WBYWCI",
				"\x84SHERYFY\x80 ta \x83NEWYNNI"
			},["MMLANG"]={
				"\x82Ukrainska\x80 wstanowlena jak twoja mowa w Tajemnyci Wbywstw\nMozhesh zminyty jiji za dopomogoju \x87MMLANG [mowa]",
				"Personalna mowa dla Tajemnyci Wbywstw wstanowlena na \x82Ukrainsku"
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
	winner=0 --for intermission, netsynced
})
--Roles constants
rawset(_G, "ROLE_NONE", 0)
rawset(_G, "ROLE_MURDERER", 1)
rawset(_G, "ROLE_SHERIFF", 2)
rawset(_G, "ROLE_INNOCENT", 3)
rawset(_G, "ROLE_HERO", 4)

--functions
rawset(_G, "SetRandomInnoAs", function(role)
	while true
		for p in players.iterate
			if P_RandomKey(4)==0 and p.role==ROLE_INNOCENT and not p.spectator then
				p.role=role
				if (role!=ROLE_HERO) chatprintf(p, MurderMystery.text[p.mmlang]["NEWROLE_GET"][p.role])
				else chatprintf(p, MurderMystery.text[p.mmlang]["NEWROLE_GET"][3]) end
				return
			end
		end
	end
end)
rawset(_G, "PlayerCount", function(role)
	local plrc = 0
	if (not role) for p in players.iterate plrc=$+1 end
	else for p in players.iterate if (p.role==role) plrc=$+1 end end end
	return plrc
end)
rawset(_G, "PlayersAlive", function()
	local plrs=0
	for p in players.iterate if (not p.spectator) plrs=$+1 end end
	return plrs
end)
rawset(_G, "AssignRole", function(role, multiplier)
	while multiplier!=0
		for p in players.iterate
			if (p.role==ROLE_NONE) and (not p.spectator) and (P_RandomKey(4)==0) and (multiplier!=0)
				p.role=role
				multiplier=$-1
			end
		end
	end
end)

--Customization API
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
	if type(langID)~="string" error("Language ID should be string and contain 2-3 characters long") end
	if type(langTbl)~="table" error("Language Talbe shoulb be table.") end
	for l in pairs(MurderMystery.text)
		if l==langID
			print("\x82"..langID.."\x85 lang has already been added. Language was not added. Resart the SRB2 to clear the file from loaded mods")
			return
		end
	end
	MurderMystery.text[langID:upper()]=langTbl
	print("\x83Succesfuly added \x82"..langID.." \x83(by "..tostring(MurderMystery.text[langID:upper()]["AUTHOR"])..") lang as a MM language.")
	if MurderMystery.text[langID:upper()]["VERSION"]~=MurderMystery.version print("\x82WARNING:\x80 This language file is \x85OUTDATED\x80 and may result crashes. Please ask \x84"..tostring(MurderMystery.text[langID:upper()]["AUTHOR"]).."\x80 to update it for the \x87Murder Mystery "..MurderMystery.version) end
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
CV_RegisterVar{name="mmspam", defaultvalue=35, flags=4, PossibleValue=CV_Unsigned}
CV_RegisterVar{name="mmafk",defaultvalue=4200,PossibleValue={MIN=0,MAX=21000},flags=4}

--MM init
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

addHook("NetVars", function(net)
	MurderMystery.text = net($)
	MurderMystery.CharStats = net($)
	MurderMystery.winner = net($)
end)

--stability code
addHook("ThinkFrame", do
	if gametype!=GT_MURDERMYSTERY return end
	if CV_FindVar('rejointimeout').value!=0 --REJOINTIMEOUT kills Murder Mystery. Why? You have to wait X minutes for game to finally triger player quit! SRB2 2.2.11 disabled changing this CVAR from LUA. What a stupid decision
		CONS_Printf(server, "ADMIN, DISABLE THE \x87REJOINTIMEOUT\x80, MM DOESN'T WORK PROPERLY WITH THIS CVAR")
	end
end)