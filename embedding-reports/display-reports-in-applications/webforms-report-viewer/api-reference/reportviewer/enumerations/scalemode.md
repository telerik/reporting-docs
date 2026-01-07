---
title: Telerik.ReportViewer.Html5.WebForms.ScaleMode
page_title: Telerik.ReportViewer.Html5.WebForms.ScaleMode Enumeration
description: "Specifies the scaling strategy options for the HTML5 WebForms ReportViewer control to determine how reports are sized and displayed within the viewer area. Used to configure automatic sizing behavior and zoom level management for optimal report display and readability in HTML5 viewing scenarios. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements in HTML5 environments."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/scalemode
published: True
reportingArea: WebForms
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

# The `ScaleMode` enumeration of the HTML5 ASP.NET WebForms Report Viewer

Specifies the scaling strategy options for the HTML5 WebForms ReportViewer control to determine how reports are sized and displayed within the viewer area. Used to configure automatic sizing behavior and zoom level management for optimal report display and readability in HTML5 viewing scenarios. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements in HTML5 environments.

## Values

| Value | Description |
| ------ | ------ |
| FitPage | Automatically scales the entire report to fit within the viewer area by adjusting zoom to accommodate both width and height dimensions.<br>Ensures the complete report page is always visible within the HTML5 viewer boundaries regardless of report dimensions, optimizing for full page visibility. |
| FitPageWidth | Automatically scales the report to match the viewer width by zooming to align report width with the available display width.<br>Optimizes horizontal readability in the HTML5 viewer by ensuring report width matches viewer width, potentially requiring vertical scrolling for tall reports. |
| Specific | Uses a custom scale value to control report magnification for precise scaling control independent of viewer dimensions.<br>Requires a specific zoom percentage to be set separately in the HTML5 viewer, providing exact control over report magnification for custom viewing requirements. |

## See Also

* [Enumerations Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/overview%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/getreportparameters%})
* [RenderDesignTimeHtml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/renderdesigntimehtml%})
* [ToString]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/tostring%})

