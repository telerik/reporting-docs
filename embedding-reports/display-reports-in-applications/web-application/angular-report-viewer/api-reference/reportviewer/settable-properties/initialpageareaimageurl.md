---
title: initialPageAreaImageUrl
page_title: initialPageAreaImageUrl property
description: "The image URL for the PageArea background image. Used only when parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/initialpageareaimageurl
published: True
reportingArea: AngularWrapper
---

# initialPageAreaImageUrl

The image URL for the PageArea background image. Used only when parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.

## Type

`string`

## Examples

````html
<tr-viewer
  [initialPageAreaImageUrl]="initialPageAreaImageUrl">
</tr-viewer>
````

````typescript
initialPageAreaImageUrl: string = "https://site.com/path/initialPageAreaImage.png";
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
