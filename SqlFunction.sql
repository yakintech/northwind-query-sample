--Function lar genel olarak sql development sırasında bana yardımcı olurlar. Upper, Lower, Sum gibi sql içerisine gömülü functionlar da bulunmaktadır.

CREATE FUNCTION kdv_calc(
    @price MONEY
)
RETURNS MONEY
AS
BEGIN
return @price * 1.18
END

select dbo.kdv_calc(100)

