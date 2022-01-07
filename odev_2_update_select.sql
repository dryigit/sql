CREATE TABLE calisanlar
(
id CHAR(4),
isim VARCHAR(50),
maas int(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

select * from calisanlar;

CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);
INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500);
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);

select * from aileler;

-- Veli Han'ın maaşına %20 zam yapacak update komutunu yazınız.
-- Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.

update calisanlar
set maas=maas + (maas*20/100)
where id ='1004';  


-- Maaşı ortalamanın altında olan çalışanların maaşına %20 zam yapınız.
-- Komut sonrası görünüm aşağıdaki gibidir.

update calisanlar
set maas=maas*1.2 
where maas<(select AVG(maas)from (select maas from calisanlar) rasgeleisim);
