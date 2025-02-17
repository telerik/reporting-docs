---
title: Resolving System.Windows.Forms Assembly Load Error in Telerik ReportViewer WPF on .NET 9
description: This article provides a solution for the error encountered when the Telerik ReportViewer WPF component fails to load System.Windows.Forms assembly on .NET 9 during the first use.
type: how-to
page_title: Fix for Missing System.Windows.Forms Assembly in Telerik ReportViewer WPF on .NET 9
slug: resolve-system-windows-forms-assembly-error-telerik-reportviewer-wpf-net9
tags: progress® telerik® reporting, reportviewer, wpf, .net 9, system.windows.forms, assembly error, msix
res_type: kb
ticketid: 1678405
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Operating System</td>
<td>Windows 10</td>
</tr>
<tr>
<td>.NET Version</td>
<td>.NET 9</td>
</tr>
<tr>
<td>Application Type</td>
<td>WPF</td>
</tr>
</tbody>
</table>

## Description
When deploying a WPF application with the Telerik ReportViewer component on Windows 10 and upgrading to .NET 9, an error stating that the `System.Windows.Forms` assembly could not be loaded is encountered on the first launch of a print window. This issue does not occur on subsequent openings of the print window. This knowledge base article also answers the following questions:
- How to fix the `System.Windows.Forms` assembly loading error in Telerik ReportViewer WPF on .NET 9?
- What is the solution for a missing `System.Windows.Forms` assembly error when using Telerik ReportViewer WPF in a .NET 9 application?
- How to ensure the Telerik ReportViewer WPF component loads correctly in .NET 9 on the first attempt?

## Solution
To address the issue of the `System.Windows.Forms` assembly not loading during the first use of the Telerik ReportViewer WPF component in a .NET 9 application, especially when deployed via MSIX, add the `UseWindowsForms` property set to `true` in the main WPF project file. This ensures that the `System.Windows.Forms` dependencies are correctly referenced, allowing the Telerik ReportViewer to initialize without errors on its first load.

Modify the project file (.csproj) of your WPF application to include the following property:

```xml
<PropertyGroup>
  <UseWindowsForms>true</UseWindowsForms>
</PropertyGroup>
```

This configuration explicitly informs the project that Windows Forms components are utilized, ensuring the necessary assemblies are available at runtime. This solution is particularly relevant for applications packaged with MSIX, where dependency management may differ from traditional deployment methods.

## See Also
- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/)
- [WPF Project SDK Documentation](https://docs.microsoft.com/en-us/dotnet/core/project-sdk/msbuild-props-desktop)
- [MSIX Packaging Documentation](https://docs.microsoft.com/en-us/windows/msix/)
