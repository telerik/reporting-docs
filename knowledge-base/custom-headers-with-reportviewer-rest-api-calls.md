---
title: Add Custom Headers to Angular Report Viewer REST API Calls
description: "Learn How to Pass Custom Headers Along with the Telerik Report Viewer REST API Calls from an Angular Application."
type: how-to
page_title: Pass Custom Headers with the Angular Viewer REST API Calls
slug: custom-headers-with-reportviewer-rest-api-calls
position: 
tags: 
ticketid: 1474331
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
			<td>Report Viewer</td>
			<td>Angular</td>
		</tr>
	</tbody>
</table>


## Description

I need to provide custom headers with every API call made by the Angular Report Viewer. My goal is to add an authorization token. I add the custom header via the interceptor `token-http-interceptor.service.ts`. However, the header is not added to the calls made by the Angular Report Viewer.

## Solution

The Angular Report Viewer is a wrapper of the HTML5 Report Viewer, which is a jQuery widget and not a native Angular component. That's why you cannot add custom headers the Angular way - via the HTTP interceptor. In this article, we suggest two possible solutions.

### Solution 1

The Angular Report Viewer comes with out-of-the-box support for an [*authenticationToken* option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options%}). This option adds an `Authorization` header for every request to the REST service.

### Solution 2

The second solution is to add the custom headers to the REST API calls of the Angular Report Viewer with *jQuery's* [ajaxSetup](https://api.jquery.com/jquery.ajaxsetup/) function: 

The following code represents one possible approach that can be used in the component with the Angular report viewer:

````JavaScript
ngOnInit(): void {
	let $: any = (window as any)["jQuery"];
	$.ajaxSetup({xhrFields: { withCredentials: true } });
}
````

