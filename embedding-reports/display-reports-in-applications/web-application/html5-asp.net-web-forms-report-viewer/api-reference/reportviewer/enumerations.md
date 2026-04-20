---
title: Enumerations
page_title: Enumerations of the HTML5 ASP.NET WebForms Report Viewer
description: Enumeration constants used by the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations
tags: enumerations
published: True
reportingArea: WebForms
position: 7
---

# Enumerations of the HTML5 ASP.NET WebForms Report Viewer

## DocumentMapAreaPosition

Specifies the positioning options for the Document Map Area within the HTML5 WebForms ReportViewer interface. Used to configure the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout. Controls the visual placement of the document map panel to accommodate different screen sizes and layout preferences in HTML5 report viewing scenarios.

### Values

| Value | Description |
| ------ | ------ |
| Left | Positions the Document Map Area on the left side of the report content area.<br>Displays the document map navigation panel as a collapsible area on the left side of the HTML5 viewer interface. |
| Right | Positions the Document Map Area on the right side of the report content area.<br>Displays the document map navigation panel as a collapsible area on the right side of the HTML5 viewer interface. |


## EditorTypes

Specifies the available parameter editor types for rendering parameter input controls in the HTML5 WebForms ReportViewer. Used to define the visual style and interaction behavior of parameter input controls. Each editor type provides different user experience and visual presentation for parameter value selection.

### Values

| Value | Description |
| ------ | ------ |
| ComboBox | Displays parameter options as a dropdown combo box with expandable selection list.<br>Provides a compact dropdown interface that expands to show available options when clicked. |
| ListView | Displays parameter options as a list view with visible items and selection indicators.<br>Provides a list-based interface where all available options are visible and users can select from displayed items. |


## IdentifierType

Specifies the identifier type options used in the HTML5 WebForms ReportViewer ReportSource configuration. Used to determine how report identifiers are interpreted and resolved when loading reports in the HTML5 viewer. Controls the report resolution strategy based on the type of identifier provided, enabling support for different report source configurations in HTML5 viewing scenarios.

### Values

| Value | Description |
| ------ | ------ |
| CustomReportSource | Indicates that the identifier represents a custom report source requiring user-implemented resolution logic.<br>Used when the identifier follows a custom format that requires application-specific resolution logic to locate and load the report. |
| TypeReportSource | Indicates that the identifier represents a report type for creating TypeReportSource instances.<br>Used when the identifier is a fully qualified type name that references a report class for strongly-typed report loading. |
| UriReportSource | Indicates that the identifier represents a URI pointing to a .trdp/.trdx report file for creating UriReportSource instances.<br>Used when the identifier is a file path or URI that points to a report definition file stored on disk or accessible via URL. |


## PageMode

Specifies the page display mode options for the HTML5 WebForms ReportViewer control to determine how report pages are presented and navigated. Used to configure whether the viewer displays reports in continuous scrolling mode with progressive loading or single page mode for focused viewing. Controls the page rendering behavior and user navigation experience within the HTML5 report viewer interface.

### Values

| Value | Description |
| ------ | ------ |
| ContinuousScroll | Displays multiple report pages in a continuous scrolling view with on-demand page loading for improved performance and seamless navigation.<br>Enables seamless scrolling through large reports by progressively loading additional pages as needed, optimizing memory usage and user experience. |
| SinglePage | Displays only one report page at a time within the viewer area for focused page-by-page viewing and navigation.<br>Provides traditional page navigation with discrete page display for precise page control and optimal performance with smaller memory footprint. |


## ParametersAreaPosition

Specifies the positioning options for the Parameters Area within the HTML5 WebForms ReportViewer interface. Used to configure the placement of the parameter input controls relative to the report content area for optimal user experience and interface layout. Controls the visual placement of the parameters panel to accommodate different screen sizes and layout preferences in HTML5 report viewing scenarios.

### Values

| Value | Description |
| ------ | ------ |
| Bottom | Positions the Parameters Area at the bottom of the report content area.<br>Displays the parameter input controls as a horizontal panel below the HTML5 viewer interface. |
| Left | Positions the Parameters Area on the left side of the report content area.<br>Displays the parameter input controls as a panel on the left side of the HTML5 viewer interface. |
| Right | Positions the Parameters Area on the right side of the report content area.<br>Displays the parameter input controls as a panel on the right side of the HTML5 viewer interface. |
| Top | Positions the Parameters Area at the top of the report content area.<br>Displays the parameter input controls as a horizontal panel above the HTML5 viewer interface. |


## PrintMode

Specifies the print handling strategy options for the HTML5 WebForms ReportViewer control. Used to determine how the viewer processes print commands and handles PDF generation for optimal printing experience across different browsers and environments. Controls the print workflow strategy to accommodate different browser capabilities and user preferences for PDF handling in HTML5 report viewing scenarios.

### Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Automatically determines the optimal print method by choosing between browser PDF plugin or PDF file export based on browser capabilities and settings.<br>Provides intelligent selection of print method to ensure compatibility across different browsers and PDF plugin configurations in HTML5 environments. |
| ForcePDFFile | Forces the export of the report document to PDF format with print script enabled for download-based printing.<br>Generates a downloadable PDF file with embedded print script for environments where PDF plugins are unavailable or unreliable. |
| ForcePDFPlugin | Forces the use of the browser's PDF plugin for printing regardless of browser version and configuration settings.<br>Ensures consistent PDF plugin usage for direct browser printing when plugin availability and compatibility are guaranteed. |


## ScaleMode

Specifies the scaling strategy options for the HTML5 WebForms ReportViewer control to determine how reports are sized and displayed within the viewer area. Used to configure automatic sizing behavior and zoom level management for optimal report display and readability in HTML5 viewing scenarios. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements in HTML5 environments.

### Values

| Value | Description |
| ------ | ------ |
| FitPage | Automatically scales the entire report to fit within the viewer area by adjusting zoom to accommodate both width and height dimensions.<br>Ensures the complete report page is always visible within the HTML5 viewer boundaries regardless of report dimensions, optimizing for full page visibility. |
| FitPageWidth | Automatically scales the report to match the viewer width by zooming to align report width with the available display width.<br>Optimizes horizontal readability in the HTML5 viewer by ensuring report width matches viewer width, potentially requiring vertical scrolling for tall reports. |
| Specific | Uses a custom scale value to control report magnification for precise scaling control independent of viewer dimensions.<br>Requires a specific zoom percentage to be set separately in the HTML5 viewer, providing exact control over report magnification for custom viewing requirements. |


## ViewMode

Specifies the display mode options for the HTML5 WebForms ReportViewer control to determine how reports are presented and how users interact with them. Used to configure whether the viewer displays reports in interactive mode with full functionality or print preview mode optimized for printing. Controls the report presentation style and interaction capabilities to optimize user experience for different viewing scenarios in HTML5 environments.

### Values

| Value | Description |
| ------ | ------ |
| Interactive | Displays the report in its original dimensions with full interactivity enabled and no automatic pagination.<br>Enables drill-through actions, sorting, toggles, and other interactive features while showing the report in its natural size within the HTML5 viewer interface. |
| PrintPreview | Displays the paginated report as it would appear when printed on paper with interactivity disabled.<br>Optimizes the display for print layout preview with proper page breaks and margins but without interactive functionality in the HTML5 viewer environment. |

