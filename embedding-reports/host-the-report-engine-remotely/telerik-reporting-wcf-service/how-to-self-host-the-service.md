---
title: How to Self Host the Service
page_title: How to Self Host the Service 
description: How to Self Host the Service
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-self-host-the-service
tags: how,to,self,host,the,service
published: True
position: 2
---

# How to Self Host the Service

The advantages of a Self-Hosted service:

* Easy to use: With only a few lines of code you have your service running.

* Easy to debug: 

	Debugging WCF services that are hosted in a self-hosted environment provides a familiar way of debugging, without having to attach to separate applications that activate your service.

* Easy to deploy.

* Flexible: You can easily control the lifetime of your services.

* Supports all bindings and transport.

## To create a Telerik self-hosted reporting service follow the steps below

1. Create a new Windows console application.

1. Add references to the following System assemblies: 

   + System.ServiceModel

   + System.Runtime.Serialization

   + System.Drawing

   + System.Windows.Forms


1. Add references to the following Telerik Reporting assemblies: 

   + Telerik.Reporting

   + Telerik.Reporting.Service

   + Telerik.Reporting.XpsRendering (in case you plan to render reports in XPS format)

1. The Telerik Reporting WCF Service is represented by the Telerik.Reporting.Service.ReportServiceBase - abstract class that requires a base URI to be used for proper resource resolution. This base URI is usually the well-known address of the report service endpoint:

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=ReportServiceBase_baseUriSnippet}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=ReportServiceBase_baseUriSnippet}}

1. Create a ServiceHost for our ReportService and call its Open method:

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.cs region=CreateServiceHostSnippet}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\Service\ReportServiceBaseSnippets.vb region=CreateServiceHostSnippet}}

1. To configure the service and its endpoints add the next code to the application’s configuration file: 

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Service\SelfHostedServiceEndpoints.xml}}

1. Add a new report Report1 to the project to test the self-hosted report service. 

1. Run the application – the Windows console will appear and when the "Ready…" message appears the service is ready to operate. 

1. To test the self-hosted Telerik Reporting WCF Service we use the Export operation for the Resource Service (__Telerik.Reporting.Service.IResourceService__). As it is dedicated to be used by __HTTP GET__ request we will use a web browser application as a client. Open any web browser and type the next address: 
    
	````
http://localhost:54321/reportservice/resources/export?format=PDF&report=YourNameSpace.Report1,YourNameSpace&deviceInfo={}&parameterValues={}
````

    This will call the __IResourceService__. Export operation that will render the report in __PDF__ with no deviceInfo or parameterValues. When completed, a PDF document will be sent back to the browser. 
