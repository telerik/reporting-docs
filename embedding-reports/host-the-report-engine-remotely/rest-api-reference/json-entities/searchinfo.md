---
title: SearchInfo
page_title: SearchInfo JSON Entity at a Glance
description: "Learn more about the SearchInfo JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchinfo
tags: searchinfo
published: True
position: 10
previous_url: /telerik-reporting-rest-json-entities-searchinfo,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/searchinfo
---

<style>
	table {
		display: grid;
		grid-template-columns: min-content min-content min-content 1fr;
	}

	thead, tbody, tr {
		display: contents;
	}

	th {
		white-space: nowrap;
	}
</style>

# SearchInfo Overview

The info object passed to the report engine to perform a search.

````JSON
{
	"searchToken": "foo",
	"matchCase": false,
	"matchWholeWord": false,
	"useRegularExpressions": true
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`searchToken`|`String`|`true`|The text to be searched for.|
|`matchCase`|`boolean`|`true`|Determines if the search is case-sensitive.|
|`matchWholeWord`|`boolean`|`true`|Determines if the search will consider only words. Internally uses the following regular expression:`(?<=\W|^)(token)(?=\W|$).`|
|`useRegularExpressions`|`boolean`|`true`|Determines if the search should be performed using regular expressions to match the passed token.|
