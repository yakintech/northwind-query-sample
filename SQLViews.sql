-- SQL VİEW

create VIEW vw_ProductCS
as
select 
p.ProductName,
p.UnitPrice,
s.CompanyName,
s.ContactTitle,
c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.ID
INNER join Suppliers as s
on s.SupplierID = p.ProductID




select * from vw_ProductCS 
order by ProductName