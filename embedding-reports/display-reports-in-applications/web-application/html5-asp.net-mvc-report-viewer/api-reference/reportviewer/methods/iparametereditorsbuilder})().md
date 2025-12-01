---
title: IParameterEditorsBuilder})()
page_title: The IParameterEditorsBuilder})() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the IParameterEditorsBuilder})() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/iparametereditorsbuilder})()
tags: iparametereditorsbuilder})
published: True
reportingArea: MVCWrapper
position: 14
---

# The `IParameterEditorsBuilder})()` method of the ASP.NET MVC Report Viewer

Provides a fluent way to configure custom parameter editors for the report viewer. <remarks>Enables replacement of default parameter input controls with custom JavaScript-based editors for enhanced user experience.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{ 
    ViewBag.Title = "Report Viewer with Custom Parameter Editors"; 
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal required parameters
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example usage of ParameterEditors method, supplying a configuration lambda
    .ParameterEditors(editors => {
        // editors is of type IParameterEditorsBuilder
        // Custom editors can be configured here
        // Example: editors.Add<Telerik.Reporting.ParameterTypes.DateTime>("MyDateParameter", "kendo-datepicker");
        // For demonstration, we'll just show the call is possible
    })
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

