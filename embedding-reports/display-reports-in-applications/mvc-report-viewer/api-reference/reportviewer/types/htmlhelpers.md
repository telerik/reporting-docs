---
title: Telerik.ReportViewer.Mvc.HtmlHelpers
page_title: Telerik.ReportViewer.Mvc.HtmlHelpers Type
description: "A class that contains a collection of all Telerik Reporting widgets"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/htmlhelpers
published: True
reportingArea: MVCWrapper
---

# The `HtmlHelpers` type of the HTML5 ASP.NET MVC Report Viewer

A class that contains a collection of all Telerik Reporting widgets

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| TelerikReporting(System.Web.Mvc.HtmlHelper) | `Telerik.ReportViewer.Mvc.ITelerikReportingFactory` | A factory used to generate the javascript representation of Telerik Reporting widgets |

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating usage of the HtmlHelpers class by accessing TelerikReporting extension
    // This provides access to the Telerik Reporting widgets for embedding in your view.
    var telerikReportingHelper = HtmlHelpers.TelerikReporting(Html);
}
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
