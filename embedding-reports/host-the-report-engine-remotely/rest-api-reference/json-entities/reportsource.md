---
title: ReportSource
page_title: ReportSource JSON Entity at a Glance
description: "Learn more about the ReportSource JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource
tags: reportsource
published: True
position: 9
previous_url: /telerik-reporting-rest-json-entities-reportsource,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource, /embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/
---

<style>
table {
  display: grid;
  grid-template-columns: min-content min-content min-content 1fr;
}

thead, tbody, tr {
  display: contents;
}
</style>

# ReportSource Overview

Represents a report document identifier, consisting of a report and values for its parameters.

````JSON
{
	"report": "Report1.trdp",
	"parameterValues": { "City": "Sofia" }
}
````

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`report`|`String`|`true`|A string identifying the report. Might be a report type name, a path to a.trdp or a .trdx file, or a custom name that will be handled by a custom report source resolver on the server. See also:[Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})|
|`parameterValues`|`Object`|`false`|An object holding the parameters' information. Each of its properties represents a report parameter. The name of the property is the id of the parameter and the value of the property is the parameter's value|
