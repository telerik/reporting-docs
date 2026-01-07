---
title: serviceUrl
page_title: serviceUrl property
description: "Sets the address of the Reporting REST Service. Required when serviceType is 'REST'."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/serviceurl
published: True
reportingArea: NativeAngular
---

# The `serviceUrl` option of the Native Angular Report Viewer

Sets the address of the Reporting REST Service. Required when serviceType is 'REST'.

## Type

`string`

## Examples

````html
<reporting-angular-viewer
 [serviceUrl]="serviceUrl">
</reporting-angular-viewer>
````

````typescript
serviceUrl: string = 'https://demos.telerik.com/reporting/api/reports';
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/overview%})
* [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/viewmode%})
* [width]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/width%})

