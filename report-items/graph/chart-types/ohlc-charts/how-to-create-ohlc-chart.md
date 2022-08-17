---
title: Creating OHLC Charts
page_title: Creating OHLC Charts
description: "Learn how to display OHLC charts when working with the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/how-to-create-ohlc-chart
tags: telerik, reporting, report, items, graph, creating, ohlc, chart
published: True
position: 1
previous_url: /GraphHowToCreateOhlcChart
---

# Creating OHLC Charts

This guide will demonstrate how to create a Candlestick chart displaying stock prices over a period of time by using the Graph Wizard. 

The following image shows a Candlestick chart.
 
![ohlc](images/Graph/OhlcChart.png)

## Adding the Graph 

In this step, you will add the Graph report item by using the Graph Wizard in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). However, the approach is applicable to the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) too. 

The Wizard provides a fast and efficient way to create complex charts and starts every time you start creating a new Graph in the report designer tools. 

1. Start the Standalone Report Designer and open or create a new report. 
1. Select the report section in which the Graph item will be placed. 
1. In the **Insert** tab, find the **Charts** section and select the **Scatter** menu. Its **Financial** group displays the __Candlestick__ and __Bar__ sections, which provide the same functionality but produce different series markers. For the purposes of this guide, select the **Candlestick** markers.   

## Connecting to Data 

Now, you will connect the chart to the data it will summarize. In real-world applications, the data will be retrieved from a real database. However, here you'll use some sample data as a CSV data source. 

1. Create a new CSV data source and paste the following text as its content: 
    
              date,open,high,low,close
              03.07.2017,18.2,18.6,18.1,18.4
              04.07.2017,18.3,18.6,18.1,18.4
              05.07.2017,18.5,19,18.3,18.7
              06.07.2017,18.9,19,18.2,18.3
              07.07.2017,18.3,18.9,18.3,18.7
              10.07.2017,18.8,19.2,18.3,18.4
              11.07.2017,18.2,19.2,18.1,18.8
              12.07.2017,18.3,18.6,18.2,18.6
              13.07.2017,18.4,19.4,18.3,18.7
            

1. Set the field separator to a comma and check the **The CSV has headers** checkbox. 
1. Define the column types and preview the data by using the __Parse CSV...__ button to make sure the data source is set up correctly. 

## Defining the Categories

1. On the **Arrange graph fields** page, drag the __date__ column to the **Categories** box. 
1. Drag the __open__, __high__, __low__, and __close__ fields to their respective boxes in the bottom-right corner. 

  If you click the **Set default datapoint styling** checkbox, the wizard will add conditional formatting rules that will change the datapoint color depending on the open-close values. 
  
1. Click the __Finish__ button or set up additional properties of the DateTime scale. Click **Finish**. As a result, when you close the wizard, the newly created chart will appear. 

## Styling the Appearance  

Format the axis labels, set their angle, and add additional styling if necessary. The following image shows a possible layout of your chart: 

![graph-howto-create-ohlc-chart](images/Graph/graph-howto-create-ohlc-chart.png) 
  
The marker width is automatically calculated based on the following properties: 

* The [`SpacingSlotCount`](/reporting/api/Telerik.Reporting.Scale#Telerik_Reporting_Scale_SpacingSlotCount) property of the X scale. 
* The [`MinMarkerWidth`](/reporting/api/Telerik.Reporting.OhlcSeries#Telerik_Reporting_OhlcSeries_MinMarkerWidth) property of the series, which determines the minimum width of the marker, measured in [`Unit`](/reporting/api/Telerik.Reporting.Drawing.Unit), for example, `10px`, `1cm`, and so on. 

By default, the wizard sets the __MinMarkerWidth__ to 6px. Note the gaps between 07.07.2017 and 10.07.2017 where there are no data points. 

Since you are using a DateTime field to create the categories, the wizard will automatically create a  [DateTimeScale](/reporting/api/Telerik.Reporting.DateTimeScale) scale for your X axis. The DateTime scale represents the values in a continuous domain which is the reason for you to see axis labels for 08.07.2017 and 09.07.2017 even if there is no data for these dates. 

If you do not want to have such gaps, use a [CategoryScale](/reporting/api/Telerik.Reporting.CategoryScale) for your X axis. 

