---
title: scale
page_title: scale property
description: "Sets the scale factor for the report pages. The scale takes effect when the scaleMode is set to 'specific'."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/scale
published: True
reportingArea: NativeAngular
---

# The `scale` option of the Native Angular Report Viewer

Sets the scale factor for the report pages. The scale takes effect when the scaleMode is set to 'specific'.

## Type

`number`

## Examples

````html
<reporting-angular-viewer
 [scale]="scale">
</reporting-angular-viewer>
````

````typescript
scale: number = 1.5 // 150% scale
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/overview%})
* [scaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/scalemode%})
* [serviceType]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/servicetype%})

