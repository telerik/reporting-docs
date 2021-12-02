---
title: How to Setup a Map Manually
page_title: How to Setup a Map Manually | for Telerik Reporting Documentation
description: How to Setup a Map Manually
slug: telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-map-manually
tags: how,to,setup,a,map,manually
published: True
position: 2
---

# How to Setup a Map Manually



The current article elaborates on how to setup a Map without using the __Map Wizard__ . The described approach is         applicable when using the __Visual Studio Report Designer__ 

## 

1. Open the Visual Studio toolbox and select the Map item from the *Telerik Reporting*  tab.                 

1. Click on the design surface where you want the upper-left corner of the map.                     The map item is initialized on the selected design surface with default values for                    [IProjection](/reporting/api/Telerik.Reporting.IProjection)                    and  [ITileProvider](/reporting/api/Telerik.Reporting.ITileProvider) .                 

1. Set your Data Source to one of the available [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).                 

1. Create a SeriesGroup and set the appropriate measure property (i.e. __Size__  for the __PointMapSeries__ )                   to an expression that will evaluate to a scalar value.                 

1. Setup the geographical coordinates of your data points.

+ 

In case you would like to use a geocoding service to obtain geographical coordinates by addresses from your data source,                       you need to configure the [Location Providers]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}) and the                        [GeoLocationMapGroup](/reporting/api/Telerik.Reporting.GeoLocationMapGroup) :                     

* Open the Property Grid.

* Create a GeoLocationGroup that will provide request information to a [Location Provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}).                           

* Select a [Location Provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}) that will be used to geocode the geographical coordinates by the requests supplied from the GeoLocationGroup.                           

In case your data source can provide geographical coordinates to be used for the data points,                       you need to set the Series'  [Latitude](/reporting/api/Telerik.Reporting.PointMapSeries#Telerik_Reporting_PointMapSeries_Latitude)  and                        [Longitude](/reporting/api/Telerik.Reporting.PointMapSeries#Telerik_Reporting_PointMapSeries_Longitude)  to the appropriate data source fields.                      

# See Also


 * [How to Add Map to Report]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-add-map-to-report%})

 * [How to Setup a Map Using the Map Wizard]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-map-using-the-map-wizard%})

 * [Map Overview]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})

 * [Map Structure]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
