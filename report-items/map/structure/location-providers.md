---
title: Location Providers
page_title: Location Providers of the Map Report Item
description: "Learn what location providers are supported by the Telerik Reporting Map report item and how to use them."
slug: telerikreporting/designing-reports/report-structure/map/structure/location-providers
tags: telerik, reporting, map, report, item, location, providers
previous_url: /MapLocationProviders
published: True
---

# Location Providers in the Map

The Location Provider matches the addresses or locations with the geographical coordinates (latitude and longitude) and is used in conjunction with the `GeoLocation` groups which provide the geocoding request to retrieve the data point coordinates.

When you make a geocoding request, the response returns one or more location resources that contain location information ordered by relevance. The more detailed information is used in the request, the more accurate the results will be. For example, if you are looking for **Vienna, Austria**, you need to provide the country name as well, because otherwise the first returned result would be **Vienna, VA, United States**. That's why concatenating a city name with a state or a region name and a country name will result in a more accurate geocoding. The location providers require a valid key to authenticate the requests, so the user has to fill it in in the `ClientToken` property.

The map supports the following location providers:

* [`MapQuestOpenAPILocationProvider`](/api/Telerik.Reporting.MapQuestOpenAPILocationProvider)&mdash;Uses the [MapQuest Geocoding OpenAPI](http://developer.mapquest.com/web/products/open/geocoding-service) geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.

	The query arguments order is of a huge significance. In the example above, if you switch the query arguments to **Austria, Vienna**, the service will return no results.

* [`MapQuestLocationProvider`](/api/Telerik.Reporting.MapQuestLocationProvider)&mdash;Uses the [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/) geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.

	The query arguments order is of a huge significance. In the example above, if you switch the query arguments to **Austria, Vienna**, the service will return **Vienna, Dooly County, GA, USA**.

* [`BingLocationProvider`](/api/Telerik.Reporting.BingLocationProvider)&mdash;Uses the [Bing™ Maps Locations API](https://learn.microsoft.com/en-us/bingmaps/rest-services/locations/) to get location information about the requested address.

* [`AzureLocationProvider`](/api/Telerik.Reporting.AzureLocationProvider)&mdash;Uses the [Azure Maps Search Request](https://learn.microsoft.com/en-us/rest/api/maps/search/get-geocoding) to get location information about the requested address. This provider was introduced in Q2 2025 as part of the transition from Bing Maps to Azure Maps.

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
