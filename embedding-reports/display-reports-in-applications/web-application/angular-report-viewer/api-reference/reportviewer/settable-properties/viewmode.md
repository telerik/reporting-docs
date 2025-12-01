---
title: viewMode
page_title: viewMode property
description: "Sets if the report is displayed in interactive mode or print preview. - \"INTERACTIVE\" - enables drill-down interactivity. - \"PRINT_PREVIEW\" - report paged according to page settings."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/viewmode
published: True
reportingArea: AngularWrapper
---

# viewMode

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

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
