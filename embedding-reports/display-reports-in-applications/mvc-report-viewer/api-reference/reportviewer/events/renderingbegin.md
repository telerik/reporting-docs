---
title: RenderingBegin
page_title: RenderingBegin event
description: "Attaches an event handler that will be called when the rendering of the report begins. The rendering begin event is triggered when the report viewer starts processing and rendering the report content."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/renderingbegin
published: True
reportingArea: MVCWrapper
---

# The `RenderingBegin` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the rendering of the report begins. The rendering begin event is triggered when the report viewer starts processing and rendering the report content.

## Example

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



