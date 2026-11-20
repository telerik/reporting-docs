---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers for Report Viewers
description: "Learn how to configure static or dynamic HTTP headers for Telerik Reporting web and desktop viewers, refresh header values, and send them to a REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/custom-http-headers-for-report-viewers
tags: custom headers,http headers,authentication,report viewers,rest service
tag: new
published: True
position: 7
reportingArea: General
---

# Configuring Custom HTTP Headers for Report Viewers

Configure custom request headers when your Reporting REST Service requires tenant information, an API key, or an authorization scheme that differs from the viewer's built-in token. Web and desktop viewers use different APIs, but both apply headers to requests sent to the configured REST Service.

## Overview

For web viewers, configure the `httpHeaders` option or the corresponding component parameter. For WinForms, WPF, and WinUI viewers, set `RestServiceConnectionInfo.HttpHeaders` and assign the connection through `ReportEngineConnectionInfo`.

Custom headers are not supported when a viewer connects to Telerik Report Server. For web-based viewers, header values are sent to the browser. Do not use this feature to protect secrets from the person using the application.

The following table lists the configuration and runtime APIs for each viewer:

| Viewer | Configure headers | Change headers at runtime |
| ------ | ------ | ------ |
| HTML5 | `httpHeaders` option | `viewer.httpHeaders(options)` |
| Angular wrapper | `httpHeaders` input | `setHttpHeaders(options)` |
| Native Angular | `httpHeaders` input | `executeCommand("setHttpHeaders", options)` |
| React | `httpHeaders` prop | `setHttpHeaders(options)` |
| ASP.NET MVC | `HttpHeaders(HttpHeadersOptions)` builder method | HTML5 viewer `httpHeaders(options)` method |
| ASP.NET Web Forms | `HttpHeaders` property | HTML5 viewer `httpHeaders(options)` method |
| Blazor wrapper | `HttpHeaders` parameter | `SetHttpHeadersAsync(options)` |
| Native Blazor | `HttpHeaders` parameter | Replace the parameter value |
| WinForms, WPF, and WinUI | `ReportEngineConnectionInfo` with `RestServiceConnectionInfo.HttpHeaders` | Assign a new `HttpHeaders` options value |

## Viewer-Specific Articles

### Web Report Viewers

For configuration details for a specific web viewer, see the corresponding article:

- [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/custom-http-headers)
- [ASP.NET MVC Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/custom-http-headers)
- [ASP.NET Web Forms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/custom-http-headers)
- [Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/custom-http-headers)
- [Native Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/custom-http-headers)
- [React Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/custom-http-headers)
- [Blazor Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/custom-http-headers)
- [Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/custom-http-headers)

## Desktop Report Viewers

WinForms, WPF, and WinUI viewers use `RestServiceConnectionInfo.HttpHeaders` for custom headers. Set the REST Service connection through `ReportEngineConnectionInfo`; a connection string cannot store header configuration. Use `Headers` for fixed values or `GetHeadersAsync` to provide values that can change during a session, such as an authorization token.

The desktop viewers cache callback results for 300 seconds by default. Set `RefreshInterval` to `0` to invoke the callback before every request. To apply changed options, assign a new `HttpHeadersOptions` instance to `HttpHeaders`. A custom `Authorization` header takes precedence over the connection's token.

For setup details, see the REST Service connection article for your desktop viewer:

- [Using the Windows Forms Report Viewer with a REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service)
- [Using the WPF Report Viewer with a REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service)
- [Integrating the WinUI Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/how-to-add-report-viewer-to-a-.net-5-application)

## How Custom Headers Work

The viewers add configured headers to REST Service requests made through their HTTP clients. Depending on the viewer, you can provide static values or generate values with a callback. Callbacks support values that change during a session, such as an authorization token.

Web viewers and desktop viewers use different configuration APIs. The viewer-specific web articles linked above describe their configuration and runtime update options. For desktop viewers, configure headers as part of the REST Service connection rather than in the connection string.

## Header Scope and Refresh

Header factories are cached for 300 seconds by default. Set `refreshInterval` or `RefreshInterval` to another number of seconds to change the cache duration. Set the value to `0` to resolve headers before every request. When you replace the header configuration, the viewer clears the cached result.

The viewer checks the origin of the initial request URL before it adds custom headers. Requests initially sent to other origins do not receive custom headers. This check does not restrict subsequent redirects. The viewer does not add headers to arbitrary browser requests or URLs loaded directly from rendered report markup.

> important For web viewers, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

If the REST Service is on a different origin from the application, configure CORS to allow the custom header names. For more information, see Microsoft's [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors) documentation.

## Security Considerations

Web viewer configuration is sent to the browser. Users can inspect header values and callback code in browser developer tools. Do not place server-side credentials or secrets in a web viewer header.

If you set a custom `Authorization` header, it takes precedence over the viewer's `authenticationToken` or desktop connection token. When the custom headers do not include `Authorization`, the viewer continues to use its configured authentication token.

Avoid redirecting REST Service requests to another origin. A redirect can forward custom headers to the destination origin. The viewers warn when they detect a cross-origin redirect, but you must configure the service to prevent it.

## Troubleshooting

If the service rejects a request, check that the viewer connects to the Reporting REST Service rather than Report Server, and verify the header name and value expected by the service. For web viewers, confirm that the service's CORS policy allows the custom header names.

If a dynamic value appears stale, lower the refresh interval or set it to `0`. Confirm that the callback returns a string-to-string map and that the callback name is available to the browser when you use an MVC, Web Forms, or Blazor wrapper.

## See Also

- [Telerik Reporting REST Services](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview)
