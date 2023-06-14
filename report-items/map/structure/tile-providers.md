---
title: Tile Providers
page_title: Tile Providers of the Map Report Item
description: "Learn  what tile providers are supported by the Telerik Reporting Map report item and how to use them."
slug: telerikreporting/designing-reports/report-structure/map/structure/tile-providers
tags: telerik, reporting, map, report, item, tile, providers
previous_url: /MapTileProviders
published: True
---

# Tile Providers in the Map

The [`TileProvider`](/api/Telerik.Reporting.TileProvider) class requests and downloads the imagery data for the specified map extent. The imagery data is downloaded on a small images (tiles) that form a background image, which can be used for a better appearance of your map charts.

The tile provider requires you to configure a valid set of URLs to request the tiles, defined directly or through a URL template.

The [Map](/api/Telerik.Reporting.Map) supports the [`BingMapsTileProvider`](/api/Telerik.Reporting.BingMapsTileProvider) and [`GenericTileProvider`](/api/Telerik.Reporting.GenericTileProvider) types of tile providers.

## Bing Maps Tile Provider

The [`BingMapsTileProvider`](/api/Telerik.Reporting.BingMapsTileProvider) uses the [Bing Maps REST Services](https://learn.microsoft.com/en-us/bingmaps/rest-services/) to request metadata information that is needed to resolve the tile requests URLs, zoom levels, tile sizes and attribution information such as the text or logo that will be displayed on the map. The user doesn't need to provide any server URL, subdomains, or another tiles-related information because it is retrieved automatically from the imagery metadata according to the desired imagery set.

The `BingMapsTileProvider` provides the **Aerial**, **Road**, and **Aerial with Labels** (an Aerial imagery with a road overlay) types of imagery sets that are mapped to the predefined values of the [`ImagerySet`](/api/Telerik.Reporting.ImagerySet) property (`Aerial`, `Road`, `Hybrid`). Changing the imagery set causes the `BingTileProvider` to request images from a different tile set, thus changing the look of the map. The tile server requires a Bing Maps Key client token for authentication which you can obtain from the [Bing Maps website](https://www.microsoft.com/en-us/maps/create-a-bing-maps-key).

## Generic Tile Provider

The [`GenericTileProvider`](/api/Telerik.Reporting.GenericTileProvider) requires the user to manually provide a template to the server URL, the subdomain names if needed, the application user agent, the attribution text, and the URL.

* The `GenericTileProvider` is designed in compliance with the [Web Map Tile Service](https://en.wikipedia.org/wiki/Web_Map_Tile_Service) protocol that defines a standard way for requesting and receiving pre-rendered map tiles. The protocol works with the most common 256x256px tile size and uses popular mathematical algorithms to calculate and process the results.
* You can set up the `GenericTileProvider` to show tiles from other tile providers such as [OpenStreetMap](https://www.openstreetmap.org), [HERE Maps](https://www.here.com/), [Yandex Maps](https://yandex.com/maps/) as they comply with the the [WMTS](https://en.wikipedia.org/wiki/Web_Map_Tile_Service) protocol.
* The provider requires a [`UrlTemplate`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_UrlTemplate) and [`UrlSubdomains`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_UrlSubdomains) to construct the tile requests URL. If the combination of the `UrlTemplate` and `UrlSubdomains` result in an invalid URI or a tile cannot be retrieved from the tile server, the Map will display a substitute tile containing the exception message. The `UrlTemplate` includes the `{subdomain}`, `{zoom}`, `{x}`, and `{y}` tags, and acquires the `https://{subdomain}.tile.openstreetmap.org/{zoom}/{x}/{y}.png"` format.
* The format tags are case-insensitive and can be placed in any order. The mandatory ones are `{zoom}`, `{x}`, and `{y}`, because they uniquely define a tile position on a tile set. The `{subdomain}` tag marks the place where a subdomain from the [`UrlSubdomains`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_UrlSubdomains) collection will be placed.

	* `{subdomain}` is not mandatory, since the selected tile provider may not offer more than one subdomain.
	* The `{zoom}` tag will be replaced by the calculated zoom level (level of details) of the current tile set. The level of details depends on the map extent and on the map control size. When the processing engine calculates the appropriate zoom level, its value will replace the `{zoom}` tag.
	* The `{x}` and `{y}` tags are used as a placeholders for the tile position. Before starting to fetch the tiles for the requested map extent, the processing engine will calculate the zoom level and the coordinates of the tiles used to display the extent. When constructing the request, the `{x}` and `{y}` tags will be replaced by the calculated __X__ and __Y__ tile coordinates.

* The image extension (`.jpg` in the example above) is not mandatory and the provider defines whether to include it or not. [Some tile providers](https://maptile.maps.svc.ovi.com/maptiler/maptile/newest/normal.day/2/2/1/256/png8) do not require an image extension to be requested, while [others](http://otile2.mqcdn.com/tiles/1.0.0/map/2/2/1.gif) return the tiles in the same format, regardless of the requested extension.
* The [`UrlSubdomains`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_UrlSubdomains) property is a collection of strings, representing the subdomains that will be used to construct the tile URLs. For example, the [OpenStreetMap](https://www.openstreetmap.org/) subdomains are `a`, `b`, and `c`. When the processing engine calculates how many tiles will be needed for the requested map extent, it will distribute the web requests evenly among the subdomains for an additional performance gain.
* In some scenarios it's required to set a value of the `UserAgent` web request header, which is sent to the tile providing web services. In this case, the [`UserAgent`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_UserAgent) property must be populated with a constant string or an expression that will be evaluated during the report processing. The value of this property will be set as a value of the `UserAgent` web request header. Initially, the value of the `UserAgent` property will be set to a newly generated GUID, but it has to be replaced with a correct value according to the usage policy of the tile provider.
* The users also have to provide [`Attribution`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_Attribution) text and a [`LogoUrl`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_LogoUrl) that will be used to display an attribution information on the map. The [`Attribution`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_Attribution) property must be manually set according to the [usage policy](https://wiki.openstreetmap.org/wiki/Legal_FAQ) of the tile provider. This text will be displayed in the lower right corner of the map area. The [`LogoUrl`](/api/Telerik.Reporting.GenericTileProvider#Telerik_Reporting_GenericTileProvider_LogoUrl) property denotes the URL used to download the tile provider [logo](https://wiki.openstreetmap.org/w/images/thumb/7/79/Public-images-osm_logo.svg/32px-Public-images-osm_logo.svg.png), if required by the usage policy of the provider. If the URL points to a valid image, it will be displayed in the lower left corner of the map area.

## (Obsolete) Map Quest Tile Provider

The obsolete [`MapQuestTileProvider`](/api/Telerik.Reporting.MapQuestTileProvider) uses the [`MapQuest`](https://www.mapquest.com/) tile servers that provides the tiles in the **OpenStreetMap Tiles** and the **MapQuest Open Aerial Tiles** imagery sets.

The tile server does not require a Client Token for authentication. The [`MapQuestTileProvider`](/api/Telerik.Reporting.MapQuestTileProvider) is substituted by the [`GenericTileProvider`](/api/Telerik.Reporting.GenericTileProvider) to provide more control over the tile provider settings and to avoid the pre-setup provider configuration.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
