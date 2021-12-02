---
title: Axis
page_title: Axis | for Telerik Reporting Documentation
description: Axis
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/axis
tags: axis
published: True
position: 1
---

# Axis



Coordinate-based chart types (column, bar, area, point, line, and range)         have two axes that are used to categorize and display data relationships.         Different types of formatting will be applied to each axis.       

You can format axes by using __Property Browser__  or using the Standalone Report Designer ribbon tools.         Click the axis you want to format and change values for the axis         title, numeric and date formats, major and minor tick marks, labels, and style.       

## Axis Validation

The processing engine performs an additional validation on the axis ticks and labels in order to ensure that they will result in an           easy-to-read chart and not cause a performance penalty. If the current axis settings would produce more than __1000__            labels or __5000__  tick marks, the Graph item will not render its content, but will display a message, explaining what           needs to be fixed in the axis setup:         

`             The current NumericalScale settings would result in more than 1000 labels which will make the scale unreadable. Please set the axis/ grid lines visibility to False or change the corresponding property.           `

In the most cases the reason to see this (or a similar) message is that the selected __LabelStep__ ,           __MajorStep__  or __MinorStep__  scale property           has too small value and the processing engine will violate the constraint numbers, mentioned above. This also happens when, using a           __DateTimeScale__ , the user sets its __Scale.BaseUnit__  or __Scale.LabelUnit__  to Seconds or Minutes           when displaying a timespan of an year, for example.         

In the most cases the solution is to set the Scale step properties to be automatically calculated (reset them to __NaN__            or select __Auto__  for DateTimeScale unit properties). If you need to specifically set the unit or step property,           then make sure it will conform with the above constraints.         

Additionally you can choose not to render the axis elements, so the axis validation will not occur. For labels you can set their           __LabelPlacement__  to __None__ , for major and minor ticks you can set their __TickMarkDisplayType__            to __None__  and for the grid lines you can change their __Style.Visible__  property to __False__ .         

>note When you work with discrete values - DatetimeScale, NumericalScale, LogarithmicScale,             you need at least two data points to have a properly calculated axis range and visible data.             Setting the Scale's Minimum and Maximum properties can resolve issues related to insufficient data.             To have the axis range set based on data, you can use the approach from             [How to: Use Bindings to Control the Coordinate System Properties]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-use-bindings-to-control-the-coordinate-system-properties%}).           


## Format Axis Labels as Dates or Currencies

When a numeric value is added to the y-axis, by default, the chart does not format the number before displaying it.           If your numeric field is a sales figure, consider formatting the numbers as currencies to increase the readability of the chart.         

In order to format time intervals correctly, the values displayed on the x-axis must evaluate to a System.DateTime data type.           If your field has a data type of System.String, the chart will not calculate intervals as dates or times.         

###To format the axis labels with the Standalone Report Designer

1. Click on the Graph axis you want to format.    Ribbon __Graph Tools - Format__  tab is activated.                 

1. Click the Ribbon __Graph Tools - Format__  context tab.                 

1. Apply the desired format with the tools in the Format ribbon group.    The Graph layout is automatically updated and you will right away review your changes.

## Format Axis Labels

Because each chart type has a different shape, axis labels are placed in an optimal location so as not to interfere on the chart.           The default position of the labels is next to the axis.         

###To change the position of axis labels

1. Create a graph with bar series.

1. On the design surface, click on the axis    The selected axis properties are listed in the __Property Browser__ .                 

1. In the __Misc__  section. Select a value for the LabelPlacement property.                 

## Configure Axis Step

The axis step defines the number of labels and accompanying tick marks on an axis.           On axis with NumericScale, axis steps provide a consistent measure of the data points on the chart.           You can specify the number of steps you want in the axis with Scale.MajorStep and Scale.MinorStep properties.         

###To change the axis step

1. Click the chart axis that you want to change.    The selected axis properties are listed in the __Property Browser__ .                 

1. In the __Misc__  section. Select a value for the Scale.MajorStep property.                 

## Specify a Logarithmic Scale

If you have data that is logarithmically proportional, you may want to consider using a logarithmic scale on the chart.           This helps improve the appearance of the chart by making your data more manageable.           Most logarithmic scales use a base of 10. Still you can change it with Scale.Base property.         

###To specify a logarithmic scale

1. Click the chart axis that you want to change.    The selected axis properties are listed in the __Property Browser__ .                 

1. In the __Misc__  section select __logarithmic Scale__  for the __Scale__  property.                 

## Datapoint Ticks

In some cases, especially when using a __Logarithmic Scale__ , it is useful to have the axis ticks and labels           exactly where your datapoints are. This behavior is controlled by the            [DataPointTicks](/reporting/api/Telerik.Reporting.NumericalScaleBase#Telerik_Reporting_NumericalScaleBase_DataPointTicks)  property. When set to           __true__ , the axis will display the ticks and labels for every data point in the data set.         

Please note that using this feature means that some of the scale properties like __MajorStep__ ,           __MinorStep__  and __LabelStep__  will not be respected, since the step will not be calculated.         

# See Also


 * [Graph Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%}) * [GraphAxis](/reporting/api/Telerik.Reporting.GraphAxis)  * [LabelFormat](/reporting/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_LabelFormat)  * [LabelPlacement](/reporting/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_LabelPlacement)  * [Scale](/reporting/api/Telerik.Reporting.GraphAxis#Telerik_Reporting_GraphAxis_Scale)  * [Scale](/reporting/api/Telerik.Reporting.Scale)  * [MajorStep](/reporting/api/Telerik.Reporting.NumericalScale#Telerik_Reporting_NumericalScale_MajorStep)  * [MinorStep](/reporting/api/Telerik.Reporting.NumericalScale#Telerik_Reporting_NumericalScale_MinorStep) 
