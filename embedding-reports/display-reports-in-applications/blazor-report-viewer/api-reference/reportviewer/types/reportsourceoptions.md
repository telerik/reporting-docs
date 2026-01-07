---
title: Telerik.ReportViewer.Blazor.ReportSourceOptions
page_title: Telerik.ReportViewer.Blazor.ReportSourceOptions Type
description: "Specifies the report and initial report parameter values to be displayed in the report viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions
published: True
reportingArea: BlazorWrapper
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

# The `ReportSourceOptions` type of the Blazor Report Viewer

Specifies the report and initial report parameter values to be displayed in the report viewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameters | `System.Collections.Generic.IDictionary{System.String,System.Object}` | Gets or sets an object with properties name/value equal to the report parameters names and values used in the report definition. |
| Report | `System.String` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.<br>On the server side this string will be converted to a ReportSource through an IReportResolver. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/events/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/getaccessibilitykeymapasync%})

