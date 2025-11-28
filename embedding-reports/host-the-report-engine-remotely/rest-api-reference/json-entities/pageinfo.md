---
title: PageInfo
page_title: PageInfo JSON Entity at a Glance
description: "Learn more about the PageInfo JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/pageinfo
tags: pageinfo
published: True
reportingArea: RESTService, RESTServiceCore
position: 6
previous_url: /telerik-reporting-rest-json-entities-pageinfo,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/pageinfo
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

# PageInfo Overview

Page info representing the state of a single document page and its content.

When the page is not available:

````JSON
{
	"pageReady": false,
	"pageNumber": 1,
}
````

When the page is  available: 

````JSON
{
	"pageReady": true,
	"pageNumber": 1,
	"pageContent": "<html>My page content</html>",
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`pageReady`|`Boolean`|`true`|Indicates whether the processing of the current page is complete|
|`pageNumber`|`Number`|`true`|An integer representing the count of ready physical pages|
|`pageContent`|`String`|`false`|If rendering to HTML formats, the value is a String holding the markup of the page. Otherwise, the value is an array of bytes representing the content in the selected format. Available only if the page is ready|
