---
title: Running Blazor Wrapper Viewer Offline with a Local REST Service
description: "Learn how to run a separate ASP.NET Core Reporting REST Service on the same device to generate Telerik reports offline from a Blazor WebAssembly application using the Blazor Wrapper viewer."
type: how-to
page_title: Running Blazor Wrapper Offline with a Local REST Service
slug: blazor-webassembly-offline-reporting-local-rest-service
tags: blazor, webassembly, wasm, offline, rest-service, report-generation
ticketid:
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.3.26.1110 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

To generate reports offline in a Blazor WebAssembly application using the [Blazor Wrapper](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview) report viewer, run a separate ASP.NET Core Reporting REST Service on the same device. The WASM client cannot host the Reporting engine or REST Service in the browser.

## Solution

This setup uses a local REST Service for report generation and a Blazor WebAssembly client for display. It assumes the client application, report definitions, and data sources are available on the device without Internet access.

This article assumes an already configured Blazor Report Viewer, including the `Telerik.ReportViewer.Blazor` NuGet package and its required JavaScript and CSS assets. Before you continue, follow the [Blazor Report Viewer client setup instructions](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer). Make all viewer assets available locally instead of using CDN URLs so the client works without Internet access.

### Prepare the Applications

1. Make the Blazor WebAssembly application files available on the device when Internet access is unavailable. This article does not cover how to package or cache those files.
1. Create a separate ASP.NET Core application for the Reporting REST Service. The service and the WASM client must run as separate applications.
1. Add the `Telerik.Reporting.Services.AspNetCore` NuGet package to the service project. Configure the Telerik NuGet feed if you have not added it yet. For details, see [adding the Telerik private NuGet feed to Visual Studio](slug:telerikreporting/using-reports-in-applications/install-with-nuget-packages).
1. Add a `Reports` folder to the service project. Copy a report definition such as `SampleReport.trdp` into that folder and set its **Copy to Output Directory** and **Copy to Publish Directory** properties to **Copy if newer** (or configure equivalent project-file metadata). Ensure that the report's data source is also available without Internet access.

### Configure the Local REST Service

This example uses the Minimal API hosting pattern. Do not combine it with the controller-based REST Service setup. Configure the service to listen on a local HTTPS endpoint and set the CORS origin to the exact origin that serves the WASM client. This example serves the client from `https://localhost:5002` and the REST Service from `https://localhost:5001`.

```C#
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Telerik.Reporting.Services.AspNetCore;

var builder = WebApplication.CreateBuilder(args);
var reportsPath = Path.Combine(builder.Environment.ContentRootPath, "Reports");

builder.Services.AddCors(options =>
{
    options.AddPolicy("WasmClient", policy =>
    {
        policy.WithOrigins("https://localhost:5002")
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});

builder.Services.AddRazorPages()
    .AddTelerikReporting("LocalReporting", reportsPath);

var app = builder.Build();

app.UseRouting();
app.UseCors("WasmClient");
app.UseTelerikReporting();

app.Run("https://localhost:5001");
```

Replace `https://localhost:5002` with the exact origin of your WASM client. Configure a certificate that the browser trusts for the local HTTPS service. Do not call an HTTP service from an HTTPS client because the browser can block the request as mixed content.

Publish the service for the target device and configure your deployment to start it before the client requests a report. Keep the service running while users generate reports.

### Connect the Blazor WebAssembly Client

Set the viewer's `ServiceUrl` to the local service endpoint. A relative URL such as `/api/reports` points to the origin that serves the client. It does not start a service on the device.

```Razor
@using Telerik.ReportViewer.Blazor

<style>
    #offlineViewer {
        height: 600px;
        position: relative;
        width: 100%;
    }
</style>

<ReportViewer ViewerId="offlineViewer"
              ServiceUrl="https://localhost:5001/api/reports"
              ReportSource="@(new ReportSourceOptions()
              {
                  Report = "SampleReport.trdp"
              })" />
```

If the browser blocks requests to the local service, verify the client origin in the service's CORS policy and follow the browser's localhost-access policies. The client and service must use compatible protocols and trusted certificates.

### Verify Offline Report Generation

1. Start the Reporting REST Service on the device.
1. Open `https://localhost:5001/api/reports/formats` in the browser. The service returns JSON with the available rendering formats.
1. Open the Blazor WebAssembly application and render `SampleReport.trdp`.
1. Turn off Internet access and repeat the report generation test. Confirm that the viewer, REST Service, report definition, and required data sources remain available locally.

## See Also

- [Integrating the Blazor Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer)
- [Hosting the Telerik Reporting REST Service in ASP.NET Core with Minimal API](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api)
- [Blazor WASM system drawing limitation](slug:blazor-wasm-system-drawing-common-not-supported)
