---
title: Events
page_title: Events of the HTML5 ASP.NET MVC Report Viewer
description: Complete list of events available in the HTML5 ASP.NET MVC Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: MVCWrapper
position: 4
---

# Events of the HTML5 ASP.NET MVC Report Viewer

## Error

Attaches an event handler that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example of using the Error method to handle report viewer errors *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(events => events.Error("onReportViewerError"))
)

<script type="text/javascript">
    // 'onReportViewerError' JavaScript function to handle errors
    function onReportViewerError(e, args) {
        alert("An error occurred in the report viewer.");
    }
</script>
````


## ExportBegin

Attaches an event handler that will be called prior to starting the report export command. The export begin event is triggered before the report viewer starts generating the export document.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "ExportBegin Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attaching ExportBegin client event handler
    .ClientEvents(events => events.ExportBegin("onExportBegin"))
)

@section scripts
{
    @(Html.TelerikReporting().DeferredScripts())
    <script type="text/javascript">
        // JavaScript handler for the ExportBegin event
        function onExportBegin(e) {
            // Custom logic before export starts
            alert('Export is about to begin!');
        }
    </script>
}
````


## ExportEnd

Attaches an event handler that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik MVC ReportViewer ExportEnd Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach the ExportEnd event handler. 
    .ClientEvents(events => events.ExportEnd("onExportEnd"))
)

@section scripts
{
    <script type="text/javascript">
        // This JavaScript function will be called when the exported document is ready for download.
        function onExportEnd(e) {
            // e contains event data
            alert('Export operation finished. Document is ready for download.');
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````


## InteractiveActionEnter

Attaches an event handler that will be called when the mouse cursor enters the action's report item area. The interactive action enter event is triggered when the mouse hovers over interactive report elements.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "InteractiveActionEnter Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attaches an event handler for when the mouse enters an interactive action area
    .ClientEvents(events =>
        events.InteractiveActionEnter("onInteractiveActionEnter")
    )
)

@section scripts
{
    @(Html.TelerikReporting().DeferredScripts())
    <script type="text/javascript">
        // JavaScript function to handle InteractiveActionEnter event
        function onInteractiveActionEnter(e) {
            // Handle the event here
            console.log("Interactive action area entered", e);
        }
    </script>
}
````


## InteractiveActionExecuting

Attaches an event handler that will be called when an interactive action is executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "InteractiveActionExecuting Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach JavaScript handler for interactive action executing event
    .ClientEvents(events => events.InteractiveActionExecuting("onInteractiveActionExecuting"))
)

@section scripts{
    <script type="text/javascript">
        function onInteractiveActionExecuting(e) {
            // Handle the interactive action execution here
            // e.sender - viewer instance, e.action - interactive action info
            alert("Interactive action is executing!");
        }
    </script>
}
````


## InteractiveActionLeave

Attaches an event handler that will be called when the mouse cursor leaves the action's report item area. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "InteractiveActionLeave Example";
}

<!-- Demonstrates attaching an InteractiveActionLeave event handler to the Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
      .Id("reportViewer1")
      .ServiceUrl(Url.Content("~/api/reports/"))
      .ClientEvents(events => events
            // Attaches a JavaScript handler for InteractiveActionLeave
            .InteractiveActionLeave("onInteractiveActionLeaveHandler")
      )
)

@section scripts
{
    @Html.TelerikReporting().DeferredScripts()
    <script type="text/javascript">
        function onInteractiveActionLeaveHandler(e) {
            // e - event arguments
            console.log("InteractiveActionLeave triggered", e);
        }
    </script>
}
````


## PageReady

Attaches an event handler that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo - PageReady Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach a Javascript handler for the PageReady event. The handler name is a string.
    .ClientEvents(events => events.PageReady("onPageReady"))
)

@section scripts
{
    @(Html.TelerikReporting().DeferredScripts())
    <script>
        // Define the PageReady event handler function
        function onPageReady(e, args) {
            // Handle the event when a page is rendered and ready for display
            console.log("A report page is ready:", args);
        }
    </script>
}
````


