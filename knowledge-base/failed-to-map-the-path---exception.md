---
title: Failed to map the path '/' exception
description: Failed to map the path '/' exception.
type: how-to
page_title: Failed to map the path '/' exception
slug: failed-to-map-the-path---exception
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
			<td>ASP.NET WebForms</td>
		</tr>
	</tbody>
</table>

> This article relates to the [Legacy ASP<span>.</span>NET Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}).

## Description  

When trying to show a report in our web ReportViewer control, Visual Studio throws the exception from below.

## Error Message

```   
InvalidOperationException: Failed to map the path '/' 
``` 

## Cause

The exception is raised by the **WebConfigurationManager** class and if we try the following:  
   
```cs
Configuration cfg =  WebConfigurationManager.OpenWebConfiguration(System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath);   
```   

In the **Page\_Load** method, it would cause the same error, which excludes the possibility of this being an issue with the web viewer. 

The error is related to the built-in VS web server *Cassini* - the issue proved to be not running VS as **Administrator**. In *Vista* and *Win 7*, warning messages are displayed when Visual Studio is not being *run as administrator*.
   
## Solution  

There is a tick to "*silence*" this warning. This way, if Visual Studio is not set to run as administrator, by default, or is not started as administrator explicitly through the context menu "*Run as Administrator*", there are good chances you'll get the **Failed to map the path '/'.** exception.  
 
