-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Oca 2024, 18:01:38
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `insaat_proje_yonetimi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisan`
--

CREATE TABLE `calisan` (
  `Calisan_ID` int(11) NOT NULL,
  `Calisan_Adi` varchar(25) NOT NULL,
  `Pozisyon` varchar(25) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Telefon_Numarasi` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `calisan`
--

INSERT INTO `calisan` (`Calisan_ID`, `Calisan_Adi`, `Pozisyon`, `Adres`, `Telefon_Numarasi`) VALUES
(1, 'Ahmet Yılmaz', 'İnşaat Mühendisi', 'Cumhuriyet Mah.', 127),
(2, 'Ayşe Kaya', 'Mimar', 'Haznedar Mah.', 5559876543),
(3, 'Mehmet Demir', 'Usta', 'Köyiçi Mah.', 5552345678);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `is_tablosu`
--

CREATE TABLE `is_tablosu` (
  `Is_ID` int(11) NOT NULL,
  `Proje_ID` int(11) NOT NULL,
  `Tedarikci_ID` int(11) NOT NULL,
  `Tarih` date NOT NULL,
  `Maliyet` int(11) NOT NULL CHECK (`Maliyet` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `is_tablosu`
--

INSERT INTO `is_tablosu` (`Is_ID`, `Proje_ID`, `Tedarikci_ID`, `Tarih`, `Maliyet`) VALUES
(2, 3, 1, '2023-12-12', 15),
(3, 7, 1, '2023-12-13', 45);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanilir`
--

CREATE TABLE `kullanilir` (
  `Kullanilir_ID` int(11) NOT NULL,
  `Is_ID` int(11) NOT NULL,
  `Malzeme_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `kullanilir`
--

INSERT INTO `kullanilir` (`Kullanilir_ID`, `Is_ID`, `Malzeme_ID`) VALUES
(1, 2, 6),
(2, 3, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzeme`
--

CREATE TABLE `malzeme` (
  `Malzeme_ID` int(11) NOT NULL,
  `Malzeme_Adi` varchar(30) NOT NULL,
  `Birim_Fiyat` float(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `malzeme`
--

INSERT INTO `malzeme` (`Malzeme_ID`, `Malzeme_Adi`, `Birim_Fiyat`) VALUES
(1, 'Çimento', 50.00),
(4, 'Hilti', 105.00),
(5, 'Tuğla', 30.00),
(6, 'Seramik Fayans', 80.00),
(7, 'Çelik Profil', 150.00),
(8, 'Ahşap Kiriş', 120.00),
(9, 'PVC Boru', 20.00),
(10, 'Alüminyum Profil', 200.00),
(11, 'Yalıtım Levhası', 90.00),
(12, 'Boya', 40.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `muteahhit`
--

CREATE TABLE `muteahhit` (
  `Muteahhit_ID` int(11) NOT NULL,
  `Proje_ID` int(11) NOT NULL,
  `Muteahhit_Adi` varchar(25) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Telefon_Numarasi` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `muteahhit`
--

INSERT INTO `muteahhit` (`Muteahhit_ID`, `Proje_ID`, `Muteahhit_Adi`, `Adres`, `Telefon_Numarasi`) VALUES
(1, 4, 'İnşaat A.Ş.', 'Örnek Cad. No:123', 5551234567),
(2, 2, 'Yapı Mimarlık', 'Deneme Cad. No:456', 5559876543),
(4, 9, 'İnşaat Grup', 'Test Cad. No:789', 5552345678),
(5, 8, 'Yapı Kuruluş', 'Semt Mah. No:355', 5558765432);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `proje`
--

CREATE TABLE `proje` (
  `Proje_ID` int(11) NOT NULL,
  `Proje_Adi` varchar(25) NOT NULL,
  `Proje_Yeri` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `proje`
--

INSERT INTO `proje` (`Proje_ID`, `Proje_Adi`, `Proje_Yeri`) VALUES
(1, 'Yüksek Bina İnşaatı', 'Merkez Mah.'),
(2, 'Konut Kompleksi', 'Sahil Cad.'),
(3, 'Alışveriş Merkezi İnşaatı', 'Ana Bulvar'),
(4, 'Okul Yenileme Projesi', 'Köy Meydanı'),
(5, 'Otel İnşaatı', 'Tatil Beldesi'),
(6, 'Depo İnşaatı', 'Sanayi Bölgesi'),
(7, 'Ofis Binası İnşaatı', 'Finans Merkezi'),
(8, 'Spor Salonu İnşaatı', 'Spor Kompleksi'),
(9, 'AVM İnşaatı', 'Cumhuriyet Cad.'),
(10, 'Otobüs Terminali İnşaatı', 'Terminal Alanı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `saglar`
--

CREATE TABLE `saglar` (
  `Saglar_ID` int(11) NOT NULL,
  `Malzeme_ID` int(11) NOT NULL,
  `Tedarikci_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `saglar`
--

INSERT INTO `saglar` (`Saglar_ID`, `Malzeme_ID`, `Tedarikci_ID`) VALUES
(3, 5, 1),
(1, 8, 1),
(2, 12, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedarikci`
--

CREATE TABLE `tedarikci` (
  `Tedarikci_ID` int(11) NOT NULL,
  `Tedarikci_Adi` varchar(25) NOT NULL,
  `Urunler` varchar(100) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Telefon_Numarasi` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `tedarikci`
--

INSERT INTO `tedarikci` (`Tedarikci_ID`, `Tedarikci_Adi`, `Urunler`, `Adres`, `Telefon_Numarasi`) VALUES
(1, 'İnşaat Malzeme', 'İnşaat Malzemeleri', 'Hafiye Sok.', 5354777889);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yapar`
--

CREATE TABLE `yapar` (
  `Yapar_ID` int(11) NOT NULL,
  `Is_ID` int(11) NOT NULL,
  `Calisan_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tablo döküm verisi `yapar`
--

INSERT INTO `yapar` (`Yapar_ID`, `Is_ID`, `Calisan_ID`) VALUES
(1, 2, 2),
(2, 3, 3);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `calisan`
--
ALTER TABLE `calisan`
  ADD PRIMARY KEY (`Calisan_ID`);

--
-- Tablo için indeksler `is_tablosu`
--
ALTER TABLE `is_tablosu`
  ADD PRIMARY KEY (`Is_ID`),
  ADD KEY `Proje_ID` (`Proje_ID`,`Tedarikci_ID`),
  ADD KEY `Tedarikci_ID` (`Tedarikci_ID`),
  ADD KEY `Proje_ID_2` (`Proje_ID`,`Tedarikci_ID`);

--
-- Tablo için indeksler `kullanilir`
--
ALTER TABLE `kullanilir`
  ADD PRIMARY KEY (`Kullanilir_ID`),
  ADD KEY `Is_ID` (`Is_ID`,`Malzeme_ID`),
  ADD KEY `Malzeme_ID` (`Malzeme_ID`),
  ADD KEY `Is_ID_2` (`Is_ID`,`Malzeme_ID`);

--
-- Tablo için indeksler `malzeme`
--
ALTER TABLE `malzeme`
  ADD PRIMARY KEY (`Malzeme_ID`);

--
-- Tablo için indeksler `muteahhit`
--
ALTER TABLE `muteahhit`
  ADD PRIMARY KEY (`Muteahhit_ID`),
  ADD KEY `Proje_ID` (`Proje_ID`);

--
-- Tablo için indeksler `proje`
--
ALTER TABLE `proje`
  ADD PRIMARY KEY (`Proje_ID`);

--
-- Tablo için indeksler `saglar`
--
ALTER TABLE `saglar`
  ADD PRIMARY KEY (`Saglar_ID`),
  ADD KEY `Malzeme_ID` (`Malzeme_ID`,`Tedarikci_ID`),
  ADD KEY `Tedarikci_ID` (`Tedarikci_ID`);

--
-- Tablo için indeksler `tedarikci`
--
ALTER TABLE `tedarikci`
  ADD PRIMARY KEY (`Tedarikci_ID`);

--
-- Tablo için indeksler `yapar`
--
ALTER TABLE `yapar`
  ADD PRIMARY KEY (`Yapar_ID`),
  ADD KEY `Is_ID` (`Is_ID`,`Calisan_ID`),
  ADD KEY `Calisan_ID` (`Calisan_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `calisan`
--
ALTER TABLE `calisan`
  MODIFY `Calisan_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `is_tablosu`
--
ALTER TABLE `is_tablosu`
  MODIFY `Is_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `kullanilir`
--
ALTER TABLE `kullanilir`
  MODIFY `Kullanilir_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `malzeme`
--
ALTER TABLE `malzeme`
  MODIFY `Malzeme_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `muteahhit`
--
ALTER TABLE `muteahhit`
  MODIFY `Muteahhit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `proje`
--
ALTER TABLE `proje`
  MODIFY `Proje_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `saglar`
--
ALTER TABLE `saglar`
  MODIFY `Saglar_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tedarikci`
--
ALTER TABLE `tedarikci`
  MODIFY `Tedarikci_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `yapar`
--
ALTER TABLE `yapar`
  MODIFY `Yapar_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `is_tablosu`
--
ALTER TABLE `is_tablosu`
  ADD CONSTRAINT `is_tablosu_ibfk_1` FOREIGN KEY (`Proje_ID`) REFERENCES `proje` (`Proje_ID`),
  ADD CONSTRAINT `is_tablosu_ibfk_2` FOREIGN KEY (`Tedarikci_ID`) REFERENCES `tedarikci` (`Tedarikci_ID`);

--
-- Tablo kısıtlamaları `kullanilir`
--
ALTER TABLE `kullanilir`
  ADD CONSTRAINT `kullanilir_ibfk_1` FOREIGN KEY (`Is_ID`) REFERENCES `is_tablosu` (`Is_ID`),
  ADD CONSTRAINT `kullanilir_ibfk_2` FOREIGN KEY (`Malzeme_ID`) REFERENCES `malzeme` (`Malzeme_ID`);

--
-- Tablo kısıtlamaları `muteahhit`
--
ALTER TABLE `muteahhit`
  ADD CONSTRAINT `muteahhit_ibfk_1` FOREIGN KEY (`Proje_ID`) REFERENCES `proje` (`Proje_ID`);

--
-- Tablo kısıtlamaları `saglar`
--
ALTER TABLE `saglar`
  ADD CONSTRAINT `saglar_ibfk_1` FOREIGN KEY (`Malzeme_ID`) REFERENCES `malzeme` (`Malzeme_ID`),
  ADD CONSTRAINT `saglar_ibfk_2` FOREIGN KEY (`Tedarikci_ID`) REFERENCES `tedarikci` (`Tedarikci_ID`);

--
-- Tablo kısıtlamaları `yapar`
--
ALTER TABLE `yapar`
  ADD CONSTRAINT `yapar_ibfk_1` FOREIGN KEY (`Is_ID`) REFERENCES `is_tablosu` (`Is_ID`),
  ADD CONSTRAINT `yapar_ibfk_2` FOREIGN KEY (`Calisan_ID`) REFERENCES `calisan` (`Calisan_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
