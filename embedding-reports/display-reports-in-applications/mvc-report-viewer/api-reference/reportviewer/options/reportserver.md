---
title: ReportServer
page_title: ReportServer property
description: "Sets the connection data for the Telerik Report Server that hosts the reports. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) Connecting to Telerik Report Server for .NET is not supported."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/reportserver
published: True
reportingArea: MVCWrapper
---

# The `ReportServer` option of the HTML5 ASP.NET MVC Report Viewer

Sets the connection data for the Telerik Report Server that hosts the reports. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) Connecting to Telerik Report Server for .NET is not supported.

## Type

[`Telerik.ReportViewer.Mvc.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportserver%})

## Examples

````C#
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

* [ReportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportserver%})
