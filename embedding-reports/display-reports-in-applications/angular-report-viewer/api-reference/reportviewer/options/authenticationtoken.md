---
title: authenticationToken
page_title: authenticationToken property
description: "If provided, a Bearer token will be set in the Authorization header for every request to the REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/authenticationtoken
published: True
reportingArea: AngularWrapper
---

# The `authenticationToken` option of the Angular Report Viewer

If provided, a Bearer token will be set in the Authorization header for every request to the REST service.

## Type

`string`

## Examples

````html
<tr-viewer
  [authenticationToken]="authenticationToken">
</tr-viewer>
````

````typescript
authenticationToken: string = "your-authentication-token";
````

