-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- TURKISH
-- Made by Mobillia

MM.AddLang("TR", {
    ["VERSION"]="1.0", 
	["AUTHOR"]="Mobillia", 
	["MM"]="Murder Mystery", 
	["CHARSET"]="1254C", --Windows1254
	["MMHELP_CMD"]={
		"Kayd\xFDrmak \xFDE7\xFDn \23JUMP\16/\23SPIN\16 kullan\xFDn, sayfalar aras\xFD ge\xE7i\xFE yapmak \xFDE7\xFDn \23Next\16/\23Prev Weapon\16 kullan\xFDn",
		"HELP'den ayr\xFDlmak i\xE7in \23CUSTOM1\16'a bas\xFDn"
	},
    ["MMHELP"]={
		{
			"\23Murder Mystery'e ho\xFEgeldiniz!",
			"\23Pop\xFCler \23\xE7ok oyunculu oyunun \23SRB2 yorumu!\16\n",
			"Oyunun amac\xFD, di\xF0".."er herkes\16 \xF6lmeden\19 \xF6nce t\xFCm \21Katiller\16'i bulup ortadan kald\xFDrmakt\xFDr. Bu oyun t\xFCr\xFC daha \xE7ok MATCH'a benzer, bu y\xFCzden bu oyun t\xFCr\xFC i\xE7in ni\xFE".."an alma ve at\xFDFE becerilerinize ihtiyac\xFDn\xFDz olacak.",
			"Oynamaya ba\xFElamadan \xF6nce baz\xFD temel bilgileri \xF6F0renmeniz gerekiyor...",
			"\nHer turun ba\xFEFDnda, oyun s\xFDras\xFDndaki g\xF6revinizi belirleyen bir rol atanacakt\xFDr. Alabilece\xF0iniz olas\xFD roller \xFEunlard\xFDr:",
			" * \21Katil\16 - \xD6l\xFCmc\xFCl bir su\xE7lu. Onlar\xFDn g\xF6revi herkesi ortadan kald\xFDrmakt\xFDr.",
			" * \20\xDE".."erif\16  - \21Katil(ler)\16i bulmak ve ortadan kald\xFDrmakla g\xF6revlidir.",
			" * \19Masum\16 - \xD6ld\xFCr\xFClmekten ka\xE7FDnmal\xFD ve \21Katilin\16 kimli\xF0inin belirlenmesine yard\xFDmc\xFD olmal\xFD".."d\xFDr. Oyun kurulumuna ba\xF0l\xFD olarak, 100 y\xFCz\xFCk (veya belirli karakterler i\xE7in 50 y\xFCz\xFCk) toplayarak kendilerini savunmak i\xE7in bir \21K\xFDrm\xFDz\xFD Y\xFCz\xFCk\16 elde edebilirler.",
			"\nOynamaya ba\xFElamak i\xE7in gereken t\xFCm temel bilgiler budur, daha fazla bilgi i\xE7in bu k\xFDlavuzu sonuna kadar okuyun",
			"\nHUD aray\xFCz\xFCn\xFCn dilini ve bu k\xFDlavuzu tercih etti\xF0iniz dile de\xF0i\xFEtirmek i\xE7in \23MMLANG\16 komutunu kullan\xFDn."
		},
        {
			"\23Oynan\xFDFE durumlar\xFD hakk\xFDnda\16\n",
			"Temel bilgilerde daha \xF6nce a\xE7FDkland\xFDF0\xFD gibi, \xDE".."eriflerin amac\xFD t\xFCm \21Katil(ler)\16'i ortadan kald\xFDrmakt\xFDr, ancak farkl\xFD oyun durumlar\xFD ortaya \xE7FDkabilir:",
			"\n* E\xF0".."er \xD6l\xFCrseniz,\31 \xD6l\xFC\16 durumuna girersiniz. Bu durumdaki oyuncular yeniden do\xF0".."amaz veya hala hayatta olan oyuncularla k\xFCresel olarak konu\xFE".."amaz, mesajlar\xFD yaln\xFDzca di\xF0".."er\31 \xF6l\xFC\16 oyuncular taraf\xFDndan g\xF6r\xFClebilir.",
			"\31 \xD6l\xFC\16 iken hala hayatta olan oyuncularla konu\xFE".."amazs\xFDn ve /PM yapamazs\xFDn\xFDz.",
			"K\xFDr\xFD".."c\xFDlar, \xE7ukurlara d\xFCFEme veya suda bo\xF0ulma gibi harita tehlikelerinden \xF6lmek de sizi turun geri kalan\xFDnda \31\xD6l\xFC\16 yapacakt\xFDr.",
			"Ayr\xFD".."ca\18 \2KEND\xDDN\xDDZ\xDD \2YEN\xDD".."DEN \2ADLANDIRMAYA \2\xC7".."ALI\xDEMAYIN\16, bununla ilgili daha fazla ayr\xFDnt\xFD di\xF0".."er sayfada.",
			"\n* \20\xDE".."erif'in\16 g\xF6revi, etraftaki t\xFCm \21Katiller\16'i ortadan kald\xFDrmakt\xFDr, ancak kazara bir \19Masum\16'u vurmalar\xFD m\xFCmk\xFCnd\xFCr.",
			"E\xF0".."er bir \20\xDE".."erif\16 \19Masum\16u vurursa , rollerini kaybedecekler ve \19Masum\16 olacaklar: Rastgele bir \19Masum\16 daha sonra sessizce \20\xDE".."erif\16'in rol\xFCn\xFC \xFCstlenecektir. Teti\xF0i \xE7".."ekmeden \xF6nce iki kez d\xFCFE\xFCn\xFCn!",
			"\n* Bir \21Katil\16, hala hayatta olan \19Masum\16lar varken bir \20\xDE".."erif\16'i \xF6ld\xFCr\xFCrse, \20\xDE".."erif'in Z\xFCmr\xFCt\xFC\16 cesedinin yan\xFDna d\xFCFE".."ecektir.",
			"Bir \19Masum\16, \20\xDE".."erif'in Z\xFCmr\xFCt\xFC\16'n\xFC ald\xFDF0\xFDnda, bir \18Kahraman\16 olurlar. \18Kahraman\16lar \20\xDE".."erif\16lere benzer, ancak baz\xFD farkl\xFDl\xFDklarla birlikte gelir:",
			"  - Bir \18Kahraman\16 bir \19Masum\16u \xF6ld\xFCr\xFCrse, her ikisi de \xF6l\xFCr ve rolleri yeniden atanmaz;",
			"  - \18Kahramanlar\16 \xF6ld\xFCkten sonra \20\xDE".."erif'in Z\xFCmr\xFCt\xFC\16'n\xFC d\xFCFErmezler.",
			"Oyuncu say\xFDs\xFDn\xFDn daha y\xFCksek oldu\xF0u turlarda birden fazla \21Katil\16ler ve \20\xDE".."erif\16ler olabilir. Bu turlar i\xE7in \21Katil\16ler ve \20\xDE".."erif\16'den olu\xFE".."an \26Tak\xFDm\16lar olu\xFEturulur.",
			"\26Tak\xFDm arkada\xFElar\xFD\16, konsoldaki \23SAYTEAM\16 komutunu kullanarak (SAYTEAM d\xFCF0mesi normal sohbet d\xFCF0mesiyle ayn\xFD \xFE".."ekilde \xE7".."al\xFDFE\xFDr) veya mesaj\xFD otomatik olarak ekip \xFCyelerine g\xF6nderen \24%\16 simgesiyle bir mesaj ba\xFElatarak birbirleriyle sohbet edebilirler.",
			"Yanl\xFDFEl\xFDkla bir \26Tak\xFDm arkada\xFEFD\16 sald\xFDr\xFDrsan\xFDz, her iki oyuncu da ki\xFEisell\xFEtirilmi\xFE bir uyar\xFD al\xFDr. Dikkatli olun - bu t\xFCr ekip etkile\xFEimleri ba\xFEkalar\xFDna \27rol\16'lerinizi if\xFE".."a edebilir!"
		},
        {
			"Murder \23Mystery\16'de yap\xFDlmas\xFD k\xF6t\xFC olan \23\xFE".."eyler\16\n",
			"Kural 1: \18Nazik olun ve \18e\xF0lenin!\16 \xDDFEte baz\xFD ek y\xF6nergeler:",
			"\n* \26Rol\16'\xFCn kendini \xFEFDmartmas\xFD oyunu bir 'gizem' yapmaz, e\xF0".."er eminseniz ba\xFEkas\xFDn\xFDn rol\xFCn\xFC s\xF6yleyebilirsiniz, ancak kendinizinkini asla s\xF6ylemeyin.",
			"\n* Di\xF0".."er oyunculara hakaret etmekten ka\xE7FDn\xFDn. Arkada\xFEE7".."a \xFE".."akalar iyidir, ancak s\xFCrekli su\xE7lamalar veya d\xFCFEmanca davran\xFDFElar ba\xFEkalar\xFDn\xFDn size g\xFCvenmemesine neden olur.",
			"\n* AFK olmay\xFDn. \xC7ok uzun s\xFCre hareketsiz kal\xFDrsan\xFDz, \xFCzerinize bir bomba at\xFDlacak ve oyundan \xE7FDkar\xFDlacaks\xFDn\xFDz.",
			"\n* \xD6l\xFCyken bir tur s\xFDras\xFDnda kendinizi yeniden adland\xFDrmay\xFDn, bunu yapmak sizi sunucudan atacakt\xFDr. Hayattaysan\xFDz yeniden adland\xFDrabilirsiniz. Aran\xFDn g\xFCvenli bir \xFE".."ekilde yeniden adland\xFDr\xFDlmas\xFDn\xFD bekleyin.",
			"E\xF0".."er bir \21Katil\16 iseniz \20\xDE".."erif'in \20Z\xFCmr\xFCt\xFC\16 \xE7".."evresinde kamp yapmaktan ka\xE7FDn\xFDn. Z\xFCmr\xFCt\xFCn yan\xFDnda 30 saniye durmak, oyundan at\xFDlman\xFDza neden olacakt\xFDr.",
			"\nBu kurallardan birini ihlal etmek, oyundan at\xFDlma veya baz\xFD durumlarda Y\xF6netici taraf\xFDndan yasaklanma ile sonu\xE7lanabilir. Adil oynay\xFDn ve e\xF0lenin!"
		},
        {
			"\23Faydal\xFD ipu\xE7lar\xFD\16\n",
			"Murder Mystery'deki oyununuz s\xFDras\xFDnda size yard\xFDmc\xFD olabilecek baz\xFD ipu\xE7lar\xFD toplad\xFDk:",
			"\n* Karakter yetenekleri y\xF6netici taraf\xFDndan devre d\xFDFE\xFD b\xFDrak\xFDl\xFDrsa, iz birakmadan veya g\xFCr\xFClt\xFC yapmadan gizlice dola\xFEmak i\xE7in \23SPIN\16 tu\xFEuna bas\xFDn;",
			"\n* \20\xDE".."erif'in \20Z\xFCmr\xFCt\xFC\16'n\xFC ald\xFDF0\xFDn\xFDzda, \xF6nceden toplad\xFDF0\xFDn\xFDz t\xFCm silahlara ve y\xFCz\xFCklere eri\xFE".."ebileceksiniz;",
			"\n* \23SAYTEAM\16 komutunu kullanarak \26tak\xFDm arkada\xFEFD\16'\xFDn\xFDz\xFDn kim oldu\xF0unu bulmak, onlar\xFD vurmaktan ka\xE7FDnman\xFDz\xFD ve yanl\xFDFEl\xFDkla rol\xFCn\xFCz\xFC ortaya \xE7FDkarman\xFDz\xFD sa\xF0layaca\xF0FD i\xE7in yard\xFDmc\xFD olacakt\xFDr;",
			"\n* 3 saniyeli\xF0ine \xF6l\xFCms\xFCzl\xFCk kazanmak i\xE7in lav, dikenler ve ate\xFE gibi engellerden zarar alabilirsiniz;",
			"\n* Haritada saklanacak bir yer aramaya \xE7".."al\xFDFE\xFDn. Bazen istenmeyen tan\xFDt\xFDmlardan kurtulmaya yard\xFDmc\xFD olur;",
			"\n* Rol\xFCn\xFCz s\xFDzd\xFDr\xFDl\xFDrsa, kendinizi yeniden adland\xFDrabilir ve/veya ten rengini de\xF0i\xFEtirebilirsiniz. \1Yeniden \1adland\xFDrman\xFDz\xFDn \1sohbette \1g\xF6sterilece\xF0ini \1unutmay\xFDn\0;",
			"\n* Y\xFCz\xFCkleriniz oldu\xF0u s\xFCrece \22B\xFDE7".."ak\16'\xFD her yerde kullanmak i\xE7in \23FIRENORMAL\16 d\xFCF0mesini kullan\xFDn. \22B\xFDE7".."ak\16 kullan\xFDrken gizlice girmek, sald\xFDr\xFDn\xFDz\xFDn sessiz olmas\xFDn\xFD sa\xF0lar.",
			"\n* HUD aray\xFCz\xFCn\xFCn dilini tercih etti\xF0iniz dile de\xF0i\xFEtirmek i\xE7in \23MMLANG\16 komutunu kullan\xFDn."
		}
	},
    ["MMLANG"]={
		"Kullanimda olan mevcut diliniz \x82Turkce\x80\nKonsola \x87MMLANG [dil] \x80komutunu yazarak degistirebilirsiniz", -- cCc
		"Murder Mystery icin kisisel dil \x82Turkce\x80 olarak ayarlanmistir" -- cCc
	},
    ["ROLE_GET"]={
		"Sen \x85Katil\x80'sin! \x85Herkesi oldur!", 
		"Sen \x84Serif\x80'sin! \x84Tum Katilleri ortadan kaldir\x80. Masum birini oldururseniz, rolunuzden siyrilirsiniz.", 
		"Sen bir\x83Masum\x80'sun! Saklan ve sorusturmaya yardim et." 
	},
    ["NEWROLE_GET"]={
		"\x87Hayat rastgele karar verdi, \x85Katil\x87 olacaksin.\x85 Simdi git herkesi oldur!",
		"Evren\x87 seni bir \x84Serif\x87 yapti! Git ve\x84 tum Katilleri\x87 ortadan kaldir!", 
		"\x82Kahraman\x87 olmaniza karar verildi. Herkesi Katillerden kurtarin!",
		"\x87\x85Katillerden\x87 birini ortadan kaldirdiniz! \x82Kahramanliga\x87 terfi edildiniz!"
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
	["SHREMD_PICK"]="Birisi \x84Serif'in Zumrutu\x80'nu aldi...",
	["KILL_PUNISHMENT_PM"]={
		"Bir\x87 \x83Masum\x87'u oldurdun! Kovuldun. (Artik bir Serif degilsin)",
		"\x82Kahramanlar\x87 \x83Masumlar\x87'i oldurmek icin tasarlanmamistir. Bunun icin olum cezasi aldiniz.",
		"\x87Oh hayir! Bir \x84Serif\x87'i oldurdun!!! Bunun icin olum cezasi aldin",
		"\x87Senin gibi \x83Masum\x87 bir oyuncuyu oldurdun! Bunun icin olum cezasi aldin",
		"\x87Oh hayir! Bir \x82Kahraman\x87'i oldurdun! Bunun icin olum cezasi aldin"
	},
    ["INNO_HURT"]={
		"\x84Serif\x80 bir \x83Masum\x80'u oldurdu! Isi baskasi bitirmeli!",
		"\x82Kahraman\x87, Masum'u oldurerek kotu adam olmaya karar verdi. Şimdi ikisi de olu yatiyor. Boyle bir kahramana yaziklar olsun"
	},
    ["ONE_QUIT"]={
		"\x85Katillerden\x80 biri cikti!",
		"\x84Seriflerden\x80 biri cikti!!!",
		"\x82Kahramanlardan\x80 biri bizi terk etti!"
	},
    ["LAST_QUIT"]={
		"Son \x85Katil\x80 cikti!",
		"Son \x84Serif\x80 cikti!",
		"Son \x82Kahraman\x80 cikti!"
	},
    ["REPLACE_QUIT"]={
		"\x85Katil\x80 cikti! Rastgele bir\x83 Masum\x80 onun rolunu ustlenecek!",
		"\x84Serif\x80 cikti! Rastgele bir\x83 Masum\x80 onun rolunu ustlenecek!",
		"Bir \x82Kahraman\x80 cikti! Rastgele bir\x83 Masum\x80 onun rolunu ustlenecek!"
	},
    ["ENDROUND"]={
		"Herkes oldu. \x85Katiller\x80 kazandi!",
		"Tum \x85Katiller\x80 olduruldu! \x83 Masumlar\x80 kazandi!",
		"\x85Katiller\x80 kazandi cunku \x84Serif\x80 son Masum'u oldurdu! \x84Serif\x80'e yaziklar olsun",
		"\x82Kahraman\x80 son Masum'u oldurmeyi secti. \x85Katiller\x80 kazandi!",
		"\x83Masum\x80larin savunuculari oldu. \x85Katiller\x80 kazandi!"
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
	["HUD_SUSPECTS"]="\xDEFCphel\xEDler",
	["HUD_VICTIMS"]="Masumlar",
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
	["HUD_ROLETARGET"] = {
		"",
		"",
		"",
		""
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
		["GOAL"]="Gol!"
	},
    ["HUD_YOU"]="SEN",
	["HUD_WINNERS"]="Kazananlar:",
	["HUD_WIN"]={
		"BERABERE!",
		"\21KAT\xDDLLER",
		"\19MASUMLAR"
	},
    ["HUD_PAST"]="GE\xC7M\xDD\xDE",
	["HUD_FUTURE"]="GELECEK"
})
