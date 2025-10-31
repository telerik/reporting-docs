---
title: Parameter
page_title: Parameter JSON Entity at a Glance
description: "Learn more about the Parameter JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parameter
tags: parameter
published: True
reportingArea: RESTService, RESTServiceCore
position: 7
previous_url: /telerik-reporting-rest-json-entities-parameter,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parameter
---

<style>
	table {
		display: grid;
		grid-template-columns: min-content 1fr min-content 3fr;
	}

	thead, tbody, tr {
		display: contents;
	}

	th {
		white-space: nowrap;
	}
</style>

# Parameter Overview

Represents a report parameter with its value and settings.

````JSON
{
	"name": "p2",
	"id": "p2",
	"type": "System.String",
	"text": "Please input p2",
	"multivalue": false,
	"allowNull": false,
	"allowBlank": false,
	"isVisible": true,
	"autoRefresh": false,
	"hasChildParameters": false,
	"childParameters": ["p2"],
	"availableValues": [
			{"name": "Sofia", "value": "Sofia"}
			{"name": "Berlin", "value": "Berlin"}
	],
	"value": "Sofia"
	"label": "Sofia",
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`name`|`String`|`true`|The name of the report parameter|
|`id`|`String`|`true`|Parameter identifier|
|`type`|`String`|`true`|A string representing the type of the report parameter|
|`text`|`String`|`true`|The prompt text that will be displayed for the parameter|
|`multivalue`|`Boolean`|`true`|Specifies whether the parameter value is an Array of values or a single value|
|`allowNull`|`Boolean`|`true`|Specifies whether a value for the parameter is required or optional|
|`allowBlank`|`Boolean`|`true`|Specifies whether an empty string is a valid parameter value. Applicable for parameter of type string only|
|`isVisible`|`Boolean`|`true`|Specifies whether the parameter should be displayed in the viewer|
|`autoRefresh`|`Boolean`|`true`|Specifies whether changes of the parameter value should trigger a report refresh|
|`hasChildParameters`|`Boolean`|`true`|Specifies whether the current parameter has other parameters depending on it|
|`childParameters`|`Array`|`false`|Specifies the child parameters IDs. Contains String objects|
|`availableValues`|`Array`|`false`|Parameter values to choose from. Contains[ParameterValue]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parametervalue%})objects|
|`value`|`Array / Boolean / Date / Number / String`|`true`|The value of the parameter. Its type should match the type in the definition. If multivalue is set to true it must be an Array|
|`label`|`String`|`true`|Specifies the label of the parameter. If availableValues are set, the label value is replaced by the name of the currently selected ParameterValue|
