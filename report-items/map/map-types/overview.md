---
title: Types
page_title: Map Report Item Types
description: "Learn more about the Map types supported by the Map report item when working with Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/map/map-types
tags: telerik, reporting, map, report, item, types
previous_url: /MapChartTypes, /report-items/map/map-types
published: True
position: 0
---

# Map Types Overview

To present the Map data in the most user-friendly way, the Map report item supports a number of map types, which have unique characteristics to help you visualize your dataset.

The Map supports the following map types:

* [Point map type](#point)
* [Pie map type](#pie)
* [Column map type](#column)
* [Choropleth map type](#choropleth)

## Point

Similar to the [Scatter chart type]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}) of the Graph, the Point map type is used to display a correlations between two sets of values. The main difference is that the set of the first values is defined by geographical coordinates which will position every data point onto the Map. The set of he second values is used as a measure and displays a bubble of a variable size depending on the measured value, that is, the differences between the data points are based on the size of the point. The larger the point is, the greater the difference between the two data points becomes.

![An image of a Map Point Chart](../images/Map/MapPointChart.png)

## Pie

Similar to the [Pie chart type]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}) of the Graph, a Pie map type is a chart for displaying grouped data on every data point. As with the Point map type, the data point coordinates are defined by the `GeoLocation` group. The analytical data for creating the Pie chart is obtained through the child groups of the `GeoLocation` group. For more information about the setup, refer to the article on [setting the Map with the Map Wizard]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-map-using-the-map-wizard%}).

![An image of a Map Pie Chart](../images/Map/MapPieChart.png)

## Column 

Identical to the Pie chart type of the Graph, the Column map type presents analytical data by using the [Column chart type]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}). For an advanced example on creating a Column map type, refer to the article about [creating a Map with a BarChart series with a CSV data source]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-create-a-map-with-barchart-series-using-csv-data-source%}).

![An image of a Map Column Chart](../images/Map/MapColumnChart.png)

## Choropleth

The [Choropleth map type](https://en.wikipedia.org/wiki/Choropleth_map) is a thematic map that uses graded color differences to display a measure over predefined regions or areas, and is one of the most popular ways to visualize how a measure varies across a geographic area.

The Choropleth item is basically a [Map item]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%}) with a special kind of series and groups. To create a Choropleth map, you don't have to configure a [location provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}) or use a [`GeoLocationMapGroup`](/api/Telerik.Reporting.GeoLocationMapGroup) to obtain the coordinates of the data points. Instead, the Choropleth uses a [`ShapeMapSeries`](/api/Telerik.Reporting.ShapeMapSeries) instance whose major distinction from the other Map series is that they define the source which will be used to provide the spatial data. This source can be either a string, formatted in compliance with the [Well-known text or Well-known binary](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry) standards, or an [ESRI Shapefile](https://en.wikipedia.org/wiki/Shapefile).

To improve the appearance, the Map item can define a [tile provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/tile-providers%}) which will draw an image of the requested Map extent as a background layer onto the plot area.

To create a Choropleth map type, refer to the article about [setting up a Choropleth by using the Map Wizard]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-choropleth-using-the-map-wizard%}).

![An image of a Choropleth Chart Type](../images/Map/Choropleth/Choropleth_ChartType.png)

## Customizing Map Types

The Map also provides specific approaches to build on top of its available options by allowing you to add [`ShapeMapSeries` instances](#shape-map-series) and [`LocationMapSeries` instances](#location-map-series) to the report item as well as to use the [BarChart Series](#barchart-and-csv-data-source-maps) in the map.

### Shape Map Series

The [`ShapeMapSeries`](/api/Telerik.Reporting.ShapeMapSeries) uses its own source to obtain a set of coordinates which will determine the shape of the data points. These series do not use a `LocationProvider` or a `GeoLocationMapGroup`, because the data points are not determined by a single location on the map surface, as with the [`LocationMapSeries`](/api/Telerik.Reporting.LocationMapSeries).

To create a Shape Map Series map type, refer to the article about [adding a `ShapeMapSeries` instance to the Map report item]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-shapemapseries-to-the-map-item%}).

### Location Map Series

The [`LocationMapSeries`](/api/Telerik.Reporting.LocationMapSeries) are used when the data points have a single coordinate pair, obtained directly from the data set or by using a [location provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}).

To create a Location Map Series map type, refer to the article about [adding a `LocationMapSeries` instance to the Map report item]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-locationmapseries-to-the-map-item%}).

### Map with a BarChart Series

To create a Map with BarChart Series and CSV data source, refer to the article about [creating a Map report item with BarChart series]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-create-a-map-with-barchart-series-using-csv-data-source%}).

## See Also

* [(Demo) Population Density Report with a Choropleth Map](https://demos.telerik.com/reporting/population-density)
* [(Demo) Crypto Currency Info Report with Choropleth and Point Series](https://demos.telerik.com/reporting/crypto-currency-info)
* [Overview of the Map Report Item]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
* [Structure and Elements of the Map]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
