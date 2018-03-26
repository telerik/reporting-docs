---
title: HTML5 viewer project template failed to add NuGet packages 
description: A problem occurred while trying to install the NuGet package error when using HTML5 viewer project templates in Visual Studio
type: troubleshooting
page_title: Error occurred while adding HTML5 Report Viewer when using Visual Studio project templates
slug: project-template-failed-to-add-nuget-packages
position: 
tags: projecttemplates,html5viewer
ticketid: 1157878
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.0 18.227</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Visual Studio project templates for adding HTML5 report viewer fail to add NuGet packages.

## Error Message
An error occurred while adding an HTML page with Telerik HTML5 Report Viewer

Error: System.InvalidOperationException: A problem occurred while trying to install the NuGet package "package name"

You can try to update your NuGet client or install the packages manually.

## Cause\Possible Cause(s)
Reporting project templates use Visual Studio service for adding NuGet packages. The service seems to be no longer active. 
The issue is logged for further investigation and improvements. The fix will be provided in the subsequent releases.

## Suggested Workarounds

Download the required packages manually using NuGet package manager. Telerik Reporting ASP.NET Web API service implementation requires the following ASP.NET and third party assemblies:

**1. Microsoft ASP.NET 4.0**

  - System.Web.dll (4.0.0.0)

  - System.Net.Http.dll (2.0.0.0)

  - System.Net.Http.Formatting.dll (4.0.0.0)

  - Web API 4.0.30506:

      System.Web.Http.dll (4.0.0.0)

      System.Web.Http.WebHost.dll (4.0.0.0) required for hosting in IIS

      System.Web.Http.SelfHost.dll (4.0.0.0) required for SelHosting


**2. Newtonsoft.Json.dll 4.5.1.0** (latest available via NuGet is recommended)

You can use a newer WebAPI version by updating the corresponding (Microsoft.AspNet.WebApi.WebHost and Microsoft.AspNet.WebApi.SelfHost) NuGet packages 
and applying the following bindingRedirects to your application configuration file. Replace 5.1.0.0 with the exact version:
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

[How To: Add Telerik Reporting REST Web API to Web Application](https://docs.telerik.com/reporting/telerik-reporting-rest-host-http-service-using-web-hosting)
  
