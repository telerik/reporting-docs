---
title: The Reporting REST Service throws a "Unable to get parameters. Missing report name" error
description: A report viewer, connected to a Reporting REST service, cannot load a report, claiming its name is not set in ReportViewer's  report source options.
type: troubleshooting
page_title: Report Viewer, connected to a REST service, shows "Unable to get parameters. Missing report name" message
slug: reporting-rest-service-throws-unable-to-get-parameters-missing-report-name-error
ticketid: 1475185
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
	    	<td>HTML5 Application, ASP.NET MVC, ASP.NET WebForms</td>
	    </tr>
      <tr>		
		<tr>
			<td>Target Framework</td>
			<td>.NET Framework</td>
		</tr>
	</tbody>
</table>

## Description

The report viewer displays an error message saying that the report name is missing, although the report name is set in _reportSource_ options in viewer definition.

The message is displayed during the first request that tries to resolve the report, which is sent when the report parameters are loaded, that's why the error message starts with "Unable to get parameters".

## Error Message

```TEXT
"Unable to get parameters. Missing report name"
```

## Solution

This error is due to incorrect deserialization of the _reportSource_ name. The cause is that the Newtonsoft.Json is targeting wrong .NET Framework.

In our case study, the `Newtonsoft.Json.dll` copied in the **\bin** folder was targeting `.NET Framework 2.0` but the required target framework is `.NET Framework 4.0+`. Please note that the same version of the `Newtonsoft.Json.dll` can target different .NET Frameworks.

Although, the _packages.config_ contains the correct target framework for the **Newtonsoft.Json** package, the NuGet package manager fails to overwrite it.

The solution is to delete the `Newtonsoft.Json.dll` manually and rebuild the solution, so the NuGet package manager will download the correct assembly.

