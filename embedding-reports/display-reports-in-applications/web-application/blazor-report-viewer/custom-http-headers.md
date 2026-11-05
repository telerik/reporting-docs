---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the Blazor Report Viewer
description: "Learn how to add static or dynamic HTTP headers to Blazor Report Viewer requests, refresh values, update them at runtime, and connect to a REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/custom-http-headers
tags: http headers,authentication,blazor,report viewer,rest service
tag: new
published: True
position: 4
reportingArea: BlazorWrapper
components: [blazorwrapper, general]
---

# Configuring Custom HTTP Headers in the Blazor Report Viewer

Configure custom HTTP headers when the Reporting REST Service requires tenant information, an API key, or an authorization scheme that differs from the viewer's built-in token.

## Configure Headers

Set the `HttpHeaders` parameter to a `Telerik.ReportViewer.Blazor.HttpHeadersOptions` instance. Set `Headers` for static values, or set `GetHeaders` to the name of a JavaScript function that returns a header object or a Promise of one.

The following example configures a tenant header and names a callback that returns an authorization token:

```CSharp
private readonly HttpHeadersOptions httpHeaders = new()
{
    Headers = new Dictionary<string, string>
    {
        { "X-Tenant-Id", "tenant-42" }
    },
    GetHeaders = "getReportingHeaders",
    RefreshInterval = 60
};
```

Set the options on the viewer component:

```HTML
<ReportViewer ServiceUrl="api/reports" HttpHeaders="@httpHeaders" />
```

Define the JavaScript callback in a script loaded by the page:

```JavaScript
async function getReportingHeaders() {
    const token = await getAccessToken();
    return {
        "X-Tenant-Id": "tenant-42",
        "Authorization": "Bearer " + token
    };
}
```

When you set both `Headers` and `GetHeaders`, the callback result takes precedence. Return every required header from the callback.

## Update Headers at Runtime

Use the component reference to call `SetHttpHeadersAsync(options)`. Pass `null` to clear the custom headers:

```CSharp
await reportViewer.SetHttpHeadersAsync(new HttpHeadersOptions
{
    Headers = new Dictionary<string, string>
    {
        { "X-Tenant-Id", "tenant-43" }
    },
    RefreshInterval = 60
});

await reportViewer.SetHttpHeadersAsync(null);
```

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `RefreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `AuthenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use the configured authentication token.

> warning The viewer renders header values and callback names in the page. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Integrating the Blazor Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)