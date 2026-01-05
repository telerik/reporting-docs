---
title: Telerik.ReportViewer.Html5.WebForms.PrintMode
page_title: Telerik.ReportViewer.Html5.WebForms.PrintMode Enumeration
description: "Specifies the print handling strategy options for the HTML5 WebForms ReportViewer control. Used to determine how the viewer processes print commands and handles PDF generation for optimal printing experience across different browsers and environments. Controls the print workflow strategy to accommodate different browser capabilities and user preferences for PDF handling in HTML5 report viewing scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/printmode
published: True
reportingArea: WebForms
---

# The `PrintMode` enumeration of the HTML5 ASP.NET WebForms Report Viewer

Specifies the print handling strategy options for the HTML5 WebForms ReportViewer control. Used to determine how the viewer processes print commands and handles PDF generation for optimal printing experience across different browsers and environments. Controls the print workflow strategy to accommodate different browser capabilities and user preferences for PDF handling in HTML5 report viewing scenarios.

## Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Automatically determines the optimal print method by choosing between browser PDF plugin or PDF file export based on browser capabilities and settings.<br>Provides intelligent selection of print method to ensure compatibility across different browsers and PDF plugin configurations in HTML5 environments. |
| ForcePDFFile | Forces the export of the report document to PDF format with print script enabled for download-based printing.<br>Generates a downloadable PDF file with embedded print script for environments where PDF plugins are unavailable or unreliable. |
| ForcePDFPlugin | Forces the use of the browser's PDF plugin for printing regardless of browser version and configuration settings.<br>Ensures consistent PDF plugin usage for direct browser printing when plugin availability and compatibility are guaranteed. |

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
