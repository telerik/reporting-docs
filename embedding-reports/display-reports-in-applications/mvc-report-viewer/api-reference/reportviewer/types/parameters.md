---
title: Telerik.ReportViewer.Mvc.Parameters
page_title: Telerik.ReportViewer.Mvc.Parameters Type
description: "Provides configuration options for report parameters display and behavior within the MVC Report Viewer. Used to customize how parameter input controls are rendered and how users interact with report parameters. Contains editor configuration settings that control the appearance and functionality of parameter input controls."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/parameters
published: True
reportingArea: MVCWrapper
---

# The `Parameters` type of the HTML5 ASP.NET MVC Report Viewer

Provides configuration options for report parameters display and behavior within the MVC Report Viewer. Used to customize how parameter input controls are rendered and how users interact with report parameters. Contains editor configuration settings that control the appearance and functionality of parameter input controls.

## Constructors

| Constructor | Description |
| ------ | ------ |
| Parameters() | Initializes a new instance of the Parameters class with default settings. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Editors | [`Telerik.ReportViewer.Mvc.Editors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/editors%}) | Gets or sets the parameter editors configuration that defines the types of input controls used for different parameter scenarios.<br>Configures whether parameters with available values use ListView or ComboBox editors for single and multi-select scenarios. |

## Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating how to use the Telerik.ReportViewer.Mvc.Parameters class
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Configures parameters using the Parameters class
    .Parameters(new Parameters())
)
````

