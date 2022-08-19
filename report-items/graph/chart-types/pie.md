---
title: Pie Charts
page_title: Pie Charts Overview
description: "Learn more about the Telerik Reporting Pie Chart types supported by the Graph report item and learn how to create a Pie chart."
slug: telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview
tags: telerik, reporting, report, items, graph, pie, chart, overview, creating
previous_url: /PieCharts, /GraphHowToCreatePieChart, /report-items/graph/chart-types/pie-charts/overview, /report-items/graph/chart-types/pie-charts/how-to-create-pie-chart
published: True
---

# Pie Charts

A Pie chart displays the contribution of fractional parts to a whole and is most commonly used to make comparisons between groups. 

Pie charts have no axes. When you use a numeric field, the chart can calculate the percentage of each value to the total. 

The following image displays a Pie chart with a legend: 

![A basic Pie chart type](images/PieChart.png)

## Types

The Pie chart supports the __Doughnut__ type which has an open space in the center. To control the width of the open space, use the [`PolarCoordinateSystem.InnerRadiusRatio`](https://docs.telerik.com/reporting/p-telerik-reporting-polarcoordinatesystem-innerradiusratio) property. 

## Creating Pie Charts

In this section, you will create a Pie chart.

### 1. Add the Graph and Connect It to Data

To add a new Graph report item to the report and connect it to data, refer to the [getting started step-by-step guide of the Graph report item]({% slug graph_item_get_started %}). 
   
### 2. Set the SeriesGroups Hierarchy 

Now you can set the **SeriesGropus** hierarchy of the Pie chart: 

1. Open the __SeriesGroups__ collection editor and click __Add__.
1. Set the __Groupings__ to `=Fields.StoreName`.
1. Set the __Sortings__ to `=Sum(Fields.SubTotal)`. 
1. Set the __Filters__ to `=Sum(Fields.SubTotal) Top N =10`.
1. Set the __Name__ to `seriesGroup1`. 

### 3. Set the CategoryGroups Hierarchy

Next, you will have to define the **CategoryGroups** hierarchy of the Pie chart:

1. Open the __CategoryGroups__ collection editor and click __Add__. By default, this will add a new static group (group without grouping). 
1. Set the __Name__ to `categoryGroup1`. 

### 4. Configure the Coordinate System

Here you will specify the coordinate system details: 

1. Open the __CoordinateSystems__ collection editor and __Add__ a new __PolarCoordinateSystem__. 
1. Leave the __Name__ to `polarCoordinateSystem1`. 
1. Set the __RadialAxis__ to __New Axis with Category Scale__. 
1. Expand the **RadialAxis** node. Expand the **Scale** node. Set **SpacingSlotCount** to `0`. 
1. Expand the axis **Style** node. Set **Visible** to `False`.
1. Set the __AngularAxis__ to __New Axis with Numerical Scale__. 
1. Expand the **AngularAxis** node. Expand the axis **Style** node. Set **Visible** to `False`.

### 5. Configure the Series

In this step, you will configure the series of the chart:

1. Open the __Series__ collection editor and __Add__ new __BarSeries__. 
1. Set the __CategoryGroup__ to __categoryGroup1__. 
1. Set the __SeriesGroup__ to __seriesGroup1__. 
1. Set the __CoordinateSystem__ to __polarCoordinateSystem1__. 
1. Set the __ArrangeMode__ to __Stacked100__. 
1. Set the __X__ value to `=Sum(Fields.SubTotal)`.
1. Set the __DataPointLabel__ to `=Sum(Fields.SubTotal)/1000.0`. 
1. Set the __DataPointLabelFormat__ to `{0:C0}K`.

### 6. Style the Appearance   

To set the color palette, format the labels, define the values of the legend, and elaborate on any other styling options, refer to the section on [formatting the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}). 

## Displaying Percentage Values 

Pie charts represent proportions of the total. As a result, it is common to format Pie chart labels as percentages. For consistency with other chart types, the Pie chart does not display percentage labels by default. 

To show Pie chart labels with percentages: 

1. Select the series by clicking anywhere on the pie.
1. From the **Properties** window, set the __DataPointLabelStyle.Visible__ property of the series to __true__. 
1. Set the __DataPointLabel__ property of the series to an expression adjusted to your specific needs and similar to `=Sum(Fields.LineTotal)/Exec('graph1', Sum(Fields.LineTotal))` where `graph1` is the name of the Graph item. 
1. Select the series labels. From the **Graph Tools** > **Format** contextual tab, select **Percent** for the label format. 
1. Adjust the precision according to your needs.
1. Position the labels through the __DataPointLabelAlignment__ property of the series. 

## Preventing Overlapped Labels

