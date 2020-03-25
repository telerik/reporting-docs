---
title: Error Loading the Report Viewer's Templates. (trvTemplateUrl = https://localhost:44332/api/reports/resources/templates/telerikReportViewerTemplate-html).
description: After upgrading to 14.0.20.219 or later you may experience 'Error loading the report viewer's templates' in Angular Report Viewer
type: troubleshooting
page_title: 'Error loading the report viewer's templates' in Angular following upgrade
slug: angular-error-loading-report-viewers-templates
position: 
tags: 
ticketid: 1455060
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.219 or higher</td>
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
With the [Service Pack 14.0.20.219](../release-history/progress-telerik-reporting-r1-2020-sp1-14-0-20-219) we have introduced a change - 
__Add version to the web viewers and designer resources requests__. Now the REST Service request for the viewer's template will look 
like:
```
https://localhost:44332/api/reports/resources/templates/telerikReportViewerTemplate-14.0.20.219.html
```
Note that in the observed error the version is not included in the request for the template. This means that the angular application 
is not upgraded to the corresponding Telerik Reporting version, as it still makes a request to the old viewer's HTML template. 
All the Telerik Reporting and Report Server versions should match when used together.

## Error Message
Error loading the report viewer's templates. (trvTemplateUrl = 'https://localhost:44332/api/reports/resources/templates/telerikReportViewerTemplate-html').

_Or if you are looking into the response error_ :

 
{"message":"An error has occurred.","exceptionMessage":"The extension is not supported.","exceptionType":"System.ArgumentException","stackTrace":"   at Telerik.Reporting.Services.Engine.ResourcesEngine.GetMimeType(String filename)\r\n   at Telerik.Reporting.Services.Engine.ResourcesEngine.GetResource(String folder, String name, String& mimeType, Type type)\r\n   at Telerik.Reporting.Services.AspNetCore.ReportsControllerBase.GetResourceCore(String folder, String resourceName, Type type)\r\n   at lambda_method(Closure , Object , Object[] )\r\n   at Microsoft.Extensions.Internal.ObjectMethodExecutor.Execute(Object target, Object[] parameters)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Rethrow(ActionExecutedContext context)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextExceptionFilterAsync()"}

## Solution
You need to upgrade the Angular Report Viewer to the same version used by the REST Service. You may use one of the following commands:

```
npm install @progress/telerik-angular-report-viewer
npm install --save @progress/telerik-angular-report-viewer
```
