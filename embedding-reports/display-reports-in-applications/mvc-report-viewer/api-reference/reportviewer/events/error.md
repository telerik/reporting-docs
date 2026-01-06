---
title: Error
page_title: Error event
description: "Attaches an event handler that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: MVCWrapper
---

# The `Error` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations.

## Example

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



