--ZAD1:
CREATE PROC ciag_Fib (@arg INT)
AS 
DECLARE @wynik INT=0;
DECLARE @fib_1 INT=0;
DECLARE @fib_2 INT=1;

IF @arg=1
BEGIN
 SET @wynik=0;
END;

ELSE 
BEGIN
	WHILE @arg-1 > 1
	BEGIN
	 SET @wynik = @fib_1 + @fib_2;
	 SET @fib_1 = @fib_2;
	 SET @fib_2 = @wynik;
	 SET @arg = @arg-1;
	END;
END;

SELECT @wynik as ciag_Fib;
RETURN;

--ZAD2:
CREATE  TRIGGER zad2_trigger ON [AdventureWorks2017].[Person].[Person]
FOR UPDATE AS
UPDATE Person SET LastName=upper(LastName)

--ZAD3:
CREATE TRIGGER taxRateMonitoring ON [AdventureWorks2017].[Sales].[SalesTaxRate]
AFTER UPDATE AS
BEGIN
SET NOCOUNT ON;
 DECLARE @new FLOAT;
 DECLARE @old FLOAT;
 SELECT @new=TaxRate FROM inserted
 SELECT @old=TaxRate FROM deleted
 
 IF((@new>@old+0.3*@old) OR (@new<@old-0.3*@old))
  BEGIN
     print 'Uwaga-wystapil blad'
     ROLLBACK
     RETURN
  END;
 END;
