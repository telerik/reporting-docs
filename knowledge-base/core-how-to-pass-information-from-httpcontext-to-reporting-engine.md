---
title: ASP.NET Core. How to use information from HttpContext in Custom Report Resolver
description: ASP.NET Core. How to copy the needed information from HttpContext to UserIdentity.Context
type: how-to
page_title: ASP.NET Core. Pass HttpContext items to reporting engine
slug: core-how-to-pass-information-from-httpcontext-to-reporting-engine
position: 
tags: 
ticketid: 1464320
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
    <tr>
			<td>Product version</td>
			<td>13.0.19.116</td>
		</tr>
		<tr>
			<td>.Net Framework</td>
			<td>.NET Core 2.0+</td>
		</tr>
	</tbody>
</table>

## Important Note
From [R1 2019 SP1 (13.0.19.222)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2019-sp1-13-0-19-222) 
the _HttpContext_ may be accessed directly in the Custom Report Resolver.

## Description
If you try to use the approach from 
[How to use information from HttpContext in Custom Report Resolver](how-to-pass-information-from-httpcontext-to-reporting-engine) 
KB article in ASP.NET Core application, the Visual Studio will show a compile-time error with the following message

## Error
_System.Web.HttpContext is 'inaccessible due to its protection level' in ReportsController ASP.NET Core implementation_

## Solution
In .Net Core the _HttpContext_ is accessible in different ways. For examples, see the following threads:

- [Access HttpContext in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/http-context?view=aspnetcore-3.1) 
Microsoft article
- [Access the current HttpContext in ASP.NET Core](https://stackoverflow.com/questions/31243068/access-the-current-httpcontext-in-asp-net-core) 
Stackoverflow thread  

Here is an example of implementing one of the approaches:
1. Add the following line in the _Startup_ -> _ConfigureServices_ method that will register the corresponding 
_IHttpContextAccessor_ implementation in the default .NET Core Dependency Injection Container:
```CSharp
services.AddSingleton<Microsoft.AspNetCore.Http.IHttpContextAccessor, Microsoft.AspNetCore.Http.HttpContextAccessor>();
```
2. Declare a second parameter in the _ReportsController_ constructor to inject the _IHttpContextAccessor_ and use it to access 
the _HttpContext_. Here is a sample _ReportsController_ implementation:
```CSharp
[Route("api/reports")]
public class ReportsController : ReportsControllerBase
{
    private IHttpContextAccessor httpContextAccessor;
	
    public ReportsController(IReportServiceConfiguration reportServiceConfiguration, IHttpContextAccessor httpContextAccessor)
        : base(reportServiceConfiguration)
    {
        this.httpContextAccessor = httpContextAccessor;
    }

    protected override UserIdentity GetUserIdentity()
    {
        var identity = base.GetUserIdentity();
        identity.Context = new System.Collections.Concurrent.ConcurrentDictionary<string, object>();

        // *The following code line is suitable for .NET and not for .NET Core. When used in .NET Core
        // *compile time there will be an error
        // *"'HttpContext' is inaccessible due to its protection level"
        //identity.Context["UrlReferrer"] = System.Web.HttpContext.Current.Request.UrlReferrer;
		
        // *The following code line is suitable for .NET Core 
        identity.Context["UrlReferrer"] = httpContextAccessor.HttpContext.Request.Headers["Referer"].ToString();

        // Any other available information can be stored in the identity.Context in the same way

        return identity;
    }
}
```

The __UserIdentity.Current.Context\["UrlRefferer"\]__ should then be used to access the corresponding property/information.
For example, you can access the _UrlRefferer_ as :  
  
```CSharp
// can be included in the Resolve() method of the Custom Report Resolver
Uri urlReferrer = (Uri)UserIdentity.Current.Context["UrlRefferer"];
```
