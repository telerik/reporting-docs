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
		<td>R2 2017 and newer</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 Report Viewers</td>
	</tr>
</table>

## Description

As of  Telerik Reporting R2 2017, the [HTML5 Viewer](../html5-report-viewer) works only in browsers supporting promises. Trying to load a page with a HTML5 Report Viewer in it on a browser that does not support promises, will lead to the described error.

## Error Message

*"Error: 'Promise' is undefined"*.  

## Cause

The error appears in the browser when you load a page with the HTML5 Report Viewer on it.
  
The error indicates that the tested browser does not have support for promises.  

Please check [HTML5 Viewer: Important Settings](../html5-report-viewer-system-requirements#important-settings) and the requirements for *promises*.     
  
## Solution

If you do not have *polyfill Javascript for promises* on the page with the HTML5 Viewer, test to manually add a *script* tag with a link on the page with the viewer.   
  
In our documentation, we suggest adding the polyfill file of [Polyfill.io](https://polyfill.io/v2/docs/). The link with the content of the file can be previewed in a browser that does not have support for promises.

## Notes

If you open the [Polyfill.io](https://polyfill.io/v2/docs/) to retrieve the returned JS, the provided JS may not be correct since the endpoint has been opened by a browser that supports promises. Open the link with a browser that has no support for promises to ensure that the provided JS will work.
  
## See Also

[Promises - Browser compatibility](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#browser_compatibility)

