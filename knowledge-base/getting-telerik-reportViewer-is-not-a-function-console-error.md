---
title: Getting telerik_reportViewer is not a function console error
description: Upon running the report viewer, an error occurs in the browser console.
type: troubleshooting
page_title: Getting telerik_reportViewer is not a function console error
slug: getting-telerik-reportViewer-is-not-a-function-console-error
position: 
tags: HTML5Viewer
ticketid: 1410720
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
	    	<td>Report Viewer Type</td>
	    	<td>All web-based viewers</td>
	    </tr>
    </tbody>
</table>


## Error Message
```
telerik_reportViewer is not a function
```

## Cause\Possible Cause(s)
Page containing an HTML5 Viewer must load only once jQuery library of version greater than 1.9.1 (according to the [Kendo UI requirements](http://docs.kendoui.com/getting-started/javascript-dependencies#jquery-version)). For more information, please check [HTML5 Viewer Requirements](../html5-report-viewer-system-requirements) help article.

Such error can occur if:
- jQuery is not loaded;
- jQuery is loaded more than once and with different version;
- jQuery is loaded at later stage in the page life cycle.

## Solution
Check if the link to jQuery is loaded before the viewer's script. 

The recommended approach is to add the viewer using the [VS item template](../html5-report-viewer-quick-start#telerik-html5-report-viewer-item-template). The VS item template will add all required viewer resources to the page in the correct order.

## Notes
Check the examples under Telerik Reporting installation folder, i.e. *C:\Program Files (x86)\Progress\Telerik Reporting VERISON\Examples\CSharp|VB*. The web-based viewers are implemented in the *Html5Demo*, *MvcDemo*, and *WebFormsDemo* projects.
