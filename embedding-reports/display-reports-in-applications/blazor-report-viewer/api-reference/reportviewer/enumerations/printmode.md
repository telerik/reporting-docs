---
title: Telerik.ReportViewer.Blazor.PrintMode
page_title: Telerik.ReportViewer.Blazor.PrintMode Enumeration
description: "Specifies the printing behavior of the report viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/printmode
published: True
reportingArea: BlazorWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `PrintMode` enumeration of the Blazor Report Viewer

Specifies the printing behavior of the report viewer.

## Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file. |
| ForcePDFFile | Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. |
| ForcePDFPlugin | Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings. |

## See Also

* [Enumerations Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymapasync%})

