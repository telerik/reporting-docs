---
title: EnableAccessibility
page_title: EnableAccessibility property
description: "Enables or disables the accessibility features of the report viewer and its contents. Accessibility features include ARIA attributes, keyboard navigation support, and screen reader compatibility."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/enableaccessibility
published: True
reportingArea: MVCWrapper
---

# The `EnableAccessibility` option of the HTML5 ASP.NET MVC Report Viewer

Enables or disables the accessibility features of the report viewer and its contents. Accessibility features include ARIA attributes, keyboard navigation support, and screen reader compatibility.

## Type

`System.Boolean`

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Enable Accessibility Example";
}
@(Html.TelerikReporting().ReportViewer()
    // Set the ID of the viewer
    .Id("reportViewer1")
    // Set the service URL for the REST Service
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Enable the accessibility features in the viewer
    .EnableAccessibility(true)
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
