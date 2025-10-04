-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- UKRAINIAN
-- Made by LeonardoTheMutant

MM.AddLang("UA", { -- Ukrainian by LeonardoTheMutant
	["VERSION"]="1.3",
	["AUTHOR"]="LeonardoTheMutant",
	["KEYBOARD"] = {
		[1] = { --No modifier buttons
			[39] = "є",
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
			[92] = "ґ",
			[93] = "ї",
			[96] = "'",
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
			[115] = "і",
			[116] = "е",
			[117] = "г",
			[118] = "м",
			[119] = "ц",
			[120] = "ч",
			[121] = "н",
			[122] = "я"
		},
		[2] = { --SHIFT
			[39] = "Є",
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
			[92] = "Ґ",
			[93] = "Ї",
			[96] = "~",
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
			[115] = "І",
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
		"Potochna mowa w TW wstanowlena na \x82Ukrains'ku\x80\nWy mozhete zminyty jiji za dopomogoju komandy \x87MMLANG [mowa]",
		"\x82Ukrains'ka\x80 wstanowlena jak washa personal'na mowa w TW"
	},
	["CHAT_ROLEGET_PM"]={
		"Ви ^5Вбивця!^0! ^5Вбийте усіх.",
		"Ви ^4Шериф^0!^4 Елімінуйте усіх вбивць^0. Думайте кого вбиваєте, бо ризикуєте своєю посадою.",
		"Ви ^3Цивільний^0! Заховайтеся і допоможіть Шерифу із рослідуванням."
	},
	["CHAT_NEWROLEGET_PM"]={
		"^7Життя зробило вас ^5Вбивцею^7, ^5тепер ідіть і вбийте сіх.",
		"^7Всесвіт зробив вас новим ^4Шерифом^7! Вам потрібно ^4елімінувати всіх Вбивць^7!", 
		"^7Усі захистники покинула нас, але Всесвіт вибрав вас новим ^2Героєм^7! Це ваш шанс врятувати усіх!",
		"^7Ви вбили одного з ^5Вбивць^7! Вас підвищили до ^2Героя^7!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Ви зачепили особу з ващої команди, не намагайтеся вбити її знов.",
		"Вас зачепила особа з вашої команди. Не робіть помсти для неї."
	},
	["CHAT_MURDKILLED"]={
		"Вбивця",
		"елімінований!"
	},
	["CHAT_SHERIKILLED"]={
		"Шериф",
		"вбитий!",
		"Знайдіть загублений ^4Смарагд Шерифа^0!"
	},
	["CHAT_HEROKILLED"]={
		"Герой",
		"вбитий!"
	},
	["CHAT_DIEDHAZARD"]="загинув(ла) у нещастному випадку.",
	["CHAT_SHREMDPICKUP"]="Хтось узяв ^4Смарагд Шерифа^0...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"^7Ви вбили ^3Цивільного^7! Вас звільнено! (Ви більше не Шериф)",
		"^2Герої^7 не мають права вбивати ^3Цивільних^7! Вас засуджено на смерть за ваш злочин!",
		"^7О ні! Ви вбили ^4Шерифа^7! Вас засуджено на смерть за ваш злочин!",
		"^7Ви вбили таку ж ^3Цивільну^7 особу як і ви самі! Вас засуджено на смерть за ваш злочин!",
		"^7О ні! Ви вбили ^2Героя^7! Вас засуджено на смерть за ваш злочин!"
	},
	["CHAT_INNOHURT"]={
		"^4Шериф^0 вбив ^3Цивільну особу^0! Комусь із ^3Цивільних^0 доведеться закінчити його роботу!",
		"^2Герой^0 вбив ^3Цивільну особу^0. Тепер двоє лежать мертві. Сором герою..."
	},
	["CHAT_ONEQUIT"]={
		"Один із ^5Вбивць^0 покинув гру!",
		"Один із ^4Шерифів^0 pokynuw gru!",
		"Один із ^2Героїв^0 pokynuw nas!"
	},
	["CHAT_LASTQUIT"]={
		"Останній ^5Вбивця^0 покинув гру!",
		"Останній ^4Шериф^0 покинув гру!",
		"Останній ^2Герой^0 покинув гру!"
	},
	["CHAT_REPLACEQUIT"]={
		"^5Вбивця^0 покинув гру! Хтось із ^3Цивільних^0 узяв роль цього гравця'!",
		"^4Шериф^0 покинув гру! Хтось із ^3Цивільних^0 узяв роль цього гравця'!",
		"^2Герой^0 покинув гру! Хтось із ^3Цивільних^0 узяв роль цього гравця'!"
	},
	["CHAT_ENDROUND"]={
		"Всі мертві, ^5Вбивці^0 виграли!",
		"Всі Вбивці еліміновані, ^3Цивільні^0 перемогли!",
		"^5Вбивці^0 виграли, оскільки ^4Шериф^0 вбив останнього Цивільного гравця!",
		"^2Герой^0 вбив останнього Цивільного гравця. ^5Вбивці^0 виграли!",
		"Всі Шерифи та Герої мертві, ^5Вбивці^0 перемогли!"
	},
	["HUD_MM"]="Таємниця Вбивства",
	["HUD_ROLES"]={
		"ВБИВЦЯ",
		"ШЕРИФ",
		"ЦИВІЛЬНИЙ",
		"ГЕРОЙ",
		"МЕРТВИЙ"
	},
	["HUD_SUSPECTS"]="Підозрювані",
	["HUD_VICTIMS"]="Жертви",
	["HUD_TEAMMATES"]="Напарники",
	["HUD_KILLEDBY"] = {
		"Ви вбиті",
		"справедливістю",
		"пасткою на рівні"
	},
	["HUD_SCORESTAB"]="Якщо ви граєте цю гру в перший раз використайте команду ^7MMHELP^0 в консолі для інформації та правил.\nКоманда ^7MMLANG^0 змінює мову інтерфейсу.\n\n^2Удачі  ;)",
	["HUD_ROLETARGET"] = {
		"Вбийте усіх.",
		"Знайдіть і елімінуйте усіх Вбивць. Не вбивайте Цивільних!",
		"Сховайтеся і захистіть себе. При можливості, допоможіть із\nрослідуванням.",
		"Вам випала нагода зупинити усіх Вбивць. Використайте її та врятуйте ситуацію! Будьте обережні!"
	},
	["HUD_ROLESALIVE"]={
		"Вбивць",
		"Шерифів",
		"Невинних"
	},
	["HUD_DEAD"]="Ви ^Fмертві^0\nВи не маєте можливості відродження та розмов з живими гравцями",
	["HUD_MIDJOIN"]="Ви приєдналися ^4посеред раунду^0, будь ласка, зачекайте наступного аби заграти.\nПоки ви чекаєте, будь ласка, прочитайте правила гри в консольній команді ^7MMHELP^0",
	["HUD_ALONE"]="Для початку гри потрібно^4 2-є гравців^0,\nбудь ласка зачекайте на ^4ще одного^0 аби почати",
	["HUD_SNEAKING"]="Крадемося...",
	["HUD_SHOWDOWN"]="Вирішальна дуель!",
	["HUD_MINIGAME"]={
		["PRESS"]="Натисніть^2 CUSTOM3^0 аби",
		["LEAVE"]="вийти",
		["CANCEL"]="скасувати",
		["SPECTATE"]="наглядати",
		["DUEL"]="за дуельною мінігрою",
		["REQUEST"]="заграти в ^7PONG",
		["START"]="заграти в ^7SONIC RUN",
		["ACCEPT"]="Прийнати виклик в ^7PONG^0!",
		["WAIT"]="Чекаємо на відповідь противника...",
		["SPECTATING"]="Наглядаємо за грою...",
		["BORED"]="Нудно?",
		["GOAL"]="Гол!"
	},
	["HUD_YOU"]="ТИ",
	["HUD_WINNERS"]="Виграли:",
	["HUD_WIN"]={
		"НІЧИЯ!",
		"^5ВБИВЦІ",
		"^3ЦИВІЛЬНІ"
	},
	["HUD_PAST"]="МИНУЛЕ",
	["HUD_FUTURE"]="МАЙБУТНЄ",
	["HUD_MMHELP_UI"]={
		"Натисніть ^7ВГОРУ^0/^7ВНИЗ^0 для прокручування, ^7ВЛІВО^0/^7ВПРАВО^0 для зміни сторінки",
		"Будь яка кнопка ^7CUSTOM^0 замикає це меню"
	},
	["HUD_MMHELP"]={
		{
			"^7Вітаємо в Таємниці Вбивства!^0\n",
			"Ціль цієї гри дуже проста: зрозуміти хто з гравців є ^5Вбивцею^0 і знешкодити цього гравця, поки не стало за пізно. Варто розуміти, що цей ігровий режим є дуже подібним до режиму МАТЧ, тому окрім гострого розуму тут потрібні навички прицілювання і швидка реакція.",
			"\nСпочатку розберемося з основами, щоб ви могли почати грати...",
			"\nНа початку кожного раунду вам буде призначенна ^Bроль^0, яка визначатиме ваше завдання під час гри. Ось можливі ^Bролі^0, яку Ви можете отримати:",
			" * ^5Вбивця^0 - один з головних персонажів гри. Гравець з цією роллю мусить вбити абсолютно кожного або знищити всі можливості повстання ^4Шерифів^0;",
			" * ^4Шериф^0 - місцева поліція. ^4Шерифи^0 мусять знайти і захистити ^3Цивільних^0 від геноциду ^5Вбивць^0 використовуючі всі можливі методи розслідування. Якщо вони помилятся із вбивцею і вб'ють невинного гравця їх офіціально ліквідують від розслідуваня.",
			"* ^3Цивільний(-а)^0 - має уникати смерті та допомогти зідентифікувати ^5Вбивцю^0. В залежності від налаштування гри, гравці з цією ^Bроллю^0 можуть отримати ^5Червоне кільце^0 для свого захисту, зібравши 100 кілець (або 50 кілець для певних персонажів).",
			"\nЦе уся важлива інформація, яка вам потрібна, щоб почати грати. Щоб дізнатися більше, прочитайте цей посібник до кінця."
		},
		{
			"^7Детальніше про ігровий процес^0",
			"\n* Якщо ви помрете, ви перейдете в стан ^Fмертвого^0 гравця. Гравці в цьому стані не можуть відрожуватися або глобально спілкуватися з гравцями, які ще живі. Повідомлення ^Fмертвих^0 гравців можуть бачити тільки інші ^Fмервті^0 гравці.",
			"Важливе! ^2НЕ НАМАГАЙТЕСЯ ЗМІНИТИ СВОЄ І'МЯ ГРАВЦЯ У ^FМЕРТВОМУ ^2СТАНІ!^0",
			"\n* ^4Шерифи^0 можуть помилитися у своєму розслідуванні і вбити ^3Цивільного^0 гравця - але це не означає кінець гри. Винуватеть згубить свою посаду шерифа, а натомість інший, випадковий, ^3Цивільний^0 отримає її.",
			"Варто завжди подумати тричі перш ніж ви зробите висновки бо неправильне рішення може довести до катастрофи!",
			"\n* Якщо ^5Вбивця^0 вб'є ^4Шерифа^0, поки ще є живі ^3Цивільні^0 гравці, ^4Смарагд шерифа^0 впаде біля його трупа.",
			"Коли ^3Цивільний^0 підбере ^4Смарагд шерифа^0, він стане ^2Героєм^0. ^BРоль ^2Героя^0 схожа на ^4Шерифа^0, але вона має деякі відмінності:",
			"  - Якщо ^2Герой^0 вб'є ^3Цивільну Особу^0 - обидва загинуть, а їх ^Bролі^0 не будуть передані іншим гравцям;",
			"  - ^2Герої^0 не залишають ^4Смарагд шерифа^0 по своїй смерті.",
			"\n* На початку раунду гравців з ^Bролями^0 ^5Вбивць^0 та ^4Шерифів^0 може бути декілька, в залежності від кількості присутніх людей у грі. Гравці які мають одну і ту саму ^Bроль^0 утворюють ^Aкоманду^0 (^3Цивільні^0 не вважаються за команду).",
			"^AЧлени команди^0 можуть спілкуватися між собою за допомогою команди ^7SAYTEAM^0 у консолі або використовуючи Командний Чат (кнопка ^8y^0 на клавіатурі).",
			"Якщо ви випадково заатакуєте ^Aпартнера в команді^0, обидва гравці отримають персональне попередження. Будьте обережні - така командна помилка може розкрити вашу ^Bроль^0 іншим!"
		},
		{
			"^7Чого слід уникати в Таємниці Вбивства^0\n",
			"\n* Виказування своєї ^Bролі^0 - руйнація таємниці у ^7\"Таємниці Вбивства\"^0. Розказувати про свою ^Bроль^0 усім іншим суворо заборонено. Можна лише говорити про ^Bролі^0 інших гравців коли йдеться про розслідування.",
			"\n* Не набридайте іншим гравцям та \"не судіть по обкладинці\". Ніхто не буде вам вірити коли ви будете звинувачувати усіх у вбивстві та/або ображати.",
			"\n* Безактивність (AFK) дуже сильно впливає на події гри. В деяких випадках безактивність навіть карається вижененням з гри.",
			"\n* Зміна імені гравця у мертвому стані вважається чітом і карається вижененням з гри (бо можна передати інформацію живим гравцям). Аби безпечно змінити ім'я варто спершу вийти з гри, змінити ім'я, а вже потім знову зайти у гру.",
			"\n* Якщо ви граєте за ^5Вбивцю^0, уникайте перебування біля ^4Смарагду Шерифа^0. Перебуваня біля смарагду протягом 30 секунд призведе до виженення з гри.",
			"\nПорушення одного з цього правил призводить до виженення (kick) або бану від Адміністраторів гри. Будь ласка, грайте чесно і не руйнуйте іншим \"таємниці\" гри!"
		},
		{
			"^7Список порад^0\n",
			"Ми зібрали для вас декілька порад які можуть допомогти вам у вашому розслідуванні:",
			"\n* В залежності від параметрів гри виставлені Адмінінтратором можна затиснути клавішу ^7SPIN^0 для підкрадання. Підкрадання дозволяє вам ходити навколо без шуму та слідів (а також інші тихі речі);",
			"\n* ^3Цивільним^0 можна наперед збирати зброю та кільця аби потім, коли отримає ^Bроль ^4Шерифа^0 або дістане ^4смарагд^0, міг з впевненістю йти у бій;",
			"\n* Використовуйте Командний Чат аби координувати свої дії з вашими ^Aтоваришами по команді^0 та уникати дружнього вогню.",
			"\n* Якщо вас викрили ви завжди можете змінити колір свого персонажу аби вас важче було впізнати;",
			"\n* Клавіша^7 FIRENORMAL^0 активує ^6ніж^0 коли ви маєте для нього кільця. Якщо ви підкрадаєтесь то ^6ніж^0 не робить звуків атаки узагалі."
		}
	},
	["BMP_VICTIMS"]={data={
		"\xFFII\x1FII\x1FII\x1FFFIIIIII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIII\31",
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
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFF\xFFIIII\x1FFF\xFFIIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFFIIIIII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFFII\x1F1FII\x1FFF\xFFII\x1FFF\xFFII\x1F1FII\x1FFF\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFFIII\xFFFFIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\x1F1F\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFII\x1FIIIII\x1FFF\xFFFFIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFIIIII\x1FFF\xFFIIIIII\x1FFFII\x1FFFIIIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIIIII\x1FFF\xFFFFIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFF\x1F1FII\x1FFFII\x1F1F\x1FFF\xFFFFII\x1F1FII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFIIIII\x1FII\x1FFF\xFFIIIIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFF\xFFIIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIII\x1FFFII\x1FFFIII\x1F1FIII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFFIIIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFII\x1FFFII\x1FFF\xFF1FII\31",
		"II\x1FFFII\x1FFF\xFFII\x1FFFII\x1F1F\x1F1FII\x1FFF\x1FIIII\x1FFF\xFF1FIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFII\x1FFF\x1FIIII\x1FFF\xFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F\xFFFF\xFFFF\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F"
	}},
	["BMP_TIME"]={data={
		"II\x1FFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\31",
		"II\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\31",
		"II\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1F1F\31",
		"\x1FIIII\x1FFFIIIIII\x1FFFII\31",
		"\xFF1F\x1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\31",
		"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\31",
		"\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFF\x1FIIII\31",
		"\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F"
	}},
	["BMP_RINGS"]={data={
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFII\x1FFFII\31",
		"\xFFIIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFFIIII\x1FFF\xFFFFII\x1FFFII\x1FFF\xFFFFIIIII\31",
		"IIIII\x1FFF\xFFII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFF\xFFFFIIIII\31",
		"II\x1F1FII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFII\x1F1FII\31",
		"II\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFII\31",
		"II\x1FFFII\x1FFFII\x1FFFIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFF\xFFII\x1FFFII\31",
		"II\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFII\x1FFFIIIII\x1FFF\xFFIIIIIII\x1FFFII\x1FFFII\31",
		"\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1FII\x1FFF\x1F1F\x1FFF\x1F1F\31",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\31"
	}},
})
