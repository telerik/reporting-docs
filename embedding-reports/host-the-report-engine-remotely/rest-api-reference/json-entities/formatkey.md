---
title: FormatKey
page_title: FormatKey JSON Entity at a Glance
description: "Learn more about the FormatKey JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatkey
tags: formatkey
published: True
reportingArea: RESTService, RESTServiceCore
position: 4
previous_url: /telerik-reporting-rest-json-entities-formatkey,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatkey
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

# FormatKey Overview

The document format and settings forming a key: 

````JSON
{
	"format": "HTML5",
	"deviceInfo": { "UseSVG": true },
	"useCache": true,
	"baseDocumentId": "xxxx",
	"actionId": "xxxx"
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`format`|`String`|`true`|PDF, XLSX, etc. A full list can be found at: [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})|
|`deviceInfo`|`Object`|`false`|[Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}). Each property of the object represents a single setting. The name of the property is the name of the setting and the value of the property is the setting value|
|`useCache`|`Boolean`|`false`|Indicates whether the returned document should be taken from cached resources if available. The default value is `True`|
|`baseDocumentId`|`String`|`false`| The base document from the cache that should service as interactivity blueprint|
|`actionId`|`String`|`false`| The server interactivity action that should be triggered over an existing document in order to generate the new document|

For more details see [CreateDocumentArgs](/api/telerik.reporting.services.webapi.createdocumentargs).
