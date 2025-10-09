---
title: BookmarkNode
page_title: BookmarkNode JSON Entity at a Glance
description: "Learn more about the BookmarkNode JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/bookmarknode
tags: bookmarknode
published: True
reporting_area: RESTService, RESTServiceCore
position: 1
previous_url: /telerik-reporting-rest-json-entities-bookmarknode,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/bookmarknode
---

<style>
    table th:nth-of-type(2) {
		width: 10%;
	}

    table th:nth-of-type(3) {
		width: 10%;
	}

    table th:nth-of-type(4) {
		width: 60%;
	}
</style>

# BookmarkNode Overview

Bookmark node representing a node in a document map.

````JSON
{
	"id": "Bikes",
	"text": "Bikes",
	"page": 3,
	"items": [{ "id": "Bikes", "text": "Bikes", "page": 3 }]
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`id`|`String`|`true`|ID of the node|
|`text`|`String`|`false`|The text to be displayed|
|`page`|`Number`|`true`|An integer representing the number of the target page|
|`items`|`Array`|`false`|An array of String elements representing the IDs of the child bookmark nodes in the document map|
