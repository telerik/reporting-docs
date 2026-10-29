---
title: Maps
page_title: Maps
description: Explore the available Maps report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components-maps
tags: web, report, design, components, map
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
components: [wrdhtml5, wrdblazorwrapper, general]
position: 4
---

<style>
img[src$="wrd-components-tray-maps-design-mode.png"],
img[src$="wrd-components-tray-maps-map-data-source.png"],
img[src$="wrd-components-tray-maps-geolocationmapgroup.png"],
img[src$="wrd-components-tray-maps-series-map-group.png"],
img[src$="wrd-components-tray-maps-piegraph-mapseries.png"],
img[src$="wrd-components-tray-maps-location-tile-providers.png"],
img[src$="wrd-components-tray-choropleth-map.png"] {
  border: 1px solid lightgrey;
}

/* table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
} */
</style>

# Maps

The Maps in the Web Report Designer are report items that enable you to visualize aggregated business data in a geographical manner. Maps transform raw data into intuitive visual representations overlaid on geographical regions, which lets you identify patterns, trends, and regional insights.

The Maps are suitable for a variety of use cases:

* Regional sales analysis&mdash;Visualize sales performance across different states, countries, or territories.
* Demographic data visualization&mdash;Display population density, income levels, or survey results by geographic area.
* Location-based reporting&mdash;Show data points related to specific addresses, cities, or coordinates.
* Performance comparison&mdash;Compare metrics across geographical regions using different chart types.
* Distribution analysis&mdash;Understand how products, services, or resources are distributed geographically.

![Map and Choropleth report items in the Components tab.](images/wrd-components-tray-maps-design-mode.png)

## Map Types

The Web Report Designer provides two main types of map components:

