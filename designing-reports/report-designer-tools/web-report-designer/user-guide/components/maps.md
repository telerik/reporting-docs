---
title: Maps
page_title: Maps
description: Explore the available Maps report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components-maps
tags: web, report, design, report, components, map
published: True
position: 3
---
List
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# Maps 

The **Web Report Designer** offers a **Maps** section inside the **Components** tray allowing the end-user to visualize aggregated business data in a geographical manner.

<div style="display: flex; align-items: flex-start; gap: 24px;">
  <img alt="><" title="Components tray" src="images/wrd-components-tray-maps.png" style="max-width:240px; height:auto; border:1px solid lightgrey;" />
  <table style="width:100%; height:100%;"> 
    <tr>
      <th style="width:30%">Map Type</th><th>Description</th>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/maps#map">Map</a></td>
      <td>The data may be presented in different formats that is determined by the chosen Map Type: Point, Pie, Column. </td>
    </tr>
    <tr>
      <td><a href="https://testdocs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/user-guide/components/maps#choropleth">Choropleth</a></td>
      <td>The <a href="https://en.wikipedia.org/wiki/Choropleth_map">Choropleth map</a> type is a thematic map that uses graded color differences to display a measure over predefined regions or areas, and is one of the most popular ways to visualize how a measure varies across a geographic area.</td>
    </tr>
    
  </table>
</div>

## Prerequisites

The **Map Report item** requires one Data Source collection for loading the visual (e.g. geographical) map data and one separate Data Source for the data itself storing the values that correspond to the respective location. 

Before creating the Map Report item, it is necessary to obtain a valid **Location Provider** key (e.g. Azure key) to authenticate the requests, so the user has to fill it in in the **ClientToken** property. Alternaively, provide the geographical coordinates of your points yourself and set up the MapSeries accordingly.

## Location and Tile Providers

The **Location Provider** matches the addresses or locations with geographical coordinates. The Map Report item provides support for the following location providers:

