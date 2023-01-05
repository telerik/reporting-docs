---
title: Error 404 Resource not found
description: After creating an HTML5-based report viewer with separate Reporting REST Service or Report Server with the Visual Studio item template wizard, a 404 error is thrown in the browser console.
type: troubleshooting
page_title: Error 404 Resource not found after creating an HTML-based Report Viewer using the item template wizard
slug: error-resource-not-found-after-finishing-the-item-template-wizard
position: 
tags: HTML5Viewer, MVCReportViewer, RESTService, WebFormsViewer, AngularViewer
ticketid: 1428873
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.1.19.514</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>Web application</td>
		</tr>
	</tbody>
</table>


## Description
This article elaborates on an error for not found telerikReportViewer script after creating a new HTML5-based report viewer using [the built-in item template wizard]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}). 
When you create solution structure where the Report Viewer and the Reporting REST Service's hosts are separated, the generated telerikReportViewer script is referenced by relative path. The path is evaluated at run-time against the viewer application host. Instead, it should try to get the resource from the REST Service host. The same applies for scenario where the viewer connects to the Report Server to get the reports.

## Steps to Reproduce
The error might occur in two cases:
1. In case there is a REST service already configured on a different host. In 'Configure reporting engine' dialog, choosing Rest service option and "Use existing REST service" where you enter a valid REST service URI.
2. In case you are configuring the viewer to work with Report Server.  In 'Configure reporting engine' dialog, choosing Report Server option where you enter a valid Report Server URI.

## Error Message
```HTML
telerikReportViewer:1 Failed to load resource: the server responded with a status of 404 (Not Found)
jquery-3.3.1.min.js:2 jQuery.Deferred exception: jQuery(...).telerik_ReportViewer is not a function TypeError: jQuery(...).telerik_ReportViewer is not a function
    at HTMLDocument.<anonymous> (http://localhost:44395/Home/ReportViewerView1:37:46)
    at l (http://code.jquery.com/jquery-3.3.1.min.js:2:29375)
    at c (http://code.jquery.com/jquery-3.3.1.min.js:2:29677) undefined
w.Deferred.exceptionHook @ jquery-3.3.1.min.js:2
jquery-3.3.1.min.js:2 Uncaught TypeError: jQuery(...).telerik_ReportViewer is not a function
    at HTMLDocument.<anonymous> (ReportViewerView1:37)
    at l (jquery-3.3.1.min.js:2)
    at c (jquery-3.3.1.min.js:2)
```

## Cause\Possible Cause(s)
This issue is caused by the fact that since [Telerik Reporting R2 2019 (13.1.19.514)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2019-13-1-19-514) release, the viewer dependencies are served by the service.

## Solution
As this is caused by a relative path to the resource, you can just reference the absolute path to the report viewer script, e.g. replace the generated script path with the following:

```HTML
<script src="http(s)://yourservicehost:port/api/reports/resources/js/telerikReportViewer"></script>
```

## See Also
- [How To: Use HTML5 Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%})
- [How To: Use HTML5 Report Viewer With Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})
