-- LANGUAGE FILE
-- for LeonardoTheMutant's Murder Mystery
--
-- TURKISH
-- Made by Mobillia

MM.AddLang("TR", { -- cCc
	["LANGUAGE"]="Turkce", -- cCc
	["VERSION"]="1.3",
	["AUTHOR"]="Mobillia",
	["CHAT_ROLE_MURDERER"]={
		["ROLEGET_PM"]="Sen ^5Katil^0'sin! ^5Herkesi oldur!",
		["NEWROLEGET_PM"]="^7Hayat rastgele senin bir ^5Katil^7 olacagina karar verdi. ^5Simdi herkesi oldur!",
		["KILLED"]={
		    "Katil",
			"olduruldu!"
	    },
	    ["ONEQUIT"]="^5Katillerden^0 biri cikti!",
	    ["LASTQUIT"]="^5Katil^0 cikti!",
	    ["REPLACEQUIT"]="^5Katil^0 cikti! Rastgele bir ^3Masum^0 onun rolunu ustlenecek!"
	},
	["CHAT_ROLE_SHERIFF"]={
	    ["ROLEGET_PM"]="Sen ^4Serif^0'sin! ^4Tum Katilleri ortadan kaldir^0. ^3Yanlis kisi^0'yi oldururseniz, rol artik sizin olmayacak.",
		["NEWROLEGET_PM"]="^7Evren seni bir ^4Serif^7 yapti! Git ve ^4tum Katilleri ortadan kaldir^7!",
		["KILLED"]={
		    "Serif",
		    "olduruldu!",
		    "Onun^4 Zumrut^0'unu bulun!"
	    },
		["ONEQUIT"]="^4Seriflerden^0 biri cikti!!!",
		["LASTQUIT"]="Son ^4Serif^0 cikti!",
		["REPLACEQUIT"]="^4Serif^0 cikti! Rastgele bir^3 Masum^0 onun rolunu ustlenecek!"
	},
	["CHAT_ROLE_CIVILIAN"]={
		["ROLEGET_PM"]="Sen bir ^3Masum^0'sun! Saklan ve sorusturmaya yardim et."
	},
	["CHAT_ROLE_HERO"]={
		["NEWROLEGET_PM"]="^2Kahraman^7 olmaniza karar verildi. Herkesi Katillerden kurtarin!",
	    ["RANKUP_PM"]="^5Katillerden birini ortadan kaldirdin^7! ^2Kahraman^7 onurunu hak ettin!",
		["KILLED"]={
		    "Kahraman",
			"olduruldu!"
		},
		["ONEQUIT"]="^2Kahramanlardan^0 biri bizi terk etti!",
		["LASTQUIT"]="Son ^2Kahraman^0 cikti!",
		["REPLACEQUIT"]="Bir ^2Kahraman^0 cikti! Rastgele bir^3 Masum^0 onun rolunu ustlenecek!"
	},
	["CHAT_ROLE_JESTER"]={
	    ["ROLEGET_PM"]="Sen ^1Saklaban^0'sin. Herkesi kendine ^5Katil^0 olduguna inandir."
	},
    ["CHAT_TEAMMATEHIT_PM"]={
		"Dikkatli ol! Bu senin takim arkadasin. Lutfen bir dahaki sefere takim arkadaslariniza vurmayin.",
		"Bir takim arkadasiniz kazara size vurdu. Ondan intikam almayi PLANLAMAYIN."
	},
	["CHAT_DIEDHAZARD"]="kazara oldu. Talihsiz.",
	["CHAT_SHREMDPICKUP"]="Birisi ^4Serif'in Zumrutu^0'nu aldi...",
	["CHAT_KILLPUNISHMENT_PM"]={
	    "^7Bir ^3Masum^7'u oldurdun! Toplumun hayatta kalmasi için çok tehlikelisin!",
		"^2Kahramanlar^7 ^3Masumlar^7'i oldurmek icin tasarlanmamistir. Bunun icin idam cezasi aldiniz.",
		"^7Oh hayir! Bir ^4Serif^7'i oldurdun!!! Bunun icin idam cezasi aldin",
		"^7Senin gibi ^3Masum^7 bir oyuncuyu oldurdun! Bunun icin idam cezasi aldin",
		"^7Oh hayir! Bir ^2Kahraman^7'i oldurdun! Bunun icin idam cezasi aldin"
	},
	["CHAT_ENDROUND"]={
		"Herkes oldu. ^5Katiller^0 kazandi!",
		"Tum ^5Katiller^0 olduruldu! ^3Masumlar^0 kazandi!",
		"^5Katiller^0 kazandi cunku ^4Serif^0 son Masum'u oldurdu! ^4Serif^0'e yaziklar olsun...",
		"^5Katiller^0 kazandi cunku ^2Kahraman^0 son Masum'u oldurmeyi secti. ^2Kahraman^0'a yaziklar olsun...",
		"^3Masumlarin^0 savunuculari oldu. ^5Katiller^0 kazandi!",
		"^1Saklaban^0 Iyi Insanlar tarafindan olduruldu. Kumar kotu cocuklar."
	},
	["HUD_MM"]="Murder Mystery",
	["HUD_SUSPECTS"]="Şüphelíler",
	["HUD_VICTIMS"]="Masumlar",
	["HUD_TEAMMATES"]="Takım arkadaşları",
	["HUD_ROLES"]={
		["MURDERER"]="KATİL",
		["SHERIFF"]="ŞERİF",
		["CIVILIAN"]="MASUM",
		["HERO"]="KAHRAMAN",
		["JESTER"]="ŞAKLABAN",
		["DEAD"]="ÖLÜ"
	},
	["HUD_KILLEDBY"]={
		"Ölmenin sebebi:",
		"adalet",
		"harita tasarımı"
	},
	["HUD_SCORESTAB"]="Oyun türünde yeniyseniz konsola ^7MMHELP^0 yazın. Buradaki dili değiştirmek için ^7MMLANG^0 komutunu kullanın.\n\n^2İyi eğlenceler!",
	["HUD_ROLETARGET"] = {
		["MURDERER"]="Uyum sağla, güven oluştur, sonra saldır.",
		["SHERIFF"]="Tüm Katilleri bulun ve ortadan kaldırın. Masumları öldürmeyin!",
		["CIVILIAN"]="Saklan ve kendini koru. Mümkün olduğunda soruşturmaya yardım et.",
		["HERO"]="Tüm katilleri durdurma şansın var. Git ve günü kurtar, ancak dikkatli ol!",
		["JESTER"]="Herkesi senin Kötü Adam olduğuna inandır. Silah Yüzüklerin kimseye zarar vermeyecek, yalnızca bir Kahraman hariç."
	},
	["HUD_ROLESALIVE"]={
		"Katiller",
		"Şerifler",
		"Masumlar"
	},
	["HUD_DEAD"]="^FÖldün^0.\nYeninden doğamaz veya ölmemiş insanlar ile konuşamazsın.",
	["HUD_MIDJOIN"]="^4Tur ortasında^0 katıldınız, lütfen bu turun bitmesini bekleyin.\nBeklerken lütfen ^7MMHELP^0 konsol komutundaki oyun kurallarını okuyunuz",
	["HUD_ALONE"]="Oyunun başlaması için en az ^42 oyuncu^0 gereklidir,\nLütfen^4 bir oyuncunun^0 daha gelmesini bekleyin",
	["HUD_SPECTATOR"]={
		["INFO"]="Şu anda seyrediyorsunuz. Bir sonraki tura katılmak için oyuna girin.",
		["SWITCHING_TO"]="Bir sonraki turda izleyici moduna geçiliyor...",
		["SWITCHING_FROM"]="Bir sonraki turda oyuna giriliyor..."
	},
	["HUD_SNEAKING"]="Sinsice...",
	["HUD_SHOWDOWN"]="Karşılaşma düellosu!",
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
		["SPECTATING"]="Bir düello seyrediliyor...",
		["BORED"]="Sıklındın mı?",
		["GOAL"]="Gol!"
	},
    ["HUD_YOU"]="SEN",
	["HUD_WINNERS"]="Kazananlar:",
	["HUD_WIN"]={
		["TIE"]="BERABERE!",
		["BAD"]="^5KATİLLER",
		["GOOD"]="^3MASUMLAR",
		["JESTER"]="^1ŞAKLABAN"
	},
	["HUD_PAST"]="GEÇMİŞ",
	["HUD_FUTURE"]="GELECEK",
	["HUD_MMHELP_UI"]={
		"Kaydırmak için ^7UP^0/^7DOWN^0 kullanın, sayfalar arası geçiş yapmak için ^7LEFT^0/^RIGHT^0 kullanın",
		"HELP'den ayrılmak için herhangi bir ^7CUSTOM^0'a basın"
	},
	["HUD_MMHELP"]={
		{
			"^7^5Murder Mystery^7'e hoşgeldiniz!\nPopüler çok oyunculu oyunun SRB2 tercümesi!^0\n",
			"Oyunun amacı, diğer herkes^0 ölmeden^3 önce tüm ^5Katiller^0'i bulup ortadan kaldırmaktır. Bu oyun türü daha çok MATCH'a benzer, bu yüzden nişan alma ve atış becerilerinize ihtiyacınız olacak.",
			"\nİlk olarak, temel bilgileri gözden geçirelim ki hemen dalıp oynamaya başlayabil...",
			"\nHer turun başında, oyun sırasındaki görevinizi belirleyen bir rol atanacaktır. İşte alabileceğiniz olası roller:",
			" * ^5Katil^0 - Gerçek bir suçlu. Onların görevi herkesi ortadan kaldırmaktır.",
			" * ^4Şerif^0 - Görevi, ^5Katil(ler)^0i bulmak ve ortadan kaldırmaktır.",
			" * ^3Masum^0 - Öldürülmekten kaçınmalı ve ^5Katil^0in kimliğinin belirlenmesine yardımcı olmalıdır. Oyun kurulumuna bağlı olarak, 100 yüzük (veya belirli karakterler için 50 yüzük) toplayarak kendilerini savunmak için bir ^5Kırmızı Yüzük^0 elde edebilirler.",
			"\nOynamaya başlamak için gereken tüm temel bilgiler bunlardır, daha fazla bilgi için bu kılavuzu sonuna kadar okuyun",
			"\nHUD arayüzünün dilini ve bu kılavuzu tercih ettiğiniz dili değiştirmek için ^7MMLANG^0 komutunu kullanın."
		},
		{
			"^7Oynanış durumları hakkında^0\n",
			"Temel bilgilerde daha önce açıklandığı gibi, oyundaki amaç tüm ^5Katil(ler)^0'i ortadan kaldırmaktır, ancak farklı senaryolar ortaya çıkabilir:",
			"\n* Eğer ölürseniz,^F Ölü^0 durumuna girersiniz. Bu durumdaki oyuncular yeniden doğamaz veya hala hayatta olan oyuncularla küresel olarak konuşamaz, mesajları ancak diğer^F ölü^0 oyuncular tarafından görülür.",
			"^F Ölü^0 iken hala hayatta olan oyuncularla konuşamazsınız veya Personal Message gönderemezsiniz.",
			"Kırıcılar, çukurlara düşme veya suda boğulma gibi harita tehlikelerinden ölmek de sizi turun geri kalanında ^FÖlü^0 yapacaktır.",
			"Ayrıca, ^FÖLÜYKEN^0 ^2KENDİNİZİ YENİDEN ADLANDIRMAYA ÇALIŞMAYIN^0, bununla ilgili daha fazla ayrıntı diğer sayfadadır.",
			"\n* ^4Şerif'in^0 görevi, etraftaki tüm ^5Katiller^0'i ortadan kaldırmaktır, ancak kazara bir ^3Masum^0'u vurmamaya dikkat etmelidirler.",
			"Eğer bir ^4Şerif^0 ^3Masum^0u vurursa, o oyuncu ^Brol^0ünü kaybedecek ve ceza olarak ^3Masum^0 olacaktır. Daha sonra rastgele seçilen başka bir ^3Masum^0 oyuncu sessizce ^4Şerif'in^0 ^Brolünü^0 üstlenecektir. Tetiğe basmadan önce düşünün!",
			"\n* Bir ^5Katil^0, hala hayatta olan ^3Masum^0lar varken bir ^4Şerif^0'i öldürürse, ^4Şerif'in Zümrütü^0 cesedinin yanına düşecektir.",
			"Bir ^3Masum^0, ^4Şerif'in Zümrütü^0'nü aldığında, bir ^2Kahraman^0 olurlar. ^2Kahraman^0lar ^4Şerif^0lere benzer, ancak bazı farklılıklarla birlikte gelir:",
			" - Bir ^2Kahraman^0 bir ^3Masum^0u öldürürse, her ikisi de ölür ve ^Brolleri^0 yeniden atanmaz;",
			" - ^2Kahramanlar^0 öldükten sonra ^4Şerif'in Zümrütü^0'nü düşürmezler.",
			"\n* Oyuncu sayısının daha yüksek olduğu turlarda birden fazla ^5Katil^0ler ve ^4Şerif^0ler olabilir. Bu turlar için ^5Katiller^0 ve ^4Şeriften^0 oluşan ^ATakım^0lar oluşturulur.",
			"^ATakım arkadaşları^0, konsoldaki ^7SAYTEAM^0 komutunu kullanarak veya Takım Sohbeti'ni (klavyede ^8'y'^0 tuşunu) kullanarak iletişim kurabilir.",
			"Yanlışlıkla bir ^Atakım arkadaşınıza^0 saldırırsanız, her iki oyuncu da kişiselleştirilmiş bir uyarı alır. Dikkatli olun - bu tür ekip etkileşimleri başkalarına ^Brol^0lerinizi ifşa edebilir!"
		},
		{
			"^7Murder Mystery^0'de yapılması kötü olan şeyler^0\n",
			"Kural 1: ^2Nazik olun ve^2 eğlenin!^0 İşte bazı ek yönergeler:",
			"\n* ^BRol^0'ünü şaka yollu bile olsa bozma, eminseniz başkasının ^Brolünü^0 söyleyebilirsiniz, ancak kendinizinkini asla söylemeyin.",
			"\n* Diğer oyunculara hakaret etmekten kaçının. Arkadaşça şakalar sorun değildir, ancak sürekli suçlamalar veya düşmanca davranışlar başkalarının size güvenmemesine yol açar.",
			"\n* ^8AFK^0 (^8Klavyeden Uzakta^0) olmayın . Çok uzun süre hareketsiz kalırsanız, üzerinize bir bomba bıraklıacak ve oyundan atılacaksınız.",
			"\n* Bir tur sırasında ^FÖlüyken^0 kendinizi yeniden adlandırmayın, bunu yapmak sizi sunucudan atacaktır. Hayattaysanız yeniden adlandırabilirsiniz. Güvenli bir şekilde yeniden adlandırmak için oyunun ara vermesini bekleyin.",
			"Eğer bir ^5Katil^0 iseniz ^4Şerif'in Zümrütü^0 çevresinde kamp yapmaktan kaçının. Zümrütün yanında 30 saniye durmak, oyundan atılmanıza neden olacaktır.",
			"\nBu kurallardan birini ihlal etmek, oyundan atılma veya bazı durumlarda Yönetici tarafından yasaklanma ile sonuçlanabilir. Adil oynayın ve eğlenin!"
		},
		{
			"^7Faydalı ipuçları^0\n",
			"^7Murder Mystery^0'deki oyununuz sırasında size yardımcı olabilecek bazı ipuçları topladık:",
			"\n* Karakter yetenekleri yönetici tarafından devre dışı bırakılırsa, iz birakmadan veya gürültü yapmadan sinsice dolaşmak için ^7SPIN^0 tuşuna basın.",
			"\n* ^4Şerif'in Zümrütü^0'nü aldığınızda, önceden topladığınız tüm silahlara ve yüzüklere erişebileceksiniz.",
			"\n* Eylemleri ^Atakım arkadaşlarınız^0 ile koordine etmek ve dost ateşinden kaçınmak için Takım Sohbetini kullanın.",
			"\n* 3 saniyeliğine ölümsüzlük kazanmak için lav, dikenler ve ateş gibi engellerden zarar alabilirsiniz.",
			"\n* Tespit edilmemek için haritada saklanma yerleri bulun. Bazen görünmemek daha iyidir.",
			"\n* Rolünüz sızdırılırsa, kendinizi yeniden adlandırabilir ve/veya ten rengini değiştirebilirsiniz. ^2Yeniden adlandırmanızın sohbette gösterileceğini unutmayın^0.",
			"\n* Yüzükleriniz olduğu sürece^6 Bıçak^0'ı her yerde kullanmak için ^7FIRENORMAL^0 düğmesini kullanın. ^6Bıçak^0 kullanırken sinsice hareket etmek, saldırınızın sessiz olmasını sağlar.",
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
