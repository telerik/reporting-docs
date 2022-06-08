---
title: JavaScript runtime error Sys.WebForms.PageRequestManagerServerErrorException - Value cannot be null.
description: JavaScript runtime error - Sys.WebForms.PageRequestManagerServerErrorException - Value cannot be null..
type: troubleshooting
page_title: JavaScript runtime error - Sys WebForms.PageRequestManagerServerErrorException Value cannot be null.
slug: javascript-runtime-error-sys.webforms-pagerequestmanagerservererrorexception
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
			<td>ASP.NET Web Forms Report Viewer</td>
		</tr>
	</tbody>
</table>

> Relates to the <a href="/asp-net-report-viewer" target="_blank">Legacy Report Viewer</a>

## Description  
  
 The error is thrown when testing a Web Application in browser, run from **Visual Studio 2013+**. 
 
## Error Message

```
0x800a139e - JavaScript runtime error: Sys.WebForms.PageRequestManagerServerErrorException: Value cannot be null.  
```
 
## Possible Cause 
 
 Such error can occur if the Web application is *Ajaxified*.
    
## Solution   
  
**BrowserLink** is introduced in Visual Studio 2013. It can intersect AJAX calls, resulting in a JavaScript runtime error. 

To test the application you can switch **off** BrowserLink from Visual Studio settings.  
  
## See Also

<a href="https://www.asp.net/visual-studio/overview/2013/using-browser-link" target="_blank">Using Browser Link in Visual Studio 2013</a> (source www.asp.net).
