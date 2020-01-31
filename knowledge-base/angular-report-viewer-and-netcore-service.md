---
title: Angular Report Viewer and .NET Core 3 service
description: Using .NET Core 3 as a service in Angular Report Viewer
type: how-to
page_title: How to Create Angular Report Viewer with .NET Core 3 Service
slug: angular-report-viewer-and-netcore-service
position: 
tags: 
ticketid: 1449037
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116</td>
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
This KB article demonstrates how to create a .NET Core 3 project which will be used as a service in the [Angular Report Viewer](../angular-report-viewer).

## Solution
1. Follow the steps given in [Implementing an Angular project with AspNet Core](https://dev.to/diogenespolanco/implementing-a-angular-project-with-aspnet-core-2ik) to create a  .NET Core project with an Angular application for the client.
2. Create the Angular Report Viewer as explained in [How To: Use Angular Report Viewer with Angular CLI](../angular-report-how-to-use-with-angular-cli).


## See Also
The sample project can be found in our [Git Hub repository](https://github.com/telerik/reporting-samples/tree/master/Angular%20with%20.NET%20Core3%20Service).
1. Firstly, run
```
dotnet build
```

after that: 
```
dotnet run
```


