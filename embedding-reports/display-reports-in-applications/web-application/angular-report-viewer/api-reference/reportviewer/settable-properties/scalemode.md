---
title: scaleMode
page_title: scaleMode property
description: "Sets how the report pages should be scaled. - \"FIT_PAGE_WIDTH\" - pages scaled to fit entire width in viewport. - \"FIT_PAGE\" - pages scaled to fit entire page in viewport. - \"SPECIFIC\" - pages scaled with the scale value."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/scalemode
published: True
reportingArea: AngularWrapper
---

# scaleMode

Sets how the report pages should be scaled.

- "FIT_PAGE_WIDTH" - pages scaled to fit entire width in viewport.
- "FIT_PAGE" - pages scaled to fit entire page in viewport.
- "SPECIFIC" - pages scaled with the scale value.

## Type

`string`

## Examples

````html
<tr-viewer
  [scaleMode]="scaleMode">
</tr-viewer>
````

````typescript
scaleMode: string = "SPECIFIC";
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
