---
title: Types
page_title: Types of the Native Angular Report Viewer
description: Object types and interfaces used by the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: NativeAngular
position: 6
---

# Types of the Native Angular Report Viewer

## ExportFormat

Export format options for the Native Angular Report Viewer.
The available export options are:

- 'pdf'
- 'csv'
- 'xlsx'
- 'pptx'
- 'rtf'
- 'image'
- 'docx'

### Type Definition

````typescript
type ExportFormat = "pdf" | "csv" | "xlsx" | "pptx" | "rtf" | "image" | "docx";
````


## PageMode

Page display mode options for the Native Angular Report Viewer.
The available page modes are:

- 'continuousScroll': Pages are displayed in a continuous scroll mode, allowing users to scroll through the report without page breaks.
- 'singlePage': Pages are displayed one at a time, with each page taking up the full viewport.

### Type Definition

````typescript
type PageMode = "continuousScroll" | "singlePage";
````


## PrintMode

Print mode options for the Native Angular Report Viewer.
Controls how reports are printed, with different modes for handling PDF plugins. The available print modes are:

- 'autoSelect': the viewer should automatically decide which option for printing to use depending on browser's version
and whether the PDF plug-in is available or not.
- 'forcePDFFile': the document for printing will be downloaded as a file (in PDF format with a special 'print' script enabled).
- 'forcePDFPlugin': the viewer should always use the PDF plug-in.

### Type Definition

````typescript
type PrintMode = "autoSelect" | "forcePDFPlugin" | "forcePDFFile";
````


## ScaleMode

Scale mode options for the Native Angular Report Viewer.
The available scale modes are:

- 'fitPageWidth': Pages are scaled proportionally to fit the entire width in the viewer's viewport.
- 'fitPage': Pages are scaled proportionally to fit the entire page in the viewport.
- 'specific': Pages are scaled with the specific scale value.

### Type Definition

````typescript
type ScaleMode = "fitPageWidth" | "fitPage" | "specific";
````


## ServiceType

Service type options for the Native Angular Report Viewer.
The available service types are:

- 'REST': A Telerik Reporting REST Service.
- 'reportServer': A Telerik Report Server instance.

### Type Definition

````typescript
type ServiceType = "REST" | "reportServer";
````


## ViewMode

View mode options for the Native Angular Report Viewer.
The available view modes are:

- 'interactive': A logical layout that removes strict restrictions for report pagination by utilizing a simpler paging algorithm. Enables drill-down interactivity, etc.
- 'printPreview': A physical layout in which the report is paged strictly according to its page settings.

### Type Definition

````typescript
type ViewMode = "interactive" | "printPreview";
````

