-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- RUSSIAN
-- Made by Arnie37, Sonic1983 and LeonardoTheMutant

MM.AddLang("RU", {
	["VERSION"]="1.3",
	["AUTHOR"]="Arnie37, Sonic1983, LeonardoTheMutant",
	["HUD_MMHELP_UI"]={
		"\1\x87JUMP\4/\1\x87SPIN\4 - прокрутка страницы, \1\x87Next\4/\1\x87Prev Weapon\4 - сменить страницу",
		"\1\x87".."CUSTOM1\4 - покинуть это меню"
	},
	["HUD_MMHELP"]={
		{
			"\1\x87Добро пожаловать в \1\x85Тайну Убийства\1\x87!",
			"\1\x87Интерпретацию популярной игры в SRB2!\4\n",
			"Цель игры - найти и устранить всех \1\x85Убийц\4 до того, как они убьют \1\x83остальных\4. По управлению этот режим подобен режиму МАТЧ, так что здесь Вам будут нужны навыки стрельбы и попадания.",
			"Сначала, перед тем, как играть, давайте изучим парочку азов...",
			"\nВ самом начале каждого раунда Вам выпадет \1\x8BРоль\4, определяющая Ваши задания во время игры. Вот все 3 возможные роли, которые можно получить на старте:",
			"* \1\x85Убийца\4 - преступник во плоти. Им нужно убить всех.",
			"* \1\x84Шериф\4 - местная полиция. Их задача заключается в нахождении и устранении всех \1\x85Убийц\4.",
			"* \1\x83Мирный\4 - безобидный игрок. Им нужно избегать гибели, но также, они могут помочь отыскать \1\x85Убийцу\4. Если \1\x83Мирные\4 соберут 100 или более колец, они могут подбирать Красные Кольца для самообороны (некоторым персонажам для таких целей требуется всего лишь 50 колец).",
			"\nЭто были все азы, нужные для понимания игры. Рекомендуем прочитать этут справку до конца для большего понимания игровых механик и много чего интересного."
		},
		{
			"\1\x87Об игровых ситуациях и геймплее\4\n",
			"Как было рассказано ранее в азах, цель \1\x84Шерифов\4 - устранить всех \1\x85Убийц\4, но также могут быть возможными следующие ситуации:",
			"\n* Если в Вас попадет кольцо игрока, Вы станете \1\x8FМертвецом\4. Такие игроки не могут возрождатся, а также писать приватно в чат тем, кто ещё живой. Их сообщения будут видны только таким же \1\x8FМертвецам\4.",
			"Если Вы погибните из-за таких препятствий, как прессы, пропасти, а также, утонув в воде, Вы так же станете \1\x8FМертвецом\4 до конца раунда.",
			"Вот ещё кое-что: \1\x82ДАЖЕ НЕ ПЫТАЙТЕСЬ СМЕНИТЬ СВОЁ ИМЯ ИГРОКА, \1\x82ПОКА \1\x82ВЫ \1\x8FМЕРТЫ!\4 Подробнее об этом написано на следующей странице.",
			"\n* Задачи \1\x84Шерифа\4 - устранить всех \1\x85Убийц\4 вокруг, но они, также могут по случайности пристрелить \1\x83Мирного\4.",
			"Если такое произойдёт, \1\x84Шериф\4 станет \1\x83Мирным\4, а случайному \1\x83Мирному\4 резко передастся его \1\x8Bроль\4. Впредь, будучи \1\x84Шерифом\4, думайте дважды прежде, чем нажать курок!",
			"\n* Когда \1\x85Убийца\4 убьёт \1\x84Шерифа\4, но в игре ещё есть \1\x83Мирные\4, около его трупа упадёт \1\x84Изумруд\4.",
			"В отличие от 7-и Изумрудов Хаоса, этот изумруд способен сделать \1\x82Героем\4 любого \1\x83Мирного\4, подобравшего его.",
			"Роль \1\x82Героя\4 похожа на роль \1\x84Шерифа\4, но имеет несколько отличий:",
			"  - Если \1\x82Герой\4 убьёт \1\x83Мирного\4, они оба помрут, их роли не будут переданы другим игрокам;",
			"  - При смерти \1\x82Героя\4 никакого \1\x84Изумруда\4 не выпадает.",
			"\n* В раундах с большим количеством игроков на начале игры может быть определено несколько \1\x85Убийц\4 и \1\x84Шерифов\4. В таких раундах формируются \1\x8Aкоманды\4 игроков с этими двумя ролями.",
			"\1\x8AНапарники\4 могут общаться в их командном чате через консольную команду \1\x87SAYTEAM\4 (подмечу, что кнопка командного чата будет работать так же, как кнопка обычного чата) или могут начать сообщение с символа \1\x88%\4, который автоматически отправит сообщение всем членам команды.",
			"Если вы случайно нападете на \1\x8AНапарника\4, он и Вы получите персональное предупреждение. Будьте осторожны - такие командные взаимодействия могут раскрыть вашу \1\x8Bроль\4 другим!"
		},
		{
			"\1\x87Чего следует избегать в \1\x85Тайне Убийства\4\n",
			"Правило No.1 любой игры: \1\x82Будьте добры ко всем и развлекайтесь\4! И не делайте следующих вещей...\n",
			"\n* Заспойлеришь \1\x8Bроль\4 - твоя вина, не будет \"Тайною\" игра. Разрешено раскрывать чью-то \1\x8Bроль\4, если сильно уверены в этом, но говорить свою - нельзя.",
			"\n* Не оскорбляйте других игроков. Разрешено шутить, но исключительно по-дружески. Никто Вам не доверится, если будете разбрасываться желочью без причин.",
			"\n* Стоять в AFK - военное преступление. Если будете стоять слишком долго, на Вас сбросятся бомбы и сотрут Вас с лица Земли.",
			"\n* Не меняйте имя игрока во время раунда, будучи \1\x8FМёртвыми\4. Иначе, Вас кикнет с сервера. Вам можно будет поменять его, будучи живым. Также, можно просто подождать до экрана результатов, чтобы безопасно сменить имя игрока.",
			"\n* Избегайте нахождения около \1\x84Изумруда шерифа\4, когда играете за \1\x85Убийцу\4. Если вы простоите около изумруда 30 секунд, Вас выгонят из игры.",
			"\nНарушение одного из этих правил может караться киком или баном от Админа! Просим, не нарушайте их и играйте честно."
		},
		{
			"\1\x87Полезные советы\4\n",
			"Мы собрали несколько советиков, которые могут помочь Вам при игре в \1\x85ТУ\4:",
			"\n* Если способности персонажей отключены Админом, зажмите \1\x87SPIN\4, чтобы начать красться, не оставляя за собой следов и не создавая шума.",
			"\n* Когда Вы подбёрете \1\x84Изумруд Шерифа\4, Вам станут доступны все Ружья и кольца, которые Вы подобрали до этого.",
			"\n* Используйте команду \1\x87SAYTEAM\4 для координирования действий с Вашими \1\x8AНапарниками\4 и избегания огня по своим. Если начать сообщение с \1\x88%\4, оно автоматически отправится всем членам Вашей команды.",
			"\n* Вы получаете 3 секунды бессмертия, если попадаетесь на такие препятствия, как лава, шипы или огонь.",
			"\n* Попытайтесь где-нибудь спрятаться. Иногда это помогает избежать ненужной публичности.",
			"\n* Если Ваша \1\x8Bроль\4 раскрыта, Вы можете поменять имя игрока и/или поменять цвет своего персонажа. Учтите, что \1\x82Ваше новое имя будет видно в чате\4.",
			"\n* Нож не будет издавать звука атаки, если Вы крадётесь. Также, кнопка\1\x87 FIRENORMAL\4 позволяет везде использовать Нож, пока Ваши кольца не закончатся."
		}
	},
	["CHAT_MMLANG"]={
		"Seychas u Vas stoit\x82 russkiy\x80 yazyk.\nVy mozhete smenit' yazyk, propisav v konsol' \x87MMLANG [yazyk]",
		"Vash personalniy yazyk etogo moda izmenyon na\x82 russkiy"
	},
	["CHAT_ROLEGET_PM"]={
		"Vy \x85Ubiytsa\x80! \x85Ubeyte vseh!",
		"Vy \x84Sherif\x80!\x84 Ustranite vseh Ubiyts\x80. Esli Vy ubyote Mirnogo, s Vas snimut etu rol'.",
		"Vy \x83Mirniy\x80! Priachtes' i pomogayte v rassledovanii."
	},
	["CHAT_NEWROLEGET_PM"]={
		"\x87Sud'ba darovala tebe rol' \x85Ubiytsy\x87.\x85 Teper' idi, ubivay!",
		"\x87Tebe dana rol' \x84Sherifa\x87! Vperyod, \x84 ustrani ubiyts\x87, poka ne pozdno!",
		"\x87Ty byl(-a) izbran(-a) \x82Geroem\x87. Spasi zhe Mirnyh ot Ubiyts!",
		"\x87Ty ustranil(-a) odnogo iz \x85Ubiyts\x87! Tebia povysili do \x82Geroya\x87!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Eto Vash naparnik. Bolshe ne streliayte po svoim.",
		"Vas udaril Vash naparnik. Dazhe ne dumayte yemu mstit'."
	},
	["CHAT_MURDKILLED"]={
		"\x85Ubiytsa",
		"ustranyon"
	},
	["CHAT_SHERIKILLED"]={
		"\x84Sherif",
		"byl ubit!",
		"Naydite yego(yo)\x84 Izumrud\x80!"
	},
	["CHAT_HEROKILLED"]={
		"\x82Geroy",
		"byl ubit!"
	},
	["CHAT_DIEDHAZARD"]="popal(a) tuda, kuda ne sledovalo.",
	["CHAT_SHREMDPICKUP"]="Kto-to podobral \x84Izumrud Sherifa\x80...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"\x87Ty ubil(a)\x83 Mirnogo\x87! Ty bolshe ne Sherif!",
		"\x82Geroi\x87 ne sozdany, chtob ubivat' \x83Mirnyh\x87. Za eto budet otvetnaya smert'.",
		"\x87O net! Ty ubil(-a) \x84Sherifa\x87! Za eto budet otvetnaya smert'.",
		"\x87Ty ubil(-a) takogo zhe\x83 Mirnogo\x87 cheloveka kak i ty! Za eto budet otvetnaya smert'.",
		"\x87O net! Ty ubil(-a) \x82Geroya\x87! Za eto budet otvetnaya smert'."
	},
	["CHAT_INNOHURT"]={
		"\x84Sherif\x80 ubil\x83 Mirnogo\x80! Nado poruchit' delo komu-to drugomu!",
		"\x82Geroy\x80 zhostko tupanul i ubil\x83 Mirnogo\x80. I shas oni oba lezhat dohlye. Vot zhe\x82 Debil\x80"
	},
	["CHAT_ONEQUIT"]={
		"Odin iz \x85Ubiyts\x80 pokinul igru!",
		"Odin iz \x84Sherifov\x80 vyshel!!!",
		"Odin iz \x82Geroev\x80 predal nas (pokinul igru)!"
	},
	["CHAT_LASTQUIT"]={
		"Posledniy iz \x85Ubiyts\x80 pokinul igru!",
		"Posledniy iz \x84Sherifov\x80 pokinul igru!",
		"Posledniy iz \x82Geroev\x80 pokinul igru!"
	},
	["CHAT_REPLACEQUIT"]={
		"\x85Ubiytsa\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Mirniy\x80!",
		"\x84Sherif\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Mirniy\x80!",
		"\x82Geroy\x80 pokinul igru! Yego rol' vozmyot sluchayniy \x83Mirniy\x80!"
	},
	["CHAT_ENDROUND"]={
		"Vse mertvy. \x85Ubiytsy\x80 pobedili!",
		"Vse \x85Ubiytsy\x80 ustraneny! \x83Mirnyye\x80 pobedili!",
		"\x85Ubiytsy\x80 pobedili, potomu chto \x84Sherif\x80 ubil poslednego Mirnogo! Pozor \x84Sherifu\x80",
		"\x82Geroy\x80 ubil poslednego Mirnogo. \x85Ubiytsy\x80 pobedili!",
		"Zashitniki \x83Mirnyh\x80 ubity. \x85Ubiytsy\x80 pobedili!"
	},
	["BMP_VICTIMS"]={
		"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF",
		"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1FII\x1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\x1FFFII\x1F1FII\x1F",
		"\xFF1FIIIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
		"\xFFFF\x1FIIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
		"\xFFFFIIII\x1FFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFFF\xFFII\x1FFF\xFFFFIIIII\x1FFF",
		"\xFFIIIIII\x1FFF\xFFII\x1F1F\x1F1F\x1FFFII\x1F1F\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1F1FII\x1F",
		"II\x1FII\x1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFII\x1FFFII\x1F",
		"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIIII\x1F",
		"II\x1FII\x1FII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFFII\x1FFF\xFFFFIIIII\x1F",
		"\x1F1F\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1F"
	},
	["BMP_SUSPECTS"]={
		"\xFFIIIIII\x1FFF\xFFIIII\x1FFF\xFFFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFFII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIII\xFFFFIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFFIIIII\x1FFFII\x1FFF\xFFFFIIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFFIIIIII\x1FII\x1FFF\xFFFFIIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\x1FII\x1FFF\xFFIIIIII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1FII\x1FFFIII\x1F1FIII\x1F",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIIIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FII\x1FFFII\x1FFF\xFF1FII\x1F",
		"II\x1FFFII\x1FFF\x1FIIII\x1FFF\xFFII\x1F1F\x1F1FII\x1FFF\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIII\x1F1FII\x1FFFII\x1FFF\xFFFFII\x1F",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\x1FFF\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F",
	},
	["BMP_TIME"]={
		"\xFFIIIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIIII\x1F",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1F\x1F1F\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIII\xFFIIII\x1FFFII\x1FFFII\x1F",
		"\xFFIIIII\x1F1F\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIIII\x1FFF\xFFIIIII\x1F",
		"IIIII\x1FFF\xFFIIIII\x1F1F\xFFIIIIII\x1FFFII\x1FIII\x1FII\x1FFF\xFFIIIII\x1F",
		"II\x1F1FII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1F1FII\x1F",
		"II\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1F",
		"IIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F",
		"IIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1F",
		"\x1F1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F",
	},
	["BMP_RINGS"]={
		"\xFFII\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIII\x1F",
		"\xFFII\x1FFFII\x1FFFIIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1F",
		"\xFFIIIII\x1F1F\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
		"IIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1F",
		"II\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1F",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1F",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFII\x1FFFII\x1F",
		"II\x1FFFII\x1FFF\x1FIIII\x1F1F\xFFII\x1F1F\xFFII\x1FFFIIIII\x1F1F\xFFIIIIIII\x1FFFII\x1FFFII\x1F",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1FII\x1FFF\x1F1F\x1FFF\x1F1F\x1F",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F\x1F\x1F"
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
	["HUD_SCORESTAB"]={
		"Если Вы новичок в этом режиме, пропишите",
		"в консоли команду \1\x87MMHELP\4 для",
		"ознакомления и \1\x87MMLANG\4 для смены",
		"языка мода",
		"",
		"",
		"\1\x82Удачной Вам игры! ;)"
	},
	["HUD_ROLETARGET"] = {
		"Убейте всех.",
		"Найдите и устраните всех Убийц.\nНе убивайте Мирных!",
		"Спрячьтесь и защитите себя. Помогите\nрасследованию, когда это возможно.",
		"У вас есть шанс остановить всех Убийц.\nИдите и спасите положение!\nБудьте осторожны!"
	},
	["HUD_ROLESALIVE"]={
		"Убийц",
		"Шерифов",
		"Мирных"
	},
	["HUD_DEAD"]={
		"Вы \1\x8Fмертвы",
		"Вы не можете возрождатся и писать тем,",
		"кто еще жив"
	},
	["HUD_MIDJOIN"]={
		"Вы присоединились на середине раунда. Пожалуйста, \1\x84дождитесь его окончания\4.",
		"Пока Вы ждёте, просим прочесть правила игры, прописав в консоли команду \1\x87MMHELP\4"
	},
	["HUD_ALONE"]={
		"Для начала игры требуется минимум\1\x84 2 игрока\4.",
		"Пожалуйста, подождите \1\x84ещё одного игрока\4."
	},
	["HUD_SNEAKING"]="Подкрадывание...",
	["HUD_SHOWDOWN"]="Решающая дуель!",
	["HUD_MINIGAME"]={
		["PRESS"]="Нажмите\1\x82 CUSTOM3\4, чтобы",
		["LEAVE"]="выйти",
		["CANCEL"]="отменить",
		["SPECTATE"]="наблюдать за",
		["DUEL"]="дуэлью в миниигре",
		["REQUEST"]="сыграть в \1\x87PONG",
		["START"]="запустить мини игру \1\x87SONIC RUN",
		["ACCEPT"]="принять вызов в \1\x87PONG\4!",
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
		"\1\x85УБИЙЦИ",
		"\1\x83ЦЫВИЛЬНЫЕ"
	},
	["HUD_PAST"]="ПРОШЛОЕ",
	["HUD_FUTURE"]="БУДУЩЕЕ"
})
