---
title: Charts
page_title: Web Report Designer offers different Chart Components that can be used to visualize the data records in the reports.
description: Explore the available Chart report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components-charts
tags: web, report, design, report, components, chart, bar, line, area, column, pie, doughnut, polar, range, scatter, bubble, sparkline, ohlc
published: True
position: 2
---
List
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# Charts 

The **Web Report Designer** offers a **Charts** section inside the **Components** tray allowing the end-user to visualize the data records from different [Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) storages: 

<div style="display: flex; align-items: flex-start; gap: 24px;">
  <img alt="><" title="Components tray" src="images/wrd-components-tray-charts.png" style="max-width:240px; height:auto; border:1px solid lightgrey;" />
  <table style="width:100%; height:100%;">
    <tr>
      <th style="width:30%">Chart Type</th><th>Description</th>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/bar">Bar Chart</a></td>
      <td>Displays data series as sets of horizontal bars, graphically summarizes and renders data categories, and enables users to easily compare amounts or values between different categories.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/line">Line Chart</a></td>
      <td>Displays series as sets of points connected by a single line and represents large amounts of data that occur over a continuous period of time.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/area">Area Chart</a></td>
      <td>Displays a series as a set of points connected by a line with the whole area filled in under the line.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/column">Column Chart</a></td>
      <td>Displays data series as sets of vertical bars that are grouped by category.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/pie">Pie Chart</a></td>
      <td>Displays the contribution of fractional parts to a whole and is most commonly used to make comparisons between groups.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/pie#pie-chart-variations">Doughnut Chart</a></td>
      <td>Similar to the Pie Chart which has an open space in the center.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/polar">Polar Chart</a></td>
      <td>Displays series as sets of data points that are grouped by category on a 360-degree circle and represent the values by the distance of the point as measured from the center of the circle.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/range">Range Chart</a></td>
      <td>Displays sets of data points, each of which is defined by multiple values for the same category, and emphasizes the distance between the two values.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/scatter">Scatter (Point) Chart</a></td>
      <td>Shows correlations between two sets of values, enables users to observe the dependence of one value to another, and is often used for scientific data modeling.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/scatter#types">Bubble Chart</a></td>
      <td>Represents a variation of the Scatter charts in which the data points are replaced with bubbles. This chart type displays the differences between data points based on the size of the bubble. The larger the bubble is, the larger the difference between the two data points is.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/sparklines">Sparkline Chart</a></td>
      <td>Commonly used in tables. Sparklines and data bars are small, simple charts that convey a lot of information in a little space, often inline with text.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/report-items/graph/chart-types/ohlc">OHLC Chart</a></td>
      <td>Displays a series of candlestick or bar markers that represent information about the price movement of a stock over a period of time. The price movement is determined by the open, high, low, and close mark values of the stock price which create the layout of the marker.</td>
    </tr>
  </table>
</div>

Before adding a chart, first, you need to select the **Details** section of the report. Then, you can select the desired chart type from the **Components** tray and configure it with the desired data source.

## Bar Charts

By clicking the `Bar` item from the **Components** tray, while the **Details** section of the report is initially selected, a new tab will appear on the right-hand side of the **Web Report Designer**: 

![Configure Bar Chart ><](images/wrd-components-tray-charts-configure-bar-chart.png)        

You are ready to build the desired chart and use an already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}). The following short video shows how to feed the chart with data from the already existing SQL Data Source that displays the total **Freight** for each **Country**:

>caption Populating Bar Chart with Orders' Freight by ShipCountry

![Configure Bar Chart ><](images/wrd-components-tray-charts-configure-bar-chart.gif)    

In case of having multiple series per category in the chart, it is possible to fine-tune the *combine mode* for the bar series for better illustration of the data. Telerik Reporting supports the following Bar chart types:

![Bar Chart Type ><](images/wrd-components-tray-charts-configure-bar-chart--type.png)    

Let's have the following sample CSV data that will be used for the example:

```
Category, Year, Value
Accessories, 2003,230
Accessories,2004,340
Bikes, 2001, 150
Bikes, 2002, 195
Bikes, 2003, 340
Bikes, 2004, 265
Clothing, 2002, 80
Clothing, 2003, 120
Clothing, 2004, 110
Components, 2001, 230
Components, 2002, 140
Components, 2003, 280
Components, 2004, 310
```

Now, we will create a Bar Chart that uses the **Year** column for the categories, the **Category** column for the series and the **Value** column for the values. According to the selected Bar Chart Type, the following charts will be displayed:

|Chart Type||
|----|----|
|**Clustered Bar**|![Clustered Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-clustered-type.png)| 
|**Stacked Bar**|![Stacked Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-stacked-type.png) |
|**100% Stacked Bar**|![100% Stacked Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-100-stacked-type.png) |

## Line Charts 


## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Overview of the Graph Report Item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})


