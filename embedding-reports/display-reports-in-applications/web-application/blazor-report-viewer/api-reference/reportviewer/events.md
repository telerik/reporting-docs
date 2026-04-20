---
title: Events
page_title: Events of the Blazor Report Viewer
description: Complete list of events available in the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: BlazorWrapper
position: 4
---

# Events of the Blazor Report Viewer

> The report viewer exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods%}#bindasync) method.

## Error

Gets or sets the viewer's error event handler function name. Called when an error is thrown in the report viewer.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  Error = "onError"
              })" />

<script>
    function onError(e, args) {
        console.error("An error occurred in the report viewer: " + args);
    }
</script>
```


## ExportBegin

Gets or sets the viewer's exportBegin event handler function name. Occurs before exporting the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  ExportBegin = "onExportBegin"
              })" />

<script>
    function onExportBegin(e, args) {
        console.log("Exporting the report in " + args.format + " format.");
    }
</script>
```


## ExportEnd

Gets or sets the viewer's exportEnd event handler function name. Occurs after exporting the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  ExportEnd = "onExportEnd"
              })" />

<script>
    function onExportEnd(e, args) {
        console.log("Export completed. Download URL: " + window.location.origin + args.url);
    }
</script>
```


## InteractiveActionEnter

Gets or sets the viewer's interactiveActionEnter event handler function name. Occurs when the mouse cursor enters the area of an interactive action.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  InteractiveActionEnter = "onInteractiveActionEnter"
              })" />

<script>
    function onInteractiveActionEnter(e, args) {
        console.log("Mouse cursor entered the area of an interactive action.");
    }
</script>
```


## InteractiveActionExecuting

Gets or sets the viewer's interactiveActionExecuting event handler function name. Occurs before an interactive action is executed, providing the ability to cancel the execution.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  InteractiveActionExecuting = "onInteractiveActionExecuting"
              })" />

<script>
    function onInteractiveActionExecuting(e, args) {
        console.log("An interactive action is about to be executed.");
        // To cancel the action, set args.cancel = true;
    }
</script>
```


## InteractiveActionLeave

Gets or sets the viewer's interactiveActionLeave event handler function name. Occurs when the mouse cursor leaves the area of an interactive action.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  InteractiveActionLeave = "onInteractiveActionLeave"
              })" />

<script>
    function onInteractiveActionLeave(e, args) {
        console.log("Mouse cursor left the area of an interactive action.");
    }
</script>
```


## PageReady

Gets or sets the viewer's pageReady event handler function name. Occurs after a page of the report is ready.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  PageReady = "onPageReady"
              })" />

<script>
    function onPageReady(e, args) {
        console.log("Page " + args.pageNumber + " is ready for display.");
    }
</script>
```


## PrintBegin

Gets or sets the viewer's printBegin event handler function name. Occurs before printing the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  PrintBegin = "onPrintBegin"
              })" />

<script>
    function onPrintBegin(e, args) {
        console.log("Printing the report.");
    }
</script>
```


## PrintEnd

Gets or sets the viewer's printEnd event handler function name. Occurs after printing the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  PrintEnd = "onPrintEnd"
              })" />

<script>
    function onPrintEnd(e, args) {
        console.log("Print document ready. URL: " + window.location.origin + args.url);
    }
</script>
```


## Ready

Gets or sets the viewer's ready event handler function name. Called when the viewer content has been loaded from the template and is ready to display reports or perform any other  operations. The function is executed in the context of the ReportViewer object that is available through the 'this' reference.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  Ready = "onReady"
              })" />

<script>
    function onReady() {
        console.log("The viewer is ready to display the report: " + this.reportSource().report);
    }
</script>
```


## RenderingBegin

Gets or sets the viewer's renderingBegin event handler function name. Occurs before rendering the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  RenderingBegin = "onRenderingBegin"
              })" />

<script>
    function onRenderingBegin(e, args) {
        console.log("Rendering of the report has begun.");
    }
</script>
```


## RenderingEnd

Gets or sets the viewer's renderingEnd event handler function name. Occurs after rendering the report.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  RenderingEnd = "onRenderingEnd"
              })" />

<script>
    function onRenderingEnd(e, args) {
        console.log("Rendering completed. Total pages: " + args.pageCount);
    }
</script>
```


## SendEmailBegin

Gets or sets the viewer's sendEmailBegin event handler function name. Occurs before the report is exported and the email message is sent.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  SendEmailBegin = "onSendEmailBegin"
              })" />

<script>
    function onSendEmailBegin(e, args) {
        console.log("Sending the report via email in " + args.format + " format.");
    }
</script>
```


## SendEmailEnd

Gets or sets the viewer's sendEmailEnd event handler function name. Occurs after the report is exported and the email message is sent.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  SendEmailEnd = "onSendEmailEnd"
              })" />

<script>
    function onSendEmailEnd(e, args) {
        console.log("Report sent via email successfully.");
    }
</script>
```


## UpdateUi

Gets or sets the viewer's updateUi event handler function name. Occurs when the UI state of the viewer changes.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  UpdateUi = "onUpdateUi"
              })" />

<script>
    function onUpdateUi(e, args) {
        console.log("The viewer UI state has changed.");
    }
</script>
```


## ViewerToolTipOpening

Gets or sets the viewer's viewerToolTipOpening event handler function name. Occurs before a tooltip is opened, providing the ability to cancel its opening.

### Example

```C#
<ReportViewer ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))"
              ClientEvents="@(new ClientEventsOptions
              {
                  ViewerToolTipOpening = "onViewerToolTipOpening"
              })" />

<script>
    function onViewerToolTipOpening(e, args) {
        console.log("A tooltip is about to open.");
        // To cancel the tooltip, set args.cancel = true;
    }
</script>
```

