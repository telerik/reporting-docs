---
title: Telerik.ReportViewer.Html5.WebForms.ClientEvents
page_title: Telerik.ReportViewer.Html5.WebForms.ClientEvents Type
description: "Represents a configuration class that provides properties for initializing client-side event handlers of the HTML5 WebForms ReportViewer control. Used to specify JavaScript function names that will be executed in response to various report viewer events during report rendering, printing, exporting, and user interaction. All event handler properties should contain JavaScript function names (without parentheses) that will be called when the corresponding events occur in the HTML5 ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/clientevents
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
</style>

# The `ClientEvents` type of the HTML5 ASP.NET WebForms Report Viewer

Represents a configuration class that provides properties for initializing client-side event handlers of the HTML5 WebForms ReportViewer control. Used to specify JavaScript function names that will be executed in response to various report viewer events during report rendering, printing, exporting, and user interaction. All event handler properties should contain JavaScript function names (without parentheses) that will be called when the corresponding events occur in the HTML5 ReportViewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Error | `System.String` | Gets or sets the name of the JavaScript function that will be called when an error occurs.<br>The error event is triggered when any error occurs during report processing, rendering, or viewer operations in the HTML5 ReportViewer. |
| ExportBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called prior to starting the report export command.<br>The export begin event is triggered before the HTML5 ReportViewer starts generating the export document. |
| ExportEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the exported document is ready for download, but prior to the actual downloading.<br>The export end event is triggered when the export document is ready but before the download starts. |
| InteractiveActionEnter | `System.String` | Gets or sets the name of the JavaScript function that will be called when the mouse cursor enters the area of a report item's action.<br>The interactive action enter event is triggered when the mouse hovers over interactive report elements in the HTML5 viewer. |
| InteractiveActionExecuting | `System.String` | Gets or sets the name of the JavaScript function that will be called when an interactive action is being executed.<br>The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons in the HTML5 viewer. |
| InteractiveActionLeave | `System.String` | Gets or sets the name of the JavaScript function that will be called when the mouse cursor leaves the area of a report item's action.<br>The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements in the HTML5 viewer. |
| PageReady | `System.String` | Gets or sets the name of the JavaScript function that will be called every time a page from the report is rendered and ready for display.<br>The page ready event is triggered when each individual report page completes rendering and is ready for display in the HTML5 viewer. |
| PrintBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called prior to starting the print report command.<br>The print begin event is triggered before the HTML5 ReportViewer starts generating the print document. |
| PrintEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer.<br>The print end event is triggered when the PDF print document is ready but before actual printing occurs. |
| Ready | `System.String` | Gets or sets the name of the JavaScript function that will be called when the report viewer template is loaded.<br>The ready event is triggered when the HTML5 ReportViewer template and UI components are fully loaded and initialized. |
| RenderingBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called when the rendering of the report begins.<br>The rendering begin event is triggered when the HTML5 ReportViewer starts processing and rendering the report content. |
| RenderingEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the rendering of the report ends.<br>The rendering end event is triggered when the HTML5 ReportViewer completes processing and rendering the report content. |
| UpdateUi | `System.String` | Gets or sets the name of the JavaScript function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports.<br>The UI update event is triggered whenever the HTML5 ReportViewer interface needs to refresh during user interactions. |
| ViewerToolTipOpening | `System.String` | Gets or sets the name of the JavaScript function that will be called when a tooltip is being opened.<br>The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls in the HTML5 viewer. |

