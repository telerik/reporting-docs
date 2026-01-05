---
title: Telerik.ReportViewer.Blazor.ParameterEditor
page_title: Telerik.ReportViewer.Blazor.ParameterEditor Type
description: "Specifies the parameter editor functions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/parametereditor
published: True
reportingArea: BlazorWrapper
---

# The `ParameterEditor` type of the Blazor Report Viewer

Specifies the parameter editor functions.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditor | `System.String` | Gets or sets the createEditor function name that creates the parameter editor UI and wires it to the<br>parameterChanged callback when a new value is selected. The return result is a new object containing<br>the beginEdit method which is the entry point for creating the editor from the viewer. |
| Match | `System.String` | Gets or sets the match function name that accepts a report parameter to be edited as an argument<br>and returns a boolean value that indicates whether the parameter editor is suitable for this parameter. |

