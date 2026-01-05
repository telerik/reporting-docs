---
title: PrintBegin
page_title: PrintBegin event
description: "Attaches an event handler that will be called prior to starting the print report command. The print begin event is triggered before the report viewer starts generating the print document."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/printbegin
published: True
reportingArea: MVCWrapper
---

# The `PrintBegin` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called prior to starting the print report command. The print begin event is triggered before the report viewer starts generating the print document.

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "PrintBegin Event Example";
}

<!-- Example of attaching the PrintBegin client event handler in the Telerik Reporting MVC Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(events => events.PrintBegin("onPrintBegin"))
)

@section scripts {
    <script type="text/javascript">
        function onPrintBegin(e) {
            // This function will be called before starting the print command
            alert("Printing is about to begin.");
        }
    </script>
    @(Html.TelerikReporting().DeferredScripts())
}
````

