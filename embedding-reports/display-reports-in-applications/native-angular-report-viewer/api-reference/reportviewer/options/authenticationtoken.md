---
title: authenticationToken
page_title: authenticationToken property
description: "A bearer token to be added in the Authorization header of each request. Used for authentication with the reporting service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/authenticationtoken
published: True
reportingArea: NativeAngular
---

# The `authenticationToken` option of the Native Angular Report Viewer

A bearer token to be added in the Authorization header of each request. Used for authentication with the reporting service.

## Type

`string`

## Examples

````html
<reporting-angular-viewer
 [authenticationToken]="authenticationToken">
</reporting-angular-viewer>
````

````typescript
authenticationToken: string = "Bearer your-authentication-token";
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/native-angular-report-viewer-overview%})
