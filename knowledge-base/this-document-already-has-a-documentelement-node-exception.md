---
title: This document already has a 'DocumentElement' node exception.
description: This document already has a 'DocumentElement' error thrown in Visual Studio.
type: how-to
page_title: This document already has a 'DocumentElement' error.
slug: this-document-already-has-a-documentelement-node-exception
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
			<td>ASP.NET WebForms Report Viewer</td>
		</tr>
	</tbody>
</table>


> This article relates to the [Legacy ASPNET Report Viewer](../asp-net-report-viewer).

## Description

Visual Studio throws the exception when adding a ReportViewer control to an **.aspx** page.

## Error Message

``` 
The ReportViewer control failed to setup the http handler in the web.config file. 
You may experience troubles when viewing the report.   

Exception details:  This document already has a 'DocumentElement' node.
```

## Cause

This happens when a default namespace is added to the root **&lt;configuration&gt;** element of the **web.config** file. 

For example: 

 ```xml
<configuration xmlns="http://schemas.microsoft.com/.NetConfiguration/v2.0">
 ```
 
## Solution

This doesn’t cause any runtime problems, but in case you try to alter the **web.config** like we do, it would throw the exception.

To avoid the error, delete the **xmlns** reference and have the root configuration element look like the following: 

```xml
<configuration> 
```

Also, restart Visual Studio. Once you start it back up, we would successfully alter the web.config adding our http handlers for the ReportViewer with no errors.  

## Notes

Another "side-effect" of having default namespace is missing **intellisense** for the web.config file.

## See Also

[VS 2005 Intellisense in web.config files](https://weblogs.asp.net/scottgu/432077)  
  
