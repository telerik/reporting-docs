---
title: Enumerations
page_title: Enumerations of the Native Blazor Report Viewer
description: Enumeration constants used by the Native Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations
tags: enumerations
published: True
reportingArea: NativeBlazor
position: 7
---

# Enumerations of the Native Blazor Report Viewer

## PageMode

Sets if the report is displayed in Single page or Continuous scroll mode.

### Values

| Value | Description |
| ------ | ------ |
| ContinuousScroll | More than one page could be loaded in the view port. Paged are loaded on demand during scroll. |
| SinglePage | Only one page is loaded in the view port at any time. |


## PrintMode

Specifies the printing behavior of the report viewer.

### Values

| Value | Description |
| ------ | ------ |
| AutoSelect | Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file. |
| ForcePDFFile | Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled. |
| ForcePDFPlugin | Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings. |


## ReportViewerServiceType

Specifies the type of service the ReportViewer is using.

### Values

| Value | Description |
| ------ | ------ |
| REST | Specifies that the viewer is using a REST API service. |
| ReportServer | Specifies that the viewer is using a ReportServer instance. |


## ScaleMode

Sets the scale mode of the viewer.

### Values

| Value | Description |
| ------ | ------ |
| FitPage | The whole report will fit on the page (will zoom in or out), regardless of its width and height. |
| FitPageWidth | The report will be zoomed in or out so that the width of the screen and the width of the report match. |
| Specific | Uses the scale to zoom in and out the report. |


## ViewMode

Specifies whether the viewer is in interactive or print preview mode.

### Values

| Value | Description |
| ------ | ------ |
| Interactive | Displays the report in its original width and height with no paging. Additionally interactivity is enabled. |
| PrintPreview | Displays the paginated report as if it is printed on paper. Interactivity is not enabled. |

