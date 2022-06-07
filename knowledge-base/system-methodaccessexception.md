---
title: Getting System.MethodAccessException when running a web application with the HTML5 Report Viewer 
description: System.MethodAccessException - Attempt by method 'System.Web.Http.HttpConfiguration..ctor(System.Web.Http.HttpRouteCollection)' to access method 'System.Web.Http.HttpConfiguration.DefaultFormatters()' failed.
type: troubleshooting
page_title: The Reporting REST Service is throwing a System.MethodAccessException
slug: system-methodaccessexception
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting REST WebApi Service</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
    <td>Report Viewer</td>
		<td>HTML5 Report Viewer</td>
	</tr>
</table>

## Description

The above error appears on the page when running a web application with the HTML5 Report Viewer if the **Microsoft.AspNet.WebApi.WebHost** referenced assembly is of version older than **4.0.30506**.

## Error Message

*System.MethodAccessException: Attempt by method 'System.Web.Http.HttpConfiguration..ctor(System.Web.Http.HttpRouteCollection)' to access method 'System.Web.Http.HttpConfiguration.DefaultFormatters()' failed.*

## Possible Cause
  
The common reason for this error is that some assemblies that are required by the Reporting ASP.NET Web API service are missing - [Requirements for using Telerik Reporting REST WebAPI service](../telerik-reporting-rest-service-web-api-system-requirements).  
  
## Solution  
  
 In order to have a Web API based controller in the application, you need to install [Microsoft.AspNet.WebApi.WebHost 4.0.30506](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.WebHost/4.0.30506) NuGet package or later.  
 
 ## Notes  
 
If you use a newer version of *Microsoft.AspNet.WebApi.WebHost* (e.g. **WebAPI 2**) you have to redirect the *System.Web.Http* and *System.Net.Http.Formatting* to their newer version.
 
To do this, add the following [bindingRedirects](ttps://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element?redirectedfrom=MSDN) to your **web.config** and replace **5.1.0.0** with the exact version:  

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
### See Also

[How To: Add Telerik Reporting REST Web API to Web Application](../telerik-reporting-rest-host-http-service-using-web-hosting).  
