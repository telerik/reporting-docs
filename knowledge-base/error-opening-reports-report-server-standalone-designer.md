---
title: Error When Opening Reports Stored on Report Server in Standalone Report Designer
description: "Learn how to resolve the error about multiple request actions when opening reports stored on the Telerik Report Server in the Standalone Report Designer."
type: troubleshooting
page_title: Standalone Report Designer Cannot Open Report Server Reports
meta_title: Reports Stored on the Report Server Cannot be Opened in the Report Designer
slug: error-opening-reports-report-server-standalone-designer
tags: telerik report server, standalone report designer, system.net.http, binding redirect, web.config
res_type: kb
ticketid: 1691680
---

## Environment
<table>
   <tbody>
      <tr>
         <td> Product </td>
         <td> Progress® Telerik® Report Server </td>
      </tr>
      <tr>
         <td> Designer</td>
         <td> Standalone Report Designer</td>
      </tr>
   </tbody>
</table>

## Description

I encounter an error when attempting to open a report stored on [Telerik Report Server](https://www.telerik.com/report-server) in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). The error mentions a conflict in the HTTP controller due to multiple actions matching the same request.

## Error Message

```
w3wp.exe Error: 0 : Operation=ApiVersionActionSelector.SelectAction, Exception=System.InvalidOperationException: Multiple actions were found that match the request: 
GetClientsSessionTimeoutSeconds on type Telerik.ReportServer.Web.Controllers.Api.ReportsController
GetClientsSessionTimeoutSeconds on type Telerik.ReportServer.Web.Controllers.Api.ReportsController
   at Microsoft.Web.Http.Controllers.ApiVersionActionSelector.SelectActionVersion(HttpControllerContext controllerContext, IReadOnlyList`1 candidateActions)
   at Microsoft.Web.Http.Controllers.ApiVersionActionSelector.ActionSelectorCacheItem.FindAction(HttpControllerContext controllerContext, Func`3 selector, Boolean ignoreSubRoutes)
   at Microsoft.Web.Http.Controllers.ApiVersionActionSelector.ActionSelectorCacheItem.SelectAction(HttpControllerContext controllerContext, Func`3 selector)
   at System.Web.Http.Tracing.Tracers.HttpActionSelectorTracer.<>c__DisplayClass7_0.<System.Web.Http.Controllers.IHttpActionSelector.SelectAction>b__0()
   at System.Web.Http.Tracing.ITraceWriterExtensions.TraceBeginEnd(ITraceWriter traceWriter, HttpRequestMessage request, String category, TraceLevel level, String operatorName, String operationName, Action`1 beginTrace, Action execute, Action`1 endTrace, Action`1 errorTrace)
```

## Cause

 An older version of the `System.Net.Http` assembly may exist in the [Global Assembly Cache (GAC)](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) and is being loaded by the Report Server.

## Solution

1. Open the `Web.config` file of the Report Server located at: `C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\Web.config`.
1. Locate the [<dependentAssembly>](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/dependentassembly-element) element and add the following [<bindingRedirect>](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) for the `System.Net.Http` assembly:

   ````XML
<dependentAssembly>
       <assemblyIdentity name="System.Net.Http" publicKeyToken="b03f5f7f11d50a3a" culture="neutral"/>
       <bindingRedirect oldVersion="0.0.0.0-4.2.0.0" newVersion="4.2.0.0"/>
   </dependentAssembly>
````


1. Save the `Web.config` file (*administrator permissions may be required*).
1. **Recycle the Application Pool** and restart the **Telerik Report Server** website from the [IIS Manager](https://learn.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-the-iis-manager-in-iis-7-and-iis-8).
1. (*Optional*) If the error persists, try restarting the Internet Information Services (IIS) by executing the following command in a Command Prompt/PowerShell

   ````CMD
iisreset
````


## See Also

* [Troubleshoot Report Server Manager](https://docs.telerik.com/report-server/knowledge-base/troubleshoot-report-server)  
* [IIS Manager](https://learn.microsoft.com/en-us/iis/get-started/getting-started-with-iis/getting-started-with-the-iis-manager-in-iis-7-and-iis-8)
