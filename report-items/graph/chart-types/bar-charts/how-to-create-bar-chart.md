---
title: Creating Bar Charts
page_title: Creating Bar Charts 
description: "Learn how to display Bar charts when working with Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/how-to-create-bar-chart
tags: telerik, reporting, report, items, graph, creating, bar, chart
published: True
position: 1
previous_url: /GraphHowToCreateBarChart
---

# Creating Bar Charts

This guide will demonstrate how to create a Bar chart when you are using the Graph report item. 

The following image shows a Bar chart.

![graph bars\Bar Chart](images/Graph/BarChart.png)

## Adding the Graph 

To add a new Graph report item to the report: 

1. Set the __DataSource__ property to a new __[SqlDataSource]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})__.
1. Set the connection string to the demo AdventureWorks database.
1. Set the query to the following one:

      ````sql
SELECT SOD.LineTotal, SOH.OrderDate, PC.Name AS Category
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Production.Product AS P ON SOD.ProductID = P.ProductID
INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID
````


1. Click __Execute Query...__ to check if everything is OK with the database connection. Click __Finish__ when you are ready. 

## Setting the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Bar chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.Category`.
1. Set the __Sortings__ to `=Fields.Category`. 
1. Set the __Filter__ to `=Fields.Category ```<>``` Bikes`. 
1. Set the __Name__ to `seriesGroup1`. 

## Setting the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Bar chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. 
1. Set the __Groupings__ to `=Fields.OrderDate.Year`.
1. Set the __Sortings__ to `=Fields.OrderDate.Year`.
1. Set the __Name__ to `categoryGroup1`. 

## Configuring the Coordinate System

Here you will specify the coordinate system details: 

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __CartesianCoordinateSystem__. 
1. Leave the __Name__ to `cartesianCoordinateSystem1`. 
1. Set the __XAxis__ to __New Axis with Numerical Scale__. 
1. Set the __YAxis__ to __New Axis with Category Scale__. 


## Configuring the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __BarSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __cartesianCoordinateSystem1__. 
1. Set the __ArrangeMode__ to __Clustered__. 
1. Set the __X__ value to `=ISNULL(Sum(Fields.LineTotal), 0) / 1000.0`.

## Styling the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/overview%}). 

