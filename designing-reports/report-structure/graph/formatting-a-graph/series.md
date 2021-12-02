---
title: Series
page_title: Series | for Telerik Reporting Documentation
description: Series
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series
tags: series
published: True
position: 2
---

# Series



A sequence of data points that represents individual measurements.

## Setting series style

The styles of the series items relate and affect each other in a hierarchical way. The relations among the styles are visually explained on the           [Style resolving fallback algorithm diagram]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm%})           Data points, data point labels, legend marks and legend items declare their own style that inherits the series' style           and the base series color. However, if these items have an explicitly set property, it will override the series' style property as explained in the           [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%}) documentation article.         

The Area and the Line series have an additional pair of properties named respectively AreaStyle/LineStyle and ConditionalFormatting.           They affect the way the series is drawn, defining the line color, style and width, and the background color for the Area Series.         

>note For example, if the series DataPoints have its  __Style.LineWidth__  property set to  __5pt__ , this will             affect the line width of the DataPoint markers and the legend item marker. But if the legend item's  __MarkStyle.LineWidth__  property             is set to  __2pt__ , then the legend item marker will be drawn with 2pt wide line, because the series's style property will be overriden.           


## Formatting data points

Each data point has graphical representation in accordance with the selected chart type. Its styling can be set through the            __DataPointStyle__  property and changed in runtime using the __DataPointConditionalFormatting__  property.           In most cases, depending on the chart type, the shape of the data point can be changed as well using the            [MarkerType](/reporting/api/Telerik.Reporting.LineSeries#Telerik_Reporting_LineSeries_MarkerType)  enumeration.         

###To change the data point shape in a series where it's applicable: 

1. On the design surface, click on the series.                     The selected bar series properties are listed in the __Property Browser__ .                 

1. Locate the __MarkerType__   property in the __Data Point Marker__  section.                     If the property doesn't exist for the selected series (e.g. Bar/Column), the data point shape cannot be changed.

1. Set the type of the marker from the drop-down menu. Set the __MarkerSize__  properties if necessary.                 

    >tip Note that only the marker types that form a closed contour support  __BackgroundImage__ . The markers                   that consists only of lines (i.e.  __X__ ,  __Plus__ ,  __Minus__ )                   will not render a background image if set.                 



## Formatting data point labels

Each data point has a textual presentation, called a data point label.           This label can be formatted, positioned and rotated by various properties.         

Series labels default locations are:

* On bar series, labels are placed outside of the bars that represent data points.

* On line series, labels are placed above the line that represent data points.

###To change the position of data point labels in a Bar series:

1. Create a graph with bar series.

1. On the design surface, click on the bar series    The selected bar series properties are listed in the __Property Browser__ .                 

1. In the __Data Point Label__  section select a value for the DataPointLabelAlignment property                 

1. In the __Data Point Label__  section set a value for the DataPointLabelOffset property.                     The label offset direction depends on the DataPointLabelAlignment value.                 

###To change the rotation angle of data point labels:

1. Create / select a graph.

1. On the design surface, click on the desired series    The selected series properties are listed in the __Property Browser__ .                 

1. In the __Data Point Label__  section set a value for the DataPointLabelAngle property.                     The value must be an integer in the 0 - 360 range and represents the rotation angle in degrees.                   Default value is 0.                 

###To change the style of data point labels:

1. Create / select a graph.

1. On the design surface, click on the desired series    The selected series properties are listed in the __Property Browser__ .                 

1. In the __Data Point Label__  section select and edit the DataPointLabelStyle property.                 

###To add conditional formatting to the data point labels:

1. Create / select a graph.

1. On the design surface, click on the desired series    The selected series properties are listed in the __Property Browser__ .                 

1. In the __Data Point Label__  section select and edit the DataPointLabelConditionalFormatting collection.                 

## Formatting Series Colors

The Graph item comes with built-in palettes, and you can define additional custom palette.           These palette colors also appear in the legend.           When multiple series are added to the chart, the chart assigns the series a color in the order           that the colors have been defined in the palette.         

If there are a greater number of series than there are colors in the palette,           the chart will begin reusing colors, and two series may have the same color.           To avoid confusion, define a custom palette with at least the same number of colors as you have series on your chart.         

You can select a palette or define a custom palette. Custom palettes are report-specific.         

###To change the series using a built-in color palette

>note             The built-in series are only available in the standalone report designer.          


1. Click the chart series that you want to change.    The ribbon context tab __Graph Tools.Design__  is activated.                 

1. In the __Chart Style__  group. Select a color palette from the                   __Change Colors__  dropdown.                 

###To define custom color palette:

1. Click the chart series that you want to change.    The selected axis properties are listed in the __Property Browser__ .                 

1. In the __Appearance__  group. Set the __ColorPalette property__  to -                   __Color Palette__ .                 

1. In the __Colors property__ , click the __Edit Collection (…) button__ .                   The Color Collection Editor opens.                 

1. Click __Add__  to add a color and select a color from the drop-down.                 

1. Click __Add__  to add more colors to the palette.                 

1. When you are done, click __OK__ .                 

If you are using a custom color palette, you can change the order of the colors to change the color of different series.

###            To define custom __monochromatic palette__ :
          

1. Click the chart series that you want to change.    The selected axis properties are listed in the __Property Browser__ .                 

1. In the __Appearance__  group. Set the ColorPalette property to -                   __Monochromatic Palette__ .                 

1. Set appropriately __BaseColor, MaxLightness and MinLightness properties__ .                 

# See Also


 * [Graph Structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})

 * [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%})

 * [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%}) * [GraphSeries](/reporting/api/Telerik.Reporting.GraphSeries) 
