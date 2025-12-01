---
title: IClientEventsBuilder})()
page_title: The IClientEventsBuilder})() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the IClientEventsBuilder})() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/iclienteventsbuilder})()
tags: iclienteventsbuilder})
published: True
reportingArea: MVCWrapper
position: 4
---

# The `IClientEventsBuilder})()` method of the ASP.NET MVC Report Viewer

Provides a fluent way to configure the client-side event handlers of the report viewer. <remarks>Enables attachment of JavaScript functions to handle various viewer events such as rendering, printing, and user interactions.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

