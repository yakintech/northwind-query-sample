--Ford
--Fiesta
--Kullanıcıların araba kiraladığı bir normalizasyon. Her arabanın bir markası var, ve her model bir markaya bağlı
--Araba,Marka,Model

create table Araba(
     ID int PRIMARY KEY IDENTITY(1,1),
     ModelID int,
     Plaka NVARCHAR(MAX),
     IsSanruf BIT
)

create table Marka(
       ID int PRIMARY KEY IDENTITY(1,1),
       Ad NVARCHAR(MAX)
)

create table Model(
          ID int PRIMARY KEY IDENTITY(1,1),
          Ad NVARCHAR(MAX),
          MarkaID int
)

create table Uye(
          ID int PRIMARY KEY IDENTITY(1,1),
          Ad NVARCHAR(MAX),
          Soyad NVARCHAR(MAX),
          DogumTarih date
)

create table UyeAraba(
    UyeID int,
    ArabaId int,
    AlisTarih date,
    TeslimTarih date,
    Ucret money
)