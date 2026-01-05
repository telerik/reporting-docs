---
title: Telerik.ReportViewer.Html5.WebForms.CustomParameterEditor
page_title: Telerik.ReportViewer.Html5.WebForms.CustomParameterEditor Type
description: "Represents a custom parameter editor configuration with JavaScript function references for parameter matching and editor creation in the HTML5 WebForms ReportViewer. Used to define custom parameter editors that provide specialized input controls for specific parameter types or scenarios. Enables extensibility of the parameter editing experience by allowing custom JavaScript functions to determine parameter applicability and create custom editor interfaces."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/customparametereditor
published: True
reportingArea: WebForms
---

# The `CustomParameterEditor` type of the HTML5 ASP.NET WebForms Report Viewer

Represents a custom parameter editor configuration with JavaScript function references for parameter matching and editor creation in the HTML5 WebForms ReportViewer. Used to define custom parameter editors that provide specialized input controls for specific parameter types or scenarios. Enables extensibility of the parameter editing experience by allowing custom JavaScript functions to determine parameter applicability and create custom editor interfaces.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditorFunction | `System.String` | Gets or sets the name of the JavaScript function that creates the custom editor control for parameters that match the criteria.<br>The function name should be specified without parentheses and must reference a JavaScript function that returns a custom editor control for parameter input in the HTML5 viewer. |
| MatchFunction | `System.String` | Gets or sets the name of the JavaScript match function that determines whether this custom editor should be used for a specific parameter.<br>The function name should be specified without parentheses and must reference a JavaScript function that returns true if the editor should be used for the given parameter. |

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
