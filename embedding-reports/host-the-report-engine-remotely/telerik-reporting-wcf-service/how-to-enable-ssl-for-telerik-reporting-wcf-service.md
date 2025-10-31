---
title: Enabling SSL
page_title: Enabling SSL for Telerik Reporting WCF service
description: "Learn How to Enable SSL for Telerik Reporting WCF service."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-enable-ssl-for-telerik-reporting-wcf-service
tags: how,to,enable,ssl,for,telerik,reporting,wcf,service
published: True
reportingArea: RESTService
position: 3
previous_url: /silverlight-enable-ssl-for-telerik-reporting-wcf-service
---

# Enabling SSL for the Reporting WCF service

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

When using HTTP as the transport, security is provided by a Secure Sockets Layer (SSL) implementation. SSL is widely used on the Internet to authenticate a service to a client, and then to provide confidentiality (encryption) to the channel. This topic explains how to enable SSL for the Telerik Reporting WCF service.

The solution is to configure corresponding bindings to use [Transport security mode](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/transport-security-overview). Use the [bindingConfiguration property](https://learn.microsoft.com/en-us/dotnet/api/system.servicemodel.configuration.serviceendpointelement.bindingconfiguration?view=netframework-4.8.1#System_ServiceModel_Configuration_ServiceEndpointElement_BindingConfiguration) inside your endpoint definition to point to your custom bindings. 

> To run your application using HTTPS the application must be hosted on a server supporting SSL. The Visual Studio Development Server, also known as Cassini, does not support SSL. for more details about configuring your IIS hosted application to use SSL, please refer to [How to: Configure an IIS-hosted WCF service with SSL](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/how-to-configure-an-iis-hosted-wcf-service-with-ssl)

The entire HTTPS-enabled system.serviceModel section of web.config is below:

````XML
<system.serviceModel>
	<serviceHostingEnvironment aspNetCompatibilityEnabled="true" />
	<!--security settings -->
		<bindings>
			<basicHttpBinding>
				<binding name="BasicHttpBindingConfig">
					<security mode="Transport"/>
				</binding>
			</basicHttpBinding>
			<webHttpBinding>
				<binding name="WebHttpBindingConfig">
					<security mode="Transport"/>
				</binding>
			</webHttpBinding>
		</bindings>
		<services>
			<service name="Telerik.Reporting.Service.ReportService"
						behaviorConfiguration="ReportServiceBehavior">
				<!-- endpoint allowing clients access to the Reporting WCF service -->
				<endpoint address=""
							binding="basicHttpBinding"
							bindingConfiguration="BasicHttpBindingConfig"
							contract="Telerik.Reporting.Service.IReportService">
					<identity>
						<dns value="localhost" />
					</identity>
				</endpoint>
				<!-- endpoint allowing clients access to resources as images -->
				<endpoint address="resources"
							binding="webHttpBinding"
							bindingConfiguration="WebHttpBindingConfig"
							behaviorConfiguration="WebBehavior"
							contract="Telerik.Reporting.Service.IResourceService"/>
				<!-- endpoint allowing clients access to receive service's metadata via SOAP messages -->
				<endpoint address="mex"
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
````

> The service can be tested after browsing the .svc file using HTTPS. If you want to show the service wsdl content set the ReportServiceBehavior `<serviceMetadata httpsGetEnabled="true" />`

## See Also

* [How to Setup SSL on IIS 7](https://learn.microsoft.com/en-us/iis/manage/configuring-security/how-to-set-up-ssl-on-iis)
* [Transport Security Overview](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/transport-security-overview)
* [HTTP Transport Security](https://learn.microsoft.com/en-us/dotnet/framework/wcf/feature-details/http-transport-security)
* [BasicHttpSecurityMode Enumeration](https://learn.microsoft.com/en-us/dotnet/api/system.servicemodel.basichttpsecuritymode?view=dotnet-plat-ext-7.0)
