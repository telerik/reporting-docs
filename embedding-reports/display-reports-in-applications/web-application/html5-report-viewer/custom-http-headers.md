---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the HTML5 Report Viewer
description: "Learn how to add static or dynamic HTTP headers to HTML5 Report Viewer requests, refresh header values, update them at runtime, and connect to a REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/custom-http-headers
tags: http headers,authentication,html5,report viewer,rest service
tag: new
published: True
position: 8
reportingArea: HTML5
components: [html5, general]
---

# Configuring Custom HTTP Headers in the HTML5 Report Viewer

Configure custom HTTP headers when the Reporting REST Service requires tenant information, an API key, or an authorization scheme that differs from the viewer's built-in token.

## Configure Headers

Set the `httpHeaders` option when you initialize the HTML5 Report Viewer. The `headers` value can be a string-to-string object or a function that returns an object. The function can return a Promise.

The following example adds a tenant header and retrieves a bearer token from the application's authentication service:

```JavaScript
async function getReportingHeaders() {
    const token = await getAccessToken();
    return {
        "X-Tenant-Id": "tenant-42",
        "Authorization": "Bearer " + token
    };
}

$("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "/api/reports",
    reportSource: { report: "Sales.trdp" },
    httpHeaders: {
        headers: getReportingHeaders,
        refreshInterval: 60
    }
});
```

Implement `getAccessToken()` with the authentication service used by your application. For static values, set `headers` to an object instead of a function.

## Update Headers at Runtime

Get the viewer instance from the page, then call `httpHeaders(options)` to replace the header configuration. Pass `null` to clear the custom headers:

```JavaScript
const viewer = $("#reportViewer1").data("telerik_ReportViewer");

viewer.httpHeaders({
    headers: { "X-Tenant-Id": "tenant-43" },
    refreshInterval: 60
});

viewer.httpHeaders(null);
```

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `refreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `authenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use `authenticationToken` when configured.

> warning The viewer sends header values and callback code to the browser. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Using the HTML5 Report Viewer with REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)