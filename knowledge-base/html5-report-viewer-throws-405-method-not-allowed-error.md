---
title: HTML5 Report Viewer throws 405 Error
description: "Learn why upon running the application an exception with status 405 (Method Not Allowed) may be thrown."
type: troubleshooting
page_title: The requested resource does not support HTTP method GET
slug: html5-report-viewer-throws-405-method-not-allowed-error
position: 
tags: Html5ReportViewer
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Description
Upon navigating to the page with the report viewer, the below error is thrown.

## Error Message

```
Failed to load resource: the server responded with a status of 405 (Method Not Allowed)
```

## Possible Causes

* The [`WebDavModule`](https://learn.microsoft.com/en-us/iis/configuration/system.webserver/webdav/) is used by IIS. The [Telerik Reporting REST service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) requires `PUT` and `DELETE` verbs. Those verbs might be blocked by the `WebDavModule`.
* The [`Get Clients Session Timeout Seconds`]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/get-clients-session-timeout-seconds%}) endpoint is failing with a status code of [405(Method Not Allowed)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/405) due to a greedy route in the routes configuration.


## Solutions


### Solution 1

To resolve the issue with the`WebDavModule`, it may be removed from the configuration of the web application (e.g. `Web.config`)as shown in the following example:

````XML
<configuration>
	<system.webServer>
		<modules runAllManagedModulesForAllRequests="true">
		<remove name="WebDAVModule"/>
		</modules>
	</system.webServer>
</configuration>
````

### Solution 2

To resolve the problem when the [`Get Clients Session Timeout Seconds`]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/get-clients-session-timeout-seconds%}) is failing, move the registration of the reporting routes before the default ones, for example:

````CSharp
Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(config);

	config.Routes.MapHttpRoute(
		name: "DefaultApi",
		routeTemplate: "api/{controller}/{action}/{id}",
		defaults: new { id = RouteParameter.Optional }
	);
````

