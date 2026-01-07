---
title: persistSession
page_title: persistSession property
description: "Determines whether to persist the viewer session across browser sessions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: NativeAngular
---

# The `persistSession` option of the Native Angular Report Viewer

Determines whether to persist the viewer session across browser sessions.

## Type

`boolean`

## Examples

````html
<reporting-angular-viewer
  [persistSession]="persistSession">
</reporting-angular-viewer>
````

````typescript
persistSession: boolean = true;
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/overview%})
* [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/printmode%})
* [reportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/reportserver%})

