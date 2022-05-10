-- Store Procedure Sorular

--1) Dýþarýdan CompanyName, ContactName ve ContactTitle alan ve yeni bir supplier ekleyen store procedure
create procedure sp_stockController(@UnitsInStock int)
as
begin
select * from Products where UnitsInStock < @UnitsInStock
end

--2) Dýþarýdan stok adedi alan ve o stok adedinin altýnda ürünleri select olarak yazan store procedure
drop procedure ps_listProducts(@stocks int)
as
begin
select * from Products where UnitsInStock < @stocks
end
execute ps_listProducts 10

--3) Dýþarýdan bir ürün adý alan, ürün varsa 1 yoksa 0 print eden store procedure

create procedure sp_ProductNameControl(@name nvarchar(MAX))
as
begin
if EXISTS(select * from Products where ProductName = @name)
begin
print('1')
end
else
begin
print('0')
end
end

--4) Ürün ekleyen bir store proc yazacaðýz. dýþarýdan ad, fiyat ve stok alacak.
--Kurallar
--Stok 5 den küçükse ekrana 'Stok adedi 5 den küçük olan ürün EKLENEMEZ' yazsýn
--Fiyat 200 den büyükse %10 indirim yapýp eklenecek deðilse ayný ücreti yazsýn

create proc sp_addProductWithRules(@name nvarchar(MAX) ,@price money ,@stock int)
as
begin
if(@stock < 5)
begin
print('Stok adedi 5 den küçük olan ürün EKLENEMEZ')
end
else
begin
declare @newPrice money

if(@price > 200)
begin
set @newPrice = @price * 0.9
end
else
begin
set @newPrice = @price
end

insert into Products(ProductName, UnitPrice, UnitsInStock)
values(@name, @newPrice, @stock)
end
end


exec sp_addProductWithRules 'IPhone',1000,55


select top 1 * from Products order by ProductID desc


--5) Dýþarýdan yýl ve ay alan ve buna göre sipariþleri (orderDate) tarihe göre tersten sýralayýp bana veren store procedure

alter procedure sp_GetOrdersByDateFilter(@year int, @month int)
as
begin
select * from Orders where YEAR(OrderDate) = @year and MONTH(OrderDate) = @month
order by OrderDate desc
end

exec sp_GetOrdersByDateFilter 1996, 10


--6) Dýþarýdan yýl alan ve aldýðý yýla göre OrderID, Customerýn companyName i, Customer ýn Contact title ve Sipariþin TOPLAM TUTARI þeklinde 4 kolonu bana veren store procedure

create procedure sp_GetOrdersDetailByYear(@year int)
as
begin
select 
o.OrderID,
c.CompanyName,
c.ContactTitle
--od.Quantity * od.UnitPrice
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
where YEAR(o.OrderDate) = @year
end





--Geciken sipariþleri bana veren store procedure
--Kaç adet geciken sipariþ olduðunu print eden store procedure
-- Dýþarýdan FirstName, LastName, Address ve City alan ona göre employee ekleyen store procedure
--Dýþarýdan Name alan ve aldýðý name e göre bulduðu product ý silen store procedure. büyük küçük harf farketmemeli ( hata verecek!)


select * from Employees