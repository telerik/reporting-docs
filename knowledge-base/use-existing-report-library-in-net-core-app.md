---
title: Guidance for using reports from an existing .NET Framework 4+ report library in a .NET Core application
description: Choose the best strategy for using the existing report definitions from a .NET Framework 4.0 class library in a .NET Core application.
type: troubleshooting
page_title: How to use the reports from an existing .NET Framework 4+ report library in a .NET Core application
slug: use-existing-report-library-in-net-core-app
position: 
tags: 
ticketid:
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description
The class library that contains report definitions must target .NET Framework 4.0 or greater in order to provide design-time support in Visual Studio through the Visual Studio Report Designer.
Such library cannot be referenced in a .NET Core project because .NET Core projects can reference only .NET Standard or .NET Core assemblies (see [this post](https://www.hanselman.com/blog/HowToReferenceANETCoreLibraryInWinFormsOrNETStandardExplained.aspx) for detailed explanation).
Therefore the existing type report definitions must be migrated to a .NET Standard or .NET Core class library. 
The drawback is that there is no design-time support for .NET Core or .NET Standard and the Visual Studio Report Designer cannot be used in such projects.
This is mainly because of the current limitations of the framework and Visual Studio toolset (for example, [ComponentDesigner](https://docs.microsoft.com/en-us/dotnet/api/system.componentmodel.design.componentdesigner?view=netframework-4.7.2) class which is used as a base class for our components, is not yet supported by .NET Core framework).

## Solution
There are two approaches to resolve the problem depending on the amount of custom code used in the report definitions.
* If the report classes *do not* contain custom code (i.e. handlers for events like [NeedDataSource](https://docs.telerik.com/reporting/api/Telerik.Reporting.DataItem.html#Telerik_Reporting_DataItem_NeedDataSource), 
[ItemDataBound](https://docs.telerik.com/reporting/api/Telerik.Reporting.ReportItemBase.html#collapsible-Telerik_Reporting_ReportItemBase_ItemDataBound), etc.) or this code can be substituted
with [conditional formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %})
and [bindings]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings %}) in the report definition, it is recommended to use the 
[Standalone Report Designer]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview %}) to import them into a set of .trdp/.trdx reports, as explained in the article on [importing reports created with the VS Report Designer]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer %}).
If the report uses class library assemblies that contain [user functions]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions %}) or provide data for [ObjectDataSource]({% slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview %}) instances, their projects need to be migrated to .NET Standard. This way the Standalone Report Designer will be able to load the assemblies and provide design-time support for them.
The produced .trdp/.trdx definitions can be used through a [UriReportSource](../t-telerik-reporting-urireportsource) in a .NET Core application.

* If the custom code in the report definitions must be retained, copy the code from .cs and .designer.cs files of your reports to a new .NET Standard or .NET Core library. 
Add references to NuGet packages for the missing classes (i.e. *System.Drawing.Common* for the **PaperKind** class) and remove all the references to VisualStudio-specific routines. 
Once the project compiles, the report classes it contains can be used through a [TypeReportSource](../t-telerik-reporting-typereportsource)
or [InstanceReportSource](../t-telerik-reporting-instancereportsource) in a .NET Core application.

It is recommended to use the first approach and migrate the reports to .trdp or .trdx report definitions, 
so the design-time support will be provided by the Standalone Report Designer. 

### See Also
* [Telerik Reporting .NET Core support](../use-reports-in-net-core-apps)
* [Port your code from .NET Framework to .NET Core](https://docs.microsoft.com/en-us/dotnet/core/porting/)
