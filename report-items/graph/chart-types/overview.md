---
title: Overview
page_title: Chart Types at a Glance
description: "Learn more about the chart types supported by the Telerik Reporting Graph report item and their main characteristics."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/overview
tags: telerik, reporting, report, items, graph, chart, types, overview
published: True
position: 0
previous_url: /ChartTypes, /report-items/graph/chart-types/
reportingArea: General
components: [general]
---

# Chart Types Overview

Choosing an appropriate chart type for successfully presenting data will determine how well the data can be interpreted when displayed in a chart form. For example, if your dataset contains a lot of data points relative to the size of the chart, it may be better presented by using an Area, Line, or Scatter chart.

For more information about preparing your data depending on the selected chart type, refer to the article on the [structure and elements of the Graph](slug:telerikreporting/designing-reports/report-structure/graph/structure).

## Supported Chart Types

Each chart type provides unique characteristics for visualizing datasets. You can use any chart type to display data, but the data will be easier to read when you use a suitable chart type based on what you are required to show in your report.

The following table summarizes the specific chart features that affect the suitability of a chart to a particular dataset. Note that you can also [change the chart type after you have created it](slug:telerikreporting/designing-reports/report-structure/graph/how-to/how-to-change-a-chart-type).

For examples of the described chart types, refer to the sample reports in the local demos located in `[InstallDir]\Examples`.

>note "No" does not mean that the chart cannot display that data.

| Chart type | Suitable for ratio data | Suitable for stock data | Suitable for linear data | Suitable for multi-value data |
| ------ |:------:|:------:|:------:|:------:|
| [Bar Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview)|No|No|Yes|No|
| [Line Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/line-charts/overview)|No|No|Yes|No|
| [Area Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/area-charts/overview)|No|No|Yes|No|
| [Column Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview)|No|No|Yes|No|
| [Pie Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview)|Yes|No|No|No|
| [Doughnut Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview#pie-chart-variations)|Yes|No|No|No|
| [Polar Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/polar-charts/overview)|Yes|No|No|No|
| [Range Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/range-charts/overview)|No|No|Yes|Yes|
| [Scatter Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview)|Yes|No|Yes|No|
| [Bubble Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview)|Yes|No|Yes|No|
| [Sparklines](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/sparklines)|Yes|Yes|Yes|Yes|
| [OHLC Charts](slug:telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview)|No|Yes|Yes|Yes|

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
