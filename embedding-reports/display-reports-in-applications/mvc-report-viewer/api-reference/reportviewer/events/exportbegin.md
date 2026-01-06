---
title: ExportBegin
page_title: ExportBegin event
description: "Attaches an event handler that will be called prior to starting the report export command. The export begin event is triggered before the report viewer starts generating the export document."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/exportbegin
published: True
reportingArea: MVCWrapper
---

# The `ExportBegin` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called prior to starting the report export command. The export begin event is triggered before the report viewer starts generating the export document.

## Example

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


