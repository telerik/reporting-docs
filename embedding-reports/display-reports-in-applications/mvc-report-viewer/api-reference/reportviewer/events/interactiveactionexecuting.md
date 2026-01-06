---
title: InteractiveActionExecuting
page_title: InteractiveActionExecuting event
description: "Attaches an event handler that will be called when an interactive action is executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: MVCWrapper
---

# The `InteractiveActionExecuting` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when an interactive action is executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons.

## Example

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



