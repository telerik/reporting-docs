---
title: OHLC Charts
page_title: OHLC Charts Overview
description: "Learn more about the Telerik Reporting OHLC Chart types supported by the Graph report item and learn how to create a Candlestick chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview
tags: telerik, reporting, report, items, graph, ohlc, chart, overview, candlestick, creating
previous_url: /OhlcCharts, /GraphHowToCreateOhlcChart, /report-items/graph/chart-types/ohlc-charts/overview, /report-items/graph/chart-types/ohlc-charts/how-to-create-ohlc-chart
published: True
---

# OHLC Charts

An OHLC chart displays a series of candlestick or bar markers that represent information about the price movement of a stock over a period of time. The price movement is determined by the open, high, low, and close mark values of the stock price which create the layout of the marker. 

Additionally, you can add colors to the markers depending on the movement of the price for this period. If the close level is lower than the open level, it's recognized as a **bearish** pattern and the color or the fill or the marker changes. In this way, it is easily distinguished from the **bullish** pattern where the close level is higher than the open level. 

The following image shows an example of a Candlestick OHLC chart: 

![A basic Candlestick chart type](images/Graph/OhlcChart.png)

## Types 

You can modify the appearance of the OHLC series markers to cover the two most used types of OHLC charts, Candlestick and Bar. 

* __Candlestick marker__&mdash;The body of the Candlestick marker represents the open and close values of the stock price. The vertical lines (shadows or wicks) represent the high and low values. Based only on the shape of the marker, it is hard to tell if the stock price is rising or falling for the given period. In this case, you can add color to the marker body by using the conditional formatting rules of the data point. 

  ![ohlc-series-candlestick-marker](images/Graph/ohlc-series-candlestick-marker.png)

* __Bar marker__&mdash;The Bar markers represent the information about OHLC levels of the price using only lines. The low and high values are shown with a vertical line, and the open and close values are displayed with a horizontal lines. The horizontal line on the left side of the vertical line represents the opening price and the line on the right side represents the closing price. Although the bar marker doesn't need to be colored to understand the trend of the price, you can still apply additional conditional formatting for easier reading of the chart data. 

  ![ohlc-series-bar-marker](images/Graph/ohlc-series-bar-marker.png)

## Creating OHLC Charts

In this section, you will create a Candlestick chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report and connect it to data, refer to the [getting started step-by-step guide of the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Define the Categories

To define the Candlestick categories: 

1. On the **Arrange graph fields** page, drag the __date__ column to the **Categories** box. 
1. Drag the __open__, __high__, __low__, and __close__ fields to their respective boxes in the bottom-right corner. 

  If you click the **Set default datapoint styling** checkbox, the wizard will add conditional formatting rules that will change the datapoint color depending on the open-close values. 
  
1. Click the __Finish__ button or set up additional properties of the DateTime scale. Click **Finish**. As a result, when you close the wizard, the newly created chart will appear. 

## 3. Style the Appearance  

Format the axis labels, set their angle, and add additional styling if necessary. The following image shows a possible layout of your chart: 

![graph-howto-create-ohlc-chart](images/Graph/graph-howto-create-ohlc-chart.png) 
  
The marker width is automatically calculated based on the following properties: 

* The [`SpacingSlotCount`](/reporting/api/Telerik.Reporting.Scale#Telerik_Reporting_Scale_SpacingSlotCount) property of the X scale. 
* The [`MinMarkerWidth`](/reporting/api/Telerik.Reporting.OhlcSeries#Telerik_Reporting_OhlcSeries_MinMarkerWidth) property of the series, which determines the minimum width of the marker, measured in [`Unit`](/reporting/api/Telerik.Reporting.Drawing.Unit), for example, `10px`, `1cm`, and so on. 

By default, the wizard sets the __MinMarkerWidth__ to 6px. Note the gaps between 07.07.2017 and 10.07.2017 where there are no data points. 

Since you are using a DateTime field to create the categories, the wizard will automatically create a  [`DateTimeScale`](/reporting/api/Telerik.Reporting.DateTimeScale) for your X axis. The `DateTime` scale represents the values in a continuous domain which is the reason for you to see axis labels for 08.07.2017 and 09.07.2017 even if there is no data for these dates. 

If you do not want to have such gaps, use a [`CategoryScale`](/reporting/api/Telerik.Reporting.CategoryScale) for your X axis. 