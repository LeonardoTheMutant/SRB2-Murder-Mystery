-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- TURKISH
-- Made by Mobillia

MM.AddLang("TR", {
    ["VERSION"]="1.0-ALPHA", 
	["AUTHOR"]="Mobillia", 
	["MM"]="Murder Mystery", 
	["CHARSET"]="1254C", --Windows1254
	["MMHELP_CMD"]={
		"Kayd\xFDrmak \xFDE7\xFDn \23JUMP\16/\23SPIN\16 kullan\xFDn, sayfalar aras\xFD ge\xE7i\xFE yapmak \xFDE7\xFDn \23Next\16/\23Prev Weapon\16 kullan\xFDn",
		"HELP'den ayr\xFDlmak i\xE7in \23FIRE\16'a bas\xFDn"
	},
    ["MMHELP"]={
		{
			"\23Murder Mystery'e ho\xFEgeldiniz!",
			"\23Pop\xFCler \23\xE7ok oyunculu oyunun \23SRB2 yorumu!\16\n",
			"Oyunun amac\xFD, di\xF0".."er herkesi\16 \xF6ld\xFCrmeden\19 \xF6nce t\xFCm \21Katiller\16'i bulup ortadan kald\xFDrmakt\xFDr. Bu oyun t\xFCr\xFC daha \xE7ok MATCH'a benzer, bu nedenle bu oyun t\xFCr\xFC i\xE7in ni\xFE".."an alma ve at\xFDFE becerilerinize ihtiyac\xFDn\xFDz olacak.",
			"Oynamaya ba\xFElamadan \xF6nce baz\xFD temel bilgileri \xF6F0renmeniz gerekiyor...",
			"\nHer t\xFCr\xFC".."n ba\xFE".."\xFD".."nda, oyun s\xFD".."ras\xFD".."ndaki g\xF6revinizin ne oldu\xF0".."unu tan\xFD".."mlayan bir \26Rol\16 alacaks\xFD".."n\xFD".."z. \xDD".."\xFE".."te alabilece\xF0".."iniz 3 olas\xFD \26Roller\16:",
			" * \21Katil\16 - Ger\xE7".."ek bir su\xE7".."ludur. Herkesi \xF6".."ld\xFC".."rmek zorundalar, ancak sadece B\xFD".."\xE7".."ak ve K\xFD".."rmizi Y\xFC".."z\xFC".."klerle donat\xFD".."lm\xFD".."\xFE".."lard\xFD".."r;",
			" * \20\xDE".."erif\16  - G\xF6".."revleri, \21Katil(ler)\16'i bulmak ve ortadan kald\xFD".."rmakt\xFD".."r. \xDE".."erifler haritada bulunan her silah y\xFC".."z\xFC".."klerini kullanabilir;",
			" * \19Masum\16 - Tamamen silahs\xFD".."z siviller, \xF6".."ld\xFC".."r\xFC".."lmekten ka\xE7".."\xFD".."nmalar\xFD".." gerekir ama ayn\xFD".." zamanda \21Katil\16'i bulmaya da yard\xFD".."mc\xFD".." olmalar\xFD".." gerekir.",
			"\nOynamaya ba\xFE".."lamak i\xE7".."in gereken t\xFC".."m temel bilgiler budur, daha fazla bilgi i\xE7in bu k\xFDlavuzu sonuna kadar okuyun"
		},
        {
			"\23Oynan\xFDFE durumlar\xFD hakk\xFD".."nda\16\n",
			"Temel bilgilerde daha \xF6".."nce a\xE7".."\xFD".."kland\xFD".."\xF0".."\xFD".." gibi, \xDE".."eriflerin amac\xFD".." t\xFC".."m \21Katil(ler)\16'i ortadan kald\xFD".."rmakt\xFD".."r, ancak farkl\xFD".." oyun durumlar\xFD".." ortaya \xE7".."\xFD".."kabilir:",
			"\n* E\xF0".."er \xD6".."ld\xFC".."r\xFC".."l\xFC".."rseniz,\31 \xD6".."l\xFC".."\16 durumuna girersiniz. Bu durumdaki oyuncular yeniden do\xF0".."amaz veya hala hayatta olan oyuncularla k\xFC".."resel olarak konu\xFE".."amaz, mesajlar\xFD".." yaln\xFD".."zca di\xF0".."er\31 \xF6".."l\xFC".."\16 oyuncular taraf\xFD".."ndan g\xF6".."r\xFC".."lebilir.",
			"\31 \xD6".."l\xFC".."\16 iken hala hayatta olan oyuncularla konu\xFE".."amazs\xFD".."n ve /PM yapamazs\xFD".."n (\"sayto\" komutu ile).",
			"Ayr\xFD".."ca\18 \2KEND\xDD".."N\xDD".."Z\xDD".." \2YEN\xDD".."DEN \2ADLANDIRMAYA \2\xC7".."ALI\xDE".."MAYIN\16, bununla ilgili daha fazla ayr\xFD".."nt\xFD".." di\xF0".."er sayfada.",
			"\n* \20\xDE".."erif'in \16 g\xF6".."revi, etraftaki t\xFC".."m \21Katiller\16'i ortadan kald\xFD".."rmakt\xFD".."r, ancak kazara bir \19Masum\16'u vurmalar\xFD".." m\xFC".."mk\xFC".."nd\xFC".."r.",
			"E\xF0".."er bu ger\xE7".."ekle\xFE".."irse, \20\xDE".."erif\16 bir \19Masum\16'a d\xF6".."n\xFC".."\xFE".."ecek ve rastgele bir \19Masum\16 sinsice rol\xFC".."n\xFC".." \xFC".."stlenecektir. Bir dahaki sefere birini \20\xDE".."erif\16 olarak vurmak istedi\xF0".."inizde, o teti\xF0".."i \xE7".."ekmeden \xF6".."nce iki kez d\xFC".."\xFE".."\xFC".."n\xFC".."n!",
			"\n* Bir \21Katil\16, bir \20\xDE".."erif\16'i \xF6".."ld\xFC".."r\xFC".."rse ve hala \19Masum\16 hayatta kal\xFD".."rsa, \xDE".."erif \20\xDE".."erif'in Z\xFC".."mr\xFC".."t\xFC".."\16'n\xFC cesedinin yan\xFD".."na b\xFD".."rakacakt\xFD".."r.",
			"7 Kaos Z\xFC".."mr\xFC".."t\xFC".."'nun aksine, bu z\xFC".."mr\xFC".."t \18Kahraman\16 rol\xFC".."n\xFC".." onu alan herhangi bir \19Masum\16'a atayacak. \19Masumlar\16'dan biriyseniz, bu bir Kahraman olma ve herkesi \21Katil(ler)\16'den kurtarma \xFE".."ans\xFD".."n\xFD".."z!",
			"\18Kahraman\16 rol\xFC"..", \20\xDE".."erif\16'den baz\xFD".." detaylar d\xFD".."\xFE".."\xFD".."nda farkl\xFD".." de\xF0".."ildir, \xF6".."rne\xF0".."in \18Kahraman\16 bir \19Masum\16'u \xF6".."ld\xFC".."rd\xFC".."\xF0".."\xFC".."nde, rol\xFC".." payla\xFE".."\xFD".."lmaz ve her ikisi de \xF6".."l\xFC".."r. Bir Kahraman \xF6".."l\xFC".."m\xFC".."nde \20\xDE".."erif'in Z\xFC".."mr\xFC".."t\xFC".."\16 d\xFC".."\xFE".."meyecektir.",
			"\n* Oyuncu say\xFD".."s\xFD".."na ba\xF0".."l\xFD".." olarak, turdaki oyuncular aras\xFD".."nda birden fazla \21Katil\16 ve \20\xFE".."erif\16 olabilir. \xD6".."rne\xF0".."in, 7 ve daha fazla oyuncudan ba\xFE".."layarak, \21Katiller\19 ve \20\xDE".."erifler\16'den \26Tak\xFD".."mlar\16 olu\xFE".."turulacakt\xFD".."r.",
			"\26Tak\xFD".."m arkada\xFE".."lar\xFD\16, \23SAYTEAM\16 konsol komutuyla tak\xFD".."m sohbetlerinde birbirleriyle sohbet edebilir (SAYTEAM sohbet d\xFC".."\xF0".."mesinin normal sohbetle ayn\xFD".." \xFE".."ekilde \xE7".."al\xFD".."\xFE".."aca\xF0".."\xFD".."n\xFD".." unutmay\xFD".."n).",
			"E\xF0".."er bir \26Tak\xFD".."m arkada\xFE".."\xFD".."\16 ba\xFE".."ka bir tak\xFD".."m arkada\xFE".."\xFD".."na vurursa, her ikisi de birbirlerini tan\xFD".."malar\xFD".."n\xFD".." sa\xF0".."layacak ki\xFE".."iselle\xFE".."tirilmi\xFE".." bir uyar\xFD".." al\xFD".."r. Ba\xFE".."kalar\xFD".."n\xFD".."n 'arkada\xFE".."\xE7".."a' etkile\xFE".."iminizi g\xF6".."rebilece\xF0".."ini ve kim oldu\xF0".."unuzu anlayabilece\xF0".."ini unutmay\xFD".."n!"
		},
        {
			"Murder \23Mystery\16'de yap\xFD".."lmas\xFD k\xF6".."t\xFC".." olan \23\xFE".."eyler\16\n",
			"Herhangi bir oyunun 1 numaral\xFD".." kural\xFD"..": \1Nazik \1olun \1ve \1e\xF0".."lenin!\16 Bunun d\xFD".."\xFE".."\xFD".."nda...",
			"\n* \26Rol\16'\xFC".."n kendini \xFE".."\xFD".."martmas\xFD oyunu bir 'gizem' yapmaz, e\xF0".."er eminseniz ba\xFE".."kas\xFD".."n\xFD".."n rol\xFC".."n\xFC".." s\xF6".."yleyebilirsiniz, ancak kendinizinkini asla s\xF6".."ylemeyin.",
			"\n* Di\xF0".."er oyunculara hakaret etmeyin, \xFE".."akalara izin verilir, ancak yaln\xFD".."zca arkada\xFE".."\xE7".."a bir ruh hali i\xE7".."inde. Her oyuncuyu sebepsiz yere su\xE7".."larsan\xFD".."z kimse size g\xFC".."venmez.",
			"\n* AFK olmak bir sava\xFE".." su\xE7".."udur. Bombalar at\xFD".."lacak ve \xE7".."ok uzun s\xFC".."re hareketsiz kal\xFD".."rsan\xFD".."z varl\xFD".."\xF0".."\xFD".."n\xFD".."z sona erecektir.",
			"\n* \xD6".."l\xFC".."yken bir tur s\xFD".."ras\xFD".."nda kendinizi yeniden adland\xFD".."rmay\xFD".."n, bunu yapmak sizi sunucudan atacakt\xFD".."r. Hayattaysan\xFD".."z yeniden adland\xFD".."rabilirsiniz. Aran\xFD".."n g\xFC".."venli bir \xFE".."ekilde yeniden adland\xFD".."r\xFD".."lmas\xFD".."n\xFD".." bekleyin.",
			"\nBu kurallardan birini ihlal etmek, oyundan at\xFD".."lma veya baz\xFD".." durumlarda Y\xF6".."netici taraf\xFD".."ndan yasaklanma ile sonu\xE7".."lanabilir! L\xFC".."tfen onlar\xFD".." k\xFD".."rmay\xFD".."n ve adil oynay\xFD".."n."
		},
        {
			"\23Faydal\xFD ipu\xE7lar\xFD\16\n",
			"MM'deki oyununuz s\xFDras\xFDnda size yard\xFDmc\xFD olabilecek baz\xFD ipu\xE7lar\xFD toplad\xFDk:",
			"\n* Karakter yetenekleri y\xF6netici taraf\xFDndan devre d\xFDFE\xFD b\xFDrak\xFDl\xFDrsa, iz birakmadan veya g\xFCr\xFClt\xFC yapmadan gizlice dola\xFEmak i\xE7in \23SPIN\16 tu\xFEuna ba\xFEFDn;",
			"\n* \20\xDE".."erif'in \20Z\xFCmr\xFCt\xFC\16'n\xFC ald\xFDF0\xFDn\xFDzda, \xF6nceden toplad\xFDF0\xFDn\xFDz t\xFCm silahlara ve y\xFCz\xFCklere eri\xFE".."ebileceksiniz;",
			"\n* \23SAYTEAM\16 komutunu kullanarak \26tak\xFDm arkada\xFEFD\16'\xFDn\xFDz\xFDn kim oldu\xF0unu bulmak, onlar\xFD vurmaktan ka\xE7FDnman\xFDz\xFD ve yanl\xFDFEl\xFDkla rol\xFCn\xFCz\xFC ortaya \xE7FDkarman\xFDz\xFD sa\xF0layaca\xF0FD i\xE7in yard\xFDmc\xFD olacakt\xFDr;",
			"\n* 3 saniyeli\xF0ine \xF6l\xFCms\xFCzl\xFCk kazanmak i\xE7in lav, dikenler ve ate\xFE gibi engellerden zarar alabilirsiniz;",
			"\n* Haritada saklanacak bir yer aramaya \xE7".."al\xFDFE\xFDn. Bazen istenmeyen tan\xFDt\xFDmlardan kurtulmaya yard\xFDmc\xFD olur;",
			"\n* Rol\xFCn\xFCz s\xFDzd\xFDr\xFDl\xFDrsa, kendinizi yeniden adland\xFDrabilir ve/veya ten rengini de\xF0i\xFEtirebilirsiniz. \1Yeniden \1adland\xFDrman\xFDz\xFDn \1sohbette \1g\xF6sterilece\xF0ini \1unutmay\xFDn\0;",
			"\n* Gizlice girerseniz b\xFDE7".."ak sald\xFDr\xFD sesi \xE7FDkarmaz. Ayr\xFD".."ca,\18 FIRENORMAL\16 tu\xFEu, y\xFCz\xFCkleriniz oldu\xF0u s\xFCrece B\xFDE7".."a\xF0FD her yerde kullanman\xFDza izin verir (Masumlar\xFDn b\xFDE7".."a\xF0FD yoktur)"
		}
	},
    ["MMLANG"]={ -- Bundan sonra harfler Türkçe olarak çıkmıyor, Hüdapar çeviri diyeni gotten
		"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola \x87MMLANG [dil] \x80komutunu yazarak degistirebilirsiniz", -- cCc
		"Murder Mystery icin kisisel dil \x82Turkce\x80 olarak ayarlanmistir" -- cCc
	},
    ["ROLE_GET"]={
		"Sen \x85Katil\x80'sin! \x85Herkesi oldur!", 
		"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.", 
		"Sen bir \x83Masum\x80'sun! Saklan ve sorusturmaya yardim et." 
	},
    ["NEWROLE_GET"]={
		"\x87Hayat rastgele karar verdi \x85Katil\x87.\x85 Simdi git herkesi oldur!",
		"Evren\x87 seni bir \x84Serif\x87 yapti! Git ve\x84 tum Katilleri\x87 ortadan kaldir!", 
		"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!",
		"\x87\x85Katillerden\x87 birini ortadan kaldirdiniz! \x82Kahramanliga\x87 terfi edildin!"
	},
    ["TEAMMATE_HIT"]={
		"Bu oyuncu senin takim arkadasin. Lutfen bir dahaki sefere takim arkadaslariniza vurmayin.",
		"Bir takim arkadasiniz size vurdu. Ondan intikam almayi planlamayin."
	},
    ["MURD_KILLED"]={
		"\x85Katil\x87",
		"\x80olduruldu"
	},
    ["SHERI_KILLED"]={
		"\x84Serif\x87",
		"\x80olduruldu!",
		"Onun\x84 Zumrut\x80'unu bulun!"
	},
    ["HERO_KILLED"]={
		"\x82Kahraman\x87",
		"\x80olduruldu!" 
	},
    ["DIED_HAZARD"]="bir kazada oldu",
	["SHREML_PICK"]="Birisi \x84Serif'in Zumrutu\x80'nu aldi...",
	["KILL_PUNISHMENT_PM"]={
		"Bir\x87 \x83Masum\x87'u oldurdun! Kovuldun. (Artik bir Serif degilsin)",
		"\x82Kahramanlar\x87, \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin idam cezasi aldiniz.",
		"\x87Oh hayir! Bir \x84Serif\x87'i oldurdun!!! Bunun icin olum cezasi aldin",
		"\x87Senin gibi \x83Masum\x87 bir oyuncuyu oldurdun! Bunun icin olum cezasi aldin",
		"\x87Oh hayir! Bir \x82Kahraman\x87'i oldurdun! Bunun icin olum cezasi aldin"
	},
    ["INNO_HURT"]={
		"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
		"\x82Kahraman\x87, Masum'u oldurerek kotu adam olmaya karar verdi. Şimdi ikisi de olu yatiyor. Boyle bir kahramana yaziklar olsun"
	},
    ["ONE_LEFT"]={
		"\x85Katillerden\x80 biri kaldi!",
		"\x84Seriflerden\x80 biri kaldi!!!",
		"\x82Kahramanlardan\x80 biri bizi terk etti!"
	},
    ["LAST_LEFT"]={
		"Son bir \x85Katil\x80 kaldi!",
		"Son bir \x84Serif\x80 kaldi!",
		"Son bir \x82Kahraman\x80 kaldi!"
	},
    ["REPLACE_LEFT"]={
		"\x85Katil\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
		"\x84Serif\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!",
		"Bir \x82Kahraman\x80 cikti! Rastgele bir \x83Masum\x80 onun rolunu ustlenecek!"
	},
    ["ENDROUND"]={
		"Herkes oldu. \x85Katiller\x80 kazandi!",
		"Tum \x85Katiller\x80 olduruldu! \x83 Masumlar\x80 kazandi!",
		"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84Serif\x80'e yaziklar olsun",
		"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
		"\x83Masumlarin savunuculari\x80 oldu. \x85Katiller\x80 kazandi!"
	},
    ["BMP_VICTIMS"]={
		"\xFFII\x1FFF\xFFFF\xFFII\x1FFF\xFFIIII\x1FFF\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFIIII\x1FFF\xFFIIIII\x1F",
		"\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F",
		"\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\xFF\xFF\xFFIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
		"\xFFIIII\xFFIIII\x1F\xFFII\x1F\xFFII\x1F\xFFIII\x1F\x1F\x1F\x1F\xFFII\x1F\xFFII\x1F\xFFIIII\xFFIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
		"\xFFIIIIIIIII\x1F\xFFIIIIII\x1F\xFF\x1FIII\x1F\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIII\x1F",
		"IIIIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\x1FIII\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFIIIIIIIII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFIIIIII\x1F\xFFIIIII\x1F",
		"II\x1FIII\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFF\x1FIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1FIII\x1FII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F",
		"II\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\x1FI\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
		"II\x1F\xFF\x1F\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFF\x1F\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
		"II\x1F\xFF\xFF\xFF\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\x1FIIII\x1F\x1F\xFF\x1FIIII\x1F\x1F\xFFII\x1F\xFF\xFF\xFF\xFFII\x1F\xFFIIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F",
		"\x1F1F\x1FFF\xFFFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\xFF\x1F\x1F\x1F\x1F\x1F\xFF\xFF\x1F\x1F\x1F\xFF\xFF\xFF\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\x1F\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F\xFF\x1F\x1F\x1F"
	},
    ["BMP_SUSPECTS_INFO"]={yoff=2},
	["BMP_SUSPECTS"]={
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1F",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFF\xFF1F\x1F1F\xFF1F\x1F1F\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\xFF1F\x1F1F",
		"\xFFFFIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
		"\xFFIII\x1F1F\x1FFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"\xFF1FIII\x1FFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFF1FIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1F1F\x1FIIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFFFF\x1FIII\x1FFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\xFFFFII\x1FFFII\x1FFFII\x1F1F\x1F1F\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
		"II\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"IIIIII\x1FFFIIIIII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"\x1FIIII\x1FFF\xFF1FIIII\x1F1F\xFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"\xFF1F\x1FI\x1FFF\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F",
		"\xFFFF\xFF1F"
	},
    ["BMP_TIME"]={
		"\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFF\xFFIIII\x1F\xFF\xFFIIIIII\x1F",
		"\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F\xFFIIIIII\x1F",
		"\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFFII\x1F\x1F\x1F",
		"\xFFIII\x1F\x1F\x1F\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
		"\xFF\x1FIII\x1F\xFF\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F",
		"\xFF\x1FIII\x1F\xFF\xFFIIIIII\x1F\xFFIIIIII\x1F\xFF\xFF\xFFII\x1F",
		"\xFF\xFF\x1FIII\x1F\xFFII\x1F\x1FII\x1F\xFFII\x1F\x1FII\x1F\xFF\xFF\xFFII\x1F",
		"II\x1F\x1FII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
		"IIIIII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFFII\x1F\xFF\xFF\xFFII\x1F",
		"\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFFII\x1F",
		"\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\x1F1F\x1F"
	},
    ["BMP_RINGS_INFO"]={yoff=2},
	["BMP_RINGS"]={
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1FFF\xFFFF\xFFFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"\xFFFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\xFFFF\xFFFF\xFFFF\xFFFF\x1F1F\x1FFF\x1F1F\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIIII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\x1F1F\x1F1FII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
		"\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFIII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"\xFFIIIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFF1FIIII\x1FFFII\x1FFFII\x1FFF\xFFFFIII\x1FFF\xFFII\x1FFFII\x1FFFIIIII\x1FFF\xFFII\x1FFF\xFFFF\xFFFFIIIIII\x1FFFIIIII\x1F",
		"\xFFFF\x1F1FII\x1FFFII\x1FFFII\x1FFF\xFFIII\x1FFF\xFFFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1F1F\x1F1F\x1FFFII\x1F1FII\x1F",
		"\xFFFF\xFFFFII\x1FFFII\x1FFFII\x1FFFIII\x1FFF\xFFFF\xFFII\x1FFFII\x1FFFII\x1FFFII\x1FFFII\x1FFF\xFFFF\xFFFFII\x1FFF\xFFFF\xFFFFII\x1FFFII\x1F",
		"IIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"IIIII\x1F1F\xFF1FIIII\x1F1F\xFFIIIIII\x1FFF\x1FIIII\x1F1F\xFFII\x1FFFII\x1FFFIIIIII\x1FFFIIIIII\x1FFFII\x1FFFII\x1F",
		"\x1F1F\x1F1F\x1F1F\xFFFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1F1F\x1F1F\x1FFF\xFF1F\x1F1F\x1F1F\xFFFF\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1F1F\x1F1F\x1FFF\x1F1F\x1FFF\x1F1F\x1F"
	},
    ["HUD_ROLES"]={
		"KAT\xDDL",
		"\xDE".."ER\xDD".."F",
		"MASUM",
		"KAHRAMAN",
		"\xD6L\xDC"
	},
    ["HUD_TEAMMATES"]="Tak\xFDm arkada\xFElar\xFD",
	["HUD_KILLBY"]="\xD6lmenin sebebi:",
	["HUD_STUPID"]="senin aptall\xFDF0\xFDn",
	["HUD_SCORESTAB"]={
		"Oyun t\xFCr\xFCnde yeniyseniz konsola",
		"\23MMHELP\16 yaz\xFDn.",
		"Buradaki dili de\xF0i\xFEtirmek i\xE7in",
		"\23MMLANG\16 komutunu kullan\xFDn",
		"",
		"",
		"\2\xDDyi e\xF0lenceler!"
	},
    ["HUD_ROLESALIVE"]={
		"Katiller",
		"\xDE".."erifler",
		"Masumlar"
	},
    ["HUD_DEAD"]={
		"\31\xD6ld\xFCn",
		"Yeninden do\xF0".."amaz veya",
		"\xF6lmemi\xFE insanlar ile konu\xFE".."amazs\xFDn"
	},
    ["HUD_MIDJOIN"]={
		"\20Tur ortas\xFDnda\16 kat\xFDld\xFDn\xFDz, l\xFCtfen bu turun bitmesini bekleyin.",
		"Beklerken l\xFCtfen \23MMHELP\16 konsol komutundaki oyun kurallar\xFDn\xFD okuyunuz."
	},
    ["HUD_ALONE"]={
		"Oyunun ba\xFElamas\xFD i\xE7in en az \20".."2 oyuncu\16",
		"gereklidir, L\xFCtfen \20bir oyuncunun\16 daha",
		"gelmesini bekleyin"
	},
    ["HUD_SNEAKING"]="Sinsice...",
	["HUD_SHOWDOWN"]="Hesapla\xFEma d\xFC".."ellosu!",
	["HUD_MINIGAME"]={
		["PRESS"]="\18 CUSTOM3\16'e bas ve",
		["LEAVE"]="ayr\xFDl",
		["CANCEL"]="iptal",
		["SPECTATE"]="seyret",
		["DUEL"]="bir mini oyun d\xFC".."ellosu",
		["REQUEST"]="bir \23PONG\16 oyunu talep edin",
		["START"]="bir \23\"SONIC RUN\"\16 oyunu ba\xFElat",
		["ACCEPT"]="\23PONG\16 meydan okumas\xFDn\xFD kabul et!",
		["WAIT"]="Rakibin kabul etmesi bekleniyor...",
		["SPECTATING"]="Bir d\xFC".."ello izleniyor...",
		["BORED"]="S\xFDkl\xFDnd\xFDn m\xFD?",
		["PONGBALL"]="Seyirciler topun y\xF6n\xFCn\xFC de\xF0i\xFEtirebilir"
	},
    ["HUD_YOU"]="SEN",
	["HUD_WINNERS"]="Kazananlar:",
	["HUD_WON"]="kazand\xFD!",
	["HUD_WIN"]={
		"BERABERE!",
		"\21KAT\xDDLLER",
		"\19MASUMLAR"
	},
    ["HUD_PAST"]="GE\xC7M\xDD\xDE",
	["HUD_FUTURE"]="GELECEK"
})