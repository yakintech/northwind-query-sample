-- tüm supplierlarý ekrana yazdýrýr!
select * from Suppliers

--suppliers içerisindeki aþaðýda belirtilen 3 kolonu yakalar
select ContactName, ContactTitle, Region from Suppliers

select * from Products where UnitPrice > 20

select * from Products where UnitPrice > 20 and UnitsInStock > 10

--categoryid si 3 VEYA fiyatý 100 den KÜÇÜK eþit olanlarý bana ver
select * from Products where CategoryID = 3 or UnitPrice <= 100

-- ilk 10 ürünü bana ver
select top 10 * from Products

--fiyatý 20 den büyük ilk 5 ürünü bana ver
select top 5 * from Products where UnitPrice > 20

--ürün adý a harfi ile baþlayanlarý bana ver
select * from Products where ProductName like 'a%'

--ürün adý a ile bitenleri bana ver
select * from Products where ProductName like '%a'

--ürün adý içerisinde a geçenlerin listesi
select * from Products where ProductName like '%a%'

--ürün adýnda e geçen VE category id si 3 olan ürünleri bana ver
select ProductName, CategoryID, UnitPrice from Products where ProductName like '%e%' and CategoryID = 3


-- kaç adet ürün var?
select COUNT(*) from Products

--Ürünlerimin ortalama fiyatý
select AVG(UnitPrice) from Products

--category id si 3 olanlarýn ortalama fiyatý
select AVG(UnitPrice) from Products where CategoryID = 3

select ProductName Ad from Products

-- orderBy ve orderByDesc

-- Ürünleri ada göre sýrala
select * from Products order by ProductName

--ürünleri ada göre tersten sýrala
select * from Products order by ProductName desc


--ürün adýný listele. adýný büyük harf yazdýr
select Upper(ProductName) from Products

--ürün adýný listele. adýný küçük harf yazdýr
select Lower(ProductName) from Products








