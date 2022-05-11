--TRANSACTION

--Sipariş tablosuna insert atılsın ve sonra ürünün stoğundan düşülsün
--Dışarıdan ürün adı, fiyatı, stok ve kategori adı alan bir store proc yaz. Kategori yoksa yeni kategori oluştursun varsa mevctu kategorinin id sinin alsın.

alter proc addNewProduct(
    @productName nvarchar(MAX),
    @price money,
    @stock int,
    @categoryName NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN TRAN
    BEGIN TRY
    declare @categoryId int

    if exists(select *
    from Categories
    where LOWER(CategoryName) = LOWER(@categoryName))
BEGIN
        set @categoryId = (select ID
        from Categories
        where LOWER(CategoryName) = LOWER(@categoryName))
    END
ELSE
BEGIN
        insert into Categories
            (CategoryName)
        values(@categoryName)
        set @categoryId = @@IDENTITY
    --set @categoryId = select top 1 ID from Categories order by ID desc
    END

    insert into Products
        (ProductName, UnitPrice, UnitsInStock, CategoryID)
    values(@productName, @price, @stock, @categoryId)
    COMMIT
    END TRY
    BEGIN CATCH
    print('category patladı')
    ROLLBACK
    END CATCH
END


exec addNewProduct ' Store Procedure, View, Function, Trigger Store Procedure, View, Function, Trigger',22,5,'XX'


select * from Categories order by ID desc
-- Store Procedure, View, Function, Trigger, Transaction


--SupplierID null OLMAYAN kaç adet ürün var?
select COUNT(*) from Products where SupplierID is not null