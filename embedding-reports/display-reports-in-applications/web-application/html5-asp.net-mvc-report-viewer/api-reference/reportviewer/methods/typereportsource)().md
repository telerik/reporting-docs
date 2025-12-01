---
title: TypeReportSource)()
page_title: The TypeReportSource)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the TypeReportSource)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/typereportsource)()
tags: typereportsource)
published: True
reportingArea: MVCWrapper
position: 23
---

# The `TypeReportSource)()` method of the ASP.NET MVC Report Viewer

Sets the report source as a <xref href="Telerik.Reporting.TypeReportSource" data-throw-if-not-resolved="false"></xref> for the report displayed in the viewer. <remarks>Used for reports that are implemented as .NET classes and referenced by their type information.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating setting the report source using TypeReportSource
    var typeReportSource = new TypeReportSource
    {
        // Set the TypeName of the report class
        TypeName = "MyNamespace.MyReport, MyAssembly"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source as a TypeReportSource
    .ReportSource(typeReportSource)
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

