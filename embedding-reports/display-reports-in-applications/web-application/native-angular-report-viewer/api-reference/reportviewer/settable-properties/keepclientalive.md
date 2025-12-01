---
title: keepClientAlive
page_title: keepClientAlive property
description: "Determines whether to keep the client session alive. When true, prevents the session from timing out during long periods of inactivity."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/keepclientalive
published: True
reportingArea: NativeAngular
---

# keepClientAlive

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

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
