---
title: Add HTTP Headers to HTML5-Based Report Viewer REST API Calls
description: "Learn how to attach HTTP headers, such as authorization tokens, to REST API requests made by Telerik HTML5-based report viewers."
type: how-to
page_title: Add HTTP Headers to HTML5-Based Report Viewer REST API Requests
slug: http-headers-with-reportviewer-rest-api-calls
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
			<td>Version</td>
			<td>Any</td>
		</tr>
	</tbody>
</table>


## Description

This article explains how to include HTTP headers—such as authorization tokens—in the REST API requests made by HTML5-based report viewers.

It applies to the following viewers:

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [HTML5 MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})
- [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})
- [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
- [ReactJS Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
- [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

## Solution 1

All HTML5-based report viewers support an authentication token configuration option that automatically appends a `Bearer` token to the `Authorization` header of each request sent to the Telerik Reporting REST service. For example, the HTML5 Report Viewer includes an [`authenticationToken` option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). 

Note that the exact casing or naming of this option may vary across different viewer implementations. For accurate usage, refer to the specific documentation for the viewer you are integrating.

## Solution 2

The second solution is to add custom headers to the REST API calls of the HTML5 report viewer. Based on the version you are on, you can follow either of these approaches:

	* For version `19.1.25.521` and higher

		Starting from `19.1.25.521`, the HTML5-based report viewers rely on the browser's built-in [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch) to issue their requests to the Reporting REST service. To add custom HTTP headers to the requests, you can override the [window.fetch() method](https://developer.mozilla.org/en-US/docs/Web/API/Window/fetch) as follows:

		````JavaScript
			const originalFetch = window.fetch;

			window.fetch = async function (
				input: RequestInfo | URL,
				init?: RequestInit
			): Promise<Response> {
				const headers = new Headers(init?.headers || {});

				if (typeof input === "string" && input.includes('api/reports')) {
					headers.set('X-Custom-Header', 'YourHeaderValue');
				}

				const modifiedInit: RequestInit = {
					...init,
					headers
				};

				return originalFetch(input, modifiedInit);
			};
		````

	* For older versions

		Before the [2025 Q2 release](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q2-19-1-25-521), the report viewer implementation relied on jQuery-based requests. To add custom HTTP headers in this scenario, you can use the jQuery's [ajaxSetup()](https://api.jquery.com/jquery.ajaxsetup/) function: 

		````JavaScript
			const $: any = (window as any)["jQuery"];
			$.ajaxSetup({
				beforeSend: function (xhr: XMLHttpRequest) {
					xhr.setRequestHeader('X-Custom-Header', "CustomValue");
				}
			});
		````

	>note In both cases, ensure that this JavaScript is executed before the report viewer is initialized, so that the overridden fetch logic takes effect during the initialization process.
