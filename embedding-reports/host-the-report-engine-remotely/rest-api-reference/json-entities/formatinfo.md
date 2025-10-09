---
title: FormatInfo
page_title: FormatInfo JSON Entity at a Glance
description: "Learn more about the FormatInfo JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatinfo
tags: formatinfo
published: True
reporting_area: RESTService, RESTServiceCore
position: 3
previous_url: /telerik-reporting-rest-json-entities-formatinfo,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatinfo
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

# FormatInfo Overview

Format info object representing a document format that can be used for document creation.

````JSON
{
	"name": "PDF",
	"localizedName": "Acrobat (PDF) file"
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`name`|`String`|`true`|ID of the document format|
|`localizedName`|`String`|`true`|Display name for the document format|
