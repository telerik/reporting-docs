---
title: Sparklines
page_title: Sparkline Charts Overview 
description: "Learn more about the Telerik Reporting Sparkline Chart types."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/sparklines
tags: telerik, reporting, report, items, graph, sparklines, chart, overview
published: True
position: 9
previous_url: /SparklinesAndDataBars
---

# Sparklines

Sparklines and data bars are small, simple charts that convey a lot of information in a little space, often inline with text. 

Commonly, Sparklines are used in tables. Their impact comes from viewing many of them together and being able to quickly compare them one above the other rather than viewing them separately. Sparklines make it easy to see the outliers, the rows that visualize deviating behavior patterns. 

Although Sparklines are small, each chart often represents multiple data points over time. Data bars can represent multiple data points even though typically illustrate only one. Normally, each Sparkline presents a single series. 

Because Sparklines display aggregated data, they must go in a cell associated with a group. Sparklines and data bars have the same basic chart elements of categories, series, and values, but they have no legend, grid lines, labels, or tick marks.

Spaklines and data bars are created by adding the required [chart type]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/overview%}) and, then, applying the required formatting. For more information, refer to the section on [Graph formatting]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/overview%}). 

The following image shows a typical usage of the Sparkline chart type in a table. 

  ![Sparkline Chart\Sparkline Chart](images/Graph/SparklineChart.png)

## Types

Most chart types can be used as a Sparkline:

* __Bar Charts__&mdash;The Clustered, Stacked, and 100% Stacked Bar charts.
* __Column Charts__&mdash;The Clustered, Stacked, and 100% Stacked Column charts.
* __Line Charts__&mdash;The Clustered, Stacked, and 100% Stacked Line charts.
* __Area Charts__&mdash;The Clustered, Stacked, and 100% Stacked Area charts.
* __Pie Charts__&mdash;Both Pie and Doughnut charts.
* __Range Charts__&mdash;Area and Bar Range charts.

## Data Bars

While data bars can represent multiple data points, they typically represent a single data point similar to the regular Bar charts. Data bars often contain several series with no category or have series grouping.

You can make data bar versions of the following full charts:

* __Bar Charts__&mdash;Clustered, Stacked, and 100% Stacked Bar charts.
* __Column Charts__&mdash;Clustered, Stacked, and 100% Stacked Column charts. Column charts can be either Sparklines or data bars.

