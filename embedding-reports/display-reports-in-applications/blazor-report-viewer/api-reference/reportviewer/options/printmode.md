---
title: PrintMode
page_title: PrintMode property
description: "Gets or sets the print mode of the viewer. Three modes exist currently: AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file. ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings. ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: BlazorWrapper
---

# The `PrintMode` option of the Blazor Report Viewer

Gets or sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file.
- ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled.

## Type

[`Telerik.ReportViewer.Blazor.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/printmode%})

## Examples

````C#
<ReportViewer PrintMode="PrintMode.ForcePDFPlugin" />
````

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
* [PrintMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/printmode%})