By default, the layout engine will try to arrange the data labels so they do not overlap. When the bounds of two or more labels overlap, the engine will move them and their adjacent labels vertically, trying to find them a proper non-overlapping positions. 

During this rearrangement, a label can be moved aside from its original location, which may produce a hard to read chart. Additionally, if the plot area doesn't provide enough space and there are many data points, the labels will overlap. 

To prevent the Pie chart labels from overlapping, use any of the following approaches: 

* Decrease the font size of the data point labels.
* Increase the width and height of your chart to allow more room for the labels.
* Change the position of the Pie labels through the __DataPointLabelAlignment__ property of the series. 
* Set the [`DataPointLabelOffset`](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelOffset) to a greater value so that the labels are arranged around a circle with a greater radius. 

For Pie charts with many data points, the best approach is to use a combination of the above-mentioned approaches. The following image shows a Pie chart series that has its [`DataPointLabelAlignment`](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelAlignment) set to `OutsideColumn`, [`DataPointLabelOffset`](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelOffset) set to `0.5cm` and [DataPointLabelConnectorStyle](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelConnectorStyle) `.Visible` set to `true`. 

> The algorithm that moves the data point labels, preventing them from overlapping, is activated only when the labels have their [`DataPointLabelAngle`](/reporting/api/Telerik.Reporting.GraphSeriesBase#Telerik_Reporting_GraphSeriesBase_DataPointLabelAngle) set to a multiple of `2*π` radians in degrees, for example, `0`, `360`, and so on. 

![Outside Column Pie Chart](images/Graph/OutsideColumnPieChart.png)


## Merging Pie Slices 

Based on the data, a Pie chart may produce too many slices, resulting in unreadable data presentation. To overcome this data presentation, you can merge slices that are considered insignificant into a single slice on the Pie chart. 

To control the merging setup, use the [`Telerik.Reporting.BarSeries.MergedDataPoints`](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_MergedDataPoints) property from the **Layout** properties category of the Bar series. 

To turn on the merge logic: 

1. Change the [`Telerik.Reporting.MergedDataPoints.MergeMode`](/reporting/api/Telerik.Reporting.MergedDataPoints#Telerik_Reporting_MergedDataPoints_MergeMode) property from `None` to `SingleSlice`. 
1. Choose between four different modes (algorithms) for splitting the slices or data points to significant ones and small ones. To control this behavior, use the [`Telerik.Reporting.MergedDataPoints.ThresholdMode`](/reporting/api/Telerik.Reporting.MergedDataPoints#Telerik_Reporting_MergedDataPoints_ThresholdMode) property values in the [`Telerik.Reporting.ThresholdMode`](/reporting/api/Telerik.Reporting.ThresholdMode) enumeration. 
1. Based on the selected mode, set an appropriate [`Telerik.Reporting.MergedDataPoints.ThresholdValue`](/reporting/api/Telerik.Reporting.MergedDataPoints#Telerik_Reporting_MergedDataPoints_ThresholdValue). The value of each slice for merging is evaluated over the [`Telerik.Reporting.BarSeries.X`](/reporting/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_X) property. [`Telerik.Reporting.MergedDataPoints.ThresholdMode`](/reporting/api/Telerik.Reporting.MergedDataPoints#Telerik_Reporting_MergedDataPoints_ThresholdMode) supports expressions and the expression must evaluate to the needed number type. 

By default, the merged slice is labeled in the legend of the chart as __Others__. To modify the name, set the [`Telerik.Reporting.MergedDataPoints.LegendItemLabel`](/reporting/api/Telerik.Reporting.MergedDataPoints#Telerik_Reporting_MergedDataPoints_LegendItemLabel). `Telerik.Reporting.MergedDataPoints.LegendItemLabel` supports expressions. 

To customize the styling of the merged data point, its label, or the corresponding legend item, use the corresponding Conditional Formatting property by using the `= IsMergedData() | Operator.Equals | = True` filter. 

## Design Considerations

* Pie charts are popular in reports because of their visual impact. However, Pie charts are a very simplified chart type that may not best represent your data. Consider using a Pie chart only after the data has been aggregated to seven data groups or less. 
* Pie charts display each data group as a separate slice on the chart. You must add at least one data field and one series field to the pie chart. If more than one data field is added to a Pie chart, the Pie chart will display both data fields in the same chart. 
* If you are defining your own colors on a Pie chart with a custom palette, be sure that you have enough colors in your palette to display each data point with its own unique color. 
* A Pie chart requires at least two values to make a valid comparison between proportions. If your Pie chart contains only one color, verify that you have added a series field by which to group the data. When the Pie chart does not contain series, it aggregates the values from your data field into one value for display. 