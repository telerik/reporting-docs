---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the Native Blazor Report Viewer
description: "Learn how to configure custom HTTP headers in the Native Blazor Report Viewer, refresh asynchronous values, and send them to a Reporting REST Service."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/custom-http-headers
tags: http headers,authentication,native blazor,report viewer,rest service
tag: new
published: True
position: 4
reportingArea: NativeBlazor
components: [nativeblazor, general]
---

# Configuring Custom HTTP Headers in the Native Blazor Report Viewer

Use custom HTTP headers when the Reporting REST Service requires tenant information, an API key, or an authorization scheme that differs from the viewer's built-in token.

## Configure Headers

Set the `HttpHeaders` parameter to a `Telerik.ReportViewer.BlazorNative.HttpHeadersOptions` instance. The `GetHeadersAsync` callback returns a dictionary of header names and values.

Initialize the options in `OnInitialized` so the callback can access the component's authentication service. The following example retrieves a bearer token:

```CSharp
private HttpHeadersOptions? httpHeaders;

protected override void OnInitialized()
{
    httpHeaders = new HttpHeadersOptions
    {
        RefreshInterval = 60,
        GetHeadersAsync = async () =>
        {
            var token = await GetAccessTokenAsync();
            return new Dictionary<string, string>
            {
                { "X-Tenant-Id", "tenant-42" },
                { "Authorization", "Bearer " + token }
            };
        }
    };
}
```

Set the options on the component:

```HTML
<ReportViewer ServiceUrl="api/reports" HttpHeaders="@httpHeaders" />
```

The Native Blazor options type uses an asynchronous callback. Return all required static and dynamic values from the callback.

## Refresh Header Values

Header functions are cached for 300 seconds by default. Set `RefreshInterval` to another number of seconds to change the cache duration. Set it to `0` to invoke the callback before every request.

When the callback or refresh interval changes, pass the updated `HttpHeaders` parameter to the component. Set the parameter to `null` to clear custom headers.

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

A custom `Authorization` header takes precedence over `AuthenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use the configured authentication token.

> warning The viewer sends header values to the browser. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Using Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)