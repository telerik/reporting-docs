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

| Product | Project Type | Report Viewer |
|---|---|---|
| Progress® Telerik® Reporting | Windows Forms | WinForms Viewer |

## Description

When the host application is DPI-unaware, Windows can bitmap-scale the [Windows Forms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview) on a high-DPI display. This can make the viewer or report content blurry or incorrectly sized. A system-aware application can also appear blurry when it moves to a display with a different DPI than the display where it started.

The report engine also uses the process DPI setting to size report items and images. An incorrect DPI setting can affect report rendering, preview, or printing. For details, see [Configuring the report engine DPI awareness](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element).

## Cause

The effect of display scaling depends on the target framework and the application's DPI-awareness setting. Windows bitmap-scales DPI-unaware applications. Modern .NET Windows Forms templates default to `SystemAware`, not DPI-unaware. A system-aware application does not adjust its UI when it moves between displays with different DPI settings, so Windows can bitmap-scale the UI.

## Solution

Use the configuration that matches the target framework of the Windows Forms application that hosts the viewer:

* .NET Framework before 4.7: Declare per-monitor DPI awareness in the application manifest. Add the following element to the existing `app.manifest` file:

  ```XML
  <application xmlns="urn:schemas-microsoft-com:asm.v3">
    <windowsSettings>
      <dpiAware xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">true/PM</dpiAware>
    </windowsSettings>
  </application>
  ```

  For applications that target .NET Framework 4.6, 4.6.1, or 4.6.2, also enable WinForms automatic DPI resizing in `app.config`:

  ```XML
  <configuration>
    <runtime>
      <AppContextSwitchOverrides value="Switch.System.Windows.Forms.EnableWindowsFormsHighDpiAutoResizing=true" />
    </runtime>
  </configuration>
  ```

  The manifest declares the process as per-monitor DPI-aware. .NET Framework versions before 4.7 do not include the later high-DPI improvements. Test the viewer on the target runtime and handle any scaling issues in the application.

* .NET Framework 4.7 and later: Add the Windows 10 compatibility declaration to the application manifest and set `DpiAwareness` to `PerMonitorV2` in `app.config`. The compatibility declaration identifies the supported Windows version; the `app.config` setting enables WinForms high-DPI support. Ensure that `Application.EnableVisualStyles()` is the first method call in `Main`, before creating controls. Add the following elements:

  ```XML
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
    <application>
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}" />
    </application>
  </compatibility>
  ```

  ```XML
  <configuration>
    <System.Windows.Forms.ApplicationConfigurationSection>
      <add key="DpiAwareness" value="PerMonitorV2" />
    </System.Windows.Forms.ApplicationConfigurationSection>
  </configuration>
  ```

  The high-DPI enhancements for .NET Framework 4.7 and later require Windows 10 Creators Update or later. Do not set DPI awareness in the manifest for these versions; the manifest setting can override the `app.config` setting.

* Modern .NET (C#): For Windows Forms applications that call `ApplicationConfiguration.Initialize()` from `Main`, set `ApplicationHighDpiMode` in the project file. The default is `SystemAware`; set it to `PerMonitorV2` to enable per-monitor DPI handling:

  ```XML
  <PropertyGroup>
    <ApplicationHighDpiMode>PerMonitorV2</ApplicationHighDpiMode>
  </PropertyGroup>
  ```

  For manual startup code that does not call `ApplicationConfiguration.Initialize()`, call `Application.SetHighDpiMode` at the start of `Main`, before creating controls:

  ```C#
  Application.SetHighDpiMode(HighDpiMode.PerMonitorV2);
  ```

  Configure DPI awareness through the project property or API, not through the application manifest. Starting with .NET 9, a DPI setting in the manifest produces warning `WFO0003`.

  In Visual Basic, the project property configures the Visual Studio Designer but does not set the runtime DPI mode. Configure the runtime mode through the Visual Basic Application Framework settings or its startup event.

The DPI configuration depends on the target framework of the Windows Forms application that hosts the viewer, not the target framework used to build the Telerik Reporting assemblies.

## Notes

For reference, check the demos in the Telerik Reporting installation folder. For example, see `C:\Program Files (x86)\Progress\Telerik Reporting <VERSION>\Examples\CSharp|VB\WinFormsDemo`. Check the target framework before reusing a demo's DPI configuration.

For more information, see [High DPI support in Windows Forms](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/high-dpi-support-in-windows-forms), [Compiler Warning WFO0003](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/compiler-messages/wfo0003), and [printing reports from a WinForms viewer without declaring the entire application DPI-aware](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/print-report-correctly-from-winforms-viewer-without-declaring-entire-application-as-dpi-aware).

## See Also

* [Declaring a Windows Forms application as DPI-aware](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview#declaring-the-application-as-dpi-aware)
* [High DPI desktop application development on Windows](https://learn.microsoft.com/en-us/windows/win32/hidpi/high-dpi-desktop-application-development-on-windows)
