INSERT INTO Yazarlar (YazarAd, YazarSoyad) VALUES 
('Sabahattin', 'Ali'), ('Jack', 'London'), ('Franz', 'Kafka'), ('Victor', 'Hugo'),
('Reşat Nuri', 'Güntekin'), ('Fyodor', 'Dostoyevski'), ('Mehmet', 'Rauf'), 
('Zülfü', 'Livaneli'), ('Stefan', 'Zweig'), ('Gabriel', 'Marquez'), ('T.Y.', 'Mazer'),
('Şükrü', 'Erbaş'), ('Nazım', 'Hikmet'), ('Simon', 'Kernick'),  ('Selçuk', 'Aydemir'),('Lauren Ring', 'Brown'), ('Ryan', 'Holiday');

INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Roman'), ('Dünya Klasiği'), ('Psikoloji'), ('Tarih'), ('Bilim Kurgu'), 
('Felsefe'), ('Polisiye'), ('Şiir'), ('Biyografi'), ('Macera'), ('Mektup') ;

INSERT INTO Yayinevleri (YayineviAdi) VALUES 
('Doğan Kitap'), ('Türkiye İş Bankası Kültür Yayınları'), ('Olimpos Yayınları'), 
('Can Yayınları'), ('Ephesus Yayınları'), ('Kırmızı Kedi Yayınları'), ('İnkılap Yayınları'),
('Küsurat Yayınları'),('Yabancı Yayınları'),('Pegasus Yayınları');

-- Kitaplar 
EXEC sp_KitapEkle '9786050957501', 'Kürk Mantolu Madonna', 1,1,5,1;
EXEC sp_KitapEkle '9786053600199', 'İçimizdeki Şeytan', 1,1,15,2;
EXEC sp_KitapEkle '9786257070027', 'Değirmen', 1,1,9,2;
EXEC sp_KitapEkle '9786053600138', 'Beyaz Diş', 2, 2,3,2;
EXEC sp_KitapEkle '9786053322863', 'Yıldız Gezgini', 2,2,10,2;
EXEC sp_KitapEkle '9789750719356', 'Dönüşüm', 3,2,10,2;
EXEC sp_KitapEkle '978975073800', 'Milenaya Mektuplar', 3,11,3,4;
EXEC sp_KitapEkle '9789753630122', 'Sefiller', 4, 2,4,2;
EXEC sp_KitapEkle '9789754450538', 'Çalıkuşu', 5, 1,6,7;
EXEC sp_KitapEkle '9789750718533', 'Suç ve Ceza', 6, 2,7,2;
EXEC sp_KitapEkle '9786257070317', 'Eylül', 7,3,5,2;
EXEC sp_KitapEkle '9786050900286', 'Serenad', 8, 1,8,1;
EXEC sp_KitapEkle '9786053320272', 'Satranç', 9, 3,12,1;
EXEC sp_KitapEkle '9789750718000', 'Yüzyıllık Yalnızlık', 10, 1,4,1;
EXEC sp_KitapEkle '9786059232814', 'Lacivert', 11, 1,3,5;
EXEC sp_KitapEkle '9786052064870', 'Lacivert Amber', 11, 1,3,5;
EXEC sp_KitapEkle '9786052064535', 'Lacivert Safir', 11, 1,3,5;
EXEC sp_KitapEkle '9786053048022', 'Kızıl Kehribar', 11, 1,2,5;
EXEC sp_KitapEkle '9786059658904', 'Yaşıyoruz Sessizce', 12, 8,6,6;
EXEC sp_KitapEkle '9786052984277', 'Otların Uğultusu Altında', 12,8,9,6;
EXEC sp_KitapEkle '9786055340384', 'Bağbozumu Şarkıları', 12, 8,1,6;
EXEC sp_KitapEkle '9789750814068', 'Henüz Vakit Varken Gülüm', 13,8,8,6;
EXEC sp_KitapEkle '9786052063422', 'Son 10 Saniye', 14, 7,4,3;
EXEC sp_KitapEkle '9786056722707', 'Liseden Arkadaşlar', 15,9,2,8;
EXEC sp_KitapEkle '9786256826717', 'Yalanlar Cemiyeti', 16,10,2,9;
EXEC sp_KitapEkle '9786254100079', 'Stoacının Günlüğü', 17,6,5,10;



INSERT INTO Uyeler (Ad, Soyad, Eposta) VALUES 
('Pelin', 'Er', 'pelin@mail.com'), ('Türkan', 'Tan', 'türkan@mail.com'),
('Melis', 'Kaya', 'melis@mail.com'), ('Setenay', 'Çelik', 'setenay@mail.com'),
('Akın Kağan', 'Şahin', 'akın@mail.com'), ('Özkan', 'Aydın', 'özkan@mail.com'),
('Selvinur', 'Subaşı', 'selvinur@mail.com'), ('Ayyüce', 'Örün', 'ayyüce@mail.com'),
('Egemen', 'Sayın', 'egemen@mail.com'), ('Mert', 'Eren', 'mert@mail.com'), 
('Eren', 'Elmalı', 'eren@mail.com'),('Ayşe', 'Aslan', 'ayşe@mail.com');

INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (1, 1, 'Emanette');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (2, 2, 'Teslim Edildi');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (3, 3, 'Gecikmiş');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (4, 4, 'Emanette');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (5, 5, 'Emanette');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (6, 6, 'Teslim Edildi');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (7, 7, 'Emanette');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (8, 8, 'Emanette');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (9, 9, 'Teslim Edildi');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (10, 10, 'Gecikmiş');
INSERT INTO Emanetler (KitapID, UyeID, Durum) VALUES (11, 11, 'Teslim Edildi');

GO

