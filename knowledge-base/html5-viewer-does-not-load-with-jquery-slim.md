---
title: Kendo could not be loaded automatically error.
description: The HTML5 Report Viewers do not load when using the slim build of jQuery.
type: troubleshooting
page_title: Kendo could not be loaded automatically error is thrown in the browser console.
slug: html5-viewer-does-not-load-with-jquery-slim
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
			<td>Application Type</td>
			<td>Web Application</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 Report Viewers</td>
		</tr>
	</tbody>
</table>


## Description

The error is displayed in the browser console when the report viewer loads. 

'The Reporting REST Service cannot be accessed' message appears in the report viewer.

## Error Message

- On the page, in the report viewer:

```
Cannot access the Reporting REST service. (serviceUrl = '/api/reports'). 
Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)
```

- In the browser console:

```
Kendo could not be loaded automatically. Make sure 'options.serviceUrl' / 'options.reportServer.url' is correct and accessible.
The error is: undefined
```

## Cause

A **slim** build of jQuery is referenced on the page. The **slim** version saves weight by excluding the *ajax* and *effects* modules.  
  
## Solution  

Reference a [compressed](https://code.jquery.com/jquery-3.6.0.min.js)(min) or an [uncompressed](https://code.jquery.com/jquery-3.6.0.js) version of the full jQuery(minimum required version **1.9.1**).

## See Also

- [Beware When Using the Slim Version of jQuery](https://webdesign.tutsplus.com/tutorials/quick-tip-beware-when-using-the-slim-version-of-jquery--cms-30935)

- [Requirements and Browser Support for HTML5 Report Viewers](../html5-report-viewer-system-requirements)
