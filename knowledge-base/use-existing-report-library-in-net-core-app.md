---
title: Reusing .NET Framework 4+ ReportLibrary Reports in .NET
description: "Learn how to choose the best strategy for using the existing report definitions from a .NET Framework 4+ class library in a .NET/.NET Core application."
type: troubleshooting
page_title: Using CLR reports from existing .NET Framework ReportLibrary in .NET
slug: use-existing-report-library-in-net-core-app
tags: 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116+</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Visual Studio Report Designer for .NET Preview

> important Starting with the Telerik Reporting **2026 Q3 October release (20.2.26.1007)**, the **Visual Studio Report Designer for .NET (VSRD.NET)** is available as a **preview**. You can now migrate your existing C# or VB coded reports to a supported SDK-style .NET report library and continue editing and previewing them directly in Visual Studio, retaining their custom code.
> <br/>
> See [Getting Started with the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-getting-started) for prerequisites and setup. The preview requires Visual Studio 2026 version 18.10 or later and a report project targeting `net8.0-windows` or later with `UseWindowsForms=true`.

## Description

Existing .NET Framework report libraries must be migrated to a compatible .NET or .NET Standard class library, or converted to declarative report definitions, for use in a .NET application.

The .NET Framework Visual Studio Report Designer requires a .NET Framework report project. Before the VSRD.NET preview, retaining Visual Studio design-time support for migrated reports required a linked .NET Framework project. For supported SDK-style .NET projects, the preview removes that requirement. It does not add direct design-time support for .NET Standard projects or older .NET Core targets.

## Solution

There are two approaches to resolve the problem depending on the amount of custom code used in the report definitions.

* If the report classes do not contain custom code (i.e. handlers for events like [NeedDataSource](/api/Telerik.Reporting.DataItem#Telerik_Reporting_DataItem_NeedDataSource), [ItemDataBound](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBound), etc.) or this code can be substituted with [conditional formatting](slug:telerikreporting/designing-reports/styling-reports/conditional-formatting) and [bindings](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings) in the report definition, it is recommended to use the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) to import them into a set of `.TRDP`/`.TRDX` reports, as explained in the article on [importing reports created with the VS Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer).

	If the report uses class library assemblies that contain [user functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions) or provide data for [ObjectDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview) instances, you may use the [.NET version of the Standalone Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview#starting-the-standalone-report-designer-for-net). For the .NET Framework version of the designer, their projects need to be migrated to .NET Standard so that it may be able to load the assemblies and provide design-time support for them.

	The produced `.TRDP`/`.TRDX` definitions can be used through a [UriReportSource](/api/telerik.reporting.urireportsource) in a .NET Core application.

* If the custom code in the report definitions must be retained, copy all report files (`.cs`, `.designer.cs`, and `.resx`, or their VB equivalents) to a new SDK-style .NET report library. To edit the migrated reports directly in Visual Studio with the VSRD.NET preview, [configure the report project](slug:vs-report-designer-net-getting-started#configuring-your-report-project) with the required target framework, project settings, and matching `Telerik.Reporting` and `Telerik.Reporting.VSDesigner` package versions. Restore the packages and build the project, then right-click the report's main `.cs` or `.vb` file in **Solution Explorer** and select **View Designer**.

	Once the project compiles, the report classes it contains can be used through a [TypeReportSource](/api/telerik.reporting.typereportsource) or [InstanceReportSource](/api/telerik.reporting.instancereportsource) in a compatible .NET application. Ensure that the consuming application's target framework is compatible with the report library's Windows-specific target framework.

	For older Telerik Reporting releases or environments that do not meet the preview prerequisites, you can still link the C# report files to a .NET Standard or .NET Core library and edit them through a .NET Framework project, as described in [How to use Visual Studio Report Designer to edit CS Reports in .NET Projects](slug:how-to-use-vs-designer-in-dotnet-core).

Declarative `.TRDP` or `.TRDX` report definitions remain recommended when custom report code is not required. Converting to declarative reports is no longer necessary solely to retain design-time support after migrating to a supported SDK-style .NET project.

## See Also

* [Getting Started with the Visual Studio Report Designer for .NET](slug:vs-report-designer-net-getting-started)
* [Telerik Reporting .NET Core support](slug:telerikreporting/using-reports-in-applications/dot-net-core-support)
* [Port your code from .NET Framework to .NET Core](https://learn.microsoft.com/en-us/dotnet/core/porting/)
* [How to use Visual Studio Report Designer to edit CS Reports in .Net Core Projects](slug:how-to-use-vs-designer-in-dotnet-core)
