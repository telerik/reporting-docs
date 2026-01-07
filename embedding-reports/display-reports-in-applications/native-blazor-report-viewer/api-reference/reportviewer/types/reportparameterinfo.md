---
title: Telerik.ReportViewer.BlazorNative.ReportParameterInfo
page_title: Telerik.ReportViewer.BlazorNative.ReportParameterInfo Type
description: "Represents detailed information about a report parameter."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparameterinfo
published: True
reportingArea: NativeBlazor
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

# The `ReportParameterInfo` type of the Native Blazor Report Viewer

Represents detailed information about a report parameter.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AllowBlank | `System.Boolean` | Gets or sets a value indicating whether the report parameter allows blank values.<br>Applies only to string parameters. |
| AllowNull | `System.Boolean` | Gets or sets a value indicating whether null values are allowed for the report parameter. |
| AutoRefresh | `System.Boolean` | Gets or sets a value indicating whether the viewer should automatically refresh the report<br>when the parameter's value is changed. If set to false, users need to click a preview button to see the changes. |
| AvailableValues | `System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.ReportParameterValue}` | The list of available values for the report parameter. |
| ChildParameters | `System.Collections.Generic.List{System.String}` | The cascading child parameters associated with the report parameter. |
| HasChildParameters | `System.Boolean` | Gets a value indicating whether the report parameter has cascading child parameters<br>whose values depend on the current parameter's value. |
| Id | `System.String` | The unique identifier for the report parameter. |
| IsVisible | `System.Boolean` | Gets or sets a value indicating whether the report parameter should be visible in the report viewer. |
| Label | `System.Object` | The label of the report parameter. |
| Multivalue | `System.Boolean` | Indicates whether the parameter allows multiple values to be selected. |
| Name | `System.String` | The name of the report parameter. |
| Text | `System.String` | The text associated with the report parameter. |
| Type | `System.String` | Gets the type of the report parameter.<br>Valid types are: Boolean, DateTime, Integer, Float, and String |
| Value | `System.Object` | The value of the report parameter. |

