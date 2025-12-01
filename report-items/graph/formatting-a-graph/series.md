---
title: Series
page_title: Graph Report Item Series 
description: "Learn how to style and format the series of the Telerik Reporting Graph report item, how to define custom pallettes and how to use conditional formatting with the Graph Series."
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series
tags: telerik, reporting, report, items, graph, styling, formatting, series
published: True
previous_url: /GraphFormatSeries
reportingArea: General
---

# Series of the Graph

The series is a sequence of data points that represents individual measurements.

## Setting the Style

The styles of the series items relate and affect each other in a hierarchical way. The relations among the styles are visually explained in the article on [series style propagation and resolving fallback algorithm]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%}).

Data points, data point labels, legend marks, and legend items declare their own style that inherits the style and the base series color of the series. However, if these items have an explicitly set property, it will [override the series style property]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%}).

The Area and the Line series have an additional pair of properties named respectively **AreaStyle** and **LineStyle**, and **ConditionalFormatting**. They affect the way the series is drawn, defining the line color, style and width, and the background color for the Area Series.

For example, if the series DataPoints have its __Style.LineWidth__ property set to __5pt__, this will affect the line width of the DataPoint markers and the legend item marker. However, if the __MarkStyle.LineWidth__ property of the legend item is set to __2pt__, the legend item marker will be drawn with a 2pt-wide line, because the series style property will be overridden.

## Formatting Data Points

Each data point has graphical representation in accordance with the selected chart type. To set its styling, use the __DataPointStyle__ property. To modify the appearance at runtime, use the __DataPointConditionalFormatting__ property. Depending on the chart type, you can also change the shape of the data point by using the [`MarkerType`](/api/Telerik.Reporting.LineSeries#Telerik_Reporting_LineSeries_MarkerType) enumeration.

To modify the shape of the series data point:

1. On the design surface, click the series. The selected bar series properties are listed in the __Property Browser__.
1. Locate the __MarkerType__ property in the __Data Point Marker__ section. If the property doesn't exist for the selected series, for example, Bar or Column, you will not be able to change the shape of the data point.
1. Set the type of the marker from the drop-down menu. Set the __MarkerSize__ properties if necessary.

> Only the marker types that form a closed contour support the __BackgroundImage__ property. If set, the markers that consist only of lines, that is, __X__, __Plus__, and __Minus__, will not render a background image.

## Formatting Data Point Labels

Each data point provides a data point label which displays some content. You can format, position, and rotate the data point label by using the available Graph properties.

Depending on the series type, the default locations of the series labels are:

* (Bar series) Labels are placed outside of the bars that represent data points.
* (Line series) Labels are placed above the line that represent data points.

### Changing the Position

To change the position of the data point labels in a Bar series:

1. Create a Graph with a Bar series.
1. On the design surface, click the Bar series. The selected Bar series properties are listed in the __Property Browser__.
1. In the __Data Point Label__ section, select a value for the **DataPointLabelAlignment** property.
1. In the __Data Point Label__ section, set a value for the **DataPointLabelOffset** property. The label offset direction depends on the **DataPointLabelAlignment** value.

### Changing the Rotation Angle

To change the rotation angle of the data point labels:

1. Create or select a Graph.
1. On the design surface, click the desired series. The selected series properties are listed in the __Property Browser__.
1. In the __Data Point Label__ section, set a value for the **DataPointLabelAngle** property. The value must be an integer in the 0-360 range and will represent the rotation angle in degrees. By default, the value is `0`.

### Modifying the Style

To change the style of the data point labels:

1. Create or select a Graph.
1. On the design surface, click the desired series. The selected series properties are listed in the __Property Browser__.
1. In the __Data Point Label__ section, select and edit the **DataPointLabelStyle** property.

### Adding Conditional Formatting

To add conditional formatting to the data point labels:

1. Create or select a Graph.
1. On the design surface, click the desired series. The selected series properties are listed in the __Property Browser__.
1. In the __Data Point Label__ section, select and edit the **DataPointLabelConditionalFormatting** collection.

## Modifying the Color

The Graph comes with built-in color palettes and also enable you to select or define an additional, custom palette of colors. The series colors will appear in the legend too.

When multiple series are added to the chart, the chart assigns the series a color in the order in which the colors have been defined in the palette.

### Using the Default Palette

The built-in series color palettes are only available in the Standalone Report Designer.

To change the series by using the built-in color palette:

1. Click the chart series you want to change. As a result, the __Graph Tools.Design__ ribbon context tab is activated.
1. In the __Chart Style__ group, select a color palette from the __Change Colors__ drop-down.

### Defining Custom Palettes

Custom palettes are report-specific.

If there are a greater number of series than there are colors in the palette, the chart will begin reusing colors, and two series may have the same color. To avoid confusion, define a custom palette with at least the same number of colors as you have series on your chart.

If you are using a custom color palette, you can change the order of the colors to change the color of different series.

To define a custom color palette:

1. Click the chart series that you want to change. The selected axis properties are listed in the __Property Browser__.
1. In the __Appearance__ group. Set the __ColorPalette property__ to - __Color Palette__.
1. One of the three options must be selected from the drop-down menu no matter which one.
1. In the __Colors property__, click the __Edit Collection (…) button__. The Color Collection Editor opens.
1. Click __Add__ to add a color and select a color from the drop-down.
1. Click __Add__ to add more colors to the palette.
1. When you are done, click __OK__.

To define a custom monochromatic palette:

1. Click the chart series you want to change. The selected axis properties are listed in the __Property Browser__.
1. In the __Appearance__ group, set the **ColorPalette** property to __Monochromatic Palette__.
1. Set the __BaseColor__, __MaxLightness__ and __MinLightness__ properties.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Structure and Elements of the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%})
* [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%}) 
* [GraphSeries](/api/Telerik.Reporting.GraphSeries)
