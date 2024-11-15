---
title: Resolving "No report instance" Error
description: "Learn how to fix the 'No report instance' console error when using Telerik Reporting in a .NET projects with the HTML5-based Report Viewers."
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

After upgrading a project to use the [Progress® Telerik® Reporting 2024 Q4 (18.3.24.1112)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q4-18-3-24-1112) version of the Telerik Reporting assemblies, the reports fail to load with a console error stating `No report instance` was found. 

## Cause

The problem is most commonly caused by custom [JsonSerializerSettings](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_JsonSerializerSettings.htm) specified in the `AddNewtonsoftJson` method which interferes with the serialization process required for the Telerik Reporting to function properly.

## Solution

To resolve the `No report instance` error, consider one of the following approaches:

### Using Default JsonSerializerSettings

Update the [AddNewtonsoftJson](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson) method in the `Program.cs` file of the project to use the default [JsonSerializerSettings](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_JsonSerializerSettings.htm):

````CSharp
var builder = WebApplication.CreateBuilder(args);

    builder.Services.AddNewtonsoftJson();
````

### Creating an Action Filter for custom JsonSerializerSettings

If using the default serializer settings is not an option due to application requirements, create an [ActionFilter](https://learn.microsoft.com/en-us/dotnet/api/system.web.mvc.actionfilterattribute) to customize the [JsonSerializerSettings](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_JsonSerializerSettings.htm) for the reports controller:

1. Implement the `JsonConfigFilterAttribute` [ActionFilter](https://learn.microsoft.com/en-us/dotnet/api/system.web.mvc.actionfilterattribute):

    ````CSharp
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
````


1. Annotate the `ReportsController` with the newly created `JsonConfigFilter` attribute:

    ````CSharp
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
````


## See Also

* [JsonSerializerSettings Documentation](https://www.newtonsoft.com/json/help/html/T_Newtonsoft_Json_JsonSerializerSettings.htm)
* [Understanding Action Filters in ASP.NET MVC](https://learn.microsoft.com/en-us/aspnet/mvc/overview/older-versions-1/controllers-and-routing/understanding-action-filters-cs)
* [NewtonsoftJsonOutputFormatter Class](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.formatters.newtonsoftjsonoutputformatter?view=aspnetcore-8.0)
