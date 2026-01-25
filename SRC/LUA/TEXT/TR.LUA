-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- TURKISH
-- Made by Mobillia

MM.AddLang("TR", {
	["LANGUAGE"]="Turkish",
	["VERSION"]="1.3",
	["AUTHOR"]="Mobillia",
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
		"Katil",
		"olduruldu"
	},
	["CHAT_SHERIKILLED"]={
		"Serif",
		"olduruldu!",
		"Onun\x84 Zumrut\x80'unu bulun!"
	},
	["CHAT_HEROKILLED"]={
		"Kahraman",
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
	["HUD_MM"]="Murder Mystery", 
	["HUD_ROLES"]={
		["MURDERER"]="KATİL",
		["SHERIFF"]="ŞERİF",
		["CIVILIAN"]="MASUM",
		["HERO"]="KAHRAMAN",
		["JESTER"]="",
		["DEAD"]="ÖLÜ"
	},
	["HUD_SUSPECTS"]="Şüphelíler",
	["HUD_VICTIMS"]="Masumlar",
	["HUD_TEAMMATES"]="Takım arkadaşları",
	["HUD_KILLEDBY"]={
		"Ölmenin sebebi:",
		"adalet",
		"tuzak"
	},
	["HUD_SCORESTAB"]="Oyun türünde yeniyseniz konsola ^7MMHELP^0 yazın. Buradaki dili değiştirmek için ^7MMLANG^0 komutunu kullanın\n\n^2İyi eğlenceler!",
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
	["HUD_DEAD"]="^FÖldün\nYeninden doğamaz veya ölmemiş insanlar ile konuşamazsın",
	["HUD_MIDJOIN"]="^4Tur ortasında^0 katıldınız, lütşn bu turun bitmesini bekleyin.\nBeklerken lütşn ^7MMHELP^0 konsol komutundaki oyun kurallarını okuyunuz.",
	["HUD_ALONE"]="Oyunun başlaması için en az ^42 oyuncu^0 gereklidir, Lütşn^4 bir oyuncunun^0 daha gelmesini bekleyin",
	["HUD_SNEAKING"]="Sinsice...",
	["HUD_SHOWDOWN"]="Hesaplaşma düellosu!",
	["HUD_MINIGAME"]={
		["PRESS"]="^2 CUSTOM3^0'e bas ve",
		["LEAVE"]="ayrıl",
		["CANCEL"]="iptal",
		["SPECTATE"]="seyret",
		["DUEL"]="bir mini oyun düellosu",
		["REQUEST"]="bir ^7PONG^0 oyunu talep edin",
		["START"]="bir ^7\"SONIC RUN\"^0 oyunu başlat",
		["ACCEPT"]="^7PONG^0 meydan okumasını kabul et!",
		["WAIT"]="Rakibin kabul etmesi bekleniyor...",
		["SPECTATING"]="Bir düello izleniyor...",
		["BORED"]="Sıklındın mı?",
		["GOAL"]="Gol!"
	},
	["HUD_YOU"]="SEN",
	["HUD_WINNERS"]="Kazananlar:",
	["HUD_WIN"]={
		"BERABERE!",
		"^5KATİLLER",
		"^3MASUMLAR"
	},
	["HUD_PAST"]="GEÇMİŞ",
	["HUD_FUTURE"]="GELECEK",
	["HUD_MMHELP_UI"]={
		"Kaydırmak ıçın ^7UP^0/^7DOWN^0 kullanın, sayfalar arası geçiş yapmak ıçın ^7LEFT^0/^RIGHT^0 kullanın",
		"HELP'den ayrılmak için ^7CUSTOM^0'a basın"
	},
	["HUD_MMHELP"]={
		{
			"^7Murder Mystery'e hoşgeldiniz!",
			"^7Popüler ^7çok oyunculu oyunun ^7SRB2 yorumu!^0\n",
			"Oyunun amacı, diğer herkes^0 ölmeden^3 önce tüm ^5Katiller^0'i bulup ortadan kaldırmaktır. Bu oyun türü daha çok MATCH'a benzer, bu yüzden bu oyun türü için nişan alma ve atış becerilerinize ihtiyacınız olacak.",
			"Oynamaya başlamadan önce bazı temel bilgileri öğrenmeniz gerekiyor...",
			"\nHer turun başında, oyun sırasındaki görevinizi belirleyen bir rol atanacaktır. Alabileceğiniz olası roller şunlardır:",
			" * ^5Katil^0 - Ölümcül bir suçlu. Onların görevi herkesi ortadan kaldırmaktır.",
			" * ^4Şerif^0  - ^5Katil(ler)^0i bulmak ve ortadan kaldırmakla görevlidir.",
			" * ^3Masum^0 - Öldürülmekten kaçınmalı ve ^5Katilin^0 kimliğinin belirlenmesine yardımcı olmalıdır. Oyun kurulumuna bağlı olarak, 100 yüzük (veya belirli karakterler için 50 yüzük) toplayarak kendilerini savunmak için bir ^5Kırmızı Yüzük^0 elde edebilirler.",
			"\nOynamaya başlamak için gereken tüm temel bilgiler budur, daha fazla bilgi için bu kılavuzu sonuna kadar okuyun",
			"\nHUD arayüzünün dilini ve bu kılavuzu tercih ettiğiniz dile değiştirmek için ^7MMLANG^0 komutunu kullanın."
		},
		{
			"^7Oynanış durumları hakkında^0\n",
			"Temel bilgilerde daha önce açıklandığı gibi, Şeriflerin amacı tüm ^5Katil(ler)^0'i ortadan kaldırmaktır, ancak farklı oyun durumları ortaya çıkabilir:",
			"\n* Eğer Ölürseniz,^F Ölü^0 durumuna girersiniz. Bu durumdaki oyuncular yeniden doğamaz veya hala hayatta olan oyuncularla küresel olarak konuşamaz, mesajları yalnızca diğer^F ölü^0 oyuncular tarafından görülebilir.",
			"^F Ölü^0 iken hala hayatta olan oyuncularla konuşamazsın ve /PM yapamazsınız.",
			"Kırıcılar, çukurlara düşme veya suda boğulma gibi harita tehlikelerinden ölmek de sizi turun geri kalanında ^FÖlü^0 yapacaktır.",
			"Ayrıca^2KENDİNİZİ YENİDEN ADLANDIRMAYA ÇALIŞMAYIN^0, bununla ilgili daha fazla ayrıntı diğer sayfada.",
			"\n* ^4Şerif'in^0 görevi, etraftaki tüm ^5Katiller^0'i ortadan kaldırmaktır, ancak kazara bir ^3Masum^0'u vurmaları mümkündür.",
			"Eğer bir ^4Şerif^0 ^3Masum^0u vurursa , rollerini kaybedecekler ve ^3Masum^0 olacaklar: Rastgele bir ^3Masum^0 daha sonra sessizce ^4Şerif^0'in rolünü üstlenecektir. Tetiği çekmeden önce iki kez düşünün!",
			"\n* Bir ^5Katil^0, hala hayatta olan ^3Masum^0lar varken bir ^4Şerif^0'i öldürürse, ^4Şerif'in Zümrütü^0 cesedinin yanına düşecektir.",
			"Bir ^3Masum^0, ^4Şerif'in Zümrütü^0'nü aldığında, bir ^2Kahraman^0 olurlar. ^2Kahraman^0lar ^4Şerif^0lere benzer, ancak bazı farklılıklarla birlikte gelir:",
			" - Bir ^2Kahraman^0 bir ^3Masum^0u öldürürse, her ikisi de ölür ve rolleri yeniden atanmaz;",
			" - ^2Kahramanlar^0 öldükten sonra ^4Şerif'in Zümrütü^0'nü düşrmezler.",
			"Oyuncu sayısının daha yüksek olduğu turlarda birden fazla ^5Katil^0ler ve ^4Şerif^0ler olabilir. Bu turlar için ^5Katil^0ler ve ^4Şerif^0'den oluşan ^ATakım^0lar oluşturulur.",
			"^ATakım arkadaşları^0, konsoldaki ^7SAYTEAM^0 komutunu kullanarak (SAYTEAM düğmesi normal sohbet düğmesiyle aynı şekilde çalışır) veya mesajı otomatik olarak ekip üyelerine gönderen ^8%^0 simgesiyle bir mesaj başlatarak birbirleriyle sohbet edebilirler.",
			"Yanlışlıkla bir ^ATakım arkadaşı^0 saldırırsanız, her iki oyuncu da kişisellştirilmiş bir uyarı alır. Dikkatli olun - bu tür ekip etkileşimleri başkalarına ^Brol^0'lerinizi ifşa edebilir!"
		},
		{
			"Murder ^7Mystery^0'de yapılması kötü olan ^7şeyler^0\n",
			"Kural 1: ^2Nazik olun ve^2 eğlenin!^0 İşte bazı ek yönergeler:",
			"\n* ^ARol^0'ün kendini şımartması oyunu bir 'gizem' yapmaz, eğer eminseniz başkasının rolünü söyleyebilirsiniz, ancak kendinizinkini asla söylemeyin.",
			"\n* Diğer oyunculara hakaret etmekten kaçının. Arkadaşça şakalar iyidir, ancak sürekli suçlamalar veya düşmanca davranışlar başkalarının size güvenmemesine neden olur.",
			"\n* AFK olmayın. Çok uzun süre hareketsiz kalırsanız, üzerinize bir bomba atılacak ve oyundan çıkarılacaksınız.",
			"\n* Ölüyken bir tur sırasında kendinizi yeniden adlandırmayın, bunu yapmak sizi sunucudan atacaktır. Hayattaysanız yeniden adlandırabilirsiniz. Aranın güvenli bir şekilde yeniden adlandırılmasını bekleyin.",
			"Eğer bir ^5Katil^0 iseniz ^4Şerif'in Zümrütü^0 çevresinde kamp yapmaktan kaçının. Zümrütün yanında 30 saniye durmak, oyundan atılmanıza neden olacaktır.",
			"\nBu kurallardan birini ihlal etmek, oyundan atılma veya bazı durumlarda Yönetici tarafından yasaklanma ile sonuçlanabilir. Adil oynayın ve eğlenin!"
		},
		{
			"^7Faydalı ipuçları^0\n",
			"Murder Mystery'deki oyununuz sırasında size yardımcı olabilecek bazı ipuçları topladık:",
			"\n* Karakter yetenekleri yönetici tarafından devre dışı bırakılırsa, iz birakmadan veya gürültü yapmadan gizlice dolaşmak için ^7SPIN^0 tuşuna basın;",
			"\n* ^4Şerif'in Zümrütü^0'nü aldığınızda, önceden topladığınız tüm silahlara ve yüzüklere erişebileceksiniz;",
			"\n* ^7SAYTEAM^0 komutunu kullanarak ^Atakım arkadaşı^0'ınızın kim olduğunu bulmak, onları vurmaktan kaçınmanızı ve yanlışlıkla rolünüzü ortaya çıkarmanızı sağlayacağı için yardımcı olacaktır;",
			"\n* 3 saniyeliğine ölümsüzlük kazanmak için lav, dikenler ve ateş gibi engellerden zarar alabilirsiniz;",
			"\n* Haritada saklanacak bir yer aramaya çalışın. Bazen istenmeyen tanıtımlardan kurtulmaya yardımcı olur;",
			"\n* Rolünüz sızdırılırsa, kendinizi yeniden adlandırabilir ve/veya ten rengini değiştirebilirsiniz. ^2Yeniden adlandırmanızın sohbette gösterileceğini unutmayın^0;",
			"\n* Yüzükleriniz olduğu sürece^6 Bıçak^0'ı her yerde kullanmak için^7 FIRENORMAL^0 düğmesini kullanın.^6 Bıçak^0 kullanırken gizlice girmek, saldırınızın sessiz olmasını sağlar.",
			"\n* HUD arayüzünün dilini tercih ettiğiniz dile değiştirmek için ^7MMLANG^0 komutunu kullanın."
		}
	},
	["IMG_VICTIMS"]={palette={{73, 31}},image={
		"001    001  00001   00001  001 001 001    001 001      00001  000001",
		"001    001 0000001 0000001 001 001 001    001 001     0000001 0000001",
		"000   0001 0011001 0011001 001 001 000   0001 001     0011001 0011001",
		"0000 00001 001 001 0001111 001 001 0000 00001 001     001 001 001 001",
		"0000000001 0000001 10001   001 001 0000000001 001     0000001 000001",
		"0000000001 0000001  10001  001 001 0000000001 001     0000001 000001",
		"0010001001 0011001   10001 001 001 0010001001 001     0011001 0011001",
		"001101 001 001 001 0011001 001 001 001101 001 001     001 001 001 001",
		"001 1  001 001 001 0000001 0000001 001 1  001 0000001 001 001 001 001",
		"001    001 001 001 1000011 1000011 001    001 0000001 001 001 001 001",
		"111    111 111 111  11111   11111  111    111 1111111 111 111 111 111"
	}},
	["IMG_SUSPECTS"]={palette={{73, 31}},yoff=2,image={
		"        001 001                                  001",
		"        111 111                                  111",
		" 00001  001 001 000001  001 001 0000001 001      001  001     0000001 000001",
		"0000001 001 001 0000001 001 001 0000001 001      001  001     0000001 0000001",
		"0011001 001 001 0011001 001 001 0011111 001      001  001     0011111 0011001",
		"000111  001 001 001 001 001 001 001     001      001  001     001     001 001",
		"10001   001 001 0000001 0000001 0000001 001      001  001     0000001 000001",
		" 10001  001 001 000001110000001 0000001 001      001  001     0000001 000001",
		"  10001 001 001 001111  001 001 0011111 001      001  001     0011111 0011001",
		"0011001 001 001 001     001 001 001     001      001  001     001     001 001",
		"0000001 0000001 001     001 001 0000001 0000001  001  0000001 0000001 001 001",
		"100001  1000011 001     001 001 0000001 0000001  001  0000001 0000001 001 001",
		" 1101    11111  111     111 111 1111111 1111111  111  1111111 1111111 111 111",
		"   1"
	}},
	["IMG_TIME"]={palette={{73, 31},{37, 31}},image={
		" 00001   00001   00001  0000001",
		"0000001 0000001 0000001 0000001",
		"0011001 0011001 0011001   00111",
		"0001111 001 001 001 001   001",
		"10001   0000001 0000001   001",
		" 10001  0000001 0000001   001",
		"  10001 0011001 0011001   001",
		"0011001 001 001 001 001   001",
		"0000001 001 001 001 001   001",
		"1000011 001 001 001 001   001",
		" 11111  111 111 111 111   111"
	}},
	["IMG_RINGS"]={palette={{73, 31},{37, 31}},yoff=2,image={
		"        001 001         001 001",
		"        111 111         111 111",
		"001 001 001 001 0000001 001 001 001 001 001     0000001 000001",
		"001 001 001 001 0000001 001 001 001 001 001     0000001 0000001",
		"001 001 001 001 1111001 001 001 001 001 001     0011111 0011001",
		"001 001 001 001    0001 001 001 001 001 001     001     001 001",
		"0000001 001 001   0001  001 001 000001  001     0000001 000001",
		"100001  001 001   0001  001 001 000001  001     0000001 000001",
		" 1001   001 001  0001   001 001 001 001 001     0011111 0011001",
		"  001   001 001 0001    001 001 001 001 001     001     001 001",
		"  001   0000001 0000001 0000001 001 001 0000001 0000001 001 001",
		"  001   100001  0000001 100001  001 001 0000001 0000001 001 001",
		"  111    1111   1111111  1111   111 111 1111111 1111111 111 111"
	}}
})
