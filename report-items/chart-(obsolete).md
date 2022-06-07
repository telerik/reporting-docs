---
title: (Obsolete) Chart 
page_title: (Obsolete) Chart 
description: "(Obsolete) Learn more about the Chart as a report item when using Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/chart-(obsolete)
tags: telerik, reporting, report, item, chart, obsolete
published: True
position: 14
---

# (Obsolete) Chart 

> The Chart item is now superseded by the more advanced [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) item. The Graph item is most often used for building powerful OLAP/Pivot charts. The Chart item is not supported in .NET Core projects and in projects deployed on Azure. 

>note The complete Chart item documentation is available as a __CHM__ file up to Telerik Reporting version __8.2.14.1204__ and can be downloaded from [your Telerik account](https://www.telerik.com/account/downloads/product-download?product=REPORTING).

The Chart report item is used to display a chart on a report. It is business-oriented item with a focus on development productivity and ease-of-use. It allows you to rapidly build appealing charts that represent data in a people-friendly manner. 

  ![Sparkline Chart\Sparkline Chart](images/Graph/SparklineChart.png)

You can bind the Chart item:

* From the Report Designer by setting its DataSource property

* By using its NeedDataSource event

When you are in the event, you should work with the processing chart item i.e.:

    
````C#
private void chart1_NeedDataSource(object sender, System.EventArgs e)
{
    Telerik.Reporting.Processing.Chart procChart = (Telerik.Reporting.Processing.Chart)sender;
    procChart.DataSource = your_datasource;
}
````
````VB.NET
Private Sub chart1_NeedDataSource(sender As Object, e As System.EventArgs)
    Dim procChart As Telerik.Reporting.Processing.Chart = DirectCast(sender, Telerik.Reporting.Processing.Chart)
    procChart.DataSource = your_datasource
End Sub
````

The formatting of the Chart report item is managed by a large number of properties. To customize the Chart report item, right-click the chart and select Properties from the context menu to use the Chart Wizard. 

The Chart item offers numerous features including:

* _17 customizable chart types_

	Bar, Stacked Bar, Stacked Bar 100%, Pie, Gantt, Bezier, Spline, Spline Area, Stacked Spline Area, Stacked Spline Area 100%, Point, Bubble, Line, Area, Stacked Area, Stacked Area 100%, CandleStick	

* _Automatic Text-wrapping_ 

	Text elements in the chart can be wrapped automatically.

* _Databinding_

	The obsolete Chart item is a [Data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}), it takes advantage of the [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) for binding to data. Once you have the data source defined you can use the Property Editor or code for selecting which data columns will be used to populate the chart.

* _Chart wizard_ 

	The Chart Wizard helps you traverse the many properties of Chart by providing the most commonly used properties in an intuitive way. The wizard can help you quickly set up the basic structure of your chart. You can invoke the chart wizard from the context menu that appears when you right-click the chart item and select Properties.

* _Second Y axis_ 

	X and Y axes are included in all chart types but the _Pie_ chart. Typically the YAxis _ChartPlotArea.YAxis_ displays values and the XAxis _ChartPlotArea.XAxis_ displays categories. For example, the YAxis _ChartPlotArea.YAxis_ might show "items sold" or "revenue", while the XAxis _ChartPlotArea.XAxis_ might show "Months" or "Products". The X axis can also display values. A second "Y" axis property YAxis2 _ChartPlotArea.YAxis2_ is provided for displaying a second scale of measurements. 

* _Empty Values_ 

	The Chart automatically approximates missing values between known data points, simply by setting the _Empty_ property to _true_ on any chart series item. This works for bar, line and area based chart types. You also have complete control over the visual style of empty values. The empty value style can be articulated separately from the style for the main values.

* _Scale Breaks_ 

	The ScaleBreaks feature allows you to "break off" large chunks of the axis so that graphs with large amplitude are easier to read. ScaleBreaks are available for both YAxis and YAxis2 of the plot area. You can tailor the maximum number of breaks, the minimum interval between data points before a break can occur, the visual size of the breaks and the visual style of the breaks.

* _Marked zones_ 

	PlotArea MarkedZones are ranges that can be labeled and filled to highlight areas of the chart or to visually group data. The MarkedZones property by default display behind the chart series. You can create any number of members for the MarkedZones collection and each marked zone is defined by a starting and ending X and Y value pairs. You can also control the labeling and appearance for each zone independently.

* _Styling_ 

	The Chart offers a set of properties to modify the look and feel of its elements.

## See Also

* [Telerik Charting Documentation](https://docs.telerik.com/devtools/aspnet-ajax/controls/chart/overview)

* [Chart](/reporting/api/Telerik.Reporting.Chart)
