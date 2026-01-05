---
title: printMode
page_title: printMode property
description: "Specifies how the viewer should print reports. - \"AUTO_SELECT\" - automatically decide based on browser and PDF plugin availability. - \"FORCE_PDF_FILE\" - download document as PDF file with print script. - \"FORCE_PDF_PLUGIN\" - always use PDF plugin."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: AngularWrapper
---

# The `printMode` option of the Angular Report Viewer

Specifies how the viewer should print reports.

- "AUTO_SELECT" - automatically decide based on browser and PDF plugin availability.
- "FORCE_PDF_FILE" - download document as PDF file with print script.
- "FORCE_PDF_PLUGIN" - always use PDF plugin.

## Type

`string`

## Examples

````html
<tr-viewer
  [printMode]="printMode">
</tr-viewer>
````

````typescript
printMode: string = "FORCE_PDF_FILE";
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
