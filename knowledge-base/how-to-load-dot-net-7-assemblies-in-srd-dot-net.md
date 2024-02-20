---
title: Loading .NET 7 and .NET 8 assemblies in the Standalone Report Designer for .NET
description: "Learn how to load custom .NET 7 and .NET 8 assemblies in the Standalone Report Designer targeting the .NET 6"
type: how-to
page_title: Loading .NET 7 and .NET 8 assemblies in the Standalone Report Designer for .NET
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
			<td>Version</td>
			<td>up to R3 2023 SP1</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>.NET Standalone Designer</td>
		</tr>
	</tbody>
</table>


## Description

This article describes How to load .NET 7/8 assemblies in the Standalone Report Designer for .NET *(SRD.NET for short)*.

It is important to state that SRD.NET is targeting .NET 6 instead of .NET 7 or .NET 8 due to the following reasons:

* .NET 6 is the version of the target framework that has Long Term Support (LTS), while .NET 7 is defined only as STS (Standard-Term Support).
* Users that do not have the .NET 7/8 runtime installed yet, might not be able to run the SRD.NET.
* .NET 7 introduce certain breaking changes, especially in the serialization domain.

Despite that, the application is configured in a way that makes it possible to load .NET 7 and .NET 8 assemblies. SRD.NET is built with a dedicated property that allows it to be run against future version of .NET runtime: `<RollForward>Major</RollForward>`

This property ensures that when .NET 6 runtime is not installed, but .NET 7 or .NET 8 is available, the SRD.NET will run against .NET 7/8.

However, if you have both .NET 6 and .NET 7/8 installed on your machine, and you try to load a .NET 7/8 assembly in the SRD.NET, you will encounter the following exception (for .NET 7):

````
System.IO.FileLoadException: Could not load file or assembly 'System.Runtime, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.
Could not find or load a specific file. (0x80131621)
````

This happens because the `RollForward` property is set to **Major**, and the framework version is rolled forward only when the requested version is not present. Thus, if you have .NET 6 installed, the application will be executed using .NET 6 runtime and it will not be able to load the custom .NET 7/8 assembly, throwing an exception as a result. 

For further information about controlling the `RollForward` behavior at runtime, check the related Microsoft documentation article section [Control roll-forward behavior](https://learn.microsoft.com/en-us/dotnet/core/versions/selection#control-roll-forward-behavior).

## Solution

Start SRD.NET while setting the `RollForward` option to **LatestMajor** from the command prompt:

`C:\Program Files (x86)\Progress\Telerik Reporting {Version}\Report Designer\.NET>Telerik.ReportDesigner.Net.exe --roll-forward LatestMajor"`

As explained in the ["Values" section of the aforementioned Microsoft documentation article](https://learn.microsoft.com/en-us/dotnet/core/versions/selection#values), the **LatestMajor** option will enforce the use of the latest .NET runtime, even if the targeted .NET 6 runtime is available.
If you intend to use SRD.NET with .NET 7/8 runtime, create a shortcut with the parameter `--roll-forward LatestMajor` and use it to start the application.

## See Also

* [.NET 7 Breaking Changes](https://learn.microsoft.com/en-us/dotnet/core/compatibility/7.0)
* [Understanding .NET versioning](https://learn.microsoft.com/en-us/dotnet/core/versions/#semantic-versioning)
* [Using external assemblies with custom CLR objects in the Report Designer]({%slug how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer%})
