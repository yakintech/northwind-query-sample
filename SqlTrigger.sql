--TRIGGER
--Ürün tablosuna bir veri eklendiğinde x işlemini yap.
--Ürün tablosundan bir veri güncellendiğinde y işlemini yap.
--Ürün tablosunda  bir veri silindiğinde z işlemini yap.


enable TRIGGER dbo.trg_add_category on Categories

create TRIGGER trg_delete_category
on Categories
AFTER DELETE
AS
BEGIN
    print('Bir kategori silindi')
END


--Kategori adının karakteri 3 den küçükse eklemesin!!
--Bir kategori eklendikten sonra ekrana yeni bir kategori eklendi yazsın.
--Category tablosu üzerinde çalışan AFTER INSTERT TRIGGER I
DROP TRIGGER trg_add_category
on Categories
AFTER INSERT
as
BEGIN
    if(LEN((select CategoryName
    from inserted)) < 3)
BEGIN
        print('UYARI Böyle Bir kategori eklenemez')
        rollback transaction
    END
END


--Ürün eklerken eğer stok 5 in altındaysa ürünü eklemesin
--inserted sql içerisine gömülü bir tablo! son eklenen insert işlemini bana verir
CREATE TRIGGER trg_add_product
on Products
AFTER INSERT
AS
BEGIN

    declare @newStock INT
    set @newStock = (select UnitsInStock
    from inserted)

    if(@newStock < 5)
BEGIN
        PRINT('Stok adedi 5 den küçük olduğu için eklenemez!')
        ROLLBACK TRANSACTION
    END
END


insert into Products
    (ProductName, UnitPrice, UnitsInStock)
values('IPhone', 333, 112)

select *
from Products
order by ProductID desc









