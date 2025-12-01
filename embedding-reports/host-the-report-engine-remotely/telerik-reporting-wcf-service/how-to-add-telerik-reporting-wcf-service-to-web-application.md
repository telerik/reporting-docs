---
title: Add Telerik Reporting WCF Service to Web Application
page_title: Adding Telerik Reporting WCF Service to Web Application Explained
description: "Learn how to Add Telerik Reporting WCF Service to Web Application."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application
tags: how,to,add,telerik,reporting,wcf,service,to,web,application
published: True
reportingArea: RESTService
position: 1
previous_url: /silverlight-hosting-in-iis
---

# How to Add Telerik Reporting WCF Service to Web Application

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

This topic describes how to host the Telerik Reporting WCF Service in IIS. For this purpose you should follow the steps below to configure your web application:

1. Required assembly references:

	+ __System.ServiceModel.dll__ assembly
	+ __Telerik.Reporting.Service.dll__ assembly
	+ Assemblies with Telerik Reports to be exposed through the Reporting Service

1. Add .svc file (e.g. __ReportService.svc__) to reference the __Telerik.Reporting.Service.ReportService__. The file would contain the following line only:

	````XML
<%@ServiceHost Service="Telerik.Reporting.Service.ReportService, Telerik.Reporting.Service, Version=x.x.x.x, Culture=neutral, PublicKeyToken=A9D7983DFCC261BE" %>
````

	>The code sample has the version listed as Version=x.x.x.x, and you should change that with the exact assembly version you use before proceeding.

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


> For troubleshooting and configuring IIS-hosted WCF services, please refer to [IIS Hosted Service Fails](https://learn.microsoft.com/en-us/previous-versions/dotnet/netframework-3.5/ms752252(v=vs.90)) article in MSDN.

## See Also

* [Hosting Windows Communication Foundation Services](https://learn.microsoft.com/en-us/dotnet/framework/wcf/hosting-services)
* [How to: Host a WCF Service in IIS](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-host-a-wcf-service-in-iis)