|Location Provider|Description|
|----|----|
|Bing|The BingLocationProvider *(Deprecated)* uses the [Bing Maps Locations API](https://learn.microsoft.com/en-us/bingmaps/rest-services/locations/) to get location information about the requested address.|
|Azure| The AzureLocationProvider uses the [Azure Maps Get Geocoding Request](https://learn.microsoft.com/en-us/rest/api/maps/search/get-geocoding) to get location information about the requested address. This provider was introduced in Q2 2025 as part of the transition from Bing Maps to Azure Maps.|
|MapQuestOpenAPI|The MapQuestOpenAPILocationProvider uses the [MapQuest Geocoding Open API]() geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.|
|MapQuest|The MapQuestLocationProvider uses the [MapQuest Geocoding API](https://developer.mapquest.com/documentation/api/geocoding/) geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.|

>caution Microsoft has announced the deprecation of **Bing Maps for Enterprise**:
> * `Free (Basic)` accounts can use Bing Maps services until June 30, 2025.
> * `Enterprise` accounts can continue until June 30, 2028.
> The official Microsoft recommendation is for users to migrate to [Azure Maps](https://learn.microsoft.com/en-us/azure/azure-maps/) prior to these periods to avoid service distruptions.
> Telerik Reporting introduced support for Azure Maps through dedicated providers in Q2 2025 to address the deprecation of Bing Maps for Enterprise.

The **Tile Provider** requests and downloads the imagery data for the specified map extent. The Map Report item provides support for the following tile providers:

|TileProvider|Description|
|----|----|
|AzureMapsTileProvider|Supports a variety of tile sets that let you customize the appearance and data shown on your map.|
|BingMapsTileProvider|*(Deprecated)* Uses the [Bing Maps REST Services](https://learn.microsoft.com/en-us/bingmaps/rest-services/) to request metadata information that is needed to resolve the tile requests URLs, zoom levels, tile sizes and attribution information such as the text or logo that will be displayed on the map.|
|MapQuestTileProvider| *(Obsolete)* Uses the [`MapQuest`](https://www.mapquest.com/) tile servers that provides the tiles in the **OpenStreetMap Tiles** and the **MapQuest Open Aerial Tiles** imagery sets.|

## Map

The following tutorial aims to list all the necessary steps for creating a Map which will present the sales distribution by products among several states using the Adventure Works sample database. 

Since it uses the **AzureLocationProvider**, an Azure Maps subscription key is **required**. You can obtain a key by [creating an Azure Maps account through the Azure Portal](https://learn.microsoft.com/en-us/azure/azure-maps/quick-demo-map-app#create-an-azure-maps-account). For more information on how to access the key, refer to [Get the subscription key for your account](https://learn.microsoft.com/en-us/azure/azure-maps/quick-demo-map-app#get-the-subscription-key-for-your-account).

### Adding the Data Source 

Add a new [SQL Data Source]({%slug web-report-designer-user-guide-components-data-sources%}) item with a connection to the AdventureWorks database and Paste the following query in the Select Statement box:

```SQL: 
SELECT
PS.Name AS ProductSubCategory,
SP.Name + ', ' + CR.Name AS State,
SOD.LineTotal as LineTotal
FROM

Production.Product AS P
INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID
INNER JOIN Sales.SalesOrderDetail AS SOD ON P.ProductID = SOD.ProductID
INNER JOIN Sales.SalesOrderHeader AS SOH ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Person.Address AS ADDR ON ADDR.AddressID = SOH.ShipToAddressID
INNER JOIN Person.StateProvince AS SP ON SP.StateProvinceID = ADDR.StateProvinceID
INNER JOIN Person.CountryRegion AS CR ON CR.CountryRegionCode = SP.CountryRegionCode

WHERE
CR.Name IN ('Australia')
AND DATEPART(YEAR, SOH.OrderDate) IN (2003, 2004)
AND PC.Name = 'Bikes'
```

![Setup Mat DataSource ><](images/wrd-components-tray-maps-map-data-source.png)

### Building the Map Charts 

1\. Select the Details section of the report and from the **Components area** add a **Map report item**. Set the SqlDataSource you have already created the **DataSource** property. 

2\. Setup GeoLocationMapGroup for the **State** field:

![Adding a GeoLocationMapGroup ><](images/wrd-components-tray-maps-geolocationmapgroup.png)

3\. Setup the Series Group using the **ProductSubCategory** field:

![Adding a Series Map group ><](images/wrd-components-tray-maps-series-map-group.png) 

4\. Setup the Series Type - Under the Presentation section add a new PieMapSeries, specify the LegendItem's Value, series' Size and all other properties that the dialog offers:

![Adding a PieGraphMapSeries ><](images/wrd-components-tray-maps-piegraph-mapseries.png)  

### Defining the Location and Tile Providers 

Select the location provider (e.g. Azure) that will be used to geocode the **State** field. Once you obtain the key, paste it in the **ClientToken** box:

![Defining the Location and Tile Providers  ><](images/wrd-components-tray-maps-location-tile-providers.png)  

A detailed video is available covering the complete process:

<iframe width="560" height="315" src="https://www.youtube.com/embed/VGeM_g7Ieqg?si=6mGUiz4yEIV3Opnu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Choropleth

A choropleth map is a thematic map where areas are shaded or colored in proportion to a statistical variable (like population density, income levels, or voting results). This is a specific map item coloring the respective area according to the value it stores.

The choropleth below shows the 100 most populated countries: 

>caption World population density

![Choropleth map ><](images/wrd-components-tray-choropleth-map.png)  

The video demonstrates how to create and set up a Choropleth map that will show the world population for each country and coloring its area depending on the population density value.

The essential steps in the setup are:

**Setting up Data Binding**:

* Bind your map to a data source containing values for each region - e.g. [CSV Data Source]({%slug web-report-designer-user-guide-components-data-sources%}). Use the sample [CSV data population](https://github.com/telerik/reporting-docs/raw/master/knowledge-base/resources/PopulationDensity.zip) file, save it locally, and extract its content to a folder.

* Configure a color scale based on your data values 

**Configuring the Map**:

* Presentation >> Series >> You will use a CSV Data Source for the analytical data and an [ESRI Shapefile](https://en.wikipedia.org/wiki/Shapefile) for the spatial data: use a Shapefile bundle which consists of the **world.shp** and **world.dbf** files. The files are located in the `\Resources` subfolder of the directory where the `PopulationDensity.zip` file is extracted.

![Choropleth map step 1 ><](images/wrd-components-tray-choropleth-map-step-1.png)  


![Choropleth map step 3 ><](images/wrd-components-tray-choropleth-map-step-3.png)  

//TODO 

Source Type [bug](https://github.com/telerik/reporting/issues/5129)



## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) 
* [Map Overview]({%slug map_report_item_overview%})
* [DataSources]({%slug web-report-designer-user-guide-components-data-sources%})


