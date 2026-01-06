---
title: Telerik.Reporting.ReportSource
page_title: Telerik.Reporting.ReportSource Type
description: "Provides the base class for a report source. This is an abstract class that contains only a collection of parameter values that are passed to the Telerik.Reporting.IReportDocument object when its instance is initialized."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportsource
published: True
reportingArea: MVCWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }
</style>

# The `ReportSource` type of the HTML5 ASP.NET MVC Report Viewer

Provides the base class for a report source. This is an abstract class that contains only a collection of parameter values that are passed to the `Telerik.Reporting.IReportDocument` object when its instance is initialized.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ReportSource() | Initializes a new instance of the ReportSource class. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this ReportSource. |
| Parameters | `Telerik.Reporting.ParameterCollection` | Gets the parameter values that are passed to the `Telerik.Reporting.IReportDocument` object when its instance is initialized.<br>The parameter name must match the name of the `Telerik.Reporting.ReportParameter` of the `Telerik.Reporting.IReportDocument`<br>in order the value to be passed correctly.<br>If a parameter (available in the report definition) is omitted in this collection, the report will be processed by evaluating the Value property of the Report Parameter in the report definition. |
| ToString | `System.String` | Returns a string that represents the current ReportSource. |

## Example

````C#
@* This example demonstrates how to assign an abstract Telerik.Reporting.ReportSource (via a derived type, e.g., UriReportSource) as the report source for the HTML5 Report Viewer. *@
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Using UriReportSource, which inherits from ReportSource (ReportSource is abstract)
    .ReportSource(new UriReportSource { Uri = "" })
)
````

