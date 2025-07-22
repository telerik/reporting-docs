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
		<td>WinForms Viewer</td>
	</tr>
</table>

## Description

When using [Windows Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) on a machine with a DPI scale factor higher than 96 (100%), Windows will resize the bitmap images in the application according to the current DPI value. This makes the report viewer and the report content blurry or incorrectly sized in many common usage scenarios. Also, when printing the report, the application will scale the report contents incorrectly, because it cannot detect the current machine's DPI settings, and the DPI value will always be reported as 96 dots per inch.

## Cause\Possible Cause(s)

By default, WinForms applications are declared as DPI-unaware. Declaring the application in which the Windows Forms Report Viewer is used as a `DPI-aware` application would resolve the issues.

## Solution

The recommended approach is to set the `dpiAware` element in your application to avoid further scaling, visual, or interaction issues.  To do so, you have to add a manifest file at the root of the application with the following content:

* .NET Framework:

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

* .NET:

	Ensure Windows 10 compatibility in the manifest file added from Visual Studio, as elaborated in the Microsoft article [High DPI support in Windows Forms](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/high-dpi-support-in-windows-forms):

	````XML
<?xml version="1.0" encoding="utf-8"?>
	<assembly manifestVersion="1.0" xmlns="urn:schemas-microsoft-com:asm.v1">
	  <assemblyIdentity version="1.0.0.0" name="MyApplication.app"/>
	  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v2">
		<security>
		  <requestedPrivileges xmlns="urn:schemas-microsoft-com:asm.v3">
			<!-- UAC Manifest Options may be added if needed -->
			<requestedExecutionLevel level="asInvoker" uiAccess="false" />
		  </requestedPrivileges>
		</security>
	  </trustInfo>

	  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
		<application>
		  <!-- Other Windows distributions may be added -->

		  <!-- Windows 10 -->
		  <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />

		</application>
	  </compatibility>

	  <!-- Indicates that the application is DPI-aware and will not be automatically scaled by Windows at higher
		   DPIs. Windows Presentation Foundation (WPF) applications are automatically DPI-aware and do not need 
		   to opt in. Windows Forms applications targeting .NET Framework 4.6 that opt into this setting, should 
		   also set the 'EnableWindowsFormsHighDpiAutoResizing' setting to 'true' in their app.config. -->

	  <application xmlns="urn:schemas-microsoft-com:asm.v3">
		<windowsSettings>
		  <dpiAware xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">true/PM</dpiAware>
		</windowsSettings>
	  </application>

	  <!-- OTHER CONTENT FOLLOWS -->

	</assembly>
````


## Notes

For reference, check our demos located in the Telerik Reporting installation folder, for example: *C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Examples\CSharp|VB\WinFormsDemo*. The `dpiAware.manifest` file is placed at the root of the application.

## See Also

* [Windows Forms Application - Declaring the application as DPI-aware]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}#declaring-the-application-as-dpi-aware)
* [Writing DPI-Aware Desktop and Win32 Applications](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows)
