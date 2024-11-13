-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- SPANISH
-- Made by Jesus.B

MM.AddLang("ES", {
    ["VERSION"]="1.0-ALPHA",
	["AUTHOR"]="Jesus.B",
	["MM"]="Murder Mystery",
	["CHARSET"]="1250C", --Windows1250
	["MMHELP_CMD"]={
		"Usa \23JUMP\16/\23SPIN\16 para desplazarte, \23Next\16/\23Prev Weapon\16 para cambiar de pagina",
		"Presiona \23FIRE\16 para abandonar AYUDA"
	},
    ["MMHELP"]={
		{
			"\23Bienvenido a Murder Mystery!",
			"\23La interpretacion en SRB2 del \23juego \23multijugador \23popular!\16\n",
			"El objetivo del juego es encontrar y eliminar a todos los \21Asesinos\16 antes de que maten a\19 todos los demas\16. Este modo de juego es mas como MATCH asi que nesecitaras tus habilidades de apuntar y disparar para este modo de juego.",
			"Nesecitaras aprender unas cosas basicas primero antes de empezar a jugar...",
			"\nAl inicio de cada ronda, conseguiras un \27Rol\16 que define cual sera tu tarea en la partida. Aqui estan los 3 posibles \27Roles\16 que puedes conseguir:",
			" * \21Asesino\16 - Un verdadero criminal. Tiene que matar a todos, pero solo esta equipado con cuchillos y anillos rojos;",
			" * \20Comisario\16  - Su tarea es encontrar y eliminar a el/los \21Asesinos(s)\16. Los Comisarios pueden usar cualquier Anillo Arma que se encuentre en el mapa;",
			" * \19Inocente\16 - Un civil completamente desarmado, deben evitar ser asesinados pero tambien deben ayudar a encontrar al \21Asesino\16.",
			"\nEsa es toda la informacion basica requerida para empezar a jugar, para mas informacion, lee este manual hasta el final."
		},
        {
			"\23Sobre situaciones de gameplay\16\n",
			"Como se explico anteriormente en lo basico, el objetivo de los Comisarios es eliminar a todos los \21Asesinos\16, pero situaciones diferentes en el gameplay pueden ocurrir:",
			"\n* Si te matan, entraras en el estado de\31 Muerto\16 los Jugadores en este estado no pueden reaparecer o hablarles globalmente a los jugadores que esten vivos, sus mensajes solo seran visibles para otros jugadores\x8F Muertos\x80",
			"No puedes enviar mensajes/PM players a jugadores vivos mientras estas\31 Muerto\16.",
			"Por cierto,\18 NO \2INTENTES \2CAMBIAR \2TU \2NOMBRE\16, mas detalles sobre esto en la siguiente pagina.",
			"\n* La tarea del \20Comisario\16 es eliminar a todos los \21Asesinos\16 alrededor, pero puede disparar un \19Inocente\16 por accidente.",
			"Si esto ocurre, el \20Comisario\16 se convertira en un \19Inocente\16 y un \19Inocente\16 aleatorio va a tomar su rol silenciosamente. La proxima vez que quieras disparar a alguien como \20Comisario\16 , ¡piensa 2 veces antes de jalar el gatillo!",
			"\n* Cuando un \21Asesino\16 mata a un \20Comisario\16 y todavia hay \19Inocentes\16 vivos, el Comisario dejara caer la \20Esmeralda del Comisario\16 cerca de su cadaver.",
			"A diferencia de las 7 Esmeraldas del Caos, esta esmeralda asignara el rol de \2Heroe\16 a cualquier \19Inocente\16 que la recoja. Si eres uno de los \19Inocentes\16, es tu oportunidad de ser un Heroe y salvar a todos de el (o los) \21Asesino(s)\16!",
			"El rol de \2Heroe\16 no se diferencia de el de \20Comisario\16 excepto por algunos detalles, si el \2Heroe\16 mata a un \19Inocente\16 su rol no se comparte y ambos mueren. Un Heroe no dejara caer una \20Esmeralda del \20Comisario\16 al morir.",
			"\n* Dependiendo de la cantidad de jugadores, puede haber mas de un \21Asesino\16 y \20Comisario\16 entre los jugadores en la ronda. Por ejemplo, empezado a partir de 7 jugadores o mas, \27Equipos\16 de \21Asesinos\16 y \20Comisarios\16 se formaran.",
			"Los \27Aliados\16 pueden chatear entre si en su chat de equipo con el comando de consola \23SAYTEAM\16 (nota que el boton de chat SAYTEAM funcionara como el chat normal).",
			"Si un \27aliado\16 golpea a otro, ambos tendran una alerta personalizada que hara que se reconozcan. ¡Recuerda que otros pueden ver su interaccion 'amistosas' y ver quien eres!"
		},
        {
			"\23Cosas malas para \23hacer \23en \23Murder \23Mystery\16\n",
			"La regla No.1 de cada juego: \1Se \1amable \1y \1diviertete!\16 Ademas de eso...\n",
			"* Filtrar tu \27Rol\16 no hara el juego un \'Misterio\' (incluso si bromeas), puedes decir el rol de alguien mas si estas seguro, pero no digas el tuyo.\n",
			"* No insultes otros jugadores, las bromas estan permitidas, pero solo en un modo amigable. Nadie confiara en ti si acusas a cualquier jugador sin razon.\n",
			"* Estar AFK es un crimen de guerra. Te tiraran bombas y tu existencia cesara si te quedas quieto por mucho tiempo.\n",
			"* No te renombres durante una partida si estas muerto, hacer esto te expulsara del servidor. Puedes renombrarte si estas vivo. Solo espera la intermision para renombrarte de manera segura.\n",
			"Romper una de estas reglas resulta en una expulsion o algunas veces, un ban por el Admin! Porfavor no las rompas y juega limpiamente."
		},
        {
			"\23Consejos utiles\16\n",
			"Hemos collecionado algunos consejos que te pueden ayudar en tus partidas de MM:",
			"\n* Si las habilidades de los personajes estan deshabilitadas por el admin, presiona \2SPIN\16 para escabullirte silenciosamente sin dejar rastro o hacer ruido;",
			"\n* Cuando agarras la \20Esmeralda del \20Comisario\16, tendras acceso a todas las armas que recolectaste de antemano;",
			"\n* Averiguar quien es tu \27aliado\16 usando el comando \23SAYTEAM\16 te ayudaria a evitar que les dispares por accidente y que no se revele tu rol;",
			"\n* Puedes lastimarte con obstaculos como lava, pinchos, fuego para tener invencibilidad por 3 segundos;",
			"\n* Intenta encontrar un escondite en el mapa. Aveces te ayuda a deshacerte de la publicidad no deseada;",
			"\n* Si se filtra tu rol, puedes renombrarte y/o cambiar tu skincolor. \1Ten \1en \1cuenta \1que \1tu \1renombre \1se \1mostrara \1en \1el \1chat\16;",
			"\n* El boton\18 FIRENORMAL\16 te permite usar el Cuchillo donde sea siempre que tengas anillos (Los inocentes no tienen un Cuchillo). Y tambien, un Cuchillo no produce un sonido de ataque si estas escabullendote."
		}
	},
    ["MMLANG"]={
		"El idioma que actualmente estas usando es\x82 Espanol\x80\nPuedes cambiarlo con \x87MMLANG [idioma]",
		"El idioma personal para Murder Mystery ha sido cambiado a\x82 Espanol"
	},
    ["ROLE_GET"]={
		"Eres el\x85 Asesino\x80! \x85Mata a todos!",
		"Eres el\x84 Comisario\x80!\x84 Elimina a todos los Asesinos\x80. If you kill an innocent, you'll be stripped of your role.",
		"Eres un \x83Inocente\x80! Escondete y ayuda con la investigacion."
	},
    ["NEWROLE_GET"]={
		"\x87La vida decidio al azar que seras un\x85 Asesino\x87.\x85 Ahora ve y matalos a todos!",
		"\x87".."El universo te hizo un\x84 Comisario\x87! Ve y\x84 elimina a todos los Asesinos\x87!",
		"\x87Se ha decidido que seras un \x82Heroe\x87. Salva a todos de los Asesinos!"
	},
    ["TEAMMATE_HIT"]={
		"Este jugador es uno de tus aliados. Porfavor no golpees a tus aliados la proxima.",
		"Te golpeo uno de tus aliados. No te vengues de el."
	},
    ["MURD_KILLED"]={
		"El\x85 Asesino\x87",
		"\x80".."fue eliminado!"
	},
    ["SHERI_KILLED"]={
		"El\x84 Comisario\x87",
		"\x80".."fue asesinado!",
		"Encuentra su\x84 Esmeralda\x80!"
	},
    ["HERO_KILLED"]={
		"El \x82Heroe\x87",
		"\x80".."fue asesinado!"
	},
    ["DIED_HAZARD"]="ha muerto en un accidente",
	["SHREMD_PICK"]="Alguien ha tomado la\x84 Esmeralda del Comisario\x80...",
	["KILL_PUNISHMENT_PM"]={
		"\x87Has matado a un \x83Inocente\x87! Has sido despedido!. (Ya no eres un Comisario)",
		"Los \x82Heroes\x87 no estan hechos para matar \x83Inocentes\x87. Conseguiste la penalizacion de muerte por eso."
	},
    ["INNO_HURT"]={
		"The \x84Sheriff\x80 murdered an \x83Innocent\x80! Someone else should finish the job!",
		"El \x82Heroe\x80 es un pendejo, ha matado a un \x83Inocente\x80. Ahora ambos estan muertos en el suelo. Que verguenza \x82Pendejo\x80"
	},
    ["ONE_LEFT"]={
		"Uno de los\x85 Asesinos\x80 se fue!",
		"Uno de los\x84 Comisarios\x80 se fue!!!",
		"Uno de los \x82Heroes\x80 nos ha abandonado!"
	},
    ["LAST_LEFT"]={
		"El ultimo\x85 Asesino\x80 se fue!",
		"El ultimo\x84 Comisario\x80 se fue!",
		"El ultimo \x82Heroe\x80 se fue!"
	},
    ["REPLACE_LEFT"]={
		"El\x85 Asesino\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!",
		"El\x84 Comisario\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!",
		"Un \x82Heroe\x80 se fue! Algun \x83Inocente\x80 al azar tomara su rol!"
	},
    ["ENDROUND"]={
		"Todos estan muertos. Los\x85 Asesinos\x80 ganan!",
		"Todos los\x85 Asesinos\x80 fueron asesinados! Los\x83 Civiles\x80 ganan!",
		"Los\x85 Asesinos\x80 ganan porque el\x84 Comisario\x80 asesino al ultimo Inocente! Que verguenza,\x84 Comisario\x80",
		"El \x82Heroe\x80 eligio matar al ultimo Inocente. Los\x85 Asesinos\x80 ganan!",
		"Los defensores de los\x83 Inocentes\x80 estan muertos. Los\x85 Asesinos\x80 ganan!"
	},
    ["BMP_VICTIMS"]={
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFFF\xFFIII\x1FFF\xFFFFIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIII\xFFIIII\x1FFF\xFFII\x1FII\x1FFF\xFFIII\x1F1F\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFIIIIIIIII\x1FFF\xFFII\x1FII\x1FFF\xFFFFIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FIII\x1FII\x1FFF\xFFII\x1F1FII\x1FFF\xFFFFIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F1FI\x1FFFII\x1FFF\xFFIIIIII\x1FFF\xFFFF\xFFIII\x1F",
		"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIIII\x1FFFII\x1FFFII\x1F",
		"\xFFIIII\x1FFF\xFFII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1F",
		"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\x1FFF\xFFFF\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIII\x1F",
		"\xFFFF\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F"
	},
    ["BMP_SUSPECTS"]={
		"\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
		"\xFFFFIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFIIIIII\x1FFFIIIII\x1FFF\xFFII\x1FFF\x1F1F\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1F",
		"\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1F",
		"\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1F",
		"\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
	},
    ["BMP_TIME"]={
		"IIIIII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIII\x1FFF\xFFFFIIII\x1F",
		"IIIIII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFFFII\x1F1F\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"\xFFFFII\x1FFF\xFFFFII\x1FFFIIIII\x1FFF\xFFIIIIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"\xFFII\x1FFF\xFFFFII\x1FFFIIIII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1F",
		"\xFFII\x1FFF\xFFFFII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1FFFII\x1F",
		"\xFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1F",
		"\xFFII\x1FFF\xFFFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1F",
		"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFF1F\x1F1F\x1F"
	},
    ["BMP_RINGS"]={
		"\xFFFF\xFFFFIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
		"\xFFFF\xFFIIII\x1FFF\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFFF\xFFIIII\x1FFF\xFFIII\xFFFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1F1FII\x1FFFII\x1F1FII\x1F",
		"\xFFFFII\x1FII\x1FFF\xFFIIII\xFFFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIII\x1F1F\x1F",
		"\xFFFFII\x1FII\x1FFF\xFFIIIII\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1FIIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIII\x1F",
		"\xFFIIIIII\x1FFFII\x1F1FIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1F",
		"IIIIIII\x1FFFII\x1FFF\x1FIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1F",
		"III\x1FFFII\x1FFFII\x1FFF\xFF1FII\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"II\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1F",
		"\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1F"
	},
    ["HUD_ROLES"]={
		"ASESINO",
		"COMISARIO",
		"INOCENTE",
		"HEROE",
		"MUERTO"
	},
    ["HUD_TEAMMATES"]="Aliados",
	["HUD_KILLBY"]="Asesinado por",
	["HUD_STUPID"]="tu estupidez",
	["HUD_SCORESTAB"]={
		"Si eres nuevo al modo de juego, usa el",
		"comando \23MMHELP\16 en la Consola para ayuda y",
		"\23MMLANG\16 para cambiar tu idioma aqui",
		"",
		"",
		"\2Diviertete!"
	},
    ["HUD_ROLESALIVE"]={
		"Asesinos",
		"Comisarios",
		"Inocentes"
	},
    ["HUD_DEAD"]={
		"Estas\31 muerto",
		"No puedes reaparecer o hablarle a",
		"gente que no esta muerta."
	},
    ["HUD_MIDJOIN"]={
		"Te has unido \20en medio de una partida\16, porfavor espera que se acabe esta ronda",
		"Mientras esperas, porfavor lee las reglas del juego en el comando de la consola \23MMHELP\16"
	},
    ["HUD_ALONE"]={
		"\20".."2 jugadores\16 son requeridos para la partida,",
		"Porfavor espera \20un jugador mas\16 para empezar"
	},
    ["HUD_SNEAKING"]="Escabullendote...",
	["HUD_SHOWDOWN"]="Duelo de enfrentamiento!",
	["HUD_MINIGAME"]={
		["PRESS"]="Presiona\18 CUSTOM3\16 para",
		["LEAVE"]="abandonar",
		["CANCEL"]="cancelar",
		["SPECTATE"]="espectar",
		["DUEL"]="un minijuego de duelo",
		["REQUEST"]="pide una partida de \23PONG",
		["START"]="empieza una partida de \23\"SONIC RUN\"",
		["ACCEPT"]="acepta el reto de \23PONG\16!",
		["WAIT"]="Esperando a que el rival acepte...",
		["SPECTATING"]="Espectando un duelo...",
		["BORED"]="Aburrido?",
		["PONGBALL"]="Los espectadores pueden cambiar la direccion de la pelota"
	},
    ["HUD_YOU"]="TU",
	["HUD_WINNERS"]="Ganadores:",
	["HUD_WON"]="ganaron!",
	["HUD_WINS"]="Ganan",
	["HUD_WIN"]={
		"EMPATE!",
		"\21ASESINOS",
		"\19CIVILES"
	},
    ["HUD_PAST"]="PASADO",
	["HUD_FUTURE"]="FUTURO"
})