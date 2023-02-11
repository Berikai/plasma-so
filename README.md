# Plasma - SonOyuncu Minecraft Reach

> ## **Sürüm**: v1.3.3
> ## **Durum**: Güncel değil / Banlatıyor / Çalışmıyor.
> ## **Discord**: https://discord.gg/CAEJY2PNVc

> ## **Uyarı**: Bu proje tamamen eğitimsel amaçlarla yapılmıştır. İçerik herkese açık paylaşılmakla birlikte kullanımının yol açabileceği her türlü sorumluluktan bireyin kendisi sorumludur. 

![Plasma](/plasma.png)

## Kullanım

- `form.frm` dosyasını Cheat Engine dizinine atın.
- `plasma.lua` dosyasının içindeki kodları kopyalayıp Cheat Engine Lua Motoru ile başlatın.

## Ön Bilgi

Plasma, faaliyet göstereli oldukça zaman oldu. Basit bir minecraft hilesi projesiydi. Kullandığı "gamemode1" metodu sonraları popüler olsa da son kullanıcı için iyi bir kullanım deneyimi oluşturduğu için hızla popüler oldu ve yayıldı.

Çeşitli sebeplerden dolayı Plasma'yı [Cheat Engine Kaynak Deposu](https://github.com/cheat-engine/cheat-engine)'nu forklayıp kaynak kodunu düzenleyerek yaptım. Dolayısıyla Cheat Engine üstüne inşa edilmiş (ancak CETRAINER olmayan!) ve onu motoru olarak kullanan bağımsız bir executable ortaya çıkmış oldu. 

Cheat Engine kaynak koduna olan implementasyonu paylaşmıyorum çünkü Cheat Engine kaynak kodları oldukça fazla depolama alanı kaplıyor ve tek yaptığım Cheat Engine UI'ını gizleyip startup da lua motoruna lua kodlarını girip otomatik çalıştırtmaktı.

Lua kodlarını eğer Cheat Engine bilgisyarınızda kuruluysa bulabileceğiniz CE_DOCS.txt'yi okuyarak öğrenerek yazdım. (İngilizce önemli.) Cheat Engine scripting veya Lua öğrenmek istiyorsanız bakabilir uğraşabilirsiniz.

Yazılıma olan hobim genelde açık kaynak kültürü üzerinden şekillendiğinden ve oyun hileleri topluluklarındaki kültüre yabancı olduğumdan dolayı obfuscation ve benzeri alanlardaki tecrübesizliklerim yüzünden leak oldu. Süreç gelişimi açısından ve topluluk adına çok talihsiz olmuştu.

Saçma sapan olarak tanımlayacağım dramalar yaşandı. Bu tür topluluklardaki insanlar sürekli bir savaş, üstün gelme, aşağılama, ezikleme psikolojisinde. Benim her daim amacım kendimi mümkün olduğunca geliştirmekti. 

Olaylardan sonra Plasma'yı herkese açık bir sürüm olarak topluluğa paylaştım.

Şimdi, aradan ne kadar uzun zaman geçtiğini bilsem de, bir arşiv olarak da olsa kaynak kodlarını kendim paylaşmak istedim. Auth mekanizmasını kaldırdım. Ayrıca anlaşılabilirlik için yorum satırları da ekledim. Bir şeyler öğrenebilirseniz ne mutlu bana! Oldukça keyifli bir süreçti ve çok şey öğrendim. Süreci destekleyen herkese teşekkürler ❤️

## Plasma Nedir?

Plasma, SonOyuncu için Reach ve WallHit hilesini barındıran bir hiledir.

## Plasma Özellikleri

*Reach (5 Blok)
*WallHit
*Anti-cheat bypass

## Reach Nedir?

Reach, Minecraft'ta normal oyuncuların vurabilme mesafesinden daha uzaktan vurabilme hilesidir.

G'ye basılı tutarak aç/kapa yapabilirsiniz. Çatışma esnasında kapalı tutmanızı öneririz.

## WallHit Nedir? (Beta)

Blokların içinden blok kırmaya ve duvar içinden rakibe vurmayı sağlar. 

Reach'i açtığınızda creative modda gibi gözükürsünüz. Blok kırabilseniz de kırdığınız bloklar sunucuda hala duruyordur, sadece sizde görsel olarak gözükmez ve içinden geçemezsiniz. Ancak reach açıkken blokları kırıp bu blokların arkasındaki oyunculara vurabilirsiniz. Aynı zamanda reach açıkken blokları creativedeki gibi hızlıca kırıp ve reach'i kapatıp blokların içinden arkadaki blokları kırabilirsiniz. 

WallHit özelliği düzgün kullanılamadığında buglara yol açabilir!

WallHit ile kırdığınız bloklarla temas etmemeye çalışın!
 
## Hile nasıl kullanılır?

Gerekli dosyaları Cheat Engine ile aynı dizine attıktan sonra plasma.lua içindeki kodları Cheat Engine'in lua motoru üzerinden çalıştırabilirsiniz.

SonOyuncu Launcher'ı açın ve MaxRam'i 3072 yapın ardından sunucuya girin. Sunucuya girdikten sonra hileyi etkinleştir'e basınız.

