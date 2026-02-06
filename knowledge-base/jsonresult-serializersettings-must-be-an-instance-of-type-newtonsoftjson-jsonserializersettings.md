---
title: JsonResult.SerializerSettings Must Be of Type Newtonsoft.Json.JsonSerializerSettings
description: "Learn about why you may be getting the error 'Property JsonResult.SerializerSettings must be an instance of type Newtonsoft.Json.JsonSerializerSettings after upgrade to Telerik Reporting 2026 Q1, and how to resolve it."
type: troubleshoot
page_title: JsonResult.SerializerSettings Must Be of Type Newtonsoft.Json.JsonSerializerSettings
slug: jsonresult-serializersettings-must-be-an-instance-of-type-newtonsoftjson-jsonserializersettings
tags: json, serializer, settings, newtonsoftjson, jsonresult
res_type: kb
---

## Environment

<table>
	<tbody>
    	<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Product Version</td>
			<td>20.0.26.210+</td>
		</tr>
		<tr>
			<td>.NET Framework</td>
			<td>.NET 8+</td>
		</tr>
	</tbody>
</table>

## Description

I have updated my project to the **Progress® Telerik® Reporting 2026 Q1(20.0.26.210)** release, and when I try to open the Web Report Designer or any of the web-based Report Viewers, I see the mentioned error in the console.

## Error Message

```TEXT
System.InvalidOperationException: Property 'JsonResult.SerializerSettings' must be an instance of type 'Newtonsoft.Json.JsonSerializerSettings'.
   at Microsoft.AspNetCore.Mvc.NewtonsoftJson.NewtonsoftJsonResultExecutor.GetSerializerSettings(JsonResult result)
   at Microsoft.AspNetCore.Mvc.NewtonsoftJson.NewtonsoftJsonResultExecutor.ExecuteAsync(ActionContext context, JsonResult result)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResultFilterAsync>g__Awaited|30_0[TFilter,TFilterAsync](ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResultExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.ResultNext[TFilter,TFilterAsync](State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeResultFilters()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddlewareImpl.Invoke(HttpContext context)
```

## Cause

Starting with the **Progress® Telerik® Reporting 2026 Q1** release, the .NET-based Reporting services now use [System.Text.Json](https://www.nuget.org/packages/System.Text.json).

This means that the previously required extension method - [AddNewtonsoftJson()](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson), now breaks the Reporting REST Services, as it will override the default [System.Text.Json](https://www.nuget.org/packages/System.Text.json) serializer.

## Solution

### Case 1 - Remove NewtonsoftJson

If **NewtonsoftJson** is used only in the Reporting-related controllers, you can remove the [AddNewtonsoftJson()](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson) extension method call from the project's `Program.cs`/`Startup.cs` file:

- From

  ```C#
  builder.Services.AddControllers().AddNewtonsoftJson();
  ```

- To

  ```C#
  builder.Services.AddControllers();
  ```

### Case 2 - Keep NewtonsoftJson Globally

If you need to keep the **NewtonsoftJson** because it is used in other controllers in the project, you can remove the Reporting controllers, and you can instead implement the Telerik Reporing Service as a _minimal API_.

Please refer to the [Hosting the Reporting REST Service in ASP.NET Core with Minimal API](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api) article for instructions on how to do that.

> Our Reporting REST Service will use **System.Text.Json** despite that. This approach only allows to keep using **NewtonsoftJson** globally in the project without affecting the reporting service.

### Case 3 - Use NewtonsoftJson Locally in Specific Controllers

If you have _overridden_ any of the methods of the Reporting controller, then the _minimal API_ approach is not a viable option.

In this case, you would need to remove **NewtonsoftJson** globally, and use it only locally in specific controllers using the approach from the [Serializing with both 'System.Text.Json' and 'Newtonsoft.Json' in the same ASP.NET Core project](slug:use-two-json-serializers-in-same-asp-net-core-project#local) article.

## See Also

- [Hosting the Reporting REST Service in ASP.NET Core with Minimal API](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api)
- [Serializing with both 'System.Text.Json' and 'Newtonsoft.Json' in the same ASP.NET Core project](slug:use-two-json-serializers-in-same-asp-net-core-project#local)
