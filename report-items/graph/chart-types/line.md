---
title: Line Charts
page_title: Line Charts Overview
description: "Learn more about the Telerik Reporting Line Chart types supported by the Graph report item and how to create a basic Line chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview
tags: telerik, reporting, report, items, graph, line, chart, overview, creating
previous_url: /LineCharts, /GraphHowToCreateLineChart, /report-items/graph/chart-types/line-charts/overview, /report-items/graph/chart-types/line-charts/how-to-create-line-chart
published: True
reportingArea: General
---

# Creating and Customizing Line Charts

A Line chart displays series as sets of points connected by a single line and represents large amounts of data that occur over a continuous period of time.

Line charts can also render series of data points to show trends over a period of time. They enable you to use one or more data series and to tailor the appearance for each series to enhance the data visualization by using unique colors, line thickness, pen style, and point marks.

The following image displays a Line chart that contains three series.

![Preview of Graph Item with Basic Line Chart](images/LineChartWizardPreview.png)

## Types

The Graph supports the following Line chart types:

* __Straight Line Chart__&mdash;A Line chart that uses straight lines to connect the data points.
* __Smooth Line Chart__&mdash;A Line chart that uses curved lines instead of regular ones.
* __Stepped Line Chart__&mdash;A Line chart that uses horizontal and vertical lines to connect the data points and creates a step-like structure.

## Creating Line Charts with the Line Chart Wizard

In this section, you will learn how to create a Line chart with our Line Chart Wizard.
We are going to create a `Line` Chart without Markers that displays the LineTotal of the Product Categories by Years. The final report will look like the image above.
In the general case, you may select `Stacked Line` or `100% Stacked Line` with or without Markers. The requiered settings are basically the same.

The sample report will use a pre-defined SqlDataSource that connects to the example AdventureWorks database. The query that returns the needed fields is the following:

````SQL
SELECT
	[Production].[ProductCategory].[Name] AS 'Category',
	[Sales].[SalesOrderHeader].[OrderDate],
	[Sales].[SalesOrderDetail].[LineTotal]
FROM
	[Production].[Product] INNER JOIN
	[Production].[ProductSubcategory] ON [Production].[Product].[ProductSubcategoryID] = [Production].[ProductSubcategory].[ProductSubcategoryID] INNER JOIN
	[Production].[ProductCategory] ON [Production].[ProductSubcategory].[ProductCategoryID] = [Production].[ProductCategory].[ProductCategoryID] INNER JOIN
	[Sales].[SalesOrderDetail] ON [Production].[Product].[ProductID] = [Sales].[SalesOrderDetail].[ProductID] INNER JOIN
	[Sales].[SalesOrderHeader] ON [Sales].[SalesOrderDetail].[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID] AND [Sales].[SalesOrderDetail].[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID] AND 
	[Sales].[SalesOrderDetail].[SalesOrderID] = [Sales].[SalesOrderHeader].[SalesOrderID]
````

To create the Line chart by using the Line Chart Wizard:

1. Add Line Chart as shown in the image below:

	![Adding the Telerik Reporting Line Chart Wizard from the Insert Menu Item of the Standalone Report Designer](images/LineChartWizardAdd.png)

1. Select the SqlDataSource, or create it with the **Add New Data Source...** button and by using the query above:

	![Add DataSource to the Line Chart with the Wizard of the Standalone Report Designer](images/LineChartWizardDataSource.png)

1. Arrange the Line Chart:

	1. Drag the __Category__ field to **Series**.
	1. Drag the __OrderDate.Year__ field to **Categories**.
	1. Drag the __LineTotal__ field to **Values**. The wizard will automatically apply the `Sum` [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}).

	![Arrange the Line Chart Series, Categories and Values from the Wizard in the Standalone Report Designer](images/LineChartWizardArrangeFields.png)

1. The `LineTotal` value is large, so let's change the `Data > Y` [expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) of `lineSeries` that is currently `=Sum(Fields.LineTotal)` to `=ISNULL(Sum(Fields.LineTotal), 0) / 1000.0`. Note that a `Null` check is also included and the `Null` values to be replaced with a `0` (zero).

To see the full implementation of the sample report, refer to the [LineChart.trdp](https://github.com/telerik/reporting-samples/blob/master/graph-samples/LineChart.trdp) project on GitHub.

## Creating Line Charts Manually

This section will show how to manually create a Line chart.

### 1. Add the Graph

To add a new Graph report item to the report, refer to the article on [getting started with the Graph report item]({%slug graph_item_get_started%}).

### 2. Set the SeriesGroups Hierarchy

Now you can set the **SeriesGropus** hierarchy of the Stacked Area chart:

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.Category`.
1. Set the __Sortings__ to `=Fields.Category`.
1. Set the __Name__ to `seriesGroup1`.

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Stacked Area chart:

1. Open the __CategoryGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.OrderDate.Year`.
1. Set the __Sortings__ to `=Fields.OrderDate.Year`.
1. Set the __Name__ to `categoryGroup1`.

### 4. Configure the Coordinate System

Here you will specify the coordinate system details:

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __CartesianCoordinateSystem__.
1. Leave the __Name__ to `cartesianCoordinateSystem1`.
1. Set the __XAxis__ to __New Axis with Category Scale__.
1. Set the __YAxis__ to __New Axis with Numerical Scale__.

### 5. Configure the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __LineSeries__.
1. Set the __CategoryGroup__ to __categoryGroup1__.
1. Set the __SeriesGroup__ to __seriesGroup1__.
1. Set the __CoordinateSystem__ to __cartesianCoordinateSystem1__.
1. Set the __Y__ value to `=Sum(Fields.LineTotal)`.

### 6. Style the Appearance

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}).

## Design Considerations

* To improve the visual impact of the default Line chart, consider increasing the thickness of the series line to create a bolder line chart.
* A Line chart requires at least two points to draw a line.
* A series that is drawn as a line will not take up much space within a chart area. Therefore, Line charts are frequently combined with other chart types such as Column charts.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [(Demo TRDP Report) LineChart.trdp](https://github.com/telerik/reporting-samples/blob/master/graph-samples/LineChart.trdp)
