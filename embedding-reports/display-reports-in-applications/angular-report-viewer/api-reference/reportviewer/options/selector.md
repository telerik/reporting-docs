---
title: selector
page_title: selector property
description: "A selector used in conjunction with the data attributes. Required when commands are attached to elements outside the viewer via data attributes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/selector
published: True
reportingArea: AngularWrapper
---

# The `selector` option of the Angular Report Viewer

A selector used in conjunction with the data attributes. Required when commands are attached to elements outside the viewer via data attributes.

## Type

`string`

## Examples

````html
<tr-viewer
  [selector]="selector">
</tr-viewer>
````

````typescript
selector: string = ".my-custom-selector";
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/overview%})
* [sendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/sendemail%})
* [serviceUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/serviceurl%})

