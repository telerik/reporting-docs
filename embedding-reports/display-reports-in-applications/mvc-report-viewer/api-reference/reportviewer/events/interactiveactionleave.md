---
title: InteractiveActionLeave
page_title: InteractiveActionLeave event
description: "Attaches an event handler that will be called when the mouse cursor leaves the action's report item area. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: MVCWrapper
---

# The `InteractiveActionLeave` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the mouse cursor leaves the action's report item area. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements.

## Example

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

