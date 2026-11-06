---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the React Report Viewer
description: "Learn how to configure custom HTTP headers in the React Report Viewer, refresh dynamic values, update headers at runtime, and connect to a REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/custom-http-headers
tags: http headers,authentication,react,report viewer,rest service
tag: new
published: True
position: 4
reportingArea: React
components: [react, general]
---

# Configuring Custom HTTP Headers in the React Report Viewer

Set the `httpHeaders` prop to add custom headers to requests that the React Report Viewer sends to the Reporting REST Service.

## Configure Headers

Set `headers` to a string-to-string object or a function that returns an object. The function can return a Promise. The following example retrieves a bearer token from the application's authentication service:

```JSX
const reportSource = { report: "Report Catalog.trdp" };
const httpHeaders = {
    headers: async () => ({
        "X-Tenant-Id": "tenant-42",
        "Authorization": "Bearer " + await getAccessToken()
    }),
    refreshInterval: 60
};

<TelerikReportViewer
    serviceUrl="/api/reports"
    reportSource={reportSource}
    httpHeaders={httpHeaders}
/>
```

Implement `getAccessToken()` with the authentication service used by your application. For static values, set `headers` to an object instead of a function.

## Update Headers at Runtime

Use a ref to call `setHttpHeaders(options)`. Pass `null` to clear the custom headers:

```JavaScript
reportViewerRef.current.setHttpHeaders({
    headers: { "X-Tenant-Id": "tenant-43" },
    refreshInterval: 60
});

reportViewerRef.current.setHttpHeaders(null);
```

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `refreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `authenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use `authenticationToken` when configured.

> warning The viewer sends header values and callback code to the browser. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [How to Use React Report Viewer with REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)
