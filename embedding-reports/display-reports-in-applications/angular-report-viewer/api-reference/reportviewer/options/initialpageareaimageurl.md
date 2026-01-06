---
title: initialPageAreaImageUrl
page_title: initialPageAreaImageUrl property
description: "The image URL for the PageArea background image. Used only when parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl
published: True
reportingArea: AngularWrapper
---

# The `initialPageAreaImageUrl` option of the Angular Report Viewer

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



