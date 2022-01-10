---
title: Configuring Stored Procedure with Temporary Tables
description: This articles explains how to use temporary tables in the stored procedure to retrieve the schema. 
type: how-to
page_title: Configuring Stored Procedure with Temporary Tables for use with SqlDataSource component or Cursor Variable
slug: use-temporary-tables-in-stored-procedure
position: 
tags: 
ticketid: 1410174
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
    </tbody>
</table>


## Description
The SqlDataSource uses the standard ADO.NET data provider to load the report data and metadata. 
As of SQL Server 2016 Temporary Tables can be replaced with the better performing Memory-Optimized Tables. This includes mechanism allowing you to get the schema of temporary objects correctly. The FMTONLY setting is deprecated. For more details, please check [Using Memory-Optimized Tables to Replace SQL Server Temp Tables and Table Variables](https://www.sqlshack.com/using-memory-optimized-tables-to-replace-sql-server-temp-tables-and-table-variables/).

## Solution
**For Cursor Variables:**
To be able to use stored procedures which contain cursors, you have to turn off FMTONLY in a seemingly never executed statement. In this way the data schema can be read by the Data Explorer as each state of IF-ELSE statements is evaluated when the SQL query is run by the SqlDataSource Wizard. The check will be skipped when the same SQL query is used by calling application at run-time.

```
BEGIN
        SET NOCOUNT ON;
         IF 1=0 BEGIN
           SET FMTONLY OFF
     END
    DECLARE @SQL NVARCHAR(MAX)
    DECLARE @Next NVARCHAR(MAX)
    DECLARE db_cursor CURSOR FOR SELECT  DISTINCT Gender From HumanResources.Employee
        . . .
 
END
GO
```

**For MSSQL engines before SQL Server 2016.**
In order to use stored procedures containing temporary tables, you also have to turn off FMTONLY in a seemingly never executed statement. Thus the data schema of temporary tables can be read by the SqlDataSource Wizard as each state of IF-ELSE statements is evaluated when the SQL query is run by the SqlDataSource Wizard. The check will be skipped when the same SQL query is used by calling application at run-time.

For example consider the following SQL CREATE stored procedure statement:

```
USE AdventureWorks
GO
CREATE PROCEDURE dbo.Demo
     
AS
BEGIN
    SET NOCOUNT ON;
     IF 1=0 BEGIN
       SET FMTONLY OFF
     END
    
    CREATE TABLE #Temp
    (
        ProductID   integer NOT NULL,
        Name        nvarchar(50) COLLATE DATABASE_DEFAULT NOT NULL
    );
    
    INSERT INTO #Temp
        ([ProductID], [Name])
    SELECT
        p.[ProductID], p.[Name]
    FROM Production.Product AS p
     
    SELECT
        t.[Name], t.[ProductID]
    FROM #Temp AS t
    
    DROP TABLE #Temp;
END;
```

**For MSSQL Engines after SQL Server 2014**
You can use memory optimized tables, where the data schema can be obtained correctly when you work with SQL Server 2016.
USE AdventureWorks

```
USE AdventureWorks
GO
CREATE TYPE MemoryOptTabVar as TABLE (
   [ProductID] integer NOT NULL ,
   [Name] nvarchar(50) NULL,
   INDEX IX_MemoryOptTabVar_ID NONCLUSTERED ([ProductID])
) WITH (MEMORY_OPTIMIZED = ON)
GO
 
CREATE PROCEDURE dbo.MemoryOptTableVarExample
AS
BEGIN
SET NOCOUNT ON;
    DECLARE @MemOptVarTab MemoryOptTabVar ;
       INSERT @MemOptVarTab ([ProductID], [Name])
    SELECT
        p.[ProductID], p.[Name]
    FROM Production.Product AS p
       SELECT * FROM @MemOptVarTab
END
GO
```
