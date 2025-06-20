---
title: Charts
page_title: Web Report Designer offers different Chart Components that can be used to visualize the data records in the reports.
description: Explore the available Chart report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components-charts
tags: web, report, design, report, components, chart, bar, line, area, column, pie, doughnut, polar, range, scatter, bubble, sparkline, ohlc
published: True
position: 5
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
  </table>
</div>

Before adding a Chart report item, first, you need to select the **Details** section of the report. Then, you can select the desired chart type from the **Components** tray and configure it with the desired data source.

## Bar Charts

By clicking the `Bar` item from the **Components** tray, a new tab will appear on the right-hand side of the **Web Report Designer**: 

>caption Configuration Settings

![Configure Bar Chart ><](images/wrd-components-tray-charts-configure-bar-chart.png)    

>note The *Configuration pane* is identical for all chart types, allowing the end-user to specify the Data Source and configure the Categories, Series and Values groups.

You are ready to build the desired chart and use an already defined [Data Sources]({%slug web-report-designer-user-guide-components-data-sources%}). According to the data that should be displayed, it is possible to configure **Categories**, **Series** and **Values** groups. The following short video shows how to feed the chart with data from the already existing SQL Data Source that displays the total **Freight** for each **Country**:

>caption Populating Bar Chart with Orders' Freight by ShipCountry

<!-- ![Configure Bar Chart ><](images/wrd-components-tray-charts-configure-bar-chart.gif)     -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/PD8RnyexfvQ?si=-sUhyCqDy0FC54O0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Combine Mode

In case of having multiple series per category in the chart, it is possible to fine-tune the *combine mode* for the bar series for better illustration of the data. Telerik Reporting supports the following Bar chart types:

![Bar Chart Type ><](images/wrd-components-tray-charts-configure-bar-chart-type.png)    

Let's have the following sample CSV data that will be used for the example:

>caption CSV Data Source

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/ypQHSpXnJkw?si=_pjCxfXAIfKoWBa_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Now, we will create a Bar Chart that uses the **Year** column for the *Categories*, the **Category** column for the *Series* and the **Value** column for the *Values*. According to the selected Bar Chart Type, the following charts will be displayed:

|Bar Chart Type||
|----|----|
|**Clustered Bar**|![Clustered Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-clustered-type.png)| 
|**Stacked Bar**|![Stacked Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-stacked-type.png) |
|**100% Stacked Bar**|![100% Stacked Bar Chart Type ](images/wrd-components-tray-charts-configure-bar-chart-100-stacked-type.png) |

## Column Charts

By clicking the `Column` item from the **Components** tray, a similar tab (like the one shown in the *Configuration Settings* above) will appear on the right-hand side of the **Web Report Designer**. The **Column** chart type is very similar to the **Bar** chart (which displays series as sets of horizontal bars) and to the **Range** Column chart (which displays series as sets of vertical bars with varying beginning and end points).

We will use the same *CSV Data Source* and configure the **Year** column for the *Categories*, the **Category** column for the *Series* and the **Value** column for the *Values*:

>caption Populating Column Chart

<iframe width="560" height="315" src="https://www.youtube.com/embed/ePCehcujGnU?si=iQ5SDFrLaJeatsgl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

According to the selected Column Chart Type, the following charts will be displayed: 

|Column Chart Type||
|----|----|
|**Clustered Column**|![Clustered Column Chart Type ](images/wrd-components-tray-charts-configure-column-chart-clustered-type.png)|  
|**Stacked Column**|![Stacked Column Type ](images/wrd-components-tray-charts-configure-column-chart-stacked-type.png) |
|**100% Stacked Column**|![100% Stacked Column Chart Type ](images/wrd-components-tray-charts-configure-column-chart-100-stacked-type.png) |


## Area Charts

By clicking the `Area` item from the **Components** tray, the *Configuration Settings* pane will appear on the right-hand side of the **Web Report Designer**. We will use the same *CSV Data Source* and configure the **Year** column for the *Categories*, the **Category** column for the *Series* and the **Value** column for the *Values*:

>caption Populating Area Chart

<iframe width="560" height="315" src="https://www.youtube.com/embed/1F4df2B3TTw?si=SskFAdk4lDTmijfr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

According to the selected **Area Chart Type**, the following charts will be displayed: 

![Area Chart Type ><](images/wrd-components-tray-charts-configure-area-chart-types.png) 

|Area Chart Type||
|----|----|
|**Area**|![Area Chart Type ](images/wrd-components-tray-charts-configure-area-chart-type.png)|   
|**Stacked Area**|![Stacked Area Type ](images/wrd-components-tray-charts-configure-stacked-area-type.png) |
|**100% Stacked Area**|![100% Stacked Area Type ](images/wrd-components-tray-charts-configure-area-100-stacked-type.png) | 

## Line Charts 

By clicking the `Line` item from the **Components** tray, the *Configuration Settings* pane will appear on the right-hand side of the **Web Report Designer**. We will use the same *CSV Data Source* and configure the **Year** column for the *Categories*, the **Category** column for the *Series* and the **Value** column for the *Values*:

>caption Populating Line Chart

<iframe width="560" height="315" src="https://www.youtube.com/embed/FVBqHGrqYvQ?si=MBSYV08JWm7KEhUJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  
According to the selected **Line Chart Type**, the following charts will be displayed: 

![Line Chart Type ><](images/wrd-components-tray-charts-configure-line-chart-types.png)  

|Chart Type|Line|Line with Markers|
|----|----|----|
|**Line**|![Line Chart Type ](images/wrd-components-tray-charts-configure-line-chart-type.png)| ![Line with Markers Chart Type ](images/wrd-components-tray-charts-configure-line-with-markers-chart-type.png) | 
|**Stacked Line**|![Stacked Line Chart Type ](images/wrd-components-tray-charts-configure-stacked-line-type.png) | ![Stacked Line with Markers Chart Type ](images/wrd-components-tray-charts-configure-stacked-line-with-markers-type.png)|
|**100% Stacked Line**|![100% Stacked Line Chart Type ](images/wrd-components-tray-charts-configure-line-100-stacked-type.png) | ![100% Stacked Line with Markers Chart Type ](images/wrd-components-tray-charts-configure-line-with-markers-100-stacked-type.png) 

## Pie Charts

By clicking the `Pie` item from the **Components** tray, the *Configuration Settings* pane will appear on the right-hand side of the **Web Report Designer**. We will use the same *CSV Data Source* and configure the **Year** column for the *Categories*, the **Category** column for the *Series* and the **Value** column for the *Values*:

>caption Populating Pie Chart

<iframe width="560" height="315" src="https://www.youtube.com/embed/U9HMcfjAofc?si=3OCMV8NEyz8VwmaZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

According to the selected **Pie Chart Type**, the following charts will be displayed: 

![Pie Chart Type ><](images/wrd-components-tray-charts-configure-pie-chart-types.png) 

|Pie Chart Type||
|----|----|
|**Pie**|![Area Chart Type ](images/wrd-components-tray-charts-configure-pie-chart-type.png)|   
|**Doughnut**|![Doughnut Chart Type ](images/wrd-components-tray-charts-configure-doughnut-chart-type.png) | 

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Overview of the Graph Report Item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})


