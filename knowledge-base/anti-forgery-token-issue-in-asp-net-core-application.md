---
title: Anti-forgery token issue in ASP.NET Core 2.1+ application
description: This article elaborates on an error thrown while configuring an ASP.NET Core 2.1+ application with anti-forgery token.
type: troubleshooting
page_title: Anti-forgery token issue in ASP.NET Core 2.1+ application
slug: anti-forgery-token-issue-in-asp-net-core-application
position: 
tags: ASP.NET Core, HTML5Viewer
ticketid: 1406955
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
	    	<td>Project Type</td>
	    	<td>ASP.NET Core, ASP.NET Core MVC</td>
	    </tr>
      <tr>
	    	<td>Viewer Type</td>
	    	<td>HTML5 Report Viewer</td>
	    </tr>
    </tbody>
</table>


## Description
When adding any of the following lines of code in the *Startup.cs* file, the report won't load and an error would be thrown.

```CSharp
services.AddMvc(options => 
	options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
```
or
```CSharp
services.AddControllersWithViews(options => 
	options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
```

## Steps to Reproduce
Implement the anti-forgery token. For example, in ASP.NET Core MVC application, in viewer's page create new function GetAntiXsrfRequestToken() to get the request token:
```C#
@inject Microsoft.AspNetCore.Antiforgery.IAntiforgery Xsrf
@functions{
    public string GetAntiXsrfRequestToken()
    {
        return Xsrf.GetAndStoreTokens(Context).RequestToken;
    }
}
```
then add it to each request header:
```JavaScript
<script type="text/javascript">
        $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
            jqXHR.setRequestHeader("__RequestVerificationToken", '@GetAntiXsrfRequestToken()');
        });
</script>
```

## Error Message
```
"Error registering the viewer with the service."
```

And in the browser console on [Register Client](../telerik-reporting-rest-api-register-client) request returns *400 Bad Request* with the following error:

```
Failed to load resource: the server responded with a status of 400 (Bad Request)
Uncaught (in promise) Invalid clientID
```

## Solutions
1. The 'AutoValidateAntiforgeryToken' is recommended by Microsoft for non-API scenarios. In the approach that requires manually adding anti-forgery attributes, if the developer forgets the attribute there will be no error and the Controller/Action will not be protected. For that reason, the automatic approach is generally less error-prone and easier to maintain, especially if there are large number of Controllers and Actions that need this protection. The 'AutoValidateAntiforgeryToken' can be used with the ReportsController, provided that you do one of the following things:
* Add the [IgnoreAntiforgeryToken](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute?view=aspnetcore-3.1) attribute to the ReportsController, for example:
```CSharp
[Route("api/reports")]
[IgnoreAntiforgeryToken]
public class ReportsController : ReportsControllerBase
{
	...
}
```
* Override [all ReportsController public methods](../methods-t-telerik-reporting-services-webapi-reportscontrollerbase) and add the [IgnoreAntiforgeryToken](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute?view=aspnetcore-3.1) attribute to them. You may skip the 'GET' HTTP methods.
```CSharp
[IgnoreAntiforgeryToken]
public override IActionResult RegisterClient()
{
    return base.RegisterClient();
}
```

2. Remove the auto anti-forgery configuration and decorate each controller or action that has to be protected against anti-forgery with
the attribute [AutoValidateAntiforgeryToken](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.autovalidateantiforgerytokenattribute?view=aspnetcore-3.1) or [ValidateAntiforgeryToken](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.validateantiforgerytokenattribute?view=aspnetcore-3.1).
For the first step, you need to replace the following configuration, or its equivallent:
```CSharp
services.AddMvc(options => { options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()); });
```

with this:
```CSharp
 services.AddMvc();
 services.AddAntiforgery(options => options.HeaderName = "__RequestVerificationToken");
```

## See Also
For more information, check [Prevent Cross-Site Request Forgery (XSRF/CSRF) attacks in ASP.NET Core (JavaScript, AJAX, and SPAs section)](https://docs.microsoft.com/en-us/aspnet/core/security/anti-request-forgery?view=aspnetcore-2.2#javascript-ajax-and-spas).
