---
title: viewMode
page_title: viewMode property
description: "Sets if the report is displayed in interactive mode or print preview. - \"INTERACTIVE\" - enables drill-down interactivity. - \"PRINT_PREVIEW\" - report paged according to page settings."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/viewmode
published: True
reportingArea: AngularWrapper
---

# The `viewMode` option of the Angular Report Viewer

Sets if the report is displayed in interactive mode or print preview.

- "INTERACTIVE" - enables drill-down interactivity.
- "PRINT_PREVIEW" - report paged according to page settings.

## Type

`string`

## Examples

````html
<tr-viewer
  [viewMode]="viewMode">
</tr-viewer>
````

````typescript
viewMode: string = "PRINT_PREVIEW";
````



