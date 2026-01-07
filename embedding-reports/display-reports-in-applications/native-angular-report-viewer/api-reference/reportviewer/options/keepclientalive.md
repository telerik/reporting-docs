---
title: keepClientAlive
page_title: keepClientAlive property
description: "Determines whether to keep the client session alive. When true, prevents the session from timing out during long periods of inactivity."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: NativeAngular
---

# The `keepClientAlive` option of the Native Angular Report Viewer

Determines whether to keep the client session alive. When true, prevents the session from timing out during long periods of inactivity.

## Type

`boolean`

## Examples

````html
<reporting-angular-viewer
 [keepClientAlive]="keepClientAlive">
</reporting-angular-viewer>
````

````typescript
keepClientAlive: boolean = true;
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/overview%})
* [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/pagemode%})
* [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/parametersareavisible%})

