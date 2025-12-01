---
title: Overview
page_title: Methods of the ASP.NET Web Forms Report Viewer at a Glance
description: Learn more about the Methods of the ASP.NET Web Forms Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: WebFormsWrapper
position: 0
---

<style>
table th:first-of-type {
	width: 35%;
}
table th:nth-of-type(2) {
	width: 65%;
}
</style>

# Methods of the ASP.NET Web Forms Report Viewer

| Method | Description |
| ------ | ------ |
| [GetReportParameters()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/getreportparameters()%})|Gets the processed report parameters as a dictionary of parameter names and string values. <remarks>Provides access to the current parameter values that have been processed and applied to the report in the HTML5 viewer.</remarks>|
| [Object)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/object)()%})|Loads the view state and updates the HTML5 viewer configuration from the saved state data. <remarks>Restores the viewer state and synchronizes client-side changes with server-side properties to maintain consistency across postbacks in the HTML5 viewer.</remarks>|
| [EventArgs)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/eventargs)()%})|Initializes the HTML5 WebForms ReportViewer control during the Init phase of the page lifecycle. <remarks>Updates the viewer state and settings from client-side data before calling the base initialization to ensure proper HTML5 viewer setup and configuration.</remarks>|
| [EventArgs)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/eventargs)()%})|Performs final processing and resource registration before the HTML5 ReportViewer control is rendered to the client. <remarks>Registers necessary JavaScript and CSS resources required for HTML5 viewer functionality including scripts, styles, and client-side initialization code.</remarks>|
| [HtmlTextWriter)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/htmltextwriter)()%})|Renders the HTML5 ReportViewer control by outputting its contents to the specified HTML writer. <remarks>Delegates to RenderContents to output the HTML5 viewer markup without additional wrapper elements for clean HTML5 structure.</remarks>|
| [HtmlTextWriter)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/htmltextwriter)()%})|Renders the HTML5 ReportViewer control contents by writing the viewer markup to the specified HTML writer. <remarks>Generates the complete HTML5 viewer markup including container elements, initialization scripts, and configuration options for client-side rendering.</remarks>|
| [HtmlTextWriter)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/htmltextwriter)()%})|Renders the HTML5 ReportViewer control for design-time display in Visual Studio designer. <remarks>Generates a simplified HTML representation of the HTML5 viewer for Visual Studio design surface display, showing the control dimensions and identification.</remarks>|
| [ToString()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/tostring()%})|Converts the HTML5 ReportViewer control to its HTML string representation with all configuration options and client-side initialization. <remarks>Generates the final HTML output by populating viewer options and using ReportViewerWriter to create the complete HTML5 viewer structure with JavaScript initialization.</remarks>|

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
