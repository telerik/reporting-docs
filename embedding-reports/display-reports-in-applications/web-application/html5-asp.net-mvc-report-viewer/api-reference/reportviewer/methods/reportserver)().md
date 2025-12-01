---
title: ReportServer)()
page_title: The ReportServer)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the ReportServer)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/reportserver)()
tags: reportserver)
published: True
reportingArea: MVCWrapper
position: 20
---

# The `ReportServer)()` method of the ASP.NET MVC Report Viewer

Sets the connection data for the Telerik Report Server that hosts the reports. <remarks>Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) Connecting to Telerik Report Server for .NET is not supported.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

@* Example demonstrating how to set the connection data for the Telerik Report Server using the ReportServer method *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ReportServer(new ReportServer
    {
        Url = "http://report-server-host:83",
        Username = "admin",
        Password = "adminpass"
    })
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

