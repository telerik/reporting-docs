---
title: containerStyle
page_title: containerStyle property
description: "CSS styles object for the report viewer's container element."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/containerstyle
published: True
reportingArea: AngularWrapper
---

# containerStyle

CSS styles object for the report viewer's container element.

## Type

`any`

## Examples

````html
<tr-viewer
  [containerStyle]="containerStyle">
</tr-viewer>
````

````typescript
containerStyle: any = {
  position: 'absolute',
  left: '5px',
  right: '5px',
  top: '40px',
  bottom: '5px',
  overflow: 'hidden'
}
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
