---
title: System.Drawing.Common is not supported on non-Windows platforms - .NET 6 and .NET 7 under Linux and MacOS
description: The report cannot be resolved under Linux and MacOS in .NET 6 and .NET 7 but works in Windows
type: troubleshooting
page_title: System.Drawing.Common is not supported on non-Windows platforms starting with .NET 6
slug: system-drawing-common-is-not-supported-on-non-windows-platforms
tags: Linux,MacOS,Docker,GDI,SkiaSharp,.NET
ticketid: 1572093
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
			<td>Framework</td>
			<td>.NET 6</td>
		</tr>
	</tbody>
</table>

>tip Starting with [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) we introduced a new graphics engine implementation, based on the [SkiaSharp](https://github.com/mono/SkiaSharp) library, which allows truly cross-platform deployment of Telerik Reporting applications, targeting .NET 6+. This release brings SkiaSharp-based rendering to web report viewers and PDF export format, and the rest are soon to follow. Check [GraphicsEngine]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}#graphicsengine) article section for details.

## Description

The .NET 6 and .NET 7 Reporting projects run correctly in Windows environment. The following error occurs when running it under a Linux and MacOS environment, for example, in a Linux Docker container.

## Error Message

````
System.AggregateException: One or more errors occurred. (Type: Telerik.Reporting.ReportSerialization.Current.ReportSerializable'1[Telerik.Reporting.Report])
	---> System.MissingMethodException: Type: Telerik.Reporting.ReportSerialization.Current.ReportSerializable'1[Telerik.Reporting.Report]
	---> System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation.
	---> System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation.
	---> System.TypeInitializationException: The type initializer for 'Telerik.Reporting.Drawing.Unit' threw an exception.
	---> System.TypeInitializationException: The type initializer for 'Gdip' threw an exception.
	---> System.PlatformNotSupportedException: System.Drawing.Common is not supported on non-Windows platforms. See https://aka.ms/systemdrawingnonwindows for more information.
		at System.Drawing.LibraryResolver.EnsureRegistered()
		at System.Drawing.SafeNativeMethods.Gdip.PlatformInitialize()
		at System.Drawing.SafeNativeMethods.Gdip..cctor()
		--- End of inner exception stack trace ---
		at System.Drawing.SafeNativeMethods.Gdip.GdipCreateBitmapFromScan0(Int32 width, Int32 height, Int32 stride, Int32 format, IntPtr scan0, IntPtr& bitmap)
		at System.Drawing.Bitmap..ctor(Int32 width, Int32 height, PixelFormat format)
		at System.Drawing.Bitmap..ctor(Int32 width, Int32 height)
		at Telerik.Reporting.Drawing.Unit.GetDotsPerInch()
		at Telerik.Reporting.Drawing.Unit.ResetDpiSettings()
		at Telerik.Reporting.Drawing.Unit..cctor()
````

## Cause\Possible Cause(s)

The reason for the problem is described in the Microsoft article [System.Drawing.Common only supported on Windows](https://learn.microsoft.com/en-us/dotnet/core/compatibility/core-libraries/6.0/system-drawing-common-windows-only).

## Suggested Workarounds

* .NET 6

	Add a file named `runtimeconfig.template.json` with the following content in the folder with the `.csproj` file:

	````JSON
{
		"configProperties": {
			"System.Drawing.EnableUnixSupport": true
		}
	}
````

	For more details, check the Microsoft article section [runtimeconfig.json](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/#runtimeconfigjson).

* .NET 7

	Upgrade to [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) and use the SkiaSharp graphics engine.

## See Also

* [GraphicsEngine]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}#graphicsengine)
* [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010)
* [System.Drawing.Common only supported on Windows](https://learn.microsoft.com/en-us/dotnet/core/compatibility/core-libraries/6.0/system-drawing-common-windows-only)
* [runtimeconfig.json](https://learn.microsoft.com/en-us/dotnet/core/runtime-config/#runtimeconfigjson)
* [Future of Linux support for reporting](https://feedback.telerik.com/reporting/1537361-future-of-linux-support-for-reporting)
