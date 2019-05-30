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
	    	<td>Project Type</td>
	    	<td>All web-based viewers</td>
	    </tr>
    </tbody>
</table>


## Error Message
```
telerik_reportViewer is not a function
```

## Cause\Possible Cause(s)
Page containing a HTML5 Viewer must load only once jQuery library of version greater than 1.9.1 (according to the [Kendo UI requirements](http://docs.kendoui.com/getting-started/javascript-dependencies#jquery-version)). For more information, please check [HTML5 Viewer Requirements](../html5-report-viewer-system-requirements) help article.

Such error can occur if:
	- jQuery is not loaded;
	- jQuery is loaded more than once and with different version;
	- jQuery is loaded in later time in the page life cycle.

## Solution
Check when the **head** section is loaded and if the link to jQuery v1.9.1 or greater is loaded before the viewer's script. 

The recommended approach is to add the viewer using the VS item template which will do the above steps automatically. Please check [How To: Use HTML5 ASP.NET MVC Report Viewer in an application](../mvc-report-viewer-extension-embedding) documentation article for more information.


## Notes
As a side note, consider checking our demos under Telerik Reporting installation folder, i.e. *C:\Program Files (x86)\Progress\Telerik Reporting **VERISON**\Examples\CSharp|VB*. For example *Html5Demo* and *MvcDemo*.
