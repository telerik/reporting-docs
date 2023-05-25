---
title: Cannot access the Reporting REST service
description: "Learn why you may see the following error message in the report viewer 'Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed (https://enable-cors.org).'"
type: troubleshooting
page_title: Cannot access the Reporting REST service. Enable CORS if needed.
slug: cannot-access-the-reporting-rest-service
position: 
tags: HTML5ReportViewer, RestService
ticketid: 1347340
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Error Message

`Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed (https://enable-cors.org)`

## Cause\Possible Cause(s)

The error indicates that the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is not working properly or cannot be accessed by the viewer.

## Solution

There are two main reasons for this error. In order to identify that, check the response to `/api/reports/formats` GET request that should return the available document formats - see [Get Available Document Formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%}) article.

1. **The REST Service is missing or not configured correctly**:

	If the response to the above request is not as expected:

	* Check whether the `ReportsController` is configured correctly

		+ In ASP.NET as explained in the articles under [ASP.NET Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%})
		+ In ASP.NET Core as explained in the articles under [ASP.NET Core Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/overview%}).

	* Check the viewer's [serviceUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) and adjust the relative path
	* Test adding `~` or remove the first `/` - [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)?redirectedfrom=MSDN)
	* The issue might be related to WebAPI controllers duplicating routes, which can be avoided by [changing the registered by default Telerik Reporting REST Web API routes]({%slug how-to-change-reporting-rest-web-api-routes-registered-by-default%}).

1. **CORS is not configured correctly**: If the REST Service is returning the available export formats, the report viewer client may not be able to access the service due to [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) limitations. When such issue is present you will see a CORS related error message in the browser's developer tools console (press `F12` to open it). When hosting the service in a separate application you will need to enable CORS as explained in [Enable cross-origin requests in ASP.NET Web API 2 article](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api).

## Notes

Тhe recommended troubleshooting approach is to use [Fiddler Jam](https://www.telerik.com/fiddler-jam) or other proxy tool to check the requests, their responses and statuses.

This will let you check requests to the Reporting REST service and whether the URLs are correct (if relative paths are resolved correctly). Relative paths may need adjustment depending on how the application is hosted.

If the problem persists, record a log with **Fiddler Jam** while running the application and share the log as a link with us in a support ticket - see [First Steps with the Fiddler Jam Chrome Extension](https://docs.telerik.com/fiddler-jam/fj-extension/get-started-extension).

To help troubleshoot the issue, you may also record a trace listener log:

* For ASP.NET Core application, see the [Troubleshooting reporting implementation into ASP.NET Core application]({%slug how-to-troubleshoot-errors-in-asp-net-core-applications%}) article.
* For .NET Framework application, see the [Create and Initialize Trace Listeners](https://learn.microsoft.com/en-us/dotnet/framework/debug-trace-profile/how-to-create-and-initialize-trace-listeners) Microsoft article.
