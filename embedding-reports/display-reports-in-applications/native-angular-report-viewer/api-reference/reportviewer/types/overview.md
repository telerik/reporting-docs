---
title: Overview
page_title: Types of the Native Angular Report Viewer
description: Object types and interfaces used by the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/overview
tags: overview,types
published: True
reportingArea: NativeAngular
position: 0
---

# Types of the Native Angular Report Viewer

| Type | Description |
| ------ | ------ |
| [ExportFormat]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/exportformat%})|Export format options for the Native Angular Report Viewer.<br>The available export options are:<br>- 'pdf'<br>- 'csv'<br>- 'xlsx'<br>- 'pptx'<br>- 'rtf'<br>- 'image'<br>- 'docx'|
| [PageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/pagemode%})|Page display mode options for the Native Angular Report Viewer.<br>The available page modes are:<br>- 'continuousScroll': Pages are displayed in a continuous scroll mode, allowing users to scroll through the report without page breaks.<br>- 'singlePage': Pages are displayed one at a time, with each page taking up the full viewport.|
| [PrintMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/printmode%})|Print mode options for the Native Angular Report Viewer.<br>Controls how reports are printed, with different modes for handling PDF plugins. The available print modes are:<br>- 'autoSelect': the viewer should automatically decide which option for printing to use depending on browser's version<br>and whether the PDF plug-in is available or not.<br>- 'forcePDFFile': the document for printing will be downloaded as a file (in PDF format with a special 'print' script enabled).<br>- 'forcePDFPlugin': the viewer should always use the PDF plug-in.|
| [ScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/scalemode%})|Scale mode options for the Native Angular Report Viewer.<br>The available scale modes are:<br>- 'fitPageWidth': Pages are scaled proportionally to fit the entire width in the viewer's viewport.<br>- 'fitPage': Pages are scaled proportionally to fit the entire page in the viewport.<br>- 'specific': Pages are scaled with the specific scale value.|
| [ServiceType]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/servicetype%})|Service type options for the Native Angular Report Viewer.<br>The available service types are:<br>- 'REST': A Telerik Reporting REST Service.<br>- 'reportServer': A Telerik Report Server instance.|
| [ViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/viewmode%})|View mode options for the Native Angular Report Viewer.<br>The available view modes are:<br>- 'interactive': A logical layout that removes strict restrictions for report pagination by utilizing a simpler paging algorithm. Enables drill-down interactivity, etc.<br>- 'printPreview': A physical layout in which the report is paged strictly according to its page settings.|
