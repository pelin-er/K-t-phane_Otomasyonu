-- 1. VERİTABANINI OLUŞTURMA
CREATE DATABASE KutuphaneOtomasyon;
GO
USE KutuphaneOtomasyon;
GO


-- 2. TABLOLARI OLUŞTURULMA

CREATE TABLE Yazarlar (
    YazarID INT IDENTITY(1,1) PRIMARY KEY,
    YazarAd NVARCHAR(50) NOT NULL,   
    YazarSoyad NVARCHAR(50) NOT NULL,
);

CREATE TABLE Kategoriler (
    KategoriID INT IDENTITY(1,1) PRIMARY KEY,
    KategoriAdi NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Yayinevleri (
    YayineviID INT IDENTITY(1,1) PRIMARY KEY,
    YayineviAdi NVARCHAR(100) NOT NULL UNIQUE,
    Adres NVARCHAR(255)
);

CREATE TABLE Kitaplar (
    KitapID INT IDENTITY(1,1) PRIMARY KEY,
    ISBN NVARCHAR(13) NOT NULL UNIQUE,
    KitapIsmi NVARCHAR(100) NOT NULL, 
    YazarID INT,
    KategoriID INT,
    YayineviID INT,
    SayfaSayisi INT CHECK (SayfaSayisi > 0),
    StokSayisi INT DEFAULT 0 CHECK (StokSayisi >= 0),
    FOREIGN KEY (YazarID) REFERENCES Yazarlar(YazarID),
    FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID),
    FOREIGN KEY (YayineviID) REFERENCES Yayinevleri(YayineviID)
);

CREATE TABLE Uyeler (
    UyeID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Eposta NVARCHAR(100) UNIQUE NOT NULL,
    KayitTarihi DATETIME DEFAULT GETDATE(),
    AktifMi BIT DEFAULT 1
);

CREATE TABLE Emanetler (
    EmanetID INT IDENTITY(1,1) PRIMARY KEY,
    KitapID INT NOT NULL,
    UyeID INT NOT NULL,
    AlmaTarihi DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    IadeTarihi DATE NULL,
    Durum NVARCHAR(20) DEFAULT 'Emanette' CHECK (Durum IN ('Emanette', 'Teslim Edildi', 'Gecikmiş')),
    FOREIGN KEY (KitapID) REFERENCES Kitaplar(KitapID),
    FOREIGN KEY (UyeID) REFERENCES Uyeler(UyeID)
);


GO

-- 3. İNDEKSLER 
CREATE INDEX IDX_KitapIsmi ON Kitaplar(KitapIsmi);
CREATE INDEX IDX_UyeEposta ON Uyeler(Eposta);
GO

-- 4. GÖRÜNÜM 
CREATE OR ALTER VIEW View_KitapDetaylari AS
SELECT 
    k.KitapID,
    k.KitapIsmi, 
    y.YazarAd + ' ' + y.YazarSoyad AS Yazar, 
    c.KategoriAdi AS Kategori,
    p.YayineviAdi AS Yayinevi,
    k.StokSayisi
FROM Kitaplar k
LEFT JOIN Yazarlar y ON k.YazarID = y.YazarID
LEFT JOIN Kategoriler c ON k.KategoriID = c.KategoriID
LEFT JOIN Yayinevleri p ON k.YayineviID = p.YayineviID;
GO

-- 5. STORED PROCEDURE
CREATE OR ALTER PROCEDURE sp_KitapEkle
    @ISBN NVARCHAR(13), 
    @KitapIsmi NVARCHAR(100), 
    @YazarID INT, 
    @KatID INT, 
    @Stok INT,
    @YayineviID INT
AS
BEGIN
    INSERT INTO Kitaplar (ISBN, KitapIsmi, YazarID, KategoriID, StokSayisi, YayineviID)
    VALUES (@ISBN, @KitapIsmi, @YazarID, @KatID, @Stok, @YayineviID);
END
GO

-- 6. TETİKLEYİCİLER
CREATE OR ALTER TRIGGER TRG_StokAzalt
ON Emanetler
AFTER INSERT
AS
BEGIN
    UPDATE Kitaplar SET StokSayisi = StokSayisi - 1
    FROM Kitaplar INNER JOIN inserted ON Kitaplar.KitapID = inserted.KitapID;
END
GO



CREATE OR ALTER TRIGGER TRG_StokArtir
ON Emanetler
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Durum)
    BEGIN
        UPDATE Kitaplar
        SET StokSayisi = Kitaplar.StokSayisi + 1
        FROM Kitaplar
        INNER JOIN inserted i ON Kitaplar.KitapID = i.KitapID
        INNER JOIN deleted d ON i.EmanetID = d.EmanetID
        WHERE i.Durum = 'Teslim Edildi' AND d.Durum <> 'Teslim Edildi';
    END
END
GO