---
title: Custom HTTP Headers
page_title: Configuring Custom HTTP Headers in the ASP.NET MVC Report Viewer
description: "Learn how to configure static or dynamic HTTP headers with the ASP.NET MVC Report Viewer, refresh header values, and send them to a Reporting REST Service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/custom-http-headers
tags: http headers,authentication,asp.net mvc,report viewer,rest service
tag: new
published: True
position: 4
reportingArea: MVCWrapper
components: [mvcwrapper, general]
---

# Configuring Custom HTTP Headers in the ASP.NET MVC Report Viewer

Use the MVC Report Viewer builder to add custom headers to requests sent to the Reporting REST Service. The viewer renders the header configuration in the page.

## Configure Headers

Call `HttpHeaders` on the Report Viewer builder. Set `Headers` for static values, or set `GetHeaders` to the name of a JavaScript function that returns a header object or a Promise of one.

The following example sets a tenant header and uses a JavaScript callback to retrieve an authorization token:

```CSharp
@(Html.TelerikReporting().ReportViewer()
    .ServiceUrl("api/reports")
    .ReportSource(new TypeReportSource { TypeName = "MyReports.SalesReport, MyReports" })
    .HttpHeaders(new HttpHeadersOptions
    {
        Headers = new Dictionary<string, string>
        {
            { "X-Tenant-Id", "tenant-42" }
        },
        GetHeaders = "getReportingHeaders",
        RefreshInterval = 60
    }))
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

When you set both `Headers` and `GetHeaders`, the callback result takes precedence. Return every required header from the callback.

## Header Scope and Security

The viewer adds custom headers when the initial request URL is on the configured Reporting REST Service origin. This check does not restrict subsequent redirects. The option is ignored when the viewer connects to Telerik Report Server. If the service uses a different origin, configure CORS to allow the custom header names.

> important By default, final export downloads and document downloads for mobile printing use direct browser navigation and do not include custom headers. These downloads can fail if the service requires custom headers on the document endpoint.

Header functions are cached for 300 seconds by default. Set `RefreshInterval` to another number of seconds to change the cache duration. Set it to `0` to call the function before every request.

A custom `Authorization` header takes precedence over `AuthenticationToken`. If you omit the custom `Authorization` header, the viewer continues to use the configured authentication token.

> warning The MVC helper renders header values and callback names in the page. Do not include server-side credentials or secrets in the configuration.

Avoid redirects from the REST Service to another origin. A redirect can forward custom headers to the destination. The viewer warns when it detects a cross-origin redirect, but you have to configure the service to prevent it.

## See Also

- [Using HTML5 ASP.NET MVC Report Viewer With Reporting REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service)
- [Cross-Origin Resource Sharing (CORS)](https://learn.microsoft.com/en-us/aspnet/core/security/cors)