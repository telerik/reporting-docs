---
title: serviceType
page_title: serviceType property
description: "Specifies the type of service that the report viewer will connect to."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/servicetype
published: True
reportingArea: NativeAngular
---

# The `serviceType` option of the Native Angular Report Viewer

Specifies the type of service that the report viewer will connect to.

## Type

[`ServiceType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/servicetype%})

## Examples

````html
<reporting-angular-viewer
 [serviceType]="serviceType">
</reporting-angular-viewer>
````

````typescript
serviceType: ServiceType = 'reportServer';
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/native-angular-report-viewer-overview%})
