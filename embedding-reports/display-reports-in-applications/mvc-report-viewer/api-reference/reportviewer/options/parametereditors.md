---
title: ParameterEditors
page_title: ParameterEditors property
description: "Provides a fluent way to configure custom parameter editors for the report viewer. Enables replacement of default parameter input controls with custom JavaScript-based editors for enhanced user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parametereditors
published: True
reportingArea: MVCWrapper
---

# The `ParameterEditors` option of the HTML5 ASP.NET MVC Report Viewer

Provides a fluent way to configure custom parameter editors for the report viewer. Enables replacement of default parameter input controls with custom JavaScript-based editors for enhanced user experience.

## Type

`System.Action{Telerik.ReportViewer.Mvc.IParameterEditorsBuilder}`

## Examples

````C#
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

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parameters%})
* [ParametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parametersareaposition%})
* [Telerik.ReportViewer.Mvc.IParameterEditorsBuilder](https://docs.telerik.com/reporting/api/telerik.reportviewer.mvc.iparametereditorsbuilder)

