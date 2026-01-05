---
title: Parameters
page_title: Parameters property
description: "Configures the report parameters display and interaction options. Controls how report parameters are displayed and managed within the viewer interface."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parameters
published: True
reportingArea: MVCWrapper
---

# The `Parameters` option of the HTML5 ASP.NET MVC Report Viewer

Configures the report parameters display and interaction options. Controls how report parameters are displayed and managed within the viewer interface.

## Type

[`Telerik.ReportViewer.Mvc.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/parameters%})

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "ReportViewer Parameters Example";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimum config: id and service url -- these are required for any viewer.
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example: Configure parameter editors, such as using ComboBox for single select parameter editors
    .Parameters(new Parameters { Editors = new Editors { SingleSelect = EditorTypes.ComboBox } })
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/parameters%})
