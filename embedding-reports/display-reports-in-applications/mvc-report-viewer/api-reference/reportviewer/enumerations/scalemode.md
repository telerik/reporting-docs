---
title: Telerik.ReportViewer.Mvc.ScaleMode
page_title: Telerik.ReportViewer.Mvc.ScaleMode Enumeration
description: "Specifies the scale mode options for the MVC Report Viewer control to determine how reports are sized within the viewer area. Used to configure the automatic sizing behavior and zoom level management for optimal report display and readability. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/scalemode
published: True
reportingArea: MVCWrapper
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

# The `ScaleMode` enumeration of the HTML5 ASP.NET MVC Report Viewer

Specifies the scale mode options for the MVC Report Viewer control to determine how reports are sized within the viewer area. Used to configure the automatic sizing behavior and zoom level management for optimal report display and readability. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements.

## Values

| Value | Description |
| ------ | ------ |
| FitPage | Automatically scales the entire report to fit within the viewer area by zooming in or out regardless of report dimensions.<br>Ensures the complete report page is always visible within the viewer boundaries by adjusting zoom to accommodate both width and height. |
| FitPageWidth | Automatically scales the report to match the viewer width by zooming in or out to align report width with screen width.<br>Optimizes horizontal readability by ensuring report width matches viewer width, potentially requiring vertical scrolling for tall reports. |
| Specific | Uses a custom scale factor to control report zoom level for precise magnification control.<br>Requires a specific scale value to be set separately, providing exact control over report magnification independent of viewer dimensions. |

## See Also

* [Enumerations Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/overview%})
* [AccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/accessibilitykeymap%})
* [AuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/authenticationtoken%})
* [CheckedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})

