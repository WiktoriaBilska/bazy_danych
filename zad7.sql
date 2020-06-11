--ZAD1
BEGIN
SELECT AVG(pay_history.Rate) AS placa FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay_history
SELECT * FROM [AdventureWorks2017].[HumanResources].[Employee] employee JOIN [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay_history
ON pay_history.BusinessEntityID = employee.BusinessEntityID WHERE pay_history.Rate < (SELECT AVG(pay_history.Rate) FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay_history)
END

--ZAD2
CREATE FUNCTION data_wysylki (@nr_zam NVARCHAR(25))
RETURNS TABLE AS
RETURN
(SELECT salesorder.ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] salesorder WHERE salesorder.SalesOrderNumber = @nr_zam)

--ZAD3
CREATE PROC produkt_info (@nazwa_prod NVARCHAR(100))
AS
SELECT ProductID, MakeFlag, ProductNumber FROM [AdventureWorks2017].[Production].[Product] produkt WHERE Name=@nazwa_prod
EXEC produkt_info "Blade"

--ZAD4
CREATE FUNCTION nr_karty (@numer NVARCHAR(25))
RETURNS TABLE AS
RETURN
(SELECT karta.[CardNumber] FROM [AdventureWorks2017].[Sales].[CreditCard] karta JOIN [AdventureWorks2017].[Sales].[SalesOrderHeader] salesorder ON karta.CreditCardID=salesorder.CreditCardID WHERE salesorder.SalesOrderNumber= @numer)
SELECT * FROM nr_karty('SO43659')

--ZAD5
CREATE PROC num_dziel (@num1 INT , @num2 INT)
AS
If @num1>@num2
BEGIN
SELECT @num1/@num2
END
ELSE
BEGIN
RAISERROR('Niewlasciwie zdefiniowales/as dane wejsciowe ',16,1)
END

EXEC num_dziel 40,20