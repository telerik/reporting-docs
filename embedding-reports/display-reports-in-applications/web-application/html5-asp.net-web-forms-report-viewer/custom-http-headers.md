---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the ASP.NET Web Forms Report Viewer
description: "Learn how to add static or dynamic HTTP headers to ASP.NET Web Forms Report Viewer requests, refresh values, and connect to a Reporting REST Service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/custom-http-headers
tags: http headers,authentication,asp.net web forms,report viewer,rest service
tag: new
published: True
position: 3
reportingArea: WebFormsWrapper
components: [webformswrapper, general]
---

# Configuring Custom HTTP Headers in the ASP.NET Web Forms Report Viewer

Set the `HttpHeaders` property to add custom headers to requests that the HTML5 ASP.NET Web Forms Report Viewer sends to the Reporting REST Service.

## Configure Headers

Add static values to the `Headers` collection. For dynamic values, set `GetHeaders` to the name of a JavaScript function that returns a header object or a Promise of one.

The following example configures a tenant header and a callback that supplies an authorization token:

```CSharp
protected void Page_Load(object sender, EventArgs e)
{
    ReportViewer1.HttpHeaders.Headers.Clear();
    ReportViewer1.HttpHeaders.Headers.Add(new HttpHeader
    {
        Name = "X-Tenant-Id",
        Value = "tenant-42"
    });
    ReportViewer1.HttpHeaders.GetHeaders = "getReportingHeaders";
    ReportViewer1.HttpHeaders.RefreshInterval = 60;
}
```

Define the callback in a JavaScript file loaded by the page:

```JavaScript
async function getReportingHeaders() {
    const token = await getAccessToken();
    return {
        "X-Tenant-Id": "tenant-42",
        "Authorization": "Bearer " + token
    };
}
```

Implement `getAccessToken()` with the authentication service used by your application. When you configure both static headers and a callback, the callback result takes precedence. Return every required header from the callback.

The `HttpHeaders` configuration is not persisted in ViewState. Set it on every page request, such as in `Page_Load`.

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `RefreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `AuthenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use the configured authentication token.

> warning The Web Forms control renders header values and callback names in the page. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Using the HTML5 ASP.NET Web Forms Report Viewer with REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)