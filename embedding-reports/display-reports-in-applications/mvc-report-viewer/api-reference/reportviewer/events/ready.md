---
title: Ready
page_title: Ready event
description: "Attaches an event handler that will be called when the report viewer template is loaded. The ready event is triggered when the report viewer template and UI components are fully loaded and initialized."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/ready
published: True
reportingArea: MVCWrapper
---

# The `Ready` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the report viewer template is loaded. The ready event is triggered when the report viewer template and UI components are fully loaded and initialized.

## Example

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



