---
title: authenticationToken
page_title: authenticationToken property
description: "A bearer token to be added in the Authorization header of each request. Used for authentication with the reporting service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/authenticationtoken
published: True
reportingArea: NativeAngular
---

# authenticationToken

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

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
