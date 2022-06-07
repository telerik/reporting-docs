---
title: How to Add Telerik Reporting WCF Service to Web Application
page_title: How to Add Telerik Reporting WCF Service to Web Application 
description: How to Add Telerik Reporting WCF Service to Web Application
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application
tags: how,to,add,telerik,reporting,wcf,service,to,web,application
published: True
position: 1
---

# How to Add Telerik Reporting WCF Service to Web Application

This topic describes how to host the Telerik Reporting WCF Service in IIS. For this purpose you should follow the steps below to configure your web application: 

1. Required assembly references:

   + __System.ServiceModel.dll__ assembly 

   + __Telerik.Reporting.Service.dll__ assembly 

   + Assemblies with Telerik Reports to be exposed through the Reporting Service

1. Add .svc file (e.g. __ReportService.svc__) to reference the [Telerik.Reporting.Service.ReportService](/reporting/api/Telerik.Reporting.Service.ReportService). The file would contain the following line only: 
    
	````XML
<%@ServiceHost Service="Telerik.Reporting.Service.ReportService, Telerik.Reporting.Service, Version=x.x.x.x, Culture=neutral, PublicKeyToken=A9D7983DFCC261BE" %>
````

	>The code sample have the version listed as Version=x.x.x.x, and you should change that with the exact assembly version you use before proceeding. 

1. Register the Reporting Service endpoints in the web.config: 
    
	````XML
<configuration>
	...
		<system.serviceModel>
			<serviceHostingEnvironment aspNetCompatibilityEnabled="true" />
			<services>
				<service
						name="Telerik.Reporting.Service.ReportService"
						behaviorConfiguration="ReportServiceBehavior">
					<!-- endpoint allowing clients access to the Reporting WCF service -->
					<endpoint
						address=""
						binding="basicHttpBinding"
						contract="Telerik.Reporting.Service.IReportService">
					</endpoint>
					<!-- endpoint allowing clients access to resources as images -->
					<endpoint
							address="resources"
							binding="webHttpBinding"
							behaviorConfiguration="WebBehavior"
							contract="Telerik.Reporting.Service.IResourceService"/>
					<!-- endpoint allowing clients access to receive service's metadata via SOAP messages -->
					<endpoint
							address="mex"
							binding="mexHttpBinding"
							contract="IMetadataExchange" />
				</service>
			</services>
			<behaviors>
				<serviceBehaviors>
					<behavior name="ReportServiceBehavior">
						<serviceMetadata httpGetEnabled="true" />
						<serviceDebug includeExceptionDetailInFaults="false" />
					</behavior>
				</serviceBehaviors>
				<endpointBehaviors>
					<behavior name="WebBehavior">
						<webHttp />
					</behavior>
				</endpointBehaviors>
			</behaviors>
		</system.serviceModel>
	 ...
	</configuration>														
````


> For troubleshooting and configuring IIS hosted WCF services, please refer to [IIS Hosted Service Fails](http://msdn.microsoft.com/en-us/library/ms752252.aspx) article in MSDN. 

## See Also

* [Hosting Windows Communication Foundation Services](http://msdn.microsoft.com/en-us/library/ms730158.aspx) 

* [How to: Host a WCF Service in IIS](http://msdn.microsoft.com/en-us/library/ms733766.aspx)
