---
title: HTML5 viewer Visual Studio item template failed to add NuGet packages 
description: Error problem occurred while trying to install the NuGet package when using HTML5 viewer item templates in Visual Studio
type: troubleshooting
page_title: Error occurred while adding HTML5 Report Viewer when using Visual Studio item templates
slug: item-template-failed-to-add-nuget-packages
position: 
tags: itemtemplates,html5viewer
ticketid: 1157878
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Product Version</td>
		<td>12.0 18.227</td>
	</tr>
</table>


## Description

Visual Studio item templates for adding HTML5 Report Viewer fail to add the dependant NuGet packages.

## Error Message
An error occurred while adding an HTML page with Telerik HTML5 Report Viewer

`Error: System.InvalidOperationException: A problem occurred while trying to install the NuGet package "package name"`

You can try to update your NuGet client or install the packages manually.

## Solution

The fix was provided in [R1 2018 Service Pack 3](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r1-2018-sp3-12-0-18-416) release (version `12.0.18.416`) of Telerik Reporting.

## Suggested Workarounds

Download the required packages manually using NuGet package manager:

**1. Microsoft ASP.NET 4.0**

	- System.Web.dll (4.0.0.0)
	- System.Net.Http.dll (4.0.0.0)
	- System.Net.Http.Formatting.dll (4.0.0.0)
	- System.Web.Http.dll (4.0.0.0)
	- System.Web.Http.WebHost.dll (4.0.0.0) required for hosting in IIS
	- System.Web.Http.SelfHost.dll (4.0.0.0) required for Self-Hosting


**2. Newtonsoft.Json.dll 4.5.1.0** (latest available via NuGet is recommended)

You can use a newer WebAPI version by updating the corresponding ([Microsoft.AspNet.WebApi.WebHost](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.WebHost) and [Microsoft.AspNet.WebApi.SelfHost](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.SelfHost)) NuGet packages 
and applying the following `bindingRedirects` to your application configuration file. Replace `5.1.0.0` with the exact version:
```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
		<dependentAssembly>
			<assemblyIdentity name="System.Web.Http" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
			<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
		</dependentAssembly>
		<dependentAssembly>
			<assemblyIdentity name="System.Net.Http.Formatting" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
			<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
		</dependentAssembly>
		</assemblyBinding>
	</runtime>
</configuration>
```

## See Also

[How To: Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%})
  
