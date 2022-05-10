-- t�m supplierlar� ekrana yazd�r�r!
select * from Suppliers

--suppliers i�erisindeki a�a��da belirtilen 3 kolonu yakalar
select ContactName, ContactTitle, Region from Suppliers

select * from Products where UnitPrice > 20

select * from Products where UnitPrice > 20 and UnitsInStock > 10

--categoryid si 3 VEYA fiyat� 100 den K���K e�it olanlar� bana ver
select * from Products where CategoryID = 3 or UnitPrice <= 100

-- ilk 10 �r�n� bana ver
select top 10 * from Products

--fiyat� 20 den b�y�k ilk 5 �r�n� bana ver
select top 5 * from Products where UnitPrice > 20

--�r�n ad� a harfi ile ba�layanlar� bana ver
select * from Products where ProductName like 'a%'

--�r�n ad� a ile bitenleri bana ver
select * from Products where ProductName like '%a'

--�r�n ad� i�erisinde a ge�enlerin listesi
select * from Products where ProductName like '%a%'

--�r�n ad�nda e ge�en VE category id si 3 olan �r�nleri bana ver
select ProductName, CategoryID, UnitPrice from Products where ProductName like '%e%' and CategoryID = 3


-- ka� adet �r�n var?
select COUNT(*) from Products

--�r�nlerimin ortalama fiyat�
select AVG(UnitPrice) from Products

--category id si 3 olanlar�n ortalama fiyat�
select AVG(UnitPrice) from Products where CategoryID = 3

select ProductName Ad from Products

-- orderBy ve orderByDesc

-- �r�nleri ada g�re s�rala
select * from Products order by ProductName

--�r�nleri ada g�re tersten s�rala
select * from Products order by ProductName desc


--�r�n ad�n� listele. ad�n� b�y�k harf yazd�r
select Upper(ProductName) from Products

--�r�n ad�n� listele. ad�n� k���k harf yazd�r
select Lower(ProductName) from Products








