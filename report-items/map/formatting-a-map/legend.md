---
title: Legend
page_title: Styling and Formatting the Map Legend
description: "Learn how to customize the Legend of the Telerik Reporting Map report item through styling and formatting."
slug: telerikreporting/designing-reports/report-structure/map/formatting-a-map/legend
tags: telerik, reporting, map, report, item, legend, customize, style, format
previous_url: /MapFormattingLegend, /MapFormattingAMap, /report-items/map/formatting-a-map/overview 
published: True
reportingArea: General
---

# Customizing Map Legend

When the data appearing in a Map chart contains multiple variables, the chart may include one or more legends.

The legend contains a list of the variables displayed in the map and an example of their appearance. This information allows the data from each variable to be identified in the map series.

A legend always contains one or more legend items where each legend item consists of a colored box that represents the series, and a text string that describes the series.

> When using a [`ShapeMapSeries`](/api/Telerik.Reporting.ShapeMapSeries), the legend items depend on its [`ColorsCount`](/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorsCount) property.

## Setting the Order

Legend items are ordered according to the order in which they are processed by the processing engine. To change their order, change the [`Sortings`]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%}) [`Expression`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) or `Direction` of the MapGroup.

## Modifying the Text and Text Style

To modify the text of the legend items, change the `Map.MapSeries` Legend [`Expression`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}).

> When you use the [`ShapeMapSeries`](/api/Telerik.Reporting.ShapeMapSeries), the `LegendItem.Value` expression allows you to apply the `RangeMin` and `RangeMax` specific references, which determine the minimum and maximum values of the respective data range.

To change the text style of the legend items:

1. Click the map legend you want to change. The selected legend properties are listed in the __Property Browser__.
1. In the __Style__ property, click the __Edit Collection (…)__ button. As a result, the **Edit style** dialog opens. Modify the style properties as required.
1. When you are done, click **OK**.

If you are using the Standalone Report Designer, you can use the ribbon format and map tools.

## Changing the Color

The colored box displayed for each legend item is inherited from the fill color of its corresponding series. To change the color displayed in a legend item, you will have to change the color of the corresponding series. For more information, refer to the article about [series]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series%}).

## Removing Extra Legend Items

The legend is always connected to a series. If a legend item appears in the legend but the corresponding series is not displayed in the chart, the most likely cause is that the series does not contain any values. To remove the legend item from the legend, you must remove this series. To remove a series from your chart, you have to set up a [Filter]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) for the corresponding `SeriesGroup`.

## Positioning

You can move the legend to one of twelve different positions when the legend is placed outside the chart area. By default, the legend is shown outside the plot area.

To reposition the legend:

1. Click the legend area. The legend properties are listed in the __Property Browser__;
1. In the __Misc__ section, select a value for the **Position** property.

To move the legend inside the plot area:

1. Click the legend area. The legend properties are listed in the __Property Browser__;
1. In the __Misc__ section, set the __IsInsideThePlotArea__ property to __True__.

## Rendering

To display the legend horizontally, move the legend to the top or bottom of the chart. As a result, the legend expands horizontally.

## Setting the Size

The legend can be absolutely or automatically sized. If the `Height` or `Width` fields are left empty, the engine will define their run-time values according to the data.

The automatic sizing partially depends on the positioning of the legend as follows:

* Absolutely positioned&mdash;If both dimensions are set, the size is absolute and will not be altered at run-time. If one of the dimensions is not set, the legend will automatically grow in its direction. The ordering of the items is "down then across", forming columns.

* Relatively positioned&mdash;The supported options are `Center`, `LeftTop`, `LeftCenter`, `LeftBottom`, `RightTop`, `RightCenter`, `RightBottom`.

	The width is absolute if set. Otherwise, the legend can grow horizontally. The legend can stretch up to the width of the plot area when `IsInsidePlotArea = True` and no more than half of the map width when `IsInsidePlotArea = False`.

	The height is taken into account only if all items can fit in the provided space. Otherwise, the legend grows vertically, stretching to the limits of the map at maximum. The ordering of the items is "down then across", forming columns.

* Relatively positioned&mdash;The supported values are `TopLeft`, `TopCenter`, `TopRight`, `BottomLeft`, `BottomCenter`, `BottomRight`.

	The height is absolute if set. Otherwise, the legend can grow vertically. The legend can stretch up to the height of the plot area when `IsInsidePlotArea = True` and no more than half of the map height when `IsInsidePlotArea = False`.

	The width is taken into account only if all items can fit in the provided space. Otherwise, the legend grows horizontally, stretching to the limits of the map at maximum. The ordering of the items is "across then down", forming rows.

## See Also
 
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [(API) MapLegend](/api/Telerik.Reporting.MapLegend)
* [(API) Legends](/api/Telerik.Reporting.Map#Telerik_Reporting_Map_Legends) 
* [Structure and Elements of the Map Report Item]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
