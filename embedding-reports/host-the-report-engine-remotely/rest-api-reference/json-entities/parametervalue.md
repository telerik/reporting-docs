---
title: ParameterValue
page_title: ParameterValue JSON Entity at a Glance
description: "Learn more about the ParameterValue JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parametervalue
tags: parametervalue
published: True
reportingArea: RESTService, RESTServiceCore
position: 8
previous_url: /telerik-reporting-rest-json-entities-parametervalue,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parametervalue
---

<style>
	table {
		display: grid;
		grid-template-columns: min-content 1fr min-content 2fr;
	}

	thead, tbody, tr {
		display: contents;
	}

	th {
		white-space: nowrap;
	}
</style>

# ParameterValue Overview

Represents a single value of the parameter available values.       

````JSON 
{
	"name": "Sofia",
	"value": 1
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`name`|`String`|`true`|The name of the parameter name-value pair|
|`value`|`Array / Boolean / Date / Number / String`|`true`|The value of the parameter name-value pair|
