---
title: Telerik.ReportViewer.Mvc.PrintMode
page_title: Telerik.ReportViewer.Mvc.PrintMode Enumeration
description: "Specifies the printing method options for the MVC Report Viewer control. Used to configure how the report viewer handles print operations and determines the optimal printing mechanism based on browser capabilities and requirements. Controls the printing behavior to ensure optimal print experience across different browsers and environments."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/printmode
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

# The `PrintMode` enumeration of the HTML5 ASP.NET MVC Report Viewer

Specifies the printing method options for the MVC Report Viewer control. Used to configure how the report viewer handles print operations and determines the optimal printing mechanism based on browser capabilities and requirements. Controls the printing behavior to ensure optimal print experience across different browsers and environments.

## Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Automatically determines the best printing method by evaluating browser capabilities and selecting between PDF plugin or file export.<br>Recommended option that intelligently chooses between browser PDF plugin and file export based on browser support and configuration. |
| ForcePDFFile | Forces export of the report to PDF format with embedded print script for automatic printing when the PDF is opened.<br>Generates a PDF file with print script that triggers printing when opened, providing compatibility across all browsers. |
| ForcePDFPlugin | Forces the use of the browser's PDF plugin for printing regardless of browser version, settings, or plugin availability.<br>Ensures PDF plugin usage but may fail if the plugin is not available or properly configured in the user's browser. |

