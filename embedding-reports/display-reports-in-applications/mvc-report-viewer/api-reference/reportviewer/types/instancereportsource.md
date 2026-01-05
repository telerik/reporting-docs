---
title: Telerik.Reporting.InstanceReportSource
page_title: Telerik.Reporting.InstanceReportSource Type
description: "This report source is used when you have a reference to an already instantiated report  (Telerik.Reporting.Report instance). For better performance and compatibility use Telerik.Reporting.TypeReportSource.  Represents a report source that contains a reference to an instance of  Telerik.Reporting.IReportDocument."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/instancereportsource
published: True
reportingArea: MVCWrapper
---

# The `InstanceReportSource` type of the HTML5 ASP.NET MVC Report Viewer

This report source is used when you have a reference to an already instantiated report  (`Telerik.Reporting.Report` instance). For better performance and compatibility use [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/typereportsource%}).  Represents a report source that contains a reference to an instance of  `Telerik.Reporting.IReportDocument`.

## Constructors

| Constructor | Description |
| ------ | ------ |
| InstanceReportSource() | Initializes a new instance of the [`Telerik.Reporting.InstanceReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/instancereportsource%}) class. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this InstanceReportSource. |
| ReportDocument | `Telerik.Reporting.IReportDocument` | Gets or sets the `Telerik.Reporting.IReportDocument` instance for the report source. |
| ToString | `System.String` | Returns a string that represents the current InstanceReportSource. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "InstanceReportSource Example";
}

<!-- Example: Use InstanceReportSource for the ReportViewer's ReportSource -->

@(
    Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl(Url.Content("~/api/reports/"))
        // Using InstanceReportSource to pass an already instantiated report.
        .ReportSource(new InstanceReportSource { ReportDocument = new Report() })
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
