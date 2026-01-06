---
title: ExportEnd
page_title: ExportEnd event
description: "Attaches an event handler that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/exportend
published: True
reportingArea: MVCWrapper
---

# The `ExportEnd` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts.

## Example

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

