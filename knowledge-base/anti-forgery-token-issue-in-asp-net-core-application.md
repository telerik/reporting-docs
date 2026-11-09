---
title: Anti-Forgery Token Issue in ASP.NET Core 2.1+ Applications
page_title: Anti-Forgery Token Issue Occurring in ASP.NET Core 2.1+ Applications
description: "Resolve the Telerik Reporting HTML5 Report Viewer registration error caused by global ASP.NET Core anti-forgery validation in ASP.NET Core 2.1 and later."
type: troubleshooting
slug: anti-forgery-token-issue-in-asp-net-core-application
tags: telerik, reporting, asp, net, core, 2.1+, html5, viewer, anti, forgery, token, error, occurs
ticketid: 1406955
res_type: kb
---

## Environment

| Property | Value |
|---|---|
| Product | Progress® Telerik® Reporting |
| Project type | ASP.NET Core, ASP.NET Core MVC |
| Viewer type | HTML5 Report Viewer |

## Description

When you add a global `AutoValidateAntiforgeryTokenAttribute` filter in `Startup.cs`, the HTML5 Report Viewer cannot register its client. The report does not load because the viewer sends requests to the Telerik Reporting REST service without the antiforgery token in the header expected by the global filter.

## Error Messages

The viewer displays the following exception:

```text
Error registering the viewer with the service.
```

The browser console shows a `400 Bad Request` response for the [Register Client API](/api/telerik.reporting.services.webapi.reportscontrollerbase) request and reports:

```text
Failed to load resource: the server responded with a status of 400 (Bad Request)
Uncaught (in promise) Invalid clientID
```

## Steps to Reproduce

1. Add global antiforgery validation to `Startup.cs`. For example, use either of the following configurations:

   ```C#
   services.AddMvc(options =>
       options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
   ```

   ```C#
   services.AddControllersWithViews(options =>
       options.Filters.Add(new Microsoft.AspNetCore.Mvc.AutoValidateAntiforgeryTokenAttribute()));
   ```

2. Implement an antiforgery token. In an ASP.NET Core MVC application, create a `GetAntiXsrfRequestToken()` function on the viewer page:

   ```C#
   @inject Microsoft.AspNetCore.Antiforgery.IAntiforgery Xsrf
   @functions{
   	public string GetAntiXsrfRequestToken()
   	{
   		return Xsrf.GetAndStoreTokens(Context).RequestToken;
   	}
   }
   ```

3. Add the token to each request header:

   ```HTML
   <script type="text/javascript">
   		$.ajaxPrefilter(function (options, originalOptions, jqXHR) {
   			jqXHR.setRequestHeader("__RequestVerificationToken", '@GetAntiXsrfRequestToken()');
   		});
   </script>
   ```

## Cause

The global `AutoValidateAntiforgeryTokenAttribute` filter also validates requests handled by `ReportsController`. The sample adds the token in the `__RequestVerificationToken` header, while ASP.NET Core expects the `RequestVerificationToken` header by default. Unless you configure ASP.NET Core to use the custom header name, the `Register Client` request fails because the filter cannot find the token in the expected header.

## Solution

Exclude the Telerik Reporting REST service from the global filter. You can use the `IgnoreAntiforgeryToken` attribute with `ReportsController` in either of the following ways:

* Add the [`IgnoreAntiforgeryTokenAttribute`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute) attribute to `ReportsController`:

  ```C#
  [Route("api/reports")]
  [IgnoreAntiforgeryToken]
  public class ReportsController : ReportsControllerBase
  {
  	//...
  }
  ```

* Override [the public methods in `ReportsController`](/api/telerik.reporting.services.webapi.reportscontrollerbase) and add the [`IgnoreAntiforgeryTokenAttribute`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.ignoreantiforgerytokenattribute) attribute to them. You can skip the `GET` methods.

  ```C#
  [IgnoreAntiforgeryToken]
  public override IActionResult RegisterClient()
  {
  	return base.RegisterClient();
  }
  ```

Alternatively, remove the global antiforgery configuration and decorate each controller or action that requires protection with the [`AutoValidateAntiforgeryTokenAttribute`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.autovalidateantiforgerytokenattribute) or [`ValidateAntiforgeryTokenAttribute`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.validateantiforgerytokenattribute) attribute.

Replace the following configuration, or its equivalent, with this configuration:

```C#
services.AddMvc(options => { options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()); });
```

```C#
services.AddMvc();
services.AddAntiforgery(options => options.HeaderName = "__RequestVerificationToken");
```

## See Also

* [Prevent cross-site request forgery (XSRF/CSRF) attacks in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/anti-request-forgery#javascript-ajax-and-spas)
* [`AutoValidateAntiforgeryTokenAttribute` API reference](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.autovalidateantiforgerytokenattribute)
* [`ValidateAntiforgeryTokenAttribute` API reference](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.validateantiforgerytokenattribute)
