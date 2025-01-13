---
title: Using .NET 9 assemblies in the Standalone Report Designer for .NET
description: "Learn how to load custom .NET 9 assemblies in the Standalone Report Designer for .NET"
type: how-to
page_title: Loading .NET 9 assemblies in the Standalone Report Designer for .NET
slug: how-to-load-dot-net-7-assemblies-in-srd-dot-net
tags: 
ticketid: 1383925
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
			<td>Report Designer</td>
			<td>.NET Standalone Designer</td>
		</tr>
	</tbody>
</table>


## Description

This article describes How to load `.NET 9` assemblies in the Standalone Report Designer for .NET *(**SRD.NET** for short)*.

It is important to state that SRD.NET is targeting **.NET 8** instead of .NET 9 because .NET 8 is a **Major** release while .NET 9 is not. Major releases happen once a year, even-numbered versions are the long-term supported (LTS) releases.

Despite that, the application is configured in a way that makes it possible to load .NET 9 assemblies. SRD.NET is built with a dedicated property that allows it to be run against future versions of the .NET runtime: `<RollForward>Major</RollForward>`.

This property ensures that when .NET 8 runtime is not installed, but .NET 9 is available, the SRD.NET will run against .NET 9.

However, if you have both .NET 8 and .NET 9 installed on the machine, and you try to load a .NET 9 assembly in the SRD.NET, you will encounter the following exception (for .NET 9):

````
System.IO.FileLoadException: Could not load file or assembly 'System.Runtime, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.
Could not find or load a specific file. (0x80131621)
````

This happens because the `RollForward` property is set to **Major**, and the framework version is rolled forward only when the requested version is not present. Thus, if you have .NET 8 installed, the application will be executed using .NET 8 runtime and it will not be able to load the custom .NET 9 assembly, throwing an exception as a result. 

## Solution

Start SRD.NET while setting the `RollForward` option to **LatestMajor** from the command prompt:

`C:\Program Files (x86)\Progress\Telerik Reporting {Release}\Report Designer\.NET>Telerik.ReportDesigner.Net.exe --roll-forward LatestMajor"`

As explained in the ["Values" section of the aforementioned Microsoft documentation article](https://learn.microsoft.com/en-us/dotnet/core/versions/selection#values), the **LatestMajor** option will enforce the use of the latest .NET runtime, even if the targeted .NET 8 runtime is available.

>note If you intend to use SRD.NET with the .NET 9 runtime, create a shortcut with the parameter `--roll-forward LatestMajor` and use it to start the application.

## See Also

* [Control roll-forward behavior](https://learn.microsoft.com/en-us/dotnet/core/versions/selection#control-roll-forward-behavior).
* [Understanding .NET versioning](https://learn.microsoft.com/en-us/dotnet/core/versions/#semantic-versioning)
* [Using external assemblies with custom CLR objects in the Report Designer]({%slug how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer%})
