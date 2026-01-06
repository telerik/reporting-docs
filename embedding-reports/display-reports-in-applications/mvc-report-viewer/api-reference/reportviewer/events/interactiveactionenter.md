---
title: InteractiveActionEnter
page_title: InteractiveActionEnter event
description: "Attaches an event handler that will be called when the mouse cursor enters the action's report item area. The interactive action enter event is triggered when the mouse hovers over interactive report elements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/interactiveactionenter
published: True
reportingArea: MVCWrapper
---

# The `InteractiveActionEnter` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the mouse cursor enters the action's report item area. The interactive action enter event is triggered when the mouse hovers over interactive report elements.

## Example

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



