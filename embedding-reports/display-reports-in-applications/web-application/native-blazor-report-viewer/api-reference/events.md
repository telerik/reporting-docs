---
title: Events
page_title: Native Blazor Report Viewer Events
description: "Learn about the events exposed by the Native Blazor Report Viewer and how they can be used to execute custom code when they are emitted."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/events
tags: event,events,emit,fire,throw,execute,method,methods,blazor,native,report,viewer,api
published: True
reportingArea: NativeBlazor
position: 2
---

# Native Blazor Report Viewer Events Overview

The Native Blazor Report Viewer exposes **events** that will be emitted at various points in the report rendering process such as when the rendering begins, ends, etc.

## OnRenderingBegin

Occurs before rendering the report. _The event is triggered only on preview. The export operation has a dedicated event._

This event has one argument of type `RenderingBeginEventArgs` which represents the device information settings that will be used for the rendering of the report in the `HTML5`/`HTML5Interactive` format. Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnRenderingBegin.razor region=NativeViewerOnRenderingBegin}}

## OnRenderingEnd

Occurs after the rendering of the report finishes. _The event is triggered only on preview. The export operation has a dedicated event._
This event has one argument of type `RenderingEndEventArgs` which represents the returned [DocumentInfo entity](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo) at the end of the report rendering.

Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnRenderingEnd.razor region=NativeViewerOnRenderingEnd}}

## OnExportStart

Occurs before exporting the report. This event has one argument of type `ExportStartEventArgs` which is an object with the following properties:

- DeviceInfo - The device info that will be used for the export operation.
- Format - The document format of the exported report.
- IsCancelled - Prevents the default render and export operation. Default value: `false`.

Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnExportStart.razor region=NativeViewerOnExportStart}}

## OnExportEnd

Occurs after exporting the report. This event has one argument of type `ExportEndEventArgs` which is an object with the following properties:

- Url - The url of the exported report as a resource.
- Format - The document format of the exported report.
- Handled - Prevents the default export operation. Default value: `false`.
- WindowOpenTarget - Changes the `target` attribute specifying where to open the browser window. Default value is `self`.

Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnExportEnd.razor region=NativeViewerOnExportEnd}}

## See Also

- [Blazor Basics: Blazor Event Callbacks](https://www.telerik.com/blogs/blazor-basics-event-callbacks)
- [ASP.NET Core Blazor event handling](https://learn.microsoft.com/en-us/aspnet/core/blazor/components/event-handling)
