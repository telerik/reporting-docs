---
title: Enumerations
page_title: Enumerations of the Blazor Report Viewer
description: Enumeration constants used by the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations
tags: enumerations
published: True
reportingArea: BlazorWrapper
position: 7
---

# Enumerations of the Blazor Report Viewer

## DocumentMapAreaPosition

Specifies where the Document Map Area should be displayed.

### Values

| Value | Description |
| ------ | ------ |
| Left | Displays the Document Map Area on the left side of the page view. |
| Right | Displays the Document Map Area on the right side of the page view. |


## EditorType

Specifies the available built-in editor types.

### Values

| Value | Description |
| ------ | ------ |
| ComboBox | Represents the Kendo UI for jQuery ComboBox widget. |
| ListView | Represents the Kendo UI for jQuery ListView widget. |


## Event

Specifies the available built-in events that can be used with [`BindAsync`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods%}#bindasync) and [`UnbindAsync`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods%}#unbindasync).

### Values

| Value | Description |
| ------ | ------ |
| Error | Occurs when an error is thrown in the report viewer. |
| ExportBegin | Occurs before exporting the report. |
| ExportEnd | Occurs after exporting the report. |
| InteractiveActionEnter | Occurs when the mouse cursor enters the area of an interactive action. |
| InteractiveActionExecuting | Occurs before an interactive action is executed, providing the ability to cancel the execution. |
| InteractiveActionLeave | Occurs when the mouse cursor leaves the area of an interactive action. |
| PageReady | Occurs after a page of the report is ready. |
| PrintBegin | Occurs before printing the report. |
| PrintEnd | Occurs after printing the report. |
| Ready | Occurs when the viewer content has been loaded from the template and is ready to display reports or perform any other <br>operations on it. The function is executed in the context of the ReportViewer object that is available through this object. |
| RenderingBegin | Occurs before rendering the report. |
| RenderingEnd | Occurs after rendering the report. |
| SendEmailBegin | Occurs before the report is exported and the email message is sent. |
| SendEmailEnd | Occurs after the report is exported and the email message is sent. |
| UpdateUi | Occurs when the UI state of the viewer changes. |
| ViewerTooltipOpening | Occurs before a tooltip is opened, providing the ability to cancel its opening. |


## PageMode

Specifies the page mode for the report viewer control.

### Values

| Value | Description |
| ------ | ------ |
| ContinuousScroll | Displays a large number of report pages by appending additional pages on demand. |
| SinglePage | Displays only one report page in the page area container. |


## ParametersAreaPosition

Specifies where the Parameters Area should be displayed.

### Values

| Value | Description |
| ------ | ------ |
| Bottom | Displays the Parameters Area on the bottom of the page view. |
| Left | Displays the Parameters Area on the left side of the page view. |
| Right | Displays the Parameters Area on the right side of the page view. |
| Top | Displays the Parameters Area on the top of the page view. |


## PrintMode

Specifies the printing behavior of the report viewer.

### Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or by exporting to a PDF file. |
| ForcePDFFile | Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. |
| ForcePDFPlugin | Specifies that the viewer should always use the PDF plug-in regardless of the browser's version and settings. |


## ScaleMode

Specifies the scale mode of the report viewer.

### Values

| Value | Description |
| ------ | ------ |
| FitPage | The whole report will fit on the page (will zoom in or out), regardless of its width and height. |
| FitPageWidth | The report will be zoomed in or out so that the width of the screen and the width of the report match. |
| Specific | Uses the scale property to zoom the report in or out. |


## ViewMode

Specifies whether the report viewer is in interactive or print preview mode.

### Values

| Value | Description |
| ------ | ------ |
| Interactive | Displays the report in its original width and height with no paging. Interactivity is enabled. |
| PrintPreview | Displays the paginated report as if it is printed on paper. Interactivity is disabled. |

