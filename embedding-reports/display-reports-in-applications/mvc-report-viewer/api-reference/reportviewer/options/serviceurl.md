---
title: ServiceUrl
page_title: ServiceUrl property
description: "Sets the URL of the Telerik Reporting REST service that will provide the report viewer with reports and handle processing operations. The service must be properly configured for successful communication between the viewer and server."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/serviceurl
published: True
reportingArea: MVCWrapper
---

# The `ServiceUrl` option of the HTML5 ASP.NET MVC Report Viewer

Sets the URL of the Telerik Reporting REST service that will provide the report viewer with reports and handle processing operations. The service must be properly configured for successful communication between the viewer and server.

## Type

`System.String`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example of setting the ServiceUrl property for the report viewer.
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
)
````



