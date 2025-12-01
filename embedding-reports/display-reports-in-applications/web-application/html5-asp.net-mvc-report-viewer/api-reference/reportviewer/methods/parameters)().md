---
title: Parameters)()
page_title: The Parameters)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the Parameters)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/parameters)()
tags: parameters)
published: True
reportingArea: MVCWrapper
position: 15
---

# The `Parameters)()` method of the ASP.NET MVC Report Viewer

Configures the report parameters display and interaction options. <remarks>Controls how report parameters are displayed and managed within the viewer interface.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

