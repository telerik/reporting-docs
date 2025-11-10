---
title: Axes
page_title: Graph Report Item Axes
description: "Learn how you may style and format the axes of the Telerik Reporting Graph report item and how the Reporting engine validates them."
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/axis
tags: telerik, reporting, report, items, graph, styling, formatting, axes, validate
published: True
previous_url: /GraphFormattingAxis
reportingArea: General
---

# Axes of the Graph

As coordinate-based charts, the Column, Bar, Area, Point, Line, and Range chart types have two axes that are used to categorize and display data relationships.

You can apply different types of formatting to each axis by using the __Property Browser__ or the ribbon tools of the Standalone Report Designer. To format an axis, click the element to change the values for its title, numeric and date formats, major and minor tick marks, labels, and style.

## Validation

The processing engine performs an additional validation on the axis ticks and labels to ensure that they will result in an easy-to-read chart and not cause a performance penalty. If the current axis settings will result in more than __1000__ labels or __5000__ tick marks, the Graph will not render its content, but will display the following message, explaining what needs to be fixed in the axis setup:

`The current NumericalScale settings would result in more than 1000 labels which will make the scale unreadable. Please set the axis/ grid lines visibility to False or change the corresponding property.`

In most cases, the reason to see this or similar message is that the selected __LabelStep__, __MajorStep__, or __MinorStep__ scale property has a value that is too small and the processing engine will violate the previously mentioned constraint numbers. This also happens when, using a __DateTimeScale__, the user sets its __Scale.BaseUnit__ or __Scale.LabelUnit__ to `Seconds` or `Minutes` when displaying a timespan of an year, for example.

Usually, the solution is to set the scale step properties to be automatically calculated, that is, to reset them to __NaN__ or select __Auto__ for the **DateTimeScale** unit properties. To specifically set the unit or step properties, make sure they will conform with the previously mentioned constraints.

You can also choose not to render the axes elements and, as a result, the axes validation will not occur:

* For the axes labels, you can set their __LabelPlacement__ to __None__.
* For the major and minor ticks, you can set their __TickMarkDisplayType__ to __None__.
* For the gridlines, you can change their __Style.Visible__ property to __False__.

> * When you work with discrete values, such as DatetimeScale, NumericalScale, LogarithmicScale, you need at least two data points to have a properly calculated axis range and visible data.
> * Setting the **Minimum** and **Maximum** properties of the scale can resolve issues related to insufficient data.
> * To have the axis range set based on data, use [bindings to control the coordinate system properties]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-use-bindings-to-control-the-coordinate-system-properties%}).

## Labels

Axes labels contain additional information about the data an axis displays.

### Rendering Labels as Dates or Currencies

By default, when you add a numeric value to the Y axis, the chart will not format the number before displaying it. If your numeric field is a sales figure, consider formatting the numbers as currencies to increase the readability of the chart.

To format time intervals correctly, the values displayed on the X axis must evaluate to a `System.DateTime` data type. If your field has a data type of `System.String`, the chart will not calculate intervals as dates or times.

To format the axes labels with the Standalone Report Designer:

1. Click the Graph axis you want to format. As a result, the __Graph Tools - Format__ tab of the ribbon is activated.
1. Click the __Graph Tools - Format__ context tab of the ribbon.
1. Apply the desired format with the tools in the **Format** ribbon group. The Graph layout is automatically updated and you will be able to review your changes immediately.

### Changing the Label Position

Because each chart type has a different shape, axis labels are placed in an optimal location so as not to interfere on the chart. The default position of the labels is next to the axis.

To change the position of the axis label:

1. Create a Graph with a Bar series.
1. On the design surface, click the axis. The selected axis properties are listed in the __Property Browser__.
1. In the __Misc__ section, select a value for the **LabelPlacement** property.

## Step

The axis step defines the number of labels and the accompanying tick marks on an axis. On an axis with a NumericScale, its steps provide a consistent measure of the data points on the chart. You can specify the number of the axis steps by using the **Scale.MajorStep** and **Scale.MinorStep** properties.

To change the step of an axis:

1. Click the chart axis that you want to change. The selected axis properties are listed in the __Property Browser__.
1. In the __Misc__ section, select a value for the **Scale.MajorStep** property.

## Logarithmic Scale

If your data is logarithmically proportional, you can use a logarithmic scale on the chart, which will help improve the appearance of the chart by making your data more manageable.

### Specifying the Scale

Most logarithmic scales use a base of 10 but you can change it with the **Scale.Base** property.

To specify a logarithmic axis scale:

1. Click the chart axis that you want to change. The selected axis properties are listed in the __Property Browser__.
1. In the __Misc__ section, select __logarithmic Scale__ for the __Scale__ property.

### Applying Data Point Ticks

When you are using a __Logarithmic Scale__, it is useful to have the axis ticks and labels exactly where your data points are located. To control this behavior, use the [**DataPointTicks**](/api/Telerik.Reporting.NumericalScaleBase#Telerik_Reporting_NumericalScaleBase_DataPointTicks) property. When set to __true__, the axis will display the ticks and labels for every data point in the data set.

Note that using this feature may ignore some of the scale properties, such as __MajorStep__, __MinorStep__, and __LabelStep__, because the step will not be calculated.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Structure and Elements of the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [GraphAxis](/api/Telerik.Reporting.GraphAxis)
* [LabelFormat](/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_LabelFormat)
* [LabelPlacement](/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_LabelPlacement)
* [Scale](/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_Scale)
* [Scale](/api/Telerik.Reporting.Scale)
* [MajorStep](/api/Telerik.Reporting.NumericalScale#Telerik_Reporting_NumericalScale_MajorStep)
* [MinorStep](/api/Telerik.Reporting.NumericalScale#Telerik_Reporting_NumericalScale_MinorStep)
