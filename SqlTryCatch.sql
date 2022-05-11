
--TRY CATCH
--https://www.sqlservertutorial.net/sql-server-stored-procedures/sql-server-try-catch/

BEGIN TRY
delete from Categories
END TRY
BEGIN CATCH
select ERROR_MESSAGE()
select ERROR_LINE()
END CATCH