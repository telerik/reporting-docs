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

The Native Blazor Report Viewer exposes **events** that are emitted at various points in the report lifecycle such as when the rendering begins, ends, when the user prints, exports, or interacts with report items.

## Rendering Events

### OnRenderingBegin

Occurs before rendering the report. The event is triggered only on preview. The export operation has a dedicated event.

This event has one argument of type `RenderingBeginEventArgs` which represents the device information settings that will be used for the rendering of the report in the `HTML5`/`HTML5Interactive` format. Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnRenderingBegin.razor region=NativeViewerOnRenderingBegin}}

### OnRenderingEnd

Occurs after the rendering of the report finishes. The event is triggered only on preview. The export operation has a dedicated event.

This event has one argument of type `RenderingEndEventArgs` which represents the returned [DocumentInfo entity](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo) at the end of the report rendering.

Sample usage:

{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerOnRenderingEnd.razor region=NativeViewerOnRenderingEnd}}

### OnPageReady

Occurs when a report page has been rendered and is ready for display. This event has one argument of type `PageReadyEventArgs` which is an object with the following properties:

- `PageNumber` - The number of the page in order of appearance in the report.
- `PageReady` - A value indicating whether the page has been rendered and is ready for display.
- `PageStyles` - The CSS styles applied to the page.
- `PageContent` - The HTML content of the page.
- `PageActions` - A list of `PageAction` objects associated with the page, such as drilldowns or toggles. Each `PageAction` contains `Id`, `ReportItemName`, `Type`, and `Value` properties.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnPageReady="@PageReady">
</ReportViewer>

@code {
    async Task PageReady(PageReadyEventArgs args)
    {
        // Called when each page has been rendered and is ready for display.
    }
}
```

## Print Events

### OnPrintStarted

Occurs before the print operation begins. Setting `Handled` to `true` prevents the default print behavior. This event has one argument of type `PrintStartedEventArgs` which is an object with the following properties:

- `DeviceInfo` - The device information settings used during the print operation.
- `Handled` - Prevents the default print behavior. Default value: `false`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnPrintStarted="@PrintStarted">
</ReportViewer>

@code {
    async Task PrintStarted(PrintStartedEventArgs args)
    {
        // Modify device info for the print document, or prevent the default print behavior.
        // args.Handled = true;
    }
}
```

### OnPrintDocumentReady

Occurs when the print document has been prepared and its URL is ready. Setting `Handled` to `true` prevents the default print behavior. This event has one argument of type `PrintDocumentReadyEventArgs` which is an object with the following properties:

- `Url` - The URL of the document prepared for printing.
- `Handled` - Prevents the default print behavior. Default value: `false`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnPrintDocumentReady="@PrintDocumentReady">
</ReportViewer>

@code {
    async Task PrintDocumentReady(PrintDocumentReadyEventArgs args)
    {
        // Access the URL of the document prepared for printing, or prevent the default print behavior.
        // args.Handled = true;
    }
}
```

## Export Events

### OnExportStarted

Occurs when the export process is starting. Setting `Handled` to `true` prevents the default export behavior. This event has one argument of type `ExportStartedEventArgs` which is an object with the following properties:

- `DeviceInfo` - The device information settings used during the export operation.
- `Format` - The document format of the exported report.
- `Handled` - Prevents the default export behavior. Default value: `false`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnExportStarted="@ExportStarted">
</ReportViewer>

@code {
    async Task ExportStarted(ExportStartedEventArgs args)
    {
        // Inspect or change the format/device info for the export, or prevent the default behavior.
        // if (args.Format == "CSV")
        // {
        //     args.Handled = true; // Prevent CSV export
        // }
    }
}
```

### OnExportDocumentReady

Occurs when the exported document is ready and its URL is available. Setting `Handled` to `true` prevents the default behavior of opening the document URL. This event has one argument of type `ExportDocumentReadyEventArgs` which is an object with the following properties:

- `Url` - The URL of the exported report as a resource.
- `Format` - The document format of the exported report.
- `Handled` - Prevents the default behavior of opening the document URL. Default value: `false`.
- `WindowOpenTarget` - Changes the `target` attribute specifying where to open the browser window. Default value: `_self`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnExportDocumentReady="@ExportDocumentReady">
</ReportViewer>

@code {
    async Task ExportDocumentReady(ExportDocumentReadyEventArgs args)
    {
        // Access the exported document URL and format, change the window target, or prevent the default behavior.
        // if (args.Format == "PDF")
        // {
        //     args.WindowOpenTarget = "_blank";
        // }
        // args.Handled = true;
    }
}
```

## Send Email Events

### OnSendEmailStarted

Occurs before the send-email flow begins. Setting `Handled` to `true` prevents the default send-email behavior. This event has one argument of type `SendEmailStartedEventArgs` which is an object with the following properties:

- `DeviceInfo` - The device information settings used during the send-email operation.
- `Format` - The document format used for the send-email operation.
- `Handled` - Prevents the default send-email behavior. Default value: `false`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnSendEmailStarted="@SendEmailStarted">
</ReportViewer>

@code {
    async Task SendEmailStarted(SendEmailStartedEventArgs args)
    {
        // Inspect or change the format/device info for the send-email export, or prevent the default behavior.
        // args.Handled = true;
    }
}
```

