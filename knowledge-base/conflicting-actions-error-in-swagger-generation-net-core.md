---
title: Failed to load API definition is displayed on the Swagger Generation page
description: Swagger requires actions to have unique methods/paths.
type: troubleshooting
page_title: Conflicting method/path combination for actions in Swagger Generation
slug: conflicting-actions-error-in-swagger-generation-net-core
position: 
tags: .NET 5.0, .NET Core, WebReportDesigner
ticketid: 1543912
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
			<td>Project Type</td>
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>


## Description

`Failed to load API definition.` message is displayed on the Swagger Generation page(usually `localhost:port/swagger`). 

There may also be a short error on the page about being unable to fetch `swagger.json`.

## Error Message

- Error message on client-side:

````
Fetch error

response status is 500 https://localhost:{port}/swagger/v1/swagger.json
````

- Server-side exception when using `Swashbuckle`:

````
An unhandled exception has occurred while executing the request.

	Swashbuckle.AspNetCore.SwaggerGen.SwaggerGeneratorException: Conflicting method/path combination "GET api/ReportDesignerControllerBase" for actions - Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.GetDesignerResource (Telerik.WebReportDesigner.Services),Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.GetResource (Telerik.WebReportDesigner.Services). Actions require a unique method/path combination for Swagger/OpenAPI 3.0. Use ConflictingActionsResolver as a workaround
		at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GenerateOperations(IEnumerable`1 apiDescriptions, SchemaRepository schemaRepository)
		at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GeneratePaths(IEnumerable`1 apiDescriptions, SchemaRepository schemaRepository)
		at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GetSwagger(String documentName, String host, String basePath)
		at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
		at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
````

- Server-side exception when using `NSwag`:

````
An unhandled exception has occurred while executing the request.

System.InvalidOperationException: The method 'get' on path '/api/ReportDesignerControllerBase' is registered multiple times.
	at NSwag.Generation.AspNetCore.AspNetCoreOpenApiDocumentGenerator.AddOperationDescriptionsToDocument(OpenApiDocument document, Type controllerType, List`1 operations, OpenApiDocumentGenerator swaggerGenerator, OpenApiSchemaResolver schemaResolver)
	at NSwag.Generation.AspNetCore.AspNetCoreOpenApiDocumentGenerator.GenerateApiGroups(OpenApiDocument document, IGrouping`2[] apiGroups, OpenApiSchemaResolver schemaResolver)
	at NSwag.Generation.AspNetCore.AspNetCoreOpenApiDocumentGenerator.GenerateAsync(ApiDescriptionGroupCollection apiDescriptionGroups)
	at NSwag.AspNetCore.Middlewares.OpenApiDocumentMiddleware.GenerateDocumentAsync(HttpContext context)
	at NSwag.AspNetCore.Middlewares.OpenApiDocumentMiddleware.GetDocumentAsync(HttpContext context)
	at NSwag.AspNetCore.Middlewares.OpenApiDocumentMiddleware.Invoke(HttpContext context)
	at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
````

## Cause

There is a confliction method/path in ReportDesignerController. Swagger requires actions to have unique methods/paths.

## Solution

### Swashbuckle

- For .NET Core 3.1 and .NET 5, configure the Swagger Generation in **Startup.cs**:

````CSharp
public void ConfigureServices(IServiceCollection services)
{
...
	services.AddSwaggerGen(c => {
		c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
		c.IgnoreObsoleteActions();
		c.IgnoreObsoleteProperties();
		c.CustomSchemaIds(type => type.FullName);
		});
		...
}
````

- For .NET 6+, configure the Swagger Generation in **Program.cs**

````CSharp
builder.Services.AddSwaggerGen(c => {
	c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
	c.IgnoreObsoleteActions();
	c.IgnoreObsoleteProperties();
	c.CustomSchemaIds(type => type.FullName);
});
````

### NSwag

Implement the `NSwag.Generation.Processors.IOperationProcessor` interface as follows and then use it in the `AddSwaggerGen` configuration:

````CSharp
public class IncludeControllersInSwagger : IOperationProcessor
{
	public bool Process(OperationProcessorContext context)
	{
	return ShouldIncludeController(context.ControllerType);
	}

	bool ShouldIncludeController(System.Type type)
	{
		return !(type.AssemblyQualifiedName == typeof(Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase).AssemblyQualifiedName);
	}
}
````

- For .NET Core 3.1 and .NET 5, configure the Swagger Generation in **Startup.cs**:

````CSharp
public void ConfigureServices(IServiceCollection services)
{
...
	services.AddSwaggerGen(c => {
	c.IgnoreObsoleteProperties = true;
	c.OperationProcessors.Add(new IncludeControllersInSwagger());
		});
		...
}
````

- For .NET 6+, configure the Swagger Generation in **Program.cs**

````CSharp
builder.Services.AddSwaggerGen(c => {
		c.IgnoreObsoleteProperties = true;
		c.OperationProcessors.Add(new IncludeControllersInSwagger());
});
````

## See Also

[NSwag filter namespace](https://stackoverflow.com/questions/52337355/nswag-filter-namespace)
