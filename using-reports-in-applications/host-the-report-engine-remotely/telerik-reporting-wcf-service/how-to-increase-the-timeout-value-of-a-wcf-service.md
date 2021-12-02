---
title: How to Increase the timeout value of a WCF service
page_title: How to Increase the timeout value of a WCF service | for Telerik Reporting Documentation
description: How to Increase the timeout value of a WCF service
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-increase-the-timeout-value-of-a-wcf-service
tags: how,to,increase,the,timeout,value,of,a,wcf,service
published: True
position: 5
---

# How to Increase the timeout value of a WCF service



To avoid timeouts when using the Telerik Reporting WCF Service, one should set several attributes     	on the client and server side.        

## Timeouts on server binding

	
````xml
<bindings>
   <basicHttpBinding>
        <binding name="BasicHttpsBindingConfig" maxReceivedMessageSize="2147483647" maxBufferSize="2147483647"
         receiveTimeout="00:10:00" sendTimeout="00:10:00">
		<readerQuotas maxArrayLength="2147483647" maxStringContentLength="2147483647"/>
        </binding>
   </basicHttpBinding>
</bindings>
````



>note The number 2,147,483,647 is the max value of a 32 bit signed integer.


## Timeouts on client binding

	
````c#
ReportServiceClient IReportServiceClientFactory.Create(System.Uri remoteAddress)
    {
        var binding = new BasicHttpBinding() // or BasicHttpBinding(BasicHttpSecurityMode.Transport) overload if SSL is used
        {
            MaxBufferSize = int.MaxValue,
            MaxReceivedMessageSize = int.MaxValue,
            ReceiveTimeout = new TimeSpan(0, 10, 0),
            SendTimeout = new TimeSpan(0, 10, 0)
        };
        var endpointAddress = new EndpointAddress(remoteAddress);
        return new ReportServiceClient(binding, endpointAddress);
    }
````



For more information, see [Using Custom Bindings]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/using-custom-bindings%}).

## Timeouts when hosted in ASP.NET

When a WCF service is hosted in IIS/ASP.NET, another setting would also control the lifetime of the request:  			 [ExecutionTimeout](/reporting/api/System.Web.Configuration.HttpRuntimeSection#System_Web_Configuration_HttpRuntimeSection_ExecutionTimeout) . 			

	
````XML
<configuration>
  <system.web>
  <httpRuntime executionTimeout="600"/>
  </system.web>
</configuration>
````



# See Also

