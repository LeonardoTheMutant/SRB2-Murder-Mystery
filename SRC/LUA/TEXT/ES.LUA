-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- SPANISH
-- Made by Jesus.B

MM.AddLang("ES", {
	["VERSION"] = "1.3",
	["AUTHOR"] = "Jesus.B",
	["CON_MMLANG"] = {
		"Tu idioma actual es\x82 Espanol\x80\nPuedes cambiarlo con el comando \x87MMLANG [idioma].",
		"Tu idioma personal para Murder Mystery cambio al\x82 Espanol."
	},
	["CHAT_ROLEGET_PM"] = {
		"Eres el\x85 Asesino. Acaba con todos.",
		"Eres el\x84 Comisario\x80!\x84 Elimina a todos los Asesinos\x80. Mata a la \x83persona equivocada\x80, y perderas tu rol.",
		"Eres un\x83 Civil\x80! Escondete y ayuda con la investigacion."
	},
	["CHAT_NEWROLEGET_PM"] = {
		"\x87La vida decidio de la nada que seras un\x85 Asesino\x87.\x85 Ahora ve y mata a todos!",
		"\x87".."El Universo te hizo un\x84 Comisario\x87! Ve y\x84 elimina a todos los Asesinos\x87!",
		"\x87Se decidio que seras un \x82Heroe\x87. Salva a todos de los Asesinos!",
		"\x87".."Eliminaste uno de los\x85 Asesinos\x87! Te ganaste el honor de un \x82Heroe\x87!"
	},
	["CHAT_TEAMMATEHIT_PM"] = {
		"Ten cuidado! Ese es tu aliado. Evita el fuego aliado la proxima!",
		"Tu aliado te ha golpeado accidentalmente. NO se recomienda Vengarse!"
	},
	["CHAT_MURDKILLED"] = {
		"El\x85 Asesino",
		"fue eliminado!",
	},
	["CHAT_SHERIKILLED"] = {
		"El\x84 Comisario",
		"fue eliminado!",
		"Encuentra su\x84 Esmeralda\x80!"
	},
	["CHAT_HEROKILLED"] = {
		"El \x82Heroe",
		"fue asesinado!",
	},
	["CHAT_DIEDHAZARD"] = "Moriste accidentalmente. Que desafortunado.",
	["CHAT_SHREMDPICKUP"] = "Alguien ha tomado la\x84 Esmeralda del Comisario\x80...",
	["CHAT_KILLPUNISHMENT_PM"] = {
		"\x87Mataste a un\x83 Civil\x87! Has sido despedido. (Ya no eres Comisario)",
		"\x82Los Heroes\x87 no deberian matar\x83 Civiles\x87! Has sido\x85 ejecutado\x87 por tu crimen de guerra.",
		"\x87Oh no! Mataste a un\x84 Comisario\x87!!! Has sido\x85 ejecutado\x87 por eso.",
		"\x87Mataste a un jugador\x83 Civil\x87 como tu! Has sido\x85 ejecutado\x87 por tu crimen.",
		"\x87Oh no! Mataste a un \x82Heroe\x87! Has sido\x85 ejecutado\x87 por eso."
	},
	["CHAT_INNOHURT"] = {
		"El\x84 Comisario\x80 mato un\x83 Civil\x80! Alguien mas deberia terminar el trabajo!",
		"Por matar al\x83 Civil\x80, el \x82Heroe\x80 se volvio el \x85villano\x80 y pago el precio."
	},
	["CHAT_ONEQUIT"] = {
		"Uno de los\x85 Asesinos\x80 se fue!",
		"Uno de los\x84 Comisarios\x80 se fue!!!",
		"Uno de los \x82Heroes\x80 se fue!"
	},
	["CHAT_LASTQUIT"] = {
		"El ultimo\x85 Asesino\x80 se fue!",
		"El ultimo\x84 Comisario\x80 se fue!",
		"El ultimo \x82Heroe\x80 abandono a todos!"
	},
	["CHAT_REPLACEQUIT"] = {
		"El\x85 Asesino\x80 se fue! Un\x83 Civil\x80 al azar tomara su rol!",
		"El\x84 Comisario\x80 se fue! Un\x83 Civil\x80 al azar tomara su rol!",
		"Un \x82Heroe\x80 se fue! Un\x83 Civil\x80 al azar tomara su rol!"
	},
	["CHAT_ENDROUND"] = {
		"Todos murieron. Los\x85 Asesinos\x80 ganan!",
		"Todos los\x85 Asesinos\x80 fueron asesinados! Los\x83 Civiles\x80 ganan!",
		"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 asesino al ultimo Civil! Que verguenza de\x84 Comisario\x80...",
		"Los\x85 Asesinos\x80 ganan porque el \x82Heroe\x80 decidio matar al ultimo Civil. Que \x82Heroe\x80 mas vergonzoso...",
		"Los defensores de los\x83 Civiles\x80 murieron. Los\x85 Asesinos\x80 ganan!"
	},
	["BMP_VICTIMS"] = {data={
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\31\xFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFIII\x1F1F\x1F1F",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFF\xFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFF\xFFFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFF\xFFFF\xFFIII\31",
		"IIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\31",
		"\x1FIIII\x1FFF\xFFFFII\x1FFF\xFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFF1FII\x1FFF\xFFFF\xFFII\x1FFF\xFF1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFF\x1FIIII\31",
		"\xFFFF\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\31",
	}},
	["BMP_SUSPECTS"] = {data={
		"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\31",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\x1F1FII\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFIII\x1F1F\31",
		"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFF\x1FIII\31",
		"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFF\xFFII\x1FFF\xFFFF\xFFFFIII\31",
		"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIIII\31",
		"\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\x1FIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\x1FIIII\31",
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\31",
	}},
	["BMP_TIME"] = {data={
		"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFFFII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\31",
		"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFII\31",
		"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFFIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1F1F",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F"
	}},
	["BMP_RINGS"] = {data={
		"\xFFIIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\31",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFIII\xFFFF\xFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\31",
		"\xFFIIIII\x1F1F\xFFFFII\x1FFF\xFFIIIII\xFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFIII\31",
		"IIIII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIIIII\x1FFFII\x1FIII\x1FFF\xFFFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1F1FIIII\x1FFFII\x1FIII\x1FFF\xFFFF\xFFIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFF1FII\x1FFFIIIIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F1F",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\31"
	}},
	["HUD_MM"] = "Murder Mystery",
	["HUD_SUSPECTS"] = "Sospechosos",
	["HUD_VICTIMS"] = "Victimas",
	["HUD_TEAMMATES"] = "Aliados",
	["HUD_ROLES"] = {
		"ASESINO",
		"COMISARIO",
		"CIVIL",
		"HEROE",
		"MUERTO"
	},
	["HUD_KILLEDBY"] = {
		"Asesinado por",
		"la justicia",
		"el diseño del mapa"
	},
	["HUD_SCORESTAB"] = {
		"Si eres nuevo en esto, usa el comando",
		"^7MMHELP^0 en la consola para tener ayuda y",
		"^7MMLANG^0 para cambiar tu idioma.",
		"",
		"",
		"^2".."Diviertete!"
	},
	["HUD_ROLETARGET"] = {
		"Mezclate con los demas, ganate su\nconfianza, y ataca.",
		"Encuentra y elimina a los Asesinos.\nNo mates a los civiles!",
		"Escondete y protegete. Ayuda con \nla investigacion si puedes.",
		"Tienes una oportunidad de detener a los\nAsesinos. Ve y salva el dia, pero ten cuidado!"
	},
	["HUD_ROLESALIVE"] = {
		"Asesinos",
		"Comisarios",
		"Civiles"
	},
	["HUD_DEAD"] = {
		"Estas ^Fmuerto.",
		"No puedes reaparecer o",
		"hablarle a los vivos."
	},
	["HUD_MIDJOIN"] = {
		"Te uniste en ^7plena partida^0, por favor, espera a que esta ronda termine.",
		"Mientras esperas, por favor lee las reglas del juego con el comando ^7MMHELP^0 en la consola!"
	},
	["HUD_ALONE"] = {
		"^4".."2 jugadores^0 son requeridos para jugar,",
		"Por favor espera a ^4uno mas^0 para iniciar."
	},
	["HUD_SNEAKING"] = "Agachado...",
	["HUD_SHOWDOWN"] = "Duelo de Enfrentamiento!",
	["HUD_MINIGAME"] = {
		["PRESS"] = "Presiona^2 CUSTOM3^0 para",
		["LEAVE"] = "abandonar",
		["CANCEL"] = "cancelar",
		["SPECTATE"] = "espectar",
		["DUEL"] = "un minjuego de duelo",
		["REQUEST"] = "solicita un minijuego de ^7PONG^0 !",
		["START"] = "inicia un minijuego de ^7\"SONIC RUN\"^0 !",
		["ACCEPT"] = "aceptar el reto de ^7PONG^0!",
		["WAIT"] = "Esperando a que el rival acepte...",
		["SPECTATING"] = "Espectando un duelo...",
		["BORED"] = "Estas aburrido?",
		["GOAL"]="Ganaste!"
	},
	["HUD_YOU"] = "TU",
	["HUD_WINNERS"] = "Ganadores:",
	["HUD_WIN"] = {
		"EMPATE!",
		"^5".."ASESINOS",
		"^3".."CIVILES"
	},
	["HUD_PAST"] = "PASADO",
	["HUD_FUTURE"] = "FUTURO",
	["HUD_MMHELP_UI"] = {
		"Usa ^7JUMP^0/^7SPIN^0 para desplazarte, ^7Next^0/^7Prev Weapon^0 para pasar de pagina",
		"Presiona^7 CUSTOM1^0 para salir del menu de AYUDA"
	},
	["HUD_MMHELP"] = {
		{
			"^7".."Bienvenido a ^5Murder Mystery^7!",
			"^7La interpretacion en SRB2 del juego multijugador popular!\n",
			"El objetivo del juego es encontrar y eliminar todos los^5 Asesinos^0 antes de que maten a ^3todos los demas^0. Este modo de juego es similar a MATCH, asi que necesitaras habilidad precisa para apuntar y disparar para ganar!",
			"\nPrimero, cubramos lo basico para que puedas empezar a jugar...",
			"\nAl inicio de cada ronda, se te asignara un ^Brol^0, que determina tu tarea durante la partida. Aqui estan todos los posibles ^Broles^0 que puedes recibir:",
			" *^5 Asesino^0 - Un criminal mortal. Su trabajo es eliminar a todos.",
			" * ^4Sheriff^0 - Asignado con encontrar y eliminar al/los^5 Asesino(s)^0.",
			" *^3 Civil^0 - Debe evitar morir y asistir identificando al^5 Asesino^0. Dependiendo de como este configurado el juego, pueden obtener un^5 Anillo Rojo^0 para defenderse recolectando 100 anillos (o 50 para ciertos personajes).",
			"\nEsa es toda la informacion esencial que necesitas para empezar a jugar. Para mas detalles, lee este manual hasta el final",
			"\nUsa el comando ^7MMLANG^0 para cambiar el idioma de la interfaz y de este manual a tu idioma preferido."
		},
		{
			"^7".."Sobre situaciones de gameplay^0\n",
			"Como se menciono en lo basico, el objetivo del juego es eliminar a todos los^5 Asesinos^0, pero escenarios diferentes pueden ocurrir en el juego:",
			"\n* Si mueres, entraras en el estado de^F Muerto.^0 Los jugadores en este estado no pueden reaparecer o comunicarse globalmente con jugadores que siguen vivos. Sus mensajes solo seran visibles para otros jugadores^F Muertos.",
			"No puedes chatear o enviar Mensajes Privados a jugadores vivos si estas^F Muertos^0.",
			"Morir por peligros del mapa como aplastadores, caer al vacio, o ahogarte bajo el agua tambien te haran un^F Muerto^0 por el resto de la ronda.",
			"Tambien,^2 NO INTENTES RENOMBRARTE SI ESTAS^F MUERTOS^0. Mas detalles en la siguiente pagina.",
			"\n* El trabajo del^4 Comisario^0 es eliminar a todos los^5 Asesinos^0, pero ten cuidado de no disparar a un^3 Civil^0 por accidente.",
			"Si un jugador^4 Comisario^0 dispara a un^3 Civil^0, ese jugador perdera su ^Brol^0 y se volvera^3 Civil^0 como castigo. Otro^3 Civil^0 elegido al azar tomara el ^Brol^0 del^4 Comisario^0. Piensa antes de tirar del gatillo!",
			"\n* Si un^5 Asesino^0 mata a un^4 Comisario^0 mientras todavia quedan^3 Civiles^0 vivos, la^4 Esmeralda del Comisario^0 caera cerca del cadaver.",
			"Cuando un^3 Civil^0 toma la^4 Esmeralda del Comisario^0, se convertira en ^2Heroe^0. Los ^2Heroes^0 son similares a los^4 Comisarios^0 pero con algunas diferencias:",
			"  - Si un ^2Heroe^0 mata a un^3 Civil^0, ambos moriran, y su ^Brol^0 no sera reasignado;",
			"  - ^2Los Heroes^0 no sueltan la^4 Esmeralda del Comisario^0 al morir.",
			"\n* En rondas con una cantidad de jugadores alta, pueden haber multiples^5 Asesinos^0 y^4 Comisarios^0.^A Equipos^0 de^5 Asesinos^0 y^4 Comisarios^0 se forman para aquellas rondas.",
			"^ALos Aliados^0 se pueden comunicar usando el comando ^7SAYTEAM^0 en la consola (el boton de SAYTEAM funciona igual que el boton de chat normal) o iniciando un mensaje con el simbolo ^8%^0, que envia tu mensaje automaticamente a tu equipo.",
			"Si atacas accidentalmente a tu^A aliado^0, ambos recibiran una alerta personalizada. Ten cuidado - estas interacciones pueden revelarle tu ^Brol\a los demas!"
		},
		{
			"^7".."Cosas que se deben evitar en ^5Murder Mystery^0\n",
			"Regla No. 1: ^2Se amable y divertete!^0 Aqui hay algunas reglas adicionales:",
			"\n* No filtres tu ^BRol^0, ni siquiera de broma. Puedes revelar el de alguien mas si estas seguro, pero nunca reveles el tuyo.",
			"\n* Evita insultar a otros jugadores. Esta bien bromear amistosamente, pero acusar constantemente o comportarte hostilmente hara que otros no confien en ti.",
			"\n* No te pongas AFK (Away From Keyboard). Si te quedas quieto por mucho tiempo, una bomba caera sobre ti, y seras removido de la partida.",
			"\n* No te renombres en medio de una ronda si estas ^FMuerto^0. Si lo haces, seras expulsado del servidor. Si estas^FMuerto^0, espera hasta la intermision para poder renombrarte de manera segura.",
			"\n* Evita campear alrededor de ^4La Esmeralda del Comisario^0 si eres un^5 Asesino^0. Pararte cerca a la esmeralda por 30 segundos resultara en tu expulsion del juego.",
			"\nRomper estas reglas resultara en una expulsion o, en casos severos, un ban por el Admin. Juega justamente y divertete!"
		},
		{
			"^7".."Consejos ultiles^0\n",
			"Aqui hay unos consejos que te serviran para ^5Murder Mystery^0:",
			"\n* Si las habilidades estan desactivadas por el admin, presiona ^7SPIN^0 para agacharte silenciosamente sin dejar rastros o hacer ruido.",
			"\n* Al tomar la^4 Esmeralda del Comisario^0, ganaras acceso to a todos los anillos y armas que recolectaste previamente.",
			"\n* Usa el comando ^7SAYTEAM^0 para coordinarte con tus^A aliados^0 y evitar fuego aliado. Empezando el mensaje con ^8%^0 automaticamente lo enviara a tus aliados.",
			"\n* Recibe dano de peligros como lava, pinchos, o fuego para obtener invencibilidad por 3 segundos.",
			"\n* Encuentra escondites en el mapa para evitar ser detectado. Aveces lo mejor es no estar a la vista.",
			"\n* Si tu rol es filtrado, renombrate y/o cambia tu color. ^2Ten en cuenta que tu renombre aparecera en el chat.^0",
			"\n* Usa el boton^7 FIRENORMAL^0 para sacar tu^6 Cuchillo^0 donde sea, mientras tengas anillos. Usar un^6 Cuchillo^0 mientras estas agachado asegura que tu ataque sea silencioso.",
			"\n* Usa el comando ^7MMLANG^0 para cambiar el idioma de tu interfaz a tu idioma preferido."
		}
	}
})
