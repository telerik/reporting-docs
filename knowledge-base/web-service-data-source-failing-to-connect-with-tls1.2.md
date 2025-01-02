---
title: WebServiceDataSource failing to retrieve web resources on TLS 1.2 HTTPS connection
description: WebServiceDataSource throws an exception when trying to connect with TLS 1.2 due to the old .NET framework
type: how-to
page_title: WebServiceDataSource failing to retrieve web resources on TLS 1.2
slug: web-service-data-source-failing-to-connect-with-tls1dot2
ticketid: 1174270
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description

TLS 1.2 is a protocol that provides enhanced security. For some Web sources, this is the lowest acceptable secure version and all older protocols are disabled.
The requirements of TLS 1.2 are newer and as such are not supported by older versions of the .NET Framework. The older versions of the Telerik Reporting code, up to [2024 Q1 (18.0.24.305)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q1-(18-0-24-305)) are built against .NET 4.0 for backward compatibility. The latter does _not_ support TLS 1.2 by default.
When using a WebServiceDataSource with such Web sources there may appear a problem with retrieving the data. The reports may throw the following error

`The client and server cannot communicate, because they do not possess a common algorithm`

The problem comes from the [ServicePointManager.SecurityProtocol Property](ServicePointManager.SecurityProtocol Property). It didn't have a default value through the .NET Framework 4.6.2. This property selects the version of the Secure Sockets Layer (SSL) or Transport Layer Security (TLS) protocol to use for new connections.

Starting with the .NET Framework 4.7, the default value of `ServicePointManager.SecurityProtocol` is [SecurityProtocolType.SystemDefault](https://learn.microsoft.com/en-us/dotnet/api/system.net.securityprotocoltype?view=netframework-4.7#fields).

## Error Message

````
An error occurred while sending the request.  
------------- InnerException -------------  
The underlying connection was closed: An unexpected error occurred on a send.  
------------- InnerException -------------  
Unable to read data from the transport connection: An existing connection was forcibly closed by the remote  
host.  
------------- InnerException -------------  
An existing connection was forcibly closed by the remote host
````

## Suggested Workarounds
  
To overcome the problem check the [Cannot connect to a server by using the ServicePointManager or SslStream APIs after upgrade to the .NET Framework 4.6](https://support.microsoft.com/en-us/help/3069494/cannot-connect-to-a-server-by-using-the-servicepointmanager-or-sslstre) Microsoft article, where a workaround is provided.  
 
Workarounds are suggested also in the [TLS 1.2 and .NET Support: How to Avoid Connection Errors](https://blogs.perficient.com/2016/04/28/tsl-1-2-and-net-support/) blog post:  
  
*"...NET 4.0\. TLS 1.2 is not supported, but if you have .NET 4.5 (or above) installed on the system then you still can opt in for TLS 1.2 even if your application framework doesn't support it. The only problem is that SecurityProtocolType in .NET 4.0 doesn't have an entry for TLS1.2, so we'd have to use a numerical representation of this enum value:*

``` CSharp
ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
```
  
*...there is also a registry hack which forces 4.5 to use TLS 1.2 by default without enforcing it programmatically."*

The workaround cannot be applied to the Standalone designer. Therefore, we introduced an improvement in the latter, starting with [Telerik Reporting R3 2018 (12.2.18.912)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2018-12-2-18-912). If you need to use the designer with Web services requiring TLS 1.2 it will be necessary to upgrade to at least this version.
