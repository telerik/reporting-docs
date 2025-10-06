---
title: SearchResultsInfo
page_title: SearchResultsInfo JSON Entity at a Glance
description: "Learn more about the SearchResultsInfo JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchresultsinfo
tags: searchresultsinfo
published: True
reporting_area: RESTService, RESTServiceCore
position: 11
previous_url: /telerik-reporting-rest-json-entities-searchresultsinfo,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchresultsinfo
---

<style>
	table {
		display: grid;
		grid-template-columns: min-content min-content 1fr;
	}

	thead, tbody, tr {
		display: contents;
	}

	th {
		white-space: nowrap;
	}
</style>

# SearchResultsInfo Overview

The info object that contains the search results returned from the engine.

````JSON
{
	"description": "Quarterly Sales Dashboard for 2003",
	"id": "a082030a03fa4e349abe183d161a35ea",
	"page": 1
}
````

>caption Fields

| Field | Type | Description |
| ------ | ------ | ------ |
|`description`|`String`|An excerpt from the evaluated text of the processing item.|
|`id`|`string`|GUID that determines the item in the rendered HTML.|
|`page`|`integer`|The number of the page where the processing item is located.|
