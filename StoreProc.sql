--Category tablosuna insert at

insert into Categories(CategoryName, Description)
values('Electronic', 'Electronic products')

--Store Procedure
--ürün adý, kategori adý ve ürünün fiyatýný bana veren sorguyu versin
--create anahatar kelimesi ile oluþturduk.
--alter
--drop

alter procedure sp_ProductCatList
as
begin
select 
p.ProductName, 
c.CategoryName, 
p.UnitPrice,
p.UnitsInStock
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
end


-- Dýþarýdan bir fiyat alan ve o fiyattan büyük ürünleri tablo olarak veren store procedure

create procedure sp_ProductListByPrice(@price money)
as
begin
select * from Products where UnitPrice > @price
end
exec sp_ProductListByPrice 20

--Dýþarýdan categoryName ve description alan ve aldýðý deðerleri büyütüp category tablosuna insert eden store procedure
--Eðer böyle bir kategori varsa insert ETME (name alanýndan kontrol et)

alter procedure sp_InsertCategory(@name nvarchar(max), @desc nvarchar(max))
as
begin
--kategorinin olup olmadýðýna bakýyoruz
declare @categoryCount int

set @categoryCount = (select COUNT(*) from Categories where CategoryName = @name)
if(@categoryCount = 0)
begin
insert into Categories(CategoryName,Description) values(@name, @desc)
end
else
begin
print('Böyle bir kategori mevcut')
end

end

exec sp_InsertCategory 'Camp', 'Camp products'


--IF EXISTS ile bir select sonucunun olup olmadýðýný kontrol edebilirsiniz
IF EXISTS(select * from Categories where CategoryID = 1)
begin
print('Böyle bir kategori mevcut!')
end

insert into Categories(CategoryName, Description) values('Sport', 'Sport products')
select @@IDENTITY
select IDENT_CURRENT('Products')


--Dýþarýdan companyName, ProductName ve UnitPrice alan
-- Eðer CompanyName Supplier tablosunda varsa o companyin ID sini (SupplieID) product a verecek yoksa yeni supplier oluþturacak ve onun id sini product a verecek

create procedure sp_addProductWithCompanyName(@productName nvarchar(MAX), @unitPrice money, @companyName nvarchar(MAX))
as
begin
--bu isimde bir companyName e sahip olan Supplier var mý?
declare @supplierID int

if EXISTS(select * from Suppliers where CompanyName = @companyName)
begin
set @supplierID = (select SupplierID from Suppliers where CompanyName = @companyName)
end
else
begin
insert into Suppliers(CompanyName) values(@companyName)
set @supplierID = @@IDENTITY
end

insert into Products(ProductName,UnitPrice,SupplierID) values(@productName, @unitPrice, @supplierID)

end

exec sp_addProductWithCompanyName 'Siemens-2',2000,'DEU Products'

--drop anahtar kelimesi sql objesini silmemi saðlar
drop proc sp_InsertCategory

--dýþarýdan bir fiyat alan ve o fiyattan büyük kaç adet ürün olduðunu BANA RETURN EDEN STORE PROCEDURE
create procedure sp_getProductsCountByPrice(@price money)
as
begin
return (select COUNT(*) from Products where UnitPrice > @price)
end


declare @productCount int
exec @productCount = sp_getProductsCountByPrice 20

--print(@productCount)
select @productCount
