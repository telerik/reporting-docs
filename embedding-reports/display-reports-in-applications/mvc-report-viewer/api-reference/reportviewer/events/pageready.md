---
title: PageReady
page_title: PageReady event
description: "Attaches an event handler that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: MVCWrapper
---

# The `PageReady` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display.

## Example

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



