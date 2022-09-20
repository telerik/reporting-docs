---
title: Set Up a Map Manually
page_title: Manually Configure a Map Report Item  
description: "Learn how to manually configure a Map report item when using Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-map-manually
tags: telerik, reporting, map, report, item, configure, manually
previous_url: /MapHowToSetupAMapManually, /report-items/map/how-to/how-to-setup-a-map-manually
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>All</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
			<td>Map Report Item</td>
		</tr>
	</tbody>
</table>

## Description

How can I manually set up a Map report item without using the __Map Wizard__?

## Solution

The suggested implementation is applicable when using the Telerik Visual Studio Report Designer tool.

1. Open the Visual Studio toolbox. From the **Telerik Reporting** tab, select the Map report item.
1. Click the design surface where you want to locate the upper-left corner of the Map. The Map report item is initialized on the selected design surface with default values for its [`IProjection`](/reporting/api/Telerik.Reporting.IProjection) and  [`ITileProvider`](/reporting/api/Telerik.Reporting.ITileProvider). 
1. Set your data source to one of the available [data source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}). 
1. Create a `SeriesGroup` and set the appropriate measure property, that is, __Size__ for the __PointMapSeries__, to an expression that will evaluate to a scalar value. 
1. Set up the geographical coordinates of your data points.

	If you want to use a geocoding service to obtain geographical coordinates by addresses from your data source, configure the [location providers]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}) and the [`GeoLocationMapGroup`](/reporting/api/Telerik.Reporting.GeoLocationMapGroup): 

	1. Open the `Property` Grid.

	1. Create a `GeoLocationGroup` that will provide request information to a [location provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}). 

	1. Select a [location provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%}) that will be used to geocode the geographical coordinates by the requests supplied from the `GeoLocationGroup`. 

	If your data source can provide geographical coordinates for the data points, set the Series [`Latitude`](/reporting/api/Telerik.Reporting.PointMapSeries#Telerik_Reporting_PointMapSeries_Latitude) and [`Longitude`](/reporting/api/Telerik.Reporting.PointMapSeries#Telerik_Reporting_PointMapSeries_Longitude) to the appropriate data source fields. 
