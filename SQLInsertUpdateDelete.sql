--category insert komutu
insert into Categories(CategoryName, [Description])
values('Electronic', 'Electronic products')

--delete komutu
delete from Categories 
where CategoryID = 11


-- id 3 olan kategorinin adýný Electronic yap
update Categories set CategoryName = 'Electronic'
where CategoryID = 3



