---
title: Windows Forms Report Viewer Scaling Issues on Higher DPI
description: "Learn why the Windows Forms Report Viewer renders blurry or incorrectly sized reports on high DPI displays and how to declare the app as DPI-aware."
type: troubleshooting
page_title: Reports do not render correctly on higher resolution
slug: windows-forms-report-viewer-scaling-issues-on-higher-dpi
tags: WinFormsViewer, DPI
ticketid: 1338171
res_type: kb
---

## Environment

| Property | Value |
|---|---|
| Product | Progress® Telerik® Reporting |
| Project Type | Windows Forms |
| Report Viewer | WinForms Viewer |

## Description

When you use the [Windows Forms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview) on a machine with a DPI scale factor higher than 96 (100%), Windows resizes the bitmap images in the application according to the current DPI value.

This can make the report viewer and report content blurry or incorrectly sized. When you print the report, the application can also scale the report contents incorrectly because it cannot detect the machine's DPI settings and always reports a value of 96 dots per inch.

## Cause

By default, WinForms applications are declared as DPI-unaware. Declare the application that hosts the Windows Forms Report Viewer as `DPI-aware` to resolve these issues.

## Solution

Use the configuration that matches your target framework:

* .NET Framework:

  Set the `dpiAware` element and add a manifest file at the root of the application:

  ```XML
  <?xml version="1.0" encoding="utf-8"?>
  <asmv1:assembly manifestVersion="1.0" xmlns="urn:schemas-microsoft-com:asm.v1" xmlns:asmv1="urn:schemas-microsoft-com:asm.v1" xmlns:asmv2="urn:schemas-microsoft-com:asm.v2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  	<assemblyIdentity version="1.0.0.0" name="MyApplication.app"/>
  	<asmv3:application  xmlns:asmv3="urn:schemas-microsoft-com:asm.v3" >
  	<asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
  		<dpiAware>True/PM</dpiAware>
  	</asmv3:windowsSettings>
  	</asmv3:application>
  </asmv1:assembly>
  ```

* Modern .NET:

  Set the `ApplicationHighDpiMode` project property to `PerMonitorV2`:

  ```XML
  <PropertyGroup>
    <ApplicationHighDpiMode>PerMonitorV2</ApplicationHighDpiMode>
  </PropertyGroup>
  ```

  Alternatively, call `Application.SetHighDpiMode` before creating any controls:

  ```C#
  Application.SetHighDpiMode(HighDpiMode.PerMonitorV2);
  ```

  Modern .NET Windows Forms projects normally generate the required application
  manifest. For more information, see [High DPI support in Windows Forms](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/high-dpi-support-in-windows-forms).

## Notes

For reference, check the demos in the Telerik Reporting installation folder. For example, see `C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Examples\CSharp|VB\WinFormsDemo`. The `dpiAware.manifest` file is placed at the root of the application.

## See Also

* [Declaring a Windows Forms application as DPI-aware](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview#declaring-the-application-as-dpi-aware)
* [High DPI desktop application development on Windows](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows)
