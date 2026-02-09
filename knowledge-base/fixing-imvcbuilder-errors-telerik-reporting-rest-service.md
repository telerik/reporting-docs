---
title: Resolving IMvcBuilder Errors When Hosting Telerik Reporting REST Service in ASP.NET Core
description: Learn how to address IMvcBuilder errors when implementing the Telerik Reporting REST Service in ASP.NET Core with Minimal API.
type: how-to
page_title: Fixing IMvcBuilder Errors in Telerik Reporting REST Service Configuration
meta_title: Fixing IMvcBuilder Errors in Telerik Reporting REST Service Configuration
slug: fixing-imvcbuilder-errors-telerik-reporting-rest-service
tags: reporting, imvcbuilder, errors, asp, net, core, addtelerikreporting, hosting, rest, service
res_type: kb
ticketid: 1706442
---

## Environment

<table>
   <tbody>
      <tr>
         <td> Product </td>
         <td> Reporting </td>
      </tr>
      <tr>
         <td> Version </td>
         <td> 19.3.26.121 or older </td>
      </tr>
   </tbody>
</table>

## Description

> important Starting with the **Progress® Telerik® Reporting 2026 Q1** release, the .NET-based Reporting services now use [System.Text.Json](https://www.nuget.org/packages/System.Text.json).

I encountered a build error when configuring the Telerik Reporting REST Service in ASP.NET Core with Minimal API.

## Error Message

`'IMvcBuilder' does not contain a definition for 'AddTelerikReporting' and no accessible extension method 'AddTelerikReporting' accepting a first argument of type 'IMvcBuilder' could be found (are you missing a using directive or an assembly reference?)`

## Solution

To resolve the error, ensure that the `AddTelerikReporting` method is applied to an `IMvcBuilder` object, as this extension method is defined for the [IMvcBuilder](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.imvcbuilder) interface. Follow these steps:

### Option 1: Add an `IMvcBuilder` to the IServiceCollection

1. Add services for pages to the specified [IServiceCollection](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.iservicecollection):

   ```C#
   var service = builder.Services.AddRazorPages();
   ```

1. Add **Newtonsoft.Json** to the service:

   ```C#
   service.AddNewtonsoftJson();
   ```

1. Define the reports path and add Telerik Reporting:

   ```C#
   var reportsPath = System.IO.Path.Combine(builder.Environment.ContentRootPath, "Reports");
   service.AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
   ```

### Option 2: Chain the extension methods

Alternatively, chain the `AddRazorPages`, `AddNewtonsoftJson`, and `AddTelerikReporting` methods directly:

```C#
builder.Services.AddMvc().AddNewtonsoftJson().AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
```

> Replace `"TelerikReportingRestServiceMinimalApi"` and the reports path with your specific configuration values.

## See Also

- [Hosting the Reporting REST Service in ASP.NET Core with Minimal API]({%slug how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api%})
- [IMvcBuilder Interface](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.imvcbuilder?view=aspnetcore-9.0)
