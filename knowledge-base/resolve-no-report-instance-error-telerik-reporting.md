---
title: Resolving "No report instance" Error
description: "Learn how to fix the 'No report instance' console error when using Telerik Reporting in a .NET 9 project with the HTML5 Report Viewer."
type: troubleshooting
page_title: Fix "No report instance" Console Error when using HTML5 Report Viewer
slug: resolve-no-report-instance-error-telerik-reporting
tags: telerik, reporting, .net9, html5, reportviewer, json, serialization
res_type: kb
ticketid: 1670454
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.3.24.1112</td>
</tr>
</tbody>
</table>

## Description

After upgrading a project to .NET 9 and the latest Telerik Reporting version 18.3.24.1112, the reports fail to load with a console error stating "No report instance" found. This issue typically occurs when custom JsonSerializerSettings are added in the `AddNewtonsoftJson` method in the `Program.cs` file.

## Cause

The problem is caused by custom `JsonSerializerSettings` specified in the `AddNewtonsoftJson` method which interfere with the serialization process required for the Telerik Reporting to function properly.

## Solution

To resolve the "No report instance" error, consider one of the following approaches:

### Using Default Serializer Settings

Update the `AddNewtonsoftJson` method in the `Program.cs` file to use the default serializer settings:

```csharp
var builder = WebApplication.CreateBuilder(args);

// Add framework services.
builder.Services.AddNewtonsoftJson();
```

### Creating an Action Filter for Custom Serializer Settings

If using the default serializer settings is not an option due to application requirements, create an action filter to customize the serializer settings for the reports:

1. Implement the `JsonConfigFilterAttribute` action filter:

```csharp
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Microsoft.AspNetCore.Mvc.Formatters;
using System.Buffers;
using Microsoft.Extensions.Options;

public class JsonConfigFilterAttribute : ActionFilterAttribute
{
    public override void OnResultExecuting(ResultExecutingContext context)
    {
        if (context.Result is ObjectResult objectResult)
        {
            var serializerSettings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Include,
                DateTimeZoneHandling = DateTimeZoneHandling.Unspecified,
                ContractResolver = new CamelCasePropertyNamesContractResolver()
            };

            var jsonOutputFormatter = new NewtonsoftJsonOutputFormatter(
                serializerSettings,
                ArrayPool<char>.Shared,
                new MvcOptions { },
                new MvcNewtonsoftJsonOptions()
                );

            objectResult.Formatters.Add(jsonOutputFormatter);
        }

        base.OnResultExecuting(context);
    }
}
```

2. Annotate the `ReportsController` with the `JsonConfigFilter` attribute:

```csharp
[Route("api/[controller]")]
[ApiController]
[JsonConfigFilter]
public class ReportsController : ReportsControllerBase
{
            public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
            : base(reportServiceConfiguration)
        {
        }
}
```

Applying either of these solutions will address the issue, allowing Telerik Reports to load correctly in a .NET 9 project with the HTML5 Report Viewer.

## See Also

- [JsonSerializerSettings Documentation](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_JsonSerializerSettings.htm)
- [Understanding Action Filters in ASP.NET MVC](https://learn.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/controllers-and-routing/understanding-action-filters-cs)
- [NewtonsoftJsonOutputFormatter Class](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.formatters.newtonsoftjsonoutputformatter?view=aspnetcore-8.0)
