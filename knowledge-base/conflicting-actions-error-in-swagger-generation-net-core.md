---
title: Swagger UI Generation Page Displays Errors
description: "Learn why the Swagger UI generation tools such as NSwag and Swashbuckle may require special settings for Telerik Reporting."
type: troubleshooting
page_title: Swagger UI Generation Conflicting method/path combination for Actions
slug: conflicting-actions-error-in-swagger-generation-net-core
position: 
tags: .NET 6.0, .NET Core, WebReportDesigner
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

A `Failed to load API definition.` message is displayed on the Swagger UI Generation page(usually at `https://localhost:port/swagger`). 

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

There are conflicting methods/paths in the [ReportsController](/api/telerik.reporting.services.webapi.reportscontrollerbase) and [ReportDesignerController](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase) controllers, as well as some `Obsolete` Actions. Swagger requires actions to have unique methods/paths, and by default - no `Obsolete` actions are accepted.

## Solution

### Swashbuckle

Configure the following Swagger UI Generation configuration in the **Program.cs**/**Startup.cs** file of the project:

````CSharp
builder.Services.AddSwaggerGen(options => {
	options.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
	options.IgnoreObsoleteActions();
	options.IgnoreObsoleteProperties();
	options.CustomSchemaIds(type => type.FullName);
});
````

### NSwag

The [ReportsController](/api/telerik.reporting.services.webapi.reportscontrollerbase) should work normally with **NSwag**. However, if the [ReportDesignerController](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase) is used, it should be ignored by the Swagger generation tool by attaching to it the `[ApiExplorerSettings(IgnoreApi = true)]` attribute:  

````CSharp
[ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/reportdesigner")]
    public class ReportDesignerController : ReportDesignerControllerBase
    {
        public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
            : base(reportDesignerServiceConfiguration, reportServiceConfiguration)
        {
        }
    }
````

## See Also

* [Get started with NSwag and ASP.NET Core]([https://stackoverflow.com/questions/52337355/nswag-filter-namespace](https://learn.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-nswag)
* [Get started with Swashbuckle and ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-swashbuckle)
