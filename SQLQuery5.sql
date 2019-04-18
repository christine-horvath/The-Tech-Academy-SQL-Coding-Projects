USE AdventureWorks2014
Go

Create PROC dbo.uspGetAddress
	as
SELECT * FROM Person.Address;


EXEC dbo.uspGetAddress;

uspGetAddress

CREATE PROC dbo.uspGetCity @City nvarchar(30) 
AS
SELECT * from Person.Address 
WHERE City = @city 
GO

uspGetCity @city = 'New York'

create PROC dbo.uspGetCityTwo @city nvarchar(30)
AS
SELECT * 
FROM Person.Address 
WHERE city LIKE @city + '%'
GO

uspGetCityTwo @city = 'new york'

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.uspGetAddressFour @City nvarchar(30) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
GO
uspGetAddressFour

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.uspGetAddressFive @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address
WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO

EXEC dbo.uspGetAddressFive @City = 'Calgary'
--or
EXEC dbo.uspGetAddressFive @City = 'Calgary', @AddressLine1 = 'A'
--or
EXEC dbo.uspGetAddressFive @AddressLine1 = 'Acardia'

create proc dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUTPUT
AS
SELECT @AddressCount = count(*)
FROM AdventureWorks2014.Person.Address
WHERE City = @City

DECLARE @AddressCount int 
EXEC dbo.uspGetAddressCount @City = 'Calgary', @AddressCount = @AddressCount OUTPUT
SELECT @AddressCount


DROP PROC dbo.uspGetAddress
GO
Drop proc dbo.uspGetAddressCount
GO
