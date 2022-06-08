---
title: System.ArgumentException The JSON value of length n is too large and not supported
description: The error message System.ArgumentException The JSON value of length n is too large and not supported is displayed in the report viewer 
type: troubleshooting
page_title: System.ArgumentException The JSON value of length n is too large and not supported
slug: json-length-is-too-large-net-core
position: 
tags: 
ticketid: 1556924
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>ASP.NET Core</td>
		</tr>
		<tr>
			<td>Report Viewers</td>
			<td>HTML5-based Report Viewers</td>
		</tr>
	</tbody>
</table>


## Description

Rendering a report with a lot of data, hence a big number of pages, would result in displaying the "System.ArgumentException: The JSON value of length n is too large and not supported" error message inside the report viewer at some point.

## Error Message

````
CSharp.Net6.Html5IntegrationDemo Error: 0 : An error occurred while rendering the report in separate thread: System.ArgumentException: The JSON value of length 174438958 is too large and not supported.
   at System.Text.Json.ThrowHelper.ThrowArgumentException_ValueTooLarge(Int32 tokenLength)
   at System.Text.Json.Serialization.Converters.ByteArrayConverter.Write(Utf8JsonWriter writer, Byte[] value, JsonSerializerOptions options)
   at System.Text.Json.Serialization.JsonConverter`1.TryWrite(Utf8JsonWriter writer, T& value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.Serialization.Metadata.JsonPropertyInfo`1.GetMemberAndWriteJson(Object obj, WriteStack& state, Utf8JsonWriter writer)
   at System.Text.Json.Serialization.Converters.ObjectDefaultConverter`1.OnTryWrite(Utf8JsonWriter writer, T value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.Serialization.JsonConverter`1.TryWrite(Utf8JsonWriter writer, T& value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.Serialization.JsonConverter`1.WriteCore(Utf8JsonWriter writer, T& value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.Serialization.JsonConverter`1.WriteCoreAsObject(Utf8JsonWriter writer, Object value, JsonSerializerOptions options, WriteStack& state)
   at System.Text.Json.JsonSerializer.WriteUsingSerializer[TValue](Utf8JsonWriter writer, TValue& value, JsonTypeInfo jsonTypeInfo)
   at System.Text.Json.JsonSerializer.WriteBytesUsingSerializer[TValue](TValue& value, JsonTypeInfo jsonTypeInfo)
   at Telerik.Reporting.Services.Engine.DocumentResources.AddResource(RenderingResource resource)
   at Telerik.Reporting.Services.Engine.Document.AddClientSearchItemsResource(IList searchItems)
   at Telerik.Reporting.Services.Engine.Document.FinishRendering(ReportRendererResult result)
   at Telerik.Reporting.Services.Engine.Rendering.SaveResult(ReportRendererResult result)
   at Telerik.Reporting.Services.Engine.CompressPagesRendering.SaveResult(ReportRendererResult result)
   at Telerik.Reporting.Services.Engine.Rendering.ThreadFunc(Object o)
````

## Cause\Possible Cause(s)

This problem occurs when the Telerik Reporting tries to generate the search metadata that the report viewer uses for its search functionality.

## Suggested Workarounds

By default, the search metadata is generated automatically but it can also be set to be on-demand which would resolve the issue for the cases when the search is not used.

````js
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    searchMetadataOnDemand: true // set this property to true to generate the search metadata only when needed
});
````

## See Also

* [Report Viewer Initialization]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization %})
