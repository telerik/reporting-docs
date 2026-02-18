---
title: Self Hosting
page_title: Self Hosting the Telerik Reporting REST Web API
description: "Learn how to Host the Telerik Reporting REST Service ASP.NET Web API in a console application, without IIS."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api
tags: how,to,self,host,telerik,reporting,rest,web,api
published: True
reportingArea: RESTService
position: 3
previous_url: /telerik-reporting-rest-host-http-service-using-self-hosting,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api
---

# Self Hosting the Telerik Reporting REST Service Web API in a Console Application

ASP.NET Web API does not require IIS. You can self-host a Web API in your own host process. This tutorial shows how to host a Telerik Reporting REST Web API inside a console application. For more information on the hosting options see: [Hosting ASP.NET Web API](https://learn.microsoft.com/en-us/aspnet/web-api/overview/hosting-aspnet-web-api/)

## To create a self-hosted HTTP service follow the steps below:

1. On an elevated console (“Run as administrator”), execute the following command for example to allow the running user to listen on port 8080:

	`netsh http add urlacl url=http://+:8080/ user=DOMAIN\user`

1. On Visual Studio, create a “Console Application” project
1. Install the [Microsoft.AspNet.WebApi.SelfHost 4.0.30506](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.SelfHost/4.0.30506) NuGet package

	>The Reporting REST WebAPI Service is built against WebAPI 1. In case you have to use __newer version of Microsoft.AspNet.WebApi.SelfHost (e.g. WebAPI 2)__ you have to redirect the System.Web.Http and System.Net.Http.Formatting to their newer version. To do this, add the following bindingRedirects to your app.config and replace 5.1.0.0 with the exact version:
	>
	>````XML
	><?xml version="1.0" encoding="utf-8" ?>
	><configuration>
	>	<runtime>
	>		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
	>			<dependentAssembly>
	>				<assemblyIdentity name="System.Web.Http" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
	>				<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
	>			</dependentAssembly>
	>			<dependentAssembly>
	>				<assemblyIdentity name="System.Net.Http.Formatting" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
	>				<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
	>			</dependentAssembly>
	>		</assemblyBinding>
	>	</runtime>
	></configuration>
	>````
	>[Visual Studio NuGet Package Manager](https://docs.nuget.org/consume/installing-nuget)can add the required binding redirects automatically, if you update NuGet packages through it.

1. Make sure that the project have the following assembly references:

	+ System.Web
	+ Newtonsoft.Json.dll
	+ System.Web.Http.dll
	+ System.Web.Http.SelfHost.dll
	+ System.Net.Http.dll
	+ System.Net.Http.Formatting.dll

1. Implement the reports controller as explained in the article [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
1. Implement the starting point of the application:

	{{source=CodeSnippets\MvcCS\SelfHostedSnippets\Program.cs region=SelfHostedRestService}}
	{{source=CodeSnippets\MvcVB\SelfHostedSnippets\Program.vb region=SelfHostedRestService}}


1. Run the console app
1. To verify whether the service works correctly you can make a sample request for the available document formats using the following URL:

	`http://localhost: [portnumber]/api/reports/formats`

	If the request is successful you should receive the document formats encoded in JSON. For more information see: [Get Available Document Formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%}).

1. When you are finished self-hosting, be sure to delete the reservation:

	`netsh http delete urlacl url=http://+:8080/`

## See Also

* [Localization]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/localization%})
* [Hosting ASP.NET Web API](https://learn.microsoft.com/en-us/aspnet/web-api/overview/hosting-aspnet-web-api/)
