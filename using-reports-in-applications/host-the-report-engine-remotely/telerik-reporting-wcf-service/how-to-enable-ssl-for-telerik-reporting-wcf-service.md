---
title: How to Enable SSL for Telerik Reporting WCF service
page_title: How to Enable SSL for Telerik Reporting WCF service | for Telerik Reporting Documentation
description: How to Enable SSL for Telerik Reporting WCF service
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-enable-ssl-for-telerik-reporting-wcf-service
tags: how,to,enable,ssl,for,telerik,reporting,wcf,service
published: True
position: 3
---

# How to Enable SSL for Telerik Reporting WCF service



When using HTTP as the transport, security is provided by a Secure Sockets Layer (SSL) implementation. SSL is widely used on the Internet to authenticate a service to a client, and then to provide confidentiality (encryption) to the channel. This topic explains how to enable SSL for the Telerik Reporting WCF service.

The solution is to configure corresponding bindings to use  [Transport security mode](http://msdn.microsoft.com/en-us/library/ms729700(v=vs.110).aspx) . Use the  [bindingConfiguration property](http://msdn.microsoft.com/en-us/library/system.servicemodel.configuration.serviceendpointelement.bindingconfiguration.aspx)  inside your endpoint definition to point to your custom bindings.       

>caution To run your application using HTTPS the application must be hosted on a server supporting SSL. The Visual Studio Development Server, also known as Cassini, does not support SSL. for more details about configuring your IIS hosted application to use SSL, please refer to  [How to: Configure an IIS-hosted WCF service with SSL](http://msdn.microsoft.com/en-us/library/hh556232(v=vs.110).aspx) 


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



>tip The service can be tested after browsing the .svc file using HTTPS. If you want to show the service wsdl content set the ReportServiceBehavior             <serviceMetadata httpsGetEnabled="true" />          	


## Related topics:

*  [How to Setup SSL on IIS 7](http://learn.iis.net/page.aspx/144/how-to-setup-ssl-on-iis-70/) 

*  [Transport Security Overview](http://msdn.microsoft.com/en-us/library/ms729700.aspx) 

*  [HTTP Transport Security](http://msdn.microsoft.com/en-us/library/ms734679.aspx) 

*  [BasicHttpSecurityMode Enumeration](http://msdn.microsoft.com/en-us/library/system.servicemodel.basichttpsecuritymode.aspx) 
