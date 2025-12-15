---
title: Resolving IMvcBuilder Errors When Hosting Telerik Reporting REST Service in ASP.NET Core
description: Learn how to address IMvcBuilder errors when implementing the Telerik Reporting REST Service in ASP.NET Core with Minimal API.
type: how-to
page_title: Fixing IMvcBuilder Errors in Telerik Reporting REST Service Configuration
meta_title: Fixing IMvcBuilder Errors in Telerik Reporting REST Service Configuration
slug: fixing-imvcbuilder-errors-telerik-reporting-rest-service
tags: reporting, imvcbuilder, errors, asp.net-core, addtelerikreporting, hosting, rest-service
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
         <td> 19.3.25.1119 </td>
      </tr>
   </tbody>
</table>

## Description

I encountered build error when configuring the Telerik Reporting REST Service in ASP.NET Core with Minimal API. The errors is:

`'IMvcBuilder' does not contain a definition for 'AddTelerikReporting' and no accessible extension method 'AddTelerikReporting' accepting a first argument of type 'IMvcBuilder' could be found (are you missing a using directive or an assembly reference?)`

## Solution

To resolve the error, ensure that the `AddTelerikReporting` method is applied to an `IMvcBuilder` object, as this extension method is defined for the `IMvcBuilder` interface.

Follow these steps:

### Option 1: Add an `IMvcBuilder`  to the IServiceCollection

1. Add the MVC services to the `IServiceCollection`:

   ```csharp
   var service = builder.Services.AddMvc();
   ```
   
1. Add Newtonsoft.Json to the service:

   ```csharp
   service.AddNewtonsoftJson();
   ```
   
1. Define the reports path and add Telerik Reporting:

   ```csharp
   var reportsPath = System.IO.Path.Combine(builder.Environment.ContentRootPath, "Reports");
   service.AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
   ```

### Option 2: Chain the extension methods

Alternatively, chain the `AddMvc`, `AddNewtonsoftJson`, and `AddTelerikReporting` methods directly:

```csharp
builder.Services.AddMvc().AddNewtonsoftJson().AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
```

If using controllers, you can chain methods like this:

```csharp
builder.Services.AddControllers().AddNewtonsoftJson().AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
```

> Replace `"TelerikReportingRestServiceMinimalApi"` and the reports path with your specific configuration values.

## See Also

* [Hosting the Reporting REST Service in ASP.NET Core with Minimal API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})
* [IMvcBuilder Interface](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.imvcbuilder?view=aspnetcore-9.0)
