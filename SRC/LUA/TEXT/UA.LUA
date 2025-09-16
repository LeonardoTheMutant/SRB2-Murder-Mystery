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
			[51] = "№",
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
		"Wy \1\x85Wbywcia\4! \1\x85Wbyjte usih.",
		"Wy \1\x84Sheryf\4!\1\x84 Eliminujte usih Wbywc'\4. Dumajte kogo wbywajete, bo ryzykujete swojeju rolliu.",
		"Wy\1\x83 Cywilnyj\4! Zachowajtesia i dopomozhit' Sheryfu znajty Wbywc'."
	},
	["CHAT_NEWROLEGET_PM"]={
		"\1\x87Zhytia zrobylo was \1\x85Wbywceju\1\x87, \1\x85teper idit' i wbyjte usih.",
		"\1\x87Wseswit zrobyw was nowym \1\x84Sheryfem\1\x87! Wam potribno \1\x84 eliminuwaty wsih Wbywc'\1\x87!",
		"\1\x87Usi zahystnyky pokynuly nas, ale Wseswit wybraw was nowym \1\x82Gerojem\1\x87! Ce wash shans wriatuwaty den'!",
		"\1\x87Wy wbyly odnogo z \1\x85Wbywc'\1\x87! Was pidwyshyly do \1\x82Geroja\1\x87!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Wy zachepyly osobu z washoji komandy, ne namagajtesia wbyty jiji znow.",
		"Was zachepyla osoba z washoji komandy. Ne robit' pomsty dla neji."
	},
	["CHAT_MURDKILLED"]={
		"\1\x85Wbywcia",
		"eliminowanyj!"
	},
	["CHAT_SHERIKILLED"]={
		"\1\x84Sheryf",
		"wbytyj!",
		"Znajdit' zagublenyj \1\x84Smaragd Sheryfa\4!"
	},
	["CHAT_HEROKILLED"]={
		"\1\x82Geroj",
		"wbytyj!"
	},
	["CHAT_DIEDHAZARD"]="zagynuw(la) u neschasnomu wypadku.",
	["CHAT_SHREMDPICKUP"]="Htos' uziaw \1\x84Smaragd Sheryfa\4...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"\1\x87Wy wbyly\1\x83 Cywilnogo\1\x87! Was zwil'neno! (Ty bil'she ne Sheryf)",
		"\1\x82Geroji\1\x87 ne majut' prawa wbywaty\1\x83 Cywilnych\1\x87! Was zasudzheno na smert' za wash zlochyn!",
		"\1\x87O ni! Wy wbyly \1\x84Sheryfa\1\x87! Was zasudzheno na smert' za wash zlochyn!",
		"\1\x87Wy wbyly takuzh\1\x83 Cywilnu\1\x87 osobu jak i Wy sami! Was zasudzheno na smert' za wash zlochyn!",
		"\1\x87O ni! Wy wbyly \82Geroja\1\x87! Was zasudzheno na smert' za wash zlochyn!"
	},
	["CHAT_INNOHURT"]={
		"\1\x84Sheryf\4 wbyw Newynnu osobu! Komus' z\1\x83 Cywil'nych\4 dowedet'sia zakinchyty jogo robotu!",
		"\1\x82Geroj\4 wbyw myrnu\1\x83 Cywilnu\4. Teper dwoje lezhat' mertwi. Sorom geroju"
	},
	["CHAT_ONEQUIT"]={
		"Odyn z \1\x85Wbywc'\4 pokynuw gru!",
		"Odyn z \1\x84Sheryfiw\4 pokynuw gru!",
		"Odyn z \1\x82Gerojiw\4 pokynuw nas!"
	},
	["CHAT_LASTQUIT"]={
		"Ostannij \1\x85Wbywcia\4 pokynuw gru!",
		"Ostannij \1\x84Sheryf\4 pokynuw gru!",
		"Ostannij \1\x82Geroj\4 pokynuw gru!"
	},
	["CHAT_REPLACEQUIT"]={
		"\1\x85Wbywcia\4 pokynuw gru! Htos' z\1\x83 Cywilnych\4 uziaw jogo rol'!",
		"\1\x84Sheryf\4 pokynuw gru! Htos' z\1\x83 Cywilnych\4 uziaw jogo rol'!",
		"\1\x82Geroj\4 pokynuw gru! Htos' z\1\x83 Cywilnych\4 uziaw jogo rol'!"
	},
	["CHAT_ENDROUND"]={
		"Wsi mertwi, \1\x85Wbywci\4 wygraly!",
		"Wsi Wbywci eliminowani,\1\x83 Cywil'ni\4 wygraly!",
		"\1\x85Wbywci\4 wygraly bo \1\x84Sheryf\4 wbyw ostanniogo Newynnogo!",
		"\1\x82Geroj\4 wbyw ostanniogo Newynnogo. \1\x85Wbywci\4 wygraly!",
		"Wsi Sheryfy ta Geroji mertwi, \1\x85Wbywci\4 wygraly!"
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
	["HUD_SCORESTAB"]={
		"Якщо ви граєте цю гру в перший раз",
		"використайте команду \1\x87MMHELP\4 в консолі",
		"для інформації та правил",
		"",
		"Команда \1\x87MMLANG\4 змінює мову інтерфейсу",
		"",
		"",
		"\1\x82Удачі  ;)"
	},
	["HUD_ROLETARGET"] = {
		"Вбийте усіх.",
		"Знайдіть і елімінуйте усіх Вбивць.\nНе вбивайте Цивільних!",
		"Сховайтеся і захистіть себе.\nПри можливості, допоможіть із\nрослідуванням.",
		"Вам випала нагода зупинити усіх Вбивць.\nВикористайте її та врятуйте ситуацію!\nБудьте обережні!"
	},
	["HUD_ROLESALIVE"]={
		"Вбивць",
		"Шерифів",
		"Невинних"
	},
	["HUD_DEAD"]={
		"Ви \1\x8Fмертві",
		"Ви не маєте можливості відродження та розмов з живими гравцями"
	},
	["HUD_MIDJOIN"]={
		"Ви приєдналися \1\x84посеред раунду\4, будь ласка, зачекайте наступного аби заграти.",
		"Поки ви чекаєте, будь ласка, прочитайте правила гри в консольній команді \1\x87MMHELP\4"
	},
	["HUD_ALONE"]={
		"Для початку гри потрібно\1\x84 2-є гравців\4,",
		"будь ласка зачекайте на ще одного",
		"аби почати"
	},
	["HUD_SNEAKING"]="Крадемося...",
	["HUD_SHOWDOWN"]="Вирішальна дуель!",
	["HUD_MINIGAME"]={
		["PRESS"]="Натисніть\1\x82 CUSTOM3\4 аби",
		["LEAVE"]="вийти",
		["CANCEL"]="скасувати",
		["SPECTATE"]="наглядати",
		["DUEL"]="за дуельною мінігрою",
		["REQUEST"]="заграти в \1\x87PONG",
		["START"]="заграти в \1\x87SONIC RUN",
		["ACCEPT"]="Прийнати виклик в \1\x87PONG\4!",
		["WAIT"]="Чекаємо на відповідь противника...",
		["SPECTATING"]="Наглядаємо за грою...",
		["BORED"]="Нудно?",
		["GOAL"]="Гол!"
	},
	["HUD_YOU"]="ТИ",
	["HUD_WINNERS"]="Виграли:",
	["HUD_WIN"]={
		"НІЧИЯ!",
		"\1\x85ВБИВЦІ",
		"\1\x83ЦИВІЛЬНІ"
	},
	["HUD_PAST"]="МИНУЛЕ",
	["HUD_FUTURE"]="МАЙБУТНЄ",
	["HUD_MMHELP_UI"]={
		"Натисніть \1\x87JUMP\4/\1\x87SPIN\4 для прокручування, \1\x87Next\4/\1\x87Prev Weapon\4 для зміни сторінки",
		"\1\x87".."CUSTOM1\4 - покинути це меню"
	},
	["HUD_MMHELP"]={
		{
			"\1\x87Вітаємо в \1\x85Таємниці Вбивства\1\x87!\n",
			"Ціль цієї гри дуже проста: зрозуміти хто з гравців є \1\x85Вбивцею\4 і знешкодити цього гравця, поки не стало за пізно. Варто розуміти, що цей ігровий режим є дуже подібним до режиму МАТЧ, тому окрім гострого розуму тут потрібні навички прицілювання і швидка реакція.",
			"\nСпочатку розберемося з основами, щоб ви могли почати грати...",
			"\nНа початку кожного раунду вам буде призначенна \1\x8Bроль\4, яка визначатиме ваше завдання під час гри. Ось можливі \1\x8Bролі\4, яку Ви можете отримати:",
			" * \1\x85Вбивця\4 - один з головних персонажів гри. Гравець з цією роллю мусить вбити абсолютно кожного або знищити всі можливості повстання \1\x84Шерифів\4;",
			" * \1\x84Шериф\4 - місцева поліція. \1\x84Шерифи\4 мусять знайти і захистити \1\x83Цивільних\4 від геноциду \1\x85Вбивць\4 використовуючі всі можливі методи розслідування. Якщо вони помилятся із вбивцею і вб'ють невинного гравця їх офіціально ліквідують від розслідуваня.",
			"* \1\x83Цивільний(-а)\4 - має уникати смерті та допомогти зідентифікувати \1\x85Вбивцю\4. В залежності від налаштування гри, гравці з цією \1\x8Bроллю\4 можуть отримати \1\x85Червоне кільце\4 для свого захисту, зібравши 100 кілець (або 50 кілець для певних персонажів).",
			"\nЦе уся важлива інформація, яка вам потрібна, щоб почати грати. Щоб дізнатися більше, прочитайте цей посібник до кінця."
		},
		{
			"\1\x87Детальніше про ігровий процес",
			"\n* Якщо ви помрете, ви перейдете в стан \1\x8Fмертвого\4 гравця. Гравці в цьому стані не можуть відрожуватися або глобально спілкуватися з гравцями, які ще живі. Повідомлення \1\x8Fмертвих\4 гравців можуть бачити тільки інші \1\x8Fмервті\4 гравці.",
			"Важливе! \1\x82НЕ НАМАГАЙТЕСЯ ЗМІНИТИ СВОЄ І'МЯ ГРАВЦЯ У \1\x8FМЕРТВОМУ \1\x82СТАНІ!",
			"\n* \1\x84Шерифи\4 можуть помилитися у своєму розслідуванні і вбити \1\x83Цивільного\4 гравця - але це не означає кінець гри. Винуватеть згубить свою посаду шерифа, а натомість інший, випадковий, \1\x83Цивільний\4 отримає її.",
			"Варто завжди подумати тричі перш ніж ви зробите висновки бо неправильне рішення може довести до катастрофи!",
			"\n* Якщо \1\x85Вбивця\4 вб'є \1\x84Шерифа\4, поки ще є живі \1\x83Цивільні\4 гравці, \1\x84Смарагд шерифа\4 впаде біля його трупа.",
			"Коли \1\x83Цивільний\4 підбере \1\x84Смарагд шерифа\4, він стане \1\x82Героєм\4. \1\x8BРоль \1\x82Героя\4 схожа на \1\x84Шерифа\4, але вона має деякі відмінності:",
			"  - \xDFEA\xF9EE \1\x82\xC3E5\xF0EE\xE9\4 \xE2E1'\xBA \1\x83\xD6E8\xE2B3\xEBFC\xEDEE\xE3EE\4 - \xEEE1\xE8E4\xE2E0 \xE7E0\xE3E8\xEDF3\xF2FC, \xE0 \xBFF5 \1\x8B\xF0EE\xEBB3\4 \xEDE5 \xE1F3\xE4F3\xF2FC \xEFE5\xF0E5\xE4E0\xEDB3 \xB3ED\xF8E8\xEC \xE3F0\xE0E2\xF6FF\xEC;",
			"  - \1\x82Герої\4 не залишають \1\x84Смарагд шерифа\4 по своїй смерті.",
			"\n* На початку раунду гравців з \1\x8Bролями\4 \1\x85Вбивць\4 та \1\x84Шерифів\4 може бути декілька, в залежності від кількості присутніх людей у грі. Гравці які мають одну і ту саму \1\x8Bроль\4 утворюють \1\x8Aкоманду\4 (\1\x83Цивільні\4 не вважаються за команду).",
			"\1\x8AЧлени команди\4 можуть спілкуватися між собою за допомогою команди \1\x87SAYTEAM\4 у консолі (кнопка SAYTEAM працює так само, як і звичайна кнопка чату) або розпочавши повідомлення символом \1\x88%\4 який автоматично надсилає повідомлення усім членам команди.",
			"Якщо ви випадково заатакуєте \1\x8Aпартнера в команді\4, обидва гравці отримають персональне попередження. Будьте обережні - така командна помилка може розкрити вашу \1\x8Bроль\4 іншим!"
		},
		{
			"\1\x87Чого слід уникати в \1\x85Таємниці Вбивства\n",
			"\n* Виказування своєї \1\x8Bролі\4 - руйнація таємниці у \1\x85\"Таємниці Вбивства\"\4. Розказувати про свою \1\x8Bроль\4 усім іншим суворо заборонено. Можна лише говорити про \1\x8Bролі\4 інших гравців коли йдеться про розслідування.",
			"\n* Не набридайте іншим гравцям та \"не судіть по обкладинці\". Ніхто не буде вам вірити коли ви будете звинувачувати усіх у вбивстві та/або ображати.",
			"\n* Безактивність (AFK) дуже сильно впливає на події гри. В деяких випадках безактивність навіть карається вижененням з гри.",
			"\n* Зміна імені гравця у мертвому стані вважається чітом і карається вижененням з гри (бо можна передати інформацію живим гравцям). Аби безпечно змінити ім'я варто спершу вийти з гри, змінити ім'я, а вже потім знову зайти у гру.",
			"\n* Якщо ви граєте за \1\x85Вбивцю\4, уникайте перебування біля \1\x84Смарагду Шерифа\4. Перебуваня біля смарагду протягом 30 секунд призведе до виженення з гри.",
			"\nПорушення одного з цього правил призводить до виженення (kick) або бану від Адміністраторів гри. Будь ласка, грайте чесно і не руйнуйте іншим \"таємниці\" гри!"
		},
		{
			"\1\x87Список порад\n",
			"Ми зібрали для вас декілька порад які можуть допомогти вам у вашому розслідуванні:",
			"\n* В залежності від параметрів гри виставлені Адмінінтратором можна затиснути клавішу \1\x87SPIN\4 для підкрадання. Підкрадання дозволяє вам ходити навколо без шуму та слідів (а також інші тихі речі);",
			"\n* \1\x83Цивільним\4 можна наперед збирати зброю та кільця аби потім, коли отримає \1\x8Bроль \1\x84Шерифа\4 або дістане \1\x84смарагд\4, міг з впевненістю йти у бій;",
			"\n* Використовуйте команду \1\x87SAYTEAM\4 аби координувати свої дії з вашими \1\x8Aтоваришами по команді\4 та уникати дружнього вогню. Якщо почати повідомлення з символа \1\x88%\4 воно надішле повідомлення усім членам вашої команди.",
			"\n* Якщо вас викрили ви завжди можете змінити колір свого персонажу аби вас важче було впізнати;",
			"\n* Клавіша\1\x87 FIRENORMAL\4 активує \1\x86ніж\4 коли ви маєте для нього кільця. Якщо ви підкрадаєтесь то \1\x86ніж\4 не робить звуків атаки узагалі."
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
