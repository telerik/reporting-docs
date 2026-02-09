---
title: JSONResult.SerializerSettings Must Be of Type System.Text.Json.JsonSerializerOptions
description: ASP.NET Core 3+ versions use a different Json Serializer. Read this article to find out how to resolve this.
type: how-to
page_title: Serializer Settings Must Be of Type System.Text.Json.JsonSerializerOptions
slug: jsonresult-serializersettings-must-be-an-instance-of-type-systemtextjson-jsonserializeroptions
position:
tags:
ticketid: 1460827
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.219+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>.NET Framework</td>
			<td>.NET Core 3.0+ / .NET 5+</td>
		</tr>
	</tbody>
</table>

## Description

> important Starting with the **Progress® Telerik® Reporting 2026 Q1** release, the .NET-based Reporting services now use [System.Text.Json](https://www.nuget.org/packages/System.Text.json).

If the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}) project is targeting **.NET Core 3.0+(or .NET 5+)** and is throwing the error `JSONResult.SerializerSettings Must Be of Type System.Text.Json.JsonSerializerOptions`

## Solution

1. Add the NuGet Package, [Microsoft.AspNetCore.Mvc.NewtonsoftJson](https://www.nuget.org/packages/microsoft.aspnetcore.mvc.newtonsoftjson/)
1. Append `.AddNewtonsoftJson()` to any of the following _services_ configurations:

   ```C#
   services.AddControllers().AddNewtonsoftJson();
   ```

   ```C#
   services.AddControllersWithViews().AddNewtonsoftJson();
   ```

   ```C#
   services.AddRazorPages().AddNewtonsoftJson();
   ```

## See Also

- [ASP.NET Core 3.0+ Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%})
