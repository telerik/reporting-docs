---
title: Getting a HttpContext error in the data-retrieval method executed by an ObjectDataSource component
description: HttpContext.Current.User is not available error is thrown in the data-retrieval method executed by an ObjectDataSource component.
type: troubleshooting
page_title: The data-retrieval method in the ObjectDataSource fails with a HttpContext error.
slug: httpcontext.current.user-is-not-available-in-the-data-retrieval-method-executed-by-an-objectdatasource-component
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
 	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
  <tr>
		<td>Report Item</td>
		<td>ObjectDataSource Component</td>
	</tr>
</table>

## Error Message

*HttpContext.Current.User is not available.*

## Cause

The data-retrieval method is executed in a different context where the current user's information is not transferred.

## Description
 
**HttpContext.Current.User** is not available in the data-retrieval method executed by an ObjectDataSource component. This is a result of the data-retrieval method being executed in a different context where the current user's information is not available.  
  
## Solution
   
You can parameterize the data-retrieval method and pass the **ID** of the user (as *Integer*, *String*) via report parameter e.g. [Using Parameters with the ObjectDataSource Component.](../object-data-source-using-expressions) In the data-retrieval method you can use the passed ID or re-retrieve the users' information.  

## Notes
  
If you are using the HTML5 Viewer and Reporting REST WebAPI based service, to secure the information transferred in requests, please consider encrypting it and using **HTTPS**. The current context and user will be available in the Reporting REST service's methods. If you need to check and compare the client(viewer)'s information on the server, you can override the [ReportsControllerBase methods](../methods-t-telerik-reporting-services-webapi-reportscontrollerbase) like [**GetParameters**](../m-telerik-reporting-services-webapi-reportscontrollerbase-getparameters) and [**CreateInstance**](../m-telerik-reporting-services-webapi-reportscontrollerbase-createinstance).   

## See Also

[How To Enable HTTPS In ASP.NET Web API](https://www.c-sharpcorner.com/article/how-to-enable-https-in-asp-net-web-api/)

[Working with SSL in Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/working-with-ssl-in-web-api)
