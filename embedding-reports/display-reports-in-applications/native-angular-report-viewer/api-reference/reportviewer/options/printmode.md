---
title: printMode
page_title: printMode property
description: "Sets the print mode for the report viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: NativeAngular
---

# The `printMode` option of the Native Angular Report Viewer

Sets the print mode for the report viewer.

## Type

[`PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/printmode%})

## Examples

````html
<reporting-angular-viewer
  [printMode]="printMode">
</reporting-angular-viewer>
````

````typescript
printMode: PrintMode = 'forcePDFFile';
````

