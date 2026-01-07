---
title: Telerik.ReportViewer.Mvc.Editors
page_title: Telerik.ReportViewer.Mvc.Editors Type
description: "Provides configuration options for parameter editor types used in the MVC Report Viewer. Used to specify which input control types should be used for single-select and multi-select parameter scenarios. Controls the visual appearance and interaction behavior of parameter input controls based on parameter configuration."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/editors
published: True
reportingArea: MVCWrapper
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

# The `Editors` type of the HTML5 ASP.NET MVC Report Viewer

Provides configuration options for parameter editor types used in the MVC Report Viewer. Used to specify which input control types should be used for single-select and multi-select parameter scenarios. Controls the visual appearance and interaction behavior of parameter input controls based on parameter configuration.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| MultiSelect | [`Telerik.ReportViewer.Mvc.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/editortypes%}) | Gets or sets the editor type used for parameters that have available values and allow multiple selections.<br>Determines whether multi-select parameters with predefined values use ListView or ComboBox input controls. |
| SingleSelect | [`Telerik.ReportViewer.Mvc.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/editortypes%}) | Gets or sets the editor type used for parameters that have available values and allow only single selection.<br>Determines whether single-select parameters with predefined values use ListView or ComboBox input controls. |

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Create an Editors instance to configure parameter input controls
    var editors = new Editors();

    // Set the control type used for single-select parameters (e.g., ComboBox)
    editors.SingleSelect = EditorTypes.ComboBox;
    // (Only valid values for MultiSelect are those defined in EditorTypes; 
    // some versions may not expose ListBox. Review EditorTypes for allowed values.)
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the Editors configuration for parameters
    .Parameters(new Parameters { Editors = editors })
)
````

