---
title: Promise is undefined error on loading the Report Viewer in the browser.
description: Loading the report viewer on a browser that does not support promises leads to 'Promise is undefined error'.
type: troubleshooting
page_title: The HTML5 Report Viewer cannot be previewed in browsers with no promises support. 
slug: error-promise-is-undefined
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Version</td>
		<td>R2 2017 and later</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 Report Viewers</td>
	</tr>
</table>

## Description

As of  Telerik Reporting R2 2017, the [HTML5 Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview) works only in browsers supporting promises. Trying to load a page with a HTML5 Report Viewer in it on a browser that does not support promises, will lead to the described error.

## Error Message

*"Error: 'Promise' is undefined"*.  

## Cause

The error appears in the browser when you load a page with the HTML5 Report Viewer on it.
  
The error indicates that the tested browser does not have support for promises.  

Please check [HTML5 Viewer: Important Settings](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support#important-settings) and the requirements for *promises*.     
  
## Solution

If the page with the HTML5 Viewer does not include a Promise polyfill, add a maintained Promise polyfill to the page before the viewer scripts. Host the pinned polyfill with your application or use the distribution method recommended by its provider.

Do not use the retired Polyfill.io service. Test the viewer in every supported browser after adding the polyfill.
  
## See Also

[Promises - Browser compatibility](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#browser_compatibility)
