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

I encountered build errors when configuring the Telerik Reporting REST Service in ASP.NET Core with Minimal API. The errors are:

- `'IMvcBuilder' does not contain a definition for 'AddTelerikReporting' and no accessible extension method 'AddTelerikReporting' accepting a first argument of type 'IMvcBuilder' could be found (are you missing a using directive or an assembly reference?)`
- `'WebApplication' does not contain a definition for 'UseTelerikReporting' and no accessible extension method 'UseTelerikReporting' accepting a first argument of type 'WebApplication' could be found (are you missing a using directive or an assembly reference?)`

This knowledge base article also answers the following questions:
- How to resolve IMvcBuilder errors for Telerik Reporting REST Service?
- Why does AddTelerikReporting cause build issues in ASP.NET Core?
- How to configure Telerik Reporting REST Service with Minimal API?

## Solution

To resolve the errors, ensure that the `AddTelerikReporting` method is applied to an `IMvcBuilder` object, as this extension method is defined for the `IMvcBuilder` interface.

Follow these steps:

### Option 1: Add an `IMvcBuilder` object explicitly
1. Add the MVC services to the `IServiceCollection`:
   ```csharp
   var service = builder.Services.AddMvc();
   ```
2. Add Newtonsoft.Json to the service:
   ```csharp
   service.AddNewtonsoftJson();
   ```
3. Define the reports path and add Telerik Reporting:
   ```csharp
   var reportsPath = System.IO.Path.Combine(builder.Environment.ContentRootPath, "Reports");
   service.AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
   ```

### Option 2: Chain the extension methods
Alternatively, chain the `AddMvc`, `AddNewtonsoftJson`, and `AddTelerikReporting` methods directly:
```csharp
builder.Services.AddMvc().AddNewtonsoftJson().AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
```

### Option 3: Use `AddControllers`
If using controllers, you can chain methods like this:
```csharp
builder.Services.AddControllers().AddNewtonsoftJson().AddTelerikReporting("TelerikReportingRestServiceMinimalApi", reportsPath);
```

Replace `"TelerikReportingRestServiceMinimalApi"` and the reports path with your specific configuration values.

For more information, consult the [Hosting the Reporting REST Service in ASP.NET Core with Minimal API documentation](https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/asp.net-core-web-api-implementation/host-reports-service-in-.net-6-with-minimal-api).

## See Also

- [Hosting the Reporting REST Service in ASP.NET Core with Minimal API](https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/asp.net-core-web-api-implementation/host-reports-service-in-.net-6-with-minimal-api)
- [IMvcBuilder Interface](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.imvcbuilder?view=aspnetcore-9.0)
- [Reporting Overview](https://docs.telerik.com/reporting/overview)
