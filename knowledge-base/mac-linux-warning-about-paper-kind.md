---
title: Compiler Warning About PaperKind in Linux and Mac
description: "Learn why the .NET Compilers for MacOS and Linux may warn you about the PaperKind enumeration."
type: troubleshooting
page_title: .NET Compiler warns about PaperKind enum on Linux and MacOS
slug: mac-linux-warning-about-paper-kind
tags: Linux,Mac,PaperKind,dotnet
ticketid: 1629132
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
			<td>OS</td>
			<td>Linux</td>
			<td>MacOS</td>
		</tr>
	</tbody>
</table>

## Description of the Problem

I am getting a warning in the compiler when assigning the following:

````CSharp
report.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.A4;
````

The `report` variable is of the type [Telerik.Reporting.Report](/api/telerik.reporting.report).

The warning appears when compiling on MacOS or Linux but not on Windows.

## Cause/Possible Causes

The Report `PageSettings` properties values are from the [System.Drawing.Printing namespace](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing?view=dotnet-plat-ext-7.0) that is supported only on Windows starting with .NET 6.

The [enumerations from the namespace](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing?view=dotnet-plat-ext-7.0#enums), including [enum PaperKind](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing.paperkind?view=dotnet-plat-ext-7.0) may be considered as cross-platform although they are part of the `System.Drawing` as they will not throw a [PlatformNotSupportedException](https://learn.microsoft.com/en-us/dotnet/api/system.platformnotsupportedexception?view=net-7.0) since they don't contain any code

The reason for the warning is that the entire assembly is attributed with `[assembly: SupportedOSPlatform("windows")]` - see [SupportedOSPlatformAttribute](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.versioning.supportedosplatformattribute?view=net-7.0).

## Suggested Workarounds

The warning cannot be avoided unless Microsoft decides to remove the attribute on the assembly level and add it only to the functionality that is actually not supported.

## See Also

* [System.Drawing.Common is not supported on non-Windows platforms - .NET 6 and .NET 7 under Linux and MacOS]({%slug system-drawing-common-is-not-supported-on-non-windows-platforms%})
* [System.Drawing.Printing namespace](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing?view=dotnet-plat-ext-7.0)
* [PaperKind](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.printing.paperkind?view=dotnet-plat-ext-7.0)
