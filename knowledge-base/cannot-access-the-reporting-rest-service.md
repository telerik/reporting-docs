---
title: Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)
description: Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)
type: troubleshooting
page_title: Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)
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
*Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)*

## Cause\Possible Cause(s)
The error indicates that the [Telerik Reporting REST Service](../telerik-reporting-rest-conception) is not working properly.

## Solution
There are two possible reasons for this error:

1.  **The REST Service is missing or not configured correctly**: In order to identify that, check the response to */api/reports/formats* GET request that should return the available document formats (see [Get Available Document Formats](../telerik-reporting-rest-general-api-get-document-formats) article).
If the response to the above request is not as expected, then check [How To: Add Telerik Reporting REST Web API to Web Application](../telerik-reporting-rest-host-http-service-using-web-hosting) article. Check the viewer's [serviceUrl](../html5-report-viewer-jquery-fn-telerik-reportviewer) and adjust the relative path. Test adding "~" or remove the first "/" - [ASP.NET Web Project Paths](https://msdn.microsoft.com/en-us/library/ms178116.aspx). The issue might be related to WebAPI controllers duplicating routes, which can be avoided by [changing the registered by default Telerik Reporting REST Web API routes](https://www.telerik.com/support/kb/reporting/details/how-to-change-reporting-rest-web-api-routes-registered-by-default).

2. **CORS is not configured correctly**: If however, the Rest Service is returning the available export formats, I assume that the report viewer client cannot access the service due to [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) limitations. When such issue is present you will see a CORS related error message in the browser's developer tools console (F12). When hosting the service in a separate application you will need to enable CORS as explained in [Enable cross-origin requests in ASP.NET Web API 2 article](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api).


## Notes
Тhe recommended troubleshooting approach is to use [Fiddler Jam](https://www.telerik.com/fiddler-jam) or other proxy tool to check the requests, their responses and statuses.

This will let you check requests to the Reporting REST service and whether the URLs are correct (if relative paths are resolved correctly).
Relative paths may need adjustment depending on how the application is hosted.

If the problem persists, [record a log](../../fiddler-jam/get-started/recording-a-log) with **Fiddler Jam** while running the application and [share the log as a link](../../fiddler-jam/get-started/submitting-a-log) with us in a support ticket.

To help troubleshoot the issue, you may also record a trace listener log:

- For ASP.NET Core application, see the [Troubleshooting reporting implementation into ASP.NET Core application](./how-to-troubleshoot-errors-in-asp-net-core-applications) article.

- For .NET Framework application, see the [Create and Initialize Trace Listeners](https://docs.microsoft.com/en-us/dotnet/framework/debug-trace-profile/how-to-create-and-initialize-trace-listeners) MS Docs article.
