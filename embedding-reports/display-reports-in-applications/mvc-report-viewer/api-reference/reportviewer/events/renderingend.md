---
title: RenderingEnd
page_title: RenderingEnd event
description: "Attaches an event handler that will be called when the rendering of the report ends. The rendering end event is triggered when the report viewer completes processing and rendering the report content."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/renderingend
published: True
reportingArea: MVCWrapper
---

# The `RenderingEnd` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the rendering of the report ends. The rendering end event is triggered when the report viewer completes processing and rendering the report content.

## Example

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



