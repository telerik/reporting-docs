---
title: Overview
page_title: Range Charts Overview
description: "Learn more about the Telerik Reporting Range Chart types supported by the Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview
tags: telerik, reporting, report, items, graph, range, chart, overview
published: True
position: 0
previous_url: /RangeCharts
---

# Range Charts Overview

A Range chart displays sets of data points, each of which is defined by multiple values for the same category, and emphasizes the distance between the two values. 

The category labels are displayed on the category axis. The plain Range chart fills in the area between the top and the bottom value for each data point.

The following image displays a plain Range chart with one Range Area series: 

![Range Area Chart](images/Graph/RangeAreaChart.png)

## Types

* __Column range__&mdash;The Column Range chart uses columns to represent the range.
* __Bar range__&mdash;The Bar Range chart uses bars to represent the range. 
* __Smooth range__&mdash;A Smooth Range chart uses curved lines to connect data points rather than straight ones.

## Design Considerations

* Range charts require two values per data point. These values represent a high value and a low value that define the range for each data point. 
* If only one value is specified, the Range chart will display as if it were a regular Area, Bar, or Column chart with a single value per data point.
* Range charts are often used to graph data that contains minimum and maximum values for each category group in the dataset.
* It is not recommended to display markers on each data point in a Range chart.
* Like the Area chart, in a plain Range chart, if the values in multiple series are similar, the series will overlap. In this scenario, you may want to use a Column Range or Bar Range chart instead of a plain Range chart.
* You can create Gantt charts by using a Range Bar chart.
