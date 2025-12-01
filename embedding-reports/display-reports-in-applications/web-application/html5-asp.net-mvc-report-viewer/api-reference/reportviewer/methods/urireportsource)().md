---
title: UriReportSource)()
page_title: The UriReportSource)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the UriReportSource)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/urireportsource)()
tags: urireportsource)
published: True
reportingArea: MVCWrapper
position: 24
---

# The `UriReportSource)()` method of the ASP.NET MVC Report Viewer

Sets the report source as a <xref href="Telerik.Reporting.UriReportSource" data-throw-if-not-resolved="false"></xref> for the report displayed in the viewer. <remarks>Used for reports stored as files that are referenced by their file system or web URI location.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example: Set the report source using a UriReportSource for the Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source as a UriReportSource
    .ReportSource(new UriReportSource { Uri = "Reports/MyReport.trdx" })
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

