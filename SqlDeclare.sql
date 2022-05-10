-- SQL
-- T-SQL => MSSQL
-- PL-SQL => ORACLE
-- P-SQL => POSTGRESQL

-- int number = 3

declare @number int
set @number = 3

declare @name nvarchar
set @name = 'Çağatay'


--Ekrana 10 kere Yunus Emre yaz

declare @counter int
set @counter = 0

while(@counter < 10)
begin
print('Yunus Emre')
 set @counter = @counter + 1
end
