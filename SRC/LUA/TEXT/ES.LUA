-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- SPANISH
-- Made by Jesus.B

MM.AddLang("ES", {
	["VERSION"] = "1.3",
	["AUTHOR"] = "Jesus.B",
	["CHAT_MMLANG"] = {
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
		"\1\x87MMHELP\4 en la consola para tener ayuda y",
		"\1\x87MMLANG\4 para cambiar tu idioma.",
		"",
		"",
		"\1\x82".."Diviertete!"
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
		"Estas \1\x8Fmuerto.",
		"No puedes reaparecer o",
		"hablarle a los vivos."
	},
	["HUD_MIDJOIN"] = {
		"Te uniste en \1\x87plena partida\4, por favor, espera a que esta ronda termine.",
		"Mientras esperas, por favor lee las reglas del juego con el comando \1\x87MMHELP\4 en la consola!"
	},
	["HUD_ALONE"] = {
		"\1\x84".."2 jugadores\4 son requeridos para jugar,",
		"Por favor espera a \1\x84uno mas\4 para iniciar."
	},
	["HUD_SNEAKING"] = "Agachado...",
	["HUD_SHOWDOWN"] = "Duelo de Enfrentamiento!",
	["HUD_MINIGAME"] = {
		["PRESS"] = "Presiona\1\x82 CUSTOM3\4 para",
		["LEAVE"] = "abandonar",
		["CANCEL"] = "cancelar",
		["SPECTATE"] = "espectar",
		["DUEL"] = "un minjuego de duelo",
		["REQUEST"] = "solicita un minijuego de \1\x87PONG\4 !",
		["START"] = "inicia un minijuego de \1\x87\"SONIC RUN\"\4 !",
		["ACCEPT"] = "aceptar el reto de \1\x87PONG\4!",
		["WAIT"] = "Esperando a que el rival acepte...",
		["SPECTATING"] = "Espectando un duelo...",
		["BORED"] = "Estas aburrido?",
		["GOAL"]="Ganaste!"
	},
	["HUD_YOU"] = "TU",
	["HUD_WINNERS"] = "Ganadores:",
	["HUD_WIN"] = {
		"EMPATE!",
		"\1\x85".."ASESINOS",
		"\1\x83".."CIVILES"
	},
	["HUD_PAST"] = "PASADO",
	["HUD_FUTURE"] = "FUTURO",
	["HUD_MMHELP_UI"] = {
		"Usa \1\x87JUMP\4/\1\x87SPIN\4 para desplazarte, \1\x87Next\4/\1\x87Prev Weapon\4 para pasar de pagina",
		"Presiona\1\x87 CUSTOM1\4 para salir del menu de AYUDA"
	},
	["HUD_MMHELP"] = {
		{
			"\1\x87".."Bienvenido a \1\x85Murder Mystery\1\x87!",
			"\1\x87La interpretacion en SRB2 del juego multijugador popular!\n",
			"El objetivo del juego es encontrar y eliminar todos los\1\x85 Asesinos\4 antes de que maten a \1\x83todos los demas\4. Este modo de juego es similar a MATCH, asi que necesitaras habilidad precisa para apuntar y disparar para ganar!",
			"\nPrimero, cubramos lo basico para que puedas empezar a jugar...",
			"\nAl inicio de cada ronda, se te asignara un \1\x8Brol\4, que determina tu tarea durante la partida. Aqui estan todos los posibles \1\x8Broles\4 que puedes recibir:",
			" *\1\x85 Asesino\4 - Un criminal mortal. Su trabajo es eliminar a todos.",
			" * \1\x84Sheriff\4 - Asignado con encontrar y eliminar al/los\1\x85 Asesino(s)\4.",
			" *\1\x83 Civil\4 - Debe evitar morir y asistir identificando al\1\x85 Asesino\4. Dependiendo de como este configurado el juego, pueden obtener un\1\x85 Anillo Rojo\4 para defenderse recolectando 100 anillos (o 50 para ciertos personajes).",
			"\nEsa es toda la informacion esencial que necesitas para empezar a jugar. Para mas detalles, lee este manual hasta el final",
			"\nUsa el comando \1\x87MMLANG\4 para cambiar el idioma de la interfaz y de este manual a tu idioma preferido."
		},
		{
			"\1\x87".."Sobre situaciones de gameplay\4\n",
			"Como se menciono en lo basico, el objetivo del juego es eliminar a todos los\1\x85 Asesinos\4, pero escenarios diferentes pueden ocurrir en el juego:",
			"\n* Si mueres, entraras en el estado de\1\x8F Muerto.\4 Los jugadores en este estado no pueden reaparecer o comunicarse globalmente con jugadores que siguen vivos. Sus mensajes solo seran visibles para otros jugadores\1\x8F Muertos.",
			"No puedes chatear o enviar Mensajes Privados a jugadores vivos si estas\1\x8F Muertos\4.",
			"Morir por peligros del mapa como aplastadores, caer al vacio, o ahogarte bajo el agua tambien te haran un\1\x8F Muerto\4 por el resto de la ronda.",
			"Tambien,\1\x82 NO INTENTES RENOMBRARTE SI ESTAS\1\x8F MUERTOS\4. Mas detalles en la siguiente pagina.",
			"\n* El trabajo del\1\x84 Comisario\4 es eliminar a todos los\1\x85 Asesinos\4, pero ten cuidado de no disparar a un\1\x83 Civil\4 por accidente.",
			"Si un jugador\1\x84 Comisario\4 dispara a un\1\x83 Civil\4, ese jugador perdera su \1\x8Brol\4 y se volvera\1\x83 Civil\4 como castigo. Otro\1\x83 Civil\4 elegido al azar tomara el \1\x8Brol\4 del\1\x84 Comisario\4. Piensa antes de tirar del gatillo!",
			"\n* Si un\1\x85 Asesino\4 mata a un\1\x84 Comisario\4 mientras todavia quedan\1\x83 Civiles\4 vivos, la\1\x84 Esmeralda del Comisario\4 caera cerca del cadaver.",
			"Cuando un\1\x83 Civil\4 toma la\1\x84 Esmeralda del Comisario\4, se convertira en \1\x82Heroe\4. Los \1\x82Heroes\4 son similares a los\1\x84 Comisarios\4 pero con algunas diferencias:",
			"  - Si un \1\x82Heroe\4 mata a un\1\x83 Civil\4, ambos moriran, y su \1\x8Brol\4 no sera reasignado;",
			"  - \1\x82Los Heroes\4 no sueltan la\1\x84 Esmeralda del Comisario\4 al morir.",
			"\n* En rondas con una cantidad de jugadores alta, pueden haber multiples\1\x85 Asesinos\4 y\1\x84 Comisarios\4.\1\x8A Equipos\4 de\1\x85 Asesinos\4 y\1\x84 Comisarios\4 se forman para aquellas rondas.",
			"\1\x8ALos Aliados\4 se pueden comunicar usando el comando \1\x87SAYTEAM\4 en la consola (el boton de SAYTEAM funciona igual que el boton de chat normal) o iniciando un mensaje con el simbolo \1\x88%\4, que envia tu mensaje automaticamente a tu equipo.",
			"Si atacas accidentalmente a tu\1\x8A aliado\4, ambos recibiran una alerta personalizada. Ten cuidado - estas interacciones pueden revelarle tu \1\x8Brol\a los demas!"
		},
		{
			"\1\x87".."Cosas que se deben evitar en \1\x85Murder Mystery\4\n",
			"Regla No. 1: \1\x82Se amable y divertete!\4 Aqui hay algunas reglas adicionales:",
			"\n* No filtres tu \1\x8BRol\4, ni siquiera de broma. Puedes revelar el de alguien mas si estas seguro, pero nunca reveles el tuyo.",
			"\n* Evita insultar a otros jugadores. Esta bien bromear amistosamente, pero acusar constantemente o comportarte hostilmente hara que otros no confien en ti.",
			"\n* No te pongas AFK (Away From Keyboard). Si te quedas quieto por mucho tiempo, una bomba caera sobre ti, y seras removido de la partida.",
			"\n* No te renombres en medio de una ronda si estas \1\x8FMuerto\4. Si lo haces, seras expulsado del servidor. Si estas\1\x8FMuerto\4, espera hasta la intermision para poder renombrarte de manera segura.",
			"\n* Evita campear alrededor de \1\x84La Esmeralda del Comisario\4 si eres un\1\x85 Asesino\4. Pararte cerca a la esmeralda por 30 segundos resultara en tu expulsion del juego.",
			"\nRomper estas reglas resultara en una expulsion o, en casos severos, un ban por el Admin. Juega justamente y divertete!"
		},
		{
			"\1\x87".."Consejos ultiles\4\n",
			"Aqui hay unos consejos que te serviran para \1\x85Murder Mystery\4:",
			"\n* Si las habilidades estan desactivadas por el admin, presiona \1\x87SPIN\4 para agacharte silenciosamente sin dejar rastros o hacer ruido.",
			"\n* Al tomar la\1\x84 Esmeralda del Comisario\4, ganaras acceso to a todos los anillos y armas que recolectaste previamente.",
			"\n* Usa el comando \1\x87SAYTEAM\4 para coordinarte con tus\1\x8A aliados\4 y evitar fuego aliado. Empezando el mensaje con \1\x88%\4 automaticamente lo enviara a tus aliados.",
			"\n* Recibe dano de peligros como lava, pinchos, o fuego para obtener invencibilidad por 3 segundos.",
			"\n* Encuentra escondites en el mapa para evitar ser detectado. Aveces lo mejor es no estar a la vista.",
			"\n* Si tu rol es filtrado, renombrate y/o cambia tu color. \1\x82Ten en cuenta que tu renombre aparecera en el chat.\4",
			"\n* Usa el boton\1\x87 FIRENORMAL\4 para sacar tu\1\x86 Cuchillo\4 donde sea, mientras tengas anillos. Usar un\1\x86 Cuchillo\4 mientras estas agachado asegura que tu ataque sea silencioso.",
			"\n* Usa el comando \1\x87MMLANG\4 para cambiar el idioma de tu interfaz a tu idioma preferido."
		}
	}
})
