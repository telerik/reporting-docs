---
title: Telerik.Reporting.ReportSourceCollection
page_title: Telerik.Reporting.ReportSourceCollection Type
description: "Represents a collection of  Telerik.Reporting.ReportSource objects."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportsourcecollection
published: True
reportingArea: MVCWrapper
---

# The `ReportSourceCollection` type of the HTML5 ASP.NET MVC Report Viewer

Represents a collection of  [`Telerik.Reporting.InstanceReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/reportsource%}) objects.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AddRange(System.Collections.Generic.IEnumerable{Telerik.Reporting.ReportSource}) | - | Adds an array of report source objects to the collection.<br><br>The <B>ReportSource</B> objects contained in the items array are <br>appended to the end of the collection. |

## Example

````C#
@using Telerik.Reporting

@* Example demonstrating creation and usage of Telerik.Reporting.ReportSourceCollection *@
@{
    // Create a new ReportSourceCollection instance
    var reportSources = new ReportSourceCollection();

    // Create a ReportSource (e.g. UriReportSource or TypeReportSource)
    var reportSource = new UriReportSource() { Uri = "SampleReport.trdp" };

    // Add the ReportSource to the collection
    reportSources.Add(reportSource);
}
````

