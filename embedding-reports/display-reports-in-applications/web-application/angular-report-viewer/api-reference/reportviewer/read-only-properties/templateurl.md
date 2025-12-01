---
title: templateUrl
page_title: templateUrl property
description: "Sets the address of the HTML page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/read-only-properties/templateurl
published: True
reportingArea: AngularWrapper
---

# templateUrl

Sets the address of the HTML page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service.

## Type

`string`

## Examples

````html
<tr-viewer
  [templateUrl]="templateUrl">
</tr-viewer>
````

````typescript
templateUrl: string = "https://site.com/path/reportViewerTemplate.html";
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
