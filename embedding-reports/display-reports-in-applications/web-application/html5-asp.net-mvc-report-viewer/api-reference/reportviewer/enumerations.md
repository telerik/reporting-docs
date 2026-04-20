---
title: Enumerations
page_title: Enumerations of the HTML5 ASP.NET MVC Report Viewer
description: Enumeration constants used by the HTML5 ASP.NET MVC Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations
tags: enumerations
published: True
reportingArea: MVCWrapper
position: 7
---

# Enumerations of the HTML5 ASP.NET MVC Report Viewer

## DocumentMapAreaPosition

Specifies the positioning options for the Document Map Area within the MVC Report Viewer interface. Used to configure the placement of the document map navigation panel relative to the report content area. The Document Map Area provides hierarchical navigation through report bookmarks and sections.

### Values

| Value | Description |
| ------ | ------ |
| Left | Positions the Document Map Area on the left side of the report content area.<br>Default positioning that displays the document map as a collapsible panel on the left side of the viewer. |
| Right | Positions the Document Map Area on the right side of the report content area.<br>Alternative positioning that displays the document map as a collapsible panel on the right side of the viewer. |


## EditorTypes

Specifies the available parameter editor types for rendering parameter input controls in the MVC Report Viewer. Used to define the visual style and interaction behavior of parameter input controls. Each editor type provides different user experience and visual presentation for parameter value selection.

### Values

| Value | Description |
| ------ | ------ |
| ComboBox | Displays parameter options as a dropdown combo box with expandable selection list.<br>Provides a compact dropdown interface that expands to show available options when clicked. |
| ListView | Displays parameter options as a list view with visible items and selection indicators.<br>Provides a list-based interface where all available options are visible and users can select from displayed items. |


## PageMode

Specifies the page display mode options for the MVC Report Viewer control. Used to configure how report pages are presented and navigated within the viewer interface. Controls the page rendering behavior and user navigation experience within the report viewer.

### Values

| Value | Description |
| ------ | ------ |
| ContinuousScroll | Displays multiple report pages in a continuous scrolling view with on-demand page loading for improved performance.<br>Enables seamless scrolling through large reports by progressively loading additional pages as needed. |
| SinglePage | Displays only one report page at a time within the page area container for focused page-by-page viewing.<br>Provides traditional page navigation with discrete page display for precise page control and smaller memory footprint. |


## ParametersAreaPosition

Specifies the positioning options for the Parameters Area within the MVC Report Viewer interface. Used to configure the placement of the parameters panel relative to the report content area for optimal user experience and interface layout. Controls the visual placement of the parameters input panel to accommodate different screen sizes and layout preferences.

### Values

| Value | Description |
| ------ | ------ |
| Bottom | Positions the Parameters Area below the report content area.<br>Alternative horizontal positioning that displays the parameters panel as a collapsible area at the bottom of the viewer. |
| Left | Positions the Parameters Area on the left side of the report content area.<br>Alternative side positioning that displays the parameters panel as a collapsible area on the left side of the viewer. |
| Right | Positions the Parameters Area on the right side of the report content area.<br>Default positioning that displays the parameters panel as a collapsible area on the right side of the viewer. |
| Top | Positions the Parameters Area above the report content area.<br>Horizontal positioning that displays the parameters panel as a collapsible area at the top of the viewer for wide screen layouts. |


## PrintMode

Specifies the printing method options for the MVC Report Viewer control. Used to configure how the report viewer handles print operations and determines the optimal printing mechanism based on browser capabilities and requirements. Controls the printing behavior to ensure optimal print experience across different browsers and environments.

### Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Automatically determines the best printing method by evaluating browser capabilities and selecting between PDF plugin or file export.<br>Recommended option that intelligently chooses between browser PDF plugin and file export based on browser support and configuration. |
| ForcePDFFile | Forces export of the report to PDF format with embedded print script for automatic printing when the PDF is opened.<br>Generates a PDF file with print script that triggers printing when opened, providing compatibility across all browsers. |
| ForcePDFPlugin | Forces the use of the browser's PDF plugin for printing regardless of browser version, settings, or plugin availability.<br>Ensures PDF plugin usage but may fail if the plugin is not available or properly configured in the user's browser. |


## ScaleMode

Specifies the scale mode options for the MVC Report Viewer control to determine how reports are sized within the viewer area. Used to configure the automatic sizing behavior and zoom level management for optimal report display and readability. Controls the report sizing strategy to optimize readability and user experience based on viewer dimensions and content requirements.

### Values

| Value | Description |
| ------ | ------ |
| FitPage | Automatically scales the entire report to fit within the viewer area by zooming in or out regardless of report dimensions.<br>Ensures the complete report page is always visible within the viewer boundaries by adjusting zoom to accommodate both width and height. |
| FitPageWidth | Automatically scales the report to match the viewer width by zooming in or out to align report width with screen width.<br>Optimizes horizontal readability by ensuring report width matches viewer width, potentially requiring vertical scrolling for tall reports. |
| Specific | Uses a custom scale factor to control report zoom level for precise magnification control.<br>Requires a specific scale value to be set separately, providing exact control over report magnification independent of viewer dimensions. |


## ViewMode

Specifies the display mode options for the MVC Report Viewer control to determine how reports are presented and how users interact with them. Used to configure whether the viewer displays reports in interactive mode with full functionality or print preview mode optimized for printing. Controls the report presentation style and interaction capabilities to optimize user experience for different viewing scenarios.

### Values

| Value | Description |
| ------ | ------ |
| Interactive | Displays the report in its original dimensions with full interactivity enabled and no automatic pagination.<br>Enables drill-through actions, sorting, toggles, and other interactive features while showing the report in its natural size. |
| PrintPreview | Displays the report in paginated format as it would appear when printed on paper with interactivity disabled.<br>Optimizes the display for print layout preview with proper page breaks and margins but without interactive functionality. |

