---
title: Removing License Watermark When Exporting a Report in the Visual Studio Report Designer
description: Learn how to resolve the issue where exported documents from the Visual Studio Report Designer contain a license watermark.
type: how-to
page_title: Fix License Watermark in Visual Studio Report Export
meta_title: Fix License Watermark in Visual Studio Report Export
slug: fix-license-watermark-visual-studio-reporting-pdf-export
tags: reporting, visual studio, extension, license, watermark, export
res_type: kb
ticketid: 1696052
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521+ </td>
</tr>
</tbody>
</table>

## Description

When exporting a report from the Visual Studio Report Designer in any available format, a license watermark appears throughout the document.  
The license key is already downloaded and correctly placed under `%AppData%\Telerik\telerik-license.txt`. However, the watermark still shows up.

This article explains how to resolve the issue and ensure that exports from the Visual Studio Report Designer no longer contain watermarks.

## Solution

The Visual Studio Report Designer requires access to the `Telerik.Licensing.Runtime.dll` assembly to validate the license during design‑time exports. If this assembly is not available in the Visual Studio installation directory, the designer cannot verify the license and adds a watermark during export.

To resolve the issue:

1. Locate the `Telerik.Licensing.Runtime.dll` file in your Telerik Reporting installation. For example:
```
C:\Program Files (x86)\Progress\Telerik Reporting {RELEASE_VERSION}\Bin\netstandard2.0\Telerik.Licensing.Runtime.dll
```
1. Copy the `Telerik.Licensing.Runtime.dll` assembly and paste it into the Visual Studio installation directory that contains the `devenv.exe.config` file:
    - Visual Studio 2022: `C:\Program Files\Microsoft Visual Studio\2022\<Edition>\Common7\IDE\devenv.exe.config`
    - Visual Studio 2026: `C:\Program Files\Microsoft Visual Studio\2026\<Edition>\Common7\IDE\devenv.exe.config`
1. Restart Visual Studio so that the designer can load the licensing assembly and validate the installed license.

After completing these steps, exporting reports from the Visual Studio Report Designer should no longer display a license watermark.

## See Also

- [Visual Studio Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})
- [Troubleshoot License Problems]({%slug license-troubleshoot%})
