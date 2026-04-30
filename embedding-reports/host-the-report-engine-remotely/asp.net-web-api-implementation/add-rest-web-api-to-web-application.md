---
title: Adding to Web Application
page_title: Hosting Telerik Reporting REST Service in ASP.NET
description: "Learn how to configure the Telerik Reporting REST Service in an ASP.NET application through the Visual Studio project template or manually."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application
tags: add, telerik, reporting, rest, web, api, application
published: True
reportingArea: RESTService
position: 2
previous_url: /telerik-reporting-rest-host-http-service-using-web-hosting,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/add-rest-web-api-to-web-application
---

# Hosting the Telerik Reporting REST Service in an ASP.NET Application

In this case, the Web API will be hosted on top of the classic ASP.NET hosting infrastructure, supported by the IIS (Internet Information Services) server. The REST service setup can be done either by using the Telerik Reporting REST Service project template or manually, as explained below.

## Using the REST Service Project Template

In Visual Studio, open the **Add New Project** dialog and select the **Telerik Reporting REST Service (.NET Framework)** project template, which appears when selecting the **Reporting** category from the left pane. This will add a new project in your solution that contains all the necessary files and packages to host the Telerik Reporting REST service instance.

The project has a preconfigured implementation of the reports controller that uses the `~\Reports` path for its report source resolver. This directory is not automatically created and needs to be created, or the path to be modified accordingly, prior to running the project.

## Manually Configuring the Telerik Reporting REST Service on IIS

1. In Visual Studio, create the hosting project. That might be one of the following project templates: **ASP.NET Empty Web Application**, **ASP.NET Web Forms Application**, **ASP.NET MVC Web Application**.
1. (Only for Empty Web Application / Web Forms Application) Install the [`Microsoft.AspNet.WebApi.WebHost`](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.WebHost) NuGet package (WebAPI 2, version 5.2.x or later is recommended). Besides the required assemblies, this will add the necessary handlers to the `Web.config`:

	{{source=CodeSnippets\MvcCS\Web.config region=RemoveAndAddHandlers}}

	> note
	>
	> Because the Reporting REST WebAPI Service was originally built against WebAPI 1, when you reference a newer version of `Microsoft.AspNet.WebApi.WebHost` (or `Microsoft.AspNet.WebApi.SelfHost`) you have to redirect `System.Web.Http` and `System.Net.Http.Formatting` to the newer version. The [Visual Studio NuGet Package Manager](https://docs.nuget.org/consume/installing-nuget) can add the required binding redirects automatically when you update NuGet packages through it. Alternatively, add the following `bindingRedirects` to your `Web.config` and replace `5.1.0.0` in the sample with the exact version of the WebAPI assemblies referenced by your project:

	{{source=CodeSnippets\MvcCS\AssemblyBinding.xml}}

	> note
	>
	> **Legacy WebAPI 1 baseline.** Existing projects still on WebAPI 1 can install the [`Microsoft.AspNet.WebApi.WebHost 4.0.30506`](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.WebHost/4.0.30506) NuGet package instead. The same handler entries shown above will be added to the `Web.config`, and no binding redirects are required for that baseline.

1. Make sure that the project has the following assembly references:

	- `Newtonsoft.Json.dll`
	- `System.Web.Http.dll`
	- `System.Web.Http.WebHost.dll`
	- `System.Net.Http.dll`
	- `System.Net.Http.Formatting.dll`

1. [Implement the `ReportsController` in your application](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application)
1. (Only for Empty Web Application) Add a new item **Global Application Class**.
1. Invoke [RegisterRoutes](/api/telerik.reporting.services.webapi.reportscontrollerconfiguration#telerik_reporting_services_webapi_reportscontrollerconfiguration_registerroutes_system_web_http_httpconfiguration_) at the beginning of the `Global.Application_Start (Global.asax)` method:

	{{source=CodeSnippets\MvcCS\Global.asax.cs region=ReportsControllerConfiguration_RegisterRoutes}}
	{{source=CodeSnippets\MvcVB\Global.asax.vb region=ReportsControllerConfiguration_RegisterRoutes}}

1. Run the application
1. To verify whether the service works correctly, you can request the available document formats using the following URL:

	`http://localhost:[portnumber]/api/reports/formats`

	If the request is successful, you should receive the document formats encoded in JSON. For more information, see: [Get Available Document Formats](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats).

	> note
	>
	> The call to `http://localhost:[portnumber]/api/reports/formats` does not require authorization by design, as this request is for test purposes, i.e., to check whether the REST Service is running.

1. Enable [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) (_optional_)

	1. Add the `Microsoft.AspNet.WebApi.Cors` NuGet package to the project. It may add other required references. It may be necessary to upgrade some of the already installed packages.
	1. Add the following code at the beginning of the `Global.Application_Start` (`Global.asax`) method:

		{{source=CodeSnippets\MvcCS\Global.asax.cs region=EnableCors}}
		{{source=CodeSnippets\MvcVB\Global.asax.vb region=EnableCors}}

	1. Add the following attribute to the `ReportsController` class (requires reference to `System.Web.Http.Cors`):

		{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=EnableCorsAttributeReportsController}}
		{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=EnableCorsAttributeReportsController}}

## Next Steps

- [Implement the `ReportsController` in an ASP.NET application](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application)
- [Use the HTML5 Report Viewer with the Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service)

## See Also

- [ASP.NET Web API Implementation Overview](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview)
- [Requirements for the ASP.NET Web API Implementation](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/requirements)
- [Implementing the `ReportsController` in an ASP.NET Application](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application)
- [Self-Hosting the Telerik Reporting REST Web API](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api)
- [`restReportService` Configuration Element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element)
- [Localization](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/localization)
