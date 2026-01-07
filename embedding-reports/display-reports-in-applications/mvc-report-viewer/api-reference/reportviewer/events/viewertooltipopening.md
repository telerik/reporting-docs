---
title: ViewerToolTipOpening
page_title: ViewerToolTipOpening event
description: "Attaches an event handler that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/viewertooltipopening
published: True
reportingArea: MVCWrapper
---

# The `ViewerToolTipOpening` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls.

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer Tooltip Opening Event Demo";
}

@(Html.TelerikReporting().ReportViewer()
    // Set the unique ID for the report viewer
    .Id("reportViewer1")
    // Specify the Rest Service URL
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach an event handler for the ViewerToolTipOpening client event
    .ClientEvents(events => events.ViewerToolTipOpening("onViewerToolTipOpening"))
)

@section scripts
{
    @(
        Html.TelerikReporting().DeferredScripts()
    )
    <script type="text/javascript">
        // Handler for the viewer tooltip opening event
        function onViewerToolTipOpening(e) {
            // Your custom logic here
            // e - the event arguments
        }
    </script>
}
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/overview%})
* [Error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/error%})
* [ExportBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/exportbegin%})

