---
title: Polar Charts
page_title: Polar Charts Overview
description: "Learn more about the Telerik Reporting Polar Chart types supported by the Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview
tags: telerik, reporting, report, items, graph, polar, chart, overview, creating
previous_url: /PolarCharts, /GraphHowToCreatePolarChart, /report-items/graph/chart-types/polar-charts/overview, /report-items/graph/chart-types/polar-charts/how-to-create-polar-chart
published: True
---

# Polar Charts

A Polar chart displays series as sets of data points that are grouped by category on a 360-degree circle and represent the values by the distance of the point as measured from the center of the circle. 

The farther the data point is from the center, the greater its value is. Category labels are displayed on the perimeter of the chart. 

The following image displays a Rose Polar chart: 

![A basic Polar chart type](images/PolarChart.png)

## Types 

* __Line Polar Charts__&mdash;A Polar chart in which the data points are connected by a line.
* __Area Polar Charts__&mdash;A Polar chart in which the data points are connected by a line with the area below the line filled with color.
* __Rose Polar Charts__&mdash;A Polar chart in which the data points are represented by bars drawn in a polar coordinate system.

## Creating Polar Charts

In this section, you will create a Polar chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report and connect it to data, refer to the [getting started step-by-step guide of the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Set the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Stacked Area chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.OrderDate.Year`.
1. Set the __Sortings__ to `=Fields.OrderDate.Year`. 
1. Set the __Name__ to `seriesGroup1`. 

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Stacked Area chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. 
1. Set the __Groupings__ to `=Fields.Category`.
1. Set the __Sortings__ to `=Fields.Category`.
1. Set the __Name__ to `categoryGroup1`. 

### 4. Configure the Coordinate System

Here you will specify the coordinate system details: 

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __PolarCoordinateSystem__. 
1. Leave the __Name__ to `polarCoordinateSystem1`. 
1. Set the __RadialAxis__ to __New Axis Logarithmic Scale__. 
1. Set the __AngularAxis__ to __New Axis with Category Scale__. 

### 5. Configure the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __BarSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __polarCoordinateSystem1__. 
1. Set the __ArrangeMode__ to __Clustered__. 
1. Set the __Y__ value to `=ISNULL(Sum(Fields.LineTotal), 0) / 1000.0`.

### 6. Style the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

## Design Considerations

Polar charts are most commonly used to graph polar data where each data point is determined by an angle and a distance.

## See Also 

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 