---
title: How to Deal with SQL Server Stored Procedures with Optional Parameters
description: If you don't provide a value for an optional Stored Procedure parameter in the SqlDataSource, the Null value is passed, which overrides the default value
type: how-to
page_title: How to Deal with a SQL Server Stored Procedure Having an Optional Parameter
slug: how-to-deal-with-stored-procedure-optional-parameters
position: 
tags: 
ticketid: 1549336
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
If you don't provide a value for an optional SQL parameter, it actually receives NULL, which seems to override the default value. Even if you delete the parameter from the SqlDataSource, the Null value would be displayed for the optional parameter in the SQL Server Profiler.

## Suggested Workarounds

### Alter the Stored Procedure
You may include a conditional statement in the Stored Procedure that checks for the Null value for the optional parameters and sets it to the default value when Null. 

This works in the following cases:
 * when the parameter is set to Null
 * when you pass an empty value for the parameter
 * when you delete the parameter from the SqlDataSource

Here is the sample code for the Stored Procedure: 

``` SQL
ALTER PROCEDURE [dbo].[GetForGrade] 
	@grade int = 10
AS
BEGIN
	SET NOCOUNT ON;
	IF @grade IS NULL  
	BEGIN  
		 SET @grade = 10
	END 
	SELECT [SchoolYear]
      ,[School]
      ,[LastName]
      ,[FirstName]
      ,[Grade]
  FROM [dbo].[TestTable1]
  Where [Grade]=@grade
END
```

### Alter the Value Passed to the Stored Procedure Optional Parameter

If you cannot alter the Stored Procedure, you need to assure that the value passed to the SqlDataSource parameter is not Null. For example, you may use the 
following [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) when setting its value. It passes the hard-coded default 
SqlDataSource parameter value when the [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) 'grade' is _Null_: 

```SQL
= Parameters.grade.Value ?? 9
```

