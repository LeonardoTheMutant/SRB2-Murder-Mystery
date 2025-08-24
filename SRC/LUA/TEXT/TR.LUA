-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- TURKISH
-- Made by Mobillia

MM.AddLang("TR", {
	["VERSION"]="1.3",
	["AUTHOR"]="Mobillia",
	["CHAT_MMLANG"]={
		"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola \x87MMLANG [dil] \x80komutunu yazarak degistirebilirsiniz", -- cCc
		"Murder Mystery icin kisisel dil \x82Turkce\x80 olarak ayarlanmistir" -- cCc
	},
	["CHAT_ROLEGET_PM"]={
		"Sen \x85Katil\x80'sin! \x85Herkesi oldur!", 
		"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.", 
		"Sen bir\x83Masum\x80'sun! Saklan ve sorusturmaya yardim et." 
	},
	["CHAT_NEWROLEGET_PM"]={
		"\x87Hayat rastgele karar verdi, \x85Katil\x87 olacaksin.\x85 Simdi git herkesi oldur!",
		"Evren\x87 seni bir \x84Serif\x87 yapti! Git ve\x84 tum Katilleri\x87 ortadan kaldir!", 
		"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!",
		"\x87\x85Katillerden\x87 birini ortadan kaldirdiniz! \x82Kahramanliga\x87 terfi edildiniz!"
	},
	["CHAT_TEAMMATEHIT_PM"]={
		"Bu oyuncu senin takim arkadasin. Lutşn bir dahaki seşre takim arkadaslariniza vurmayin.",
		"Bir takim arkadasiniz size vurdu. Ondan intikam almayi planlamayin."
	},
	["CHAT_MURDKILLED"]={
		"\x85Katil",
		"\x80olduruldu"
	},
	["CHAT_SHERIKILLED"]={
		"\x84Serif",
		"olduruldu!",
		"Onun\x84 Zumrut\x80'unu bulun!"
	},
	["CHAT_HEROKILLED"]={
		"\x82Kahraman",
		"olduruldu!" 
	},
	["CHAT_DIEDHAZARD"]="bir kazada oldu.",
	["CHAT_SHREMDPICKUP"]="Birisi \x84Serif'in Zumrutu\x80'nu aldi...",
	["CHAT_KILLPUNISHMENT_PM"]={
		"Bir\x87 \x83Masum\x87'u oldurdun! Kovuldun. (Artik bir Serif degilsin)",
		"\x82Kahramanlar\x87 \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin olum cezasi aldiniz.",
		"\x87Oh hayir! Bir \x84Serif\x87'i oldurdun!!! Bunun icin olum cezasi aldin",
		"\x87Senin gibi \x83Masum\x87 bir oyuncuyu oldurdun! Bunun icin olum cezasi aldin",
		"\x87Oh hayir! Bir \x82Kahraman\x87'i oldurdun! Bunun icin olum cezasi aldin"
	},
	["CHAT_INNOHURT"]={
		"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
		"\x82Kahraman\x87, Masum'u oldurerek kotu adam olmaya karar verdi. Şimdi ikisi de olu yatiyor. Boyle bir kahramana yaziklar olsun"
	},
	["CHAT_ONEQUIT"]={
		"\x85Katillerden\x80 biri cikti!",
		"\x84Seriflerden\x80 biri cikti!!!",
		"\x82Kahramanlardan\x80 biri bizi terk etti!"
	},
	["CHAT_LASTQUIT"]={
		"Son \x85Katil\x80 cikti!",
		"Son \x84Serif\x80 cikti!",
		"Son \x82Kahraman\x80 cikti!"
	},
	["CHAT_REPLACEQUIT"]={
		"\x85Katil\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
		"\x84Serif\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
		"Bir \x82Kahraman\x80 cikti! Rastgele bir\x83 Masum\x80 onun rolunu ustlenecek!"
	},
	["CHAT_ENDROUND"]={
		"Herkes oldu. \x85Katiller\x80 kazandi!",
		"Tum \x85Katiller\x80 olduruldu! \x83Masumlar\x80 kazandi!",
		"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84Serif\x80'e yaziklar olsun",
		"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
		"\x83Masum\x80larin savunuculari oldu. \x85Katiller\x80 kazandi!"
	},
	["BMP_VICTIMS"]={
		"\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1FFF\xFFIIIII\31",
		"\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\31",
		"\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFIII\xFFFF\xFFIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"\xFFIIII\xFFIIII\x1FFFII\x1FFFII\x1FFFIII\x1F1F\x1F1F\xFFII\x1FFFII\x1FFFIIII\xFFIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\xFFIIIIIIIII\x1FFFIIIIII\x1FFF\x1FIII\x1FFF\xFFFFII\x1FFFII\x1FFFIIIIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"IIIIIIIII\x1FFFIIIIII\x1FFF\xFF1FIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"II\x1FIII\x1FII\x1FFFII\x1F1FII\x1FFF\xFFFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1FIII\x1FII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1FII\x1FFFII\x1F1FII\31",
		"II\x1F1FI\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FI\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFF\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\x1FFF\xFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"II\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFF\x1FIIII\x1F1F\xFF1FIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\31",
		"\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\x1F1F\x1F1F\x1FFF\xFFFF\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\31"
	},
	["BMP_SUSPECTS_INFO"]={yoff=2},
	["BMP_SUSPECTS"]={
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\31",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F",
		"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFF1FIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1F1F\x1FIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFFFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"II\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"\x1FIIII\x1FFF\xFF1FIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"\xFF1F\x1FI\x1FFF\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\31",
		"\xFFFF\xFF1F"
	},
	["BMP_TIME"]={
		"\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFIIIIII\31",
		"\xFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1F1FII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFF\xFFFFII\x1F1F\31",
		"\xFFIII\x1F1F\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFF1FIII\x1FFF\xFFFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\31",
		"\xFF1FIII\x1FFF\xFFIIIIII\x1FFFIIIIII\x1FFF\xFFFFII\31",
		"\xFFFF\x1FIII\x1FFFII\x1F1FII\x1FFFII\x1F1FII\x1FFF\xFFFFII\31",
		"II\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\31",
		"IIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\31",
		"\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\31"
	},
	["BMP_RINGS_INFO"]={yoff=2},
	["BMP_RINGS"]={
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\31",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFF1FIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\31",
		"\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\31",
		"\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\31",
		"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"IIIII\x1F1F\xFF1FIIII\x1F1F\xFFIIIIII\x1FFF\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\31",
		"\x1F1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\31"
	},
	["HUD_MM"]="Murder Mystery", 
	["HUD_ROLES"]={
		"KATİL",
		"ŞERİF",
		"MASUM",
		"KAHRAMAN",
		"ÖLÜ"
	},
	["HUD_SUSPECTS"]="Şüphelíler",
	["HUD_VICTIMS"]="Masumlar",
	["HUD_TEAMMATES"]="Takım arkadaşları",
	["HUD_KILLEDBY"]={
		"Ölmenin sebebi:",
		"adalet",
		"tuzak"
	},
	["HUD_SCORESTAB"]={
		"Oyun türünde yeniyseniz konsola",
		"\1\x87MMHELP\4 yazın.",
		"Buradaki dili değiştirmek için",
		"\1\x87MMLANG\4 komutunu kullanın",
		"",
		"",
		"\1\x82İyi eğlenceler!"
	},
	["HUD_ROLETARGET"] = {
		"",
		"",
		"",
		""
	},
	["HUD_ROLESALIVE"]={
		"Katiller",
		"Şerifler",
		"Masumlar"
	},
	["HUD_DEAD"]={
		"\1\x8FÖldün",
		"Yeninden doğamaz veya",
		"ölmemiş insanlar ile konuşamazsın"
	},
	["HUD_MIDJOIN"]={
		"\1\x84Tur ortasında\4 katıldınız, lütşn bu turun bitmesini bekleyin.",
		"Beklerken lütşn \1\x87MMHELP\4 konsol komutundaki oyun kurallarını okuyunuz."
	},
	["HUD_ALONE"]={
		"Oyunun başlaması için en az \1\x84".."2 oyuncu\4",
		"gereklidir, Lütşn\1\x84 bir oyuncunun\4 daha",
		"gelmesini bekleyin"
	},
	["HUD_SNEAKING"]="Sinsice...",
	["HUD_SHOWDOWN"]="Hesaplaşma düellosu!",
	["HUD_MINIGAME"]={
		["PRESS"]="\1\x82 CUSTOM3\4'e bas ve",
		["LEAVE"]="ayrıl",
		["CANCEL"]="iptal",
		["SPECTATE"]="seyret",
		["DUEL"]="bir mini oyun düellosu",
		["REQUEST"]="bir \1\x87PONG\4 oyunu talep edin",
		["START"]="bir \1\x87\"SONIC RUN\"\4 oyunu başlat",
		["ACCEPT"]="\1\x87PONG\4 meydan okumasını kabul et!",
		["WAIT"]="Rakibin kabul etmesi bekleniyor...",
		["SPECTATING"]="Bir düello izleniyor...",
		["BORED"]="Sıklındın mı?",
		["GOAL"]="Gol!"
	},
	["HUD_YOU"]="SEN",
	["HUD_WINNERS"]="Kazananlar:",
	["HUD_WIN"]={
		"BERABERE!",
		"\1\x85KATİLLER",
		"\1\x83MASUMLAR"
	},
	["HUD_PAST"]="GEÇMİŞ",
	["HUD_FUTURE"]="GELECEK",
	["HUD_MMHELP_UI"]={
		"Kaydırmak ıçın \1\x87JUMP\4/\1\x87SPIN\4 kullanın, sayfalar arası geçiş yapmak ıçın \1\x87Next\4/\1\x87Prev Weapon\4 kullanın",
		"HELP'den ayrılmak için\1\x87 CUSTOM1\4'a basın"
	},
	["HUD_MMHELP"]={
		{
			"\1\x87Murder Mystery'e hoşgeldiniz!",
			"\1\x87Popüler \1\x87çok oyunculu oyunun \1\x87SRB2 yorumu!\4\n",
			"Oyunun amacı, diğer herkes\4 ölmeden\1\x83 önce tüm \1\x85Katiller\4'i bulup ortadan kaldırmaktır. Bu oyun türü daha çok MATCH'a benzer, bu yüzden bu oyun türü için nişan alma ve atış becerilerinize ihtiyacınız olacak.",
			"Oynamaya başlamadan önce bazı temel bilgileri öğrenmeniz gerekiyor...",
			"\nHer turun başında, oyun sırasındaki görevinizi belirleyen bir rol atanacaktır. Alabileceğiniz olası roller şunlardır:",
			" * \1\x85Katil\4 - Ölümcül bir suçlu. Onların görevi herkesi ortadan kaldırmaktır.",
			" * \1\x84Şerif\4  - \1\x85Katil(ler)\4i bulmak ve ortadan kaldırmakla görevlidir.",
			" * \1\x83Masum\4 - Öldürülmekten kaçınmalı ve \1\x85Katilin\4 kimliğinin belirlenmesine yardımcı olmalıdır. Oyun kurulumuna bağlı olarak, 100 yüzük (veya belirli karakterler için 50 yüzük) toplayarak kendilerini savunmak için bir \1\x85Kırmızı Yüzük\4 elde edebilirler.",
			"\nOynamaya başlamak için gereken tüm temel bilgiler budur, daha fazla bilgi için bu kılavuzu sonuna kadar okuyun",
			"\nHUD arayüzünün dilini ve bu kılavuzu tercih ettiğiniz dile değiştirmek için \1\x87MMLANG\4 komutunu kullanın."
		},
		{
			"\1\x87Oynanış durumları hakkında\4\n",
			"Temel bilgilerde daha önce açıklandığı gibi, Şeriflerin amacı tüm \1\x85Katil(ler)\4'i ortadan kaldırmaktır, ancak farklı oyun durumları ortaya çıkabilir:",
			"\n* Eğer Ölürseniz,\1\x8F Ölü\4 durumuna girersiniz. Bu durumdaki oyuncular yeniden doğamaz veya hala hayatta olan oyuncularla küresel olarak konuşamaz, mesajları yalnızca diğer\1\x8F ölü\4 oyuncular tarafından görülebilir.",
			"\1\x8F Ölü\4 iken hala hayatta olan oyuncularla konuşamazsın ve /PM yapamazsınız.",
			"Kırıcılar, çukurlara düşme veya suda boğulma gibi harita tehlikelerinden ölmek de sizi turun geri kalanında \1\x8FÖlü\4 yapacaktır.",
			"Ayrıca\1\x82KENDİNİZİ YENİDEN ADLANDIRMAYA ÇALIŞMAYIN\4, bununla ilgili daha fazla ayrıntı diğer sayfada.",
			"\n* \1\x84Şerif'in\4 görevi, etraftaki tüm \1\x85Katiller\4'i ortadan kaldırmaktır, ancak kazara bir \1\x83Masum\4'u vurmaları mümkündür.",
			"Eğer bir \1\x84Şerif\4 \1\x83Masum\4u vurursa , rollerini kaybedecekler ve \1\x83Masum\4 olacaklar: Rastgele bir \1\x83Masum\4 daha sonra sessizce \1\x84Şerif\4'in rolünü üstlenecektir. Tetiği çekmeden önce iki kez düşünün!",
			"\n* Bir \1\x85Katil\4, hala hayatta olan \1\x83Masum\4lar varken bir \1\x84Şerif\4'i öldürürse, \1\x84Şerif'in Zümrütü\4 cesedinin yanına düşecektir.",
			"Bir \1\x83Masum\4, \1\x84Şerif'in Zümrütü\4'nü aldığında, bir \1\x82Kahraman\4 olurlar. \1\x82Kahraman\4lar \1\x84Şerif\4lere benzer, ancak bazı farklılıklarla birlikte gelir:",
			"  - Bir \1\x82Kahraman\4 bir \1\x83Masum\4u öldürürse, her ikisi de ölür ve rolleri yeniden atanmaz;",
			"  - \1\x82Kahramanlar\4 öldükten sonra \1\x84Şerif'in Zümrütü\4'nü düşrmezler.",
			"Oyuncu sayısının daha yüksek olduğu turlarda birden fazla \1\x85Katil\4ler ve \1\x84Şerif\4ler olabilir. Bu turlar için \1\x85Katil\4ler ve \1\x84Şerif\4'den oluşan \1\x8ATakım\4lar oluşturulur.",
			"\1\x8ATakım arkadaşları\4, konsoldaki \1\x87SAYTEAM\4 komutunu kullanarak (SAYTEAM düğmesi normal sohbet düğmesiyle aynı şekilde çalışır) veya mesajı otomatik olarak ekip üyelerine gönderen \1\x88%\4 simgesiyle bir mesaj başlatarak birbirleriyle sohbet edebilirler.",
			"Yanlışlıkla bir \1\x8ATakım arkadaşı\4 saldırırsanız, her iki oyuncu da kişisellştirilmiş bir uyarı alır. Dikkatli olun - bu tür ekip etkileşimleri başkalarına \1\x8Brol\4'lerinizi ifşa edebilir!"
		},
		{
			"Murder \1\x87Mystery\4'de yapılması kötü olan \1\x87şeyler\4\n",
			"Kural 1: \1\x82Nazik olun ve\1\x82 eğlenin!\4 İşte bazı ek yönergeler:",
			"\n* \1\x8ARol\4'ün kendini şımartması oyunu bir 'gizem' yapmaz, eğer eminseniz başkasının rolünü söyleyebilirsiniz, ancak kendinizinkini asla söylemeyin.",
			"\n* Diğer oyunculara hakaret etmekten kaçının. Arkadaşça şakalar iyidir, ancak sürekli suçlamalar veya düşmanca davranışlar başkalarının size güvenmemesine neden olur.",
			"\n* AFK olmayın. Çok uzun süre hareketsiz kalırsanız, üzerinize bir bomba atılacak ve oyundan çıkarılacaksınız.",
			"\n* Ölüyken bir tur sırasında kendinizi yeniden adlandırmayın, bunu yapmak sizi sunucudan atacaktır. Hayattaysanız yeniden adlandırabilirsiniz. Aranın güvenli bir şekilde yeniden adlandırılmasını bekleyin.",
			"Eğer bir \1\x85Katil\4 iseniz \1\x84Şerif'in Zümrütü\4 çevresinde kamp yapmaktan kaçının. Zümrütün yanında 30 saniye durmak, oyundan atılmanıza neden olacaktır.",
			"\nBu kurallardan birini ihlal etmek, oyundan atılma veya bazı durumlarda Yönetici tarafından yasaklanma ile sonuçlanabilir. Adil oynayın ve eğlenin!"
		},
		{
			"\1\x87Faydalı ipuçları\4\n",
			"Murder Mystery'deki oyununuz sırasında size yardımcı olabilecek bazı ipuçları topladık:",
			"\n* Karakter yetenekleri yönetici tarafından devre dışı bırakılırsa, iz birakmadan veya gürültü yapmadan gizlice dolaşmak için \1\x87SPIN\4 tuşuna basın;",
			"\n* \1\x84Şerif'in Zümrütü\4'nü aldığınızda, önceden topladığınız tüm silahlara ve yüzüklere erişebileceksiniz;",
			"\n* \1\x87SAYTEAM\4 komutunu kullanarak \1\x8Atakım arkadaşı\4'ınızın kim olduğunu bulmak, onları vurmaktan kaçınmanızı ve yanlışlıkla rolünüzü ortaya çıkarmanızı sağlayacağı için yardımcı olacaktır;",
			"\n* 3 saniyeliğine ölümsüzlük kazanmak için lav, dikenler ve ateş gibi engellerden zarar alabilirsiniz;",
			"\n* Haritada saklanacak bir yer aramaya çalışın. Bazen istenmeyen tanıtımlardan kurtulmaya yardımcı olur;",
			"\n* Rolünüz sızdırılırsa, kendinizi yeniden adlandırabilir ve/veya ten rengini değiştirebilirsiniz. \1\x82Yeniden adlandırmanızın sohbette gösterileceğini unutmayın\4;",
			"\n* Yüzükleriniz olduğu sürece\1\x86 Bıçak\4'ı her yerde kullanmak için\1\x87 FIRENORMAL\4 düğmesini kullanın.\1\x86 Bıçak\4 kullanırken gizlice girmek, saldırınızın sessiz olmasını sağlar.",
			"\n* HUD arayüzünün dilini tercih ettiğiniz dile değiştirmek için \1\x87MMLANG\4 komutunu kullanın."
		}
	}
})
