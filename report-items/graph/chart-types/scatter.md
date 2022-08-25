---
title: Scatter Charts
page_title: Scatter Charts Overview
description: "Learn more about the Telerik Reporting Scatter Chart types supported by the Graph report item and learn how to create a Bubble chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview
tags: telerik, reporting, report, items, graph, scatter, bubble, chart, overview, creating
previous_url: /ScatterCharts, /GraphHowToCreateBubbleChart, /GraphHowToCreateScatterChart, /report-items/graph/chart-types/scatter-charts/overview, /report-items/graph/chart-types/scatter-charts/how-to-create-scatter-chart, /report-items/graph/chart-types/scatter-charts/how-to-create-bubble-chart
published: True
---

# Scatter Charts

A Scatter (Point) chart shows correlations between two sets of values, enables users to observe the dependence of one value to another, and is often used for scientific data modeling. 

Scatter charts are typically not used with time-dependent data where a Line chart is more suited. A common usage of the Scatter chart is to compare aggregated data across categories. 

Scatter charts are different from other chart types because, instead of using the category values as X-values, they have explicit X-values for the data points. Consequently, the data can be grouped and aggregated into a different category than the value that is shown on the X-axis. For example, to show last year's sales for individual salespersons along the X-axis, you will not aggregate Y-values if two salespersons have identical X-values. 

The following image illustrates a Scatter chart: 

![A basic Scatter chart type](images/scatter-chart.png)

## Types

Bubble charts are a variation of the Scatter charts in which the data points are replaced with bubbles. This chart type displays the differences between data points based on the size of the bubble. The larger the bubble is, the larger the difference between the two data points is. 

The following Bubble chart sample report has a category set to a sales person so that it aggregates sales data per sales person. However, the value of last year's sales is shown on the X-axis. 

![A basic Bubble chart type](images/bubble-chart.png)

## Creating Scatter Charts

In this section, you will create a Bubble chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report and connect it to data, refer to the [getting started step-by-step guide of the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Set the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Bubble chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.Name`.
1. Set the __Sortings__ to `=Sum(Fields.SubTotal)` with `Desc` order. 
1. Set the __Name__ to `seriesGroup1`. 

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Bubble chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. By default, this will add a new static group (group without grouping).
1. Set the __Name__ to `categoryGroup1`. 

### 4. Configure the Coordinate System

Here you will specify the coordinate system details: 

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __CartesianCoordinateSystem__. 
1. Leave the __Name__ to `cartesianCoordinateSystem1`. 
1. Set the __XAxis__ to __New Axis with Numerical Scale__. 
1. Set the __YAxis__ to __New Axis with Numerical Scale__. 

### 5. Configure the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __LineSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __cartesianCoordinateSystem1__. 
1. Set the __X__ value to `=Sum(IIF(Fields.OrderDate.Year=2003, Fields.SubTotal, 0))`.
1. Set the __Y__ value to `=Sum(IIF(Fields.OrderDate.Year=2004, Fields.SubTotal, 0))`.
1. Set the __Size__ expression to `=Sum(IIF(Fields.OrderDate.Year=2004, Fields.SubTotal, 0)) - Sum(IIF(Fields.OrderDate.Year=2003, Fields.SubTotal, 0))`.
1. Set the __LineStyle.Visible__ to __False__. 
1. Set the __DataPointStyle.Visible__ to __True__. 
1. Set the __MarkerType__ to __Circle__. 

### 6. Style the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

## Design Considerations 

* Scatter charts usually display and compare numeric values, such as scientific, statistical, and engineering data.
* A typical usage of the Scatter chart is when you want to compare large numbers of data points not related to time. The more data you include in a scatter chart, the better the comparisons that you can make.
* The bubble chart requires an additional value per data point, the **Size** of the bubble. 
* Scatter charts are most suitable for handling the distribution of values and clusters of data points. This is the best chart type if your dataset contains many points, for example, several thousand points. Displaying multiple series on a Point chart is visually distracting, and you have to avoid it and consider using a Line chart.

## See Also 

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 