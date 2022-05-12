-- store proc, trigger, transaction, function, view
--one to many
--Bir kullanıcının birden fazla adresi olabilir. Bir adres SADECE BİR KULLANICIYA AİTTİR
CREATE TABLE WebUser(
    ID int PRIMARY KEY IDENTITY (1, 1),
    FirstName NVARCHAR(MAX) NOT NULL,
    LastName NVARCHAR(MAX),
    Phone NVARCHAR(MAX) 
)

CREATE TABLE WebUserAddress(
    ID int PRIMARY KEY IDENTITY(1,1),
    Street NVARCHAR(MAX),
    City NVARCHAR(MAX),
    Country NVARCHAR(MAX),
    WebUserID int
)

-- Kullanıcın Adı, Soyadı, Şehri

select 
w.FirstName,
w.LastName,
wua.City
from WebUser w
inner join WebUserAddress wua
on w.ID = wua.WebUserID

--ID si 2 olan kullanıcının kaç adresi var?
select COUNT(*) from WebUserAddress where WebUserID = 2

--Bir yazarın birden fazla kitabı olabilir. Bir kitap birden çok yazar tarafından yazılabilir

CREATE TABLE Author(
    ID int PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(MAX),
    LastName NVARCHAR(MAX),
    BirthDate Date
)
-- ID 1 den başlayacak ve birer birer artacak
CREATE TABLE Book(
    ID int PRIMARY KEY IDENTITY(1,1),
    BookName NVARCHAR(MAX),
    PublishDate Date
)
--many to many
CREATE TABLE BookAuthor(
    BookID int,
    AuthorID int
)

--Kitabın Adı, Yazarının Adı, Yazarının Soyadı
select 
b.BookName,
a.FirstName,
a.LastName
from BookAuthor ba
inner join Author a
on ba.AuthorID = a.ID
inner join Book b
on b.ID = ba.BookID


--Öğrenci => Ad, Soyad, No, EMail, Telefon, DogumTarih
--Eğitmen => Ad, Soyad
--Bölüm => Ad, Kurulus Tarih
-- Fakulte => Ad

--Not: Bir bölüm sadece bir fakülteye aittir.
-- Bir eğitmen aynı anda iki bölüme ait olabilir.
-- Bir öğrencinin sadece bir bölümü vardır.

--Sorgular
-- Öğrenci Ad, Soyad, Bölüm Ad, Fakülte Ad
-- Eğitmen Ad, Bölüm Ad
-- Fen Fakültesindeki EĞİTMENLERİ LİSTELE
-- Fakülte ekleyen bir store procedure yaz
-- Herhangi bir fakülte eklendiğinde ekrana 'Yeni bir fakülte eklendi!' yazsın (TRIGGER)
-- Bölüm ID, Ad, Fakülte Ad isimli 3 kolonu olan bir VIEW yaz












