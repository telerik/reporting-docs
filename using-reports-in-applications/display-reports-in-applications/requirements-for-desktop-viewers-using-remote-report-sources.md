---
title: Requirements For Desktop Viewers Using Remote Report Sources
page_title: Requirements For Desktop Viewers Using Remote Report Sources | for Telerik Reporting Documentation
description: Requirements For Desktop Viewers Using Remote Report Sources
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/requirements-for-desktop-viewers-using-remote-report-sources
tags: requirements,for,desktop,viewers,using,remote,report,sources
published: True
position: 11
---

# Requirements For Desktop Viewers Using Remote Report Sources



When using WinForms and WPF report viewers to show reports that are hosted in a Telerik Report Server instance or resolved using a REST service, a few additional libraries need to be referenced.         Below is the list of these libraries along with a brief explanation of how to install and reference them.       

## 

* __Telerik.Reporting.Services.HttpClient.dll__  - this assembly contains the client used to make requests               and process response from the REST service Web API. The assembly can be found in the __\bin__  subfolder of the Telerik Reporting installation folder.               Make sure the *CopyLocal*  property is set to __true__ .             

*  [                   System.Net.Http.Formatting.dll                 ](                   https://msdn.microsoft.com/en-us/library/system.net.http.formatting(v=vs.118).aspx                 )                - contains classes for serializing and deserializing HTTP message body in a format based on the requested media type.             

*  [                   System.Net.Http.dll                 ](                   https://msdn.microsoft.com/en-us/library/system.net.http(v=vs.118).aspx                 )                - contains classes of HTTP attributes.             

*  [                   Newtonsoft.Json.dll                 ](                   https://msdn.microsoft.com/en-us/library/system.net.http(v=vs.118).aspx                 )                - a popular high-performance JSON framework for .NET             

The recommended way of obtaining the three third-party assemblies is via NuGet package. The package that contains all three of them is            [               Microsoft ASP.NET Web API Client v.4.0.30506 NuGet package.             ](               https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Client/4.0.30506             )            Note that the higher versions of this package require updating the project's target framework to .NET 4.5 or later.         

# See Also


 * [How to Use Windows Forms Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%})

 * [How to Use Windows Forms Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service%})

 * [How to Use WPF Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%})

 * [How to Use WPF Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service%})
