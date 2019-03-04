---
title: Uncaught TypeError X.getClientRects is not a function
description: The X.getClientRects is not a function error occurs when trying to open the drop-down list with export options from the viewer's toolbar
type: troubleshooting
page_title: Uncaught TypeError X.getClientRects is not a function
slug: uncaught-typeerror-getClientRects-is-not-a-function
position: 
tags: HTML5ReportViewer
ticketid: 1174648
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
When attempting to open the export options from the report viewer's toolbar, the an error occurs in browser console preventing the export process.

## Error Message
 ```
Uncaught TypeError: X.getClientRects is not a function

 at M.fn.init.offset (jquery-3.3.1.js:10020)
    at init._position (telerikReportViewer.kendo-<VERSION>.min.js:3)
    at init.open (telerikReportViewer.kendo-<VERSION>.min.js:3)
    at telerikReportViewer.kendo-<VERSION>.min.js:3
```

## Cause\Possible Cause(s)
In general, the **getClientRects** method is used by jQuery. We do not use this method in the viewer code.

Telerik Report Viewer uses Kendo UI for jQuery widget for the export menu. The version of Kendo UI for jQuery served by default from the Telerik Reporting REST service is not compatible with jQuery 3 or above (the getClientRects error is observed). In R2 2018, UI for ASP.NET AJAX has upgraded their built-in [jQuery version](https://docs.telerik.com/devtools/aspnet-ajax/general-information/using-jquery/using-jquery#jquery-version-history-in-telerik-ui-controls) from 1.11.1 to 3.3.1. 


## Solution
There are two possible ways to fix the error:
1. Use the previous jQuery version used by the UI for ASP.NET AJAX components. This can be done by following the [Using External jQuery](https://docs.telerik.com/devtools/aspnet-ajax/general-information/using-jquery/using-jquery#including-external-jquery) help article.
2. Reference the latest Kendo UI for jQuery in your application. So, this version will be used instead of the older version provided by the Telerik Reporting REST service. According to the [Kendo UI documentation](https://docs.telerik.com/kendo-ui/intro/installation/prerequisites#supported-jquery-versions), the latest version supports jQuery 3.3.1 and this fixes the error message.

## Notes
Another possible reason to get this error message is if the jQuery script is loaded multiple times on the page. Please make sure that jQuery script is loaded only once, and that the application meets the [viewer requirements](../webforms-report-viewer-controls-system-requirements).
