---
title: Invalid value of report parameter error in HTML5 Report Viewer
description: HTML5 Report Viewer shows Invalid value of report parameter error
type: troubleshooting
page_title: Invalid Value of Report Parameter Error displayed in HTML5 Report Viewer
slug: invalid-value-of-report-parameter-error
position: 
tags: 
ticketid: 1459089
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

HTML5 Report Viewer fails to load a report and displays the error saying that the value of report parameter is invalid.

## Error Message

Internal Server Error

An error has occurred while processing the report. Processing canceled. Check the InnerException for more information. 

Invalid value of report parameter 'X'

## Cause\Possible Cause(s)

The values of report parameters are submitted from the client(viewer) to the server in JSON format where the formatting is done 
by the Newtonsoft.Json package. It is possible that using the outdated Newtonsoft.Json package might result in the incorrect transfer of the 
parameter values.

## Solution

Update Newtonsoft.Json package using NuGet package manager in Visual Studio. 

## See Also

[Requirements for using Telerik Reporting REST WebAPI service](../telerik-reporting-rest-service-web-api-system-requirements)
