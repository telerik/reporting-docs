---
title: JavaScript runtime error - Object doesn't support property or method 'telerik_ReportViewer'
description: A JavaScript error is thrown at runtime - Object doesn't support property or method 'telerik_ReportViewer'.
type: how-to
page_title: Runtime JS error is fired - Object doesn't support property or method 'telerik_ReportViewer'
slug: javascript-runtime-error-object-doesnt-support-property-or-method-telerik-reportviewer
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Report Viewers</td>
		<td>HTML5-based Report Viewer</td>
	</tr>
</table>

## Description
  
 The error message appears in the browser's console when running a web application with the HTML5 Report Viewer.  
 
## Error Message

```
0x800a01b6 - JavaScript runtime error: Object doesn't support property or method 'telerik\_ReportViewer'.  
```

## Possible Cause

The [HTML5 Report Viewer](../html5-report-viewer) is an HTML\CSS\JS client-side widget. The viewer requires a link to **jQuery v1.9.1. or above**, which may be in contradiction with other components loading jQuery on their own. 
  
## Solution
 
 Verify the page loads jQuery of version **1.9.1 or above only once**.  
  
## Notes

If you use [Telerik UI for ASP.NET AJAX RadScriptManager](../../devtools/aspnet-ajax/controls/scriptmanager/overview), it loads its *embedded* version of jQuery. You can use the external link to other jQuery file by setting the EnableEmbeddedjQuery property of RadScriptManager to false.  

### See Also

[Disabling the Embedded jQuery](../../devtools/aspnet-ajax/controls/scriptmanager/disabling-the-embedded-jquery).

