---
title: Range Charts
page_title: Range Charts Overview
description: "Learn more about the Telerik Reporting Range Chart types supported by the Graph report item and learn how to create a Range Area chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview
tags: telerik, reporting, report, items, graph, range, chart, overview, creating
previous_url: /RangeCharts, /GraphHowToCreateRangeChart, /report-items/graph/chart-types/range-charts/overview, /report-items/graph/chart-types/range-charts/how-to-create-range-chart
published: True
---

# Range Charts

A Range chart displays sets of data points, each of which is defined by multiple values for the same category, and emphasizes the distance between the two values. 

The category labels are displayed on the category axis. The plain Range chart fills in the area between the top and the bottom value for each data point.

The following image displays a plain Range chart with one Range Area series: 

![A basic Range Area chart type](images/RangeAreaChart.png)

## Types

* __Column range__&mdash;The Column Range chart uses columns to represent the range.
* __Bar range__&mdash;The Bar Range chart uses bars to represent the range. 
* __Smooth range__&mdash;A Smooth Range chart uses curved lines to connect data points rather than straight ones.

## Creating Area Charts

In this section, you will create a Range Area chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report and connect it to data, refer to the [getting started step-by-step guide of the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Set the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Range Area chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__. By default, this will add a new static group (group without grouping).
1. Set the __Name__ to `seriesGroup1`. 

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Range Area chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. 
1. Set the __Groupings__ to `=Fields.Name`.
1. Set the __Sortings__ to `=Fields.Name`.
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
1. Set the __Y__ value to `=Sum(IIF(Fields.OrderDate.Year=2002, Fields.TotalDue, 0))`.
1. Set the __Y0__ value to `=Sum(IIF(Fields.OrderDate.Year=2003, Fields.TotalDue, 0))`.

### 6. Style the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

## Design Considerations

* Range charts require two values per data point. These values represent a high value and a low value that define the range for each data point. 
* If only one value is specified, the Range chart will display as if it were a regular Area, Bar, or Column chart with a single value per data point.
* Range charts are often used to graph data that contains minimum and maximum values for each category group in the dataset.
* It is not recommended to display markers on each data point in a Range chart.
* Like the Area chart, in a plain Range chart, if the values in multiple series are similar, the series will overlap. In this scenario, you may want to use a Column Range or Bar Range chart instead of a plain Range chart.
* You can create Gantt charts by using a Range Bar chart.
