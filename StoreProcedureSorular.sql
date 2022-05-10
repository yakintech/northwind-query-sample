-- Store Procedure Sorular

--1) D��ar�dan CompanyName, ContactName ve ContactTitle alan ve yeni bir supplier ekleyen store procedure
create procedure sp_stockController(@UnitsInStock int)
as
begin
select * from Products where UnitsInStock < @UnitsInStock
end

--2) D��ar�dan stok adedi alan ve o stok adedinin alt�nda �r�nleri select olarak yazan store procedure
drop procedure ps_listProducts(@stocks int)
as
begin
select * from Products where UnitsInStock < @stocks
end
execute ps_listProducts 10

--3) D��ar�dan bir �r�n ad� alan, �r�n varsa 1 yoksa 0 print eden store procedure

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

--4) �r�n ekleyen bir store proc yazaca��z. d��ar�dan ad, fiyat ve stok alacak.
--Kurallar
--Stok 5 den k���kse ekrana 'Stok adedi 5 den k���k olan �r�n EKLENEMEZ' yazs�n
--Fiyat 200 den b�y�kse %10 indirim yap�p eklenecek de�ilse ayn� �creti yazs�n

create proc sp_addProductWithRules(@name nvarchar(MAX) ,@price money ,@stock int)
as
begin
if(@stock < 5)
begin
print('Stok adedi 5 den k���k olan �r�n EKLENEMEZ')
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


--5) D��ar�dan y�l ve ay alan ve buna g�re sipari�leri (orderDate) tarihe g�re tersten s�ralay�p bana veren store procedure

alter procedure sp_GetOrdersByDateFilter(@year int, @month int)
as
begin
select * from Orders where YEAR(OrderDate) = @year and MONTH(OrderDate) = @month
order by OrderDate desc
end

exec sp_GetOrdersByDateFilter 1996, 10


--6) D��ar�dan y�l alan ve ald��� y�la g�re OrderID, Customer�n companyName i, Customer �n Contact title ve Sipari�in TOPLAM TUTARI �eklinde 4 kolonu bana veren store procedure

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





--Geciken sipari�leri bana veren store procedure
--Ka� adet geciken sipari� oldu�unu print eden store procedure
-- D��ar�dan FirstName, LastName, Address ve City alan ona g�re employee ekleyen store procedure
--D��ar�dan Name alan ve ald��� name e g�re buldu�u product � silen store procedure. b�y�k k���k harf farketmemeli ( hata verecek!)


select * from Employees