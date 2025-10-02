---
title: Adding to Web Application
page_title: Hosting Telerik Reporting REST Service in ASP.NET
description: "Learn how to configure the Telerik Reporting REST Service in an ASP.NET application through the Visual Studio project template or manually."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application
tags: how,to,add,telerik,reporting,rest,web,api,to,web,application
published: True
reporting_area: RESTService
position: 2
previous_url: /telerik-reporting-rest-host-http-service-using-web-hosting,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/add-rest-web-api-to-web-application
---

# Hosting the Telerik Reporting REST Service in an ASP.NET Application

In this case the Web API will be hosted on top of the classic ASP.NET hosting infrastructure, supported by the IIS (Internet Information Services) server. The REST service setup can be done either by using the Telerik Reporting REST Service project template or manually, as explained below.

## Using the REST Service Project Template

In Visual Studio open the __Add New Project__ dialog and select *Telerik Reporting REST Service (.NET Framework)* project template, which appears when selecting `Reporting` category from the left pane. This will add a new project in your solution that contains all the necessary files and packages to host the Telerik Reporting REST service instance.

The project has a preconfigured implementation of reports controller that uses the *"~\Reports"* path for its report source resolver. This directory is not automatically created and needs to be created, or the path to be modified accordingly prior to running the project.

## Manually configuring Telerik.Reporting REST Service on IIS

### To host and configure the Telerik.Reporting REST Service on IIS follow the steps below:

1. In Visual Studio, create the hosting project. That might be one of the following project templates: ASP.NET Empty Web Application, ASP.NET Web Forms Application, ASP.NET MVC Web Application.
1. (Only for Empty Web Application / Web Forms Application) Install the [Microsoft.AspNet.WebApi.WebHost 4.0.30506](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.WebHost/4.0.30506) NuGet package. Besides the required assemblies this will add the necessary handlers for version 4.0.30506 to the Web.config:

	````XML
	<handlers>
		<remove name="ExtensionlessUrlHandler-ISAPI-4.0_32bit" />
		<remove name="ExtensionlessUrlHandler-ISAPI-4.0_64bit" />
		<remove name="ExtensionlessUrlHandler-Integrated-4.0" />
		<add name="ExtensionlessUrlHandler-ISAPI-4.0_32bit" path="*." verb="GET,HEAD,POST,DEBUG,PUT,DELETE,PATCH,OPTIONS" modules="IsapiModule" scriptProcessor="%windir%\Microsoft.NET\Framework\v4.0.30319\aspnet_isapi.dll" preCondition="classicMode,runtimeVersionv4.0,bitness32" responseBufferLimit="0" />
		<add name="ExtensionlessUrlHandler-ISAPI-4.0_64bit" path="*." verb="GET,HEAD,POST,DEBUG,PUT,DELETE,PATCH,OPTIONS" modules="IsapiModule" scriptProcessor="%windir%\Microsoft.NET\Framework64\v4.0.30319\aspnet_isapi.dll" preCondition="classicMode,runtimeVersionv4.0,bitness64" responseBufferLimit="0" />
		<add name="ExtensionlessUrlHandler-Integrated-4.0" path="*." verb="GET,HEAD,POST,DEBUG,PUT,DELETE,PATCH,OPTIONS" type="System.Web.Handlers.TransferRequestHandler" preCondition="integratedMode,runtimeVersionv4.0" />
	</handlers>
	````

	>The Reporting REST WebAPI Service is built against WebAPI 1. In case you have to use __newer version of Microsoft.AspNet.WebApi.WebHost (e.g. WebAPI 2)__ you have to redirect the `System.Web.Http` and `System.Net.Http.Formatting` to their newer version. To do this, add the following binding redirects to your web.config and replace `5.1.0.0` with the exact version: 
	>
	>````XML
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
	````

	>[Visual Studio NuGet Package Manager](https://docs.nuget.org/consume/installing-nuget) will add the required binding redirects automatically, if you use it to update the NuGet packages.

1. Make sure that the project has the following assembly references:

	+ Newtonsoft.Json.dll
	+ System.Web.Http.dll
	+ System.Web.Http.WebHost.dll
	+ System.Net.Http.dll
	+ System.Net.Http.Formatting.dll

1. [Implement the reports controller]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
1. (_Only for Empty Web Application_) Add new item "Global Application Class"
1. Invoke [RegisterRoutes](/api/Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration#Telerik_Reporting_Services_WebApi_ReportsControllerConfiguration_RegisterRoutes_System_Web_Http_HttpConfiguration_) at the beginning of the `Global.Application_Start (Global.asax)` method:

	{{source=CodeSnippets\MvcCS\Global.asax.cs region=ReportsControllerConfiguration_RegisterRoutes}}
	{{source=CodeSnippets\MvcVB\Global.asax.vb region=ReportsControllerConfiguration_RegisterRoutes}}


1. Run the application
1. To verify whether the service works correctly you can make a request for the available document formats using the following URL:

	`http://localhost: [portnumber]/api/reports/formats`

	If the request is successful you should receive the document formats encoded in JSON. For more information see: [Get Available Document Formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%}).

	>The call to `http://localhost:[portnumber]/api/reports/formats` does not require authorization by design, as this request is for test purposes, i.e. to check whether the REST Service is running.

1. Enable [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) (*optional*)

	1. Add __Microsoft.AspNet.WebApi.Cors__ NuGet package to the project. It may add other required references. It may be necessary to upgrade some of the already installed packages.
	1. Add the following code at the beginning of the `Global.Application_Start` (__Global.asax__) method:

	````C#
	GlobalConfiguration.Configuration.EnableCors();
	````
	````VB
	GlobalConfiguration.Configuration.EnableCors();
	````


	1. Add the following attribute to the `ReportsController` class (requires reference to `System.Web.Http.Cors`):

	````C#
	[EnableCors(origins:"*", headers:"*", methods:"*")]
	````
	````VB
	<EnableCors(origins:"*", headers:"*", methods:"*")>
	````


## See Also

* [Localization]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/localization%})
