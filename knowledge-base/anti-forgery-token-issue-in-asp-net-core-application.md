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
When adding the following line of code in the *Startup.cs* file, the report won't load and an error would be thrown.

```
services.AddMvc(options => { options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()); });
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

## Solution
Replace this configuration:
```
services.AddMvc(options => { options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute()); });
```

with this:
```
 services.AddMvc();
 services.AddAntiforgery(options => options.HeaderName = "__RequestVerificationToken");
```

## See Also
For more information, check [Prevent Cross-Site Request Forgery (XSRF/CSRF) attacks in ASP.NET Core (JavaScript, AJAX, and SPAs section)](https://docs.microsoft.com/en-us/aspnet/core/security/anti-request-forgery?view=aspnetcore-2.2#javascript-ajax-and-spas).
