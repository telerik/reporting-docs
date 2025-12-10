---
title: Location Map Series
page_title: Initialize Location Map Series in the Map Report Item
description: "Learn how to add and configure a LocationMapSeries instance to the Map report item when using Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-locationmapseries-to-the-map-item
tags: telerik, reporting, map, report, item, add, locationmapseries, instance
previous_url: /MapHowToAddLocationMapSeriesToTheMapItem, /report-items/map/how-to/how-to-add-locationmapseries-to-the-map-item, /knowledge-base/map-add-locationmapseries, /maphowtoaddpointmapseries
position: 3
reportingArea: General
---

# Adding LocationMapSeries Instances to the Map

In this article, you will learn how to add a `LocationMapSeries` instance to the Map report item.

To add new `PointMap`, `PieMap`, or a `ColumnMap` series to the Map:

1. Open the __Series__ collection editor and __Add__ new [`PointMapSeries`](/api/Telerik.Reporting.PointMapSeries), [`PieMapSeries`](/api/Telerik.Reporting.PieMapSeries), or [`ColumnMapSeries`](/api/Telerik.Reporting.ColumnMapSeries) items.
1. Set the [`GeoLocationGroup`](/api/Telerik.Reporting.LocationMapSeries#Telerik_Reporting_LocationMapSeries_GeoLocationGroup) to an existing [`GeoLocationMapGroup`](/api/Telerik.Reporting.GeoLocationMapGroup) instance or create a new one from scratch.
1. Set the [`SeriesGroup`](/api/Telerik.Reporting.MapSeriesBase#Telerik_Reporting_MapSeriesBase_SeriesGroup) to an existing [`MapGroup`](/api/Telerik.Reporting.MapGroup) instance or create a new one from scratch.
1. Group the data.

	+ If you are creating a [`PointMapSeries`](/api/Telerik.Reporting.PointMapSeries), you can define a `SeriesGroup` by which your data will be grouped. This may come handy if you want to have a different color for every data point in your series.
	+ If you are creating a [`PieMapSeries`](/api/Telerik.Reporting.PieMapSeries) or a [`ColumnMapSeries`](/api/Telerik.Reporting.ColumnMapSeries), define an additional child group, which will be used to determine how the data will be grouped for every data point. The color and count of the pie sectors (or columns when creating a [`ColumnMapSeries`](/api/Telerik.Reporting.ColumnMapSeries)) will be determined by the last child group of defined `SeriesGroups`. Usially, you will create a single series group without grouping (which will result in a static group) and add a single child group, with [`Groupings`](/api/Telerik.Reporting.GroupBase#Telerik_Reporting_GroupBase_Groupings) set to the field by which you will group the data.

1. Set the __Size__ to an expression that will be used to determine the pie sector or the column size.

When all the properties are set, the `LocationMapSeries` instance will look similar to the following one in the (Property Grid(:

![The Location Map Series as configured in the MapSeries Collection Editor of the Report Designer](images/Map_AddLocationMapSeries.png)

## See Also

* [Adding Choropleth Maps to Reports with the Map Wizard]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-choropleth-using-the-map-wizard%})
* [Adding ShapeMapSeries Instances to the Map]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-shapemapseries-to-the-map-item%})
* [Creating BarChart Series and CSV Data Source Maps]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-create-a-map-with-barchart-series-using-csv-data-source%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
* [Map Class API Reference](/api/telerik.reporting.map)
