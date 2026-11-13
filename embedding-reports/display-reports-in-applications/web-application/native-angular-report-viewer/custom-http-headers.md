---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the Native Angular Report Viewer
description: "Learn how to configure custom HTTP headers in the Native Angular Report Viewer, refresh dynamic values, update headers at runtime, and connect to a REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/custom-http-headers
tags: http headers,authentication,native angular,report viewer,rest service
tag: new
published: True
position: 5
reportingArea: NativeAngular
components: [nativeangular, general]
---

# Configuring Custom HTTP Headers in the Native Angular Report Viewer

Use the `httpHeaders` input to add custom headers to requests that the Native Angular Report Viewer sends to the Reporting REST Service.

## Configure Headers

Set `headers` to a string-to-string object or a function that returns an object. The function can return a Promise. The following example retrieves a bearer token from an application service:

```TypeScript
httpHeaders = {
    headers: async () => ({
        "X-Tenant-Id": "tenant-42",
        "Authorization": `Bearer ${await this.authService.getAccessToken()}`
    }),
    refreshInterval: 60
};
```

Bind the options object to the `httpHeaders` input:

```HTML
<reporting-angular-viewer
    [serviceUrl]="serviceUrl"
    [reportSource]="reportSource"
    [httpHeaders]="httpHeaders">
</reporting-angular-viewer>
```

For static values, set `headers` to an object instead of a function.

## Update Headers at Runtime

Call the `setHttpHeaders` command to replace the options:

```TypeScript
this.reportViewer.executeCommand("setHttpHeaders", {
    headers: { "X-Tenant-Id": "tenant-43" },
    refreshInterval: 60
});
```

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `refreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `authenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use `authenticationToken` when configured.

> warning The viewer sends header values and callback code to the browser. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Integrating the Native Angular Report Viewer with the Reporting Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)
