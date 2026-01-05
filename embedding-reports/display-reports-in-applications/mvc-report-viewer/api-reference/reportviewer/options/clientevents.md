---
title: ClientEvents
page_title: ClientEvents property
description: "Provides a fluent way to configure the client-side event handlers of the report viewer. Enables attachment of JavaScript functions to handle various viewer events such as rendering, printing, and user interactions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/clientevents
published: True
reportingArea: MVCWrapper
---

# The `ClientEvents` option of the HTML5 ASP.NET MVC Report Viewer

Provides a fluent way to configure the client-side event handlers of the report viewer. Enables attachment of JavaScript functions to handle various viewer events such as rendering, printing, and user interactions.

## Type

`System.Action{Telerik.ReportViewer.Mvc.IClientEventsBuilder}`

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Report Viewer ClientEvents Configuration Example";
}

<!-- Demonstrates configuring client-side events via ClientEvents method -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(events => {
        // You would chain event configuration methods here, for example:
        // events.OnReportLoaded("onReportLoaded");
    })
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [Telerik.ReportViewer.Mvc.IClientEventsBuilder](https://docs.telerik.com/reporting/api/telerik.reportviewer.mvc.iclienteventsbuilder)
