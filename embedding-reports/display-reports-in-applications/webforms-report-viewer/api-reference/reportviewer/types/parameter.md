---
title: Telerik.ReportViewer.Html5.WebForms.Parameter
page_title: Telerik.ReportViewer.Html5.WebForms.Parameter Type
description: "A parameter passed to the Telerik.Reporting.IReportDocument object when initialized Contains automatic type conversion capabilities to ensure parameter values are properly formatted for report processing."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter
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

# The `Parameter` type of the HTML5 ASP.NET WebForms Report Viewer

A parameter passed to the `Telerik.Reporting.IReportDocument` object when initialized Contains automatic type conversion capabilities to ensure parameter values are properly formatted for report processing.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Name | `System.String` | Gets or sets the name of the parameter that identifies it within the report's parameter collection.<br>Must match the parameter name defined in the report to ensure proper parameter binding during report processing. |
| Value | `System.Object` | Gets or sets the value of the parameter with automatic type conversion for proper report processing.<br>Supports automatic conversion of string values to appropriate data types including integers, decimals, DateTime, TimeSpan, and boolean values for HTML5 report processing. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/overview%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/getreportparameters%})
* [RenderDesignTimeHtml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/renderdesigntimehtml%})
* [ToString]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/tostring%})

