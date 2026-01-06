---
title: ReportSource
page_title: ReportSource property
description: "The ReportSource property provides multiple overloads to support different configuration scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: MVCWrapper
---

# The `ReportSource` option of the HTML5 ASP.NET MVC Report Viewer

The `ReportSource` property has multiple overloads to support different ways of configuring the viewer. Select the appropriate overload below based on your use case.

## Overloads

### ReportSource(string)

Sets the report source as a string identifier for the report displayed in the viewer. Simplified method for specifying reports using string-based identification without additional configuration.

#### Example

````C#
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo - ReportSource(string)";
}

<!--
    Example: Using the ReportSource(string) method to set the report displayed in the viewer by specifying its string identifier.
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource("MyReports/SampleReport") // Sets the report source by string
)
````

### ReportSource(TypeReportSource)

Sets the report source as a [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/typereportsource%}) for the report displayed in the viewer. Used for reports that are implemented as .NET classes and referenced by their type information.

#### Example

````C#
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

### ReportSource(UriReportSource)

Sets the report source as a [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/urireportsource%}) for the report displayed in the viewer. Used for reports stored as files that are referenced by their file system or web URI location.

#### Example

````C#
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

### ReportSource(string,System.Collections.Generic.IDictionary<string,object>)

Sets the report source as a string identifier and provides parameter values for the report displayed in the viewer. Combines report identification with parameter initialization for streamlined report setup with predefined values.

#### Example

````C#
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal setup with id and service URL
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source using the report identifier and parameters
    .ReportSource("SampleReport", new Dictionary<string, object> { { "Parameter1", "Value1" } })
)
````

## See Also

* [TypeReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/typereportsource%})
* [UriReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/urireportsource%})


