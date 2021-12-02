---
title: Legend
page_title: Legend | for Telerik Reporting Documentation
description: Legend
slug: telerikreporting/designing-reports/report-structure/map/formatting-a-map/legend
tags: legend
published: True
position: 3
---

# Legend



When the data appearing in a map chart contains multiple variables, the chart may include one or more legends.         The legend contains a list of the variables appearing in the map and an example of their appearance.         This information allows the data from each variable to be identified in the map series.       

A legend always contains one or more legend items, where each legend item consists of a colored box that represents the series,         and a text string that describes the series.       

>important When using a  [ShapeMapSeries](/reporting/api/Telerik.Reporting.ShapeMapSeries) , the legend items depend on its            [ColorsCount](/reporting/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorsCount)  property.         


You can format a legend with the Legends properties.         Click the legend to change the legend position, size, title and items style, background color and borders.       

You cannot add images, extra columns or other supplementary items to the legend.       

## Ordering Legend Items

Items are ordered in the legend according to the order that they are processed by the processing engine.           You can change the order by changing the MapGroup [Sortings]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/overview%})[Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) or Direction.         

## Changing the Text of a Legend Item

You can change the legend items text by changing the Map.MapSeries Legend [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}).         

>important When using a  [ShapeMapSeries](/reporting/api/Telerik.Reporting.ShapeMapSeries) , the LegendItem.Value expression allows the usage             of two specific references: `RangeMin` and `RangeMax`, that determine the minimum and maximum values             of the respective data range.           


## Changing the Color of a Legend Item

The colored box displayed for each legend item is inherited from the fill color of its corresponding series.           If you want to change the color displayed in a legend item, you will have to change the color of the corresponding series.           For more information, see [Series]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series%}).         

## Changing the Text Style of a Legend Item

You can change the legend items text style by selecting the legend and with __Property Browser__  change __Style__  properties.         

>note If you are using the Standalone Report Designer you can take advantage of the ribbon format and map tools.           


1. Click the map legend that you want to change.    The selected legend properties are listed in the __Property Browser__ .                 

1. In the __Style property__ , click the __Edit Collection (…) button__ . The Edit style dialog opens.                                       Modify the style properties as required.                 

1. When you are done, click OK.                 

## Removing Extra Legend Items

The legend is always connected to a series.           If a legend item appears in the legend but the corresponding series is not displayed in the chart,           the most likely cause is that the series does not contain any values.           You must remove this series in order to remove the legend item from the legend.           To remove a series from your chart, you have to setup a [Filter]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) for the corrensponding SeriesGroup.         

## Positioning the Legend

You can move the legend to one of twelve different positions when the legend is placed outside the chart area.           By default, the legend is shown outside the plot area.         

###Reposition the Legend:

1. Click the legend area.    The legend properties are listed in the __Property Browser__ ;                 

1. In the __Misc__  section select a value for the Position property.                 

###Move the Legend Inside the Plot area:

1. Click the legend area.    The legend properties are listed in the __Property Browser__ ;                 

1. In the __Misc__  section set the __IsInsideThePlotArea property__  to __True__ .                 

## Displaying Legend Items Horizontally

To display the legend horizontally, move the legend to the top or bottom of the chart. This causes the legend to expand horizontally.         

## Sizing the Legend

The legend can be absolutely or automatically sized.           If the Height or Width fields are left empty, the engine will decide their run-time values according to the data.           The automatic sizing partially depends on the positioning of the legend as follows:         

* Absolutely positioned:             If both dimensions are set, the size is absolute and will not be altered at run-time.             If one of the dimensions is not set, the legend will automatically grow in its direction.             The ordering of the items is "down then across", forming columns.             

* Relatively positioned - Center, LeftTop, LeftCenter, LeftBottom, RightTop, RightCenter, RightBottom:             The width is absolute if set, otherwise the legend can grow horizontally.               The legend can stretch up to the PlotArea width when IsInsidePlotArea = True and no more than half of the map width when IsInsidePlotArea = False.             The height is taken into account, only if all items can fit in the provided space.               Otherwise the legend grows vertically, stretching to the limits of the map at maximum.             The ordering of the items is "down then across", forming columns.             

* Relatively positioned - TopLeft, TopCenter, TopRight, BottomLeft, BottomCenter, BottomRight:             The height is absolute if set, otherwise the legend can grow vertically.               The legend can stretch up to the PlotArea height when IsInsidePlotArea = True and no more than half of the map height when IsInsidePlotArea = False.             The width is taken into account, only if all items can fit in the provided space.               Otherwise the legend grows horizontally, stretching to the limits of the map at maximum.             The ordering of the items is "across then down", forming rows.             

# See Also
 * [MapLegend](/reporting/api/Telerik.Reporting.MapLegend)  * [Legends](/reporting/api/Telerik.Reporting.Map#Telerik_Reporting_Map_Legends) 

 * [Map Overview]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})

 * [Map Structure]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
