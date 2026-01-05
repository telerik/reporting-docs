---
title: Telerik.Reporting.UriReportSource
page_title: Telerik.Reporting.UriReportSource Type
description: "Represents a report source that loads a report document from a URI. The URI must point to a physical TRDX, TRDP or TRBP file."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/urireportsource
published: True
reportingArea: MVCWrapper
---

# The `UriReportSource` type of the HTML5 ASP.NET MVC Report Viewer

Represents a report source that loads a report document from a URI. The URI must point to a physical TRDX, TRDP or TRBP file.

## Constructors

| Constructor | Description |
| ------ | ------ |
| UriReportSource() | Initializes a new instance of the [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/urireportsource%}) class. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Create(System.String,System.String) | [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/urireportsource%}) | Creates a UriReportSource by resolving the relative report path against the base path. |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this UriReportSource. |
| ToString | `System.String` | Returns a string that represents the current UriReportSource. |
| Uri | `System.String` | Gets or sets the URI to load the report document from.<br><br>A URI.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction` action. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@* Example: Using UriReportSource to specify a report location *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource(new UriReportSource { Uri = "/Reports/SampleReport.trdp" })
)
````

