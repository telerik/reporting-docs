---
title: serviceUrl
page_title: serviceUrl property
description: "Sets the address of the Report REST Service. Required when not using reportServer configuration."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/serviceurl
published: True
reportingArea: AngularWrapper
---

# serviceUrl

Sets the address of the Report REST Service. Required when not using reportServer configuration.

## Type

`string`

## Examples

````html
<tr-viewer
  [serviceUrl]="serviceUrl">
</tr-viewer>
````

````typescript
serviceUrl: string = 'https://demos.telerik.com/reporting/api/reports';
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
