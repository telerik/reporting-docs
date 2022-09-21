---
title: Area Charts
page_title: Area Charts Overview
description: "Learn more about the Telerik Reporting Area Chart types supported by the Graph report item and learn how to create a Stacked Area chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview
tags: telerik, reporting, report, items, graph, area, chart, overview, creating
previous_url: /report-items/graph/chart-types/area-charts/how-to-create-area-chart, /report-items/graph/chart-types/area-charts/overview, /GraphHowToCreateAreaChart, /AreaCharts
published: True
---

# Area Charts

An Area chart displays a series as a set of points connected by a line with the whole area filled in under the line. 

Area charts are appropriate for visualizing data that fluctuates over a period of time and can be useful for emphasizing trends. Values that don't vary too wildly work best for Area charts. 

The following image shows an example of a Stacked Area chart: 

![Stacked Area Chart](images/StackedAreaChart.png)

## Types 

* __Stacked Area Charts__&mdash;An Area chart where multiple series are stacked vertically. If there is only one series in the chart, the Stacked Area chart will appear in the same way as an Area chart. 
* __100% Percent Stacked Area Charts__&mdash;An Area chart where multiple series are stacked vertically to fit the entire chart area. If there is only one series in the chart, the Stacked Area chart will appear in the same way as an Area chart. 
* __Smooth Area Charts__&mdash;An Area chart where the data points are connected by a smooth line instead of a regular line. Smooth Area charts are suitable for displaying trends rather than values of individual data points.

## Creating Area Charts

In this section, you will create a Stacked Area chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report, refer to the [getting started with the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Set the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Stacked Area chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.OrderDate.Year`.
1. Set the __Sortings__ to `=Fields.OrderDate.Year`. 
1. Set the __Name__ to `seriesGroup1`. 

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Stacked Area chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. 
1. Set the __Groupings__ to `=Fields.OrderDate.Month`.
1. Set the __Sortings__ to `=Fields.OrderDate.Month`.
1. Set the __Name__ to `categoryGroup1`. 

### 4. Configure the Coordinate System

Here you will specify the coordinate system details: 

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __CartesianCoordinateSystem__. 
1. Leave the __Name__ to `cartesianCoordinateSystem1`. 
1. Set the __XAxis__ to __New Axis with Category Scale__. 
1. Set the __YAxis__ to __New Axis with Numerical Scale__. 

### 5. Configure the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __AreaSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __cartesianCoordinateSystem1__. 
1. Set the __ArrangeMode__ to __Stacked__. 
1. Set the __Y__ value to `=ISNULL(Sum(Fields.LineTotal), 0) / 1000.0`.

### 6. Style the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

## See Also 

* [(Demo) Employee Sales Report with Area Charts](https://demos.telerik.com/reporting/employee-sales)
* [(Demo) Crypto Dashboard Report with Area Charts](https://demos.telerik.com/reporting/crypto-dashboard)
