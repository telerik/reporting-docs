---
title: How to use MultiValue Report Parameter in a SQL query
description: "Learn how to Pass a MultiValue Report Parameter as SQL parameter value in a SQL query."
type: how-to
page_title: Using MultiValue Report Parameter in a SQL query
slug: how-to-use-multivalue-report-parameter-in-a-sql-query
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Item</td>
		<td>SqlDataSource</td>
	</tr>
</table>

## Description

This KB article explains how to use MultiValue Report Parameter in a SQL query.

## Solution

A multivalue report parameter's value is evaluated as an **array of objects** - [Using Multivalue Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%}).

- The value can be used directly in **SQL Text commands**. For example:

  ```SQL
  SELECT * from HumanResources.Department
  WHERE (COALESCE(@SelectedValues,Null) IS NULL) OR DepartmentID IN (@SelectedValues)
  ```

  On configuring SqlDataSource component with the above Text command, you can map directly the `@SelectedValues` SQL parameter to a multivalue report parameter - [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}#wizard) (step 4).

  > The *COALESCE* function is used as the multivalue parameter cannot be evaluated directly against NULL.

- The value has to be processed in order to be used in a **SQL StoredProcedure command**.

  For example, from the report, you can pass a string containing the comma-separated values. The SQL parameter expected by the stored procedure can be an _nvarchar_. The _nvarchar_ value can be split in the SQL query:

  ```SQL
  USE AdventureWorks
  GO
  SET ANSI_NULLS ON
  GO
  SET QUOTED_IDENTIFIER ON
  GO

  -- FUNCTION TO SPLIT STRINGS.
  CREATE FUNCTION splitstring
  ( @stringToSplit VARCHAR(MAX) )
  RETURNS
  @returnList TABLE ([Name] [nvarchar] (500))
  AS
  BEGIN

  DECLARE @name NVARCHAR(255)
  DECLARE @pos INT

  WHILE CHARINDEX(',', @stringToSplit) > 0
  BEGIN
  	SELECT @pos  = CHARINDEX(',', @stringToSplit)
  	SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  	INSERT INTO @returnList
  	SELECT @name

  	SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
  END

  INSERT INTO @returnList
  SELECT @stringToSplit

  RETURN
  END
  GO

  -- STORED PROCEDURE.
  CREATE PROCEDURE UseMultiValues
  	@SelectedValues nvarchar(150) = NULL
  AS
  BEGIN
  	-- SET NOCOUNT ON added to prevent extra result sets from
  	-- interfering with SELECT statements.
  	SET NOCOUNT ON;

  	select * from HumanResources.Department
  	where (@SelectedValues IS NULL) OR DepartmentID IN (select [Name] from dbo.splitstring(@SelectedValues))
  END
  GO
  ```

  The above is an example of a stored procedure and a function splitting a string by a given character.

## Notes

On configuring the SqlDataSource component, you can join the selected values of the multivalue report parameter into a single string by using the [Join built-in function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%}).

For example - `= If(Parameters.SelectedValues.Value Is Null, Null, Join(',', Parameters.SelectedValues.Value))`.

## See Also

- [Using Parameters with the SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%})
- [Configuring Stored Procedure with Temporary Tables]({%slug use-temporary-tables-in-stored-procedure%})
