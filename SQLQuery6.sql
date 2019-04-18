---Design a stored procedure that has at least two joins and two parameters---
--business entity ID in both hr.employee and hr.employeedepartmenthistory ---
SELECT * FROM humanResources.employee;

CREATE PROC dbo.GetNationalIDNumber
AS 
SELECT * from HumanResources.employee
GO
dbo.GetNationalIDNumber

create proc dbo.GetAddress
AS
SELECT * FROM person.Address
GO

GetNationalIDNumber

CREATE Proc dbo.GetBusinessEntityIDAboveTHIRTY
AS
SELECT * FROM HumanResources.employee where humanresources.employee.BusinessEntityID>30
GO



	
use AdventureWorks2014


UPDATE PROC dbo.GetAllKens @businessentityID int, @firstName OUTPUT 
AS
SELECT a.FirstName, a.LastName, c.[emailAddress], d.businessentityid
	FROM [person].[person] a
	INNER JOIN [person].[emailAddress] c ON c.BusinessEntityID=a.BusinessEntityID
	INNER JOIN [person].[BusinessEntity] d ON d.BusinessEntityID = c.BusinessEntityID where c.BusinessEntityID >= 1 and a.FirstName = 'Ken';

GO


create PROC dbo.GetAllKens  @firstName nvarchar(30), @businessentityID int OUTPUT
AS
SELECT a.FirstName, a.LastName, c.[emailAddress], d.businessentityid
	FROM [person].[person] a
	INNER JOIN [person].[emailAddress] c ON c.BusinessEntityID=a.BusinessEntityID
	INNER JOIN [person].[BusinessEntity] d ON d.BusinessEntityID = c.BusinessEntityID where c.BusinessEntityID >= 1 and a.FirstName = 'Ken';

GO

getallkens 
getallkens where @firstname = ken



