---
title: DocumentInfo
page_title: DocumentInfo JSON Entity at a Glance
description: "Learn more about the DocumentInfo JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo
tags: documentinfo
published: True
reporting_area: RESTService, RESTServiceCore
position: 2
previous_url: /telerik-reporting-rest-json-entities-documentinfo,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo
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

# DocumentInfo Overview

Document info indicating the status of the document resource.

````JSON
{
	"documentReady": true,
	"pageCount": 10,
	"documentMapAvailable": false,
	"BookmarkNodes": [
		{
			"id": "Bikes",
			"text": "Bikes",
			"page": 3,
			"items": [
				{
				"id": "Bikes",
				"text": "Bikes",
				"page": 3,
				}
			]
		},
		{
			"id": "Bikes",
			"text": "Bikes",
			"page": 3,
		},
	],
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`documentReady`|`Boolean`|`true`|Indicates whether the document processing is done|
|`pageCount`|`Number`|`true`|An integer representing the count of the physical pages that are currently available|
|`documentMapAvailable`|`Boolean`|`false`|Indicates whether document map is available to be displayed|
|`bookmarkNodes`|`Array`|`false`|An array of [BookmarkNode]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/bookmarknode%}) objects supporting the document map and the NavigateToBookmark interactive action|
