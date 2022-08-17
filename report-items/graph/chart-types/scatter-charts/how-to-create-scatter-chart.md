---
title: Creating Scatter Charts
page_title: Creating Scatter Charts
description: "Learn how to display Scatter charts when working with Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/how-to-create-scatter-chart
tags: telerik, reporting, report, items, graph, creating, scatter, chart
published: True
position: 1
previous_url: /GraphHowToCreateScatterChart
---

# Creating Scatter Charts

This guide will demonstrate how to create a Scatter chart in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) when you are using the Graph report item. 

The following image shows a Scatter chart.

// add an image here 

## Adding the Graph 

To add a new Graph report item to the report: 

1. Set the __DataSource__ property to a new __[SqlDataSource]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})__.
1. Set the connection string to the demo AdventureWorks database.
1. Set the query to the following one:

  
      ````sql
SELECT Sales.SalesOrderHeader.SubTotal, Person.Contact.FirstName+ ' '+ Person.Contact.LastName as [Name],
Sales.SalesOrderHeader.OrderDate
FROM  HumanResources.Employee
INNER JOIN Sales.SalesPerson ON HumanResources.Employee.EmployeeID = Sales.SalesPerson.SalesPersonID
INNER JOIN Sales.SalesOrderHeader ON Sales.SalesPerson.SalesPersonID = Sales.SalesOrderHeader.SalesPersonID
INNER JOIN Person.Contact ON HumanResources.Employee.ContactID = Person.Contact.ContactID
````


1. Click __Execute Query...__ to check if everything is OK with the database connection. Click __Finish__ when you are ready. 
   
## Setting the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Scatter chart: 

1. Go to __Properties__ > __Data__. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.Name`.
1. Set the __Sortings__ to `=Sum(Fields.SubTotal)` with a `Desc` order. 
1. Set the __Name__ to `seriesGroup1`. 

## Setting the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Scatter chart:

1. Go to __Properties__ > __Data__. Open the __CategoryGroups__ collection editor and click __Add__. By default, this will add a new static group (group without grouping).
1. Set the __Name__ to `categoryGroup1`. 

## Configuring the Coordinate System

Here you will specify the coordinate system details: 

1. Go to __Properties__ > __Presentation__. Open the __CoordinateSystems__ collection editor and __Add__ a new __CartesianCoordinateSystem__. 
1. Leave the __Name__ to `cartesianCoordinateSystem1`. 
1. Set the __XAxis__ to __New Axis with Numerical Scale__. 
1. Set the __YAxis__ to __New Axis with Numerical Scale__. 

## Configuring the Series

In this step, you will configure the series of the chart:

1. Go to __Properties__ > __Presentation__. Open the __Series__ collection editor and __Add__ new __LineSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __cartesianCoordinateSystem1__. 
1. Set the __X__ value to `=Sum(IIf(Fields.OrderDate.Year=2003, Fields.SubTotal, 0))`.
1. Set the __Y__ value to `=Sum(IIf(Fields.OrderDate.Year=2004, Fields.SubTotal, 0))`.
1. Set the __LineStyle.Visible__ to __False__. 
1. Set the __DataPointStyle.Visible__ to __True__. 

## Styling the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

