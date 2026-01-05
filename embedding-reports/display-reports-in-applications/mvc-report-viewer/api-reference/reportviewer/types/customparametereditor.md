---
title: Telerik.ReportViewer.Mvc.CustomParameterEditor
page_title: Telerik.ReportViewer.Mvc.CustomParameterEditor Type
description: "Represents a custom parameter editor configuration for the MVC Report Viewer, enabling custom UI components for report parameter input. Both functions are executed in the client-side JavaScript context of the MVC Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types/customparametereditor
published: True
reportingArea: MVCWrapper
---

# The `CustomParameterEditor` type of the HTML5 ASP.NET MVC Report Viewer

Represents a custom parameter editor configuration for the MVC Report Viewer, enabling custom UI components for report parameter input. Both functions are executed in the client-side JavaScript context of the MVC Report Viewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditorFunction | `System.String` | Gets or sets the name of the JavaScript function that creates the custom parameter editor UI element. |
| MatchFunction | `System.String` | Gets or sets the name of the JavaScript match function that determines whether to use this custom editor for a specific parameter. |

## Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example of instantiating and configuring a CustomParameterEditor
    var customEditor = new CustomParameterEditor
    {
        // JavaScript function string that creates the custom editor UI
        CreateEditorFunction = "function (parameter, options) { /* custom editor implementation */ }",
        // JavaScript function string that matches this editor to parameters
        MatchFunction = "function (parameter) { return parameter.name === 'MyParameter'; }"
    };
}
````

