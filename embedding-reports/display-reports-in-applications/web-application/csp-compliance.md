---
title: CSP Compliance
page_title: Content Security Policy (CSP) Compliance for HTML5 Report Viewers
description: "Learn how to configure Content Security Policy (CSP) compliance for the Telerik Reporting HTML5-based viewers using nonce-based CSP headers."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/csp-compliance
tags: csp, content security policy, html5 report viewer, angular report viewer, react report viewer, nonce, security
tag: new
published: True
position: 13
reportingArea: General
---

# Content Security Policy (CSP) Compliance for HTML5-Based Report Viewers

This article explains how to configure Content Security Policy (CSP) for web applications that host one of the HTML5-based Telerik Reporting viewers.

It covers the nonce-based approach that allows the viewers to function without relaxing your CSP to allow `'unsafe-inline'` scripts and styles.

## Overview

[Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Content_Security_Policy) is a browser security mechanism that helps prevent cross-site scripting (XSS) and data injection attacks. When a CSP is active, the browser blocks all inline scripts and styles unless the page explicitly authorizes them.

The HTML5-based viewers inject a set of inline scripts and styles into the host page during initialization. Without CSP support, any `script-src` or `style-src` directive that omits `'unsafe-inline'` causes the browser to block these resources, which prevents the viewer from rendering.

Telerik Reporting supports **nonce-based CSP**. A nonce (number used once) is a random cryptographic token that the server generates for every HTTP response. The server embeds the nonce in the CSP header and in each authorized inline element. The browser accepts only elements whose nonce matches the one in the header.

## Supported Viewers

The following HTML5-based viewers support the `nonce` option:

- [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview)
- [React Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview)
- [Blazor Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview)

## Prerequisites

Before you start, make sure that:

- You have a working ASP.NET Core web application that hosts the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview).
- You have added one of the supported viewers to the application(*or in the frontend application in the cases of the Angular and React report viewers*).

## Configuring CSP Compliance

CSP compliance requires three coordinated steps:

1. Generate a cryptographically strong nonce for every HTTP request.
2. Include the nonce in the `Content-Security-Policy` response header.
3. Pass the same nonce to the viewer's `nonce` option and to every inline `<script>` and `<style>` element on the host page.

### Step 1: Create a CSP Middleware

Add a middleware class that generates the nonce, stores it in the `HttpContext`, and appends the CSP header before the response is sent to the browser.

```C#
namespace MyApp.Middleware
{
    using Microsoft.AspNetCore.Http;
    using System;
    using System.Security.Cryptography;
    using System.Threading.Tasks;

    public class CspMiddleware(RequestDelegate next)
    {
        public const string NonceKey = "CspNonce";

        public async Task InvokeAsync(HttpContext context)
        {
            var nonce = GenerateNonce();
            context.Items[NonceKey] = nonce;

            context.Response.OnStarting(() =>
            {
                var csp =
                    $"default-src 'self'; " +
                    $"script-src 'self' 'nonce-{nonce}'; " +
                    $"style-src 'self' 'nonce-{nonce}'; " +
                    $"frame-src 'self' blob:; " +
                    $"img-src 'self' data:;";
                context.Response.Headers["Content-Security-Policy"] = csp;
                return Task.CompletedTask;
            });

            await next(context);
        }

        private static string GenerateNonce()
        {
            Span<byte> bytes = stackalloc byte[32];
            RandomNumberGenerator.Fill(bytes);
            return Convert.ToBase64String(bytes);
        }
    }
}
```

The CSP directives in the example above cover the requirements of the HTML5-based viewers:

| Directive                           | Purpose                                                                                           |
| ----------------------------------- | ------------------------------------------------------------------------------------------------- |
| `default-src 'self'`                | Restricts all unspecified resource types to the same origin.                                      |
| `script-src 'self' 'nonce-{nonce}'` | Allows scripts from the same origin and inline scripts that carry the nonce.                      |
| `style-src 'self' 'nonce-{nonce}'`  | Allows stylesheets from the same origin and inline styles that carry the nonce.                   |
| `frame-src 'self' blob:`            | Allows frames (used by the viewer's print functionality) from the same origin and from blob URLs. |
| `img-src 'self' data:`              | Allows images from the same origin and inline data URIs (used for embedded report images).        |

> tip Adjust the directives to match the requirements of your application. The example is intentionally minimal and may not cover all resources that a real application loads.

### Step 2: Register the Middleware

Register the middleware in `Program.cs` **before** the routing and static-assets middleware so that the nonce is available for all requests.

```C#
using MyApp.Middleware;

var builder = WebApplication.CreateBuilder(args);
builder.Services
    .AddRazorPages()
    .AddTelerikReporting("ReportingNet", reportsPath);

var app = builder.Build();

app.UseMiddleware<CspMiddleware>();
app.MapStaticAssets();
app.MapRazorPages().WithStaticAssets();
app.UseTelerikReporting();
app.UseRouting();

app.Run();
```

### Step 3: Apply the Nonce to Inline Elements and the Viewer

In your Razor page, read the nonce from `HttpContext.Items` and apply it to every inline `<style>`, inline `<script>`, and the viewer's `nonce` option.

```CSHTML
@page
@{
    var nonce = ViewContext.HttpContext.Items["CspNonce"];
}

<style nonce="@nonce">
    #reportViewer {
        position: absolute;
        inset: 5px;
    }
</style>

<div id="reportViewer">
    loading...
</div>

<script type="text/javascript" nonce="@nonce">
    $("#reportViewer").telerik_ReportViewer({
        nonce: "@Html.Raw(nonce)",
        serviceUrl: "/api/reports/",
        reportSource: {
            report: "Report Catalog.trdp",
        }
    });
</script>
```

The `nonce` option tells the viewer to stamp the same token on any inline element it injects after initialization. Without this option, the browser blocks viewer-injected styles and scripts even when the page itself is correctly configured.

## Angular Report Viewer

Pass the nonce as the `[nonce]` input on the `<tr-viewer>` component. The nonce value has to be generated server-side and made available to the Angular component — for example, via a Razor-hosted Angular application or a server-rendered initial state.

```HTML
<tr-viewer
    [serviceUrl]="'api/reports/'"
    [reportSource]="reportSource"
    [nonce]="nonceValue">
</tr-viewer>
```
```TypeScript
export class AppComponent {
    nonceValue: string = 'VALUE_FROM_SERVER';
    reportSource = { report: 'Dashboard.trdp', parameters: {} };
}
```

## React Report Viewer

Pass the nonce as the `nonce` prop on the `<TelerikReportViewer>` component.

```TypeScript
import React from 'react';
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer';

export function ReportViewerComponent({ nonce }: { nonce: string }) {
    return (
        <TelerikReportViewer
            serviceUrl="api/reports/"
            reportSource={{ report: 'Dashboard.trdp', parameters: {} }}
            nonce={nonce}
        />
    );
}
```

## See Also

- [HTML5 Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [Angular Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview)
- [React Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview)
- [Telerik Reporting REST Services](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview)
- [Accessibility Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility)
- [Content Security Policy on MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Content_Security_Policy)
