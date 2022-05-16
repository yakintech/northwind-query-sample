--a Üyeler kütüphaneden belirlenen sayıda kitabı alabilecek, belirlenen zamanda kitabı bırakabilecek ve cezaya tabi tutulabilecek
--her üye 3 kitap alabilir. bir kitap 7 gün içerisinde teslim edilmeldir..
 create table Uye(
  ID int PRIMARY KEY IDENTITY (1, 1),
  Ad NVARCHAR(MAX),
  Soyad NVARCHAR(MAX)
)

CREATE table Kitap(
    ID int PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(MAX),
    YayinlanmaTarih DATE
)

create table UyeKitap(
    ID int PRIMARY KEY IDENTITY(1,1),
    UyeId int,
    KitapId int,
    AlisTarih date,
    BirakisTarih date
)

create table Ceza(
    UyeKitapID int,
    CezaUcret money,
)



