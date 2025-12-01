---
title: Legend
page_title: Graph Report Item Legend 
description: "Learn how to order, filter, position, style and format the legend of the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/legend
tags: telerik, reporting, report, items, graph, styling, formatting, legend, filter, order, sort, position
published: True
previous_url: /GraphFormattingLegend
reportingArea: General
---

# Legend of the Graph

When the data appearing in a chart contains multiple variables (series), you can include a legend in the chart. The legend contains a list of the variables appearing in the chart and an example of their appearance (mark). This information allows the data from each variable to be identified in the Graph.

A legend always contains one or more legend items, where each legend item consists of a colored box that represents the series, and a text string that describes the series.

To format a legend, use the __Legend properties__ of the Graph report item and click the legend to change the legend placement (**Location** and **IsInsidePloatArea**), **Size**, **Title**, and items **Style**. The **Title** property can be an expression.

You cannot add images, extra columns, or other supplementary items to the legend.

## Modifying the Color

The colored box displayed for each legend item is inherited from the fill color of its corresponding series.

To change the color displayed in a legend item, modify the color of the corresponding [series]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series%}).

You can also use the **ConditionalFormatting** and **MarkConditionalFormatting** collections of the **LegendItem** to style items based on the Graph data.

## Modifying the Text Style

To change the text style, select the legend and change the __Style__ properties from the __Property Browser__.

1. Click the Graph legend you want to change. The selected legend properties are listed in the __Property Browser__.
1. In the __Style property__, click the __Edit Collection (…) button__. The **Edit style** dialog opens.
1. When you are done, click **OK**.

Note that if you are using the Standalone Report Designer, you can use the Graph tools in the **Design** and **Format** tabs of the ribbon.

## Setting the Order

Legend items are ordered according to the order in which their corresponding series are processed by the processing engine.

To change the order, configure the [**Sortings**]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%})[**Expression**]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) of the **Graph.SeriesGroups**.

## Modifying the Text

You can change the text of the legend item by modifying each **Graph.Series** properties of the **LegendItem**. To set the __LegendItem.Value property__, use [**Expression**]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}).

## Removing Extra Legends

The legend is always connected to a series. If a legend item appears in the legend but the corresponding series is not displayed in the chart, most likely the series does not contain any values.

To remove the legend item, remove the series from the chart by setting up a [**Filter**]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) for the corresponding **SeriesGroup**.

To visually hide a legend item, use the __Graph.Series.LegendItem.Style.Visible__ property.

## Positioning the Legend

When the legend is placed outside the chart area, you can move the legend to one of twelve available positions. By default, the legend is shown outside the plot area.

To reposition the legend:

1. Click the legend area. The legend properties are listed in the __Property Browser__;
1. In the __Misc__ section, select a value for the **Position** property.

To move the legend inside the plot area:

1. Click the legend area. The legend properties are listed in the __Property Browser__;
1. In the __Misc__ section, set the __IsInsideThePlotArea property__ to __True__.

## Displaying Legends Horizontally

To display the legend horizontally, move the legend to the top or bottom of the chart. As a result, the legend expands horizontally.

## Sizing the Legend

You can size the legend absolutely or automatically. If the **Height** or **Width** fields are left empty, the engine will define their run-time values according to the data.

The automatic sizing partially depends on the positioning of the legend as follows:

* Absolutely positioned&mdash;If both dimensions are set, the size is absolute and will not be altered at run-time. If one of the dimensions is not set, the legend will automatically grow in its direction. The ordering of the items is "down then across", forming columns.
* Relatively positioned&mdash;The available properties are **Center**, **LeftTop**, **LeftCenter**, **LeftBottom**, **RightTop**, **RightCenter**, **RightBottom**. The width is absolute if set. Otherwise, the legend can grow horizontally. The legend can stretch up to the **PlotArea** width when **IsInsidePlotArea = True** and no more than half of the Graph width when **IsInsidePlotArea = False**.

	The height is taken into account only if all items can fit in the provided space. Otherwise, the legend grows vertically, stretching to the limits of the Graph at maximum. The ordering of the items is "down then across", forming columns.

* Relatively positioned&mdash;The available properties are **TopLeft**, **TopCenter**, **TopRight**, **BottomLeft**, **BottomCenter**, **BottomRight**. The height is absolute if set. Otherwise, the legend can grow vertically. The legend can stretch up to the **PlotArea** height when **IsInsidePlotArea = True** and no more than half of the Graph height when **IsInsidePlotArea = False**.

	The width is taken into account only if all items can fit in the provided space. Otherwise, the legend grows horizontally, stretching to the limits of the graph at maximum. The ordering of the items is "across then down", forming rows.


> If the contents of the Legend do not fit within the maximum space available, an ellipsis `...` will be shown as a placeholder.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [GraphLegend](/api/Telerik.Reporting.GraphLegend)
* [Legend](/api/Telerik.Reporting.Graph#Telerik_Reporting_Graph_Legend)
