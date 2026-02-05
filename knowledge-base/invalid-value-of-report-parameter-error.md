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
		<tr>
			<td>Version</td>
			<td>Up to 19.3.26.121(including)</td>
		</tr>
		<tr>
			<td>Target Framework</td>
			<td>.NET Framework</td>
		</tr>
	</tbody>
</table>

## Description

> important Starting with the **Progress® Telerik® Reporting 2026 Q1** release, the .NET-based Reporting services now use [System.Text.Json](https://www.nuget.org/packages/System.Text.json).

HTML5 Report Viewer fails to load a report and displays the error saying that the value of report parameter is invalid.

## Error Message

```TEXT
Internal Server Error

An error has occurred while processing the report. Processing canceled. Check the InnerException for more information.

Invalid value of report parameter 'X'
```

## Cause\Possible Cause(s)

The values of report parameters are submitted from the client(viewer) to the server in JSON format where the formatting is done by the **Newtonsoft.Json** package.

It is possible that using the outdated **Newtonsoft.Json** package might result in the incorrect transfer of the
parameter values.

## Solution

Update the [Newtonsoft.Json](https://www.nuget.org/packages/newtonsoft.json/) package using the NuGet package manager in Visual Studio according to the version of Telerik Reporting that you are using - [Upgrading Projects](slug:telerikreporting/upgrade/overview).

## See Also

- [Requirements for using Telerik Reporting REST WebAPI service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/requirements%})
