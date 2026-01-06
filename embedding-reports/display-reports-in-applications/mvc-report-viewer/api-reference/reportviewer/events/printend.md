---
title: PrintEnd
page_title: PrintEnd event
description: "Attaches an event handler that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/printend
published: True
reportingArea: MVCWrapper
---

# The `PrintEnd` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs.

## Example

    ````C#
@using Telerik.ReportViewer.Mvc

<!--
    This example demonstrates how to use the PrintEnd event to run custom JavaScript
    when the print document is ready for download.
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(e => e.PrintEnd("onPrintEndHandler"))
)

@section scripts {
    <script type="text/javascript">
        function onPrintEndHandler(e) {
            // Custom logic goes here
            alert("Print document is ready for download.");
        }
    </script>
}
````


