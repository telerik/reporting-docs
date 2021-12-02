---
title: How to Create Bubble Chart
page_title: How to Create Bubble Chart | for Telerik Reporting Documentation
description: How to Create Bubble Chart
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-bubble-chart
tags: how,to,create,bubble,chart
published: True
position: 2
---

# How to Create Bubble Chart



In this article we will show you how to create a Bubble chart using the Graph item.       

## 

1. Add a new graph item to the report.

   1. Set the __DataSource__  property to a new                    __[SqlDataSource]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})__ .                 

   1. Set the connection string to the demo AdventureWorks database.

   1. Set the __query__  to the following one:                 

	
      ````sql

SELECT Sales.SalesOrderHeader.SubTotal, Person.Contact.FirstName+ ' '+ Person.Contact.LastName as [Name],
Sales.SalesOrderHeader.OrderDate
FROM  HumanResources.Employee
INNER JOIN Sales.SalesPerson ON HumanResources.Employee.EmployeeID = Sales.SalesPerson.SalesPersonID
INNER JOIN Sales.SalesOrderHeader ON Sales.SalesPerson.SalesPersonID = Sales.SalesOrderHeader.SalesPersonID
INNER JOIN Person.Contact ON HumanResources.Employee.ContactID = Person.Contact.ContactID
````




   1. You can click on __Execute Query...__  just to check if everything is OK with the database connection.                   Click __Finish__  when you are ready.                 

1. Open                __SeriesGroups__  collection editor and click __Add__ :             

   1. Set the new group __Groupings__  to: *=Fields.Name* 

   1. Set the __Sortings__  to: *=Sum(Fields.SubTotal)*  with Desc order.                 

   1. Set the __Name__  to *seriesGroup1* 

1. Open                __CategoryGroups__  collection editor and click __Add__ :             By default this will add a new static group (group without grouping).

   1. Set the __Name__  to *categoryGroup1* 

1. Open __CoordinateSystems__  collection editor and __Add__  a new __CartesianCoordinateSystem__ .             

   1. Leave the __Name__  to *cartesianCoordinateSystem1* .                 

   1. Set the __XAxis__  to __New Axis with Numerical Scale__ .                 

   1. Set the __YAxis__  to __New Axis with Numerical Scale__ .                 

1. Open __Series__  collection editor and __Add__  new __LineSeries__ .             

   1. Set the __CategoryGroup__  to __categoryGroup1__ .                 

   1. Set the __SeriesGroup__  to __seriesGroup1__ .                 

   1. Set the __CoordinateSystem__  to __cartesianCoordinateSystem1__ .                 

   1. Set the __X__  value to *=Sum(IIF(Fields.OrderDate.Year=2003, Fields.SubTotal, 0))* 

   1. Set the __Y__  value to *=Sum(IIF(Fields.OrderDate.Year=2004, Fields.SubTotal, 0))* 

   1. Set the __Size__  expression to *=Sum(IIF(Fields.OrderDate.Year=2004, Fields.SubTotal, 0)) - Sum(IIF(Fields.OrderDate.Year=2003, Fields.SubTotal, 0))* 

   1. Set the __LineStyle.Visible__  to __False__ .                 

   1. Set the __DataPointStyle.Visible__  to __True__ .                 

   1. Set the __MarkerType__  to __Circle__ .                 

1. Set the color palette, the formatting of the labels, the values of the legend and any other improvements as needed.             For more information, see [Formatting a Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/overview%}).             

# See Also

