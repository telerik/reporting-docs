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

"*Failed to load API definition.*" message is displayed on the Swagger Generation page. 

There may also be a short error on the page about being unable to fetch **swagger.json**.


## Error Message

- Error message on client-side:
```
Fetch error

response status is 500 https://localhost:{port}/swagger/v1/swagger.json
```

- Server-side exception:
```
An unhandled exception has occurred while executing the request.
      Swashbuckle.AspNetCore.SwaggerGen.SwaggerGeneratorException: Conflicting method/path combination "GET api/ReportDesignerControllerBase" for actions - Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.GetDesignerResource (Telerik.WebReportDesigner.Services),Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.GetResource (Telerik.WebReportDesigner.Services). Actions require a unique method/path combination for Swagger/OpenAPI 3.0. Use ConflictingActionsResolver as a workaround
         at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GenerateOperations(IEnumerable`1 apiDescriptions, SchemaRepository schemaRepository)
         at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GeneratePaths(IEnumerable`1 apiDescriptions, SchemaRepository schemaRepository)
         at Swashbuckle.AspNetCore.SwaggerGen.SwaggerGenerator.GetSwagger(String documentName, String host, String basePath)
         at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
         at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)
```

## Cause

There is a confliction method/path in ReportDesignerController. Swagger requires actions to have unique methods/paths.

## Solution

- For .NET Core 3.1 and .NET 5, configure the Swagger Generation in **Startup.cs**:

```cs
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
```

- For .NET 6, configure the Swagger Generation in **Program.cs**

```cs
builder.Services.AddSwaggerGen(c => {
    c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
    c.IgnoreObsoleteActions();
    c.IgnoreObsoleteProperties();
    c.CustomSchemaIds(type => type.FullName);
});
```