* [Map](slug:web-report-designer-user-guide-components-maps#creating-a-report-with-the-map-component)&mdash;Displays data in various formats determined by the chosen Map Type: Point, Pie, or Column charts positioned on geographical locations.
* [Choropleth](slug:web-report-designer-user-guide-components-maps#choropleth)&mdash;A [thematic map](https://en.wikipedia.org/wiki/Choropleth_map) that uses graded color differences to display a measure over predefined regions or areas, making it one of the most popular ways to visualize how a measure varies across a geographic area.

>important Currently, the Web Report Designer allows only **displaying an already created** report (for example, using the Standalone Report Designer) that contains a Choropleth report item and simple fine-tuning. It is not possible to build a Choropleth from scratch in the Web Report Designer.

## Required Data Sources

Because of its architecture, the Map component requires two types of data sources. When adding a Map component to your report, both data sources must be available:

* Visual map data&mdash;Geographical information provided by **Location** and **Tile** providers that render the actual map imagery.
* Business data&mdash;Your analytical data stored in a separate data source, with values that correspond to specific locations (displayed as charts on the map).

## Prerequisites

Before adding a Map report item:

* Obtain a valid **Location Provider** key (for example, Azure key) to authenticate the requests to the location and tile provider. You must enter this key in the **ClientToken** property.
* Alternatively, if using a location and tile provider is not an option, provide the geographical coordinates of your points manually, and set up the MapSeries accordingly.

### Location and Tile Providers

The **Location Provider** matches the addresses or locations with geographical coordinates. The Map Report item provides support for the following location providers:

|Location Provider|Description|
|----|----|
|Azure| The AzureLocationProvider uses the [Azure Maps Get Geocoding Request](https://learn.microsoft.com/en-us/rest/api/maps/search/get-geocoding) to get location information about the requested address. This provider was introduced in Q2 2025 as part of the transition from Bing Maps to Azure Maps.|
|Bing (Deprecated)|The BingLocationProvider uses the [Bing Maps Locations API](https://learn.microsoft.com/en-us/bingmaps/rest-services/locations/) to get location information about the requested address.|
|MapQuestOpenAPI (Obsolete)|The MapQuestOpenAPILocationProvider uses the MapQuest Geocoding Open API geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.|
|MapQuest |The MapQuestLocationProvider uses the [MapQuest Geocoding API](https://developer.mapquest.com/documentation/api/geocoding/) geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.|

>caution Microsoft has announced the deprecation of Bing Maps for Enterprise:
> * `Free (Basic)` accounts can use Bing Maps services until June 30, 2025.
> * `Enterprise` accounts can continue until June 30, 2028.
>
> The official Microsoft recommendation is for users to migrate to [Azure Maps](https://learn.microsoft.com/en-us/azure/azure-maps/) prior to these periods to avoid service disruptions.
> Telerik Reporting introduced support for Azure Maps through dedicated providers in Q2 2025 to address the deprecation of Bing Maps for Enterprise.

The **Tile Provider** requests and downloads the imagery data for the specified map extent. The Map Report item supports the following tile providers:

|TileProvider|Description|
|----|----|
|AzureMapsTileProvider|Supports a variety of tile sets that let you customize the appearance and data shown on your map.|
|BingMapsTileProvider (Deprecated)|Uses the [Bing Maps REST Services](https://learn.microsoft.com/en-us/bingmaps/rest-services/) to request metadata information that is needed to resolve the tile requests URLs, zoom levels, tile sizes and attribution information such as the text or logo that will be displayed on the map.|
|MapQuestTileProvider (Obsolete)|Uses the [`MapQuest`](https://www.mapquest.com/) tile servers that provides the tiles in the **OpenStreetMap Tiles** and the **MapQuest Open Aerial Tiles** imagery sets.|

## Creating a Report with the Map Component

The following tutorial demonstrates how to create a Map that presents sales distribution by products across several states.

>note To follow along with the steps below, you need access to an instance of the [Adventure Works](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/adventure-works) database for [Microsoft SQL Server](https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server?view=sql-server-ver17).

<iframe width="560" height="315" src="https://www.youtube.com/embed/o4LzrlBu1TU?si=I59bkzgld_iTCpDT&rel=0" title="Adding a Map Item in the Telerik Web Report Designer" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Since this tutorial uses the **AzureLocationProvider**, an Azure Maps subscription key is required. You can obtain a key by [creating an Azure Maps account through the Azure Portal](https://learn.microsoft.com/en-us/azure/azure-maps/quick-demo-map-app#create-an-azure-maps-account). For more information on how to access the key, refer to [Get the subscription key for your account](https://learn.microsoft.com/en-us/azure/azure-maps/quick-demo-map-app#get-the-subscription-key-for-your-account).

### Step 1: Adding the Data Source

Add a new [SQL Data Source](slug:web-report-designer-user-guide-components-data-sources) item with a connection to the AdventureWorks database. This data will be used to create the Pie Charts that are positioned on the map. Paste the following query in the `SELECT` statement box:

{{source=CodeSnippets\CS\SQL\SelectProductSalesByState.sql}}

The query returns `ProductSubCategory`, `State`, and `LineTotal`. The preview includes Road Bikes sales in Queensland, Australia (`LineTotal` of `2443.35`), and New South Wales, Australia (`LineTotal` of `1000.4375`). These are individual records; the map series will aggregate their values.

![SQL Data Source wizard with the sales query and a preview of product subcategories, states, and line totals.](images/wrd-components-tray-maps-map-data-source.png)

### Step 2: Building the Map Charts

1. Select the **Detail** section of the report and from the **Components** tab add a **Map** component. Set the SQL data source you have already created as the **Data source** property. This data source provides the data required to build the Charts.

1. Set up GeoLocationMapGroup. The Geolocation grouping you create defines the Chart locations&mdash;where the Charts appear on the Map. Using the `State` field in the data source will place the Chart on the corresponding federal state on the map. 

    1. Create a new GeoLocationMapGroup.

    1. Add a new Grouping item. This lets you specify which data source field to use for generating the Chart's categories.

    1. Set the Expression to the `State` field.

    ![GeoLocationMapGroup configuration for grouping chart locations by State.](images/wrd-components-tray-maps-geolocationmapgroup.png)

1. Set up the Series Group using the `ProductSubCategory` field:

    1. Create a new SeriesGroup.

    1. Add a new **ChildGroup** item. You use the **ChildGroup** type, as you define how to **subdivide** the data within each Pie Chart on the map.

    1. Add a new Grouping. In the **Groupings**, you specify the data source field for generating the Chart's series (the slices in the Pie).

    1. Set the Expression to the `ProductSubCategory` field.

    ![Series group configuration for dividing each pie chart by ProductSubCategory.](images/wrd-components-tray-maps-series-map-group.png)

   Now that you've defined the data for the Pie Chart, you can continue by configuring the presentation of the data in the next step.

1. Set up the **Series** type under the **PRESENTATION** section. The **Series** item will generate the pie slices.

    1. Add a new **PieMapSeries**.

    1. Set **LegendItem** > **Value** to `= Fields.ProductSubCategory` to label the product subcategories in the legend.

    1. Set **Size** to `= Sum(Fields.LineTotal)` to aggregate sales for each product subcategory at each location. You can also configure the other presentation properties in the dialog.

    ![Pie map series properties with product subcategory legend labels and size based on the sum of line totals.](images/wrd-components-tray-maps-piegraph-mapseries.png)

    The resulting map places a pie chart at each state location. Each slice represents a product subcategory's aggregated sales for that location.

### Step 3: Defining the Location and Tile Providers

1. Select the **Location provider** (for example, Azure) that will be used to geocode the `State` field. The location provider will allow the report to place the Pie Chart on the correct geographical location.

1. Add your **ClientToken** by pasting it in the **ClientToken** box. This token authenticates your requests to Azure.

1. Repeat the previous two steps for the **Tile provider**.

![Map properties for configuring the location and tile providers and their authentication tokens.](images/wrd-components-tray-maps-location-tile-providers.png)

## Choropleth

A **Choropleth** map is a thematic map where areas are shaded or colored in proportion to a statistical variable (like population density, income levels, or voting results). This specialized map component colors geographical areas according to the data values they represent.

The Choropleth below shows population density for the 100 most populated countries. The legend measures people per square kilometer, not total population. Its ranges are 3–15, 15–32, 32–51, 51–75, 75–93, 93–121, 121–198, and 198–1,091 people per square kilometer. Countries in higher ranges have more people per unit of land area; the shading does not indicate which country has the largest total population.

![World choropleth grouping countries into eight population-density ranges.](images/wrd-components-tray-choropleth-map.png)

<!-- If you need to create a report with a Choropleth, download the [`PopulationData.zip`](https://github.com/telerik/reporting-docs/raw/master/knowledge-base/resources/PopulationDensity.zip) file, save it locally, and extract its contents in a folder. You can use it as a starting point for your own report.  -->

<!-- The essential steps for setting up a Choropleth:

1. Set up the data binding:

   * Bind your map to a data source containing values for each region, for example, [CSV Data Source](slug:web-report-designer-user-guide-components-data-sources). Use the sample [PopulationData.csv](https://github.com/telerik/reporting-docs/raw/master/knowledge-base/resources/PopulationDensity.zip) file, save it locally, and extract its content to a folder.

   * Configure a color scale based on your data values.

1. Configure the Map:

   * Go to **PRESENTATION** > **Series** and use a CSV Data Source for the analytical data and an [ESRI Shapefile](https://en.wikipedia.org/wiki/Shapefile) for the spatial data. Use a Shapefile bundle which consists of the `world.shp` and `world.dbf` files. The files are located in the `\Resources` subfolder of the directory where the `PopulationDensity.zip` file is extracted.

![Choropleth map step 1 ><](images/wrd-components-tray-choropleth-map-step-1.png)

![Choropleth map step 3 ><](images/wrd-components-tray-choropleth-map-step-3.png) -->


## See Also

* [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview)
* [Map Overview](slug:map_report_item_overview)
* [Data Sources](slug:web-report-designer-user-guide-components-data-sources)
* [Adding Choropleth Maps to the Report](slug:telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-choropleth-using-the-map-wizard)
* [Population Density Demo Report with Choropleth](https://demos.telerik.com/reporting/population-density)
