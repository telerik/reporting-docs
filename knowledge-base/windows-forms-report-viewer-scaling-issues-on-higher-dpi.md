---
title: Windows Forms Report Viewer Scaling Issues on Higher DPI
description: "Learn what may be causing scaling issues in the Windows Forms Report Viewer on higher DPI and how to fix them."
type: troubleshooting
page_title: Reports do not render correctly on higher resolution
slug: windows-forms-report-viewer-scaling-issues-on-higher-dpi
tags: WinFormsViewer, DPI
ticketid: 1338171
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Windows Forms</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>Win Viewer</td>
	</tr>
</table>

## Description

When using [Windows Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) on a machine with DPI scale factor higher than 96 (100%), Windows will resize the bitmap images in the application according to the current DPI value. This makes the report viewer and the report content blurry or is sized incorrectly in many common usage scenarios. Also, when printing the report, the application will scale the report contents incorrectly, because it cannot detect the current machine's DPI settings and the DPI value will always be reported as 96 dots per inch.

## Cause\Possible Cause(s)

By default, WinForms applications are declared as DPI Unaware. Declaring the application in which the Windows Forms Report Viewer is used as `DPI-aware` application would resolve the issues.

## Solution

The recommended approach is setting the `dpiAware` element in your application to avoid further scaling, visual or interaction issues.  To do so, you have to add a manifest file at the root of the application with the following content:

````XML
<?xml version="1.0" encoding="utf-8"?>
<asmv1:assembly manifestVersion="1.0" xmlns="urn:schemas-microsoft-com:asm.v1" xmlns:asmv1="urn:schemas-microsoft-com:asm.v1" xmlns:asmv2="urn:schemas-microsoft-com:asm.v2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<assemblyIdentity version="1.0.0.0" name="MyApplication.app"/>
	<asmv3:application  xmlns:asmv3="urn:schemas-microsoft-com:asm.v3" >
	<asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
		<dpiAware>True/PM</dpiAware>
	</asmv3:windowsSettings>
	</asmv3:application>
</asmv1:assembly>
````

## Notes

For reference, check our demos located in the Telerik Reporting installation folder, for example: *C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Examples\CSharp|VB\WinFormsDemo*. The `dpiAware.manifest` file is placed at the root of the application.

## See Also

* [Windows Forms Application - Declaring the application as DPI-aware]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware)
* [Writing DPI-Aware Desktop and Win32 Applications](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows)
