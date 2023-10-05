---
title: Add Custom Headers to Responses of the Reporting REST Service
description: "Learn how to add custom headers to the responses sent by the Reporting REST Service in Telerik Reporting."
type: how-to
page_title: Send custom headers with REST Service responses
slug: add-custom-headers-to-responses-of-rests-service
tags: custom,header,rest,service
ticketid: 1624310
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

In some scenarios, you need the responses to have additional headers. In this case, you may override the `ReportsController` methods of the service to add the headers.

## Solution

### .NET and .NET Core

If you need custom headers for one or few of the responses, you need to override only the corresponding methods:

````CSharp
[Route("api/reports")]
public class ReportsController : ReportsControllerBase
{
	public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
		: base(reportServiceConfiguration)
	{
	}

	// ...

	public override JsonResult GetDocumentFormats()
	{
		Response.Headers.Add("cross-origin-embedder-policy", "require-corp");
		return base.GetDocumentFormats();
	}
}
````

If the headers should be added to all responses, it may be better to implement a universal solution.

The Stackoverflow thread [How to add custom header to ASP.NET Core Web API response](https://stackoverflow.com/questions/46183171/how-to-add-custom-header-to-asp-net-core-web-api-response) suggests some solutions.

With the below approach, you configure the application in the `Program.cs` file of .NET 6/7 project hosting the Reporting REST Service to add the custom headers to all responses, not only Reporting REST Service ones:

````CSharp
var app = builder.Build();

app.Use(async (context, next) =>
{
	context.Response.OnStarting(() =>
	{
		context.Response.Headers.Add("cross-origin-embedder-policy", "require-corp");
		return Task.FromResult(0);
	});

	await next();
});

// ...
````

This above code adds the header `"cross-origin-embedder-policy": "require-corp"` to all responses from the `ReportsController` and any other controller configured in the project.

### .NET Framework

The solution is similar with the corresponding tools provided by the target framework.

The Stackoverflow thread [Add a custom response header in ApiController](https://stackoverflow.com/questions/32017686/add-a-custom-response-header-in-apicontroller) elaborates on the available approaches.

## See Also

* [How to add custom header to ASP.NET Core Web API response](https://stackoverflow.com/questions/46183171/how-to-add-custom-header-to-asp-net-core-web-api-response)
* [Add a custom response header in ApiController](https://stackoverflow.com/questions/32017686/add-a-custom-response-header-in-apicontroller)
