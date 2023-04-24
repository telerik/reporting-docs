---
title: Operation Could Destabilize the Runtime Exception Occurs when Running on Windows Azure
description: "Learn why does the error 'Operation could destabilize the runtime' occur when running Telerik Reporting on Windows Azure."
type: troubleshooting
page_title: Operation could destabilize the runtime exception fired when running on Windows Azure
slug: operation-could-destabilize-the-runtime-exception-occurs-when-running-on-windows-azure
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>All</td>
	</tr>
	<tr>
		<td>Environment</td>
		<td>Windows Azure</td>
	</tr>
</table>

## Error Message

````
Internal Server Error:
Operation could destabilize the runtime.
````

## Cause

This problem occurs when you have published the application with **IntelliTrace** enabled.

## Description

After publishing to Windows Azure, instead of returning the rendered document, Telerik Reporting WebAPI REST service throws the described error.

## Solution

In order Telerik Reporting WebAPI REST service to function correctly you have to re-deploy with the IntelliTrace feature turned **off**.

## See Also

* [Debugging a Published Cloud Service with IntelliTrace and Visual Studio](https://docs.microsoft.com/en-us/visualstudio/azure/vs-azure-tools-intellitrace-debug-published-cloud-services?view=vs-2019)
