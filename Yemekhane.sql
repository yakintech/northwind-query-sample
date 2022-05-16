--Yemek kategori, yemek
-- Sami geçen ay kaç kez et kategorisindeki yemekten yedi


create TABLE Yemek(
          ID int PRIMARY KEY IDENTITY(1,1),
          Ad NVARCHAR(MAX)
)

create TABLE YemekTipi(
          ID int PRIMARY KEY IDENTITY(1,1),
          Ad NVARCHAR(MAX)
)

--many to many - çoka çok
create table YemekYemekTipi(
    YemekTipiID int,
    YemekID int
)


--Bir adet kategori tablosu oluştur ve içerisine vatanbilgisauardaki gibi kategorileri gir. sorgu sonucumda kategorinin kendisi ve üst kategorisinin adı bana gelsin

create table VatanCategory(
    id int PRIMARY KEY IDENTITY(1,1),
    categoryName NVARCHAR(max),
    ownerCategoryId int
)

--ownerCategoryId 0 ise bu bir TOP category yani en tepedeki arkadaş!!
insert into VatanCategory(categoryName, ownerCategoryId)
values('NOTEBOOK', 2)

SELECT vc.categoryName, vc2.categoryName  topCategory FROM VatanCategory vc
inner join VatanCategory vc2
on vc.ownerCategoryId = vc2.id



