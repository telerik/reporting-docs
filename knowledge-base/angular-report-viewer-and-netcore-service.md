---
title: Using .NET or .NET Core Project to Host the Angular Report Viewer
page_title: Angular Report Viewer Hosted in .NET and .NET Core 3 Project
description: "Learn how to host the Telerik Reporting Angular Report Viewer in a project targeting .NET or .NET Core."
type: how-to
slug: angular-report-viewer-and-netcore-service
tags: telerik, reporting, angular, reportviewer, use, dot, net, core, 3, project, as, service
ticketid: 1449037
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116+</td>
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

How can I create a .NET Core 3 project which will be used as a service in the [Angular Report Viewer]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview %})?

## Solution

1. To create a .NET Core project with an Angular application for the client, follow the steps in the article on [implementing an Angular project with ASP.NET Core](https://dev.to/diogenespolanco/implementing-a-angular-project-with-aspnet-core-2ik).
1. Create the Angular Report Viewer as explained in the article on [using the Angular Report Viewer with Angular CLI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-angular-cli%}).

## Demo Project

You may download the sample application from our [GitHub Reporting Samples repository](https://github.com/telerik/reporting-samples/tree/master/Angular%20with%20.NET%20Core3%20Service). To run the demo, execute `dotnet build` and then `dotnet run`.
