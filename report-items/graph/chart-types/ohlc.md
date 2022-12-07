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

![A basic Candlestick chart type](images/OhlcChart.png)

## Types

You can modify the appearance of the OHLC series markers to cover the two most used types of OHLC charts, Candlestick and Bar.

* __Candlestick marker__&mdash;The body of the Candlestick marker represents the open and close values of the stock price. The vertical lines (shadows or wicks) represent the high and low values. Based only on the shape of the marker, it is hard to tell if the stock price is rising or falling for the given period. In this case, you can add color to the marker body by using the conditional formatting rules of the data point.

	![ohlc-series-candlestick-marker](images/ohlc-series-candlestick-marker.png)

* __Bar marker__&mdash;The Bar markers represent the information about OHLC levels of the price using only lines. The low and high values are shown with a vertical line, and the open and close values are displayed with a horizontal lines. The horizontal line on the left side of the vertical line represents the opening price and the line on the right side represents the closing price. Although the bar marker doesn't need to be colored to understand the trend of the price, you can still apply additional conditional formatting for easier reading of the chart data.

	![ohlc-series-bar-marker](images/ohlc-series-bar-marker.png)

## Creating OHLC Charts with the Candlestick Wizard

In this section, you will create a Candlestick chart with our Candlestick Wizard. The wizard is under the Scatter/Financial Chart menu item.
We are going to display the daily changes in a financial marker. The final report will look like the following image:

![OHLC Chart Preview](images/OhlcChartWizardPreview.png)

We will use a pre-defined CsvDataSource with the following data:

````CSV
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
````

The field `date` is a DateTime with format `dd.MM.yyyy`. The rest of the fields are Decimal.

1. Add Candlestick (OHLC) Chart as shown in the image below:

	![Add Candlestick (OHLC) Chart Wizard](images/OhlcChartWizardAdd.png)

1. Select the CsvDataSource, or create it with the button `Add New Data Source...` and the above inline CSV:

	![Add DataSource to the OHLC Chart](images/OhlcChartWizardDataSource.png)

1. Arrange the Candlestick (OHLC) Chart:

	* Leave the `Series` empty
	* Drag the field _date_ to the `Categories`
	* Drag the field _open_ to the `Open`. The wizard automatically applies the `Sum` [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}).
	* Drag the field _high_ to the `High`.
	* Drag the field _low_ to the `Low`.
	* Drag the field _close_ to the `Close`.
	* If you click the `Set default datapoint styling` checkbox, the wizard will add [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) rules that will change the datapoint color depending on the open-close values.

	![Arrange the OHLC Chart](images/OhlcChartWizardArrangeFields.png)

1. Leave the default DateTime scale settings.

1. Format the axis labels as follows:
	* Set the GraphAxis `Misc` > `LabelAngle` to `270`. This way the axis labels will be displayed vertically for better appearance.
	* Set the GraphAxis `Misc` > `Format` to `{0:d}`. This will let the labels be displayed as dates only.

You may find the report created following the above steps in our GitHub samples repository - [OhlcChart.trdp](https://github.com/telerik/reporting-samples/blob/master/graph-samples/OhlcChart.trdp).

The marker width is automatically calculated based on the following properties:

* The [`SpacingSlotCount`](/reporting/api/Telerik.Reporting.Scale#Telerik_Reporting_Scale_SpacingSlotCount) property of the X scale.
* The [`MinMarkerWidth`](/reporting/api/Telerik.Reporting.OhlcSeries#Telerik_Reporting_OhlcSeries_MinMarkerWidth) property of the series, which determines the minimum width of the marker, measured in [`Unit`](/reporting/api/Telerik.Reporting.Drawing.Unit), for example, `10px`, `1cm`, and so on.

By default, the wizard sets the `MinMarkerWidth` to `6px`. Note the gaps between _07.07.2017_ and _10.07.2017_ where there are no data points.

Since you are using a DateTime field to create the categories, the wizard will automatically create a [`DateTimeScale`](/reporting/api/Telerik.Reporting.DateTimeScale) for your X axis. The `DateTime` scale represents the values in a continuous domain which is the reason for you to see axis labels for _08/07/2017_ and _09/07/2017_ even if there is no data for these dates.

If you do not want to have such gaps, use a [`CategoryScale`](/reporting/api/Telerik.Reporting.CategoryScale) for your X axis.

## See Also 

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [(Demo TRDP Report) OhlcChart.trdp](https://github.com/telerik/reporting-samples/blob/master/graph-samples/OhlcChart.trdp)
