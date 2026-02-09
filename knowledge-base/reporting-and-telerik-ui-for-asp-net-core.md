---
title: Telerik Reporting Cannot Coexist with Telerik UI for ASP.NET Core
description: "Learn how to host Telerik Reporting and Telerik UI for ASP.NET Core in the same web application."
type: how-to
page_title: Host Telerik Reporting and Telerik UI for ASP.NET Core in the same project
slug: reporting-and-telerik-ui-for-asp-net-core
ticketid: 1594935
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
			<td>19.3.26.121 or older</td>
		</tr>
	</tbody>
</table>

## Description

> important Starting with the **Progress® Telerik® Reporting 2026 Q1** release, the .NET-based Reporting services now use [System.Text.Json](https://www.nuget.org/packages/System.Text.json).

I created a new **Telerik ASP.NET Core MVC Application** with a Telerik Grid and it worked as expected.

In the same project, I added a new **Telerik HTML5 Report Viewer Page** item and the needed Reporting REST Service with a sample report.

The report was displayed successfully when I ran the project. However, when I went back to the Grid, it stopped working.

## Solution

The issue is due to the [Microsoft.AspNetCore.Mvc.NewtonsoftJson](https://www.nuget.org/packages/microsoft.aspnetcore.mvc.newtonsoftjson/) package that is required by the **Telerik Reporting REST Service**. By default, the **Telerik UI for ASP.NET Core** product uses alternative JSON serialization.

In order to use `Newtonsoft.Json` for the serialization in **Telerik UI for ASP.NET Core**, the following serializer settings must be set in the `AddNewtonsoftJson` constructor:

```C#
services
	.AddRazorPages()
	.AddNewtonsoftJson(options => options.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.DefaultContractResolver());
```

For more information, you may have a look at the [ASP.NET Core JSON Serialization - Telerik UI for ASP.NET Core](https://docs.telerik.com/aspnet-core/installation/json-serialization#configure-json-serialization-in-aspnet-core-6-and-the-minimal-hosting-model) article.

## See Also

- [ASP.NET Core JSON Serialization - Telerik UI for ASP.NET Core](https://docs.telerik.com/aspnet-core/installation/json-serialization#configure-json-serialization-in-aspnet-core-6-and-the-minimal-hosting-model)
- [Hosting the Telerik Reporting REST Service in ASP.NET Core in .NET 6 and .NET 7 with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})
- [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application in .NET 6 and .NET 7 with Startup.cs]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%})
- [Hosting the Telerik Reporting REST Service in an ASP.NET Core Application in .NET Core 3.1]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%})
