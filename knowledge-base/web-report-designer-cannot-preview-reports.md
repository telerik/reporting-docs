---
title: Web Report Designer Cannot Preview Reports
description: "Learn why previewing Reports in the Web Report Designer may not work and how to fix this in Telerik Reporting."
type: troubleshooting
page_title: Reports cannot be previewed in the Web Report Designer
slug: web-report-designer-cannot-preview-reports
tags: Web Report Designer, HTML5, Report Viewer
ticketid: 1578586
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
			<td>Web Application</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5</td>
		</tr>
	</tbody>
</table>


## Description

When the `Preview` button of the Web Report Designer is clicked, instead of displaying a rendered report in the report viewer, there is a message saying that the service is not accessible.

## Error Message

The error message, displayed on the page, is the following:

`Cannot access the Reporting REST service. (serviceUrl = '/api/reportdesigner'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)`

The error message, displayed in the browser console, is the following:

````
System.UriFormatException: Invalid URI: The format of the URI could not be determined.
		at System.Uri.CreateThis(String uri, Boolean dontEscape, UriKind uriKind, UriCreationOptions& creationOptions)
		at System.Uri..ctor(String uriString, UriKind uriKind)
		at Telerik.Reporting.Processing.PathResolver..ctor(String baseDir)
		at Telerik.WebReportDesigner.Services.ResourceResolver..ctor(IResourceStorage resourceStorage, String definitionDir)
		at Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.CreateResourceResolver()
		at Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase.get_ProcessingContext()
		at Telerik.Reporting.Services.AspNetCore.ReportsControllerBase.get_Engine()
		at Telerik.Reporting.Services.AspNetCore.ReportsControllerBase.GetVersion()
		at lambda_method262(Closure , Object , Object[] )
		at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
		at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
		at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
		at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
		at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
		at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
	--- End of stack trace from previous location ---
		at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextExceptionFilterAsync>g__Awaited|26_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
````

## Possible Cause

The known reason for this error is using a relative path for the [FileDefinitionStorage](/api/telerik.webreportdesigner.services.filedefinitionstorage) constructor of the Web Report Designer.

## Solution

Pass an `absolute` path to the `FileDefinitionStorage` constructor

## Workarounds

If it is not possible or wanted to pass absolute path to the constructor, create a custom `ResourceResolver` that implements the [IResourceResolver](/api/telerik.reporting.interfaces.iresourceresolver) interface.

The custom ResourceResolver class should then be registered in the application's configuration file, for example, `appsettings.json`:

````JSON
"telerikReporting": {
	"processing": {
		"resourceResolver": {
			// The element below represents a custom implementation of resource resolver:
			"provider": "custom",
			"parameters": [
				{
					"name": "typeName",
					"value": "CSharp.Net6.BlazorIntegrationDemo.CustomResourceResolver, CSharp.Net6.BlazorIntegrationDemo"
				}
			]
		}
	}
}
````

