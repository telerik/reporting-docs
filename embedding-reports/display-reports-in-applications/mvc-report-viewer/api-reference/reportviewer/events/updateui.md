---
title: UpdateUi
page_title: UpdateUi event
description: "Attaches an event handler that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the report viewer interface needs to refresh during user interactions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: MVCWrapper
---

# The `UpdateUi` event of the HTML5 ASP.NET MVC Report Viewer

Attaches an event handler that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the report viewer interface needs to refresh during user interactions.

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo - UpdateUi usage";
}

@(Html.TelerikReporting().ReportViewer()
    // Required properties
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Attach a JavaScript handler to the UpdateUi event
    .ClientEvents(events => events.UpdateUi("onReportViewerUpdateUi"))
)

@section scripts {
    <script type="text/javascript">
        // JavaScript handler for the UpdateUi event
        function onReportViewerUpdateUi(e, args) {
            // Custom logic to update UI
            console.log("Report Viewer UI update triggered.", args);
        }
    </script>
}
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/overview%})
* [ViewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/viewertooltipopening%})
* [Error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/events/error%})