## PrintBegin

Attaches an event handler that will be called prior to starting the print report command. The print begin event is triggered before the report viewer starts generating the print document.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "PrintBegin Event Example";
}

<!-- Example of attaching the PrintBegin client event handler in the Telerik Reporting MVC Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(events => events.PrintBegin("onPrintBegin"))
)

@section scripts {
    <script type="text/javascript">
        function onPrintBegin(e) {
            // This function will be called before starting the print command
            alert("Printing is about to begin.");
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````


## PrintEnd

Attaches an event handler that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs.

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!--
    This example demonstrates how to use the PrintEnd event to run custom JavaScript
    when the print document is ready for download.
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(e => e.PrintEnd("onPrintEndHandler"))
)

@section scripts {
    <script type="text/javascript">
        function onPrintEndHandler(e) {
            // Custom logic goes here
            alert("Print document is ready for download.");
        }
    </script>
}
````


## Ready

Attaches an event handler that will be called when the report viewer template is loaded. The ready event is triggered when the report viewer template and UI components are fully loaded and initialized.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer Ready Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal required parameters
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Usage of Ready event - attach a JS handler for when the viewer is loaded
    .ClientEvents(events => events.Ready("onReportViewerReady"))
)

@section scripts {
    <script type="text/javascript">
        // JavaScript handler for the Ready event
        function onReportViewerReady(e) {
            // Handle ready event here
            console.log("ReportViewer is ready!");
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````


## RenderingBegin

Attaches an event handler that will be called when the rendering of the report begins. The rendering begin event is triggered when the report viewer starts processing and rendering the report content.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "RenderingBegin event example";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal required configuration
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach RenderingBegin client event handler
    .ClientEvents(events => events.RenderingBegin("onRenderingBegin"))
)

@section scripts
{
    <script type="text/javascript">
        // Declare the RenderingBegin event handler function
        function onRenderingBegin(e) {
            // e.sender points to the report viewer widget
            console.log('Report rendering has started.');
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````


## RenderingEnd

Attaches an event handler that will be called when the rendering of the report ends. The rendering end event is triggered when the report viewer completes processing and rendering the report content.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "RenderingEnd Event Example";
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach JavaScript event handler for the RenderingEnd event
    .ClientEvents(events => events.RenderingEnd("onReportRenderingEnd"))
)

@section scripts {
    <script type="text/javascript">
        // JavaScript event handler for rendering end
        function onReportRenderingEnd(e, args) {
            // Handle the rendering end event here
            alert("Report rendering has finished.");
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````


## UpdateUi

Attaches an event handler that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the report viewer interface needs to refresh during user interactions.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo - UpdateUi usage";
}

@(Html.TelerikReporting().ReportViewer()
    // Required properties
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach a JavaScript handler to the UpdateUi event
    .ClientEvents(events => events.UpdateUi("onReportViewerUpdateUi"))
)

@section scripts {
    <script type="text/javascript">
        // JavaScript handler for the UpdateUi event
        function onReportViewerUpdateUi(e, args) {
            // Custom logic to update UI
            console.log("Report Viewer UI update triggered.", args);
        }
    </script>
}
````


## ViewerToolTipOpening

Attaches an event handler that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls.

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer Tooltip Opening Event Demo";
}

@(Html.TelerikReporting().ReportViewer()
    // Set the unique ID for the report viewer
    .Id("reportViewer1")
    // Specify the Rest Service URL
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach an event handler for the ViewerToolTipOpening client event
    .ClientEvents(events => events.ViewerToolTipOpening("onViewerToolTipOpening"))
)

@section scripts
{
    @(
        Html.TelerikReporting().DeferredScripts()
    )
    <script type="text/javascript">
        // Handler for the viewer tooltip opening event
        function onViewerToolTipOpening(e) {
            // Your custom logic here
            // e - the event arguments
        }
    </script>
}
````

