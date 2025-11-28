---
title: Layers and Hierarchy
page_title: Layers and Hierarchy of the Map Report Item
description: "Learn how to build the layers and hierarchy of the Telerik Reporting Map report item including the GeoLocation, ShapeMapGroup, SeriesGroups, and more."
slug: telerikreporting/designing-reports/report-structure/map/connecting-to-data
tags: telerik, reporting, map, report, item, layers, hierarchy, geolocation, shapemapgroup, seriesgroups
published: True
reportingArea: General
---

# Layers and Hierarchy of the Map

The Map report item is a data item that is similar to the [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) report item, and allows you to present aggregated data by two hierarchical dimensions or groups.

The __GeoLocationGroup__ defines the geographical component of your data, and the __SeriesGroups__ allows you to group your data in a hierarchical way and display one or more measures over the defined geographical reference. Like the other Telerik Reporting data items, the Map connects to a single data source and provides additional options for sorting and filtering the input data, binding, conditional formatting, and so on.

## GeoLocationGroup Hierarchy

The `GeoLocationGroup` hierarchy defines the data points location in the Map series and acts in the same way as the Category Group hierarchy of the Graph. If the report uses a location provider to obtain the geographical coordinates of the data point from a web service, the grouping expression of the [`GeoLocationMapGroup`](/api/Telerik.Reporting.GeoLocationMapGroup) is used as a request parameter when calling the geocoding service. To achieve better geocoding results, the grouping expression has to provide as many request details as possible, for example, concatenating a city name with a state or region name and a country name.

## ShapeMapGroup Hierarchy

The `ShapeMapGroup` hierarchy is used only in the [`ShapeMapSeries`](/api/Telerik.Reporting.ShapeMapSeries) setting which provides its own spatial data source, depending on the selected [`SourceType`](/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_SourceType) property. The geographical coordinates of the data points do not depend on this hierarchy and, therefore, it does not provide any geolocation properties.

## SeriesGroups Hierarchy

The `SeriesGroups` hierarchy defines the series at runtime. For example, if you have a group by the **Country** field in the `SeriesGroups` hierarchy, the number of the different countries will determine how many series will appear on the Map.

## LocationMapSeries Data

The Map item series display aggregated data to visualize one or more measures. At runtime the intersection between the series group hierarchy members and the category group hierarchy members defines the data points in the series. The coordinates of each data point are obtained either directly from the data set through the __Latitude__ and __Longitude__ properties, or by using the __Location__ property of the series `GeoLocationGroup`. The value of the data point is a measure for its size and is calculated by an expression defined for its __Size__ property.

## ShapeMapSeries Data

The `ShapeMapSeries` that is used in the Choropleth map does not use the series group hierarchy the way it is used in the `LocationMapSeries`. The series grouping is intended to be used when having a [static group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}) because the `ShapeMapSeries` defines its own grouping over properties that are specific only to this series type such as [`ColorData`](/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorData) and [`ColorsCount`](/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorsCount).

Therefore, the `ShapeMapSeries` data points are created for each category group member and their coordinates are obtained through an external source depending on the series [`SourceType`](/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_SourceType) property. The values of the data points determine their presentation colors and are a result from grouping the values into these `ShapeMapSeries`-specific groups previously mentioned.

## Specifics

* When working with the Map series, it is often useful to have a way to determine the current data point coordinates and display them on a label or use them in a conditional formatting rule.

	The evaluation engine provides a way to do so by using the `"= Location"` special expression. The evaluation result is an instance of type [`Location`](/api/Telerik.Reporting.Location) and its `Longitude` and `Latitude` properties can be directly accessed. Also, when the selected component in the Report Designer is [`MapSeriesBase`](/api/Telerik.Reporting.MapSeriesBase), the __Edit Expression__ dialog will include the **Location**, **Location.Latitude**, and **Location.Longitude** entries in its **Fields** collection.

* When using the `ShapeMapSeries` that obtain their geospatial information from a ShapeFile, the processing engine will automatically generate the `"Location.Latitude"` and `"Location.Longitude"` virtual fields in the resulting composite data set. Both serve the same purpose to use the coordinates of the data point centroid in expressions.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Overview of the Graph Report Item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
* [(API) GeoLocationMapGroup](/api/Telerik.Reporting.GeoLocationMapGroup)
* [(API) ShapeMapSeries](/api/Telerik.Reporting.ShapeMapSeries)
* [(API) Location](/api/Telerik.Reporting.Location)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
