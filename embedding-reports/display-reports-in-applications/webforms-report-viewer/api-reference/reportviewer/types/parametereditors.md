---
title: Telerik.ReportViewer.Html5.WebForms.ParameterEditors
page_title: Telerik.ReportViewer.Html5.WebForms.ParameterEditors Type
description: "Represents a configuration class that provides properties for initializing parameter editors of the HTML5 WebForms ReportViewer. Used to specify JavaScript function names that will handle different types of report parameters and create appropriate input controls in the HTML5 viewer interface. Enables customization of parameter editing experience by allowing assignment of specific JavaScript editors for different parameter types and scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametereditors
published: True
reportingArea: WebForms
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ParameterEditors` type of the HTML5 ASP.NET WebForms Report Viewer

Represents a configuration class that provides properties for initializing parameter editors of the HTML5 WebForms ReportViewer. Used to specify JavaScript function names that will handle different types of report parameters and create appropriate input controls in the HTML5 viewer interface. Enables customization of parameter editing experience by allowing assignment of specific JavaScript editors for different parameter types and scenarios.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ParameterEditors() | Initializes a new instance of the ParameterEditors class with default settings and an empty custom editors collection. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| BooleanEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle Boolean parameters in the HTML5 viewer.<br>Used for boolean parameter input controls such as checkboxes or toggle buttons for true/false values. |
| CustomEditors | `System.Collections.Generic.List{Telerik.ReportViewer.Html5.WebForms.CustomParameterEditor}` | Gets or sets a collection of custom parameter editors that can handle specialized parameter scenarios in the HTML5 viewer.<br>Custom editors are evaluated before all other editors in the specified order, allowing for complex parameter scenarios like MultiValue DateTime parameters. |
| DateTimeEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle DateTime parameters in the HTML5 viewer.<br>Used for date and time parameter input controls with appropriate date picker functionality. |
| DefaultEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters that don't match any specific type or scenario.<br>Used as a fallback editor for parameters that don't have specific editors assigned in the HTML5 viewer. |
| MultiSelectEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with available values and MultiValue set to true.<br>Used for parameters that allow multiple selections from a predefined list of available values in the HTML5 viewer. |
| MultiValueEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with MultiValue set to true but without provided available values.<br>Used for parameters that allow multiple values but don't have a predefined list of available values in the HTML5 viewer. |
| NumberEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle Numeric parameters in the HTML5 viewer.<br>Used for numeric parameter input controls including integers, decimals, and other numeric types. |
| SingleSelectEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with available values and MultiValue set to false.<br>Used for parameters that allow single selection from a predefined list of available values in the HTML5 viewer. |
| StringEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle String parameters in the HTML5 viewer.<br>Used for text-based parameter input controls for string value entry. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/overview%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/getreportparameters%})
* [RenderDesignTimeHtml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/renderdesigntimehtml%})
* [ToString]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/tostring%})

