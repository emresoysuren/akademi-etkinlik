# Appkademi

<img height="160" src="https://github.com/emresoysuren/appkademi/blob/main/assets/logo.png?raw=true">

*Oyun ve Uygulama Akademisi Game & App Jam 2023 Projesi*

# Örnek Hesaplar (Eposta ve Şifreler)

Uygulamayı test edebilmek için gereken eposta ve şifreler aşağıdaki gibidir:

## Bursiyer
*   Eposta: user@user.com - Şifre: 123456
*   Eposta: user2@user2.com - Şifre: 123456

## Moderatör
*   Eposta: admin@admin.com - Şifre: 123456
*   Eposta: admin2@admin2.com - Şifre: 123456

# Uygulama Hakkında

Merhaba uygulamayı kullanırken uygulamanın moderatörler için ve bursiyerler için tasarlanmış iki farklı arayüzü olduğunu untmayınız.

Bursiyerlerin etkinlik, duyuru yayınlama ve düzenleme ve diğer kullanıcıların yorumlarını düzenleme ve silme gibi yetkileri bulunmamaktadır, bu işlemler sadece moderatörler tarafından yapılabilmektedir.

Moderatörler etkinlik ve duyuruları oluşturma ve düzenleme gibi sayfalara uygulamadaki ilgili yerlerdeki üç nokta işaretlerinden erişebilmektedirler.

Uygulamada etkinler için katılım ve değerlendirme formu dilediğiniz gibi özelleştirilebilmektedir. Formlar etkinlik oluşturma ve düzenleme sayfalrındaki "Form Ayarları"'ndan yaratılabilimektedir. Oluşturulan bütün formların ara yüzü uygulamanın veri tabanında depolanmmaktadır.

Giriş işlemleri sadece bursiyerlerin sahip oldukları epoatalarla yapılabilceğinden dolayı kayıt olma uygulamanın kendisine koyulmadı. Kayıt olma şu an sadece firebaseden (Uygulamanın sunucusundan) yetkili bir kişinin hesap oluşturması ile oluşturulabiliyor. Moderatörlerde aynı şekilde sunucudan atanmaktadırlar.

Bir eksi olarak toplanan verilerin adminlere sunulabilceği bir sayfa malesef henüz bulunmamaktadır. Ama veriler sunucuya gönderilmektedirler. Ayrıca form eğer kullanıcılar doldurduktan sonra değiştirilirse ne olur diye merak ediyorsanız, formlar kullanıcının doldurduğu haliyle yani değistirilmeden önceki haliyle soruları da anlaşılabilecek şekilde tutuluyor.

Etkinlik sayfasındaki form butonu, etkinlikten önce katılma formuna yönlendirirken etkinlikten sonra ve etkinlik günü değerlendirme formuna yönlendirmektedir.

**F - 59**