---
title: Anti-Forgery Token Issue Occurs in ASP.NET Core 2.1+ Applications
page_title: An Anti-Forgery Token Issue Occurs in ASP.NET Core 2.1+ Applications
description: "Learn how to handle an error thrown while configuring an ASP.NET Core 2.1+ application with anti-forgery token."
type: troubleshooting
slug: anti-forgery-token-issue-in-asp-net-core-application
tags: telerik, reporting, asp, net, core, 2.1+, html5, viewer, anti, forgery, token, error, occurs
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

When adding any of the following lines of code in the `Startup.cs` file, the report won't load and an error will be thrown.

## Error Messages

The following error message occurs:

````CSharp
services.AddMvc(options =>
	options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
````

Alternatively, a similar error message is thrown:

````CSharp
services.AddControllersWithViews(options =>
	options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
````

## Steps to Reproduce

1. Implement the anti-forgery token. For example, in ASP.NET Core MVC application, create a new `GetAntiXsrfRequestToken()` function on the viewer page to get the request token:

    ````C#
@inject Microsoft.AspNetCore.Antiforgery.IAntiforgery Xsrf
    @functions{
        public string GetAntiXsrfRequestToken()
        {
            return Xsrf.GetAndStoreTokens(Context).RequestToken;
        }
    }
````

1. Add the function to each request header:

    ````JavaScript
<script type="text/javascript">
            $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
                jqXHR.setRequestHeader("__RequestVerificationToken", '@GetAntiXsrfRequestToken()');
            });
    </script>
````

As a result, the `"Error registering the viewer with the service."` error message occurs. Also, in the browser console on [Register Client]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client %}) request returns `400 Bad Request` with the following error:

````
Failed to load resource: the server responded with a status of 400 (Bad Request)
Uncaught (in promise) Invalid clientID
````

## Solutions

The `AutoValidateAntiforgeryToken` is recommended by Microsoft for non-API scenarios. When using this  approach, that requires manually adding anti-forgery attributes. If you forget the attribute, no error will occur and the `Controller`/`Action` will not be protected. For that reason, the automatic approach is generally less error-prone and easier to maintain, especially if there are large number of Controllers and Actions that need this protection. You can use the `AutoValidateAntiforgeryToken` with the `ReportsController` provided that you do one of the following things:

* Add the [`IgnoreAntiforgeryToken`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute?view=aspnetcore-3.1) attribute to the ReportsController. For example:

    ````CSharp
[Route("api/reports")]
    [IgnoreAntiforgeryToken]
    public class ReportsController : ReportsControllerBase
    {
    	...
    }
````

* Override [all `ReportsController` public methods](../api/Telerik.Reporting.Services.WebApi.ReportsControllerBase.html#methods) and add the [`IgnoreAntiforgeryToken`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute?view=aspnetcore-3.1) attribute to them. You may skip the `GET` HTTP methods.

    ````CSharp
[IgnoreAntiforgeryToken]
    public override IActionResult RegisterClient()
    {
        return base.RegisterClient();
    }
````

Alternatively, remove the auto anti-forgery configuration and decorate each controller or action that has to be protected against anti-forgery with the [`AutoValidateAntiforgeryToken`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.autovalidateantiforgerytokenattribute?view=aspnetcore-3.1) or [`ValidateAntiforgeryToken`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.validateantiforgerytokenattribute?view=aspnetcore-3.1) attribute.

The following configuration or its equivalent have to be replaced with the configuration that follows:

````CSharp
services.AddMvc(options => { options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()); });
````

The following configuration has to replace the previous one:

````CSharp
 services.AddMvc();
 services.AddAntiforgery(options => options.HeaderName = "__RequestVerificationToken");
````

## See Also

* [Prevent Cross-Site Request Forgery (XSRF/CSRF) attacks in ASP.NET Core (JavaScript, AJAX, and SPAs section)](https://docs.microsoft.com/en-us/aspnet/core/security/anti-request-forgery?view=aspnetcore-2.2#javascript-ajax-and-spas)
