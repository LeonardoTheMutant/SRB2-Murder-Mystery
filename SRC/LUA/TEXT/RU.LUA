-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- RUSSIAN
-- Made by Arnie37, Sonic1983 and LeonardoTheMutant

MM.AddLang("RU", {
	["VERSION"]="1.3",
	["AUTHOR"]="Arnie37, Sonic1983, LeonardoTheMutant",
	["HUD_MMHELP_UI"]={
		"^7JUMP^0/^7SPIN^0 - прокрутка страницы, ^7Next^0/^7Prev Weapon^0 - сменить страницу",
		"^7".."CUSTOM1^0 - покинуть это меню"
	},
	["HUD_MMHELP"]={
		{
			"^7Добро пожаловать в ^5Тайну Убийства^7!",
			"^7Интерпретацию популярной игры в SRB2!^0\n",
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
			"^AНапарники^0 могут общаться в их командном чате через консольную команду ^7SAYTEAM^0 (подмечу, что кнопка командного чата будет работать так же, как кнопка обычного чата) или могут начать сообщение с символа ^8%^0, который автоматически отправит сообщение всем членам команды.",
			"Если вы случайно нападете на ^AНапарника^0, он и Вы получите персональное предупреждение. Будьте осторожны - такие командные взаимодействия могут раскрыть вашу ^Bроль^0 другим!"
		},
		{
			"^7Чего следует избегать в ^5Тайне Убийства^0\n",
			"Правило No.1 любой игры: ^2Будьте добры ко всем и развлекайтесь^0! И не делайте следующих вещей...\n",
			"\n* Заспойлеришь ^Bроль^0 - твоя вина, не будет \"Тайною\" игра. Разрешено раскрывать чью-то ^Bроль^0, если сильно уверены в этом, но говорить свою - нельзя.",
			"\n* Не оскорбляйте других игроков. Разрешено шутить, но исключительно по-дружески. Никто Вам не доверится, если будете разбрасываться желочью без причин.",
			"\n* Стоять в AFK - военное преступление. Если будете стоять слишком долго, на Вас сбросятся бомбы и сотрут Вас с лица Земли.",
			"\n* Не меняйте имя игрока во время раунда, будучи ^FМёртвыми^0. Иначе, Вас кикнет с сервера. Вам можно будет поменять его, будучи живым. Также, можно просто подождать до экрана результатов, чтобы безопасно сменить имя игрока.",
			"\n* Избегайте нахождения около ^4Изумруда шерифа^0, когда играете за ^5Убийцу^0. Если вы простоите около изумруда 30 секунд, Вас выгонят из игры.",
			"\nНарушение одного из этих правил может караться киком или баном от Админа! Просим, не нарушайте их и играйте честно."
		},
		{
			"^7Полезные советы^0\n",
			"Мы собрали несколько советиков, которые могут помочь Вам при игре в ^5ТУ^0:",
			"\n* Если способности персонажей отключены Админом, зажмите ^7SPIN^0, чтобы начать красться, не оставляя за собой следов и не создавая шума.",
			"\n* Когда Вы подбёрете ^4Изумруд Шерифа^0, Вам станут доступны все Ружья и кольца, которые Вы подобрали до этого.",
			"\n* Используйте команду ^7SAYTEAM^0 для координирования действий с Вашими ^AНапарниками^0 и избегания огня по своим. Если начать сообщение с ^8%^0, оно автоматически отправится всем членам Вашей команды.",
			"\n* Вы получаете 3 секунды бессмертия, если попадаетесь на такие препятствия, как лава, шипы или огонь.",
			"\n* Попытайтесь где-нибудь спрятаться. Иногда это помогает избежать ненужной публичности.",
			"\n* Если Ваша ^Bроль^0 раскрыта, Вы можете поменять имя игрока и/или поменять цвет своего персонажа. Учтите, что ^2Ваше новое имя будет видно в чате^0.",
			"\n* Нож не будет издавать звука атаки, если Вы крадётесь. Также, кнопка^7 FIRENORMAL^0 позволяет везде использовать Нож, пока Ваши кольца не закончатся."
		}
	},
	["CON_MMLANG"]={
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
	}},
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
		"в консоли команду ^7MMHELP^0 для",
		"ознакомления и ^7MMLANG^0 для смены",
		"языка мода",
		"",
		"",
		"^2Удачной Вам игры! ;)"
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
		"Вы ^Fмертвы",
		"Вы не можете возрождатся и писать тем,",
		"кто еще жив"
	},
	["HUD_MIDJOIN"]={
		"Вы присоединились на середине раунда. Пожалуйста, ^4дождитесь его окончания^0.",
		"Пока Вы ждёте, просим прочесть правила игры, прописав в консоли команду ^7MMHELP^0"
	},
	["HUD_ALONE"]={
		"Для начала игры требуется минимум^4 2 игрока^0.",
		"Пожалуйста, подождите ^4ещё одного игрока^0."
	},
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
	["HUD_FUTURE"]="БУДУЩЕЕ"
})
