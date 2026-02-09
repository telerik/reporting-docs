---
title: The type or namespace name NewtonsoftJsonOutputFormatter could not be found
description: "Learn what may be causing and how to resolve the 'The type or namespace name NewtonsoftJsonOutputFormatter could not be found' error caused after upgrade to Telerik Reporting Q1 2026."
type: troubleshooting
page_title: The type or namespace name NewtonsoftJsonOutputFormatter could not be found
slug: type-or-namespace-newtonsoftjsonoutputformatter-could-not-be-found
tags: telerik, reporting, serialize, json, newtonsoft, system, text
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
			<td>Version</td>
			<td>20.0.26.210+</td>
		</tr>
	</tbody>
</table>

## Description

After upgrading the Telerik Reporting packages to version **20.0.26.210(2026 Q1) or newer**, I can no longer build the project due to the errors mentioned further down below.

I use one of the approaches from the [Use Both 'System.Text.Json' and 'Newtonsoft.Json' for Serialization in ASP.NET Core](slug:use-two-json-serializers-in-same-asp-net-core-project) article, so that I can use **NewtonsoftJson** for the Reporting REST Service, and **System.Text.Json** for everything else.

## Error Messages

- `The type or namespace name 'NewtonsoftJsonOutputFormatter' could not be found (are you missing a using directive or an assembly reference?)`
- `The type or namespace name 'NewtonsoftJsonInputFormatter' could not be found (are you missing a using directive or an assembly reference?)`

## Cause

Starting with the **Progress® Telerik® Reporting 2026 Q1(20.0.26.210)** release, the .NET implementation of the Reporting REST Service for the web based report viewer and report designer no longer depends on the [Microsoft.AspNetCore.Mvc.NewtonsoftJson](https://www.nuget.org/packages/microsoft.aspnetcore.mvc.newtonsoftjson/) package.

Because of this change, after the Telerik Reporting packages are updated, the **NewtonsoftJson** assembly will no longer be available, and the types that depend on it will not be resolvable.

## Solution

### Case 1

If the workarounds. demonstrated in the [Use Both 'System.Text.Json' and 'Newtonsoft.Json' for Serialization in ASP.NET Core](slug:use-two-json-serializers-in-same-asp-net-core-project) article, were used only due to the dependency on **NewtonsoftJson** that the Reporting REST Service had previously, then you no longer need them, and they can be removed.

Starting with the **Progress® Telerik® Reporting 2026 Q1(20.0.26.210)** release, the Telerik Reporting packages, when used in **.NET Standard 2.0+/.NET 8+** projects, will instead depend on the [System.Text.Json](https://www.nuget.org/packages/System.Text.json) package.

No additional setup will be needed to use the Reporting controllers, simply remove the [AddNewtonsoftJson()](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson) extension method calls from the application startup file(`Program.cs`/`Startup.cs`).

If the [Minimal API](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api) setup is used for the Reporting REST Service, it won't be affected even if the [AddNewtonsoftJson()](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson) is not removed.

### Case 2

If there are controllers in the project where **NewtonsoftJson** needs to be used, the approaches from the [Use Both 'System.Text.Json' and 'Newtonsoft.Json' for Serialization in ASP.NET Core](slug:use-two-json-serializers-in-same-asp-net-core-project) article can still be used, but opposite of what has been recommended there.

The approach that we would recommend being used if you do need to keep utilizing **NewtonsoftJson** in some places of the project, is the [Local](slug:use-two-json-serializers-in-same-asp-net-core-project#local) workaround.

You can create `ServiceFilterAttribute`, which you can attach to any controller that need to use a different JSON serialization.

It will take the result object of any endpoint, use the **NewtonsoftJson** serializer to produce a JSON string, and replace the endpoint result with that.

```C#
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Filters;

public class ToNewtonsoftActionFilter : IAsyncResultFilter
{

	public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
	{
		if (context.Result is JsonResult jsonResult)
		{
			string jsonStr = Newtonsoft.Json.JsonConvert.SerializeObject(jsonResult.Value,
				(Newtonsoft.Json.JsonSerializerSettings?)jsonResult.SerializerSettings
				?? new Newtonsoft.Json.JsonSerializerSettings
				{
					ContractResolver = new Newtonsoft.Json.Serialization.DefaultContractResolver
					{
						NamingStrategy = new Newtonsoft.Json.Serialization.CamelCaseNamingStrategy()
					}
				});

			context.Result = new ContentResult { Content = jsonStr, ContentType = "application/json" };
		}

		await next().ConfigureAwait(false);
	}
}
```

```C#
[ServiceFilter(typeof(ToNewtonsoftActionFilter))]
[Route("api/[controller]")]
public class ValuesController : ControllerBase
```

You would also need to create `ModelBinderAttribute` attached which will cause the objects to be deserialized by **NewtonsoftJson**.

```C#
public class NewtonsoftJsonModelBinder : IModelBinder
{
	public async Task BindModelAsync(ModelBindingContext bindingContext)
	{
		if (bindingContext == null) throw new ArgumentNullException(nameof(bindingContext));

		using var reader = new StreamReader(bindingContext.HttpContext.Request.Body);

		string body = await reader.ReadToEndAsync().ConfigureAwait(continueOnCapturedContext: false);
		object? value = Newtonsoft.Json.JsonConvert.DeserializeObject(body, bindingContext.ModelType);
		bindingContext.Result = ModelBindingResult.Success(value);
	}
}
```

```C#
public virtual new IActionResult GetMembers([ModelBinder(typeof(NewtonsoftJsonModelBinder))] TypeInfoWithFilter input) => base.GetMembers(input);
```

Finally, you would need to register `ToNewtonsoftActionFilter` as a [Singleton](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.servicecollectionserviceextensions.addsingleton) service in the **Program.cs**. but the usage is completely confined to the specific controllers where you wish to still use that serializer instead of **System.Text.Json**.

```C#
builder.Services.AddSingleton<ToNewtonsoftActionFilter>();
```

## See Also

- [How to configure two JSON serializers and select the correct one based on the route](https://stackoverflow.com/questions/59650907/how-to-configure-two-json-serializers-and-select-the-correct-one-based-on-the-ro)
- [Use Both 'System.Text.Json' and 'Newtonsoft.Json' for Serialization in ASP.NET Core](slug:use-two-json-serializers-in-same-asp-net-core-project)