### OnSendEmailDocumentReady

Occurs when the email document has been prepared and is ready to be sent. Setting `Handled` to `true` prevents the default send behavior. The mutable `From`, `To`, `Cc`, `Subject`, and `Body` fields allow you to modify the email details before sending. This event has one argument of type `SendEmailDocumentReadyEventArgs` which is an object with the following properties:

- `DeviceInfo` - The device information settings that were used during the send-email export. This property is read-only after construction.
- `Url` - The URL of the document prepared for sending. This property is read-only after construction.
- `Format` - The document format used for the send-email operation. This property is read-only after construction.
- `Handled` - Prevents the default send behavior. Default value: `false`.
- `From` - The sender email address.
- `To` - The recipient email address.
- `Cc` - The carbon-copy recipients.
- `Subject` - The subject of the email.
- `Body` - The body of the email.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnSendEmailDocumentReady="@SendEmailDocumentReady">
</ReportViewer>

@code {
    async Task SendEmailDocumentReady(SendEmailDocumentReadyEventArgs args)
    {
        // Access the email details and document URL, modify the email fields, or prevent the default send.
        // args.Subject = "Modified Subject";
        // args.Handled = true;
    }
}
```

## Interactive Action Events

### OnInteractiveActionExecuting

Occurs before an interactive action executes. Setting `Cancel` to `true` prevents the default execution of the action. This event has one argument of type `PageActionEventArgs` which is an object with the following properties:

- `Action` - A `PageAction` object representing the action about to execute. The `PageAction` contains `Id`, `ReportItemName`, `Type` (for example, `navigateToReport`, `navigateToUrl`, `sorting`, `toggleVisibility`), and `Value` properties.
- `Cancel` - Prevents the default execution of the action. Default value: `false`.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnInteractiveActionExecuting="@InteractiveActionExecuting">
</ReportViewer>

@code {
    async Task InteractiveActionExecuting(PageActionEventArgs args)
    {
        // Inspect or cancel the interactive action before it executes.
        // args.Cancel = true;
    }
}
```

### OnInteractiveActionEnter

Occurs when the mouse pointer enters a report item that defines an interactive action. This event has one argument of type `PageActionEventArgs` which is an object with the following properties:

- `Action` - A `PageAction` object representing the action associated with the report item.
- `Cancel` - Not used for this event.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnInteractiveActionEnter="@InteractiveActionEnter">
</ReportViewer>

@code {
    async Task InteractiveActionEnter(PageActionEventArgs args)
    {
        // React to the mouse entering a report item with an interactive action.
    }
}
```

### OnInteractiveActionLeave

Occurs when the mouse pointer leaves a report item that defines an interactive action. This event has one argument of type `PageActionEventArgs` which is an object with the following properties:

- `Action` - A `PageAction` object representing the action associated with the report item.
- `Cancel` - Not used for this event.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnInteractiveActionLeave="@InteractiveActionLeave">
</ReportViewer>

@code {
    async Task InteractiveActionLeave(PageActionEventArgs args)
    {
        // React to the mouse leaving a report item with an interactive action.
    }
}
```

## Tooltip Events

### OnTooltipOpening

Occurs before a tooltip is displayed for a report item. This event has one argument of type `TooltipEventArgs` which is an object with the following properties:

- `Text` - The text content of the tooltip.
- `Title` - The title of the tooltip.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnTooltipOpening="@TooltipOpening">
</ReportViewer>

@code {
    async Task TooltipOpening(TooltipEventArgs args)
    {
        // Modify the tooltip title or text before it is displayed.
        // args.Title = "Custom Title";
        // args.Text = "Custom tooltip text";
    }
}
```

## Error Events

### OnError

Occurs when an error is raised by the report viewer. This event has one argument of type `ErrorEventArgs` which is an object with the following properties:

- `Message` - The error message describing the condition that caused the event.

Sample usage:

```razor
<ReportViewer
    ServiceUrl="/api/reports"
    @bind-ReportSource="@ReportSource"
    OnError="@OnError">
</ReportViewer>

@code {
    async Task OnError(Telerik.ReportViewer.BlazorNative.ErrorEventArgs args)
    {
        // Handle errors raised by the report viewer.
    }
}
```

## See Also

- [Blazor Basics: Blazor Event Callbacks](https://www.telerik.com/blogs/blazor-basics-event-callbacks)
- [ASP.NET Core Blazor event handling](https://learn.microsoft.com/en-us/aspnet/core/blazor/components/event-handling)
