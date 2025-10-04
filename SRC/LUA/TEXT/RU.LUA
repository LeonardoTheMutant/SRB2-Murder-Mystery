-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- RUSSIAN
-- Made by Arnie37, Sonic1983 and LeonardoTheMutant

MM.AddLang("RU", {
	["VERSION"]="1.3",
	["AUTHOR"]="Arnie37, Sonic1983, LeonardoTheMutant",
	["KEYBOARD"] = {
		[1] = { --No modifier buttons
			[39] = "э",
			[44] = "б",
			[45] = "-",
			[46] = "ю",
			[47] = ".",
			[48] = "0",
			[49] = "1",
			[50] = "2",
			[51] = "3",
			[52] = "4",
			[53] = "5",
			[54] = "6",
			[55] = "7",
			[56] = "8",
			[57] = "9",
			[59] = "ж",
			[61] = "=",
			[91] = "х",
			[92] = "\\",
			[93] = "ъ",
			[96] = "ё",
			[97] = "ф",
			[98] = "и",
			[99] = "с",
			[100] = "в",
			[101] = "у",
			[102] = "а",
			[103] = "п",
			[104] = "р",
			[105] = "ш",
			[106] = "о",
			[107] = "л",
			[108] = "д",
			[109] = "ь",
			[110] = "т",
			[111] = "щ",
			[112] = "з",
			[113] = "й",
			[114] = "к",
			[115] = "ы",
			[116] = "е",
			[117] = "г",
			[118] = "м",
			[119] = "ц",
			[120] = "ч",
			[121] = "н",
			[122] = "я"
		},
		[2] = { --SHIFT
			[39] = "Э",
			[44] = "Б",
			[45] = "_",
			[46] = "Ю",
			[47] = ",",
			[48] = ")",
			[49] = "!",
			[50] = "\"",
			[51] = "#", --Should be № but algorithms fail to calculate that properly
			[52] = ";",
			[53] = "%",
			[54] = ":",
			[55] = "?",
			[56] = "*",
			[57] = "(",
			[59] = "Ж",
			[61] = "+",
			[91] = "Х",
			[92] = "/",
			[93] = "Ъ",
			[96] = "Ё",
			[97] = "Ф",
			[98] = "И",
			[99] = "С",
			[100] = "В",
			[101] = "У",
			[102] = "А",
			[103] = "П",
			[104] = "Р",
			[105] = "Ш",
			[106] = "О",
			[107] = "Л",
			[108] = "Д",
			[109] = "Ь",
			[110] = "Т",
			[111] = "Щ",
			[112] = "З",
			[113] = "Й",
			[114] = "К",
			[115] = "Ы",
			[116] = "Е",
			[117] = "Г",
			[118] = "М",
			[119] = "Ц",
			[120] = "Ч",
			[121] = "Н",
			[122] = "Я"
		}
	},
	["CON_MMLANG"]={
		"Seychas u Vas stoit\x82 russkiy\x80 yazyk.\nVy mozhete smenit' yazyk, propisav v konsol' \x87MMLANG [yazyk]",
		"Vash personalniy yazyk etogo moda izmenyon na\x82 russkiy"
	},
	["CHAT_ROLEGET_PM"]={
		"Вы ^5Убийца^0! ^5Убейте всех!",
		"Вы ^4Шериф^0! ^4Устраните всех Убийц^0. Если Вы убьете Мирного, с Вас снимут эту роль.",
		"Вы ^3Мирный^0! Прячтесь и помогайте в раследовании."
	},
	["CHAT_NEWROLEGET_PM"]={
		"^7Судьба даровала тебе роль ^5Убийцы^7.^5 Теперь иди, убивай!",
		"^7Тебе дана роль ^4Шерифа^7! Вперёд, ^4устраны убийц^7, пока не поздно!",
		"^7Ты был(-а) избран(-а) ^2Героем^7. Спаси же Мирных от Убийц!",
		"^7Ты устранил(-а) одного из ^5Убийтц^7! Тебя повысили до ^2Героя^7!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Это Ваш напарник. Не стреляйте по своим.",
		"Вас ударил ваш напарник. Не пытайтесь ему мстить."
	},
	["CHAT_MURDKILLED"]={
		"Убийца",
		"устранён!"
	},
	["CHAT_SHERIKILLED"]={
		"Шериф",
		"был убит!",
		"Найдите его/её ^4Изумруд^0!"
	},
	["CHAT_HEROKILLED"]={
		"Герой",
		"был убит!"
	},
	["CHAT_DIEDHAZARD"]="попал(а) туда, куда не следовало.",
	["CHAT_SHREMDPICKUP"]="Кто-то подобрал ^4Изумруд Шерифа^0...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"^7Ты убил(а) ^3Мирного^7! Ты больше не Шериф!",
		"^2Герои^7 не созданы, чтоб уюивать ^3Мирных^7. За это будет ответная смерть.",
		"^7О нет! Ты убил(-а) ^4Шерифа^7! За это будет ответная смерть..",
		"^7Ты убил(-а) такого же ^3Мирного^7 персонажа как и ты! За это будет ответная смерть.",
		"^7О нет! Ты убил(-а) ^2Героя^7! За это будет ответная смерть."
	},
	["CHAT_INNOHURT"]={
		"^4Шериф^0 убил ^3Мирного^0! Надо поручить это дело кому-то другому!",
		"^2Герой^0 жёстко тупанул и убил ^3Мирного^0. Сейчас они оба лежат мертвые. Вот же ^2некомпетентный^0..."
	},
	["CHAT_ONEQUIT"]={
		"Один из ^5Убийтц^0 покинул игру!",
		"Один из ^4Шерифов^0 вышел!!!",
		"Один из ^2Героев^0 предал нас (покинул игру)!"
	},
	["CHAT_LASTQUIT"]={
		"Последний из ^5Убийтц^0 покинул игру!",
		"Последний из ^4Шерифов^0 покинул игру!",
		"Последний из ^2Героев^0 покинул игру!"
	},
	["CHAT_REPLACEQUIT"]={
		"^5Убийца^0 покинул игру! Его роль возьмёт случайный ^3Мирный^0!",
		"^4Шериф^0 покинул игру! Его роль возьмёт случайный ^3Мирный^0!",
		"^2Герой^0 покинул игру! Его роль возьмёт случайный ^3Мирный^0!!"
	},
	["CHAT_ENDROUND"]={
		"Все мертвы. ^5Убийцы^0 победили!",
		"Всу ^5Убийцы^0 устранены! ^3Мирные^0 победили!",
		"^5Убийцы^0 одержали победу, поскольку ^4Шериф^0 убил последнего Мирного! Позор ^4Шерифу^0...",
		"^2Герой^0 убил последнего Мирного. ^5Убийцы^0 победили!",
		"Защитники ^3Мирных^0 убиты. ^5Убийцы^0 победили!"
	},
	["HUD_MM"]="Тайна Убийства",
	["HUD_ROLES"]={
		"УБИЙЦА",
		"ШЕРИФ",
		"МИРНЫЙ",
		"ГЕРОЙ",
		"МЕРТВЕЦ"
	},
	["HUD_SUSPECTS"]="Подозреваемые",
	["HUD_VICTIMS"]="Жертвы",
	["HUD_TEAMMATES"]="Напарники",
	["HUD_KILLEDBY"] = {
		"Вас убил(а)",
		"справедливость",
		"ловушка на уровне"
	},
	["HUD_SCORESTAB"]=
		"Если Вы новичок в этом режиме, пропишите в консоли команду ^7MMHELP^0 для ознакомления и ^7MMLANG^0 для смены языка мода\n\n^2Удачной Вам игры! ;)",
	["HUD_ROLETARGET"] = {
		"Убейте всех.",
		"Найдите и устраните всех Убийц. Не убивайте Мирных!",
		"Спрячьтесь и защитите себя. Помогите расследованию, когда это возможно.",
		"У вас есть шанс остановить всех Убийц. Идите и спасите положение! Будьте осторожны!"
	},
	["HUD_ROLESALIVE"]={
		"Убийц",
		"Шерифов",
		"Мирных"
	},
	["HUD_DEAD"]="Вы ^Fмертвы^0\nВы не можете возрождатся и писать тем, кто еще жив",
	["HUD_MIDJOIN"]="Вы присоединились на середине раунда. Пожалуйста, ^4дождитесь его окончания^0.\nПока Вы ждёте, просим прочесть правила игры, прописав в консоли команду ^7MMHELP^0",
	["HUD_ALONE"]="Для начала игры требуется минимум^4 2 игрока^0.\nПожалуйста, подождите ^4ещё одного игрока^0.",
	["HUD_SNEAKING"]="Подкрадывание...",
	["HUD_SHOWDOWN"]="Решающая дуель!",
	["HUD_MINIGAME"]={
		["PRESS"]="Нажмите^2 CUSTOM3^0, чтобы",
		["LEAVE"]="выйти",
		["CANCEL"]="отменить",
		["SPECTATE"]="наблюдать за",
		["DUEL"]="дуэлью в миниигре",
		["REQUEST"]="сыграть в ^7PONG",
		["START"]="запустить мини игру ^7SONIC RUN",
		["ACCEPT"]="принять вызов в ^7PONG^0!",
		["WAIT"]="Ожидание ответа опонента...",
		["SPECTATING"]="Наблюдение за дуэлью...",
		["BORED"]="Скучно?",
		["GOAL"]="Гол!"
	},
	["HUD_YOU"]="ВЫ",
	["HUD_WINNERS"]="Победители:",
	["HUD_WON"]="победил!",
	["HUD_WIN"]={
		"НИЧЬЯ!",
		"^5УБИЙЦИ",
		"^3ЦЫВИЛЬНЫЕ"
	},
	["HUD_PAST"]="ПРОШЛОЕ",
	["HUD_FUTURE"]="БУДУЩЕЕ",
	["HUD_MMHELP_UI"]={
		"^7UP^0/^7DOWN^0 - прокрутка страницы, ^7LEFT^0/^7RIGHT^0 - сменить страницу",
		"Любая из клавиш ^7CUSTOM^0 - покинуть это меню"
	},
	["HUD_MMHELP"]={
		{
			"^7Добро пожаловать в Тайну Убийства!",
			"Интерпретацию популярной игры в SRB2!^0\n",
			"Цель игры - найти и устранить всех ^5Убийц^0 до того, как они убьют ^3остальных^0. По управлению этот режим подобен режиму МАТЧ, так что здесь Вам будут нужны навыки стрельбы и попадания.",
			"Сначала, перед тем, как играть, давайте изучим парочку азов...",
			"\nВ самом начале каждого раунда Вам выпадет ^BРоль^0, определяющая Ваши задания во время игры. Вот все 3 возможные роли, которые можно получить на старте:",
			"* ^5Убийца^0 - преступник во плоти. Им нужно убить всех.",
			"* ^4Шериф^0 - местная полиция. Их задача заключается в нахождении и устранении всех ^5Убийц^0.",
			"* ^3Мирный^0 - безобидный игрок. Им нужно избегать гибели, но также, они могут помочь отыскать ^5Убийцу^0. Если ^3Мирные^0 соберут 100 или более колец, они могут подбирать Красные Кольца для самообороны (некоторым персонажам для таких целей требуется всего лишь 50 колец).",
			"\nЭто были все азы, нужные для понимания игры. Рекомендуем прочитать этут справку до конца для большего понимания игровых механик и много чего интересного."
		},
		{
			"^7Об игровых ситуациях и геймплее^0\n",
			"Как было рассказано ранее в азах, цель ^4Шерифов^0 - устранить всех ^5Убийц^0, но также могут быть возможными следующие ситуации:",
			"\n* Если в Вас попадет кольцо игрока, Вы станете ^FМертвецом^0. Такие игроки не могут возрождатся, а также писать приватно в чат тем, кто ещё живой. Их сообщения будут видны только таким же ^FМертвецам^0.",
			"Если Вы погибните из-за таких препятствий, как прессы, пропасти, а также, утонув в воде, Вы так же станете ^FМертвецом^0 до конца раунда.",
			"Вот ещё кое-что: ^2ДАЖЕ НЕ ПЫТАЙТЕСЬ СМЕНИТЬ СВОЁ ИМЯ ИГРОКА, ^2ПОКА ^2ВЫ ^FМЕРТЫ!^0 Подробнее об этом написано на следующей странице.",
			"\n* Задачи ^4Шерифа^0 - устранить всех ^5Убийц^0 вокруг, но они, также могут по случайности пристрелить ^3Мирного^0.",
			"Если такое произойдёт, ^4Шериф^0 станет ^3Мирным^0, а случайному ^3Мирному^0 резко передастся его ^Bроль^0. Впредь, будучи ^4Шерифом^0, думайте дважды прежде, чем нажать курок!",
			"\n* Когда ^5Убийца^0 убьёт ^4Шерифа^0, но в игре ещё есть ^3Мирные^0, около его трупа упадёт ^4Изумруд^0.",
			"В отличие от 7-и Изумрудов Хаоса, этот изумруд способен сделать ^2Героем^0 любого ^3Мирного^0, подобравшего его.",
			"Роль ^2Героя^0 похожа на роль ^4Шерифа^0, но имеет несколько отличий:",
			"  - Если ^2Герой^0 убьёт ^3Мирного^0, они оба помрут, их роли не будут переданы другим игрокам;",
			"  - При смерти ^2Героя^0 никакого ^4Изумруда^0 не выпадает.",
			"\n* В раундах с большим количеством игроков на начале игры может быть определено несколько ^5Убийц^0 и ^4Шерифов^0. В таких раундах формируются ^Aкоманды^0 игроков с этими двумя ролями.",
			"^AНапарники^0 могут общаться в их командном чате через консольную команду ^7SAYTEAM^0 или воспользовавшись Командным Чатом (кнопка ^8y^0 на клавиатуре).",
			"Если вы случайно нападете на ^AНапарника^0, он и Вы получите персональное предупреждение. Будьте осторожны - такие командные взаимодействия могут раскрыть вашу ^Bроль^0 другим!"
		},
		{
			"^7Чего следует избегать в Тайне Убийства^0\n",
			"Правило No.1 любой игры: ^2Будьте добры ко всем и развлекайтесь^0! И не делайте следующих вещей...\n",
			"\n* Заспойлеришь ^Bроль^0 - твоя вина, не будет \"Тайною\" игра. Разрешено раскрывать чью-то ^Bроль^0, если сильно уверены в этом, но говорить свою - нельзя.",
			"\n* Не оскорбляйте других игроков. Разрешено шутить, но исключительно по-дружески. Никто Вам не доверится, если будете разбрасываться желочью без причин.",
			"\n* Стоять в ^8AFK^0 - военное преступление. Если будете стоять слишком долго, на Вас сбросятся бомбы и сотрут Вас с лица Земли.",
			"\n* Не меняйте имя игрока во время раунда, будучи ^FМёртвыми^0. Иначе, Вас кикнет с сервера. Вам можно будет поменять его, будучи живым. Также, можно просто подождать до экрана результатов, чтобы безопасно сменить имя игрока.",
			"\n* Избегайте нахождения около ^4Изумруда шерифа^0, когда играете за ^5Убийцу^0. Если вы простоите около изумруда 30 секунд, Вас выгонят из игры.",
			"\nНарушение одного из этих правил может караться киком или баном от Админа! Просим, не нарушайте их и играйте честно."
		},
		{
			"^7Полезные советы^0\n",
			"Мы собрали несколько советиков, которые могут помочь Вам при игре в ^5ТУ^0:",
			"\n* Если способности персонажей отключены Админом, зажмите ^7SPIN^0, чтобы начать красться, не оставляя за собой следов и не создавая шума.",
			"\n* Когда Вы подбёрете ^4Изумруд Шерифа^0, Вам станут доступны все Ружья и кольца, которые Вы подобрали до этого.",
			"\n* Используйте Командный Чат для координирования действий с Вашими ^AНапарниками^0 и избегания огня по своим.",
			"\n* Вы получаете 3 секунды бессмертия, если попадаетесь на такие препятствия, как лава, шипы или огонь.",
			"\n* Попытайтесь где-нибудь спрятаться. Иногда это помогает избежать ненужной публичности.",
			"\n* Если Ваша ^Bроль^0 раскрыта, Вы можете поменять имя игрока и/или поменять цвет своего персонажа. Учтите, что ^2Ваше новое имя будет видно в чате^0.",
			"\n* Нож не будет издавать звука атаки, если Вы крадётесь. Также, кнопка ^7FIRENORMAL^0 позволяет везде использовать Нож, пока Ваши кольца не закончатся."
		}
	},
	["BMP_VICTIMS"]={data={
		"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF",
		"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1FII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1F1FII\31",
		"\xFF1FIIIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\31",
		"\xFFFF\x1FIIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIII\31",
		"\xFFFFIIII\x1FFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFIIIII\x1FFF",
		"\xFFIIIIII\x1FFF\xFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1F1FII\31",
		"II\x1FII\x1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\31",
		"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIIII\31",
		"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIII\31",
		"\x1F1F\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\31"
	}},
	["BMP_SUSPECTS"]={data={
		"\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIII\xFFFFIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFFIIIII\x1FFFII\x1FFF\xFFFFIIII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFFIIIIII\x1FII\x1FFF\xFFFFIIII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\x1FII\x1FFF\xFFIIIIII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1FII\x1FFFIII\x1F1FIII\31",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIIIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FII\x1FFFII\x1FFF\xFF1FII\31",
		"II\x1FFFII\x1FFF\x1FIIII\x1FFF\xFFII\x1F1F\x1F1FII\x1FFF\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIII\x1F1FII\x1FFFII\x1FFF\xFFFFII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\31",
	}},
	["BMP_TIME"]={data={
		"\xFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFFII\31",
		"\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFF\xFFIIIII\31",
		"IIIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFF\xFFIIIII\31",
		"II\x1F1FII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\31",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\31",
		"IIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\31",
		"\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F",
	}},
	["BMP_RINGS"]={data={
		"\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIII\31",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1FFFII\31",
		"\xFFIIIII\x1F1F\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\31",
		"IIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\31",
		"II\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\31",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFII\x1FFFII\31",
		"II\x1FFFII\x1FFF\x1FIIII\x1F1F\xFFII\x1F1F\xFFII\x1FFFIIIII\x1F1F\xFFIIIIIII\x1FFFII\x1FFFII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1FII\x1FFF\x1F1F\x1FFF\x1F1F\31",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\31"
	}}
})
