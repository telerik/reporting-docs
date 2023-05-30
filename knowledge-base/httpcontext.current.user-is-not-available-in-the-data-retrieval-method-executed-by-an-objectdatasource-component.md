---
title: HttpContext Error in ObjectDataSource Data-retrieval Method
description: "Learn why the 'HttpContext.Current.User is not available' error is thrown in the data-retrieval method executed by an ObjectDataSource component."
type: troubleshooting
page_title: ObjectDataSource data-retrieval method fails with HttpContext error
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

`HttpContext.Current.User is not available.`

## Cause

The data-retrieval method is executed in a different context where the current user's information is not transferred.

## Description

`HttpContext.Current.User` is not available in the data-retrieval method executed by an [ObjectDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}). This is a result of the data-retrieval method being executed in a different context where the current user's information is not available.

## Solution

You can parameterize the data-retrieval method and pass the `ID` of the user (as `Integer` or `String`) via report parameter e.g. [Using Parameters with the ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component%}). In the data-retrieval method you can use the passed `ID` or re-retrieve the users' information.

## Notes

If you are using the HTML5 Viewer and Reporting REST WebAPI based service, to secure the information transferred in requests, please consider encrypting it and using `HTTPS`. The current context and user will be available in the Reporting REST service's methods. If you need to check and compare the client(viewer)'s information on the server, you can override the [ReportsControllerBase methods](/api/telerik.reporting.services.webapi.reportscontrollerbase) like [`GetParameters`](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_GetParameters_System_String_Telerik_Reporting_Services_WebApi_ClientReportSource_) and [`CreateInstance`](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_CreateInstance_System_String_Telerik_Reporting_Services_WebApi_ClientReportSource_).

## See Also

* [How To Enable HTTPS In ASP.NET Web API](https://www.c-sharpcorner.com/article/how-to-enable-https-in-asp-net-web-api/)
* [Working with SSL in Web API](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/working-with-ssl-in-web-api)
* [How to use information from HttpContext in Custom Report Resolver]({%slug how-to-pass-information-from-httpcontext-to-reporting-engine%})
