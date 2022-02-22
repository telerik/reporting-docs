---
title: Error Loading the Report Viewer Templates after Angular Upgrade
page_title: Error Loading the ReportViewer Templates after Angular Upgrade
description: "Learn how to handle the Error loading the report viewers templates in the Angular Report Viewer after upgrading to 14.0.20.219 or later."
type: troubleshooting
slug: angular-error-loading-report-viewers-templates
tags: telerik, reporting, angular, reportviewer, templates, after, upgrade
ticketid: 1455060
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.219 or later</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Angular</td>
		</tr>
	</tbody>
</table>


## Description

An error loading the ReportViewer templates occurs after the Angular upgrade.

## Error Message

`Error loading the report viewer's templates. (trvTemplateUrl = 'https://localhost:44332/api/reports/resources/templates/telerikReportViewerTemplate-html').`

The response error is the following:

`{"message":"An error has occurred.","exceptionMessage":"The extension is not supported.","exceptionType":"System.ArgumentException","stackTrace":"   at Telerik.Reporting.Services.Engine.ResourcesEngine.GetMimeType(String filename)\r\n   at Telerik.Reporting.Services.Engine.ResourcesEngine.GetResource(String folder, String name, String& mimeType, Type type)\r\n   at Telerik.Reporting.Services.AspNetCore.ReportsControllerBase.GetResourceCore(String folder, String resourceName, Type type)\r\n   at lambda_method(Closure , Object , Object[] )\r\n   at Microsoft.Extensions.Internal.ObjectMethodExecutor.Execute(Object target, Object[] parameters)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()"}`

## Cause

As of [Service Pack 14.0.20.219](../release-history/progress-telerik-reporting-r1-2020-sp1-14-0-20-219), you need to add a version to the web viewers and designer resources requests. Now the REST Service request for the viewer template will look like the following:

```
https://localhost:44332/api/reports/resources/templates/telerikReportViewerTemplate-14.0.20.219.html
```

Note that in the observed error the version is not included in the request for the template. This means that the Angular application is not upgraded to the corresponding Telerik Reporting version, as it still makes a request to the HTML template of the old viewer. All the Telerik Reporting and Report Server versions have to match when used together.

## Solution

Upgrade the Angular ReportViewer to the same version used by the REST Service by using any of the following commands:

```
npm install @progress/telerik-angular-report-viewer
npm install --save @progress/telerik-angular-report-viewer
```
