---
title: Location Providers
page_title: Location Providers | for Telerik Reporting Documentation
description: Location Providers
slug: telerikreporting/designing-reports/report-structure/map/structure/location-providers
tags: location,providers
published: True
position: 2
---

# Location Providers



## Location Providers

The __Location Provider__  matches the addresses or locations with geographical coordinates (latitude and longitude).           It is used in conjunction with the GeoLocation groups which is used to provide the geocoding request in order to retrieve the data point coordinates.           When you make a geocoding request, the response returns one or more location resources that contain location information ordered by relevance.           The more detailed information is used in the request, the more accurate the results will be.         

For example, if you are looking for *Vienna, Austria* , you need to provide the country name as well, because otherwise the first returned result would be *Vienna, VA, United States* .           That's why concatenating a city name with a state/region name and a country name will result in a more accurate geocoding.           The location providers requires a valid key to authenticate the requests, so the user should fill it in in the __ClientToken__  property.         

Supported location providers are:         

*  [MapQuestOpenAPILocationProvider](/reporting/api/Telerik.Reporting.MapQuestOpenAPILocationProvider)  - uses the                [MapQuest Geocoding OpenAPI](http://developer.mapquest.com/web/products/open/geocoding-service)  geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.               Please note that the query arguments order is of a huge significance.               In the example above if you switch the query arguments to "Austria, Vienna", the service will return no results.             

*  [MapQuestLocationProvider](/reporting/api/Telerik.Reporting.MapQuestLocationProvider)  - uses the                [MapQuest Geocoding API](http://developer.mapquest.com/web/products/dev-services/geocoding-ws)  geocoding service to provide a single-line address and receive potential geographical coordinates of the geocoded location.               Please note that the query arguments order is of a huge significance.               In the example above if you switch the query arguments to "Austria, Vienna", the service will return "Vienna, Dooly County, GA, USA".             

*  [BingLocationProvider](/reporting/api/Telerik.Reporting.BingLocationProvider)  - uses the                [Bing™ Maps Locations API](http://msdn.microsoft.com/en-us/library/ff701715.aspx)  to get location information about the requested address.             

# See Also


 * [Map Overview]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})

 * [Map Structure]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
