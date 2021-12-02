---
title: Connecting to Data
page_title: Connecting to Data | for Telerik Reporting Documentation
description: Connecting to Data
slug: telerikreporting/designing-reports/report-structure/map/connecting-to-data
tags: connecting,to,data
published: True
position: 1
---

# Connecting to Data



The Map item is a data item that have lots of common with the [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) item.         Similar to the Graph item, it allows the developers to present aggregated data by two hierarchical dimensions/groups.         One of the dimensions - the __GeoLocationGroup__  defines the geographical component of your data. The second one -         the __SeriesGroups__  hierarchy allows you to group your data in a hierarchical way and display one or more measures         over the defined geographical reference. Like the other data items the Map item connects to a single data source and provides         additional options for sorting and filtering the input data, binding, conditional formatting, etc.       

As with the Graph item, it is important to carefully prepare and understand your data before you create your Map item, as this will help you design your report quickly and         efficiently.       

## GeoLocationGroup hierarchy

The GeoLocationGroup hierarchy defines the data points location in the Map series and acts the same way as the Graph's Category Group hierarchy.           In case the report uses a Location provider to obtain the data point geographical coordinates from a web service, the            [GeoLocationMapGroup](/reporting/api/Telerik.Reporting.GeoLocationMapGroup) 's           grouping expression is used as a request parameter when calling the geocoding service. To achieve better geocoding results, the grouping           expression should provide as more detailed request as possible, for example, concatenating a city name with a state/region name and a country name.         

## ShapeMapGroup hierarchy

The ShapeMapGroup hierarchy is used only in  [ShapeMapSeries](/reporting/api/Telerik.Reporting.ShapeMapSeries) , which provide their           own spatial data source, depending on the selected  [SourceType](/reporting/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_SourceType)  property.           The geographical coordinates of the data points do not depend on this hierarchy, that's why it does not provide any geolocation properties.         

## Series group hierarchy

The SeriesGroups hierarchy defines the series at runtime. For example, suppose you have a group by the Country field in the SeriesGroups           hierarchy. The number of different countries will determine how many series will appear on the Map.         

## LocationMapSeries Data

The Map item series displays aggregated data to visualize one or more measures. At runtime the intersection between the series group hierarchy           members and the category group hierarchy members defines the data points in the series.           Each data point's coordinates are obtained either directly from the data set (through the __Latitude__  and __Longitude__            properties, or using the __Location__  property of the series' GeoLocationGroup, as explained above.           The value of the data point is a measure for its size and is calculated by an expression, defined for its __Size__  property.         

## ShapeMapSeries Data

The ShapeMapSeries, used in the Choropleth map, does not use the series group hierarchy the way it is used in the LocationMapSeries.           The series grouping is not intended to be used in other way than having a           [static group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}), since the ShapeMapSeries defines           its own grouping using properties, specific only to this series type ( [ColorData](/reporting/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorData)  and            [ColorsCount](/reporting/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_ColorsCount) ).           Therefore the ShapeMapSeries data points are created for each category group member and their coordinates are obtained via external source, depending on           the series'  [SourceType](/reporting/api/Telerik.Reporting.ShapeMapSeries#Telerik_Reporting_ShapeMapSeries_SourceType)  property. The values of the data points           determine their presentation colors and are a result of grouping the values into these ShapeMapSeries-specific groups, mentioned above.         

## Additional information

When working with map series,           it is often useful to have a way to determine the current data point coordinates and display them on a label or use them in conditional formatting rule.           The evaluation engine provides a way to do so using the special expression `"= Location"`.           The evaluation result is an instance of type  [Location](/reporting/api/Telerik.Reporting.Location)            and its `Longitude` and `Latitude` properties can be accessed directly.           Also, when the selected component in the report designer is  [MapSeriesBase](/reporting/api/Telerik.Reporting.MapSeriesBase) ,           the __Edit Expression dialog__  will include three *Location*            entries in its *Fields*  collection: *Location* ,           *Location.Latitude*  and *Location.Longitude* .         

>important When using  __ShapeMapSeries__  that obtain their geospatial information from a  __ShapeFile__ ,             the processing engine will automatically generate two virtual fields in the resulting composite data set:             `"Location.Latitude"` and `"Location.Longitude"` that serve the same purpose - to use the             coordinates of the data point centroid in expressions.           


# See Also


 * [Map Overview]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})

 * [Map Structure]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
