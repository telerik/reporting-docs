---
title: keepClientAlive
page_title: keepClientAlive property
description: "Determines whether the client will be kept alive. When true, prevents client expiration by continually sending requests to the server."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/settable-properties/keepclientalive
published: True
reportingArea: AngularWrapper
---

# keepClientAlive

Determines whether the client will be kept alive. When true, prevents client expiration by continually sending requests to the server.

## Type

`boolean`

## Examples

````html
<tr-viewer
  [keepClientAlive]="keepClientAlive">
</tr-viewer>
````

````typescript
keepClientAlive: boolean = false;
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
